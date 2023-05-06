<?php
ini_set('max_execution_time', 1000);

use App\CrawlSite\URLScraper;
use App\Models\Faculty;
use App\Models\StudentGroup;


$scraper = new URLScraper('http://www.plan.collegiumwitelona.pl/');
$urls = $scraper->getAllURLs();

file_put_contents("specialisations.txt", '');
$id_faculty = 0;

foreach ($urls as $url) {

    if (str_contains($url, 'checkSpecjalnosc')) {
        $id_faculty = getIdFaculty($url, $urls);


        $query_string = parse_url($url, PHP_URL_QUERY);
        parse_str($query_string, $params);
        $specialisation = $params['specjalnosc'] ?? "ERROR: no specialisation";

        $stationary = ($specialisation[0] === 'n') ? false : true;
        $year = $specialisation[1];
        $specialisation_only = mb_convert_encoding(substr($specialisation, 2), 'UTF-8', 'ISO-8859-2');

        $schedule_page = file_get_contents($url);
        $schedule_domdoc = new DOMDocument();
        @$schedule_domdoc->loadHTML($schedule_page);

        $xpath = new DOMXPath($schedule_domdoc);
        $column_names = array();

// Find all 'td' elements with the 'nazwaSpecjalnosci' class
        $tds = $xpath->query("//table[@class='TabPlan']//tr//td[@class='nazwaSpecjalnosci']");

// Extract column names and store them in the $column_names array
        $current_column = '';
        foreach ($tds as $td) {

            $current_column = str_replace(mb_convert_encoding($specialisation, 'UTF-8', 'ISO-8859-2'), '', $td->nodeValue);
            if (in_array($current_column, $column_names)) continue;
            $column_names[] = $current_column;
        }


        if ($id_faculty != 0) {
            $url = 'http://www.plan.pwsz.legnica.edu.pl/schedule_view.php?site=show_kierunek.php&id=' . $id_faculty;
            $response = file_get_contents($url);

            $domdoc = new DOMDocument();
            @$domdoc->loadHTML($response);

            $xpath = new DOMXPath($domdoc);

            if (strpos($specialisation, 'PO%A3')) str_replace('PO%A3', 'POŁ', $specialisation);
            if (strpos($specialisation, 'E%ACO')) str_replace('E%ACO', 'EŹO', $specialisation);

            $anchor = $xpath->query('//a[contains(@href, "' . $specialisation . '")]')->item(0);

            $name = $anchor;

            foreach ($domdoc->getElementsByTagName('a') as $a) {
                $href = $a->getAttribute('href');
                if (strpos($href, 'specjalnosc=' . $specialisation) !== false) {
                    $name = $a->nodeValue;
                    break;
                }
            }


            if (!empty($name)) {
                $name = explode(' (', $name)[1];
                $name = substr($name, 0, -1);
            }
        } else {
            $name = 'example_specialisation';
        }

        $name = mb_convert_encoding($name, 'UTF-8', 'ISO-8859-2');


        foreach ($column_names as $group) {
            $faculty = Faculty::where('id_at_collegiumwitelona', $id_faculty)->first();

            if ($faculty) {
                $studentGroup = new StudentGroup([
                    'id_faculty' => $faculty->id_faculty,
                    'fos' => $name,
                    'year' => $year,
                    'stationary' => $stationary,
                    'specialisation' => $specialisation_only,
                    'spec_group' => $group
                ]);
            }
            $existingStudentGroup = StudentGroup::where('id_faculty', $faculty->id_faculty)
                ->where('fos', $name)
                ->where('year', $year)
                ->where('stationary', $stationary)
                ->where('specialisation', $specialisation_only)
                ->where('spec_group', $group)
                ->first();
            if (!$existingStudentGroup) {
                $studentGroup->save();
            }

        }


    }
}

function getIdFaculty($url, $urls)
{
    $url = substr($url, 37);
    $url = str_replace('%A3', 'Ł', $url);
    $url = str_replace('%AC', 'Ź', $url);
    $id = 0;
    foreach ($urls as $haystack) {
        if (strpos($haystack, 'show_kierunek.php')) {

            $DOM = new DOMDocument();

            @$DOM->loadHTMLFile($haystack);

            $xpath = new DOMXPath($DOM);
            $elements = $xpath->query("//a/@href");

            foreach ($elements as $element) {
                if (str_contains($element->nodeValue, $url)) {
                    $id = explode('=', $haystack)[2];
                    return $id;
                }
            }
        }
    }
    return $id;
}


?>

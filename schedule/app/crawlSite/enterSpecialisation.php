<?php
ini_set('max_execution_time', 1000);


$url_scraper = new URLScraper();
$urls = $url_scraper->getAllURLs();
file_put_contents("specialisations.txt", '');
$id_faculty = 0;

$sql = new mysqli(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'));


foreach ($urls as $url) {

    if (str_contains($url, 'id_faculty')) {
        $id_faculty = explode('=', $url)[1];
    }


    if (str_contains($url, 'checkSpecjalnosc')) {
        echo "url = $url";

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
//            file_put_contents("groups.txt", $current_column . "  " . $specialisation . "  " . $url . "\n", FILE_APPEND);
        }

        //get name of specialisation

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
            $name = 'example_specialisation'; // replace with the actual value
        }

        $name = mb_convert_encoding($name, 'UTF-8', 'ISO-8859-2');


        foreach ($column_names as $group) {
            $query_string = "INSERT IGNORE INTO field_of_study (id_faculty, fos, year, stationary, specialisation, spec_group) VALUES ((SELECT id_faculty FROM faculty WHERE id_at_collegiumwitelona = $id_faculty), '$name', '$year', '$stationary', '$specialisation_only', '$group')";

            $sql->query($query_string);

        }


    }
}

?>

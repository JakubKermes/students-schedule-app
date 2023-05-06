<?php
ini_set('max_execution_time', 1000);

use App\CrawlSite\URLScraper;
use App\Models\Faculty;
use App\Models\Lecturer;


$scraper = new URLScraper('http://www.plan.collegiumwitelona.pl/');
$urls = $scraper->getAllURLs();

foreach ($urls as $url) {
    echo $url . PHP_EOL;
    if (strpos($url, "checkNauczycielWszys") !== false) {

        // Send a GET request to the URL
        $response = file_get_contents($url);

        // Parse the HTML content of the page using DOMDocument and DOMXPath
        $dom = new DOMDocument();
        $dom->loadHTML($response);
        $xpath = new DOMXPath($dom);

        // Find the <h1> tag with the text "Nauczyciel :"
        $h1_tag = $xpath->query("//h1[contains(text(),'Nauczyciel :')]")->item(0);

        // Get the next <h2> tag and its text
        $h2_tag = $h1_tag->nextSibling;
        while ($h2_tag->nodeName != "h2") {
            $h2_tag = $h2_tag->nextSibling;
        }
        $teacher_name = trim($h2_tag->textContent);

        $parsed_url = parse_url($url);
        parse_str($parsed_url['query'], $params);

        $teacher_id = $params['pracownik'];
        $faculty_id = $params['wydzial'];

        $nameCleaner = new \App\CrawlSite\NameCleaner();
        $lecturer_name = $nameCleaner->clean($teacher_name);

        $existing_lecturer = Lecturer::where('id_at_collegiumwitelona', $teacher_id)->where('name', $lecturer_name['name'])->where('lastname', $lecturer_name['lastname'])->first();

        if (!$existing_lecturer) {
            Lecturer::factory()->create([
                'name' => $lecturer_name['name'],
                'lastname' => $lecturer_name['lastname'],
                'title' => $lecturer_name['title'],
                'id_at_collegiumwitelona' => $teacher_id,
                'id_faculty' => Faculty::where('id_at_collegiumwitelona', $faculty_id)->first()->id_faculty
            ]);
        }

    }

}
?>

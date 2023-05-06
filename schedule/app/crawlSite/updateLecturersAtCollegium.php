<?php
ini_set('max_execution_time', 1000);
use App\CrawlSite\URLScraper;


// Create a MySQL connection
$conn = new mysqli(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'));

// Check if the connection was successful
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$urls = array();
$scraper = new URLScraper();
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

//      $query = "UPDATE lecturers SET id_at_collegiumwitelona = " . $teacher_id . " WHERE name = '" . $name_split[count($name_split)-2] . "' AND lastname = '" . $name_split[count($name_split)-1] . "'";
      $query = "INSERT INTO lecturers (name, lastname, title, id_at_collegiumwitelona, faculty)
                VALUES ('{$lecturer_name['name']}', '{$lecturer_name['lastname']}', '{$lecturer_name['title']}', '{$teacher_id}',
                (SELECT id_faculty FROM faculties WHERE id_at_collegiumwitelona = '{$faculty_id}'));";
      //      $conn->query($query);
    echo $query . '<br>';
    }

}

// Close the MySQL connection
$conn->close();

?>

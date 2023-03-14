<?php

$servername = "localhost";
$username = "schedule_controll";
$password = "controll";
$dbname = "schedule";

// Create a MySQL connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check if the connection was successful
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Read the URLs from the file
$file = fopen("teachersURLs.txt", "r");
$urls = array();
while (!feof($file)) {
  $line = trim(fgets($file));
  if (!empty($line)) {
    $urls[] = $line;
  }
}
fclose($file);

foreach ($urls as $url) {
  if (strpos($url, "checkNauczycielWszys") !== false) {

    // Send a GET request to the URL
    $response = file_get_contents($url);

    // Parse the HTML content of the page using DOMDocument and DOMXPath
    $dom = new DOMDocument();
    @$dom->loadHTML($response);
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
    $name_split = explode(" ", $teacher_name);

    if (count($name_split) >= 2 && $name_split[count($name_split)-1] && $name_split[count($name_split)-2]) {

      $query = "UPDATE lecturers SET id_at_collegiumwitelona = " . $teacher_id . " WHERE name = '" . $name_split[count($name_split)-2] . "' AND lastname = '" . $name_split[count($name_split)-1] . "'";
     echo $query . "\n";
      // $conn->query($query);

      // Check if the update was successful
    //  if ($conn->affected_rows > 0) {
   //     echo $name_split[count($name_split)-1] . "\n";
   //   }
    }
  }
}

// Close the MySQL connection
$conn->close();

echo "Press any key to exit.";
fgets(STDIN);

?> 
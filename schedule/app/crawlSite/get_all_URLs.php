<?php


use Symfony\Component\DomCrawler\Crawler;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



// Define the base URL and the list of relative URLs to scrape
$base_url = 'http://www.plan.pwsz.legnica.edu.pl/';
$urls = ['/',
    'schedule_view.php?site=show_kierunek.php&id=7',
    'schedule_view.php?site=show_kierunek.php&id=1',
    'schedule_view.php?site=show_kierunek.php&id=2',
    'schedule_view.php?site=show_kierunek.php&id=11',
    'schedule_view.php?site=show_kierunek.php&id=10',];

// Loop over the URLs and scrape data from each page
$file = fopen("/URLs.txt", "w");

foreach ($urls as $url) {
    $full_url = $base_url . $url;

    $query = parse_url($full_url, PHP_URL_QUERY);
    parse_str($query, $params);
    $id_faculty = $params['id'] ?? 0;
    fwrite($file, 'id_faculty='.$id_faculty . "\n");

    $grab = file_get_contents($full_url);
    $crawler = new Crawler($grab);

    // Traverse links from the Crawler
    foreach ($crawler->filter('a') as $link) {
        $data = $link->getAttribute('href');
        $full_link = $base_url . $data;
        file_put_contents('URLs.txt', $full_link);
        echo $full_link . "\n\n";
    }

}
fclose($file);

?>

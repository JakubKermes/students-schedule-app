<?php

namespace App\CrawlSite;

use Symfony\Component\DomCrawler\Crawler;

class URLScraper
{
    private $base_url;
    private $urls;

    public function __construct()
    {
        $this->base_url = 'http://www.plan.pwsz.legnica.edu.pl/';
        $this->urls = [
            '',
            'schedule_view.php?site=show_kierunek.php&id=7',
            'schedule_view.php?site=show_kierunek.php&id=1',
            'schedule_view.php?site=show_kierunek.php&id=2',
            'schedule_view.php?site=show_kierunek.php&id=11',
            'schedule_view.php?site=show_kierunek.php&id=10',
        ];
    }

    public function getAllURLs()
    {
        $data = [];

        foreach ($this->urls as $url) {
            $full_url = $this->base_url . $url;

            $query = parse_url($full_url, PHP_URL_QUERY);
            parse_str($query, $params);
            $id_faculty = $params['id'] ?? 0;
            $data[] = 'id_faculty=' . $id_faculty;

            $grab = file_get_contents($full_url);
            $crawler = new Crawler($grab);

            foreach ($crawler->filter('a') as $link) {
                $linkUrl = $link->getAttribute('href');
                if (strpos($linkUrl, 'PO?')) {
                    $linkUrl = str_ireplace('PO?', 'PO%A3', $linkUrl);
                }
                if (strpos($linkUrl, 'E?O')) {
                    $linkUrl = str_ireplace('E?O', 'E%ACO', $linkUrl);
                }
                $full_link = $this->base_url . $linkUrl;
                $data[] = $full_link;
            }
        }

        return $data;
    }
}

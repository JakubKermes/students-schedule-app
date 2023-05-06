<?php

namespace App\CrawlSite;

use DOMDocument;
use DOMXPath;

class URLScraper
{
    private $url;

    public function __construct($url)
    {
        $this->url = $url;
    }

    public function fetch_content($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        $content = curl_exec($ch);
        curl_close($ch);
        return $content;
    }

    public function extract_links($html)
    {
        $dom = new DOMDocument();
        @$dom->loadHTML($html);
        $xpath = new DOMXPath($dom);

        $links = array();
        $elements = $xpath->query("//a/@href");

        foreach ($elements as $element) {
            $links[] = $element->nodeValue;
        }

        return $links;
    }

    public function scrape()
    {
        $allURLs = array();
        $data = array();

        $html_content = $this->fetch_content($this->url);
        $links = $this->extract_links($html_content);

        for ($i = 0; $i < count($links); $i++) {
            $links[$i] = $this->url . $links[$i];
        }

        foreach ($links as $link) {
            $html_content = $this->fetch_content($link);
            $allURLs = $this->extract_links($html_content);
            foreach ($allURLs as $scrapedURL) {
                $data[] = $scrapedURL;
            }
        }

        return $data;
    }


    function getAllURLs()
    {
        $url = 'http://www.plan.collegiumwitelona.pl/';
        $scraper = new URLScraper($url);
        $data = $scraper->scrape();

        for ($i = 0; $i < count($data); $i++) {
            $data[$i] = $url . $data[$i];
            if (strpos($data[$i], '£')) {
                $data[$i] = str_replace('£', '%A3', $data[$i]);
            }
            if (strpos($data[$i], '¬')) {
                $data[$i] = str_replace('¬', '%AC', $data[$i]);
            }
        }
        return $data;
    }
}

?>

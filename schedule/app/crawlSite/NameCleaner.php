<?php

namespace App\CrawlSite;

class NameCleaner
{
    private $scrapped_name;

    public function __construct($name)
    {
        $this->scrapped_name = $name;
    }

    public function clearName()
    {
        $name_array = explode(' ', $this->scrapped_name);
        $titles_array = array();

        $titles = ['dr', 'hab', 'hab.', 'inż.', 'mgr', 'prof.', 'lic', 'lek.', 'lek', 'med', 'med.', 'n.', 'mgr.', 'dent.', 'dent'];

        foreach ($titles as $title) {
            if (in_array($title, $name_array)) {
                $key = array_search($title, $name_array);
                $titles_array[] = $name_array[$key];
                unset($name_array[$key]);
            }
        }

        $name_array = array_values($name_array);

        $first_name = $name_array[0];
        unset($name_array[0]);
        $last_name = implode(' ', $name_array);
        $actual_titles = implode(' ', $titles_array);

        return [
            'actual_titles' => $actual_titles,
            'first_name' => $first_name,
            'last_name' => $last_name,
        ];
    }
}


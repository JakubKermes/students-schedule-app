<?php

namespace App\CrawlSite;

class customEncoder
{
    public function customEncode($string)
    {
        $string = str_replace('¶','ś', $string);
        $string = str_replace('æ','ć', $string);
        $string = str_replace('¿','ż', $string);
        $string = str_replace('±','ą', $string);
        $string = str_replace('£','Ł', $string);
        $string = str_replace('³','ł', $string);
        $string = str_replace('ê','ę', $string);
        $string = str_replace('ñ','ń', $string);
        $string = str_replace('¬','Ź', $string);

        return $string;

    }

}

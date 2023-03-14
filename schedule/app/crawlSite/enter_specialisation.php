<?php

$urls = file('URLs.txt', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
$id_faculty = 0;
foreach ($urls as $url) {
    if(str_contains($url, 'id_faculty')){
        $id_faculty = explode('=', $url)[1];
    }


    if (strpos($url, 'checkSpecjalnosc') !== false) {
        $query_string = parse_url($url, PHP_URL_QUERY);
        parse_str($query_string, $params);

        $specialisation = $params['specjalnosc'] ?? '';

        if (strlen($specialisation) < 3) {
            continue;
        }

        $stationary = ($specialisation[0] === 'n') ? false : true;
        $year = $specialisation[1];
        $specialisation_only = substr($specialisation, 2);

        //get name of specialisation

        if($id_faculty != 0){
            $url = 'http://www.plan.pwsz.legnica.edu.pl/schedule_view.php?site=show_kierunek.php&id=' . $id_faculty;

            $response = file_get_contents($url);
            $soup = new DOMDocument();
            $soup->loadHTML($response);

            $name = '';

            foreach ($soup->getElementsByTagName('a') as $a) {
                $href = $a->getAttribute('href');
                if (strpos($href, 'specjalnosc=' . $specialisation_only) !== false) {
                    $name = $a->nodeValue;
                    break;
                }
            }

            if (!empty($name)) {
                $name = explode(' (', $name)[1];
                $name = substr($name, 0, -1);
            }
        }else{
            $name = 'example_specialisation'; // replace with the actual value
        }


        //end get name of specialisation

        echo $id_faculty . "\n";
        echo "Specialisation: $specialisation_only\n";
        echo "Year: $year\n";
        echo "Stationary: " . ($stationary ? 'Yes' : 'No') . "\n";
        echo "Name: $name\n";
        echo "\n";
    }
}

?>

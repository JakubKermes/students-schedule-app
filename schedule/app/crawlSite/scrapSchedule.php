<?php

ini_set('max_execution_time', 1000);

use App\CrawlSite\URLScraper;

$sql = new mysqli(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'));

$scraper = new URLScraper();
$urls = $scraper->getAllURLs();

foreach ($urls as $url) {
    echo $url . PHP_EOL;
    if (strpos($url, 'checkSpecjalnoscStac') === false) {
        continue;
    }

    $specialisation = explode('=', $url)[1];

    $response = file_get_contents($url);
//    $response = mb_convert_encoding($response, 'UTF-8', 'ISO-8859-2');
    $DOM = new DOMDocument();
    @$DOM->loadHTML($response);

    $tables = $DOM->getElementsByTagName('table');
    foreach ($tables as $table) {

        getLegends($table, $specialisation);

        if ($table->getAttribute('class') === 'TabPlan') {

            getFullSubjectNames($table, $specialisation);

            $nazwaSpecjalnosci = [];
            $godzina = [];
            $test = [];
            $test2 = [];

            $rows = $table->getElementsByTagName('tr');
            foreach ($rows as $row) {
                $cells = $row->getElementsByTagName('td');
                foreach ($cells as $cell) {
                    $class = $cell->getAttribute('class');
                    if ($class === 'nazwaDnia') {
                        $day[] = trim($cell->nodeValue);
                    } elseif ($class === 'nazwaSpecjalnosci') {
                        $nazwaSpecjalnosci[] = trim($cell->nodeValue);
                    } elseif ($class === 'godzina') {
                        $godzina[] = trim($cell->nodeValue);
                    } elseif ($class === 'test') {
                        $test[] = trim($cell->nodeValue);
                    } elseif ($class === 'test2') {
                        $test2[] = trim($cell->nodeValue);
                    }
                }
            }

            $nazwaSpecjalnosci = array_unique($nazwaSpecjalnosci);

            for ($j = 0; $j < count($godzina); $j++) {
                $k = intdiv($j, 7);
                for ($i = 0; $i < count($nazwaSpecjalnosci); $i++) {

                    $subject = explode($test[0], '(|)')[0];

                    $result = explode('(|)', $test[0], 2);
                    $type = (count($result) >= 2) ? $result[1] : '';

                    $date = explode(' ', $day[$k])[1];

                    $time_start = $date . ' ' . substr($godzina[$j], 0, 5);
                    $time_end = $date . ' ' . substr($godzina[$j], 6, 5);

                    $building = substr($test2[0], 0, 1);
                    $classroom = substr($test2[0], 1);

                    if ($building === '-' && $classroom === '-') {
                        continue;
                    }

                    $lecturer_name = clearName($test[1]);

                    $result = $sql->query("SELECT COUNT(id_room) FROM `classrooms` WHERE (room_number = '{$classroom}' AND building = '{$building}')");
                    $classroom_count = $result->fetch_row()[0];

                    if ($classroom_count === 0) {
                        $sql->query("INSERT INTO `classrooms` (`building`) VALUES ('$test2[0]')");
                        $building = $test2[0];
                        $classroom = '';
                    }

                    $stationary = ($specialisation[0] === 's') ? 1 : 0;
                    $year = $specialisation[1];
                    $specialisation_only = substr($specialisation, 2);
                    $specialisation_length = strlen($specialisation_only);
                    $group = substr($nazwaSpecjalnosci[$i], $specialisation_length + 2);

                    $event = [
                        'date' => $date,
                        'time_start' => $time_start,
                        'time_end' => $time_end,
                        'specialisation' => $nazwaSpecjalnosci[$i],
                        'subject' => $test[0],
                        'lecturer_name' => $lecturer_name['first_name'],
                        'lecturer_lastname' => $lecturer_name['last_name'],
                        'classroom' => $classroom,
                        'building' => $building,
                        'stationary' => $stationary,
                        'year' => $year,
                        'specialisation' => $specialisation_only,
                        'group' => $group,
                        'type' => $type,
                    ];
                    $test = array_slice($test, 2);
                    $test2 = array_slice($test2, 1);

                    if($event['lecturer_name'] === '-' || $event['lecturer_lastname'] === '-') {
                        continue;
                    }

                    $query = "INSERT IGNORE INTO lecture_schedule
                    (id_lecturer, id_group, id_room, type, time_start, time_end)
                    VALUES (
                          (SELECT id_lecturer FROM lecturers WHERE name = '{$event['lecturer_name']}' AND lastname = '{$event['lecturer_lastname']}'),
                          (SELECT id_group FROM student_groups WHERE stationary = '{$event['stationary']}' AND specialisation = '{$event['specialisation']}' AND spec_group = '{$event['group']}'),
                          (SELECT id_room FROM classrooms WHERE room_number = '{$event['classroom']}' AND building = '{$event['building']}'),
                          '{$event['type']}',
                          '{$event['time_start']}',
                          '{$event['time_end']}'
                    )";

                    $sql->query($query);
                    echo $query . PHP_EOL;
                }
            }
        }
    }
}

function getLegends($table, $specialisation)
{
    $stationary = ($specialisation[0] === 's') ? 1 : 0;
    $year = $specialisation[1];
    $specialisation_only = substr($specialisation, 2);

    $legends = [];
    $ths = $table->getElementsByTagName('th');
    foreach ($ths as $th) {
        if ($th->getAttribute('colspan') === '3' && str_contains($th->nodeValue, 'Legenda')) {
            $trs = $table->getElementsByTagName('tr');
            foreach ($trs as $tr) {
                $tds = $tr->getElementsByTagName('td');
                if ($tds->length === 3) {
                    if ($tds[0]->nodeValue === 'Przedmiot') {
                        continue;
                    }
                    $lecturer_name = clearName($tds[1]->nodeValue);
                    $legends[] = [
                        'Legend' => $th->nodeValue,
                        'subject' => $tds[0]->nodeValue,
                        'lecturer_firstname' => $lecturer_name['first_name'],
                        'lecturer_lastname' => $lecturer_name['last_name'],
                        'buiding' => $tds[2]->nodeValue[0],
                        'room_number' => substr($tds[2]->nodeValue, 1),
                    ];
                }
            }
        }
    }

    $sql = new mysqli(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'));

    $group_ids = $sql->query("SELECT 'group_id' FROM `student_groups` WHERE `specialisation` = '$specialisation_only' AND `stationary` = '$stationary' AND `year` = '$year'");

    foreach ($group_ids as $group_id) {
        foreach ($legends as $legend) {
            $query = "INSERT IGNORE INTO `legends` (
    `legend_name`,
    `id_group`,
    `id_lecturer`,
    `id_room`,
    `subject_name`
) VALUES (
    '{$legend['Legend']}',
    '{$group_id['group_id']}',
    (
        SELECT id_lecturer
        FROM lecturers
        WHERE name = '{$legend['lecturer_firstname']}'
        AND lastname = '{$legend['lecturer_lastname']}'
    ),
    (
        SELECT id_room
        FROM classrooms
        WHERE room_number = '{$legend['room_number']}'
        AND building = '{$legend['buiding']}'
    ),
    '{$legend['subject']}'
)";
            $sql->query($query);
        }

    }
}

function getFullSubjectNames($table, $specialisation)
{
    $stationary = ($specialisation[0] === 's') ? 1 : 0;
    $year = $specialisation[1];
    $specialisation_only = substr($specialisation, 2);
    $sql = new mysqli(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'));


    $legends = [];
    $ths = $table->getElementsByTagName('th');
    foreach ($ths as $th) {
        if ($th->nodeValue === 'Nazwa') {

            foreach ($table->getElementsByTagName('tr') as $row) {
                $cells = $row->getElementsByTagName('td');
                if ($cells->length === 2) {
                    if ($cells[0]->nodeValue === 'Skrot') {
                        continue;
                    }
                    $legends[] = [
                        'abbreviation' => $cells[0]->nodeValue,
                        'description' => $cells[1]->nodeValue,
                    ];

                }
            }

        }
    }
    $group_ids = $sql->query("SELECT 'group_id' FROM `student_groups` WHERE `specialisation` = '$specialisation_only' AND `stationary` = '$stationary' AND `year` = '$year'");

    foreach ($legends as $legend) {
        foreach ($group_ids as $group_id) {
            $query = "INSERT IGNORE INTO abbreviations_full_names (abbreviation, full_name, id_group) VALUES ('{$legend['abbreviation']}', '{$legend['description']}', '{$group_id['group_id']}')";
            $sql->query($query);
        }
    }
}

function clearName($name)
{

    $name_array = explode(' ', $name);


    $titles = ['dr', 'hab', 'hab.', 'inż.', 'mgr', 'prof.', 'lic', 'lek.', 'lek', 'med', 'med.', 'n.', 'mgr.', 'dent.', 'dent'];

    foreach ($titles as $title) {
        if (in_array($title, $name_array)) {
            $key = array_search($title, $name_array);
            unset($name_array[$key]);
        }
    }

    $name_array = array_values($name_array);


    $first_name = $name_array[0];
    unset($name_array[0]);
    $last_name = implode(' ', $name_array);

    return [
        'first_name' => $first_name,
        'last_name' => $last_name,
    ];
}


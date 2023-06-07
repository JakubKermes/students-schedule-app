<?php

ini_set('max_execution_time', 1000);

use App\CrawlSite\URLScraper;
use App\Models\AbbreviationFullName;
use App\Models\Classroom;
use App\Models\Lecturer;
use App\Models\LectureSchedule;
use App\Models\Legend;
use App\Models\StudentGroup;


$scraper = new URLScraper('http://www.plan.collegiumwitelona.pl/');
$urls = $scraper->getAllURLs();

foreach ($urls as $url) {
    if (strpos($url, 'checkSpecjalnoscStac') === false) {
        continue;
    }
    if (strpos($url, "%A3")) {
        $url = str_replace("%A3", "Ł", $url);
    }
    if (strpos($url, "%AC")) {
        $url = str_replace("%AC", "Ź", $url);
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

                    $subject = explode(' ', $test[0])[0];

                    $pattern = '/\((.*?)\)/';
                    preg_match($pattern, $test[0], $matches);
                    $type = isset($matches[1]) ? $matches[1] : '';

                    $date = explode(' ', $day[$k])[1];

                    $time_start = $date . ' ' . substr($godzina[$j], 0, 5);
                    $time_end = $date . ' ' . substr($godzina[$j], 6, 5);

                    $building = substr($test2[0], 0, 1);
                    $classroom = substr($test2[0], 1);

                    if ($building === '-' || $classroom === '-') {
                        continue;
                    }

                    $lecturer_name = clearName($test[1]);

                    $classroom_count = Classroom::where('room_number', $classroom)
                        ->where('building', $building)
                        ->count();

                    if ($classroom_count === 0) {
                        $existing_classroom = Classroom::where('building', $test2[0])
                            ->first();
                        if (!$existing_classroom) {
                            Classroom::factory()->create([
                                'building' => $test2[0],
                                'room_number' => '',
                            ]);

                        }
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
                        'subject' => $subject,
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

                    if ($event['lecturer_name'] === '-' || $event['lecturer_lastname'] === '-') {
                        continue;
                    }


                    if (str_contains($event['lecturer_name'], "Legenda")) {
                        $event['lecturer_lastname'] = substr($event['lecturer_name'], 7);
                        $event['lecturer_name'] = "Legenda";

                    }

                    $existing_lecture_schedule = LectureSchedule::where('time_start', $event['time_start'])
                        ->where('time_end', $event['time_end'])
                        ->whereHas('lecturer', function ($query) use ($event) {
                            $query->where('name', $event['lecturer_name'])
                                ->where('lastname', $event['lecturer_lastname']);
                        })
                        ->whereHas('group', function ($query) use ($event) {
                            $query->where('stationary', $event['stationary'])
                                ->where('specialisation', $event['specialisation'])
                                ->where('spec_group', $event['group']);
                        })
                        ->whereHas('room', function ($query) use ($event) {
                            $query->where('building', $event['building'])
                                ->where('room_number', $event['classroom']);
                        })
                        ->where('type', $event['type'])
                        ->first();


                    $existing_lecturer = Lecturer::where('name', $event['lecturer_name'])
                        ->where('lastname', $event['lecturer_lastname'])
                        ->first();
                    if ($existing_lecturer === null) {
                        Lecturer::factory()->create([
                            'name' => $event['lecturer_name'],
                            'lastname' => $event['lecturer_lastname'],
                            'title' => '',
                            'id_at_collegiumwitelona' => '0',
                            'id_faculty' => '6',
                        ]);
                    }

                    if ($existing_lecture_schedule === null) {
                        LectureSchedule::factory()->create([
                            'id_lecturer' => Lecturer::where('name', $event['lecturer_name'])
                                ->where('lastname', $event['lecturer_lastname'])
                                ->first()->id_lecturer,
                            'id_group' => StudentGroup::where('stationary', $event['stationary'])
                                ->where('specialisation', $event['specialisation'])
                                ->where('spec_group', $event['group'])
                                ->first()->id_group,
                            'id_room' => Classroom::where('building', $event['building'])
                                ->where('room_number', $event['classroom'])
                                ->first()->id_room,
                            'subject' => $event['subject'],
                            'type' => $event['type'],
                            'time_start' => $event['time_start'],
                            'time_end' => $event['time_end'],
                        ]);
                    }

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


    $group_ids = StudentGroup::where('specialisation', $specialisation_only)
        ->where('stationary', $stationary)
        ->where('year', $year)
        ->get('id_group');
    foreach ($group_ids as $group_id) {
        foreach ($legends as $legend) {

            $existing_legend = Legend::where('legend_name', $legend['Legend'])
                ->where('id_group', $group_id['id_group'])
                ->where('id_lecturer', function ($query) use ($legend) {
                    $query->from('lecturers')
                        ->where('name', $legend['lecturer_firstname'])
                        ->where('lastname', $legend['lecturer_lastname'])
                        ->select('id_lecturer')->first();
                })
                ->where('id_room', function ($query) use ($legend) {
                    $query->from('classrooms')
                        ->where('building', $legend['buiding'])
                        ->where('room_number', $legend['room_number'])
                        ->select('id_room');
                })
                ->where('subject_name', $legend['subject'])
                ->first();

            $existing_room = Classroom::where('building', $legend['buiding'])
                ->where('room_number', $legend['room_number'])
                ->first();

            if (!$existing_room) {
                Classroom::factory()->create([
                    'building' => $legend['buiding'],
                    'room_number' => $legend['room_number'],
                ]);
            }


            if (!$existing_legend) {
                Legend::factory()->create([
                    'legend_name' => $legend['Legend'],
                    'id_group' => $group_id['id_group'],
                    'id_lecturer' => Lecturer::where('name', $legend['lecturer_firstname'])
                        ->where('lastname', $legend['lecturer_lastname'])
                        ->first('id_lecturer')->id_lecturer,
                    'id_room' => Classroom::where('room_number', $legend['room_number'])
                        ->where('building', $legend['buiding'])
                        ->first()->id_room,
                    'subject_name' => $legend['subject'],
                ]);
            }
        }

    }
}

function getFullSubjectNames($table, $specialisation)
{
    $stationary = ($specialisation[0] === 's') ? 1 : 0;
    $year = $specialisation[1];
    $specialisation_only = substr($specialisation, 2);


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
    $group_ids = StudentGroup::where('specialisation', $specialisation_only)
        ->where('stationary', $stationary)
        ->where('year', $year)
        ->get('id_group');

    foreach ($legends as $legend) {
        foreach ($group_ids as $group_id) {
            $existing_abbreviation = AbbreviationFullName::where('abbreviation', $legend['abbreviation'])
                ->where('id_group', $group_id['id_group'])
                ->first();

            if (!$existing_abbreviation) {
                AbbreviationFullName::factory()->create([
                    'abbreviation' => $legend['abbreviation'],
                    'id_group' => $group_id['id_group'],
                ]);
            }
        }
    }
}

function clearName($name)
{

    $name_array = explode(' ', $name);
    $titles_array = array();


    $titles = ['dr', 'hab', 'hab.', 'inż.', 'mgr', 'prof.', 'lic', 'lek.', 'lek', 'med', 'med.', 'n.', 'mgr.', 'dent.', 'dent', 'prof.dr', 'hab.inż.'];

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

    if (strpos($name, 'Legenda')) {
        $first_name = 'Legenda';
        $last_name = substr($first_name, 7);
    }

    if (str_contains($last_name, "Barbara Cieślik")) {
        $first_name = "Barbara";
        $last_name = "Cieślik";
    }

    return [
        'actual_titles' => $actual_titles,
        'first_name' => $first_name,
        'last_name' => $last_name,
    ];
}

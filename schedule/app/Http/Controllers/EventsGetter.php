<?php

namespace App\Http\Controllers;

class EventsGetter
{
    private $field_of_study;
    private $year;
    private $specialisation;
    private $group;

    public function getEvents($field_of_study, $year, $specialisation, $group)
    {
       $sql = new \mysqli(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'));
       $query = "SELECT 'id_group' FROM student_groups WHERE field_of_study = '$field_of_study' AND year = '$year' AND specialisation = '$specialisation' AND group_name = '$group'";
        $result = $sql->query($query);

       $query = "SELECT * FROM lecture_schedule WHERE id_group = '$result'";
         $result = $sql->query($query);

         return $result;
    }



}

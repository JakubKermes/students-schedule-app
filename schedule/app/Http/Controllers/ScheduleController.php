<?php

namespace App\Http\Controllers;

use App\Models\Lecturer;
use App\Models\LectureSchedule;

class ScheduleController extends Controller
{
    public function getSchedule($id_group)
    {
        $schedule = LectureSchedule::where('id_group', $id_group)->get();
        foreach ($schedule as $item) {
         $lecturer = Lecturer::where('id_lecturer', $item->id_lecturer)->first()->name;
         if($lecturer['name'] == 'Legenda'){

         }

        }
        return response()->json($schedule, 200, [], JSON_UNESCAPED_UNICODE);
    }
}

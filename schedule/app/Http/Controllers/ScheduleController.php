<?php

namespace App\Http\Controllers;

use App\Models\Classroom;
use App\Models\Lecturer;
use App\Models\LectureSchedule;
use App\Models\Legend;

class ScheduleController extends Controller
{
    public function getSchedule($id_group)
    {
        $legends = new Legend();
        $schedule = LectureSchedule::where('id_group', $id_group)->get();

        foreach ($schedule as $item){
            $lecturer = Lecturer::where('id_lecturer', $item->id_lecturer)->first();

            if ($lecturer->name == 'Legenda') {
                $legends = Legend::where('id_group', $id_group)
                    ->where('legend_name', $lecturer->name . $lecturer->lastname)
                    ->get();
            } else {
                $legends = [];
                $schedule->lecturer_name =$lecturer->title . ' ' . $lecturer->name . ' ' . $lecturer->lastname;

            }
        }

        foreach ($schedule as $item) {
            $lecturer = Lecturer::where('id_lecturer', $item->id_lecturer)->first();
            $item->lecturer_name = $lecturer->name . ' ' . $lecturer->lastname;

            $classroom = Classroom::where('id_room', $item->id_room)->first();
            $item->classroom = $classroom->building . $classroom->room_number;
        }


        $response_data = [
            'schedule' => $schedule,
            'legends' => $legends
        ];

        return response()->json($response_data, 200, [], JSON_UNESCAPED_UNICODE);
    }

}

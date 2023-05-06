<?php

namespace App\Http\Controllers;

use App\Models\LectureSchedule;
use Illuminate\Http\Request;

class ScheduleController extends Controller
{
    public function getSchedule($id_group)
    {
        $schedule = LectureSchedule::where('id_group', $id_group)->get();
        return response()->json($schedule);
    }
}

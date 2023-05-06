<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\StudentGroup;
use App\Models\Faculty;

class StudentGroupSelectionController extends Controller
{

    public function getFaculties()
    {
        $faculties = Faculty::select('id_faculty', 'faculty_name')->distinct()->get();
        return response()->json($faculties, 200, [], JSON_UNESCAPED_UNICODE);
    }
    public function getFOS($id_faculty)
    {
        $fos = StudentGroup::select('fos')->where('id_faculty', $id_faculty)->distinct()->get();
        return response()->json($fos, 200, [], JSON_UNESCAPED_UNICODE);
    }
    public function getYear($id_faculty, $fos)
    {
        $groups = StudentGroup::select('year')->where('id_faculty', $id_faculty)->where('fos', $fos)->distinct()->get();
        return response()->json($groups, 200, [], JSON_UNESCAPED_UNICODE);
    }
    public function getSpecialisation($id_faculty, $fos, $year)
    {
        $groups = StudentGroup::select('specialisation')->where('id_faculty', $id_faculty)->where('fos', $fos)->where('year', $year)->distinct()->get();
        return response()->json($groups, 200, [], JSON_UNESCAPED_UNICODE);
    }
    public function getStationary($id_faculty, $fos, $year, $specialisation)
    {
        $groups = StudentGroup::select('stationary')->where('id_faculty', $id_faculty)->where('fos', $fos)->where('year', $year)->where('specialisation', $specialisation)->distinct()->get();
        return response()->json($groups, 200, [], JSON_UNESCAPED_UNICODE);
    }
    public function getSpecGroup($id_faculty, $fos, $year, $specialisation, $stationary)
    {
        $groups = StudentGroup::select('spec_group')->where('id_faculty', $id_faculty)->where('fos', $fos)->where('year', $year)->where('specialisation', $specialisation)->where('stationary', $stationary)->distinct()->get();
        return response()->json($groups, 200, [], JSON_UNESCAPED_UNICODE);
    }
    public function getGroup($id_faculty, $fos, $year, $specialisation, $spec_group, $stationary)
    {
        $groups = StudentGroup::select('id_group')->where('id_faculty', $id_faculty)->where('fos', $fos)->where('year', $year)->where('specialisation', $specialisation)->where('spec_group', $spec_group)->where('stationary', $stationary)->distinct()->get();
        return response()->json($groups, 200, [], JSON_UNESCAPED_UNICODE);
    }


}

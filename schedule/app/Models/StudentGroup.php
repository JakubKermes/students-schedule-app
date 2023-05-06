<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentGroup extends Model
{
    use HasFactory;

    protected $table = 'student_groups';
    protected $primaryKey = 'id_group';
    public $timestamps = false;
    protected $fillable = [
        'id_faculty',
        'fos',
        'year',
        'stationary',
        'specialisation',
        'spec_group',
    ];

    // Define relationships to other models here
    public function lectureSchedules()
    {
        return $this->hasMany(LectureSchedule::class, 'id_group');
    }
    public function faculty()
    {
        return $this->belongsTo(Faculty::class, 'id_faculty');
    }
    public function abbreviationFullNames()
    {
        return $this->hasMany(AbbreviationFullName::class, 'id_group');
    }
    public function legend()
    {
        return $this->hasMany(Legend::class, 'id_group');
    }


}

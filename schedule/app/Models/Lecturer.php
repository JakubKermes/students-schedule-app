<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lecturer extends Model
{
    use HasFactory;

    protected $table = 'lecturers';
    protected $primaryKey = 'id_lecturer';
    public $timestamps = false;
    protected $fillable = [
        'name',
        'lastname',
        'title',
        'id_at_collegiumwitelona',
        'id_faculty',
    ];

    // Define relationships to other models here
    public function faculty()
    {
        return $this->belongsTo(Faculty::class, 'id_faculty');
    }
    public function lectureSchedules()
    {
        return $this->hasMany(LectureSchedule::class, 'id_lecturer');
    }
    public function legend()
    {
        return $this->hasMany(Legend::class, 'id_lecturer');
    }


}

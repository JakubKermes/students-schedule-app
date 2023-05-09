<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LectureSchedule extends Model
{
    use HasFactory;

    protected $table = 'lecture_schedule';
    protected $primaryKey = 'id_lecture';
    public $timestamps = false;
    protected $fillable = [
        'id_lecturer',
        'id_group',
        'id_room',
        'subject',
        'type',
        'time_start',
        'time_end',
    ];

    // Define relationships to other models here

    public function lecturer()
    {
        return $this->belongsTo(Lecturer::class, 'id_lecturer');
    }

    public function group()
    {
        return $this->belongsTo(StudentGroup::class, 'id_group');
    }

    public function room()
    {
        return $this->belongsTo(Classroom::class, 'id_room');
    }

}

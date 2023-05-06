<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Classroom extends Model
{
    use HasFactory;

    protected $table = 'classrooms';
    protected $primaryKey = 'id_room';
    public $timestamps = false;
    protected $fillable = [
        'room_number',
        'building',
    ];

    // Define relationships to other models here
    public function lectureSchedules()
    {
        return $this->hasMany(LectureSchedule::class, 'id_room');
    }

    public function legend()
    {
        return $this->hasMany(Legend::class, 'id_room');
    }

}

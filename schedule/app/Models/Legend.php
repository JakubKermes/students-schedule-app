<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Legend extends Model
{
    use HasFactory;

    protected $table = 'legends';
    protected $primaryKey = 'id_legend';
    public $timestamps = false;
    protected $fillable = [
        'legend_name',
        'id_group',
        'id_lecturer',
        'id_room',
        'subject_name',
    ];

    // Define relationships to other models here
    public function studentGroup()
    {
        return $this->belongsTo(StudentGroup::class, 'id_group');
    }
    public function lecturer()
    {
        return $this->belongsTo(Lecturer::class, 'id_lecturer');
    }
    public function room()
    {
        return $this->belongsTo(Classroom::class, 'id_room');
    }
}

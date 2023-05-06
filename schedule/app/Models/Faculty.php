<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Faculty extends Model
{
    use HasFactory;

    protected $table = 'faculty';
    protected $primaryKey = 'id_faculty';
    public $timestamps = false;
    protected $fillable = [
        'id_at_collegiumwitelona',
        'faculty_name',
    ];

    // Define relationships to other models here

    public function studentGroups()
    {
        return $this->hasMany(StudentGroup::class, 'id_faculty');
    }
    public function lecturers()
    {
        return $this->hasMany(Lecturer::class, 'id_faculty');
    }


}

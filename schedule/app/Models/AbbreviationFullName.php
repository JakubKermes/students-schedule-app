<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AbbreviationFullName extends Model
{
    use HasFactory;

    protected $table = 'abbreviations_full_names';
    protected $primaryKey = 'id_abbreviation';
    public $timestamps = false;
    protected $fillable = [
        'abbreviation',
        'full_name',
        'id_group',
    ];

    // Define relationships to other models here

    public function studentGroup()
    {
        return $this->belongsTo(StudentGroup::class, 'id_group');
    }
}

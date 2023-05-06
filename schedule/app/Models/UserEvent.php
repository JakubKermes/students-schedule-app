<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserEvent extends Model
{
    use HasFactory;

    protected $table = 'user_events';
    protected $primaryKey = 'id_event';
    public $timestamps = false;
    protected $fillable = [
        'id_laravel_user',
        'event_name',
        'time_start',
        'time_end',
    ];

    // Define relationships to other models here
    public function user()
    {
        return $this->belongsTo(User::class, 'id_laravel_user');
    }
}

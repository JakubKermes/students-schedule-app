<?php
namespace Database\Factories;

use App\Models\LectureSchedule;
use Illuminate\Database\Eloquent\Factories\Factory;

class LectureScheduleFactory extends Factory
{
protected $model = LectureSchedule::class;

public function definition()
{
return [
'id_lecturer' => $this->faker->numberBetween(1, 10), // replace with actual range
'id_group' => $this->faker->numberBetween(1, 20), // replace with actual range
'id_room' => $this->faker->numberBetween(1, 5), // replace with actual range
'subject' => $this->faker->randomElement(['Math', 'Physics', 'Chemistry', 'Biology', 'English']),
'type' => $this->faker->randomElement(['lecture', 'seminar']),
'time_start' => $this->faker->dateTimeBetween('now', '+1 hour')->format('Y-m-d H:i:s'),
'time_end' => $this->faker->dateTimeBetween('+1 hour', '+2 hour')->format('Y-m-d H:i:s'),
];
}
}

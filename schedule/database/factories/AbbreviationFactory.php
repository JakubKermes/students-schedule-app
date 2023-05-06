<?php

use App\Models\AbbreviationFullName;
use App\Models\StudentGroup;
use Illuminate\Database\Eloquent\Factories\Factory;

class AbbreviationFullNameFactory extends Factory
{
protected $model = AbbreviationFullName::class;

public function definition()
{
return [
'abbreviation' => 'ABC',
'full_name' => 'Abbreviation Full Name',
'id_group' => function () {
return StudentGroup::factory()->create()->id;
},
];
}
}

<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\AbbreviationFullName>
 */
class AbbreviationFullNameFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
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

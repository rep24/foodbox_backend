<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Box>
 */
class BoxFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => 1,
            'food_id' => fake()->randomNumber(),
            'memo' => fake()->realText(50,2),
            'deadline' => fake()->dateTimeBetween()->format('Y-m-d'),
        ];
    }
}
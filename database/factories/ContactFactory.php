<?php

namespace Database\Factories;

use App\Models\Contact;
use Illuminate\Database\Eloquent\Factories\Factory;


class ContactFactory extends Factory
{
  /**
     * Define the model's default state.
     *
     * @return array
     */
    protected $model = Contact::class;

     public function definition()
     {
      return [
        'user_id' => fake()->randomNumber(),
        'body' => fake()->realText(50,2),
      ];
     }
}
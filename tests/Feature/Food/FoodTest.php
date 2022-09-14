<?php

namespace Tests\Feature\Auth;

use App\Models\Food;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class FoodTest extends TestCase
{
  use RefreshDatabase;

  public function test_get_foods()
  {
    $food = Food::factory()->count(5)->create();
    $response = $this->getJson('/api/foods');

    $response
        ->assertOk()
        ->assertJsonCount($food->count());
  }

  public function test_new_food()
  {
    $data = [
      'name' => 'food',
      'image' => 'http://test.image.com',
      'category_id' => 1,
      'parent_id' => 1,
    ];

    $response = $this->post('/api/foods',$data);
    $response->assertOk();
  }


  public function test_edit_food()
  {
    Food::factory()->count(5)->create();
    $edit = [
      'name' => 'editfood',
      'image' => 'http://testedit.image.com',
      'category_id' => 10,
      'parent_id' => 10,
    ];

    $response = $this->put('/api/foods/10',$edit);
    $response->assertOk();
  }

  public function test_delete_food()
  {
    $food = Food::factory()->count(5)->create();
    
    $response = $this->delete('/api/foods/12');
    $response->assertOk();

    $response = $this->getJson('/api/foods');
    $response
        ->assertOk()
        ->assertJsonCount($food->count() -1);
  }
  
}
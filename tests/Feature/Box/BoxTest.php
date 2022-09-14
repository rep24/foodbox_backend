<?php

namespace Tests\Feature\Auth;

use App\Models\Box;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class BoxTest extends TestCase
{
  use RefreshDatabase;

  public function test_new_box()
  {
    $data = [
      'user_id' => 1,
      'food_id' => '3',
      'memo' => 'memo',
      'deadline' => '2022-12-24'
    ];

    $response = $this->post('/api/box',$data);
    $response->assertOk();
  }

  public function test_edit_box()
  {
    Box::factory()->count(5)->create();
  
    $edit = [
      'deadline' => '2022-11-11',
      'memo' => 'edit',
    ];

    $response = $this->put('/api/box/6',$edit);
    $response->assertOk();
  }

  public function test_delete_box()
  {
    Box::factory()->count(5)->create();
    $response = $this->delete('/api/box/11');
    $response->assertOk();
  }
}
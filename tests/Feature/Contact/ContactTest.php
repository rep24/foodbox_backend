<?php

namespace Tests\Feature\Auth;

use App\Models\Contact;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ContactTest extends TestCase
{
  use RefreshDatabase;

  public function test_get_contacts()
  {
    $contact = Contact::factory()->count(5)->create();
    $response = $this->getJson('/api/contact');

    $response
        ->assertOk()
        ->assertJsonCount($contact->count());
  }

  public function test_new_contacts()
  {
    $data = [
      'user_id' => 1,
      'body' => 'test'
    ];

    $response = $this->post('/api/contact',$data);
    $response->assertOk();
  }

  public function test_delete_contact()
  {
    $contact = Contact::factory()->count(5)->create();
    
    $response = $this->delete('/api/contact/7');
    $response->assertOk();

    $response = $this->getJson('/api/contact');
    $response
        ->assertOk()
        ->assertJsonCount($contact->count() -1);
  }
  
}
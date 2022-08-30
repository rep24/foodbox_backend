<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    public const UPDATED_AT = null;
    protected $fillable = [
      'user_id',
      'body',
  ];

    public function contact($request)
    {
        $contact = new Contact();
        $contact->user_id = $request->input('user_id');
        $contact->body = $request->input('body');
        $contact->created_at = now();
        $contact->save();
    }

    public function index()
    {
        $contact = Contact::where('delete_flg', 0)
        ->get();
        return $contact;
    }

    public function deleteContact(Int $id)
    {
        $contact = Contact::find($id);
        $contact->delete_flg = 1;
        $contact->save();
    }
}
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Contact;

class ContactController extends Controller
{
    //
    public function contact(Contact $contact, Request $request)
    {
        $contact->contact($request);
    }

    public function index(Contact $contact)
    {
        $contacts = $contact->index();
        return response()->json($contacts);
    }

    public function delete(Contact $contact, Int $id)
    {
        $contact->deleteContact($id);
    }
}
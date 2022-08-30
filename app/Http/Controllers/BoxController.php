<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Box;

class BoxController extends Controller
{
    public function findById(Box $box, Int $id)
    {
        $userBox = $box->findById($id);
        return response()->json($userBox);
    }

    public function create(Box $box, Request $request)
    {
        $box->create($request);
    }

    public function edit(Box $box, Int $id, Request $request)
    {
        $box->edit($id, $request);
    }

    public function delete(Box $box, Int $id)
    {
        $box = new Box();
        $box->deleteBox($id);
    }
}
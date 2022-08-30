<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Food;

class FoodController extends Controller
{
    public function index(Food $food)
    {
        $foods = $food->index();
        return response()->json($foods);
    }

    public function create(Food $food, Request $request)
    {
        $food->create($request);
    }

    public function delete(Food $food, Int $id)
    {
        $food->deleteFood($id);
    }
}
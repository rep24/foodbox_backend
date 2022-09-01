<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Food extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'image',
    ];

    public function index()
    {
        $foods = Food::all();
        return $foods;
    }

    public function create($request)
    {
        $food = new Food();
        $food->name = $request->input('name');
        $food->image = $request->input('image');
        $food->category_id = $request->input('category_id');
        $food->parent_id = $request->input('parent_id');
        $food->created_at = now();
        $food->updated_at = now();
        $food->save();
    }

    public function edit(Int $id, $request)
    {
        $food = Food::find($id);
        $food->name = $request->input('name');
        $food->image = $request->input('image');
        $food->category_id = $request->input('category_id');
        $food->parent_id = $request->input('parent_id');
        $food->updated_at = now();
        $food->save();
    }

    public function deleteFood(Int $id)
    {
        Food::find($id)->delete();
    }
}
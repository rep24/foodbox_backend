<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Box extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'food_id',
        'memo',
        'deadline',
    ];

    public function findbyId(Int $id)
    {
        $box = Box::join('food', 'boxes.food_id', '=', 'food.id')
        ->select('boxes.id', 'name', 'deadline', 'memo', 'image', 'food.category_id', 'food.parent_id')
        ->where('user_id', $id)
        ->orderBy('deadline', 'asc')
        ->get();
        return $box;
    }

    public function create($request)
    {
        $box = new Box();
        $box->user_id = $request->input('user_id');
        $box->food_id = $request->input(('food_id'));
        $box->deadline = $request->input('deadline');
        $box->memo = $request->input('memo');
        $box->created_at = now();
        $box->updated_at = now();
        $box->save();
    }

    public function edit(Int $id, $request)
    {
        $box = Box::find($id);
        $box->deadline = $request->input('deadline');
        $box->memo = $request->input('memo');
        $box->updated_at->now();
        $box->save();
    }


    public function deleteBox(Int $id)
    {
        Box::find($id)->delete();
    }
}
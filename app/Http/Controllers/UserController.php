<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    #ユーザー全件取得
    public function index()
    {
        $users = User::all();
        return response()->json($users);
    }

    #ユーザー編集
    public function update(Int $id, Request $request)
    {
        $user = User::find($id);
        $user->name = $request->input('name');
        $user->mail = $request->input('mail');
        $user->updated_at = now();
        $user->save();
    }

    #ユーザー削除
    public function delete(Int $id)
    {
        $user = User::find($id)->delete();
    }
}
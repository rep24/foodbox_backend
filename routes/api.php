<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\BoxController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\FoodController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

#認証(breeze)
Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware(['middleware' => 'api'])->group(function () {
    // #ユーザー全件取得
    Route::get('/users', [UserController::class,'index']);
    // #ユーザー編集
    Route::put('/users/{id}', [UserController::class,'update']);
    // #ユーザー削除
    Route::delete('/users/{id}', [UserController::class,'delete']);

    #食材全件取得
    Route::get('/foods', [FoodController::class,'index']);
    #食材登録
    Route::post('/foods', [FoodController::class,'create']);
    #食材編集
    Route::put('/foods/{id}', [FoodController::class,'edit']);
    #食材削除
    Route::delete('/foods/{id}', [FoodController::class,'delete']);

    #ユーザーのボックス取得
    Route::get('/box/{id}', [BoxController::class,'findbyId']);
    #ボックスに食材を登録
    Route::post('/box', [BoxController::class,'create']);
    #ボックスの食材編集
    Route::put('/box/{id}', [BoxController::class,'edit']);
    #ボックスの食材削除
    Route::delete('/box/{id}', [BoxController::class,'delete']);

    #お問い合わせ送信
    Route::post('/contact', [ContactController::class,'contact']);
    #お問い合わせ一覧取得
    Route::get('/contact', [ContactController::class,'index']);
    #お問い合わせ削除（完了・理論削除)
    Route::delete('/contact/{id}', [ContactController::class,'delete']);
});
<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('/auth/login');
});

Auth::routes();

//pages routes
Route::get('/home', 'HomeController@index');
Route::get('/players', 'playersController@index');
Route::get('/vehicles', 'vehiclesController@index');

//pages single routes
Route::get('/players/{player_id}/', 'playerInfoPageController@index');
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
Route::get('/logs', 'logsController@index');

//pages single routes
Route::get('/players/{player_id}', 'playerInfoPageController@index');
Route::post('/players/{player_id}/compensate', 'playerInfoPageController@ajax_compensate');
Route::post('/players/{player_id}/blacklist', 'playerInfoPageController@ajax_blacklist');
Route::post('/players/{player_id}/delete_vehicle', 'playerInfoPageController@ajax_delete_vehicle');
Route::post('/players/{player_id}/delete_house', 'playerInfoPageController@ajax_delete_house');
Route::post('/players/{player_id}/whitelist_police', 'playerInfoPageController@ajax_whitelist_police');
Route::post('/players/{player_id}/whitelist_medic', 'playerInfoPageController@ajax_whitelist_medic');
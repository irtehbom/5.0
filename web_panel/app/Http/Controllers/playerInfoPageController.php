<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class playerInfoPageController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $altis_database = \DB::connection('altis_life');
        $params = request()->route()->parameters(); 
        
        $player_data = $altis_database->table('players')->where('pid',  $params["player_id"])->get();
        $vehicle_data = $altis_database->table('vehicles')->where('pid',  $params["player_id"])->get();
        $gang_data = $altis_database->table('gangs')->where('owner',  $params["player_id"])->get();
        $real_estate_data = $altis_database->table('realestate')->where('pid',  $params["player_id"])->get();
        $house_data = $altis_database->table('houses')->where('pid',  $params["player_id"])->get();
        
        
        return view('players_info',
            ["player_data" => $player_data[0]],
            ["vehicle_data" => $vehicle_data]     
        );
    }
}

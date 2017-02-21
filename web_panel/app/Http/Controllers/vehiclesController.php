<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class vehiclesController extends Controller
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
        $vehicles = $altis_database->table('vehicles')->select('classname', 'pid', 'alive', 'insert_time')->get();
        
        
        return view('vehicles', 
                ['Vehicles' => $vehicles]
        );
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class playersController extends Controller
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
        $players = $altis_database->table('players')->select('name', 'aliases', 'pid', 'cash','bankacc')->get();
        
        
        return view('players', 
                ['Players' => $players]
        );
    }
}

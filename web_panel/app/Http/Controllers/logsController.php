<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class logsController extends Controller
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
        
        $logs = \DB::table('logging')->orderBy('created_at', 'desc')->get();
        
        
        return view('logs', [
            "logs" => $logs
                ]
        );
    }
}

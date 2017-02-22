<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class adminOnlyRegistration
{
       
    public function handle($request, Closure $next, $guard = null)
    {
        
        $user = \DB::table('users')->where('id', Auth::guard($guard)->id())->first();
        
        if(Auth::guest()) {
             return redirect('/');
        }
        if ($user->access_level != 'master_admin') {
             return redirect('/home');
        }

        return $next($request);
    }
}

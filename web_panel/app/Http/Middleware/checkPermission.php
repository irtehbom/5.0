<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class checkPermission {

    public function handle($request, Closure $next, $guard = null) {

        $empty_db = \DB::table('users')->first();
        $user = \DB::table('users')->where('id', Auth::guard($guard)->id())->first();

        if ($empty_db != null) {
            if (Auth::guest()) {
                return redirect('/');
            }
            if ($user->access_level != 5) {
                return redirect('/home');
            }
        }

        return $next($request);
    }

}

<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Cookie;
use App;
use Illuminate\Support\Facades\Log;

class SetLocale
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $lang = $request->query("user_lang") ?? "en";
     
        if (array_key_exists($lang, config("app.locales"))) {
            Cookie::queue(Cookie::forever("user_lang", $lang));
        }
        return $next($request);
    }
}

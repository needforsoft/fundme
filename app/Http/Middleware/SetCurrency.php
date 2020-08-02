<?php

namespace App\Http\Middleware;

use App\Models\Currency;
use Closure;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Cookie;
class SetCurrency
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
        $curr_code = $request->query("currency_code");
     
        if (!(Currency::find($curr_code) instanceof ModelNotFoundException)) {
            Cookie::queue(Cookie::forever("currency_code", $curr_code));
        }
        else
        {
            Cookie::queue(Cookie::forever("currency_code", config("app.currency_code")));
        }

        return $next($request);
    }
}

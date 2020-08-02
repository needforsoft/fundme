<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use App;

class AppServiceProvider extends ServiceProvider
{
  /**
   * Register any application services.
   *
   * @return void
   */
  public function register()
  {
    //
  }

  /**
   * Bootstrap any application services.
   *
   * @return void
   */
  public function boot(Request $request)
  {
    if (Cookie::get("user_lang") !== null) {
      $decryptedLang = Crypt::decrypt(Cookie::get("user_lang"), false);
      App::setLocale($decryptedLang);
    }

    if (Cookie::get("currency_code") !== null) {
      $curr_code = Crypt::decrypt(Cookie::get("currency_code"), false);
      config(["app.currency_code" => $curr_code]);
    }

    Blade::withoutDoubleEncoding();
    Paginator::useBootstrapThree();
  }
}

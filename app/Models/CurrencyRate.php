<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CurrencyRate extends Model
{
    protected $fillable = 
    [
        "currency_from",
        "currency_to",
        "rate"
    ];
}

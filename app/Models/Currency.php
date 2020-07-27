<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    protected $fillable = 
    [
        "currency_code",
        "currency_symbol",
        "currency_symbol_position"
    ];
}

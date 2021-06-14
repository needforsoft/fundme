<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{ 
    protected $primaryKey = "currency_code";
    public $timestamps = false;
    public $incrementing = false;

    protected $fillable = 
    [
        "currency_code",
        "currency_symbol",
        "currency_symbol_position",
        "min_campaign_amount",
        "max_campaign_amount",
        "min_donation_amount",
        "max_donation_amount"
    ];
}

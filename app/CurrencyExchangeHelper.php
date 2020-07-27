<?php

 namespace App;

use App\Models\CurrencyRate;

class CurrencyExchangeHelper
    {
        public static function ConvertAndRountCurrency($currencyAmount, $fromCurrencyCode, $toCurrencyCode)
        {
            $exchanged = self::ConvertCurrency($currencyAmount, $fromCurrencyCode, $toCurrencyCode);

            return round($exchanged);
        }

        public static function ConvertCurrency($currencyAmount, $fromCurrencyCode, $toCurrencyCode)
        {
            if($currencyAmount == 0.0)
                return 0.0;

            $exchangeRate = CurrencyRate::where("currencyFrom", $fromCurrencyCode)
            ->where("currencyTo", $toCurrencyCode)->get();

            if($exchangeRate == null)
                return -1;

            return $currencyAmount / $exchangeRate;
        }
    }

?>
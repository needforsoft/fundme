<?php

 namespace App;

use App\Models\CurrencyRate;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use GuzzleHttp\Client;

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

            $exchangeRate = CurrencyRate::where("currency_from", $fromCurrencyCode)
            ->where("currency_to", $toCurrencyCode)->get();

            if($exchangeRate == null)
                return -1;

            return $currencyAmount / $exchangeRate;
        }

        public static function RefreshExchangeRates()
        {
            $currenies = [
                "AZN" => "USD,EUR,TRY",
                "USD" => "AZN,EUR,TRY",
                "EUR" => "AZN,USD,TRY",
                "TRY" => "AZN,USD,EUR",
            ];

            foreach($currenies as $k => $v)
            {
                $reqUrl  = "https://api.exchangerate.host/latest?symbols={$k}&base={$v}";

                $client = new Client();
                $resp = $client->get($reqUrl);

                if($resp)
                {
                    $body = $resp->getBody();

                    foreach($body["rates"] as $c => $r)
                    {
                        $er = CurrencyRate::where("currency_from", $k)
                        ->where("currency_to", $c)->get();

                        if($er == null || $er instanceof ModelNotFoundException)
                        {
                            $er = new CurrencyRate();
                            $er->currency_from = $k;
                            $er->currency_to = $c;
                            $er->exchange_rate = $r;
                        }
                        else
                        {
                            $er->currency_from = $k;
                            $er->currency_to = $c;
                            $er->exchange_rate = $r;
                        }

                        $er->save();
                    }
                }
            }
        }
    }

?>
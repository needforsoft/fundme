<?php

namespace App;

use Image;
use App\Models\AdminSettings;
use App\Models\Currency;
use App\Models\CurrencyRate;

class Helper
{
	// spaces
	public static function spacesUrlFiles($string)
	{
		return (preg_replace('/(\s+)/u', '_', $string));
	}

	public static function spacesUrl($string)
	{
		return (preg_replace('/(\s+)/u', '+', trim($string)));
	}

	public static function removeLineBreak($string)
	{
		return str_replace(array("\r\n", "\r"), "", $string);
	}

	public static function hyphenated($url)
	{
		$url = strtolower($url);
		//Rememplazamos caracteres especiales latinos
		$find = array('á', 'é', 'í', 'ó', 'ú', 'ñ');
		$repl = array('a', 'e', 'i', 'o', 'u', 'n');
		$url = str_replace($find, $repl, $url);
		// Añaadimos los guiones
		$find = array(' ', '&', '\r\n', '\n', '+');
		$url = str_replace($find, '-', $url);
		// Eliminamos y Reemplazamos demás caracteres especiales
		$find = array('/[^a-z0-9\-<>]/', '/[\-]+/', '/<[^>]*>/');
		$repl = array('', '-', '');
		$url = preg_replace($find, $repl, $url);
		//$palabra=trim($palabra);
		//$palabra=str_replace(" ","-",$palabra);
		return $url;
	}

	// Text With (2) line break
	public static function checkTextDb($str)
	{

		//$str = trim( self::spaces( $str ) );
		if (mb_strlen($str, 'utf8') < 1) {
			return false;
		}
		$str = preg_replace('/(?:(?:\r\n|\r|\n)\s*){3}/s', "\r\n\r\n", $str);
		$str = trim($str, "\r\n");

		return $str;
	}

	public static function checkText($str)
	{

		//$str = trim( self::spaces( $str ) );
		if (mb_strlen($str, 'utf8') < 1) {
			return false;
		}

		$str = nl2br(e($str));
		$str = str_replace(array(chr(10), chr(13)), '', $str);

		$str = stripslashes($str);

		return $str;
	}

	public static function formatNumber($number)
	{
		if ($number >= 1000 &&  $number < 1000000) {

			return number_format($number / 1000, 1) . "k";
		} else if ($number >= 1000000) {
			return number_format($number / 1000000, 1) . "M";
		} else {
			return $number;
		}
	} //<<<<--- End Function

	public static function formatNumbersStats($number)
	{
		if ($number >= 100000000) {
			return '<span class=".numbers-with-commas counter">' . number_format($number / 1000000, 0) . "</span>M";
		} else {
			return '<span class=".numbers-with-commas counter">' . number_format($number) . '</span>';
		}
	} //<<<<--- End Function

	public static function spaces($string)
	{
		return (preg_replace('/(\s+)/u', ' ', $string));
	}

	public static function resizeImage($image, $width, $height, $scale, $imageNew = null)
	{

		list($imagewidth, $imageheight, $imageType) = getimagesize($image);
		$imageType = image_type_to_mime_type($imageType);
		$newImageWidth = ceil($width * $scale);
		$newImageHeight = ceil($height * $scale);
		$newImage = imagecreatetruecolor($newImageWidth, $newImageHeight);
		switch ($imageType) {
			case "image/gif":
				$source = imagecreatefromgif($image);
				imagefill($newImage, 0, 0, imagecolorallocate($newImage, 255, 255, 255));
				imagealphablending($newImage, TRUE);
				break;
			case "image/pjpeg":
			case "image/jpeg":
			case "image/jpg":
				$source = imagecreatefromjpeg($image);
				break;
			case "image/png":
			case "image/x-png":
				$source = imagecreatefrompng($image);
				imagefill($newImage, 0, 0, imagecolorallocate($newImage, 255, 255, 255));
				imagealphablending($newImage, TRUE);
				break;
		}
		imagecopyresampled($newImage, $source, 0, 0, 0, 0, $newImageWidth, $newImageHeight, $width, $height);

		switch ($imageType) {
			case "image/gif":
				imagegif($newImage, $imageNew);
				break;
			case "image/pjpeg":
			case "image/jpeg":
			case "image/jpg":
				imagejpeg($newImage, $imageNew, 90);
				break;
			case "image/png":
			case "image/x-png":
				imagepng($newImage, $imageNew);
				break;
		}

		chmod($image, 0777);
		return $image;
	}

	public static function resizeImageFixed($image, $width, $height, $imageNew = null)
	{

		list($imagewidth, $imageheight, $imageType) = getimagesize($image);
		$imageType = image_type_to_mime_type($imageType);
		$newImage = imagecreatetruecolor($width, $height);

		switch ($imageType) {
			case "image/gif":
				$source = imagecreatefromgif($image);
				imagefill($newImage, 0, 0, imagecolorallocate($newImage, 255, 255, 255));
				imagealphablending($newImage, TRUE);
				break;
			case "image/pjpeg":
			case "image/jpeg":
			case "image/jpg":
				$source = imagecreatefromjpeg($image);
				break;
			case "image/png":
			case "image/x-png":
				$source = imagecreatefrompng($image);
				imagefill($newImage, 0, 0, imagecolorallocate($newImage, 255, 255, 255));
				imagealphablending($newImage, TRUE);
				break;
		}
		if ($width / $imagewidth > $height / $imageheight) {
			$nw = $width;
			$nh = ($imageheight * $nw) / $imagewidth;
			$px = 0;
			$py = ($height - $nh) / 2;
		} else {
			$nh = $height;
			$nw = ($imagewidth * $nh) / $imageheight;
			$py = 0;
			$px = ($width - $nw) / 2;
		}

		imagecopyresampled($newImage, $source, $px, $py, 0, 0, $nw, $nh, $imagewidth, $imageheight);

		switch ($imageType) {
			case "image/gif":
				imagegif($newImage, $imageNew);
				break;
			case "image/pjpeg":
			case "image/jpeg":
			case "image/jpg":
				imagejpeg($newImage, $imageNew, 90);
				break;
			case "image/png":
			case "image/x-png":
				imagepng($newImage, $imageNew);
				break;
		}

		chmod($image, 0777);
		return $image;
	}

	public static function getHeight($image)
	{
		$size   = getimagesize($image);
		$height = $size[1];
		return $height;
	}

	public static function getWidth($image)
	{
		$size  = getimagesize($image);
		$width = $size[0];
		return $width;
	}
	public static function formatBytes($size, $precision = 2)
	{
		$base = log($size, 1024);
		$suffixes = array('', 'kB', 'MB', 'GB', 'TB');

		return round(pow(1024, $base - floor($base)), $precision) . $suffixes[floor($base)];
	}

	public static function removeHTPP($string)
	{
		$string = preg_replace('#^https?://#', '', $string);
		return $string;
	}

	public static function Array2Str($kvsep, $entrysep, $a)
	{
		$str = "";
		foreach ($a as $k => $v) {
			$str .= "{$k}{$kvsep}{$v}{$entrysep}";
		}
		return $str;
	}

	public static function removeBR($string)
	{
		$html    = preg_replace('[^(<br( \/)?>)*|(<br( \/)?>)*$]', '', $string);
		$output = preg_replace('~(?:<br\b[^>]*>|\R){3,}~i', '<br /><br />', $html);
		return $output;
	}

	public static function removeTagScript($html)
	{

		//parsing begins here:
		$doc = new \DOMDocument();
		@$doc->loadHTML(mb_convert_encoding($html, 'HTML-ENTITIES', 'UTF-8'));
		$nodes = $doc->getElementsByTagName('script');

		$remove = [];

		foreach ($nodes as $item) {
			$remove[] = $item;
		}

		foreach ($remove as $item) {
			$item->parentNode->removeChild($item);
		}

		return preg_replace(
			'/^<!DOCTYPE.+?>/',
			'',
			str_replace(
				array('<html>', '</html>', '<body>', '</body>', '<head>', '</head>', '<p>', '</p>', '&nbsp;'),
				array('', '', '', '', '', ' '),
				$doc->saveHtml()
			)
		);
	} // End Method

	public static function removeTagIframe($html)
	{

		//parsing begins here:
		$doc = new \DOMDocument();
		@$doc->loadHTML(mb_convert_encoding($html, 'HTML-ENTITIES', 'UTF-8'));
		$nodes = $doc->getElementsByTagName('iframe');

		$remove = [];

		foreach ($nodes as $item) {
			$remove[] = $item;
		}

		foreach ($remove as $item) {
			$item->parentNode->removeChild($item);
		}

		return preg_replace(
			'/^<!DOCTYPE.+?>/',
			'',
			str_replace(
				array('<html>', '</html>', '<body>', '</body>', '<head>', '</head>', '<p>', '</p>', '&nbsp;'),
				array('', '', '', '', '', ' '),
				$doc->saveHtml()
			)
		);
	} // End Method

	public static function fileNameOriginal($string)
	{
		return pathinfo($string, PATHINFO_FILENAME);
	}

	public static function formatDate($date)
	{

		$day    = date('d', strtotime($date));
		$_month = date('m', strtotime($date));
		$month  = trans("months.$_month");
		$year   = date('Y', strtotime($date));

		$dateFormat = $month . ' ' . $day . ', ' . $year;

		return $dateFormat;
	}

	public static function watermark($name, $watermarkSource)
	{

		$thumbnail = Image::make($name);
		$watermark = Image::make($watermarkSource);
		$x = 0;

		while ($x < $thumbnail->width()) {
			$y = 0;

			while ($y < $thumbnail->height()) {
				$thumbnail->insert($watermarkSource, 'top-left', $x, $y);
				$y += $watermark->height();
			}

			$x += $watermark->width();
		}

		$thumbnail->save($name)->destroy();
	}

	public static function formatAmountLong($amount, $currenyCode)
	{
		return number_format($amount)." ".$currenyCode;
	}

	public static function formatAmountShort($amount, $curreny_code)
	{
		$curr = Currency::find($curreny_code);
		return self::formatAmountByCurrency($amount, $curr);
	}

	public static function formatAmountByCurrency($amount, $currency, $short = true)
	{
		$result = "";
		switch ($currency->currency_symbol_position) {
			case "left": {
					$result = $currency->currency_symbol . number_format($amount);
					break;
				}
			case "right": {
					$result = number_format($amount) . $currency->currency_symbol;
					break;
				}
		}

		return $result;
	}

	public static function amountFormatByCurrencyCode($value, $from_currency_code, $to_currency_code)
	{
		if ($to_currency_code != $from_currency_code) {
			$currency = Currency::find($to_currency_code);
		} else {
			$currency = Currency::find($from_currency_code);
		}
	
		$amount_converted = self::ConvertCurrency($value, $from_currency_code, $to_currency_code);

		$amount = "";

		switch ($currency->currency_symbol_position) {
			case "left": {
					$amount = $currency->currency_symbol . number_format($amount_converted);
					break;
				}
			case "right": {
					$amount = number_format($amount_converted) . $currency->currency_symbol;
					break;
				}
		}

		return $amount;
	}

	public static function amountFormat($value, $from_currency_code)
	{	
		$to_currency_code = $from_currency_code == config("app.currency_code") 
		? $from_currency_code :  config("app.currency_code");

		return self::amountFormatByCurrencyCode($value, $from_currency_code, $to_currency_code);
	}

	public static function ConvertCurrency($amount, $from_currency_code, $to_currency_code)
	{
		$currency_rate = 1;
		
		if ($to_currency_code != $from_currency_code) {

			$curr = CurrencyRate::where("currency_from", $from_currency_code)
			->where("currency_to", $to_currency_code)->first();
			
			if($curr != null)
				$currency_rate = $curr->exchange_rate;
		}
		else 
			return $amount; 

		$amount_converted = floor($amount / $currency_rate);

		return $amount_converted;
	}

}//<--- End Class

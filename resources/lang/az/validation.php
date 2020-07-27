<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'accepted'             => ' :atribut qəbul edilməlidir.',
    'active_url'           => ' :atribut düzgün URL deyil.',
    'after'                => ' :atribut gündən :gün sonra olmalıdır.',
    'alpha'                => ' :atribut yalnız hərflərdən ibarət ola bilər.',
    'alpha_dash'           => ' :atribut yalnız hərflər, nömrələr və tire ola bilər.',
    "ascii_only"           => " :atribut yalnız hərflər, nömrələr və tire ola bilər.",
    'alpha_num'            => ' :atribut yalnız hərflər və nömrələr ola bilər.',
    'array'                => ' :atribut bir sıra olmalıdır.',
    'before'               => ' :atribut gündən :gün sonra olmalıdır.',
    'between'              => [
        'numeric' => ' :atribut :min ilə :max arasında olmalıdır',
        'file'    => ' :atribut :min ilə :max kilobayt arasında olmalıdır.',
        'string'  => ' :atribut :min ilə :max simvol arasında olmalıdır.',
        'array'   => ' :atribut :min ilə :max hissə arasında olmalıdır.',
    ],
    'boolean'              => ' :atribut sahəsi doğru və ya yanlış olmalıdır.',
    'confirmed'            => ' :atribut təsdiqləməsi uyğun gəlmir.',
    'date'                 => ' :atribut düzgün bir tarix deyil.',
    'date_format'          => ' :atribut formata uyğun gəlmir :format.',
    'different'            => ' :atribut və :başqası fərqlənməlidir.',
    'digits'               => ' :atribut :rəqəm rəqəm olmalıdır.',
    'digits_between'       => ' :atribut :min and :max rəqəmlər arasında olmalıdır.',
    'dimensions'           => ' :atribut yalnış şəkil ölçülərinə malikdir.',
    'distinct'             => ' :atribut sahəsinin dublikat dəyəri var.',
    'email'                => ' :atribut düzgün e-poçt ünvanı olmalıdır.',
    'exists'               => 'Seçilmiş :atribut etibarsızdır.',
    'file'                 => ' :atribut bir fayl olmalıdır.',
    'filled'               => ' :atribut sahəsi tələb olunur.',
    'image'                => ' :atribut bir şəkil olmalıdır.',
    'in'                   => 'Seçilmiş :atribut etibarsızdır.',
    'in_array'             => ' :atribut sahəsi  :başqasında mövcud deyil.',
    'integer'              => ' :atribut tam ədəd olmalıdır.',
    'ip'                   => ' :atribut etibarlı bir IP ünvanı olmalıdır.',
    'json'                 => ' :atribut düzgün bir JSON xətti üstündə olmalıdır.',
    'max'                  => [
        'numeric' => ' :atribut :max daha çox ola bilməz.',
        'file'    => ' :atribut :max kilobayt daha çox ola bilməz.',
        'string'  => ' :atribut :max simvol daha çox ola bilməz.',
        'array'   => ' :atribut :max hissə daha çox ola bilməz.',
    ],
    'mimes'                => ' :atribut :dəyərlər növdə bir fayl olmalıdır.',
    'min'                  => [
        'numeric' => ' :.',
        'file'    => ' :atribut ən azı :min kilobayt olmalıdır.',
        'string'  => ' :atribut ən azı :min simvol olmalıdır.',
        'array'   => ' :atribut ən azı :min hissə olmalıdır.',
    ],
    'not_in'               => 'Seçilmiş :atribut is invalid.',
    'numeric'              => ' :atribut nömrə olmalıdır.',
    'present'              => ' :atribut sahəsi bugünkü olmalıdır.',
    'regex'                => ' :atribut formatı yalnışdır.',
    'required'             => ' :atribut sahəsi tələb olunur.',
    'required_if'          => ' :atribut sahəsi :başqası :dəyər olduqda tələb olunur.',
    'required_unless'      => ' :atribut sahəsi :başqasının :dəyərin içində olmağı istisna olmaqla tələb olunur.',
    'required_with'        => ' :atribut sahəsi :dəyər bugünkü olduqda tələb olunur.',
    'required_with_all'    => ' :atribut sahəsi :dəyər bugünkü olduqda tələb olunur.',
    'required_without'     => ' :atribut sahəsi :dəyər bugünkü olmadıqda tələb olunur.',
    'required_without_all' => ' :atribut sahəsi heç bir :dəyər bugünkü olmadıqda tələb olunur.',
    'same'                 => ' :atribut və: digərləri uyğun olmalıdır.',
    'size'                 => [
        'numeric' => ' :atribut :ölçüdə olmalıdır.',
        'file'    => ' :atribut :kilobayt ölçüsündə olmalıdır.',
        'string'  => ' :atribut :simvol ölçüsündə olmalıdır.',
        'array'   => ' :atribut :hissə ölçüsündə olmalıdır.',
    ],
    'string'               => ' :atribut bir xətt üstündə olmalıdır.',
    'timezone'             => ' :atribut düzgün bir bölgə olmalıdır.',
    'unique'               => ' :atribut artıq götürülmüşdür.',
    'url'                  => ' :atribut formatı yalnışdır.',
    "letters"              => "İstifadəçi adı ən azı bir hərf və ya nömrədən ibarət olmalıdır",
    "account_not_confirmed" => "Hesabınız təsdiqlənməyib, zəhmət olmasa e-poçtunuzu yoxlayın",
	"user_suspended"        => "Hesabınız dayandırılıb, zəhmət olmasa hər hansısa bir səhv varsa bizimlə əlaqə saxlayın",

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'Xüsusi mesaj',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
    */

    'attributes' => [
      'agree_gdpr' => 'box Şəxsi məlumatların işlənməsi ilə razıyam',
    ]
];

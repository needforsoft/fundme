-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2021 at 12:52 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fundme`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `welcome_text` varchar(200) NOT NULL,
  `welcome_subtitle` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `result_request` int UNSIGNED NOT NULL COMMENT 'The max number of shots per request',
  `status_page` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Offline, 1 Online',
  `email_verification` enum('0','1') NOT NULL COMMENT '0 Off, 1 On',
  `email_no_reply` varchar(200) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  `captcha` enum('on','off') NOT NULL DEFAULT 'on',
  `file_size_allowed` int UNSIGNED NOT NULL COMMENT 'Size in Bytes',
  `google_analytics` text NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `googleplus` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `google_adsense` text NOT NULL,
  `payment_gateway` enum('Paypal','Stripe') NOT NULL DEFAULT 'Paypal',
  `paypal_sandbox` enum('true','false') NOT NULL DEFAULT 'true',
  `min_width_height_image` varchar(100) NOT NULL,
  `fee_donation` int UNSIGNED NOT NULL,
  `auto_approve_campaigns` enum('0','1') NOT NULL DEFAULT '1',
  `stripe_secret_key` varchar(255) NOT NULL,
  `stripe_public_key` varchar(255) NOT NULL,
  `enable_paypal` enum('0','1') NOT NULL DEFAULT '0',
  `enable_stripe` enum('0','1') NOT NULL DEFAULT '0',
  `enable_bank_transfer` enum('0','1') NOT NULL DEFAULT '0',
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `date_format` varchar(200) NOT NULL,
  `link_privacy` varchar(200) NOT NULL,
  `link_terms` varchar(200) NOT NULL,
  `default_currency_code` varchar(3) NOT NULL,
  `multi_currency_mode_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `description`, `welcome_text`, `welcome_subtitle`, `keywords`, `result_request`, `status_page`, `email_verification`, `email_no_reply`, `email_admin`, `captcha`, `file_size_allowed`, `google_analytics`, `paypal_account`, `twitter`, `facebook`, `googleplus`, `instagram`, `google_adsense`, `payment_gateway`, `paypal_sandbox`, `min_width_height_image`, `fee_donation`, `auto_approve_campaigns`, `stripe_secret_key`, `stripe_public_key`, `enable_paypal`, `enable_stripe`, `enable_bank_transfer`, `bank_swift_code`, `account_number`, `branch_name`, `branch_address`, `account_name`, `iban`, `date_format`, `link_privacy`, `link_terms`, `default_currency_code`, `multi_currency_mode_enabled`) VALUES
(1, 'Fundme | Crowdfunding Platform', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet. ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet.', 'Little help, for big cause!', 'Crowdfunding Platform', 'Crowdfunding, crowfund, fundme, campaign', 8, '1', '1', 'no-reply@yousite.com', 'admin@admin.com', 'on', 2048, '', 'paypal@yousite.com', 'https://www.twitter.com/', 'https://www.facebook.com/fundme', '', 'https://www.instagram.com/', '<script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\r\n<ins class=\"adsbygoogle\"\r\nstyle=\"display:block\"\r\ndata-ad-client=\"ca-pub-4300901855004979\"\r\ndata-ad-slot=\"7623553448\"\r\ndata-ad-format=\"auto\"></ins> <script>(adsbygoogle=window.adsbygoogle||[]).push({});</script>', 'Paypal', 'true', '800x400', 5, '1', '', '', '0', '0', '0', '', '', '', '', '', '', 'M d, Y', 'https://yousite.com/page/privacy', 'https://yousite.com/page/terms-of-service', 'USD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int NOT NULL,
  `small_image` varchar(255) NOT NULL,
  `large_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `token_id` varchar(255) NOT NULL,
  `goal` int UNSIGNED NOT NULL,
  `goal_currency_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(200) NOT NULL,
  `finalized` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No 1 Yes',
  `categories_id` int UNSIGNED NOT NULL,
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `deadline` varchar(200) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `small_image`, `large_image`, `title`, `description`, `user_id`, `date`, `status`, `token_id`, `goal`, `goal_currency_code`, `location`, `finalized`, `categories_id`, `featured`, `deadline`, `created_at`) VALUES
(1, 'ismall_1_1595675139_f0h3ga0ra8wwu0wasrgn.jpg', 'ilarge_1_1595675139_9ylavp5fulidfmvz3vvx.jpg', 'Developing', 'The minimum duration is 7 days, If you want your campaign does not have a deadline, leave blank, it can not be changed.', 1, '2020-07-25 07:05:41', 'active', 'GxIdzEIu3nH5GF0v7ZSmyr6OXWXIGF3ePx7vCzsNUI8XWT0BFdYEJsr9hfbxyqD08uwr7zirVFXyxNbDuV1t57NNBSMCS5qeTn1Tx0hQljmG0j2DhHsp7VA1W0abcfUidbICrk2PuMVLcP8vEtgi6frmduqIANsfVM2AVrAdynI4hm2hn8ytViCOAAtlRGEhW4IMBl7v', 10000, 'AZN', 'Turkey', '1', 17, '0', '24-09-2020', '2020-07-29 21:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_reported`
--

CREATE TABLE `campaigns_reported` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_amount_settings`
--

CREATE TABLE `campaign_amount_settings` (
  `currency_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `min_donation_amount` int NOT NULL,
  `min_campaign_amount` int NOT NULL,
  `max_campaign_amount` int NOT NULL,
  `fee_donation` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `mode` enum('on','off') NOT NULL DEFAULT 'on',
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `mode`, `image`) VALUES
(1, 'Business', 'business', 'on', ''),
(2, 'Charity', 'charity', 'on', ''),
(4, 'Competitions', 'competition', 'on', ''),
(5, 'Creative', 'creative', 'on', ''),
(6, 'Events', 'Events', 'on', ''),
(7, 'Faith', 'Faith', 'on', ''),
(8, 'Family', 'Family', 'on', ''),
(9, 'Other', 'Other', 'on', ''),
(10, 'Travel', 'travel', 'on', ''),
(12, 'Medical', 'Medical', 'on', ''),
(14, 'Education', 'education', 'on', ''),
(15, 'Memorials', 'Memorials', 'on', ''),
(16, 'Sports', 'Sports', 'on', ''),
(17, 'Animals', 'animals', 'on', '');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People\'s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `currency_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol_position` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `min_campaign_amount` int NOT NULL,
  `max_campaign_amount` int NOT NULL,
  `min_donation_amount` int NOT NULL,
  `max_donation_amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currency_code`, `currency_symbol`, `currency_symbol_position`, `min_campaign_amount`, `max_campaign_amount`, `min_donation_amount`, `max_donation_amount`) VALUES
('AZN', '₼', 'right', 0, 0, 0, 0),
('RUB', '₽', 'right', 0, 0, 0, 0),
('USD', '$', 'left', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency_rates`
--

CREATE TABLE `currency_rates` (
  `id` tinyint UNSIGNED NOT NULL,
  `currency_from` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency_to` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency_rates`
--

INSERT INTO `currency_rates` (`id`, `currency_from`, `currency_to`, `exchange_rate`, `created_at`) VALUES
(1, 'AZN', 'USD', 0.96, '2020-08-02 15:41:19'),
(2, 'USD', 'AZN', 1.72, '2020-08-02 15:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `donation` int UNSIGNED NOT NULL,
  `donation_currency_code` varchar(3) NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `anonymous` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `rewards_id` int UNSIGNED NOT NULL,
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '1',
  `bank_transfer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `campaigns_id`, `txn_id`, `fullname`, `email`, `country`, `postal_code`, `donation`, `donation_currency_code`, `payment_gateway`, `oauth_uid`, `comment`, `date`, `anonymous`, `rewards_id`, `bank_swift_code`, `account_number`, `branch_name`, `branch_address`, `account_name`, `iban`, `approved`, `bank_transfer`) VALUES
(1, 1, 'null', 'Shamo Humbatli', 'shamohumbatli@gmail.com', 'Azerbaijan', 'AZ1000', 5, 'AZN', 'Bank Transfer', '', 'remote host for desktop application', '2020-07-25 11:27:38', '', 0, '', '', '', '', '', '', '0', 'gbgfgbfghf');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `campaigns_id`, `status`) VALUES
(1, 1, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  `show_navbar` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `show_navbar`) VALUES
(2, 'Terms', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets ', 'terms-of-service', '0'),
(3, 'Privacy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \n\n<br/><br/>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'privacy', '0'),
(5, 'About us', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets<br />\r\n<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', 'about', '0'),
(7, 'Support', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets <br /><br /> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'support', '0'),
(8, 'How it works', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', 'how-it-works', '1');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int UNSIGNED NOT NULL,
  `token` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sandbox` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `fee` decimal(3,1) NOT NULL,
  `fee_cents` decimal(2,2) NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `type`, `enabled`, `sandbox`, `fee`, `fee_cents`, `email`, `token`, `key`, `key_secret`, `bank_info`) VALUES
(1, 'PayPal', 'normal', '1', 'true', '5.0', '0.30', 'shamohumbatly@gmail.com', '12bGGfD9bHevK3eJN06CdDvFSTXsTrTG44yGdAONeN1R37jqnLY1PuNF0mJRoFnsEygyf28yePSCA1eR0alQk4BX89kGG9Rlha2D2KX55TpDFNR5o774OshrkHSZLOFo2fAhHzcWKnwsYDFKgwuaRg', '', '', ''),
(2, 'Stripe', 'card', '1', 'true', '2.9', '0.30', '', 'asfQSGRvYzS1P0X745krAAyHeU7ZbTpHbYKnxI2abQsBUi48EpeAu5lFAU2iBmsUWO5tpgAn9zzussI4Cce5ZcANIAmfBz0bNR9g3UfR4cserhkJwZwPsETiXiZuCixXVDHhCItuXTPXXSA6KITEoT', 'pk_test_51H8luOF3pBaitszwSJtrBLAJLpdCbqxGbeBo9exPxzP9xWwABWJuXD5Ic1jsRRgsdPHZncMbqvvotXwVeUhUCqsW006HidiNdz', 'sk_test_51H8luOF3pBaitszwg0xSZQXZ6U3pcBqOO9t0fONDUnQ5ZjRNQv4JwPlrS9ZKDKuVX58OMHdUMBiUhIrQsMklUfEY00mRlkdW2z', ''),
(3, 'Bank Transfer', 'bank', '0', 'true', '5.0', '0.00', '', 'zzzdH5811lZSjioHrg3zLD69DAAMvPLiwdzTouAdc7HbtaqgujPEZjH3i7RGeRtFKrY2baT7rXd6CaBtsRpo4XtgHvqCyCWiW5BlCrg1uSMCOSdi1tzPjCPx8px280YEyLvNtiRzWHJJk8WRegfTms', '', '', 'IBAN: this\r\nSWIFT: this');

-- --------------------------------------------------------

--
-- Table structure for table `reserved`
--

CREATE TABLE `reserved` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserved`
--

INSERT INTO `reserved` (`id`, `name`) VALUES
(14, 'account'),
(31, 'api'),
(2, 'app'),
(30, 'bootstrap'),
(37, 'campaigns'),
(34, 'categories'),
(36, 'collections'),
(29, 'comment'),
(42, 'config'),
(25, 'contact'),
(41, 'database'),
(35, 'featured'),
(32, 'freebies'),
(9, 'goods'),
(1, 'gostock1'),
(11, 'jobs'),
(21, 'join'),
(16, 'latest'),
(20, 'login'),
(33, 'logout'),
(27, 'members'),
(13, 'messages'),
(19, 'notifications'),
(15, 'popular'),
(6, 'porn'),
(26, 'programs'),
(12, 'projects'),
(3, 'public'),
(23, 'register'),
(40, 'resources'),
(39, 'routes'),
(17, 'search'),
(7, 'sex'),
(44, 'storage'),
(8, 'tags'),
(38, 'tests'),
(24, 'upgrade'),
(28, 'upload'),
(4, 'vendor'),
(5, 'xxx');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `delivery` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `image`, `description`, `campaigns_id`, `date`, `token_id`) VALUES
(1, '11595684428ziikrnpmrb049ycymjkal9bp13heboz1vfw3lcra.jpeg', 'sssfsdfffffffffffffffffffffffsfsdfsfsfdfs', 1, '2020-07-25 09:40:28', 'ALCBkoXtF2ipOH38bAYnHCsh99SqHkbkQrph5mefaLh0KoE7KApo9ZA9nhK1jAtaE8zhaT0PS3zlU43NWGnQEjavsTTST62g3HiQhcGztd3fMqDkBM2TUOG1owBI9bSaEJPFvcdW6tVIsm01wbu2ZLB9aNX9AD4UPmgpz0gG47TkBgCKiloRuEvGRKMvHGNeDg6OrSV0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `countries_id` char(25) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(70) NOT NULL,
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'active',
  `role` enum('normal','admin') NOT NULL DEFAULT 'normal',
  `remember_token` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `confirmation_code` varchar(125) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paypal_account` varchar(200) NOT NULL,
  `payment_gateway` varchar(50) NOT NULL,
  `bank` text NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `oauth_provider` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `countries_id`, `password`, `email`, `date`, `avatar`, `status`, `role`, `remember_token`, `token`, `confirmation_code`, `updated_at`, `created_at`, `paypal_account`, `payment_gateway`, `bank`, `oauth_uid`, `oauth_provider`, `username`) VALUES
(1, 'Fundme', '17', '$2y$10$XzUZMAN.KUwPkpg0xSIDi.GOvyF1JDeciikz.lZJvwgMVzQqKP6uu', 'admin@example.com', '2016-09-09 11:04:42', '11600229445nyhosaueudihfgn.png', 'active', 'admin', 'AyGb6LfDuIdOpBKVbj3KeowILBSj5hPJUV0qaDapabgveklCjrowwUeE3vs7', 'Wy4VkAl2dxHb9WHoXjTowSGPXFPnEQHca6RBe2yeqqmRafs0hSbCEobhNkZZAbCDIru60ceLzAAOI3fj', '', '2020-09-23 14:55:45', '2016-09-09 15:34:42', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `amount` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gateway` varchar(100) NOT NULL,
  `account` text NOT NULL,
  `date_paid` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`user_id`,`status`,`token_id`),
  ADD KEY `image` (`small_image`),
  ADD KEY `goal` (`goal`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Indexes for table `campaigns_reported`
--
ALTER TABLE `campaigns_reported`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_amount_settings`
--
ALTER TABLE `campaign_amount_settings`
  ADD PRIMARY KEY (`currency_code`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`currency_code`),
  ADD UNIQUE KEY `currency_code` (`currency_code`) USING BTREE;

--
-- Indexes for table `currency_rates`
--
ALTER TABLE `currency_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_id` (`campaigns_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hash` (`token`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`token_id`),
  ADD KEY `image` (`image`),
  ADD KEY `category_id` (`campaigns_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `username` (`status`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaings_id` (`campaigns_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaigns_reported`
--
ALTER TABLE `campaigns_reported`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `currency_rates`
--
ALTER TABLE `currency_rates`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reserved`
--
ALTER TABLE `reserved`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

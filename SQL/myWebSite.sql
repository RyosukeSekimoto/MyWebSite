
--
-- Database: `MyWebSite`
--
CREATE DATABASE `MyWebSite`;
USE MyWebSite;

--
-- テーブルの構造 `m_delivery_method`
--

CREATE TABLE `m_delivery_method` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルの構造 `m_item`
--

CREATE TABLE `m_item` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `first_file_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `second_file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `third_file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forth_file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルの構造 `t_buy`
--

CREATE TABLE `t_buy` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `delivery_method_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルの構造 `t_buy_detail`
--

CREATE TABLE `t_buy_detail` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `buy_id` int(11) NOT NULL,
  `item_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `item_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- テーブルの構造 `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `login_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL UNIQUE,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  `pet_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `pet_type` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pet_sex` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pet_desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルの構造 `t_review`
--

CREATE TABLE `t_review` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `review_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

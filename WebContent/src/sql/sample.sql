-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2017 年 8 朁E28 日 02:10
-- サーバのバージョン： 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ec_db`
--
CREATE DATABASE 'MyWebSite';
USE MyWebSite;

-- --------------------------------------------------------

--
-- テーブルの構造 `m_delivery_method`
--

CREATE TABLE `m_delivery_method` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `m_delivery_method`
--

INSERT INTO `m_delivery_method` (`id`, `name`, `price`) VALUES
(1, '通常配送', 0),
(2, '日時指定配送', 200),
(3, '特急配送', 500);


-- --------------------------------------------------------

--
-- テーブルの構造 `m_item`
--

CREATE TABLE `m_item` (
  `id` int(11) NOT NULL,
  `category_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `first_file_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `second_file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `third_file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forth_file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `t_buy`
--

CREATE TABLE `t_buy` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `delivery_method_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `t_buy_detail`
--

CREATE TABLE `t_buy_detail` (
  `id` int(11) NOT NULL,
  `buy_id` int(11) NOT NULL,
  `item_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `item_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `t_user`
--

CREATE TABLE t_user
(
id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
name varchar(256) NOT NULL,
nickname VARCHAR(256) NOT NULL,
address  VARCHAR(256) NOT NULL,
login_id VARCHAR(256) NOT NULL,
password VARCHAR(256) NOT NULL,
create_date date NOT NULL,
update_date date NOT NULL,
pet_name varchar(256) NOT NULL,
pet_type varchar(256) DEFAULT NULL,
pet_sex varchar(256) DEFAULT NULL,
pet_desc varchar(256) DEFAULT NULL,
file_name varchar(256) DEFAULT NULL
);

CREATE TABLE t_user
(
id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
login_id VARCHAR(256) NOT NULL,
password VARCHAR(256) NOT NULL
);

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `login_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  `pet_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `pet_type` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pet_sex` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pet_desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

  INSERT INTO t_user (
  name,
  nickname,
  address,
  login_id,
  password,
  create_date,
  update_date,
  pet_name,
  pet_type,
  pet_sex,
  pet_desc,
  file_name
  ) VALUES
  ( 'sampleUser',
    'sampleNickname',
    'addressaddressaddressaddressaddressaddressaddressaddressaddress',
    'sample',
    'password',
    '1999-12-31 00:00:00',
    '1999-12-31 00:00:00',
    'petName',
    'petType',
    '♂',
    '植物由来の原料を主原料とした安心・安全なスペシャル低刺激な全犬種用のドッグシャンプーです。',
    'default.png'
  );
--
-- テーブルの構造 `t_review`
--

CREATE TABLE `t_review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `review_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_desc` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Indexes for table `m_delivery_method`
--
ALTER TABLE `m_delivery_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_item`
--
ALTER TABLE `m_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_buy`
--
ALTER TABLE `t_buy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_buy_detail`
--
ALTER TABLE `t_buy_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_pet`
--
ALTER TABLE `t_review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_delivery_method`
--
  ALTER TABLE `m_delivery_method`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_item`
--
ALTER TABLE `m_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_buy`
--
ALTER TABLE `t_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_buy_detail`
--
ALTER TABLE `t_buy_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;
--
-- AUTO_INCREMENT for table `t_review`
--
ALTER TABLE `t_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

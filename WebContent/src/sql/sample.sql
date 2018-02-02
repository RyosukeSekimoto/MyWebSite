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

INSERT INTO m_item (
category_name,
name,
Detail,
price,
first_file_name,
second_file_name,
third_file_name,
forth_file_name
) VALUES
('フード・おやつ',
'ナチュラルチョイスキャット 穀物フリー アダルトサーモン (ナチュラルフード)',
'愛猫の特別なニーズにあわせて、こだわりの製品設計で対応したスペシャルケアフード。',
'1161',
'1_01.jpg',
'1_02.jpg',
'1_03.jpg',
''
),
('キャットタワー',
'キャットスリー',
'カナダ生まれの次世代型キャットタワー。',
'27648',
'2_01.jpg',
'2_02.jpg',
'2_03.jpg',
'2_04.jpg'
),
('おもちゃ',
'カシャカシャぶんぶん',
'本能を刺激＆瞳がランラン！釣竿タイプ。',
'378',
'3_01.jpg',
'3_02.jpg',
'3_03.jpg',
'3_04.jpg'
),
('首輪',
'おうち首輪　プレーンカラー',
'軽くてやわらかく、おうちの中でも負担が少ない。もしもの時も安心な「迷子札がついたおうち専用首輪」。',
'1800',
'5_01.jpg',
'5_02.jpg',
'5_03.jpg',
'5_04.jpg',
),
( '爪とぎ',
'コーナー爪とぎボード',
'うちの子の大満足。大好きな角で爪とぎし放題。国産ダンボールで爪とぎ快適',
'2970',
'4_01.jpg',
'4_02.jpg',
'4_03.jpg',
'4_04.jpg'
),
('トイレ・猫砂',
'ワンマット (薄型トイレマット)',
'シーツがズレない！つまづきにくいトイレマット。',
'2700',
'6_01.jpg',
'6_02.jpg',
'6_03.jpg',
'6_04.jpg'
),
('猫雑貨',
'リサ・ラーソン　チェアーパッド',
'厚みしっかり。お尻にふわっとやさしいチェアパッド。',
'3240',
'7_01.jpg',
'7_02.jpg',
'7_03.jpg',
'7_04.jpg'
);

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

INSERT INTO t_review (
user_id,
item_id,
title,
review_desc,
file_name,
photo_desc,
create_date,
update_date
) VALUES
( 1,
  1,
  'これはサンプルのタイトルです。これはサンプルのタイトルです。これはサンプルのタイトルです。',
  '植物由来の原料を主原料とした安心・安全なスペシャル低刺激な全犬種用のドッグシャンプーです。',
  'reviewSample.jpg',
  '植物由来の原料を主原料とした安心・安全なスペシャル低刺激な全犬種用のドッグシャンプーです。',
  '1999-12-31 00:00:00',
  '1999-12-31 00:00:00'
);

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

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
'Feline Natural フリーズドライ チキン ベニソン',
'フィーラインナチュラルフリーズドライ100％ナチュラルで生食キャットフードは、ニュージーランドの厳選した食材のみを使用し、完全に無添加。人工の保存料・着色料・サプリメントや小麦・米・トウモロコシ・グルテン・大豆・シリアルなどの穀類や野菜・果物も一切使用していません。猫にとって、本当に必要なものだけでつくられました。',
'3006',
'food_01_01.jpg'
),
('フード・おやつ',
'ACANA Grasslands Cat',
'猫は元来肉食です。バラエティ豊かな肉を豊富に含み、少量のフルーツ、野菜、植物を含む食事に適した体の構造をしています。',
'1350',
'food_02_01.jpg'
),
('フード・おやつ',
'ACANA Pacifica Cat＆Kitten',
'カナダの昔ながらの自然を残した太平洋で豊富に獲れる海産物を活かし、アカナ パシフィカは太平洋サーモン、ニシン、カレイをたっぷり使用しています。すべてノースバンクーバー島から毎日新鮮な状態で搬送されています。',
'1161',
'food_03_01.jpg'
),
('フード・おやつ',
'ACANA Wild Prairie Cat＆Kitten',
'猫は元来肉食です。新鮮でバラエティ豊かな肉をたっぷり含み、フルーツと植物を少量配合した食事に適した体の構造をしています。',
'1350',
'food_04_01.jpg'
),
('フード・おやつ',
'【リニューアルキャンペーン 特別価格】オリジン キャット&キトゥン',
'子猫から高齢猫まで全ライフステージ用の総合栄養食。猫と子猫の進化的そして生物学的ニーズに合わせて、栄養豊富なたんぱく質を40%の割合で含み、低GI炭水化物を19%に制限しています。',
'1166',
'food_05_01.jpg'
),
('フード・おやつ',
'【リニューアルキャンペーン 特別価格】オリジン 6フィッシュ キャット',
'全ライフステージ・子猫から高齢猫まで。猫と子猫の進化的そして生物学的ニーズに合わせ、栄養豊富なたんぱく質が40%の割合であふれており、低GI炭水化物は18%に制限されています。',
'1166',
'food_06_01.jpg'
),
('フード・おやつ',
'【リニューアルキャンペーン 特別価格】オリジン レジオナルレッド　キャット',
'愛猫の特別なニーズにあわせて、こだわりの製品設計で対応したスペシャルケアフード。',
'1166',
'food_07_01.jpg'
),
('フード・おやつ',
'【リニューアルキャンペーン 20%OFF】オリジン フィット＆トリム　キャット',
'体調管理用。体重が増えすぎている猫には、健康のため、タンパク質が豊富で、適度な量の脂肪で炭水化物の量を制限した食事が必要です。',
'1166',
'food_08_01.jpg'
),
('フード・おやつ',
'ホリスティックブレンド　キャット　サーモン&チキン',
'放し飼い飼育の食肉用鳥肉とサーモンを吸収率の高いキレートミネラルや全粒、果実、抗酸化物質と合わせました。バランスのとれたオメガ6およびオメガ3脂肪酸が皮膚と毛並みを健康に整えます。',
'3456',
'food_09_01.jpg'
),
('フード・おやつ',
'ナチュラルチョイスキャット 穀物フリー アダルトサーモン (ナチュラルフード)',
'愛猫の特別なニーズにあわせて、こだわりの製品設計で対応したスペシャルケアフード。',
'1161',
'food_10_01.jpg'
),
('フード・おやつ',
'ホリスティックブレンド グレインフリーキャット　ターキー アンド チキン',
'七面鳥を主タンパク源に新鮮なサーモンオイルやシードオイル、炭水化物に栄養たっぷりの果物や野菜を原材料に使った穀物不使用（グレインフリー）のキャットフードです。合成着色料や香料、保存料を使用せず、時間をかけ低温で加熱したので栄養価の高くて安心なフードに仕上がりました。',
'3024',
'food_11_01.jpg'
),
('フード・おやつ',
'ホリスティックブレンド グレインフリーキャット マリン5 フィッシュブレンド',
'タラやシタビラメ、サーモンなど、新鮮な5 種類の魚を主タンパク源に、栄養たっぷりの果物や野菜を原材料に使った穀物不使用のキャットフードです。合成着色料や香料、保存料を使用せず、時間をかけて低温で加熱したので風味を損なわずに仕上げりました。',
'3564',
'food_12_01.jpg'
)
('キャットタワー',
'pecolo NEST CAT TOWER',
'猫は高いところに上るのが大好き。キャットタワーは猫にストレス解消と適度な運動をうながすのに最適なアイテムです。',
'83160',
'tower_01_01.jpg',
'tower_01_02.jpg',
'tower_01_03.jpg',
'tower_01_04.jpg'
),
('キャットタワー',
'キャットタワー　キャットランド　CLF-4',
'いつでも楽しく運動遊びができる、組み立て簡単、場所を取らずにコンパクトなキャットランドです。',
'5122',
'tower_02_01.jpg',
'tower_02_02.jpg'
),
('キャットタワー',
'ふかふか キャットタワー 3段',
'DCMカーマ、DCMダイキ、DCMホーマック、DCMサンワ、DCMくろがねや全国展開ホームセンターDCMグループのオリジナル商品です！',
'7538',
'tower_03_01.jpg'
),
('キャットタワー',
'プレイタワー 3',
'ネコのためのシステマティックなタワー。工具不要の簡単設置、自由なレイアウトが可能なネコの遊び場です。表面の生地は爪とぎに最適なヘンプ100％（麻）です。',
'21060',
'tower_04_01.jpg',
'tower_04_02.jpg',
'tower_04_03.jpg'
)
('おもちゃ',
'petit-OZABU　マタタビ×2',
'ドットと柄のプチオザブです。2個で１セットの座布団をモチーフにしたミニミニクッションです。表は赤と紺色のドット柄。裏は綿，麻混紡になっています。愛猫のオモチャとして、また、愛猫の気持ちを落ち着かせるための香り袋として ご利用下さい。 ',
'864',
'toy_01_01.jpg',
'toy_01_02.jpg'
),
'おもちゃ',
'OnTheBlanket supernuts マタタビ',
'香り袋入り猫用おもちゃです。ナッツの形がハグしやすく楽しく遊べます！２枚重ねの縫製なので丈夫で長持ちです。中には猫ちゃんの大好きな国産マタタビの入っています。 ',
'1646',
'toy_02_01.jpg',
'toy_02_02.jpg',
'toy_02_03.jpg'
)
'おもちゃ',
'petit-OZABU　マタタビ・キャットニップ',
'ドットと柄のプチオザブです。2個で１セットの座布団をモチーフにしたミニミニクッションです。 組み合わせが３種類ありますので下記補足説明にてご確認ください。 表は赤と紺色のドット柄。裏は綿，麻混紡になっています。愛猫のオモチャとして、また、愛猫の気持ちを落ち着かせるための香り袋として ご利用下さい。',
'864',
'toy_03_01.jpg',
'toy_03_02.jpg',
'toy_03_03.jpg'
)
('首輪',
'リボン猫首輪*ブロックチェック ピンク',
'柔らかく軽い、コットン素材のセーフティ猫首輪です。強い力が加わるとパチンと外れる安全バックルを使用しているので、猫ちゃんの首輪が何かにひっかかったときも安心です。',
'1650',
'neck_02_01.jpg',
'neck_02_02.jpg',
'neck_02_03.jpg'
)
( '爪とぎ',
'猫の爪とぎ 8角形型【プラザセレクト】',
'猫ちゃんが喜んで入るダンボール製ボックスです。鍋のような八角形の形がおしゃれなデザインです。八面体の側面が傾斜になっているので、大きな猫ちゃんでもゆったり入れます。国産素材を使っているので安心です。',
'269',
'arrow_03_01.jpg',
'arrow_03_02.jpg',
'arrow_03_03.jpg'
)
( '爪とぎ',
'ボンビ　ファニーキャッツ　ボール　《ボール型つめとぎ》【おもちゃ　爪とぎ　猫】',
'インテリアでも可愛いボール型つめとぎ、猫じゃらしも付いて楽しく遊んでストレス解消に。リニューアル等により予告なくパッケージ、容量等変更される場合がございます。',
'3150',
'arrow_02_01.jpg',
'arrow_02_02.jpg'
)
('トイレ・猫砂',
'Modkat Flip Paperboard Liner',
'猫トイレ【MODKATフリップリターボックス】の紙製取替用ライナー（ネコ砂袋）。Flip Replacement Tension Bandと一緒にご利用いただくことで猫砂が、本体とライナーの隙間に入りにくくなります。本体のセットには含まれておりませんのでお好みに合わせてターポリン素材の専用ライナーからお選びください。',
'3780',
'toiret_01_01.jpg',
'toiret_01_02.jpg',
'toiret_01_03.jpg'
)
('トイレ・猫砂',
'Flip Scoop',
'Modkoが提案するお洒落な猫用トイレ FlipLiterBox専用のスコップ。
スコップの先端がFlipLiterBox本体の形に合うように作られているので砂を逃すことなくすくう事が出来きます。',
'1080',
'toiret_02_01.jpg',
'toiret_02_02.jpg',
'toiret_02_03.jpg'
)
('猫雑貨',
'YOU+MORE!　猫のおなかナデナデ　スマートフォンポーチの会',
'スマートフォンを操作すると、にゃんこうっとりのおなかナデナデ状態に。透明シートの上からメールやネット検索ができます。猫のおなか画像をダウンロードしてホーム画面にセットすると、ナデナデ感がアップ♪',
'2200',
'goods_01_01.jpg',
'goods_01_02.jpg',
'goods_01_03.jpg'
)
('猫雑貨',
'YOU+MORE!　のぞいたらニャンと！猫と目があう目隠しトートバッグの会',
'同僚やお友だち、はたまた電車で隣り合わせた人まで目を見張る、猫入りのトート。中身を目隠ししながら視線をくぎ付けにするとは、何ともあまのじゃくな猫さんたち。ちょうどいいスペースに収まってゴキゲンだから、どこへでも一緒について行きまーす！',
'2900',
'goods_02_01.jpg',
'goods_02_02.jpg',
'goods_02_03.jpg',
'goods_02_04.jpg
)

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

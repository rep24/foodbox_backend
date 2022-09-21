# ************************************************************
# Sequel Ace SQL dump
# バージョン 20035
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# ホスト: localhost (MySQL 8.0.30)
# データベース: foodbox
# 生成時間: 2022-09-20 06:01:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ boxes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `boxes`;

CREATE TABLE `boxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `deadline` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `boxes` WRITE;
/*!40000 ALTER TABLE `boxes` DISABLE KEYS */;

INSERT INTO `boxes` (`id`, `user_id`, `food_id`, `memo`, `deadline`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'牛肉','2022-02-25','2022-09-13 03:37:17','2022-09-13 03:37:17'),
	(2,0,11,'さば','2022-02-22','2022-09-13 04:48:53','2022-09-13 04:48:53'),
	(4,0,98,'サンド','2022-01-15','2022-09-13 06:29:04','2022-09-13 06:29:12');

/*!40000 ALTER TABLE `boxes` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `body` varchar(512) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `delete_flg` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;

INSERT INTO `contacts` (`id`, `user_id`, `body`, `created_at`, `delete_flg`)
VALUES
	(1,0,'1回目のお問い合わせ','2022-09-13 03:37:30',0),
	(2,2,'お問い合わせ','2022-09-20 03:01:33',0),
	(3,3,'鹿肉を追加してください','2022-09-20 03:02:40',0),
	(4,3,'otoiawase!','2022-09-20 03:02:49',0),
	(5,5,'田中ですが。','2022-09-20 03:03:14',0),
	(6,1,'パスワードを忘れました','2022-09-20 03:04:11',0),
	(7,1,'パセリを追加して欲しいです。','2022-09-20 03:04:35',0),
	(8,1,'バナナは野菜ではないですか？','2022-09-20 03:04:55',1),
	(9,2,'お問い合わせ','2022-09-20 03:08:00',1);

/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ food
# ------------------------------------------------------------

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `category_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;

INSERT INTO `food` (`id`, `name`, `image`, `created_at`, `category_id`, `parent_id`, `updated_at`)
VALUES
	(1,'牛肉','https://cdn.pixabay.com/photo/2018/02/08/15/02/meat-3139641_960_720.jpg',NULL,275,10,NULL),
	(2,'豚肉','https://cdn.pixabay.com/photo/2016/01/05/09/48/pork-1122171_960_720.jpg\n',NULL,276,10,NULL),
	(3,'鶏肉','https://cdn.pixabay.com/photo/2014/03/05/01/20/chicken-breast-279848_960_720.jpg',NULL,277,10,NULL),
	(4,'ひき肉','https://cdn.pixabay.com/photo/2021/10/18/09/45/ground-beef-6720584_960_720.jpg\n',NULL,278,10,NULL),
	(5,'ベーコン','https://cdn.pixabay.com/photo/2020/02/24/06/00/fat-4875285_960_720.jpg\n',NULL,68,10,NULL),
	(6,'ソーセージ・ウインナー','https://cdn.pixabay.com/photo/2018/01/17/14/30/food-3088314_960_720.jpg\n',NULL,66,10,NULL),
	(7,'ハム','https://cdn.pixabay.com/photo/2015/04/06/18/06/ham-709724_960_720.jpg\n',NULL,67,10,NULL),
	(9,'サーモン・鮭','https://cdn.pixabay.com/photo/2016/03/05/19/02/salmon-1238248_960_720.jpg',NULL,70,11,NULL),
	(10,'いわし','https://cdn.pixabay.com/photo/2016/06/30/18/54/sardines-1489630_960_720.jpg',NULL,71,11,NULL),
	(11,'さば','https://cdn.pixabay.com/photo/2017/10/10/03/03/fish-2835760_960_720.jpg',NULL,72,11,NULL),
	(12,'あじ','https://cdn.pixabay.com/photo/2018/02/26/17/14/food-3183528_960_720.jpg\n',NULL,73,11,NULL),
	(13,'ぶり','https://3.bp.blogspot.com/-5ccEpI-5qwQ/VvXe5ps8DBI/AAAAAAAA5Jo/S_Kil6RUsCUx_4zZKZYqt2ZYh6w2lBMKw/s800/fish_buri2.png',NULL,74,11,NULL),
	(14,'さんま','https://cdn.pixabay.com/photo/2016/08/15/18/01/saury-1596028_960_720.jpg',NULL,75,11,NULL),
	(15,'鯛','https://cdn.pixabay.com/photo/2018/05/18/04/29/fish-3410329_960_720.png',NULL,76,11,NULL),
	(16,'マグロ','https://cdn.pixabay.com/photo/2012/12/11/12/02/thunnus-69319_960_720.jpg',NULL,77,11,NULL),
	(19,'いか','https://cdn.pixabay.com/photo/2016/04/24/21/40/italy-1350819_960_720.jpg\n',NULL,80,11,NULL),
	(20,'たこ','https://cdn.pixabay.com/photo/2016/04/24/22/45/sea-1350932_960_720.jpg',NULL,81,11,NULL),
	(21,'エビ','https://cdn.pixabay.com/photo/2016/03/05/19/46/asian-1238507_960_720.jpg',NULL,79,11,NULL),
	(22,'かに','https://cdn.pixabay.com/photo/2012/03/01/00/36/snow-crab-19745_960_720.jpg',NULL,83,11,NULL),
	(23,'牡蠣','https://cdn.pixabay.com/photo/2016/07/16/22/19/oyster-1522835_960_720.jpg',NULL,444,11,NULL),
	(25,'魚卵','https://cdn.pixabay.com/photo/2015/09/08/13/22/salmon-eggs-929923_960_720.jpg',NULL,445,11,NULL),
	(27,'なす','https://cdn.pixabay.com/photo/2016/10/01/14/10/eggplant-1707629_960_720.jpg\n',NULL,447,12,NULL),
	(28,'かぼちゃ','https://cdn.pixabay.com/photo/2015/10/13/15/36/sweet-pumpkin-986346_960_720.jpg',NULL,448,12,NULL),
	(29,'大根','https://cdn.pixabay.com/photo/2017/11/09/18/52/white-radish-2934281_960_720.jpg',NULL,449,12,NULL),
	(30,'きゅうり','https://cdn.pixabay.com/photo/2015/03/23/08/04/cucumber-685704_960_720.jpg',NULL,450,12,NULL),
	(31,'じゃがいも','https://cdn.pixabay.com/photo/2012/12/24/08/39/agriculture-72254_960_720.jpg',NULL,97,12,NULL),
	(32,'さつまいも','https://cdn.pixabay.com/photo/2016/03/10/09/11/sweet-potato-1248078_960_720.jpg',NULL,452,12,NULL),
	(33,'キャベツ','https://cdn.pixabay.com/photo/2017/09/01/19/20/white-cabbage-2705228_960_720.jpg',NULL,98,12,NULL),
	(34,'白菜','https://cdn.pixabay.com/photo/2019/05/14/08/01/beijing-cabbage-4201749_960_720.jpg',NULL,453,12,NULL),
	(35,'トマト','https://cdn.pixabay.com/photo/2016/08/01/17/08/tomatoes-1561565_960_720.jpg',NULL,454,12,NULL),
	(36,'もやし','https://cdn.pixabay.com/photo/2016/09/30/12/11/mung-beans-1705174_960_720.jpg',NULL,99,12,NULL),
	(38,'ほうれん草','https://cdn.pixabay.com/photo/2016/07/06/20/09/spinach-1501218_960_720.jpg',NULL,457,12,NULL),
	(39,'ごぼう','https://3.bp.blogspot.com/-qisN_fkkMag/UgsvTG3JctI/AAAAAAAAXUE/H7pl9SiqDvo/s800/vegetable_gobou.png',NULL,455,12,NULL),
	(40,'アボカド','https://cdn.pixabay.com/photo/2017/08/15/14/34/avocado-2644150_960_720.jpg',NULL,451,12,NULL),
	(41,'玉ねぎ','https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_960_720.jpg',NULL,96,12,NULL),
	(42,'ブロッコリー','https://cdn.pixabay.com/photo/2016/03/05/22/00/broccoli-1239149_960_720.jpg',NULL,458,12,NULL),
	(43,'にんじん','https://cdn.pixabay.com/photo/2010/12/13/10/25/orange-2794_960_720.jpg',NULL,95,12,NULL),
	(48,'きのこ','https://cdn.pixabay.com/photo/2014/07/10/20/55/mushrooms-389421_960_720.jpg',NULL,105,12,NULL),
	(49,'香味野菜','https://cdn.pixabay.com/photo/2018/05/16/10/38/basil-3405405_960_720.jpg',NULL,107,12,NULL),
	(98,'サンドイッチ','https://cdn.pixabay.com/photo/2017/05/10/17/27/sandwich-2301387_960_720.jpg',NULL,432,22,NULL),
	(99,'フレンチトースト','https://cdn.pixabay.com/photo/2017/10/09/21/25/french-toast-2834935_960_720.jpg',NULL,433,22,NULL),
	(100,'食パン','https://cdn.pixabay.com/photo/2016/08/25/06/47/bread-1618856_960_720.jpg',NULL,434,22,NULL),
	(101,'蒸しパン','https://cdn.pixabay.com/photo/2017/06/12/07/55/steamed-bread-2394664_960_720.jpg',NULL,435,22,NULL),
	(102,'ホットサンド','https://cdn.pixabay.com/photo/2022/02/12/21/36/sandwich-7009977_960_720.jpg',NULL,436,22,NULL),
	(103,'惣菜パン','https://cdn.pixabay.com/photo/2016/05/07/19/21/baguette-1378049_960_720.jpg',NULL,229,22,NULL),
	(104,'菓子パン','https://cdn.pixabay.com/photo/2016/05/26/16/27/cinnamon-rolls-1417494_960_720.jpg',NULL,221,22,NULL),
	(105,'プレーンなパン','https://cdn.pixabay.com/photo/2016/03/05/19/23/bread-1238384_960_720.jpg',NULL,220,22,NULL),
	(106,'クロワッサン・デニッシュ','https://cdn.pixabay.com/photo/2012/02/29/12/17/bread-18987_960_720.jpg',NULL,222,22,NULL),
	(107,'ハードブレッド','https://cdn.pixabay.com/photo/2016/10/22/17/10/bread-1761197_960_720.jpg',NULL,219,22,NULL),
	(108,'りんご','https://cdn.pixabay.com/photo/2016/07/09/12/16/apples-1506119_960_720.jpg',NULL,688,34,NULL),
	(109,'ゆず','https://cdn.pixabay.com/photo/2016/03/07/07/40/citron-1241690_960_720.jpg',NULL,459,34,NULL),
	(110,'柿','https://cdn.pixabay.com/photo/2016/06/14/10/16/persimmons-1456186_960_720.jpg',NULL,460,34,NULL),
	(111,'レモン','https://cdn.pixabay.com/photo/2018/03/14/15/12/lemon-3225459_960_720.jpg',NULL,461,34,NULL),
	(112,'バナナ','https://cdn.pixabay.com/photo/2017/01/03/11/25/banana-1949166_960_720.jpg',NULL,697,34,NULL),
	(113,'ブルーベリー','https://cdn.pixabay.com/photo/2018/06/07/16/38/blueberries-3460423_960_720.jpg',NULL,462,34,NULL),
	(114,'グレープフルーツ','https://cdn.pixabay.com/photo/2017/08/01/08/11/food-2563404_960_720.jpg',NULL,690,34,NULL),
	(115,'キウイ','https://cdn.pixabay.com/photo/2019/02/03/11/54/kiwi-3972417_960_720.jpg',NULL,691,34,NULL),
	(116,'オレンジ','https://cdn.pixabay.com/photo/2017/01/20/15/06/oranges-1995056_960_720.jpg',NULL,702,34,NULL);

/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(0,'admin','admin@example.com',NULL,'$2y$10$Fop50K8szCxtiKZu5X3oKeLvb6G8Bt3a705i5pvEjHrQ0Y0wUQKXC',NULL,'2022-09-13 03:36:18','2022-09-13 03:36:18'),
	(1,'user','user@example.com',NULL,'$2y$10$.lyFFz1elBGxh4Id6tw1wOc64yRkubsaECKtHYltwNUWJ853E.Uti',NULL,'2022-09-13 06:33:24','2022-09-13 06:33:24'),
	(2,'鈴木','suzuki@example.com',NULL,'$2y$10$/r5Z3QCxOLarTajGt/08ReEhyg/oL9fW2E3KWakhb3vIaGOLdkwd6',NULL,'2022-09-20 02:34:27','2022-09-20 02:34:27'),
	(3,'ササキ','sasaki@example.com',NULL,'$2y$10$gcX4YPVKryBcW6oFAZXNquqoI/eSxHexygdCzv0KN9E6y/rK0gjf.',NULL,'2022-09-20 02:34:59','2022-09-20 02:34:59'),
	(4,'sato','sato@example.com',NULL,'$2y$10$dNDgn5xF5URCyP/LRPznl.JA6spK2kSpVOtvgS5h8noxveUEqqEwG',NULL,'2022-09-20 02:39:15','2022-09-20 02:39:15'),
	(5,'田中','tanaka@example.com',NULL,'$2y$10$kmBXww/BS7tWCgm45m/ZVuF55YFO.JzlgiZDiiksmhARyIGqjW18a',NULL,'2022-09-20 02:39:56','2022-09-20 02:39:56'),
	(6,'KATO','kato@example.com',NULL,'$2y$10$isDgpxAiJtaBwhD0l2aZ7ur.DDtESwSP9G31pIMyjawkZvRziN0mW',NULL,'2022-09-20 02:40:26','2022-09-20 02:40:26'),
	(9,'test','test@example.com',NULL,'$2y$10$.lyFFz1elBGxh4Id6tw1wOc64yRkubsaECKtHYltwNUWJ853E.Uti',NULL,'2022-09-13 06:33:24','2022-09-13 06:33:24');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

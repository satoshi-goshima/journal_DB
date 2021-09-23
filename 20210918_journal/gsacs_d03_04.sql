-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-09-23 11:21:23
-- サーバのバージョン： 10.4.21-MariaDB
-- PHP のバージョン: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacs_d03_04`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `journal`
--

CREATE TABLE `journal` (
  `id` int(12) NOT NULL,
  `slip_date` date NOT NULL,
  `l_sub` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_money` int(12) NOT NULL,
  `r_sub` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `r_money` int(12) NOT NULL,
  `descri` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `journal`
--

INSERT INTO `journal` (`id`, `slip_date`, `l_sub`, `l_money`, `r_sub`, `r_money`, `descri`, `created_at`, `updated_at`) VALUES
(1, '2021-09-03', '会議費', 33000, '普通預金', 33000, 'どら焼き代', '2021-09-21 19:25:37', '2021-09-21 19:25:37'),
(2, '2021-09-23', '新聞図書費', 3300, '普通預金', 3300, 'いちご新聞', '2021-09-23 17:32:46', '2021-09-23 17:32:46'),
(3, '2021-09-01', '消耗品費', 29700, '普通預金', 29700, 'SONY WF-1000XM4', '2021-09-23 17:59:29', '2021-09-23 17:59:29'),
(4, '2021-09-08', '研究開発費', 55000, '普通預金', 55000, '食べてもなくならないどら焼きの開発（材料）', '2021-09-23 18:00:17', '2021-09-23 18:00:17'),
(5, '2021-10-10', '旅費交通費', 109000, '普通預金', 109000, '藤子・Ｆ・不二雄ミュージアム視察', '2021-09-23 18:05:49', '2021-09-23 18:05:49');

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(12) NOT NULL,
  `todo` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `todo`, `deadline`, `created_at`, `updated_at`) VALUES
(1, 'SQL練習', '2021-09-10', '2021-09-19 16:13:04', '2021-09-19 16:13:04'),
(2, '面接', '2021-09-11', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(3, '会計士対応', '2021-09-12', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(4, 'TOS改修', '2021-09-13', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(5, '補助金申請', '2021-09-14', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(6, '月次締め', '2021-09-15', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(7, 'シネマ飲食会議', '2021-09-16', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(8, '役員会', '2021-09-17', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(9, '景品選定', '2021-09-18', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(10, 'ボウリングMTG', '2021-09-19', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(11, '年休', '2021-09-20', '2021-09-19 17:46:09', '2021-09-19 17:46:09'),
(12, 'ドラえもーん', '2021-09-30', '2021-09-20 15:29:03', '2021-09-20 15:29:03'),
(13, 'ドラえもーん', '2021-09-21', '2021-09-23 17:14:00', '2021-09-23 17:14:00');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

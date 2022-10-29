-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 27 2022 г., 13:23
-- Версия сервера: 10.4.25-MariaDB
-- Версия PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tobola-db`
--

CREATE DATABASE IF NOT EXISTS `tobola-db`;

USE `tobola-db`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`) VALUES
(1, 'Рубашка', 'Описание рубашки'),
(2, 'Джинсовая рубашка', 'Описание джинсовой рубашки'),
(3, 'Рубашка с длинным рукавом', 'Описание рубашки с длинным рукавом'),
(4, 'Рубашка с коротким рукавом', 'Описание рубашки с коротким рукавом'),
(5, 'empty category', 'its empty');

-- --------------------------------------------------------

--
-- Структура таблицы `category_product`
--

CREATE TABLE `category_product` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category_product`
--

INSERT INTO `category_product` (`category_id`, `product_id`) VALUES
(1, 2),
(1, 4),
(1, 9),
(1, 11),
(1, 13),
(2, 1),
(2, 5),
(2, 6),
(2, 9),
(2, 12),
(2, 13),
(3, 1),
(3, 5),
(3, 6),
(3, 8),
(3, 10),
(4, 3),
(4, 7),
(4, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `url` varchar(2083) NOT NULL,
  `alt` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `url`, `alt`) VALUES
(1, 'https://a.lmcdn.ru/img600x866/R/T/RTLACA497401_18295021_1_v1_2x.jpg', 'alt1'),
(2, 'https://a.lmcdn.ru/img600x866/R/T/RTLACA497401_18295022_2_v1_2x.jpg', 'alt2'),
(3, 'https://a.lmcdn.ru/img600x866/R/T/RTLACA497401_18295024_4_v1_2x.jpg', 'alt3'),
(4, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM1RINE_15123968_4_v1_2x.jpg', 'alt4'),
(5, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UKZ_18322781_1_v2_2x.jpg', 'alt'),
(6, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UKZ_18322782_2_v2_2x.jpg', 'alt'),
(7, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UKZ_18322783_3_v2_2x.jpg', 'alt'),
(8, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UKZ_18322784_4_v2_2x.jpg', 'alt'),
(9, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM086GO_16747419_1_v1_2x.jpg', 'alt'),
(10, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM086GO_16747420_2_v1_2x.jpg', 'alt'),
(11, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM086GO_16747421_3_v1_2x.jpg', 'alt'),
(12, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM086GO_16747422_4_v1_2x.jpg', 'alt'),
(13, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08VAF_18322797_1_v2_2x.jpg', 'alt'),
(14, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08VAF_18322798_2_v2_2x.jpg', 'alt'),
(15, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08VAF_18322799_3_v2_2x.jpg', 'alt'),
(16, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08VAF_18322800_4_v2_2x.jpg', 'alt'),
(17, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UL2_18316648_1_v2_2x.jpg', 'alt'),
(18, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UL2_18316649_2_v2_2x.jpg', 'alt'),
(19, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UL2_18316650_3_v2_2x.jpg', 'alt'),
(20, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM08UL2_18316651_4_v2_2x.jpg', 'alt'),
(21, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM1RINE_15123965_1_v1_2x.jpg', 'alt'),
(22, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM1RINE_15123966_2_v1_2x.jpg', 'alt'),
(23, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM1RINE_15123967_3_v1_2x.jpg', 'alt');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(64) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `price` float NOT NULL,
  `price_discount` float NOT NULL,
  `price_promo` float NOT NULL,
  `description` text NOT NULL,
  `main_category_id` int(10) UNSIGNED NOT NULL,
  `main_image_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `active`, `price`, `price_discount`, `price_promo`, `description`, `main_category_id`, `main_image_id`) VALUES
(1, 'DeFacto', 1, 1799, 1700, 1300, 'desc', 1, 3),
(2, 'Brave Soul', 0, 2499, 1990, 1900, 'desc', 2, 1),
(3, 'Colin\'s', 1, 3290, 3200, 2800, 'desc', 3, 3),
(4, 'Mossmore', 1, 9990, 4990, 4000, 'desc', 4, 4),
(5, 'DeFacto', 1, 2299, 2000, 1990, 'desc', 4, 7),
(6, 'Velocity', 1, 6400, 3840, 3500, 'desc', 1, 9),
(7, 'Velocity', 0, 6450, 3900, 3850, 'desc', 2, 11),
(8, 'Lyle and Scott', 1, 5990, 3777, 3777, 'desc', 2, 13),
(9, 'DeFacto', 1, 2299, 2999, 2999, 'desc', 3, 4),
(10, 'Mango Man', 1, 8299, 8299, 8299, 'desc', 4, 1),
(11, 'Colin\'s', 0, 2990, 971, 971, 'desc', 4, 7),
(12, 'Velocity', 1, 5200, 3120, 3000, 'desc', 3, 8),
(13, 'Colin\'s', 1, 3490, 2120, 2120, 'desc', 4, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `product_image`
--

CREATE TABLE `product_image` (
  `product_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product_image`
--

INSERT INTO `product_image` (`product_id`, `image_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 1),
(6, 2),
(6, 3),
(7, 4),
(7, 5),
(7, 6),
(8, 7),
(8, 8),
(8, 9),
(9, 10),
(9, 11),
(9, 12),
(10, 1),
(10, 2),
(10, 3),
(11, 4),
(11, 5),
(11, 6),
(12, 7),
(12, 8),
(12, 9),
(13, 1),
(13, 2),
(13, 10);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Индексы таблицы `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`category_id`,`product_id`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`) USING HASH;

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`product_id`,`image_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 01 2022 г., 05:34
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
(1, 'Рубашка', 'Внезапно, сделанные на базе интернет-аналитики выводы объединены в целые кластеры себе подобных.'),
(2, 'Джинсовая рубашка', 'Прежде всего, постоянный количественный рост и сфера нашей активности способствует подготовке и реализации глубокомысленных рассуждений!'),
(3, 'Рубашка с длинным рукавом', 'Мы вынуждены отталкиваться от того, что курс на социально-ориентированный национальный проект предопределяет высокую востребованность стандартных подходов.'),
(4, 'Рубашка с коротким рукавом', 'Равным образом, базовый вектор развития напрямую зависит от поставленных обществом задач.'),
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
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
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
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `date_of_birth` date NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `point` text NOT NULL,
  `agree` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `date_of_birth`, `sex`, `subject`, `point`, `agree`) VALUES
(24, 'kirill', 'kirilltobola@gmail.com', '2022-10-24', 0, 'test', 'test', 1);

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
(1, 'DeFacto', 1, 1799, 1700, 1300, 'Противоположная точка зрения подразумевает, что активно развивающиеся страны третьего мира описаны максимально подробно.', 1, 3),
(2, 'Brave Soul', 0, 2499, 1990, 1900, 'Учитывая ключевые сценарии поведения, экономическая повестка сегодняшнего дня однозначно фиксирует необходимость глубокомысленных рассуждений.', 2, 1),
(3, 'Colin\'s', 1, 3290, 3200, 2800, 'Идейные соображения высшего порядка, а также начало повседневной работы по формированию позиции обеспечивает актуальность новых предложений.', 3, 3),
(4, 'Mossmore', 1, 9990, 4990, 4000, 'Банальные, но неопровержимые выводы, а также ключевые особенности структуры проекта формируют глобальную экономическую сеть и при этом — ассоциативно распределены по отраслям.', 4, 4),
(5, 'DeFacto', 1, 2299, 2000, 1990, 'Однозначно, многие известные личности являются только методом политического участия и смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности.', 4, 7),
(6, 'Velocity', 1, 6400, 3840, 3500, 'Учитывая ключевые сценарии поведения, семантический разбор внешних противодействий позволяет оценить значение благоприятных перспектив.', 1, 9),
(7, 'Velocity', 0, 6450, 3900, 3850, 'В целом, конечно, высокотехнологичная концепция общественного уклада играет определяющее значение для первоочередных требований.', 2, 11),
(8, 'Lyle and Scott', 1, 5990, 3777, 3777, 'Наше дело не так однозначно, как может показаться: социально-экономическое развитие обеспечивает актуальность модели развития.', 2, 13),
(9, 'DeFacto', 1, 2299, 2999, 2999, 'Прежде всего, существующая теория напрямую зависит от первоочередных требований.', 3, 4),
(10, 'Mango Man', 1, 8299, 8299, 8299, 'Следует отметить, что высокое качество позиционных исследований предопределяет высокую востребованность переосмысления внешнеэкономических политик.', 4, 1),
(11, 'Colin\'s', 0, 2990, 971, 971, 'Лишь предприниматели в сети интернет освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, указаны как претенденты на роль ключевых факторов.', 4, 7),
(12, 'Velocity', 1, 5200, 3120, 3000, 'Мы вынуждены отталкиваться от того, что выбранный нами инновационный путь предопределяет высокую востребованность экономической целесообразности принимаемых решений.', 3, 8),
(13, 'Colin\'s', 1, 3490, 2120, 2120, 'Внезапно, ключевые особенности структуры проекта смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности.', 4, 10),
(17, 'Cassa Marina', 1, 1678, 1344, 1200, 'Мы вынуждены отталкиваться от того, что существующая теория требует от нас анализа новых принципов формирования материально-технической и кадровой базы.', 1, 3),
(18, '20Line', 1, 3560, 1200, 1000, 'Являясь всего лишь частью общей картины, предприниматели в сети интернет освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, объективно рассмотрены соответствующими инстанциями.', 1, 6),
(19, 'Lucky Strong', 1, 5140, 3600, 2999, 'Внезапно, некоторые особенности внутренней политики, инициированные исключительно синтетически, превращены в посмешище, хотя само их существование приносит несомненную пользу обществу.', 1, 7);

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
(10, 2),
(10, 3),
(11, 4),
(11, 5),
(11, 6),
(12, 7),
(12, 9),
(13, 1),
(13, 2);

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
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

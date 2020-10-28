-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 10.15.3.2:3306
-- Время создания: Окт 28 2020 г., 17:01
-- Версия сервера: 5.6.37-log
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dem-auto`
--

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_cat`
--

CREATE TABLE `product_to_cat` (
  `id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_to_cat`
--

INSERT INTO `product_to_cat` (`id`, `prod_id`, `cat_id`) VALUES
(1, 11, 1),
(2, 11, 5),
(3, 11, 6),
(4, 12, 1),
(5, 12, 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `product_to_cat`
--
ALTER TABLE `product_to_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product_to_cat`
--
ALTER TABLE `product_to_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

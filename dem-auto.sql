-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 26 2020 г., 23:23
-- Версия сервера: 5.7.23-log
-- Версия PHP: 7.2.10

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
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(250) NOT NULL,
  `cat_parent` int(11) NOT NULL DEFAULT '0',
  `cat_url` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_descr` text NOT NULL,
  `cat_child` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `cat_parent`, `cat_url`, `meta_title`, `meta_descr`, `cat_child`, `status`) VALUES
(1, 'Мебель', 0, 'mebel/', '', '', 0, 1),
(2, 'Телефоны', 0, 'telephone/', '', '', 0, 1),
(3, 'Кухня', 0, 'kitchen/', '', '', 0, 1),
(4, 'Телевизоры', 0, 'tv/', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `prod_name` varchar(250) NOT NULL,
  `prod_descr` text NOT NULL,
  `prod_url` varchar(250) NOT NULL,
  `prod_price` int(11) NOT NULL DEFAULT '0',
  `prod_count` int(11) NOT NULL DEFAULT '1',
  `category_id` varchar(250) NOT NULL COMMENT 'список категорий в json формате',
  `prod_image` varchar(250) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_parent` (`cat_parent`),
  ADD KEY `status` (`status`),
  ADD KEY `cat_child` (`cat_child`),
  ADD KEY `cat_name` (`cat_name`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_name` (`prod_name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 10.15.3.2:3306
-- Время создания: Окт 27 2020 г., 16:55
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
(4, 'Телевизоры', 0, 'tv/', '', '', 0, 1),
(5, 'Стулья', 1, 'chair/', '', '', 0, 1),
(6, 'Столы', 1, 'table/', '', '', 0, 1),
(7, 'Шкафы', 1, 'shkafy/', '', '', 0, 1),
(8, 'Мягкая мебель', 1, 'soft-mebel/', '', '', 0, 1),
(9, 'Nokia', 2, 'nokia', '', '', 0, 1),
(10, 'Samsung', 2, 'smasung/', '', '', 0, 1),
(11, 'Alcatel', 2, 'alcatel/', '', '', 0, 1),
(12, 'Huawei', 2, 'huawei/', '', '', 0, 1),
(13, 'Холодильники', 3, 'refrigerator/', '', '', 0, 1),
(14, 'Печки', 3, 'pechki/', '', '', 0, 1),
(15, 'Вытяжки', 3, 'vytyajki/', '', '', 0, 1),
(16, 'Раковины', 3, 'rakoviny/', '', '', 0, 1),
(17, 'Philips', 4, 'philips/', '', '', 0, 1),
(18, 'Samsung', 4, 'samsung/', '', '', 0, 1),
(19, 'HTC', 4, 'htc/', '', '', 0, 1),
(20, 'Grundig', 4, 'grundig/', '', '', 0, 1);

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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

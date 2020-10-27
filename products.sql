-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 27 2020 г., 23:29
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
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `prod_name` varchar(250) NOT NULL,
  `prod_descr` text NOT NULL,
  `prod_price` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(250) NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `prod_name`, `prod_descr`, `prod_price`, `meta_title`, `meta_description`) VALUES
(1, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit. Pellentesque at lectus eget elit viverra cursus. Suspendisse vitae quam urna. Vivamus facilisis ligula at tellus egestas pellentesque. Sed tempus enim urna, non iaculis nisi viverra sit amet. Donec at sem ut nibh ultrices posuere. Nulla facilisi. Sed auctor viverra elit, in iaculis massa gravida id. Aliquam ac tincidunt massa, id pharetra magna. Duis ut scelerisque dolor, sit amet ultricies purus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit. Pellentesque at lectus eget elit viverra cursus. Suspendisse vitae quam urna. Vivamus facilisis ligula at tellus egestas pellentesque. Sed tempus enim urna, non iaculis nisi viverra sit amet. Donec at sem ut nibh ultrices posuere. Nulla facilisi. Sed auctor viverra elit, in iaculis massa gravida id. Aliquam ac tincidunt massa, id ', 100, 'Стул 23-20', '');

--
-- Индексы сохранённых таблиц
--

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
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

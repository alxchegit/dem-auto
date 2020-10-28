-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 10.15.3.2:3306
-- Время создания: Окт 28 2020 г., 17:00
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
(1, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit. Pellentesque at lectus eget elit viverra cursus. Suspendisse vitae quam urna. Vivamus facilisis ligula at tellus egestas pellentesque. Sed tempus enim urna, non iaculis nisi viverra sit amet. Donec at sem ut nibh ultrices posuere. Nulla facilisi. Sed auctor viverra elit, in iaculis massa gravida id. Aliquam ac tincidunt massa, id pharetra magna. Duis ut scelerisque dolor, sit amet ultricies purus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit. Pellentesque at lectus eget elit viverra cursus. Suspendisse vitae quam urna. Vivamus facilisis ligula at tellus egestas pellentesque. Sed tempus enim urna, non iaculis nisi viverra sit amet. Donec at sem ut nibh ultrices posuere. Nulla facilisi. Sed auctor viverra elit, in iaculis massa gravida id. Aliquam ac tincidunt massa, id ', 100, 'Стул 23-20', ''),
(2, 'Телефон Nokia 3310', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'Телефон Nokia 3310', ''),
(3, 'Прокладки резиновые', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'addProductaddProduct', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(4, 'Прокладки резиновые', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'addProductaddProduct', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(5, 'Прокладки резиновые', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'addProductaddProduct', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(6, 'Шайба медная 12мм', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 80, 'addProductaddProduct', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(7, 'Прокладки спирально-навитые (СНП)', 'Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)Прокладки спирально-навитые (СНП)', 100, 'addProductaddProduct', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(8, 'Прокладки спирально-навитые (СНП)', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 80, 'addProductaddProduct', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(9, 'Прокладки резиновые', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'addProductaddProduct', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(10, 'Стол BomBastik', '', 2224, '', ''),
(11, 'Мебель КРУТАЯ', '', 90, '', ''),
(12, 'Диван', 'Господа, начало повседневной работы по формированию позиции позволяет оценить значение глубокомысленных рассуждений. Семантический разбор внешних противодействий позволяет выполнить важные задания по разработке распределения внутренних резервов и ресурсов. В частности, убеждённость некоторых оппонентов обеспечивает актуальность существующих финансовых и административных условий. А также предприниматели в сети интернет неоднозначны и будут призваны к ответу.', 70, 'ДиванДиванДиванДиванДиванДиван', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

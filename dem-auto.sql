-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 29 2020 г., 23:25
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
(1, 'первый товар первый', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit. Pellentesque at lectus eget elit viverra cursus. Suspendisse vitae quam urna. Vivamus facilisis ligula at tellus egestas pellentesque. Sed tempus enim urna, non iaculis nisi viverra sit amet. Donec at sem ut nibh ultrices posuere. Nulla facilisi. Sed auctor viverra elit, in iaculis massa gravida id. Aliquam ac tincidunt massa, id pharetra magna. Duis ut scelerisque dolor, sit amet ultricies purus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit. Pellentesque at lectus eget elit viverra cursus. Suspendisse vitae quam urna. Vivamus facilisis ligula at tellus egestas pellentesque. Sed tempus enim urna, non iaculis nisi viverra sit amet. Donec at sem ut nibh ultrices posuere. Nulla facilisi. Sed auctor viverra elit, in iaculis massa gravida id. Aliquam ac tincidunt massa, id ', 100, 'Стул 23-20', 'мета дескрипшен '),
(2, 'Телефон Nokia 3310', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'Телефон Nokia 3310', 'Телефон Nokia 3310 очень класный'),
(5, 'Подлокотники резиновые', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'Подлокотники резиновые по супер низким ценам', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(9, 'Прокладки резиновые черные', 'Внезапно, элементы политического процесса, инициированные исключительно синтетически, призваны к ответу. Ясность нашей позиции очевидна: сложившаяся структура организации однозначно определяет каждого участника как способного принимать собственные решения касаемо форм воздействия. В частности, дальнейшее развитие различных форм деятельности обеспечивает актуальность как самодостаточных, так и внешне зависимых концептуальных решений.', 90, 'Прокладки резиновые черные в Москве', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies rhoncus sagittis. Cras accumsan pulvinar nulla in hendrerit.'),
(10, 'Стол BomBastik', 'Описание Описание Описание Описание Описание Описание Описание Описание Описание ', 2224, 'Стол BomBastik Мета-тег Title:', 'Стол BomBastik Description'),
(11, 'Мебель КРУТАЯ', 'Являясь всего лишь частью общей картины, элементы политического процесса обнародованы. Как принято считать, реплицированные с зарубежных источников, современные исследования, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут рассмотрены исключительно в разрезе маркетинговых и финансовых предпосылок. Как принято считать, диаграммы связей являются только методом политического участия и описаны максимально подробно. Являясь всего лишь частью общей картины, сделанные на базе интернет-аналитики выводы смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. А также независимые государства могут быть объявлены нарушающими общечеловеческие нормы этики и морали. Каждый из нас понимает очевидную вещь: укрепление и развитие внутренней структуры представляет собой интересный эксперимент проверки существующих финансовых и административных условий.', 90, 'Мебель крутатенечка по нижайшим ценам', 'Мебель КРУТАЯ хорошая дорогая'),
(12, 'Диван', 'Господа, начало повседневной работы по формированию позиции позволяет оценить значение глубокомысленных рассуждений. Семантический разбор внешних противодействий позволяет выполнить важные задания по разработке распределения внутренних резервов и ресурсов. В частности, убеждённость некоторых оппонентов обеспечивает актуальность существующих финансовых и административных условий. А также предприниматели в сети интернет неоднозначны и будут призваны к ответу.', 70, 'Диван на все случаи жизни', 'Диван на все случаи жизни'),
(14, 'Новый стул', 'Постоянный количественный рост и сфера нашей активности в значительной степени обусловливает важность как самодостаточных, так и внешне зависимых концептуальных решений. Следует отметить, что выбранный нами инновационный путь выявляет срочную потребность системы обучения кадров, соответствующей насущным потребностям. Повседневная практика показывает, что внедрение современных методик обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач. Принимая во внимание показатели успешности, высокотехнологичная концепция общественного уклада в значительной степени обусловливает важность вывода текущих активов.', 90, 'Телефон Nokia 3310', ''),
(15, 'Современный НЕ SAMSUNG', 'Есть над чем задуматься: представители современных социальных резервов превращены в посмешище, хотя само их существование приносит несомненную пользу обществу. Предварительные выводы неутешительны: понимание сути ресурсосберегающих технологий играет определяющее значение для как самодостаточных, так и внешне зависимых концептуальных решений. В своём стремлении повысить качество жизни, они забывают, что сложившаяся структура организации позволяет оценить значение вывода текущих активов.', 41, 'Телефон Samsung 3310', 'Телефоны Samsung  очень классные');

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
(8, 14, 1),
(9, 14, 5),
(10, 14, 6),
(11, 1, 1),
(12, 1, 5),
(13, 1, 6),
(14, 2, 2),
(15, 2, 9),
(26, 9, 1),
(27, 9, 5),
(28, 5, 1),
(29, 5, 5),
(30, 5, 6),
(33, 10, 1),
(34, 10, 6),
(35, 11, 1),
(36, 11, 7),
(37, 12, 1),
(38, 12, 8),
(43, 15, 2),
(44, 15, 4),
(45, 15, 18);

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
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `product_to_cat`
--
ALTER TABLE `product_to_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Erstellungszeit: 31. Jan 2017 um 22:59
-- Server-Version: 10.0.28-MariaDB-0+deb8u1
-- PHP-Version: 5.6.27-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `423_steigerungserlaubnisskalktulator`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `steigerungstabelle`
--

CREATE TABLE IF NOT EXISTS `steigerungstabelle` (
  `id` int(11) NOT NULL,
  `stufe` int(11) NOT NULL,
  `komplex` int(11) NOT NULL,
  `frei` int(11) NOT NULL,
  `se` int(11) NOT NULL,
  `erlaubnis` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `steigerungstabelle`
--

INSERT INTO `steigerungstabelle` (`id`, `stufe`, `komplex`, `frei`, `se`, `erlaubnis`) VALUES
(1, 4, 1, 10, 5, 1),
(2, 6, 1, 15, 8, 2),
(3, 8, 1, 22, 11, 2),
(4, 10, 1, 33, 17, 3),
(5, 12, 1, 50, 25, 5),
(6, 14, 1, 75, 38, 8),
(7, 16, 1, 113, 56, 12),
(8, 18, 1, 170, 85, 17),
(9, 20, 1, 255, 128, 26),
(10, 22, 1, 383, 192, 38),
(11, 24, 1, 575, 288, 58),
(12, 26, 1, 863, 432, 86),
(13, 28, 1, 1295, 648, 130),
(14, 30, 1, 1943, 972, 194),
(15, 32, 1, 2915, 1458, 292),
(16, 4, 2, 15, 8, 2),
(17, 6, 2, 22, 11, 2),
(18, 8, 2, 33, 17, 3),
(19, 10, 2, 50, 25, 5),
(20, 12, 2, 75, 38, 8),
(21, 14, 2, 113, 56, 12),
(22, 16, 2, 170, 85, 17),
(23, 18, 2, 255, 128, 26),
(24, 20, 2, 383, 192, 38),
(25, 22, 2, 575, 288, 58),
(26, 24, 2, 863, 432, 86),
(27, 26, 2, 1295, 648, 130),
(28, 28, 2, 1943, 972, 194),
(29, 30, 2, 2915, 1458, 292),
(30, 32, 2, 4373, 2186, 427),
(31, 4, 3, 22, 11, 2),
(32, 6, 3, 33, 17, 3),
(33, 8, 3, 50, 25, 5),
(34, 10, 3, 75, 38, 8),
(35, 12, 3, 113, 56, 12),
(36, 14, 3, 170, 85, 17),
(37, 16, 3, 255, 128, 26),
(38, 18, 3, 383, 192, 38),
(39, 20, 3, 575, 288, 58),
(40, 22, 3, 863, 432, 86),
(41, 24, 3, 1295, 348, 130),
(42, 26, 3, 1943, 972, 194),
(43, 28, 3, 2915, 1458, 292),
(44, 30, 3, 4373, 2186, 427),
(45, 32, 3, 6560, 3280, 656),
(46, 4, 4, 33, 17, 3),
(47, 6, 4, 50, 25, 5),
(48, 8, 4, 75, 38, 8),
(49, 10, 4, 113, 56, 12),
(50, 12, 4, 170, 85, 17),
(51, 14, 4, 255, 128, 26),
(52, 16, 4, 383, 192, 38),
(53, 18, 4, 575, 288, 58),
(54, 20, 4, 863, 432, 86),
(55, 22, 4, 1295, 648, 130),
(56, 24, 4, 1943, 1458, 292),
(57, 26, 4, 2915, 1458, 292),
(58, 28, 4, 4373, 2186, 437),
(59, 30, 4, 6560, 3280, 656),
(60, 32, 4, 9840, 4920, 984),
(61, 4, 5, 50, 25, 5),
(62, 6, 5, 75, 38, 8),
(63, 8, 5, 113, 56, 12),
(64, 10, 5, 170, 85, 17),
(65, 12, 5, 255, 128, 26),
(66, 14, 5, 383, 192, 38),
(67, 16, 5, 575, 288, 58),
(68, 18, 5, 863, 432, 86),
(69, 20, 5, 1295, 648, 130),
(70, 22, 5, 1943, 972, 194),
(71, 24, 5, 2915, 1458, 292),
(72, 26, 5, 4373, 2186, 437),
(73, 28, 5, 6560, 3280, 656),
(74, 30, 5, 9840, 4920, 984),
(75, 32, 5, 14760, 7380, 1476),
(76, 4, 6, 75, 38, 8),
(77, 6, 6, 113, 58, 12),
(78, 8, 6, 170, 85, 17),
(79, 10, 6, 255, 128, 26),
(80, 12, 6, 363, 192, 38),
(81, 14, 6, 575, 288, 58),
(82, 16, 6, 863, 432, 86),
(83, 18, 6, 1295, 648, 130),
(84, 20, 6, 1943, 1458, 292),
(85, 22, 6, 2915, 1458, 292),
(86, 24, 6, 4373, 2186, 437),
(87, 26, 6, 6560, 3280, 656),
(88, 28, 6, 9840, 4920, 984),
(89, 30, 6, 14760, 7380, 1476),
(90, 32, 6, 22140, 11070, 2214),
(91, 4, 7, 113, 58, 12),
(92, 6, 7, 170, 95, 17),
(93, 8, 7, 255, 128, 26),
(94, 10, 7, 363, 192, 38),
(95, 12, 7, 575, 288, 58),
(96, 14, 7, 863, 432, 86),
(97, 16, 7, 1295, 648, 130),
(98, 18, 7, 1943, 972, 194),
(99, 20, 7, 2915, 1458, 292),
(100, 22, 7, 4373, 2186, 437),
(101, 24, 7, 6560, 3280, 656),
(102, 26, 7, 9860, 4960, 984),
(103, 28, 7, 14760, 7380, 1476),
(104, 30, 7, 22140, 11070, 2214),
(105, 32, 7, 33210, 15505, 3321),
(106, 4, 8, 170, 85, 17),
(107, 6, 8, 255, 128, 26),
(108, 8, 8, 363, 182, 38),
(109, 10, 8, 575, 255, 58),
(110, 12, 8, 863, 432, 86),
(111, 14, 8, 1295, 648, 130),
(112, 16, 8, 1943, 972, 196),
(113, 18, 8, 2915, 1458, 292),
(114, 20, 8, 4373, 2186, 437),
(115, 22, 8, 6560, 3280, 656),
(116, 24, 8, 9840, 4920, 986),
(117, 26, 8, 14760, 7380, 1476),
(118, 28, 8, 22140, 11070, 2214),
(119, 30, 8, 33210, 15505, 3321),
(120, 32, 8, 49815, 24908, 4982),
(121, 4, 0, 6, 3, 1),
(122, 6, 0, 10, 5, 1),
(123, 8, 0, 15, 8, 2),
(124, 10, 0, 22, 11, 2),
(125, 12, 0, 33, 17, 3),
(126, 14, 0, 50, 25, 5),
(127, 16, 0, 75, 38, 8),
(128, 18, 0, 113, 56, 12),
(129, 20, 0, 170, 85, 17),
(130, 22, 0, 255, 128, 26),
(131, 24, 0, 383, 182, 38),
(132, 26, 0, 575, 288, 58),
(133, 28, 0, 863, 432, 86),
(134, 30, 0, 1295, 648, 130),
(135, 32, 0, 1943, 972, 194),
(136, 0, 1, 10, 5, 1),
(137, 5, 1, 15, 8, 2),
(138, 7, 1, 22, 11, 2),
(139, 9, 1, 33, 17, 3),
(140, 11, 1, 50, 25, 5),
(141, 13, 1, 75, 38, 8),
(142, 15, 1, 113, 56, 12),
(143, 17, 1, 170, 85, 17),
(144, 19, 1, 255, 128, 26),
(145, 21, 1, 383, 192, 38),
(146, 23, 1, 575, 288, 58),
(147, 25, 1, 863, 432, 86),
(148, 27, 1, 1295, 648, 130),
(149, 29, 1, 1943, 972, 194),
(150, 31, 1, 2915, 1458, 292),
(151, 0, 2, 15, 8, 2),
(152, 5, 2, 22, 11, 2),
(153, 7, 2, 33, 17, 3),
(154, 9, 2, 50, 25, 5),
(155, 11, 2, 75, 38, 8),
(156, 13, 2, 113, 56, 12),
(157, 15, 2, 170, 85, 17),
(158, 17, 2, 255, 128, 26),
(159, 19, 2, 383, 192, 38),
(160, 21, 2, 575, 288, 58),
(161, 23, 2, 863, 432, 86),
(162, 25, 2, 1295, 648, 130),
(163, 27, 2, 1943, 972, 194),
(164, 29, 2, 2915, 1458, 292),
(165, 31, 2, 4373, 2186, 427),
(166, 0, 3, 22, 11, 2),
(167, 5, 3, 33, 17, 3),
(168, 7, 3, 50, 25, 5),
(169, 9, 3, 75, 38, 8),
(170, 11, 3, 113, 56, 12),
(171, 13, 3, 170, 85, 17),
(172, 15, 3, 255, 128, 26),
(173, 17, 3, 383, 192, 38),
(174, 19, 3, 575, 288, 58),
(175, 21, 3, 863, 432, 86),
(176, 23, 3, 1295, 348, 130),
(177, 25, 3, 1943, 972, 194),
(178, 27, 3, 2915, 1458, 292),
(179, 29, 3, 4373, 2186, 427),
(180, 31, 3, 6560, 3280, 656),
(181, 0, 4, 33, 17, 3),
(182, 5, 4, 50, 25, 5),
(183, 7, 4, 75, 38, 8),
(184, 9, 4, 113, 56, 12),
(185, 11, 4, 170, 85, 17),
(186, 13, 4, 255, 128, 26),
(187, 15, 4, 383, 192, 38),
(188, 17, 4, 575, 288, 58),
(189, 19, 4, 863, 432, 86),
(190, 21, 4, 1295, 648, 130),
(191, 23, 4, 1943, 1458, 292),
(192, 25, 4, 2915, 1458, 292),
(193, 27, 4, 4373, 2186, 437),
(194, 29, 4, 6560, 3280, 656),
(195, 31, 4, 9840, 4920, 984),
(196, 0, 5, 50, 25, 5),
(197, 5, 5, 75, 38, 8),
(198, 7, 5, 113, 56, 12),
(199, 9, 5, 170, 85, 17),
(200, 11, 5, 255, 128, 26),
(201, 13, 5, 383, 192, 38),
(202, 15, 5, 575, 288, 58),
(203, 17, 5, 863, 432, 86),
(204, 19, 5, 1295, 648, 130),
(205, 21, 5, 1943, 972, 194),
(206, 23, 5, 2915, 1458, 292),
(207, 25, 5, 4373, 2186, 437),
(208, 27, 5, 6560, 3280, 656),
(209, 29, 5, 9840, 4920, 984),
(210, 31, 5, 14760, 7380, 1476),
(211, 0, 6, 75, 38, 8),
(212, 5, 6, 113, 58, 12),
(213, 7, 6, 170, 85, 17),
(214, 9, 6, 255, 128, 26),
(215, 11, 6, 363, 192, 38),
(216, 13, 6, 575, 288, 58),
(217, 15, 6, 863, 432, 86),
(218, 17, 6, 1295, 648, 130),
(219, 19, 6, 1943, 1458, 292),
(220, 21, 6, 2915, 1458, 292),
(221, 23, 6, 4373, 2186, 437),
(222, 25, 6, 6560, 3280, 656),
(223, 27, 6, 9840, 4920, 984),
(224, 29, 6, 14760, 7380, 1476),
(225, 31, 6, 22140, 11070, 2214),
(226, 0, 7, 113, 58, 12),
(227, 5, 7, 170, 95, 17),
(228, 7, 7, 255, 128, 26),
(229, 9, 7, 363, 192, 38),
(230, 11, 7, 575, 288, 58),
(231, 13, 7, 863, 432, 86),
(232, 15, 7, 1295, 648, 130),
(233, 17, 7, 1943, 972, 194),
(234, 19, 7, 2915, 1458, 292),
(235, 21, 7, 4373, 2186, 437),
(236, 23, 7, 6560, 3280, 656),
(237, 25, 7, 9860, 4960, 984),
(238, 27, 7, 14760, 7380, 1476),
(239, 29, 7, 22140, 11070, 2214),
(240, 31, 7, 33210, 15505, 3321),
(241, 0, 8, 170, 85, 17),
(242, 5, 8, 255, 128, 26),
(243, 7, 8, 363, 182, 38),
(244, 9, 8, 575, 255, 58),
(245, 11, 8, 863, 432, 86),
(246, 13, 8, 1295, 648, 130),
(247, 15, 8, 1943, 972, 196),
(248, 17, 8, 2915, 1458, 292),
(249, 19, 8, 4373, 2186, 437),
(250, 21, 8, 6560, 3280, 656),
(251, 23, 8, 9840, 4920, 986),
(252, 25, 8, 14760, 7380, 1476),
(253, 27, 8, 22140, 11070, 2214),
(254, 29, 8, 33210, 15505, 3321),
(255, 31, 8, 49815, 24908, 4982),
(256, 0, 0, 6, 3, 1),
(257, 5, 0, 10, 5, 1),
(258, 7, 0, 15, 8, 2),
(259, 9, 0, 22, 11, 2),
(260, 11, 0, 33, 17, 3),
(261, 13, 0, 50, 25, 5),
(262, 15, 0, 75, 38, 8),
(263, 17, 0, 113, 56, 12),
(264, 19, 0, 170, 85, 17),
(265, 21, 0, 255, 128, 26),
(266, 23, 0, 383, 182, 38),
(267, 25, 0, 575, 288, 58),
(268, 27, 0, 863, 432, 86),
(269, 29, 0, 1295, 648, 130),
(270, 31, 0, 1943, 972, 194),
(271, 1, 0, 6, 3, 1),
(272, 2, 0, 6, 3, 1),
(273, 3, 0, 6, 3, 1),
(274, 1, 1, 10, 5, 1),
(275, 2, 1, 10, 5, 1),
(276, 3, 1, 10, 5, 1),
(277, 1, 2, 15, 8, 2),
(278, 2, 2, 15, 8, 2),
(279, 3, 2, 15, 8, 2),
(280, 1, 3, 22, 11, 2),
(281, 2, 3, 22, 11, 2),
(282, 3, 3, 22, 11, 2),
(283, 1, 4, 33, 17, 3),
(284, 2, 4, 33, 17, 3),
(285, 3, 4, 33, 17, 3),
(286, 1, 5, 50, 25, 5),
(287, 2, 5, 50, 25, 5),
(288, 3, 5, 50, 25, 5),
(289, 1, 6, 75, 38, 8),
(290, 2, 6, 75, 38, 8),
(291, 3, 6, 75, 38, 8),
(292, 1, 7, 113, 58, 12),
(293, 2, 7, 113, 58, 12),
(294, 3, 7, 113, 58, 12),
(295, 1, 8, 170, 85, 17),
(296, 2, 8, 170, 85, 17),
(297, 3, 8, 170, 85, 17),
(298, 1, 0, 6, 3, 1),
(299, 2, 0, 6, 3, 1),
(300, 3, 0, 6, 3, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `steigerungstabelle`
--
ALTER TABLE `steigerungstabelle`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `steigerungstabelle`
--
ALTER TABLE `steigerungstabelle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=301;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Feb 2017 um 21:04
-- Server Version: 5.6.16
-- PHP-Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `423_steigerungserlaubnisskalktulator`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `charaktere`
--

CREATE TABLE IF NOT EXISTS `charaktere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `charakter_eigenschaften`
--

CREATE TABLE IF NOT EXISTS `charakter_eigenschaften` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `stufe` int(11) NOT NULL,
  `gesamt` int(11) NOT NULL,
  `aktuell` int(11) NOT NULL DEFAULT '0',
  `gesamt_frei` int(11) NOT NULL,
  `gesamt_se` int(11) NOT NULL,
  `gesamt_erlaubnis` int(11) NOT NULL,
  `charakter` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `charakter_talente`
--

CREATE TABLE IF NOT EXISTS `charakter_talente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `talent` int(11) NOT NULL,
  `stufe` int(11) NOT NULL,
  `aktuell` int(11) NOT NULL,
  `gesamt_frei` int(11) NOT NULL,
  `gesamt_se` int(11) NOT NULL,
  `gesamt_erlaubnis` int(11) NOT NULL,
  `charakter` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `charakter_zauber`
--

CREATE TABLE IF NOT EXISTS `charakter_zauber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zauber` int(11) NOT NULL,
  `hauszauber` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rep` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `stufe` int(11) NOT NULL,
  `aktuell` int(11) NOT NULL DEFAULT '0',
  `gesamt_frei` int(11) NOT NULL,
  `gesamt_se` int(11) NOT NULL,
  `gesamt_erlaubnis` int(11) NOT NULL,
  `charakter` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sonderfertigkeiten`
--

CREATE TABLE IF NOT EXISTS `sonderfertigkeiten` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merkmal` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `charakter` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `steigerungstabelle`
--

CREATE TABLE IF NOT EXISTS `steigerungstabelle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stufe` int(11) NOT NULL,
  `komplex` int(11) NOT NULL,
  `frei` int(11) NOT NULL,
  `se` int(11) NOT NULL,
  `erlaubnis` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=301 ;

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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `talente`
--

CREATE TABLE IF NOT EXISTS `talente` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `komplex` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `talentgruppe` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `talente`
--

INSERT INTO `talente` (`id`, `name`, `komplex`, `talentgruppe`) VALUES
(0, 'Anderthalbh&auml;nder', '5', 'Nahkampf'),
(1, 'Armbrust', '3', 'Fernkampf'),
(2, 'Belagerungswaffen', '4', 'Fernkampf'),
(3, 'Blasrohr', '4', 'Fernkampf'),
(4, 'Bogen', '5', 'Fernkampf'),
(5, 'Diskus', '4', 'Fernkampf'),
(6, 'Dolche', '4', 'Nahkampf'),
(7, 'Fechtwaffen', '5', 'Nahkampf'),
(8, 'Hiebwaffen', '4', 'Nahkampf'),
(9, 'Infanteriewaffen', '4', 'Nahkampf'),
(10, 'Kettenst&auml;be', '5', 'Nahkampf'),
(11, 'Kettenwaffen', '4', 'Nahkampf'),
(12, 'Lanzenreiten', '5', 'Nahkampf'),
(13, 'Peitsche', '5', 'Nahkampf'),
(14, 'Raufen', '3', 'Nahkampf'),
(15, 'Ringen', '4', 'Nahkampf'),
(16, 'S&auml;bel', '4', 'Nahkampf'),
(17, 'Schleuder', '4', 'Fernkampf'),
(18, 'Schwerter', '5', 'Nahkampf'),
(19, 'Speere', '4', 'Nahkampf'),
(20, 'St&auml;be', '4', 'Nahkampf'),
(21, 'Wurfbeile', '4', 'Fernkampf'),
(22, 'Wurfmesser', '3', 'Fernkampf'),
(23, 'Wurfspeere', '3', 'Fernkampf'),
(24, 'Zweihandflegel', '4', 'Nahkampf'),
(25, 'Zweihandhiebwaffen', '4', 'Nahkampf'),
(26, 'Zweihandschwerter/-s&auml;bel', '5', 'Nahkampf'),
(27, 'Akrobatik', '4', 'K&ouml;rperlich'),
(28, 'Athletik', '4', 'K&ouml;rperlich'),
(29, 'Fliegen', '4', 'K&ouml;rperlich'),
(30, 'Gaukeleien', '4', 'K&ouml;rperlich'),
(31, 'Klettern', '4', 'K&ouml;rperlich'),
(32, 'K&ouml;rperbeherrschung', '4', 'K&ouml;rperlich'),
(33, 'Reiten', '4', 'K&ouml;rperlich'),
(34, 'Schleichen', '4', 'K&ouml;rperlich'),
(35, 'Schwimmen', '4', 'K&ouml;rperlich'),
(36, 'Selbstbeherrschung', '4', 'K&ouml;rperlich'),
(37, 'Sich Verstecken', '4', 'K&ouml;rperlich'),
(38, 'Singen', '4', 'K&ouml;rperlich'),
(39, 'Sinnensch&auml;rfe', '4', 'K&ouml;rperlich'),
(40, 'Skifahren', '4', 'K&ouml;rperlich'),
(41, 'Stimmen Imitieren', '4', 'K&ouml;rperlich'),
(42, 'Tanzen', '4', 'K&ouml;rperlich'),
(43, 'Taschendiebstahl', '4', 'K&ouml;rperlich'),
(44, 'Zechen', '4', 'K&ouml;rperlich'),
(45, 'Bet&ouml;ren', '2', 'Gesellschaft'),
(46, 'Etikette', '2', 'Gesellschaft'),
(47, 'Gassenwissen', '2', 'Gesellschaft'),
(48, 'Lehren', '2', 'Gesellschaft'),
(49, 'Menschenkenntnis', '2', 'Gesellschaft'),
(50, 'Schauspielerei', '2', 'Gesellschaft'),
(51, 'Schriftlicher Ausdruck', '2', 'Gesellschaft'),
(52, 'Sich verkleiden', '2', 'Gesellschaft'),
(53, '&Uuml;berreden', '2', 'Gesellschaft'),
(54, '&Uuml;berzeugen', '2', 'Gesellschaft'),
(55, 'F&auml;hrtensuchen', '2', 'Natur'),
(56, 'Fallen stellen', '2', 'Natur'),
(57, 'Fesseln/Entfesseln', '2', 'Natur'),
(58, 'Fischen/Angeln', '2', 'Natur'),
(59, 'Orientierung', '2', 'Natur'),
(60, 'Wildnisleben', '2', 'Natur'),
(61, 'Wettervorhersage', '2', 'Natur'),
(62, 'Anatomie', '2', 'Wissen'),
(63, 'Baukunst', '2', 'Wissen'),
(64, 'Brett-/Kartenspiel', '2', 'Wissen'),
(65, 'Geografie', '2', 'Wissen'),
(66, 'Geschichtswissen', '2', 'Wissen'),
(67, 'Gesteinskunde', '2', 'Wissen'),
(68, 'G&ouml;tter und Kulte', '2', 'Wissen'),
(69, 'Heraldik', '2', 'Wissen'),
(70, 'H&uuml;ttenkunde', '2', 'Wissen'),
(71, 'Kriegskunst', '2', 'Wissen'),
(72, 'Kryptographie', '2', 'Wissen'),
(73, 'Magiekunde', '2', 'Wissen'),
(74, 'Mechanik', '2', 'Wissen'),
(75, 'Pflanzenkunde', '2', 'Wissen'),
(76, 'Philosophie', '2', 'Wissen'),
(77, 'Rechnen', '2', 'Wissen'),
(78, 'Rechtskunde', '2', 'Wissen'),
(79, 'Sagen und Legenden', '2', 'Wissen'),
(80, 'Sch&auml;tzen', '2', 'Wissen'),
(81, 'Sprachenkunde', '2', 'Wissen'),
(82, 'Staatskunst', '2', 'Wissen'),
(83, 'Sternkunde', '2', 'Wissen'),
(84, 'Tierkunde', '2', 'Wissen'),
(85, 'Abrichten', '2', 'Handwerk'),
(86, 'Ackerbau', '2', 'Handwerk'),
(87, 'Alchimie', '2', 'Handwerk'),
(88, 'Bergbau', '2', 'Handwerk'),
(89, 'Bogenbau', '2', 'Handwerk'),
(90, 'Boote Fahren', '2', 'Handwerk'),
(91, 'Brauer', '2', 'Handwerk'),
(92, 'Drucker', '2', 'Handwerk'),
(93, 'Fahrzeug Lenken', '2', 'Handwerk'),
(94, 'Falschspiel', '2', 'Handwerk'),
(95, 'Feinmechanik', '2', 'Handwerk'),
(96, 'Feuersteinbearbeitung', '2', 'Handwerk'),
(97, 'Fleischer', '2', 'Handwerk'),
(98, 'Gerber/K&uuml;rschner', '2', 'Handwerk'),
(99, 'Glaskunst', '2', 'Handwerk'),
(100, 'Grobschmied', '2', 'Handwerk'),
(101, 'Handel', '2', 'Handwerk'),
(102, 'Hauswirtschaft', '2', 'Handwerk'),
(103, 'Heilkunde: Gift', '2', 'Handwerk'),
(104, 'Heilkunde: Krankheiten', '2', 'Handwerk'),
(105, 'Heilkunde: Seele', '2', 'Handwerk'),
(106, 'Heilkunde: Wunden', '2', 'Handwerk'),
(107, 'Holzbearbeitung', '2', 'Handwerk'),
(108, 'Instrumentenbauer', '2', 'Handwerk'),
(109, 'Kartografie', '2', 'Handwerk'),
(110, 'Kochen', '2', 'Handwerk'),
(111, 'Kristallzucht', '2', 'Handwerk'),
(112, 'Lederarbeiten', '2', 'Handwerk'),
(113, 'Malen/Zeichnen', '2', 'Handwerk'),
(114, 'Maurer', '2', 'Handwerk'),
(115, 'Metallguss', '2', 'Handwerk'),
(116, 'Musizieren', '2', 'Handwerk'),
(117, 'Schl&ouml;sser Knacken', '2', 'Handwerk'),
(118, 'Schnaps Brennen', '2', 'Handwerk'),
(119, 'Schneidern', '2', 'Handwerk'),
(120, 'Seefahrt', '2', 'Handwerk'),
(121, 'Seiler', '2', 'Handwerk'),
(122, 'Steinmetz', '2', 'Handwerk'),
(123, 'Steinschneider/Juwelier', '2', 'Handwerk'),
(124, 'Stellmacher', '2', 'Handwerk'),
(125, 'Stoffe F&auml;rben', '2', 'Handwerk'),
(126, 'T&auml;towieren', '2', 'Handwerk'),
(127, 'T&ouml;pfern', '2', 'Handwerk'),
(128, 'Viehzucht', '2', 'Handwerk'),
(129, 'Webkunst', '2', 'Handwerk'),
(130, 'Winzer', '2', 'Handwerk'),
(131, 'Zimmermann', '2', 'Handwerk'),
(132, 'Lesen/Schreiben Altes Alaani', '1', 'Lesen/Schreiben'),
(133, 'Lesen/Schreiben Altes Kemi', '1', 'Lesen/Schreiben'),
(134, 'Lesen/Schreiben Amulashtra', '1', 'Lesen/Schreiben'),
(135, 'Lesen/Schreiben Angram', '1', 'Lesen/Schreiben'),
(136, 'Lesen/Schreiben Arkanil', '3', 'Lesen/Schreiben'),
(137, 'Lesen/Schreiben Chrmk', '1', 'Lesen/Schreiben'),
(138, 'Lesen/Schreiben Chuchas', '2', 'Lesen/Schreiben'),
(139, 'Lesen/Schreiben Drakhard-Zinken', '1', 'Lesen/Schreiben'),
(140, 'Lesen/Schreiben Geheiligte Glyphen von Unau', '1', 'Lesen/Schreiben'),
(141, 'Lesen/Schreiben Drakned-Glyphen', '2', 'Lesen/Schreiben'),
(142, 'Lesen/Schreiben Gimaril-Glyphen', '1', 'Lesen/Schreiben'),
(143, 'Lesen/Schreiben Gjalskisch', '1', 'Lesen/Schreiben'),
(144, 'Lesen/Schreiben Hjaldingsche Runen', '1', 'Lesen/Schreiben'),
(145, 'Lesen/Schreiben (Alt-)Imperiale Zeichen', '1', 'Lesen/Schreiben'),
(146, 'Lesen/Schreiben Isdira/Asdharia', '1', 'Lesen/Schreiben'),
(147, 'Lesen/Schreiben Kusliker Zeichen', '1', 'Lesen/Schreiben'),
(148, 'Lesen/Schreiben Mahrische Glyphen', '2', 'Lesen/Schreiben'),
(149, 'Lesen/Schreiben Nanduria', '1', 'Lesen/Schreiben'),
(150, 'Lesen/Schreiben Rogolan', '1', 'Lesen/Schreiben'),
(151, 'Lesen/Schreiben Trollische Raumbilderschrift', '3', 'Lesen/Schreiben'),
(152, 'Lesen/Schreiben Tulamidya', '1', 'Lesen/Schreiben'),
(154, 'Lesen/Schreiben Ur-Tulamidya', '1', 'Lesen/Schreiben'),
(155, 'Lesen/Schreiben Zhayad', '1', 'Lesen/Schreiben'),
(156, 'Alaani', '1', 'Sprache'),
(157, 'Alt-Imperial/Aureliani', '1', 'Sprache'),
(158, 'Altes Kemi', '1', 'Sprache'),
(159, 'Angram', '1', 'Sprache'),
(160, 'Asdharia', '1', 'Sprache'),
(161, 'Atak', '1', 'Sprache'),
(162, 'Bosparano', '1', 'Sprache'),
(163, 'Drachisch', '1', 'Sprache'),
(164, 'Ferkina', '1', 'Sprache'),
(165, 'F&uuml;chsisch', '1', 'Sprache'),
(166, 'Garethi', '1', 'Sprache'),
(167, 'Goblinisch', '1', 'Sprache'),
(168, 'Grolmisch', '1', 'Sprache'),
(169, 'Hjaldingsch', '1', 'Sprache'),
(170, 'Isdira', '1', 'Sprache'),
(171, 'Koboldisch', '1', 'Sprache'),
(172, 'Mahrisch', '1', 'Sprache'),
(173, 'Mohisch', '1', 'Sprache'),
(174, 'Molochisch', '1', 'Sprache'),
(175, 'Neckergesang', '1', 'Sprache'),
(177, 'Nujuka', '1', 'Sprache'),
(178, 'Oloarkh', '1', 'Sprache'),
(179, 'Ologhaijan', '1', 'Sprache'),
(180, 'Rabensprache', '1', 'Sprache'),
(181, 'Rissoal', '1', 'Sprache'),
(182, 'Rogolan', '1', 'Sprache'),
(183, 'Rssahh', '1', 'Sprache'),
(184, 'Ruuz', '1', 'Sprache'),
(185, 'Sprache der Blumen', '1', 'Sprache'),
(186, 'Thorwalsch', '1', 'Sprache'),
(187, 'Trollisch', '1', 'Sprache'),
(188, 'Tulamidya', '1', 'Sprache'),
(189, 'Urtulamidya', '1', 'Sprache'),
(190, 'Z''Lit', '1', 'Sprache'),
(191, 'Zelemja', '1', 'Sprache'),
(192, 'Zhayad', '1', 'Sprache'),
(193, 'Zhulchammaqra', '1', 'Sprache'),
(194, 'Zyklop&auml;isch', '1', 'Sprache'),
(195, 'Ritualkenntnis: Magier', '5', 'sonstige'),
(196, 'Litugienkenntnis', '5', 'sonstige'),
(197, 'Altes Amulashira', '1', 'Sprache'),
(198, 'Ritualkenntnis: Hexe', '5', 'sonstige'),
(199, 'Ritualkenntnis: Elf', '5', 'sonstige'),
(200, 'Ritualkenntnis: Druide', '5', 'sonstige'),
(201, 'Ritualkenntnis: Geode', '5', 'sonstige'),
(202, 'Ritualkenntnis: Schamane', '5', 'sonstige'),
(203, 'Ritualkenntnis: Achaz', '5', 'sonstige');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vorteile`
--

CREATE TABLE IF NOT EXISTS `vorteile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `modifikator` int(11) NOT NULL,
  `charakter` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zauber`
--

CREATE TABLE IF NOT EXISTS `zauber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `merkmal` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `komplex` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=320 ;

--
-- Daten für Tabelle `zauber`
--

INSERT INTO `zauber` (`id`, `name`, `merkmal`, `komplex`) VALUES
(0, 'Adveneum reine Speise', 'Objekt', 3),
(1, 'Accuratum Zaubernadel', 'Objekt', 3),
(2, 'Adamantium Erzstruktur', 'Elementar(Erz),Objekt', 3),
(3, 'Adlerauge Luchsenohr', 'Eigenschaft,Hellsicht', 2),
(4, 'Adlerschwinge Wolfgestallt', 'Form', 4),
(5, 'Aeolitus Windgebraus', 'Elementar(Luft),Umwelt', 2),
(6, 'Aerofugo Vakuum', 'Elementar(Luft),Umwelt', 4),
(7, 'Aerogelo Atemqual', 'Elementar(Luft):Umwelt', 4),
(8, 'Aeropulvis Sanfter Fall', 'Elementar(Luft),Telekinese', 3),
(9, 'Alpgestalt', 'Einfluss,Herrschaft', 3),
(10, 'Analys Arkanstruktur', 'Hellsicht,Metamagie', 4),
(11, '&Auml;ngste Lindern', 'Einfluss', 3),
(12, 'Animatio Stummer Diener', 'Telekinese', 5),
(13, 'Applicatus Zauberspeicher', 'Metamagie,Objekt', 3),
(14, 'Aquafaxius Wasserstrahl', 'Elementar(Wasser),Schaden', 3),
(15, 'Aquaqueris Wasserfluch', 'Elementar(Wasser),Schaden', 4),
(16, 'Aquasphaero Wasserball', 'Elementar(Wasser),Schaden,Telekinese', 4),
(17, 'Arachnea Krabbeltier', 'Rufe', 4),
(18, 'Arcanovi Artefakt', 'Metamagie,Objekt', 5),
(19, 'Archofaxius Erzstrahl', 'Elementar(Erz),Schaden', 3),
(20, 'Archosphaero Erzball', 'Elementar(Erz),Schaden,Telekinese', 4),
(21, 'Armatrutz', 'Eigenschaft,Elementar(Erz)', 2),
(22, 'Atemnot', 'Eigenschaft', 3),
(23, 'Attributo', 'Eigenschaft', 2),
(24, 'Aufgeblasen Abgehoben', 'Elementar(Luft),Form', 3),
(25, 'Auge des Limbus', 'Kraft,Limbus', 5),
(26, 'Aureolus G&uuml;ldenglanz', 'Illusion', 1),
(27, 'Auris Nasus Oculus', 'Illusion', 4),
(28, 'Axxeleratus Blitzgeschwind', 'Eigenschaft', 3),
(29, 'Balsam Salabunda', 'Form,Heilung', 3),
(30, 'Band und Fessel', 'Einfluss', 3),
(31, 'Bannbaladin', 'Einfluss', 2),
(32, 'B&auml;renruhe Winterschlaf', 'Form', 4),
(33, 'Beherrschung Brechen', 'Antimagie,Herrschaft', 3),
(34, 'Beschw&ouml;rung Vereiteln', 'Antimagie,Beschw&ouml;rung', 3),
(35, 'Bewegung St&ouml;ren', 'Antimagie,Telekinese', 3),
(36, 'Blendwerk', 'Illusion', 3),
(37, 'Blick aufs Wesen', 'Hellsicht', 3),
(38, 'Blick durch fremde Augen', 'Hellsicht,Verst&auml;ndigung', 5),
(39, 'Blick in die Gedanken', 'Hellsicht', 4),
(40, 'Blick in die Vergangenheit', 'Hellsicht,Temporal', 4),
(41, 'Blitz dich find', 'Einfluss', 2),
(42, 'B&ouml;ser Blick', 'Einfluss', 3),
(43, 'Brenne, toter Stoff!', 'Elementar(Feuer),Objekt', 3),
(44, 'Caldofrigo hei&szlig; und kalt', 'Elementar(Feuer),Elementar(Eis),Objekt,Umwelt', 5),
(45, 'Chamaelioni Mimikry', 'Illusion', 3),
(46, 'Chimaeroform Hybridgestalt', 'D&auml;monisch(Asf),Form', 6),
(47, 'Chrononautos Zeitenfahrt', 'Tempor&auml;r', 6),
(48, 'Chronoklassis Urfossil', 'Rufe,Tempor&auml;r', 6),
(49, 'Claudibus Clavistibor', 'Objekt', 3),
(50, 'Corpofesso Gliederschmerz', 'Eigenschaft', 3),
(51, 'Corpofrigo K&auml;lteschock', 'Eigenschaft,Elementar(Eis)', 3),
(52, 'Cryptographo Zauberschrift', 'Objekt,Verst&auml;ndigung', 3),
(53, 'Custodosigil Diebesbann', 'Elementar(Feuer),Metamagie,Objekt', 3),
(54, 'D&auml;monenbann', 'Antimagie,D&auml;monen', 3),
(55, 'Delicioso Gaumenschmaus', 'Illusion', 4),
(56, 'Desintegratus Pulverstaub', 'Objekt,Schaden', 4),
(57, 'Destructibo Arcanitas', 'Antimagie,Kraft,Metamagie', 5),
(58, 'Dichter und Denker', 'Herrschaft', 3),
(59, 'Dschinnnruf', 'Elementar,Rufe', 5),
(60, 'Dunkelheit', 'Umwelt', 3),
(61, 'Duplicatus Doppelbild', 'Illusion', 3),
(62, 'Ecliptifactus Schattenkraft', 'D&auml;monisch,Form', 4),
(63, 'Eigenschaft wiederherstellen', 'Antimagie,Eigenschaft', 3),
(64, 'Eigne &Auml;ngste qu&auml;len dich!', 'Antimagie,Einfluss', 3),
(65, 'Einfluss Bannen', 'Antimagie,Einfluss', 2),
(66, 'Eins mit der Natur', 'Eigenschaft,Elementar', 3),
(67, 'Eisenrost und Patina', 'Objekt,Tampor&auml;r', 3),
(68, 'Eisesk&auml;lte K&auml;mpferherz', 'Eigenschaft', 3),
(69, 'Eiswirbel', 'Elementar(Eis),Umwelt', 4),
(70, 'Elementarbann', 'Antimagie,Elementar', 3),
(71, 'Elementarer Diener', 'Elementar,Rufe', 4),
(72, 'Elfenstimme Fl&ouml;tenton', 'Verst&auml;ndigung', 4),
(73, 'Entfesselung des Getiers', 'Form', 5),
(74, 'Erinnerung verlasse Dich!', 'Herrschaft', 4),
(75, 'Exposami Lebenskraft', 'Hellsicht', 2),
(76, 'Falkenauge Meisterschuss', 'Eigenschaft', 2),
(77, 'Favilludo Funkentanz', 'Illusion', 1),
(78, 'Fesselranken', 'Elementar(Humus),Umwelt', 3),
(79, 'Feuerm&auml;hne Flammenhuf', 'Rufe,Elementar(Feuer)', 5),
(80, 'Feuersturm', 'Elementar(Feuer),Umwelt', 4),
(81, 'Flim Flam Funkel', 'Umwelt', 1),
(82, 'Fluch der Pestilenz', 'D&auml;monisch(Biz)', 4),
(83, 'Foramen Foraminor', 'Hellsicht,Telekinese', 3),
(84, 'Fortifex Arkane Wand', 'Elementar(Erz),Umwelt', 4),
(85, 'Frigifaxius Eisstrahl', 'Elementar(Eis),Schaden', 3),
(86, 'Frigisphareo Eisball', 'Elementar(Eis),Schaden,Telekinese', 4),
(87, 'Fulminictus Donnerkeil', 'Kraft,Schaden', 3),
(88, 'Gardianum Zauberschild', 'Antimagie,Kraft,Metamagie', 4),
(89, 'Gedankenbilder Elfenruf', 'Verst&auml;ndigung', 2),
(90, 'Gef&auml;&szlig; der Jahre', 'Form,Tempor&auml;r', 5),
(91, 'Gefunden!', 'Hellsicht', 3),
(92, 'Geisterbann', 'Antimagie,Rufe', 3),
(93, 'Glacoflumen Fluss aus Eis', 'Elementar(Eis),Umwelt', 5),
(94, 'Gletscherwand', 'Elementar(Eis)', 4),
(95, 'Granit und Marmor', 'Elementar(Erz),Form', 4),
(96, 'Gro&szlig;e Gier', 'Einfluss,Herrschaft', 3),
(97, 'Gro&szlig;e Verwirrung', 'Eigenschaft', 3),
(98, 'Halluzination', 'Herrschaft', 3),
(99, 'Harmlose Gestalt', 'Einfluss,Illusion', 3),
(100, 'Hartes Schmelze!', 'Elementar(Wasser),Objekt', 3),
(101, 'Haselbusch und Ginsterkraut', 'Eigenschaft,Elementar(Humus),Form', 4),
(102, 'Heilkraft Bannen', 'Antimagie,Heilung', 3),
(103, 'Hellsicht Tr&uuml;ben', 'Antimagie,Hellsicht', 3),
(104, 'Herbeirufung Vereiteln', 'Antimagie,Rufe', 3),
(105, 'Herr &uuml;ber das Tierreich', 'Herrschaft', 4),
(106, 'Herzschlag ruhe!', 'D&auml;monisch(Blk),Eigenschaft,Einfluss', 4),
(107, 'Hexenblick', 'Verst&auml;ndigung', 2),
(108, 'Hexengalle', 'Schaden', 3),
(109, 'Hexenholz', 'Telekinese', 2),
(110, 'Invocatio Minor', 'Beschw&ouml;rung,D&auml;minisch', 4),
(111, 'Hexenknoten', 'Einfluss,Illusion', 3),
(112, 'Hexenkrallen', 'Eigenschaft,Form', 3),
(113, 'Hexenspeichel', 'Heilkraft', 3),
(114, 'Hilfreiche Tatze, Rettende Schwinge', 'Einfluss,Verst&auml;ndigung', 4),
(115, 'H&ouml;llenpein zerrei&szlig;e dich!', 'Einfluss', 3),
(116, 'Holterdipolter', 'Umwelt', 3),
(117, 'Horriphobus Schreckgestalt', 'Einfluss', 3),
(118, 'Humufaxius Humusstrahl', 'Elementar(Humus),Schaden', 3),
(119, 'Humosphaero Humusball', 'Elementar(Humus),Schaden,Telekinese', 4),
(120, 'Ignifaxius Flammenstrahl', 'Elementar(Feuer),Schaden', 3),
(121, 'Ignifugo Feuerbann', 'Elementar(Feuer),Umwelt', 3),
(122, 'Ignimorpho Feuerform', 'Elementar(Feuer) Objekt', 4),
(123, 'Igniplano Fl&auml;chenbrand', 'Elementar(Feuer),Schaden,Umwelt', 6),
(124, 'Ignisphaero Feuerball', 'Elementar(Feuer),Schaden,Telekinese', 4),
(125, 'Ignorantia Ungesehn', 'Einfluss,Illusion', 4),
(126, 'Illusion Aufl&ouml;sen', 'Antimagie,Illusion', 2),
(127, 'Immortalis Lebenszeit', 'Form,Tempor&auml;r', 6),
(128, 'Imperavi Handlungszwang', 'Herrschaft', 5),
(129, 'Impersona Maskenbild', 'Illusion', 4),
(130, 'Infinitum Immerdar', 'Metamagie,Tempor&auml;r', 6),
(131, 'Invercano Spiegeltrick', 'Antimagie,Kraft,Metamagie', 6),
(132, 'Invocatio maior', 'Beschw&ouml;rung,D&auml;monisch', 5),
(133, 'Iribaars Hand', 'D&auml;monisch(Amz),Einfluss,Schaden', 4),
(134, 'Juckreiz d&auml;mlicher!', 'Einfluss', 2),
(135, 'Karnifilio Raserei', 'Eigenschaft,Einfluss', 3),
(136, 'Katzenaugen', 'Eigenschaft', 3),
(137, 'Klarum Purum', 'Form,Heilung', 4),
(138, 'Klickeradomms', 'Telekinese', 1),
(139, 'Koboldgeschenk', 'Telekinese', 3),
(140, 'Koboldovision', 'Hellsicht,Limbus', 4),
(141, 'Komm Kobold Komm', 'Rufe', 3),
(142, 'K&ouml;rperlose Reise', 'Limbus,Verst&auml;ndigung', 5),
(143, 'Krabbelnder Schrecken', 'D&auml;monisch(Biz),Rufe', 3),
(144, 'Kraft des Erzes', 'Elementar(Erz),Objekt', 4),
(145, 'Kraft des Humus', 'Elementar(Humus),Heilung', 4),
(146, 'Kr&auml;henruf', 'Einfluss,Rufe,Limbus', 3),
(147, 'Kr&ouml;tensprung', 'Eigenschaft', 2),
(148, 'Kulminatio Kugelblitz', 'Schaden', 4),
(149, 'Kusch!', 'Einfluss', 2),
(150, 'Lach dich gesund', 'Einfluss,Heilung', 3),
(151, 'Lachkrampf', 'Einfluss', 3),
(152, 'Langer Lulatsch', 'Form,Objekt', 4),
(153, 'Last des Alters', 'Form,Tempor&auml;r', 5),
(154, 'Leib aus tausend Fliegen', 'Form', 5),
(155, 'Leib der Erde', 'Elemtar(Humus),Form', 4),
(156, 'Leib der Wogen', 'Elementar(Wasser),Form', 5),
(157, 'Leib des Erzes', 'Elementar(Erz),Form', 5),
(158, 'Leib des Feuers', 'Elementar(Feuer),Form', 5),
(159, 'Leib des Windes', 'Elementar(Luft),Form', 5),
(160, 'Leidensbund', 'Heilung/Verst&auml;ndigung', 3),
(161, 'Levthans Feuer', 'Einfluss,Verst&auml;ndigung', 4),
(162, 'Limbus Versiegeln', 'Antimagie,Limbus', 5),
(163, 'Lockruf und Feenf&uuml;&szlig;e', 'Illusion,Telekinese', 2),
(164, 'Lunge des Leviatan', 'Heilung', 3),
(165, 'Madas Spiegel', 'Hellsicht,Verst&auml;ndigung', 4),
(166, 'Magischer Raub', 'Kraft,Verst&auml;ndigung', 4),
(167, 'Mahlstrom', 'Elementar(Wasser),Umwelt', 4),
(168, 'Malmkreis', 'Elementar(Erz),Umwelt', 4),
(169, 'Manifesto Element', 'Elementar', 1),
(170, 'Meister der Elemente', 'Elementar,Rufe', 6),
(171, 'Meister Minderer Geister', 'Rufe', 2),
(172, 'Memorabia Falsifir', 'Herrschaft', 5),
(173, 'Memorans Ged&auml;chtniskraft', 'Eigenchaft,Hellsicht', 3),
(174, 'Menetekel Flammenchrift', 'Illusion', 2),
(175, 'Metamagie neutralisieren', 'Antimagie,Metamagie', 6),
(176, 'Metamorpho Felsenform', 'Elementar(Erz),Objekt', 4),
(177, 'Metamorpho Gletscherform', 'Elementar(Eis),Objekt', 3),
(178, 'Motoricus Geisteshand', 'Telekinese', 3),
(179, 'Movimento Dauerlauf', 'Eigenschaft', 1),
(180, 'Murks und Patz', 'Einfluss', 3),
(181, 'Nackedei', 'Objekt,Telekinese', 4),
(182, 'Nebelleib', 'Elementar(Luft),Elementar(Wasser),Form', 4),
(183, 'Nebelwand und Morgendunst', 'Elementar(Luft),Elementar(Wasser),Umwelt', 3),
(184, 'Nekropathia Seelenreise', 'Geist,Verst&auml;ndigung', 5),
(185, 'Niederh&ouml;llen Eisgestalt', 'Elementar(Eis),Form', 4),
(186, 'Nihilogravo Schwerelos', 'Umwelt', 5),
(187, 'Nintiovolo Botenvogel', '\r\nBeschw&ouml;rung,D&auml;monisch(Lol)', 3),
(188, 'Objecto Obscuro\r\n', 'Objekt', 4),
(189, 'Objectovoco', 'Objekt,Tempor&auml;r', 3),
(190, 'Objekt entzaubern', 'Entimagie,Objekt', 3),
(191, 'Oculus Astralis', 'Hellsicht,Kraft,Metamagie,Limbus', 5),
(192, 'Odem Arcanum', 'Hellsicht,Kraft', 1),
(193, 'Opacitas Schattenlaib', 'D&auml;monisch', 4),
(194, 'Orcanofaxius Luftstrahl', 'Elementar(Luft),Schaden', 3),
(195, 'Orcanosphaero Orkanball', 'Elementar(Luft),Schaden', 4),
(196, 'Orkanwand', 'Elementar(Luft)', 4),
(197, 'Pendaeminium', 'Beschw&ouml;rung,D&auml;monisch', 4),
(198, 'Panik &uuml;berkomme euch!', 'D&auml;monisch(Amz),Einfluss', 5),
(199, 'Pantenebrum', 'Beschw&ouml;rung,D&auml;monisch', 4),
(200, 'Papperlapapp', 'Einfluss', 4),
(201, 'Paralysis starr wie Stein', 'Elementar(Erz),Form', 3),
(202, 'Pectetondo Zauberharr', 'Form', 2),
(203, 'Penetrizzel Tiefenblick', 'Hellsicht', 3),
(204, 'Pentagramma Sph&auml;renbann', 'Antimagie,Beschw&ouml;rung,D&auml;monisch,Geist', 4),
(205, 'Pestilenz ersp&uuml;ren', 'Hellsicht', 3),
(206, 'Pfeil der Luft', 'Elementar(Luft),Objekt', 3),
(207, 'Pfeil des Eises', 'Elementar(Eis),Objekt', 3),
(208, 'Pfeil des Erzes', 'Elementar(Erz),Objekt', 3),
(209, 'Pfeil des Feuers', 'Elementar(Feuer),Objekt', 3),
(210, 'Pfeil des Humus', 'Elementar(Humus),Objekt', 3),
(211, 'Pfeil des Wassers', 'Elementar(Wasser),Objekt', 3),
(212, 'Planastrale Anderwelt', 'Limbus', 6),
(213, 'Plumbumbarum schwerer Arm', 'Einfluss', 2),
(214, 'Projektimago Ebenbild', 'Illusion,Verst&auml;ndigung', 4),
(215, 'Psychostabilis', 'Antimagie,Eigenschaft', 3),
(216, 'Radau', 'Elementar(Luft),Telekinese', 3),
(217, 'Reflectimago Spiegelschein', 'Illlusion', 2),
(218, 'Reptilea Natternest', 'Rufe', 4),
(219, 'Respondami', 'Herrschaft', 2),
(220, 'Reversalis Revidum', 'Metamagie', 5),
(221, 'Ruhe K&ouml;rper, ruhe Geist', 'Hellsicht', 2),
(222, 'Salander Mutander', 'Form', 5),
(223, 'Sanftmut', 'Einfluss', 2),
(224, 'Sapefaca Zauberschwann', 'Elementar(Luft),Elementar(Wasser),Telekinese', 3),
(225, 'Satuarias Herrlichkeit', 'Eigenschaft,Illusion', 2),
(226, 'Schabernack', 'Einfluss', 2),
(227, 'Schadenszauber Bannen', 'Antimagie,Schaden', 3),
(228, 'Schattenodem', 'Beschw&ouml;rung,D&auml;monisch,Schaden', 3),
(229, 'Schelmenkleister', 'Umwelt', 3),
(230, 'Schelmenlaune', 'Einfluss', 4),
(231, 'Schelmenmaske', 'Illusion', 4),
(232, 'Schelmenrausch', 'Einfluss', 3),
(233, 'Schleier der Unwissenheit', 'Eigenschft,Metamagie', 4),
(234, 'Schwarz und Rot', 'Eigenschaft,Schaden', 4),
(235, 'Schwarzer Schrecken', 'Einfluss', 4),
(236, 'Seelenfeuer Lichterloh', 'Elementar(Feuer),Form', 4),
(237, 'Seelentier erkennen', 'Hellsicht', 3),
(238, 'Seelenwanderung', 'Eigenschaft,Verst&auml;ndigung', 6),
(239, 'Seidenweich Schuppengleich', 'Illusion', 3),
(240, 'Seidenzunge Elfenwort', 'Einfluss', 2),
(241, 'Sensattacco Meisterstreich', 'Eigenschaft,Hellsicht', 4),
(242, 'Sensibar Empathicus', 'Hellsicht', 3),
(243, 'Serpentialis Schlangenleib', 'Form', 4),
(244, 'Silentium', 'Umwelt', 2),
(245, 'Sinesigil unerkannt', 'Illusion', 4),
(246, 'Skelettarius Totenherr', 'D&auml;monisch(Tar)', 3),
(247, 'Solidirid Weg aus Licht', 'Elemenat(Luft),Umwelt', 4),
(248, 'Somnigravis Tiefer Schlaf', 'Einfluss', 2),
(249, 'Spinnenlauf', 'Eigenschaft', 3),
(250, 'Spurlos Trittlos', 'Umwelt', 3),
(251, 'Standfest Katzengleich', 'Eigenschaft', 3),
(252, 'Staub wandle!', 'Elementar(Erz)', 5),
(253, 'Stillstand', 'Elementar,Umwelt', 5),
(254, 'Stimmen des Windes', 'Form,Elementar(Luft)', 4),
(255, 'Sumpfstrudel', 'Elementar(Humus),Umwelt', 4),
(256, 'Sumus Elixiere', 'Elementar(Humus)', 3),
(257, 'Tauschrausch', 'Limbus', 4),
(258, 'Tempus Stasis', 'Tempor&auml;r', 5),
(259, 'Tenebaro Schattentanz', 'Illusion', 1),
(260, 'Tiere Besprechen', 'Form,Heilung', 3),
(261, 'Tiergedanken', 'Hellsicht,Verst&auml;ndigung', 3),
(262, 'Tlalucs Odem Pestgestank', 'Beschw&ouml;rung,D&auml;monisch,Schaden', 3),
(263, 'Totes Handle!\r\n', 'Beschw&ouml;rung,D&auml;monisch(Tar)', 4),
(264, 'Transformatio Formgestalt', 'Objekt', 5),
(265, 'Transmutare K&ouml;rperform', 'Form', 4),
(266, 'Transversalis Teleport', 'Limbus', 5),
(267, 'Traumgestalt', 'Verst&auml;ndigung', 4),
(268, 'Umbraporta Schattent&uuml;re', 'D&auml;monisch,Limbus', 4),
(269, 'Unber&uuml;hrt von Satinav', 'Objekt,Tempor&auml;r', 3),
(270, 'Unitatio Geisterbund', 'Kraft,Verst&auml;ndigung', 2),
(271, 'Unsichtbarer J&auml;ger', 'Illusion', 5),
(272, 'Ver&auml;nderung Aufheben', 'Antimagie,Umwelt', 4),
(273, 'Verschwindibus', 'Limbus', 3),
(274, 'Verst&auml;ndigung St&ouml;ren', 'Antimagie,Verst&auml;ndigung', 3),
(275, 'Verwandlung Beenden', 'Antimagie,Form', 4),
(276, 'Viepernblick', 'Einfluss', 2),
(277, 'Visibili vanitar', 'Form', 3),
(278, 'Vocolimbo Hohler Klang', 'Illusion', 2),
(279, 'Vogelzwitschern Glockenspiel', 'Illusion', 2),
(280, 'Wand aus Dornen', 'Elementar(Humus)', 4),
(281, 'Wand aus Erz', 'Elementar(Erz)', 4),
(282, 'Wand aus Flammen', 'Elementar(Feuer)', 4),
(283, 'Wand aus Wogen', 'Elementar(Wasser)', 4),
(284, 'Warmes Blut', 'Eigenschaft,Elementar(Feuer),Hellsicht', 2),
(285, 'Warmes Gefriere', 'Objekt,Elementar(Eis)', 3),
(286, 'Wasseratem', 'Form', 3),
(287, 'Weiches Erstarre!', 'Elementar(Erz),Umwelt', 3),
(288, 'Weihrauchwolke Wohlgeruch', 'Illusion', 2),
(289, 'Weisheit der B&auml;ume', 'Elementar(Humus),Form', 4),
(290, 'Wei&szlig;e M&auml;hn und goldener Huf', 'Beschw&ouml;rung', 4),
(291, 'Wellenlauf', 'Eigenschaft,Elementar(Wasser)', 4),
(292, 'Wettermeisterschaft', 'Elementar(Luft),Umwelt', 5),
(293, 'Widerwille Ungemach', 'Einfluss,Illusion', 4),
(294, 'Windgefl&uuml;ster', 'Verst&auml;ndigung,Elementar(Luft)', 2),
(295, 'Windhose', 'Elementar(Luft),Umwelt', 4),
(296, 'Windstille', 'Elementar(Luft),Umwelt', 3),
(297, 'Wipfellauf', 'Eigenschaft,Elementar(Humus)', 4),
(298, 'Xenographus Schriftenkunde', 'Hellsicht', 5),
(299, 'Zagibu Ubigaz', 'Elementar(Erz),Objekt', 3),
(300, 'Zappenduster', 'Antimagie,Umwelt', 3),
(301, 'Zauberklinge Geisterspeer', 'Kraft,Objekt', 4),
(302, 'Zaubernahrung Hungerbann', 'Eigenschaft,Einfluss', 3),
(303, 'Zauberwesen der Natur', 'Rufe,Verst&auml;ndigung', 2),
(304, 'Zauberzwang', 'Herrschaft,Schaden', 5),
(305, 'Zorn der Elemente', 'Elementar,Schaden', 3),
(306, 'Zunge L&auml;hmen', 'Eigenschaft', 2),
(307, 'Zwingtanz', 'Herrschaft', 4),
(308, 'Leib des Eises', 'Elementar(Eis),Form', 5),
(309, 'Dornenkrallen', 'Eigenschaft,Form,Elementar(Humus)', 3),
(310, 'Eiskaltes Strategem', 'Form,Elementar(Eis)', 4),
(311, 'Festes Verwehe', 'Objekt,Elementar(Luft)', 3),
(312, 'Feuerlauf', 'Eigenschaft,Elementar(Feuer)', 4),
(313, 'Firnlauf', 'Eigenschaft,Elementar(Eis)', 4),
(314, 'Geisterruf', 'Geist,Rufe', 4),
(315, 'Kraft der Luft', 'Elementar(Humus,Elementar(Luft)', 4),
(316, 'Kraft des Eises', 'Elementar(Humus),Elementar(Luft)', 4),
(317, 'Objectofixa', 'Objekt,Tempor&auml;r', 4),
(318, 'Protectionis Kontrabann', 'Antimagie,Kraft,Metamagie', 6),
(319, 'Stein wandle!', 'Beschw&ouml;rung,D&auml;monisch', 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
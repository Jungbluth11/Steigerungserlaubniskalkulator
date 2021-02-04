-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Feb 2017 um 01:26
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

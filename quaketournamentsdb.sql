-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2023 at 02:07 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quaketournamentsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `players_id` int(20) NOT NULL,
  `name` varchar(62) DEFAULT NULL,
  `age` int(20) DEFAULT NULL,
  `country` varchar(62) DEFAULT NULL,
  `player_nickname` varchar(62) DEFAULT NULL,
  `association` varchar(62) DEFAULT NULL,
  `status` varchar(62) DEFAULT NULL,
  `earnings` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`players_id`, `name`, `age`, `country`, `player_nickname`, `association`, `status`, `earnings`) VALUES
(1, 'Johan Quick', 36, 'Sweden', 'toxjq', NULL, 'Active', 291830),
(2, 'Anton Singov', 34, 'Russia', 'Cooller', 'AMD', 'Active', 205692),
(3, 'Shane Hendrixson', 31, 'United States', 'rapha', 'Team Liquid', 'Active', 379781),
(4, 'Tim Fogarty', 32, 'United States', 'DaHanG', 'Team Liquid', 'Active', 252525),
(5, 'Maciej Krzykowski', 29, 'Poland', 'Av3k', 'Endpoint', 'Active', 147623),
(6, 'Alexei Yanushevsky', 30, 'Belarus', 'cYpheR', 'Natus Vincere', 'Active', 189778),
(7, 'Sebastian Siira', 34, 'Sweden', 'Spart1e', NULL, 'Active', 61476),
(8, 'Marcel Paul', 34, 'Germany', 'k1llsen', 'BIG', 'Active', 111240),
(9, 'James Harding', 38, 'United Kingdom', '2GD', NULL, 'Retired', 38876),
(10, 'Magnus Olsson', 36, 'Sweden', 'fox', NULL, 'Retired', 56580),
(11, 'Nikita Marchinsky', 22, 'Belarus', 'clawz', 'Natus Vincere', 'Active', 250088),
(12, 'Kevin Baeza', 30, 'France', 'strenx', NULL, 'Inactive', 45262),
(13, 'John Hill', 36, 'United States', 'ZeRo4', NULL, 'Retired', 156817),
(14, 'Pelle Soderman', 36, 'Sweden', 'fazz', NULL, 'Retired', 69046),
(15, 'Dmytro Sakharuk', 25, 'Ukraine', 'Xron', 'Luminosity Gaming', 'Active', 121296),
(16, 'Sander Kaasjager', 35, 'Netherlands', 'Vo0', NULL, 'Retired', 308122),
(17, 'Zhibo Fan', 34, 'China', 'Jibo', NULL, 'Retired', 27509),
(18, 'Alessandro Avallone', 34, 'Italy', 'stermy', NULL, 'Inactive', 216606),
(19, 'Mark McGrail', 35, 'United States', 'cl0ck', NULL, 'Active', 24683),
(20, 'Paul D. Nelson', 36, 'United States', 'czm', NULL, 'Inactive', 66850),
(21, 'Brian Flander', 39, 'United States', 'dkt', NULL, 'Retired', 6750),
(22, 'Pierre-Emeric Portier', 33, 'France', 'l1nkin', NULL, 'Retired', 18761),
(23, 'Richard Gansterer', NULL, 'Austria', 'noctis', NULL, 'Retired', 84656),
(24, 'Gareth Marshall', 35, 'United Kingdom', 'GaRpY', 'Myztro Gaming', 'Active', 51937),
(25, 'Krystof Cerny', 32, 'Czech Republic', 'krysa', NULL, 'Retired', 19036),
(26, 'Aaron-Anton Jones', NULL, 'United Kingdom', 'HELL', 'Myztro Gaming', 'Active', 10963),
(27, 'David Alexander Kinnaird', 36, 'United Kingdom', 'deus', NULL, 'Retired', 19043),
(28, 'Kyle Mooren', 32, 'Netherlands', 'Silencep', NULL, 'Active', 98128),
(29, 'Michael Bignet', 33, 'France', 'winz', NULL, 'Inactive', 82507),
(30, 'Alexander Dolgov', 28, 'Russia', 'Latrommi', NULL, 'Active', 88906),
(31, 'Andrew Trulli', 33, 'Canada', 'id_', NULL, 'Active', 27797),
(32, 'Gaspar Machado', 33, 'Portugal', 'hypno', NULL, 'Retired', 48771),
(33, 'Sean Price', NULL, 'United States', 'Daler', NULL, 'Retired', NULL),
(34, 'Alexander Ingarv', 35, 'Sweden', 'Ztrider', NULL, 'Retired', 4000),
(35, 'Sergey Orekhov', 34, 'Russian', 'evil', NULL, 'Retired', 34835),
(36, 'Alexey Nesterov', 39, 'Russian', 'LeXeR', NULL, 'Retired', 48160),
(37, 'Johnathan Wendel', 42, 'American', 'Fatal1ty', NULL, 'Retired', 459647),
(38, 'Sergiy Rudy', NULL, 'Canadian', 'kuku', NULL, 'Retired', 4000),
(39, 'Jared Cugno', 41, 'American', 'cha0ticz', NULL, 'Retired', 10675),
(40, 'Karl Johansson', 37, 'Swedish', 'fooKi', NULL, 'Retired', 5070),
(41, 'Chance Lacina', 38, 'American', 'chance', NULL, 'Active', 9750),
(42, 'Adrian Birgany', 28, 'Hungarian', 'Raisy', 'Myztro Gaming', 'Active', 145857);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `results_id` int(11) NOT NULL,
  `first_place` int(11) DEFAULT NULL,
  `second_place` int(11) DEFAULT NULL,
  `third_place` int(11) DEFAULT NULL,
  `fourth_place` int(11) DEFAULT NULL,
  `fifth_place` int(11) DEFAULT NULL,
  `tournament_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`results_id`, `first_place`, `second_place`, `third_place`, `fourth_place`, `fifth_place`, `tournament_id`) VALUES
(1, 36, 33, 37, 38, 39, 1),
(2, 2, 13, 36, 14, 39, 2),
(3, 20, 13, 2, 37, 1, 3),
(4, 2, 1, 10, 40, 34, 4),
(5, 1, 2, 34, 5, 6, 5),
(6, 1, 5, 6, 4, 41, 6),
(7, 6, 3, 2, 23, 12, 7),
(8, 6, 4, 35, 1, 7, 8),
(9, 6, 5, 2, 12, 10, 9),
(10, 8, 16, 11, 5, 2, 10),
(11, 4, 1, 6, 3, 26, 11),
(12, 3, 2, 11, 8, 42, 12),
(13, 2, 42, 6, 8, 3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `tournament_id` int(20) NOT NULL,
  `game` varchar(62) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(62) DEFAULT NULL,
  `country_location` varchar(62) DEFAULT NULL,
  `prize_pool` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`tournament_id`, `game`, `date`, `name`, `country_location`, `prize_pool`) VALUES
(1, 'Quake III Arena', '2002-08-15', 'QuakeCon 2002: Quake III Arena Duel', 'United States', 40000),
(2, 'Quake III Arena', '2003-07-08', 'Electronic Sports World Cup 2003: Quake 3', 'France', 10000),
(3, 'Quake III Arena', '2004-08-12', 'QuakeCon 2004: Quake III Arena Duel', 'United States', 50000),
(4, 'Quake 4', '2005-12-14', '2005 CPL Winter Championship', 'United States', 50000),
(5, 'Quake 4', '2006-08-03', 'QuakeCon 2006: Quake 4 Duel', 'United States', 35000),
(6, 'Quake 4', '2007-11-10', 'Multiplay Insomnia 32', 'United Kingdom', 20000),
(7, 'Quake Live', '2011-06-18', 'DreamHack Summer 2011 - Quake Live Duel Championship', 'Sweden', 6216),
(8, 'Quake Live', '2014-07-17', 'QuakeCon 2014: Intel Duel Masters Invitational Championship', 'United States', 20000),
(9, 'Quake Live', '2010-01-14', 'Intel Extreme Masters Season IV - European Championship Finals', 'Germany', 9000),
(10, 'Quake Champions', '2017-11-03', 'Italian Esports Open 2017', 'Italy', 16000),
(11, 'Quake Champions', '2017-12-01', 'DreamHack Winter 2017: Duel', 'Sweden', 150000),
(12, 'Quake Champions', '2018-10-05', 'PGL Quake Champions Open', 'Romania', 50000),
(13, 'Quake Champions', '2019-11-02', 'Quake Pro League Stage 1 Finals', 'Italy', 35250);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`players_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`results_id`),
  ADD KEY `first_place` (`first_place`),
  ADD KEY `second_place` (`second_place`),
  ADD KEY `third_place` (`third_place`),
  ADD KEY `fourth_place` (`fourth_place`),
  ADD KEY `fifth_place` (`fifth_place`),
  ADD KEY `tournament_id` (`tournament_id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`tournament_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `players_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `results_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `tournament_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `fifth_place` FOREIGN KEY (`fifth_place`) REFERENCES `players` (`players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `first_place` FOREIGN KEY (`first_place`) REFERENCES `players` (`players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fourth_place` FOREIGN KEY (`fourth_place`) REFERENCES `players` (`players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `second_place` FOREIGN KEY (`second_place`) REFERENCES `players` (`players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `third_place` FOREIGN KEY (`third_place`) REFERENCES `players` (`players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tournament_id` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

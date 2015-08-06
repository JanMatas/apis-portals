-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: us-cdbr-iron-east-02.cleardb.net
-- Generation Time: Aug 06, 2015 at 08:40 AM
-- Server version: 5.5.42-log
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `heroku_73648698f572409`
--

-- --------------------------------------------------------

--
-- Table structure for table `por_permission`
--

CREATE TABLE IF NOT EXISTS `por_permission` (
  `sys_user_pk_` int(11) NOT NULL,
  `sys_area_pk_` int(11) NOT NULL,
  PRIMARY KEY (`sys_user_pk_`,`sys_area_pk_`),
  UNIQUE KEY `unique_permission` (`sys_user_pk_`,`sys_area_pk_`),
  KEY `sys_area_pk_` (`sys_area_pk_`),
  KEY `sys_user_pk_` (`sys_user_pk_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `por_permission`
--

INSERT INTO `por_permission` (`sys_user_pk_`, `sys_area_pk_`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `por_portal`
--

CREATE TABLE IF NOT EXISTS `por_portal` (
  `sys_reader_pk_` int(11) NOT NULL,
  `map_x` int(11) NOT NULL,
  `map_y` int(11) NOT NULL,
  `raspiId` int(11) NOT NULL,
  `learning_history` int(11) NOT NULL DEFAULT '1000',
  `thresholding` int(11) NOT NULL DEFAULT '80',
  `min_area` int(11) NOT NULL DEFAULT '40000',
  `min_dist_to_create` int(11) NOT NULL DEFAULT '400',
  `max_dist_to_parse` double NOT NULL DEFAULT '250',
  `shadow_thresh` double NOT NULL DEFAULT '0.5',
  `frame_width` int(11) NOT NULL DEFAULT '1280',
  `frame_height` int(11) NOT NULL DEFAULT '720',
  PRIMARY KEY (`sys_reader_pk_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `por_portal`
--

INSERT INTO `por_portal` (`sys_reader_pk_`, `map_x`, `map_y`, `raspiId`, `learning_history`, `thresholding`, `min_area`, `min_dist_to_create`, `max_dist_to_parse`, `shadow_thresh`, `frame_width`, `frame_height`) VALUES
(1, 4724, 5175, 1, 1000, 80, 2500, 40, 80, 0.5, 320, 240),
(2, 4719, 5050, 2, 1000, 80, 40000, 400, 250, 0.5, 1280, 720),
(3, 5032, 5053, 3, 1000, 80, 40000, 400, 250, 0.5, 1280, 720),
(4, 5031, 5179, 4, 1000, 80, 40000, 400, 250, 0.5, 1280, 720),
(5, 5233, 5205, 5, 1000, 80, 40000, 400, 250, 0.5, 1280, 720),
(6, 5373, 5125, 6, 1000, 80, 40000, 400, 250, 0.5, 1280, 720),
(7, 5240, 5029, 7, 1000, 80, 40000, 400, 250, 0.5, 1280, 720),
(8, 464, 270, 0, 1000, 80, 40000, 400, 250, 0.5, 1280, 720);

-- --------------------------------------------------------

--
-- Stand-in structure for view `por_subarea`
--
CREATE TABLE IF NOT EXISTS `por_subarea` (
`parent_pk_` int(11)
,`child_pk_` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `por_user_permission`
--
CREATE TABLE IF NOT EXISTS `por_user_permission` (
`sys_user_pk_` int(11)
,`sys_area_pk_` int(11)
,`username` varchar(20)
);
-- --------------------------------------------------------

--
-- Table structure for table `por_zone`
--

CREATE TABLE IF NOT EXISTS `por_zone` (
  `SYS_AREA_PK_` int(11) NOT NULL,
  `MAP_X` int(11) NOT NULL,
  `MAP_Y` int(11) NOT NULL,
  PRIMARY KEY (`SYS_AREA_PK_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `por_zone`
--

INSERT INTO `por_zone` (`SYS_AREA_PK_`, `MAP_X`, `MAP_Y`) VALUES
(5, 4585, 5111),
(6, 4879, 5114),
(8, 5194, 5121),
(9, 5301, 5291),
(10, 5561, 5126),
(11, 5263, 4947),
(12, 197, 328),
(13, 199, 225);

-- --------------------------------------------------------

--
-- Table structure for table `sys_aplk`
--

CREATE TABLE IF NOT EXISTS `sys_aplk` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` char(3) DEFAULT NULL,
  `CODE` varchar(8) DEFAULT NULL,
  `CNAME` varchar(30) DEFAULT NULL,
  `APINAME` varchar(30) DEFAULT NULL,
  `PREFIXPROG` varchar(4) DEFAULT NULL,
  `KSYST` varchar(8) DEFAULT NULL,
  `VER_PROG` varchar(10) DEFAULT NULL,
  `VER_SYST` varchar(10) DEFAULT NULL,
  `VER_DATA` varchar(10) DEFAULT NULL,
  `PROG_ID` int(11) DEFAULT NULL,
  `OINSTAL` varchar(254) DEFAULT NULL,
  `ORUN` varchar(254) DEFAULT NULL,
  `SS1` varchar(10) DEFAULT NULL,
  `SS2` varchar(10) DEFAULT NULL,
  `SS3` varchar(10) DEFAULT NULL,
  `SS4` varchar(10) DEFAULT NULL,
  `SS5` varchar(10) DEFAULT NULL,
  `SS6` varchar(10) DEFAULT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `sys_aplk`
--

INSERT INTO `sys_aplk` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `APINAME`, `PREFIXPROG`, `KSYST`, `VER_PROG`, `VER_SYST`, `VER_DATA`, `PROG_ID`, `OINSTAL`, `ORUN`, `SS1`, `SS2`, `SS3`, `SS4`, `SS5`, `SS6`, `DESCRIPTION`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, NULL, 'sys_system', 'system', NULL, NULL, '24.07e', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sys_systemManagement', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 'webVisitor', 'visitor', NULL, NULL, '25.21e', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dochádzka zamestnancov', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(72, NULL, NULL, NULL, 'webPatrol', 'patrol', 'ptr', NULL, '23.16d', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Prístup', NULL, NULL, NULL, NULL, 0, 1433335666, 3, NULL),
(73, NULL, NULL, NULL, 'webLuxDoor', 'luxdoor', 'lux', NULL, '4.01', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Návštevný systém', NULL, NULL, NULL, NULL, 0, 1433335666, 3, NULL),
(75, NULL, NULL, NULL, 'brana', 'brn', 'brn', NULL, '25.01', NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Podnikovy informacny system', NULL, NULL, NULL, NULL, 0, 1433335666, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_area`
--

CREATE TABLE IF NOT EXISTS `sys_area` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) COLLATE utf8_slovak_ci DEFAULT NULL,
  `REC_SELECT` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `CODE` int(11) DEFAULT NULL,
  `CNAME` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SHORTNAME` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SYS_OSTR_PK_` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `ST_` int(11) DEFAULT NULL,
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `LFT` int(11) NOT NULL,
  `RGT` int(11) NOT NULL,
  PRIMARY KEY (`PK_`),
  KEY `fk_sys_area_sys_ostr_idx` (`SYS_OSTR_PK_`),
  KEY `RGT` (`RGT`),
  KEY `LFT` (`LFT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sys_area`
--

INSERT INTO `sys_area` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `SHORTNAME`, `SYS_OSTR_PK_`, `DESCRIPTION`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`, `LFT`, `RGT`) VALUES
(1, NULL, NULL, NULL, 'Main Building', 'main', NULL, 'Main building on Lazovna 12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 18),
(2, NULL, NULL, NULL, 'Other Building', 'ohter', NULL, 'Other building on Na Motycinach 9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 24),
(3, NULL, NULL, NULL, 'Labs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 7),
(5, NULL, NULL, NULL, 'Back Lab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4),
(6, NULL, NULL, NULL, 'Main lab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 6),
(7, NULL, NULL, NULL, 'Rooms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 17),
(8, NULL, NULL, NULL, 'Corridor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 10),
(9, NULL, NULL, NULL, 'Brians office', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 12),
(10, NULL, NULL, NULL, 'Kitchen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 14),
(11, NULL, NULL, NULL, 'Common room', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 16),
(12, NULL, NULL, NULL, 'Storage A', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 21),
(13, NULL, NULL, NULL, 'Storage B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 23);

-- --------------------------------------------------------

--
-- Table structure for table `sys_company`
--

CREATE TABLE IF NOT EXISTS `sys_company` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` char(3) DEFAULT NULL,
  `CODE` varchar(254) DEFAULT NULL,
  `CNAME` varchar(254) DEFAULT NULL,
  `SHORTNAME` varchar(254) DEFAULT NULL,
  `KSTAT` varchar(3) DEFAULT NULL,
  `KICO` varchar(8) DEFAULT NULL,
  `BRANCH` varchar(2) DEFAULT NULL,
  `TYPE` varchar(1) DEFAULT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sys_company`
--

INSERT INTO `sys_company` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `SHORTNAME`, `KSTAT`, `KICO`, `BRANCH`, `TYPE`, `DESCRIPTION`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, NULL, 'ABC company, s.r.o', 'ABCsro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 'TestCompany', 'TestCo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_elog`
--

CREATE TABLE IF NOT EXISTS `sys_elog` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) COLLATE utf8_slovak_ci DEFAULT '',
  `REC_SELECT` varchar(3) COLLATE utf8_slovak_ci DEFAULT '',
  `T_READER` varchar(5) COLLATE utf8_slovak_ci DEFAULT NULL,
  `T_DATE` datetime DEFAULT NULL,
  `T_USERIP` varchar(15) COLLATE utf8_slovak_ci DEFAULT NULL,
  `T_TYP` varchar(10) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SS0` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SS1` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SS2` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SS3` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SS4` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SS5` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SS6` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SYS_COMPANY_PK_` int(11) DEFAULT NULL,
  `SYS_USER_PK_` int(11) DEFAULT NULL,
  `SYS_EMPLOYMENT_PK_` int(11) DEFAULT NULL,
  `SYS_VISIT_PK_` int(11) DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT '0',
  `TST_UPD` int(11) DEFAULT '0',
  `USER_PK_UPD` int(11) DEFAULT '0',
  `APL_UPD` varchar(20) COLLATE utf8_slovak_ci DEFAULT '',
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT '0',
  `ST_USER_PK_` int(11) DEFAULT '0',
  `ST_APL` varchar(20) COLLATE utf8_slovak_ci DEFAULT '',
  PRIMARY KEY (`PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=4713 ;

--
-- Dumping data for table `sys_elog`
--

INSERT INTO `sys_elog` (`PK_`, `REC_TYPE`, `REC_SELECT`, `T_READER`, `T_DATE`, `T_USERIP`, `T_TYP`, `SS0`, `SS1`, `SS2`, `SS3`, `SS4`, `SS5`, `SS6`, `SYS_COMPANY_PK_`, `SYS_USER_PK_`, `SYS_EMPLOYMENT_PK_`, `SYS_VISIT_PK_`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(2, '', '', '1', '2015-07-13 08:44:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(12, '', '', '1', '2015-07-13 09:40:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(22, '', '', '1', '2015-07-13 09:40:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(32, '', '', '1', '2015-07-13 14:04:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 2, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(42, '', '', '1', '2015-07-13 14:04:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 2, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(52, '', '', '1', '2015-07-13 14:04:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 2, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(62, '', '', '1', '2015-07-13 14:04:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(72, '', '', '1', '2015-07-13 14:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(82, '', '', '1', '2015-07-13 14:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(92, '', '', '1', '2015-07-13 14:04:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(102, '', '', '1', '2015-07-13 14:04:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(112, '', '', '1', '2015-07-17 12:53:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(122, '', '', '1', '2015-07-17 12:53:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(132, '', '', '1', '2015-07-17 12:56:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(142, '', '', '1', '2015-07-17 12:57:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(152, '', '', '1', '2015-07-17 12:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(162, '', '', '1', '2015-07-17 13:18:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(172, '', '', '1', '2015-07-17 13:19:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(182, '', '', '1', '2015-07-17 13:19:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(192, '', '', '1', '2015-07-17 13:19:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(202, '', '', '1', '2015-07-17 13:19:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(212, '', '', '1', '2015-07-17 13:19:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(222, '', '', '1', '2015-07-17 13:19:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(232, '', '', '1', '2015-07-17 13:20:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(242, '', '', '1', '2015-07-17 13:20:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(252, '', '', '1', '2015-07-17 13:20:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(262, '', '', '1', '2015-07-17 13:20:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(272, '', '', '1', '2015-07-17 13:34:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(282, '', '', '1', '2015-07-17 13:34:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(292, '', '', '1', '2015-07-17 13:34:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(302, '', '', '1', '2015-07-17 13:34:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(312, '', '', '1', '2015-07-17 13:34:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(322, '', '', '1', '2015-07-17 13:34:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(332, '', '', '1', '2015-07-17 13:34:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(342, '', '', '1', '2015-07-17 13:35:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(352, '', '', '1', '2015-07-17 13:35:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(362, '', '', '1', '2015-07-17 13:35:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(372, '', '', '1', '2015-07-17 13:35:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(382, '', '', '1', '2015-07-17 13:35:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(392, '', '', '1', '2015-07-17 13:35:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(402, '', '', '1', '2015-07-17 13:35:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(412, '', '', '1', '2015-07-17 13:35:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(422, '', '', '1', '2015-07-17 13:35:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(432, '', '', '1', '2015-07-17 13:35:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(442, '', '', '1', '2015-07-17 13:35:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(452, '', '', '1', '2015-07-17 13:35:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(462, '', '', '1', '2015-07-17 13:36:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(472, '', '', '1', '2015-07-17 13:36:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(482, '', '', '1', '2015-07-17 13:36:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(492, '', '', '1', '2015-07-17 13:36:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(502, '', '', '1', '2015-07-17 13:36:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(512, '', '', '1', '2015-07-17 13:54:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(522, '', '', '1', '2015-07-17 13:54:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(532, '', '', '1', '2015-07-17 13:54:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(542, '', '', '1', '2015-07-17 13:54:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(552, '', '', '1', '2015-07-17 13:54:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(562, '', '', '1', '2015-07-17 13:54:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(572, '', '', '1', '2015-07-17 13:54:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(582, '', '', '1', '2015-07-17 13:54:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(592, '', '', '1', '2015-07-17 13:54:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(602, '', '', '1', '2015-07-17 13:54:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(612, '', '', '1', '2015-07-17 13:54:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(622, '', '', '1', '2015-07-17 13:54:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(632, '', '', '1', '2015-07-17 13:54:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(642, '', '', '1', '2015-07-17 13:54:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(652, '', '', '1', '2015-07-17 13:54:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(662, '', '', '1', '2015-07-17 13:54:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(672, '', '', '1', '2015-07-17 13:54:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(682, '', '', '1', '2015-07-17 13:54:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(692, '', '', '1', '2015-07-17 13:54:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(702, '', '', '1', '2015-07-17 13:54:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(712, '', '', '1', '2015-07-17 13:54:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(722, '', '', '1', '2015-07-17 13:54:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(732, '', '', '1', '2015-07-17 13:54:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(742, '', '', '1', '2015-07-17 13:54:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(752, '', '', '1', '2015-07-17 13:54:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(762, '', '', '1', '2015-07-17 13:54:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(772, '', '', '1', '2015-07-17 13:54:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(782, '', '', '1', '2015-07-17 13:54:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(792, '', '', '1', '2015-07-17 13:54:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(802, '', '', '1', '2015-07-17 13:54:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(812, '', '', '1', '2015-07-17 13:54:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(822, '', '', '1', '2015-07-17 13:54:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(832, '', '', '1', '2015-07-17 13:54:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(842, '', '', '1', '2015-07-17 13:55:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(852, '', '', '1', '2015-07-17 13:55:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(862, '', '', '1', '2015-07-17 13:54:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(872, '', '', '1', '2015-07-17 13:55:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(882, '', '', '1', '2015-07-17 13:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(892, '', '', '1', '2015-07-17 13:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(902, '', '', '1', '2015-07-17 13:55:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(912, '', '', '1', '2015-08-02 12:44:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(922, '', '', '1', '2015-08-02 12:44:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(932, '', '', '1', '2015-08-02 12:44:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(942, '', '', '1', '2015-08-02 12:44:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 6, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(952, '', '', '1', '2015-08-03 11:31:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(962, '', '', '1', '2015-08-03 11:32:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(972, '', '', '2', '2015-08-03 11:33:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(982, '', '', '2', '2015-08-03 11:33:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(992, '', '', '2', '2015-08-03 11:38:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1002, '', '', '2', '2015-08-03 11:41:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1012, '', '', '2', '2015-08-03 11:42:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 7, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1022, '', '', '2', '2015-08-03 11:42:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 16, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1032, '', '', '2', '2015-08-03 11:43:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1042, '', '', '2', '2015-08-03 11:48:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1052, '', '', '1', '2015-08-03 12:14:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1062, '', '', '1', '2015-08-03 12:14:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1072, '', '', '1', '2015-08-03 12:14:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1082, '', '', '1', '2015-08-03 12:14:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1092, '', '', '1', '2015-08-03 12:14:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1102, '', '', '1', '2015-08-03 12:14:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1112, '', '', '1', '2015-08-03 12:14:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1122, '', '', '1', '2015-08-03 12:14:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1132, '', '', '1', '2015-08-03 12:14:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1142, '', '', '1', '2015-08-03 12:15:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1152, '', '', '1', '2015-08-03 12:15:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1162, '', '', '1', '2015-08-03 12:16:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1172, '', '', '1', '2015-08-03 12:16:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1182, '', '', '1', '2015-08-03 12:16:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1192, '', '', '1', '2015-08-03 12:16:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1202, '', '', '1', '2015-08-03 12:16:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1212, '', '', '1', '2015-08-03 12:16:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1222, '', '', '1', '2015-08-03 12:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1232, '', '', '1', '2015-08-03 12:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1242, '', '', '1', '2015-08-03 12:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1252, '', '', '1', '2015-08-03 12:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1262, '', '', '1', '2015-08-03 12:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1272, '', '', '1', '2015-08-03 12:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1282, '', '', '1', '2015-08-03 12:23:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1292, '', '', '1', '2015-08-03 12:23:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1302, '', '', '1', '2015-08-03 12:23:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1312, '', '', '1', '2015-08-03 12:23:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1322, '', '', '1', '2015-08-03 12:23:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1332, '', '', '1', '2015-08-03 12:23:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1342, '', '', '1', '2015-08-03 12:23:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1352, '', '', '1', '2015-08-03 12:23:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1362, '', '', '1', '2015-08-03 12:25:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1372, '', '', '1', '2015-08-03 12:25:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1382, '', '', '1', '2015-08-03 12:25:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1392, '', '', '1', '2015-08-03 12:25:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1402, '', '', '1', '2015-08-03 12:25:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1412, '', '', '1', '2015-08-03 12:25:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1422, '', '', '1', '2015-08-03 12:25:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1432, '', '', '1', '2015-08-03 12:25:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1442, '', '', '1', '2015-08-03 12:27:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1452, '', '', '1', '2015-08-03 12:27:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1462, '', '', '1', '2015-08-03 12:27:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1472, '', '', '1', '2015-08-03 12:27:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1482, '', '', '1', '2015-08-03 12:27:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1492, '', '', '1', '2015-08-03 12:27:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1502, '', '', '1', '2015-08-03 12:27:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1512, '', '', '1', '2015-08-03 12:27:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1522, '', '', '1', '2015-08-03 12:28:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1532, '', '', '1', '2015-08-03 12:29:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1542, '', '', '1', '2015-08-03 12:29:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1552, '', '', '1', '2015-08-03 12:30:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1562, '', '', '1', '2015-08-03 12:30:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1572, '', '', '1', '2015-08-03 12:31:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1582, '', '', '1', '2015-08-03 12:31:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1592, '', '', '1', '2015-08-03 12:31:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1602, '', '', '1', '2015-08-03 12:31:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1612, '', '', '1', '2015-08-03 12:31:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1622, '', '', '1', '2015-08-03 12:31:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1632, '', '', '1', '2015-08-03 12:31:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1642, '', '', '1', '2015-08-03 12:31:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1652, '', '', '1', '2015-08-03 12:31:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1662, '', '', '1', '2015-08-03 12:32:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1672, '', '', '1', '2015-08-03 12:32:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1682, '', '', '1', '2015-08-03 12:32:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1692, '', '', '1', '2015-08-03 12:32:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1702, '', '', '1', '2015-08-03 12:32:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1712, '', '', '1', '2015-08-03 12:32:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1722, '', '', '1', '2015-08-03 12:32:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1732, '', '', '1', '2015-08-03 12:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1742, '', '', '1', '2015-08-03 12:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1752, '', '', '1', '2015-08-03 12:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1762, '', '', '1', '2015-08-03 12:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1772, '', '', '1', '2015-08-03 12:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1782, '', '', '1', '2015-08-03 12:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1792, '', '', '1', '2015-08-03 12:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1802, '', '', '1', '2015-08-03 12:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1812, '', '', '1', '2015-08-03 12:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1822, '', '', '1', '2015-08-03 12:35:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1832, '', '', '1', '2015-08-03 12:35:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1842, '', '', '1', '2015-08-03 12:35:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1852, '', '', '1', '2015-08-03 12:35:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1862, '', '', '1', '2015-08-03 12:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1872, '', '', '1', '2015-08-03 12:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1882, '', '', '1', '2015-08-03 12:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1892, '', '', '1', '2015-08-03 12:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1902, '', '', '1', '2015-08-03 12:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1912, '', '', '1', '2015-08-03 12:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1922, '', '', '1', '2015-08-03 12:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1932, '', '', '1', '2015-08-03 12:36:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1942, '', '', '1', '2015-08-03 12:38:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1952, '', '', '1', '2015-08-03 12:38:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1962, '', '', '1', '2015-08-03 12:38:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1972, '', '', '1', '2015-08-03 12:38:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1982, '', '', '1', '2015-08-03 12:38:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(1992, '', '', '1', '2015-08-03 12:38:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2002, '', '', '1', '2015-08-03 12:44:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2012, '', '', '1', '2015-08-03 12:44:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2022, '', '', '1', '2015-08-03 12:44:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2032, '', '', '1', '2015-08-03 12:44:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2042, '', '', '1', '2015-08-03 12:44:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2052, '', '', '1', '2015-08-03 12:44:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2062, '', '', '1', '2015-08-03 12:44:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2072, '', '', '1', '2015-08-03 12:44:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2082, '', '', '1', '2015-08-03 12:46:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2092, '', '', '1', '2015-08-03 12:46:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2102, '', '', '1', '2015-08-03 12:46:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2112, '', '', '1', '2015-08-03 12:46:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2122, '', '', '1', '2015-08-03 12:46:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2132, '', '', '1', '2015-08-03 12:46:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2142, '', '', '1', '2015-08-03 12:46:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2152, '', '', '1', '2015-08-03 12:47:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2162, '', '', '1', '2015-08-03 12:47:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2172, '', '', '1', '2015-08-03 12:47:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2182, '', '', '1', '2015-08-03 12:47:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2192, '', '', '1', '2015-08-03 12:47:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2202, '', '', '1', '2015-08-03 12:47:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2212, '', '', '1', '2015-08-03 12:47:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2222, '', '', '1', '2015-08-03 12:49:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2232, '', '', '1', '2015-08-03 12:49:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2242, '', '', '1', '2015-08-03 12:49:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2252, '', '', '1', '2015-08-03 12:49:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2262, '', '', '1', '2015-08-03 12:49:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2272, '', '', '1', '2015-08-03 12:49:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2282, '', '', '1', '2015-08-03 12:49:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2292, '', '', '1', '2015-08-03 12:51:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2302, '', '', '1', '2015-08-03 12:51:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2312, '', '', '1', '2015-08-03 12:51:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2322, '', '', '1', '2015-08-03 12:52:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2332, '', '', '1', '2015-08-03 12:52:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2342, '', '', '1', '2015-08-03 12:52:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2352, '', '', '1', '2015-08-03 12:52:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2362, '', '', '1', '2015-08-03 12:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2372, '', '', '1', '2015-08-03 12:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2382, '', '', '1', '2015-08-03 12:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2392, '', '', '1', '2015-08-03 12:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2402, '', '', '1', '2015-08-03 12:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2412, '', '', '1', '2015-08-03 12:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2422, '', '', '1', '2015-08-03 12:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2432, '', '', '1', '2015-08-03 12:57:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2442, '', '', '1', '2015-08-03 12:57:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2452, '', '', '1', '2015-08-03 12:57:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2462, '', '', '1', '2015-08-03 12:57:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2472, '', '', '1', '2015-08-03 12:57:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2482, '', '', '1', '2015-08-03 12:57:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2492, '', '', '1', '2015-08-03 12:57:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2502, '', '', '1', '2015-08-03 12:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2512, '', '', '1', '2015-08-03 12:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2522, '', '', '1', '2015-08-03 12:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2532, '', '', '1', '2015-08-03 13:00:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2542, '', '', '1', '2015-08-03 13:00:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2552, '', '', '1', '2015-08-03 13:00:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2562, '', '', '1', '2015-08-03 13:00:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2572, '', '', '1', '2015-08-03 13:00:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2582, '', '', '1', '2015-08-03 13:00:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2592, '', '', '1', '2015-08-03 13:00:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2602, '', '', '1', '2015-08-03 13:00:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2612, '', '', '1', '2015-08-03 13:00:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2622, '', '', '1', '2015-08-03 13:00:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2632, '', '', '1', '2015-08-03 13:15:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2642, '', '', '1', '2015-08-03 13:15:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2652, '', '', '1', '2015-08-03 13:15:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2662, '', '', '1', '2015-08-03 13:31:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2672, '', '', '1', '2015-08-03 13:31:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2682, '', '', '1', '2015-08-03 13:31:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2692, '', '', '1', '2015-08-03 13:31:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2702, '', '', '1', '2015-08-03 13:31:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2712, '', '', '1', '2015-08-03 13:31:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2722, '', '', '1', '2015-08-03 13:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2732, '', '', '1', '2015-08-03 13:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2742, '', '', '1', '2015-08-03 13:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2752, '', '', '1', '2015-08-03 13:31:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2762, '', '', '1', '2015-08-03 13:34:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2772, '', '', '1', '2015-08-03 13:34:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2782, '', '', '1', '2015-08-03 13:34:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2792, '', '', '1', '2015-08-03 13:34:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2802, '', '', '1', '2015-08-03 13:34:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2812, '', '', '1', '2015-08-03 13:34:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2822, '', '', '1', '2015-08-03 13:34:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2832, '', '', '1', '2015-08-03 13:34:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2842, '', '', '1', '2015-08-03 13:35:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2852, '', '', '1', '2015-08-03 13:35:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2862, '', '', '1', '2015-08-03 13:35:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2872, '', '', '1', '2015-08-03 13:35:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2882, '', '', '1', '2015-08-03 13:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2892, '', '', '1', '2015-08-03 13:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2902, '', '', '1', '2015-08-03 13:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2912, '', '', '1', '2015-08-03 13:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2922, '', '', '1', '2015-08-03 13:35:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2932, '', '', '1', '2015-08-03 13:35:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2942, '', '', '1', '2015-08-03 13:35:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2952, '', '', '1', '2015-08-03 13:35:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2962, '', '', '1', '2015-08-03 13:35:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2972, '', '', '1', '2015-08-03 13:35:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2982, '', '', '1', '2015-08-03 13:35:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2992, '', '', '1', '2015-08-03 13:36:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3002, '', '', '1', '2015-08-03 13:36:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3012, '', '', '1', '2015-08-03 13:36:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3022, '', '', '1', '2015-08-03 13:36:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3032, '', '', '1', '2015-08-03 13:36:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3042, '', '', '1', '2015-08-03 13:36:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3052, '', '', '1', '2015-08-03 13:36:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3062, '', '', '1', '2015-08-03 13:36:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3072, '', '', '1', '2015-08-03 13:36:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3082, '', '', '1', '2015-08-03 13:36:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3092, '', '', '1', '2015-08-03 13:36:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3102, '', '', '1', '2015-08-03 13:37:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3112, '', '', '1', '2015-08-03 13:37:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3122, '', '', '1', '2015-08-03 13:37:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3132, '', '', '1', '2015-08-03 13:37:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3142, '', '', '1', '2015-08-03 13:37:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3152, '', '', '1', '2015-08-03 13:53:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3162, '', '', '1', '2015-08-03 13:53:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3172, '', '', '1', '2015-08-03 13:53:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3182, '', '', '1', '2015-08-03 13:53:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3192, '', '', '1', '2015-08-03 13:53:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3202, '', '', '1', '2015-08-03 13:53:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3212, '', '', '1', '2015-08-03 13:53:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3222, '', '', '1', '2015-08-03 13:53:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3232, '', '', '1', '2015-08-03 13:53:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3242, '', '', '1', '2015-08-03 13:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3252, '', '', '1', '2015-08-03 13:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3262, '', '', '1', '2015-08-03 13:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3272, '', '', '1', '2015-08-03 13:53:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3282, '', '', '1', '2015-08-03 13:53:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3292, '', '', '1', '2015-08-03 13:53:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3302, '', '', '1', '2015-08-03 13:53:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3312, '', '', '1', '2015-08-03 13:53:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3322, '', '', '1', '2015-08-03 13:53:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3332, '', '', '1', '2015-08-03 13:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3342, '', '', '1', '2015-08-03 13:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, '');
INSERT INTO `sys_elog` (`PK_`, `REC_TYPE`, `REC_SELECT`, `T_READER`, `T_DATE`, `T_USERIP`, `T_TYP`, `SS0`, `SS1`, `SS2`, `SS3`, `SS4`, `SS5`, `SS6`, `SYS_COMPANY_PK_`, `SYS_USER_PK_`, `SYS_EMPLOYMENT_PK_`, `SYS_VISIT_PK_`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(3352, '', '', '1', '2015-08-03 13:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3362, '', '', '1', '2015-08-03 13:53:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3372, '', '', '1', '2015-08-03 13:53:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3382, '', '', '1', '2015-08-03 13:53:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3392, '', '', '1', '2015-08-03 13:53:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3402, '', '', '1', '2015-08-03 13:53:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3412, '', '', '1', '2015-08-03 13:53:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3422, '', '', '1', '2015-08-03 13:53:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3432, '', '', '1', '2015-08-03 13:53:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3442, '', '', '1', '2015-08-03 13:53:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3452, '', '', '1', '2015-08-03 13:53:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3462, '', '', '1', '2015-08-03 13:54:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3472, '', '', '1', '2015-08-03 13:54:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3482, '', '', '1', '2015-08-03 13:54:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3492, '', '', '1', '2015-08-03 13:54:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3502, '', '', '1', '2015-08-03 13:54:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3512, '', '', '1', '2015-08-03 13:56:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3522, '', '', '1', '2015-08-03 13:56:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3532, '', '', '1', '2015-08-03 13:56:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3542, '', '', '1', '2015-08-03 13:56:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3552, '', '', '1', '2015-08-03 13:56:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3562, '', '', '1', '2015-08-03 13:56:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3572, '', '', '1', '2015-08-03 13:56:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3582, '', '', '1', '2015-08-03 13:56:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3592, '', '', '1', '2015-08-03 13:56:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3602, '', '', '1', '2015-08-03 13:56:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3612, '', '', '1', '2015-08-03 13:56:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3622, '', '', '1', '2015-08-03 13:56:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3632, '', '', '1', '2015-08-03 13:57:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3642, '', '', '1', '2015-08-03 13:57:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3652, '', '', '1', '2015-08-03 13:57:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3662, '', '', '1', '2015-08-03 13:57:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3672, '', '', '1', '2015-08-03 13:57:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3682, '', '', '1', '2015-08-03 13:57:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3692, '', '', '1', '2015-08-03 13:57:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3702, '', '', '1', '2015-08-03 13:57:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3712, '', '', '1', '2015-08-03 13:57:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3722, '', '', '1', '2015-08-03 13:57:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3732, '', '', '1', '2015-08-03 13:57:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3742, '', '', '1', '2015-08-03 13:57:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3752, '', '', '1', '2015-08-03 13:57:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3762, '', '', '1', '2015-08-03 13:58:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3772, '', '', '1', '2015-08-03 13:58:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3782, '', '', '1', '2015-08-03 13:58:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3792, '', '', '1', '2015-08-03 13:58:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3802, '', '', '1', '2015-08-03 13:58:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3812, '', '', '1', '2015-08-03 13:58:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3822, '', '', '1', '2015-08-03 13:58:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3832, '', '', '1', '2015-08-03 13:58:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3842, '', '', '1', '2015-08-03 13:58:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3852, '', '', '1', '2015-08-03 13:58:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3862, '', '', '1', '2015-08-03 13:58:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3872, '', '', '1', '2015-08-03 13:58:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3882, '', '', '1', '2015-08-03 13:59:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3892, '', '', '1', '2015-08-03 14:01:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3902, '', '', '1', '2015-08-03 14:01:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3912, '', '', '1', '2015-08-03 14:01:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3922, '', '', '1', '2015-08-03 14:01:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3932, '', '', '1', '2015-08-03 14:01:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3942, '', '', '1', '2015-08-03 14:01:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3952, '', '', '1', '2015-08-03 14:01:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3962, '', '', '1', '2015-08-03 14:01:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3972, '', '', '1', '2015-08-03 14:01:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3982, '', '', '1', '2015-08-03 14:01:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3992, '', '', '1', '2015-08-03 14:01:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4002, '', '', '1', '2015-08-03 14:01:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4012, '', '', '1', '2015-08-03 14:02:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4022, '', '', '1', '2015-08-03 14:02:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4032, '', '', '1', '2015-08-03 14:03:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4042, '', '', '1', '2015-08-03 14:03:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4052, '', '', '1', '2015-08-03 14:03:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4062, '', '', '1', '2015-08-03 14:03:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4072, '', '', '1', '2015-08-03 14:03:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4082, '', '', '1', '2015-08-03 14:03:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4092, '', '', '1', '2015-08-03 14:03:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4102, '', '', '1', '2015-08-03 14:03:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4112, '', '', '1', '2015-08-03 14:03:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4122, '', '', '1', '2015-08-03 14:03:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4132, '', '', '1', '2015-08-03 14:03:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4142, '', '', '1', '2015-08-03 14:03:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4152, '', '', '1', '2015-08-03 14:03:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4162, '', '', '1', '2015-08-03 14:03:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4172, '', '', '1', '2015-08-03 14:03:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4182, '', '', '1', '2015-08-03 14:03:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4192, '', '', '1', '2015-08-03 14:03:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4202, '', '', '1', '2015-08-03 14:03:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4212, '', '', '1', '2015-08-03 14:03:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4222, '', '', '1', '2015-08-03 14:03:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4232, '', '', '1', '2015-08-03 14:03:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4242, '', '', '1', '2015-08-03 14:03:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4252, '', '', '1', '2015-08-03 14:04:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4262, '', '', '1', '2015-08-03 14:04:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4272, '', '', '1', '2015-08-03 14:04:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4282, '', '', '1', '2015-08-03 14:04:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4292, '', '', '1', '2015-08-03 14:04:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4302, '', '', '1', '2015-08-03 14:04:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4312, '', '', '1', '2015-08-03 14:04:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4322, '', '', '1', '2015-08-03 14:04:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4332, '', '', '1', '2015-08-03 14:05:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4342, '', '', '1', '2015-08-03 14:05:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4352, '', '', '1', '2015-08-03 14:05:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4362, '', '', '1', '2015-08-03 14:05:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4372, '', '', '1', '2015-08-03 14:05:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4382, '', '', '1', '2015-08-03 14:05:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4392, '', '', '1', '2015-08-03 14:05:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4402, '', '', '1', '2015-08-03 14:05:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4412, '', '', '1', '2015-08-03 14:05:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4422, '', '', '1', '2015-08-03 14:05:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4432, '', '', '2', '2015-08-03 14:45:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4442, '', '', '2', '2015-08-03 14:47:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4452, '', '', '2', '2015-08-03 14:48:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4462, '', '', '2', '2015-08-03 14:48:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4472, '', '', '2', '2015-08-03 15:06:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4482, '', '', '2', '2015-08-03 15:14:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 7, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4492, '', '', '2', '2015-08-03 15:18:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4502, '', '', '2', '2015-08-03 15:19:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4512, '', '', '2', '2015-08-03 15:32:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 7, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4522, '', '', '2', '2015-08-03 15:34:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 7, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4532, '', '', '2', '2015-08-03 15:35:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Out', NULL, 2, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4542, '', '', '2', '2015-08-03 15:35:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 16, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4552, '', '', '1', '2015-08-03 16:25:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4562, '', '', '1', '2015-08-03 16:25:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4572, '', '', '1', '2015-08-03 16:25:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4582, '', '', '1', '2015-08-03 16:26:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4592, '', '', '1', '2015-08-03 16:26:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4602, '', '', '1', '2015-08-03 16:28:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4612, '', '', '1', '2015-08-03 16:28:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4622, '', '', '1', '2015-08-03 16:30:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4632, '', '', '1', '2015-08-03 16:30:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4642, '', '', '1', '2015-08-03 16:34:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4652, '', '', '1', '2015-08-03 16:34:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4662, '', '', '1', '2015-08-03 16:34:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4672, '', '', '1', '2015-08-03 16:37:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4682, '', '', '1', '2015-08-03 16:37:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4692, '', '', '1', '2015-08-04 17:03:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4702, '', '', '1', '2015-08-05 09:27:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'out', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(4712, '', '', '1', '2015-08-05 09:27:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'in', NULL, 100001, NULL, NULL, 0, 0, 0, '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_employment`
--

CREATE TABLE IF NOT EXISTS `sys_employment` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` char(3) DEFAULT NULL,
  `CODE` varchar(254) DEFAULT NULL,
  `CNAME` varchar(254) DEFAULT NULL,
  `SHORTNAME` varchar(254) DEFAULT NULL,
  `PERSONALNUMBER` int(11) DEFAULT NULL,
  `DATEBEGIN` char(8) DEFAULT NULL,
  `DATEEND` char(8) DEFAULT NULL,
  `USERSTATUS` int(11) DEFAULT NULL,
  `SYS_EMPLOYMENTTYPE_PK_` int(11) NOT NULL,
  `SYS_OSTR_PK_` int(11) NOT NULL,
  `SYS_COMPANY_PK_` int(11) NOT NULL,
  `SYS_USER_PK_` int(11) NOT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  `EMPLOYMENTNUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`PK_`),
  KEY `sys_employment_FI_1` (`SYS_EMPLOYMENTTYPE_PK_`),
  KEY `sys_employment_FI_2` (`SYS_OSTR_PK_`),
  KEY `sys_employment_FI_3` (`SYS_COMPANY_PK_`),
  KEY `sys_employment_FI_4` (`SYS_USER_PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `sys_employment`
--

INSERT INTO `sys_employment` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `SHORTNAME`, `PERSONALNUMBER`, `DATEBEGIN`, `DATEEND`, `USERSTATUS`, `SYS_EMPLOYMENTTYPE_PK_`, `SYS_OSTR_PK_`, `SYS_COMPANY_PK_`, `SYS_USER_PK_`, `DESCRIPTION`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`, `EMPLOYMENTNUMBER`) VALUES
(1, NULL, NULL, '1', NULL, NULL, 63, '', '', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(4, NULL, NULL, '1', NULL, NULL, 30, '', '', 1, 1, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(5, NULL, NULL, '1', NULL, NULL, 31, '', '', 1, 1, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0),
(6, NULL, NULL, '1', NULL, NULL, 13, '', '', 1, 1, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(7, NULL, NULL, '1', NULL, NULL, 64, '', '', 1, 1, 10, 1, 24, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(8, NULL, NULL, '1', NULL, NULL, 70, '', '', 1, 1, 4, 1, 10, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(9, NULL, NULL, '1', NULL, NULL, 57, '', '', 1, 1, 4, 1, 22, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(10, NULL, NULL, '1', NULL, NULL, 3, '', '', 1, 1, 2, 1, 17, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(11, NULL, NULL, '1', NULL, NULL, 33, '', '', 1, 1, 2, 1, 16, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(12, NULL, NULL, '1', NULL, NULL, 37, '', '', 1, 1, 2, 1, 9, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(13, NULL, NULL, '1', NULL, NULL, 49, '', '', 1, 1, 10, 1, 21, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(14, NULL, NULL, '1', NULL, NULL, 62, '', '', 1, 1, 10, 1, 23, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(15, NULL, NULL, '1', NULL, NULL, 36, '', '', 1, 1, 11, 1, 19, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(16, NULL, NULL, '1', NULL, NULL, 40, '', '', 1, 1, 5, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(17, NULL, NULL, '1', NULL, NULL, 75, '', '', 1, 1, 2, 1, 25, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(18, NULL, NULL, '1', NULL, NULL, 4, '', '', 1, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(19, NULL, NULL, '1', NULL, NULL, 5, '', '', 1, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(20, NULL, NULL, '1', NULL, NULL, 48, '', '', 1, 1, 11, 1, 20, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(21, NULL, NULL, '1', NULL, NULL, 77, '', '', 1, 1, 5, 1, 26, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(22, NULL, NULL, '1', NULL, NULL, 8, '', '', 1, 1, 10, 1, 18, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_employmenttype`
--

CREATE TABLE IF NOT EXISTS `sys_employmenttype` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` char(3) DEFAULT NULL,
  `CODE` varchar(254) DEFAULT NULL,
  `CNAME` varchar(254) DEFAULT NULL,
  `SHORTNAME` varchar(254) DEFAULT NULL,
  `SYS_COMPANY_PK_` int(11) NOT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`),
  KEY `sys_employmenttype_FI_1` (`SYS_COMPANY_PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sys_employmenttype`
--

INSERT INTO `sys_employmenttype` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `SHORTNAME`, `SYS_COMPANY_PK_`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, NULL, 'Zamestnanec', NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 'Brigádnik', NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(3, NULL, NULL, NULL, 'Zamestnanec', NULL, 2, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_kodd`
--

CREATE TABLE IF NOT EXISTS `sys_kodd` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` char(3) DEFAULT NULL,
  `CODE` varchar(9) DEFAULT NULL,
  `CNAME` varchar(30) DEFAULT NULL,
  `SHORTNAME` varchar(5) DEFAULT NULL,
  `IS_DAYLONG` tinyint(1) DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sys_kodd`
--

INSERT INTO `sys_kodd` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `SHORTNAME`, `IS_DAYLONG`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, '2', 'Obed', 'OB', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, NULL, NULL, '10', 'Dovolenka', 'DOV', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(3, NULL, NULL, '10', 'xxx', 'xxx', 0, NULL, NULL, NULL, NULL, 255, 1406276721, 1, NULL),
(4, NULL, NULL, '11', 'yyy', 'yyy', 0, NULL, NULL, NULL, NULL, 255, 1406276721, 1, NULL),
(5, NULL, NULL, '6', 'Lekár', 'LEK', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(6, NULL, NULL, '3', 'Pošta', 'POS', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(7, NULL, NULL, '13', 'Paragraf', 'PAR', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(8, NULL, NULL, '8', 'PN', 'PN', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(9, NULL, NULL, '12', 'Služobná cesta', 'SC', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(10, NULL, NULL, '11', 'Súkromne', 'SUKR', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(11, NULL, NULL, '5', 'Sviatok', 'SV', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(12, NULL, NULL, '7', 'OČR', 'OCR', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(13, NULL, NULL, '9', 'Služobne', 'SL', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_ostr`
--

CREATE TABLE IF NOT EXISTS `sys_ostr` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` char(3) DEFAULT NULL,
  `CODE` varchar(5) DEFAULT NULL,
  `CNAME` varchar(24) DEFAULT NULL,
  `SHORTNAME` varchar(24) DEFAULT NULL,
  `SYS_COMPANY_PK_` int(11) NOT NULL,
  `SYS_OSTR_PK_` int(11) DEFAULT NULL,
  `KOK1` varchar(2) DEFAULT NULL,
  `KOK2` varchar(2) DEFAULT NULL,
  `KOK3` varchar(2) DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`),
  KEY `sys_ostr_FI_1` (`SYS_COMPANY_PK_`),
  KEY `sys_ostr_FI_2` (`SYS_OSTR_PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sys_ostr`
--

INSERT INTO `sys_ostr` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `SHORTNAME`, `SYS_COMPANY_PK_`, `SYS_OSTR_PK_`, `KOK1`, `KOK2`, `KOK3`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, NULL, 'Vývoj', 'Vývoj', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 'Výroba', 'Výroba', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(3, NULL, NULL, NULL, 'Servis', 'Servis', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(4, NULL, NULL, NULL, 'Servis SW', 'Ser SW', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(5, NULL, NULL, NULL, 'Servis HW', 'Ser HW', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(6, NULL, NULL, NULL, 'Vývoj', 'Vývoj', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(7, NULL, NULL, NULL, 'Obchod', 'Obchod', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(8, NULL, NULL, NULL, 'Ekonomické', 'Ekon', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(9, NULL, NULL, NULL, 'xxx', 'xxx', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(10, NULL, NULL, NULL, 'Obchod', 'Obch', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(11, NULL, NULL, NULL, 'Ekonomické', 'Ekon', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_reader`
--

CREATE TABLE IF NOT EXISTS `sys_reader` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` varchar(3) DEFAULT NULL,
  `CODE` int(11) DEFAULT NULL,
  `CNAME` varchar(254) DEFAULT NULL,
  `SHORTNAME` varchar(254) DEFAULT NULL,
  `TYPE` varchar(254) DEFAULT NULL,
  `AREA_INP_PK_` int(11) DEFAULT NULL,
  `AREA_OUT_PK_` int(11) DEFAULT NULL,
  `SYS_COMPANY_PK_` int(11) DEFAULT NULL,
  `DISABLED` int(11) DEFAULT NULL,
  `SS1` int(11) DEFAULT NULL,
  `SS2` varchar(20) DEFAULT NULL,
  `SS3` varchar(20) DEFAULT NULL,
  `SS4` varchar(20) DEFAULT NULL,
  `SS5` varchar(20) DEFAULT NULL,
  `SS6` varchar(20) DEFAULT NULL,
  `SS7` varchar(20) DEFAULT NULL,
  `SS8` varchar(20) DEFAULT NULL,
  `SS9` varchar(20) DEFAULT NULL,
  `SS10` varchar(20) DEFAULT NULL,
  `CATEGOTY` varchar(254) DEFAULT NULL,
  `SUBCATEGOTY` varchar(254) DEFAULT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT NULL,
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`),
  KEY `fk_sys_reader_sys_area_idx` (`AREA_INP_PK_`),
  KEY `fk_sys_reader_sys_area1_idx` (`AREA_OUT_PK_`),
  KEY `fk_sys_reader_sys_company_idx` (`SYS_COMPANY_PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sys_reader`
--

INSERT INTO `sys_reader` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CODE`, `CNAME`, `SHORTNAME`, `TYPE`, `AREA_INP_PK_`, `AREA_OUT_PK_`, `SYS_COMPANY_PK_`, `DISABLED`, `SS1`, `SS2`, `SS3`, `SS4`, `SS5`, `SS6`, `SS7`, `SS8`, `SS9`, `SS10`, `CATEGOTY`, `SUBCATEGOTY`, `DESCRIPTION`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, 1, 'Back Lab Door 1', NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 2, 'Back Lab Door 2', NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 3, 'Lab Main Entrance', NULL, NULL, 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 4, 'Lab Side Entrance', NULL, NULL, 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, 5, 'Brians Office door', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 6, 'Kitchen door', NULL, NULL, 10, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 7, 'Common room door', NULL, NULL, 11, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 8, 'Storage door', NULL, NULL, 12, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_static_card`
--

CREATE TABLE IF NOT EXISTS `sys_static_card` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` varchar(3) DEFAULT NULL,
  `CARDNUMBER_OUT` varchar(254) DEFAULT NULL,
  `CARDNUMBER` varchar(254) DEFAULT NULL,
  `CARDNUMBER_TYPE` varchar(254) DEFAULT NULL,
  `CARDTYPE` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `SYS_USER_PK_` int(11) DEFAULT NULL,
  `DATE_STAMP` timestamp NULL DEFAULT NULL,
  `DATE_FROM` timestamp NULL DEFAULT NULL,
  `DATE_TO` timestamp NULL DEFAULT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT NULL,
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`),
  KEY `fk_sys_static_card_sys_user_idx` (`SYS_USER_PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=132 ;

--
-- Dumping data for table `sys_static_card`
--

INSERT INTO `sys_static_card` (`PK_`, `REC_TYPE`, `REC_SELECT`, `CARDNUMBER_OUT`, `CARDNUMBER`, `CARDNUMBER_TYPE`, `CARDTYPE`, `STATUS`, `SYS_USER_PK_`, `DATE_STAMP`, `DATE_FROM`, `DATE_TO`, `DESCRIPTION`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, NULL, '100000', NULL, NULL, NULL, 1, NULL, '2015-06-30 22:00:00', '2015-07-30 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, '100001', NULL, NULL, NULL, 2, NULL, '2015-06-30 22:00:00', '2015-07-30 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, '100002', NULL, NULL, NULL, 3, NULL, '2015-06-30 22:00:00', '2015-07-30 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, '100003', NULL, NULL, NULL, 4, NULL, '2015-06-30 22:00:00', '2015-07-30 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, NULL, NULL, NULL, 'undefined', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user`
--

CREATE TABLE IF NOT EXISTS `sys_user` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) COLLATE utf8_slovak_ci DEFAULT NULL,
  `REC_SELECT` char(3) COLLATE utf8_slovak_ci DEFAULT NULL,
  `LASTNAME` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `FIRSTNAME` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SURNAME` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `TITLE` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `TITLE2` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `LOGINNAME` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `LOGINPASS` varchar(60) COLLATE utf8_slovak_ci DEFAULT NULL,
  `SEX` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `BIRTHDATE` varchar(8) COLLATE utf8_slovak_ci DEFAULT NULL,
  `USERID` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `EMAIL` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `EMAIL2` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `PHONE` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `PHONEEXT` varchar(25) COLLATE utf8_slovak_ci DEFAULT NULL,
  `PHONE2` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `PHONEEXT2` varchar(25) COLLATE utf8_slovak_ci DEFAULT NULL,
  `STREET` varchar(50) COLLATE utf8_slovak_ci DEFAULT NULL,
  `CITY` varchar(50) COLLATE utf8_slovak_ci DEFAULT NULL,
  `ZIPCODE` varchar(10) COLLATE utf8_slovak_ci DEFAULT NULL,
  `KSTAT` varchar(3) COLLATE utf8_slovak_ci DEFAULT NULL,
  `OICQ` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `OSKYPE` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `OWWW` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `OSMS` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `OLANG` varchar(3) COLLATE utf8_slovak_ci DEFAULT NULL,
  `IMG` longblob,
  `IMGTYPE` varchar(4) COLLATE utf8_slovak_ci DEFAULT NULL,
  `DESCRIPTION` varchar(254) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A0` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A1` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A2` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A3` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A4` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A5` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A6` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A7` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A8` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `A9` char(1) COLLATE utf8_slovak_ci DEFAULT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  PRIMARY KEY (`PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` (`PK_`, `REC_TYPE`, `REC_SELECT`, `LASTNAME`, `FIRSTNAME`, `SURNAME`, `TITLE`, `TITLE2`, `LOGINNAME`, `LOGINPASS`, `SEX`, `BIRTHDATE`, `USERID`, `EMAIL`, `EMAIL2`, `PHONE`, `PHONEEXT`, `PHONE2`, `PHONEEXT2`, `STREET`, `CITY`, `ZIPCODE`, `KSTAT`, `OICQ`, `OSKYPE`, `OWWW`, `OSMS`, `OLANG`, `IMG`, `IMGTYPE`, `DESCRIPTION`, `A0`, `A1`, `A2`, `A3`, `A4`, `A5`, `A6`, `A7`, `A8`, `A9`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, 'jm6214', '$2a$10$ZoDgZQfsSWq7xf3eK3MiWuxtbAmlU0yi/MgmtFzDme02MjIfq/yuK', 'M', '19830131', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(2, NULL, NULL, 'Hrdy', 'Tor', NULL, 'Ing.', NULL, '4', '1b6453892473a467d07372d45eb05abc2031647a', 'M', '20140113', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(3, NULL, NULL, 'Hrdy', 'Tom', NULL, 'Ing.', NULL, '31', '632667547e7cd3e0466547863e1207a8c0c0c549', 'M', '19960511', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(4, NULL, NULL, 'Hrdy', 'Tom', NULL, 'Mgr.', NULL, '30', '22d200f8670dbdb3e253a90eee5098477c95c23d', 'M', '19640602', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(5, NULL, NULL, 'Hrdy', 'Tom', NULL, 'Ing.', NULL, '13', 'bd307a3ec329e10a2cff8fb87480823da114f8f4', 'M', '19711127', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(6, NULL, NULL, 'Hrdy', 'Tom', NULL, 'Ing.', NULL, '5', 'ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(7, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '40', 'af3e133428b9e25c55bc59fe534248e6a0c0f17b', 'M', '19800123', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(9, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '37', 'cb7a1d775e800fd1ee4049f7dca9e041eb9ba083', 'M', '20140806', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(10, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '70', 'b7103ca278a75cad8f7d065acda0c2e80da0b7dc', 'M', '19800702', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(16, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '33', 'b6692ea5df920cad691c20319a6fffd7a4a766b8', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(17, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '3', '77de68daecd823babbb58edb1c8e14d7106e83bb', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(18, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '8', 'fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(19, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '36', 'fc074d501302eb2b93e2554793fcaf50b3bf7291', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(20, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '48', '64e095fe763fc62418378753f9402623bea9e227', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(21, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '49', '2e01e17467891f7c933dbaa00e1459d23db3fe4f', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(22, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '57', '9109c85a45b703f87f1413a405549a2cea9ab556', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(23, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '62', '511a418e72591eb7e33f703f04c3fa16df6c90bd', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(24, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '64', 'c66c65175fecc3103b3b587be9b5b230889c8628', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(25, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '75', '450ddec8dd206c2e2ab1aeeaa90e85e51753b8b7', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(26, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, '77', 'd321d6f7ccf98b51540ec9d933f20898af3bd71e', 'M', '', NULL, 'test@skuska.sk', NULL, '+421904102239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_usericon`
--

CREATE TABLE IF NOT EXISTS `sys_usericon` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `SYS_USER_PK_` int(11) NOT NULL,
  `ICON_ID` varchar(254) NOT NULL,
  `MODULE_ID` varchar(254) NOT NULL,
  PRIMARY KEY (`PK_`),
  KEY `sys_usericon_FI_1` (`SYS_USER_PK_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sys_usericon`
--

INSERT INTO `sys_usericon` (`PK_`, `SYS_USER_PK_`, `ICON_ID`, `MODULE_ID`) VALUES
(1, 1, 'vis-settings-ico', 'visitor'),
(5, 1, 'vis-my-attendance-ico', 'visitor'),
(6, 3, 'vis-my-attendance-ico', 'visitor'),
(7, 2, 'vis-my-attendance-ico', 'visitor'),
(9, 20, 'vis-my-attendance-ico', 'visitor'),
(11, 19, 'vis-my-attendance-ico', 'visitor'),
(13, 21, 'vis-my-attendance-ico', 'visitor');

-- --------------------------------------------------------

--
-- Table structure for table `sys_y2ug`
--

CREATE TABLE IF NOT EXISTS `sys_y2ug` (
  `PK_` int(11) NOT NULL AUTO_INCREMENT,
  `REC_TYPE` varchar(2) DEFAULT NULL,
  `REC_SELECT` char(3) DEFAULT NULL,
  `SYS_USER_PK_` int(11) NOT NULL,
  `SYS_APLK_ID` int(11) NOT NULL,
  `APL_GRUP_PK_` int(11) NOT NULL,
  `APL_STATION_ID` smallint(6) DEFAULT NULL,
  `TST_UPD` int(11) DEFAULT NULL,
  `USER_PK_UPD` int(11) DEFAULT NULL,
  `APL_UPD` varchar(20) DEFAULT NULL,
  `ST_` int(11) DEFAULT '0',
  `ST_TST` int(11) DEFAULT NULL,
  `ST_USER_PK_` int(11) DEFAULT NULL,
  `ST_APL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_`),
  KEY `sys_y2ug_FI_1` (`SYS_USER_PK_`),
  KEY `sys_y2ug_FI_2` (`SYS_APLK_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `sys_y2ug`
--

INSERT INTO `sys_y2ug` (`PK_`, `REC_TYPE`, `REC_SELECT`, `SYS_USER_PK_`, `SYS_APLK_ID`, `APL_GRUP_PK_`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(5, NULL, NULL, 1, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(87, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(93, NULL, NULL, 17, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(94, NULL, NULL, 2, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(95, NULL, NULL, 6, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(96, NULL, NULL, 18, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(97, NULL, NULL, 5, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(98, NULL, NULL, 4, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(99, NULL, NULL, 3, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(100, NULL, NULL, 16, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(101, NULL, NULL, 19, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(102, NULL, NULL, 9, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(103, NULL, NULL, 7, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(104, NULL, NULL, 20, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(105, NULL, NULL, 21, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(106, NULL, NULL, 22, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(107, NULL, NULL, 23, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(108, NULL, NULL, 24, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(109, NULL, NULL, 10, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(110, NULL, NULL, 25, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(111, NULL, NULL, 26, 2, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure for view `por_subarea`
--
DROP TABLE IF EXISTS `por_subarea`;

CREATE ALGORITHM=UNDEFINED DEFINER=`b369ac359b0a33`@`%` SQL SECURITY DEFINER VIEW `por_subarea` AS (select `parent`.`PK_` AS `parent_pk_`,`child`.`PK_` AS `child_pk_` from (`sys_area` `parent` join `sys_area` `child`) where ((`child`.`LFT` >= `parent`.`LFT`) and (`child`.`RGT` <= `parent`.`RGT`)));

-- --------------------------------------------------------

--
-- Structure for view `por_user_permission`
--
DROP TABLE IF EXISTS `por_user_permission`;

CREATE ALGORITHM=UNDEFINED DEFINER=`b369ac359b0a33`@`%` SQL SECURITY DEFINER VIEW `por_user_permission` AS select `por_permission`.`sys_user_pk_` AS `sys_user_pk_`,`children`.`PK_` AS `sys_area_pk_`,`sys_user`.`LOGINNAME` AS `username` from (((`por_permission` join `sys_area` `parent` on((`por_permission`.`sys_area_pk_` = `parent`.`PK_`))) join `sys_area` `children` on(((`parent`.`LFT` <= `children`.`LFT`) and (`parent`.`RGT` >= `children`.`RGT`)))) join `sys_user` on((`por_permission`.`sys_user_pk_` = `sys_user`.`PK_`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `por_permission`
--
ALTER TABLE `por_permission`
  ADD CONSTRAINT `por_permission_ibfk_1` FOREIGN KEY (`sys_user_pk_`) REFERENCES `sys_user` (`PK_`),
  ADD CONSTRAINT `por_permission_ibfk_2` FOREIGN KEY (`sys_area_pk_`) REFERENCES `sys_area` (`PK_`);

--
-- Constraints for table `por_portal`
--
ALTER TABLE `por_portal`
  ADD CONSTRAINT `por_portal_ibfk_1` FOREIGN KEY (`sys_reader_pk_`) REFERENCES `sys_reader` (`PK_`);

--
-- Constraints for table `por_zone`
--
ALTER TABLE `por_zone`
  ADD CONSTRAINT `por_zone_ibfk_1` FOREIGN KEY (`SYS_AREA_PK_`) REFERENCES `sys_area` (`PK_`);

--
-- Constraints for table `sys_area`
--
ALTER TABLE `sys_area`
  ADD CONSTRAINT `fk_sys_area_sys_ostr` FOREIGN KEY (`SYS_OSTR_PK_`) REFERENCES `sys_ostr` (`PK_`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sys_reader`
--
ALTER TABLE `sys_reader`
  ADD CONSTRAINT `fk_sys_reader_sys_area` FOREIGN KEY (`AREA_INP_PK_`) REFERENCES `sys_area` (`PK_`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sys_reader_sys_area1` FOREIGN KEY (`AREA_OUT_PK_`) REFERENCES `sys_area` (`PK_`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sys_reader_sys_company` FOREIGN KEY (`SYS_COMPANY_PK_`) REFERENCES `sys_company` (`PK_`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sys_static_card`
--
ALTER TABLE `sys_static_card`
  ADD CONSTRAINT `fk_sys_static_card_sys_user` FOREIGN KEY (`SYS_USER_PK_`) REFERENCES `sys_user` (`PK_`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sys_usericon`
--
ALTER TABLE `sys_usericon`
  ADD CONSTRAINT `sys_usericon_FK_1` FOREIGN KEY (`SYS_USER_PK_`) REFERENCES `sys_user` (`PK_`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

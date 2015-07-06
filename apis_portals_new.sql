-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 06, 2015 at 12:20 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apis_portals_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `por_permission`
--

CREATE TABLE IF NOT EXISTS `por_permission` (
  `sys_user_pk_` int(11) NOT NULL,
  `sys_area_pk_` int(11) NOT NULL,
  PRIMARY KEY (`sys_user_pk_`,`sys_area_pk_`),
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
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(9, 1),
(17, 1),
(1, 2),
(16, 8);

-- --------------------------------------------------------

--
-- Table structure for table `por_portal`
--

CREATE TABLE IF NOT EXISTS `por_portal` (
  `sys_reader_pk_` int(11) NOT NULL,
  `map_x` int(11) NOT NULL,
  `map_y` int(11) NOT NULL,
  PRIMARY KEY (`sys_reader_pk_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `por_portal`
--

INSERT INTO `por_portal` (`sys_reader_pk_`, `map_x`, `map_y`) VALUES
(1, 232, -16),
(2, 232, 53),
(3, 2, -10),
(4, -3, 58),
(5, -92, -45),
(6, -94, 97),
(7, -235, 14);

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
(5, 332, 15),
(6, 149, 18),
(8, -95, 15),
(9, -91, -92),
(10, -92, 154),
(11, -407, 10);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sys_elog`
--

INSERT INTO `sys_elog` (`PK_`, `REC_TYPE`, `REC_SELECT`, `T_READER`, `T_DATE`, `T_USERIP`, `T_TYP`, `SS0`, `SS1`, `SS2`, `SS3`, `SS4`, `SS5`, `SS6`, `SYS_COMPANY_PK_`, `SYS_USER_PK_`, `SYS_EMPLOYMENT_PK_`, `SYS_VISIT_PK_`, `APL_STATION_ID`, `TST_UPD`, `USER_PK_UPD`, `APL_UPD`, `ST_`, `ST_TST`, `ST_USER_PK_`, `ST_APL`) VALUES
(1, '', '', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 1, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(2, '', '', '1', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In', NULL, 2, NULL, NULL, 0, 0, 0, '', 0, 0, 0, ''),
(3, '', '', NULL, '2015-07-03 13:11:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '', 0, 0, 0, '');

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
(1, NULL, NULL, 'Hrdy', 'Tom', NULL, '', NULL, 'jm6214', '$2a$10$ZoDgZQfsSWq7xf3eK3MiWuxtbAmlU0yi/MgmtFzDme02MjIfq/yuK', 'M', '19830131', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(2, NULL, NULL, 'Rusinovich', 'Michal', NULL, 'Ing.', NULL, '4', '1b6453892473a467d07372d45eb05abc2031647a', 'M', '20140113', NULL, 'mrusko@apis.sk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(3, NULL, NULL, 'Kasanova', 'Volodymir', NULL, 'Ing.', NULL, '31', '632667547e7cd3e0466547863e1207a8c0c0c549', 'M', '19960511', NULL, 'vkaraka@apis.sk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(4, NULL, NULL, 'Ptacek', 'Vladimir', NULL, 'Mgr.', NULL, '30', '22d200f8670dbdb3e253a90eee5098477c95c23d', 'M', '19640602', NULL, 'vstraka@apis.sk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(5, NULL, NULL, 'Halabala', 'Milan', NULL, 'Ing.', NULL, '13', 'bd307a3ec329e10a2cff8fb87480823da114f8f4', 'M', '19711127', NULL, 'halabala@apis.sk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(6, NULL, NULL, 'Surovy', 'Matej', NULL, 'Ing.', NULL, '5', 'ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4', 'M', '', NULL, 'msuro@apis.sk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL),
(7, NULL, NULL, 'Mukacenko', 'Petro', NULL, '', NULL, '40', 'af3e133428b9e25c55bc59fe534248e6a0c0f17b', 'M', '19800123', NULL, 'pm@apis.sk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL),
(9, NULL, NULL, 'Marková', 'Júlia', NULL, '', NULL, '37', 'cb7a1d775e800fd1ee4049f7dca9e041eb9ba083', 'Z', '20140806', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(10, NULL, NULL, 'Hudobna', 'Zdenislava', NULL, '', NULL, '70', 'b7103ca278a75cad8f7d065acda0c2e80da0b7dc', 'Z', '19800702', NULL, 'zhudecova@apis.sk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(16, NULL, NULL, 'Koval', 'Miguel', NULL, '', NULL, '33', 'b6692ea5df920cad691c20319a6fffd7a4a766b8', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(17, NULL, NULL, 'Karasek', 'Adalbert', NULL, '', NULL, '3', '77de68daecd823babbb58edb1c8e14d7106e83bb', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(18, NULL, NULL, 'Studenic', 'Maros', NULL, '', NULL, '8', 'fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(19, NULL, NULL, 'Milerová', 'Lucia', NULL, '', NULL, '36', 'fc074d501302eb2b93e2554793fcaf50b3bf7291', 'Z', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(20, NULL, NULL, 'Lesyková', 'Alana', NULL, '', NULL, '48', '64e095fe763fc62418378753f9402623bea9e227', 'Z', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(21, NULL, NULL, 'Matejková', 'Martina', NULL, '', NULL, '49', '2e01e17467891f7c933dbaa00e1459d23db3fe4f', 'Z', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(22, NULL, NULL, 'Tucny', 'Eros', NULL, '', NULL, '57', '9109c85a45b703f87f1413a405549a2cea9ab556', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(23, NULL, NULL, 'Miller', 'Hans', NULL, '', NULL, '62', '511a418e72591eb7e33f703f04c3fa16df6c90bd', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(24, NULL, NULL, 'Kotlík', 'Dušan', NULL, '', NULL, '64', 'c66c65175fecc3103b3b587be9b5b230889c8628', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(25, NULL, NULL, 'Pacomsky', 'Henry', NULL, '', NULL, '75', '450ddec8dd206c2e2ab1aeeaa90e85e51753b8b7', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(26, NULL, NULL, 'Hryc', 'Andy', NULL, '', NULL, '77', 'd321d6f7ccf98b51540ec9d933f20898af3bd71e', 'M', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

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
-- Structure for view `por_user_permission`
--
DROP TABLE IF EXISTS `por_user_permission`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `por_user_permission` AS select `por_permission`.`sys_user_pk_` AS `sys_user_pk_`,`children`.`PK_` AS `sys_area_pk_`,`sys_user`.`LOGINNAME` AS `username` from (((`por_permission` join `sys_area` `parent` on((`por_permission`.`sys_area_pk_` = `parent`.`PK_`))) join `sys_area` `children` on(((`parent`.`LFT` <= `children`.`LFT`) and (`parent`.`RGT` >= `children`.`RGT`)))) join `sys_user` on((`por_permission`.`sys_user_pk_` = `sys_user`.`PK_`)));

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
-- Constraints for table `sys_usericon`
--
ALTER TABLE `sys_usericon`
  ADD CONSTRAINT `sys_usericon_FK_1` FOREIGN KEY (`SYS_USER_PK_`) REFERENCES `sys_user` (`PK_`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : altislife

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-08 17:47:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `containers`
-- ----------------------------
DROP TABLE IF EXISTS `containers`;
CREATE TABLE `containers` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `owned` tinyint(1) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of containers
-- ----------------------------

-- ----------------------------
-- Table structure for `gangs`
-- ----------------------------
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE `gangs` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(3) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `weed_capture` int(1) NOT NULL DEFAULT '0',
  `heroin_capture` int(1) NOT NULL DEFAULT '0',
  `cocaine_capture` int(1) NOT NULL DEFAULT '0',
  `arms_capture` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gangs
-- ----------------------------

-- ----------------------------
-- Table structure for `houses`
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT '0',
  `garage` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of houses
-- ----------------------------

-- ----------------------------
-- Table structure for `kartel`
-- ----------------------------
DROP TABLE IF EXISTS `kartel`;
CREATE TABLE `kartel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of kartel
-- ----------------------------

-- ----------------------------
-- Table structure for `market`
-- ----------------------------
DROP TABLE IF EXISTS `market`;
CREATE TABLE `market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(50) NOT NULL,
  `minimumPrice` int(10) NOT NULL,
  `maximumPrice` int(10) NOT NULL,
  `currentPrice` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of market
-- ----------------------------
INSERT INTO `market` VALUES ('1', 'copper_refined', '1300', '1800', '1555');
INSERT INTO `market` VALUES ('2', 'iron_refined', '1300', '1800', '1611');
INSERT INTO `market` VALUES ('3', 'cement', '1300', '1800', '1301');
INSERT INTO `market` VALUES ('4', 'glass', '1300', '1800', '1582');
INSERT INTO `market` VALUES ('5', 'oil_processed', '1300', '1800', '1800');
INSERT INTO `market` VALUES ('6', 'salt_refined', '1300', '1800', '1790');
INSERT INTO `market` VALUES ('7', 'diamond_cut', '1300', '1800', '1550');
INSERT INTO `market` VALUES ('8', 'heroin_processed', '1400', '2200', '1719');
INSERT INTO `market` VALUES ('9', 'marijuana', '2200', '2800', '2546');
INSERT INTO `market` VALUES ('10', 'cocaine_processed', '2400', '3000', '2652');
INSERT INTO `market` VALUES ('15', 'goldbar', '25000', '25000', '25000');
INSERT INTO `market` VALUES ('16', 'bonds', '100000', '100000', '100000');

-- ----------------------------
-- Table structure for `players`
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `pid` varchar(17) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_licenses` text NOT NULL,
  `cop_licenses` text NOT NULL,
  `med_licenses` text NOT NULL,
  `civ_gear` text NOT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `civ_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `cop_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `med_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `civ_alive` tinyint(1) NOT NULL DEFAULT '0',
  `civ_position` varchar(64) NOT NULL DEFAULT '"[]"',
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0]"',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('17', 'Rob', '\"[`Rob`]\"', '76561198022865586', '19000', '57000', '0', '0', '\"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_pilot`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,0],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_cocaine`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,0]]\"', '\"[]\"', '\"[]\"', '\"[`U_C_Poloshirt_blue`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``],[[`pickaxe`,1]]]\"', '\"[]\"', '\"[]\"', '\"[80,40,0]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '0', '0', '0', '0', '1', '\"[23810.3,18602.6,0.00143886]\"', '\"[0,0,155]\"', '2017-03-07 15:32:59', '2017-03-07 19:51:42');

-- ----------------------------
-- Table structure for `realestate`
-- ----------------------------
DROP TABLE IF EXISTS `realestate`;
CREATE TABLE `realestate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  `rent` int(11) NOT NULL DEFAULT '0',
  `playername` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of realestate
-- ----------------------------

-- ----------------------------
-- Table structure for `vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `side` varchar(16) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '1',
  `damage` varchar(256) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tuning_data` varchar(300) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('82', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '0', '827532', '6', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-25 11:12:04', '[[1,1,0,0,1],^\\A3\\soft_F\\Offroad_01\\Data\\offroad_01_ext_BASE01_CO.paa^,0,3,[0,0,0.9],^maverick\\tuning\\bin\\materials\\fade.rvmat^]');
INSERT INTO `vehicles` VALUES ('83', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '0', '415257', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-25 11:58:12', '[]');
INSERT INTO `vehicles` VALUES ('84', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '0', '149124', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-28 12:09:22', '[[0,0,0,1,0],^a3\\soft_f\\offroad_01\\data\\offroad_01_ext_base03_co.paa^,0,0,[-1,-1,-1],^maverick\\tuning\\bin\\materials\\shine_blue.rvmat^]');
INSERT INTO `vehicles` VALUES ('85', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '0', '596221', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-03-04 01:35:12', '[]');

-- ----------------------------
-- Table structure for `wanted`
-- ----------------------------
DROP TABLE IF EXISTS `wanted`;
CREATE TABLE `wanted` (
  `wantedID` varchar(64) NOT NULL,
  `wantedName` varchar(32) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wanted
-- ----------------------------
INSERT INTO `wanted` VALUES ('76561198022865586', 'Rob', '[]', '0', '0', '2017-02-08 19:33:17');

-- ----------------------------
-- Procedure structure for `deleteDeadVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldContainers`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldContainers`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldContainers`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldGangs`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldHouses`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldHouses`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldWanted`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldWanted`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldWanted`()
BEGIN
  DELETE FROM `wanted` WHERE `active` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `resetLifeVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `resetLifeVehicles`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END
;;
DELIMITER ;

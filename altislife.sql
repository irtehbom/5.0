/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : altislife

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-03 17:00:41
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gangs
-- ----------------------------
INSERT INTO `gangs` VALUES ('1', '76561198022865586', 'Your Gang Namedwadawdaw', '\"[`76561198022865586`]\"', '8', '599572', '1', '2017-02-04 14:20:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of houses
-- ----------------------------
INSERT INTO `houses` VALUES ('2', '76561198022865586', '[3350.52,13161,0.387996]', '1', '0', '2017-02-04 13:26:33');

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
INSERT INTO `market` VALUES ('1', 'copper_refined', '390', '525', '462');
INSERT INTO `market` VALUES ('2', 'iron_refined', '450', '600', '593');
INSERT INTO `market` VALUES ('3', 'cement', '500', '700', '586');
INSERT INTO `market` VALUES ('4', 'glass', '600', '800', '749');
INSERT INTO `market` VALUES ('5', 'oil_processed', '750', '1050', '880');
INSERT INTO `market` VALUES ('6', 'salt_refined', '500', '750', '684');
INSERT INTO `market` VALUES ('7', 'diamond_cut', '700', '900', '860');
INSERT INTO `market` VALUES ('8', 'heroin_processed', '950', '1250', '1191');
INSERT INTO `market` VALUES ('9', 'marijuana', '1150', '1450', '1425');
INSERT INTO `market` VALUES ('10', 'cocaine_processed', '1300', '1550', '1382');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('12', 'Rob', '\"[`Rob`]\"', '76561198022865586', '0', '6724809', '7', '0', '\"[[`license_civ_driver`,1],[`license_civ_boat`,0],[`license_civ_pilot`,1],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,1],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,1],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_cocaine`,1],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,1]]\"', '\"[[`license_cop_cAir`,0],[`license_cop_cg`,0]]\"', '\"[]\"', '\"[`U_C_Poloshirt_stripped`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``],[]]\"', '\"[`U_B_CombatUniform_mcam`,`V_Rangemaster_belt`,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,`hgun_P07_snds_F`,[],[],[],[],[],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`],[``,``,``,``],[`muzzle_snds_L`,``,``,``],[]]\"', '\"[]\"', '\"[70,60,0]\"', '\"[70,50,0]\"', '\"[100,100,0]\"', '0', '3', '0', '0', '1', '\"[14074.1,18572.5,0.00128555]\"', '\"[438,0,204]\"', '2017-02-04 01:27:53', '2017-03-03 16:44:49');
INSERT INTO `players` VALUES ('13', 'CarlS', '\"[`CarlS`]\"', '76561198024323552', '0', '3000', '0', '0', '\"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_pilot`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,0],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_cocaine`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,0]]\"', '\"[]\"', '\"[]\"', '\"[`U_C_Poloshirt_burgundy`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`],[],[],[],[],[],[],[],[],[``,``,``,``],[``,``,``,``],[]]\"', '\"[]\"', '\"[]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '0', '0', '0', '0', '1', '\"[3618.96,13092,0.00146103]\"', '\"[0,0,3]\"', '2017-02-19 12:26:07', '2017-02-19 12:29:03');
INSERT INTO `players` VALUES ('14', 'Qwerty', '\"[`Qwerty`]\"', '76561198023100736', '0', '3000', '0', '0', '\"[]\"', '\"[]\"', '\"[]\"', '\"[]\"', '\"[]\"', '\"[]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '0', '0', '0', '0', '0', '\"[]\"', '\"[0,0,0]\"', '2017-02-19 13:06:20', '2017-02-19 13:06:20');
INSERT INTO `players` VALUES ('15', 'AntonyJ', '\"[`AntonyJ`]\"', '76561198015198428', '0', '3000', '0', '0', '\"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_pilot`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,0],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_cocaine`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,0]]\"', '\"[]\"', '\"[]\"', '\"[`U_C_Poloshirt_salmon`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``],[]]\"', '\"[]\"', '\"[]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '0', '0', '0', '0', '1', '\"[3612.77,12970.4,0.00149632]\"', '\"[0,0,4]\"', '2017-02-23 18:48:38', '2017-02-23 19:05:49');
INSERT INTO `players` VALUES ('16', 'Grim', '\"[`Lasher`]\"', '76561198023684678', '0', '3345', '0', '0', '\"[[`license_civ_driver`,0],[`license_civ_boat`,0],[`license_civ_pilot`,0],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,0],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,0],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_cocaine`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,0]]\"', '\"[]\"', '\"[]\"', '\"[``,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``],[]]\"', '\"[]\"', '\"[]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '0', '0', '0', '0', '1', '\"[3410.58,13120.5,0.00146818]\"', '\"[0,0,19]\"', '2017-02-24 10:16:08', '2017-02-28 09:53:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('82', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '0', '827532', '6', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-25 11:12:04', '[[1,1,0,0,1],^\\A3\\soft_F\\Offroad_01\\Data\\offroad_01_ext_BASE01_CO.paa^,0,3,[0,0,0.9],^maverick\\tuning\\bin\\materials\\fade.rvmat^]');
INSERT INTO `vehicles` VALUES ('83', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '0', '415257', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-25 11:58:12', '[]');
INSERT INTO `vehicles` VALUES ('84', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '0', '149124', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-28 12:09:22', '[[0,0,0,1,0],^a3\\soft_f\\offroad_01\\data\\offroad_01_ext_base03_co.paa^,0,0,[-1,-1,-1],^maverick\\tuning\\bin\\materials\\shine_blue.rvmat^]');

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

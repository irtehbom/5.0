/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : altislife

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-11 22:31:17
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
INSERT INTO `gangs` VALUES ('1', '76561198022865586', 'Your Gang Namedwadawdaw', '\"[`76561198022865586`]\"', '8', '0', '1', '2017-02-04 14:20:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('12', 'hellokitty', '\"[`Rob`]\"', '76561198022865586', '0', '1346818', '0', '0', '\"[[`license_civ_driver`,1],[`license_civ_boat`,0],[`license_civ_pilot`,1],[`license_civ_trucking`,0],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,1],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,1],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_cocaine`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,0]]\"', '\"[[`license_cop_cAir`,0],[`license_cop_cg`,0]]\"', '\"[]\"', '\"[`U_C_Poloshirt_stripped`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`],[],[],[],[`20Rnd_762x51_Mag`],[],[],[],[],[``,``,``,``],[``,``,``,``],[]]\"', '\"[`U_Rangemaster`,`V_Rangemaster_belt`,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,`hgun_P07_snds_F`,[],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`],[],[],[],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`],[``,``,``,``],[`muzzle_snds_L`,``,``,``],[]]\"', '\"[]\"', '\"[100,80,0.114537]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '0', '3', '0', '0', '1', '\"[3625.48,13124.8,0.00141525]\"', '\"[12,0,117]\"', '2017-02-04 01:27:53', '2017-02-11 22:11:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of realestate
-- ----------------------------
INSERT INTO `realestate` VALUES ('119', '76561198022865586', '[7031.59,16009.8,7.62939e-006]', '\"[[],0]\"', '\"[]\"', '1', '0', 'Rob');

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
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('1', 'civ', 'B_Heli_Light_01_F', 'Air', '76561198022865586', '1', '0', '1', '37592', '5', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 16:23:27');
INSERT INTO `vehicles` VALUES ('2', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '826705', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 18:16:44');
INSERT INTO `vehicles` VALUES ('3', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '222346', '5', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 18:25:40');
INSERT INTO `vehicles` VALUES ('4', 'civ', 'C_Heli_Light_01_civil_F', 'Air', '76561198022865586', '1', '0', '1', '934907', '11', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 18:55:46');
INSERT INTO `vehicles` VALUES ('5', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '767795', '6', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 18:56:53');
INSERT INTO `vehicles` VALUES ('6', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '115452', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 19:28:45');
INSERT INTO `vehicles` VALUES ('7', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '746324', '6', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 19:32:05');
INSERT INTO `vehicles` VALUES ('8', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '431611', '3', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 19:35:43');
INSERT INTO `vehicles` VALUES ('9', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '781564', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 19:59:43');
INSERT INTO `vehicles` VALUES ('10', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '765194', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 20:14:19');
INSERT INTO `vehicles` VALUES ('11', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '444898', '3', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 20:17:02');
INSERT INTO `vehicles` VALUES ('12', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '399099', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 20:20:14');
INSERT INTO `vehicles` VALUES ('13', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '859984', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 20:23:55');
INSERT INTO `vehicles` VALUES ('14', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '316817', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 20:41:16');
INSERT INTO `vehicles` VALUES ('15', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '499297', '3', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 20:59:43');
INSERT INTO `vehicles` VALUES ('16', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '583826', '0', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 21:06:04');
INSERT INTO `vehicles` VALUES ('17', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '833546', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 21:09:10');
INSERT INTO `vehicles` VALUES ('18', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '309381', '5', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 21:14:40');
INSERT INTO `vehicles` VALUES ('19', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '360674', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 21:19:00');
INSERT INTO `vehicles` VALUES ('20', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '641349', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:01:45');
INSERT INTO `vehicles` VALUES ('21', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '998367', '0', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:04:08');
INSERT INTO `vehicles` VALUES ('22', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '928018', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:12:34');
INSERT INTO `vehicles` VALUES ('23', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '560024', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:14:16');
INSERT INTO `vehicles` VALUES ('24', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '858478', '3', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:17:37');
INSERT INTO `vehicles` VALUES ('25', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '938634', '3', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:20:24');
INSERT INTO `vehicles` VALUES ('26', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '64213', '6', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:29:07');
INSERT INTO `vehicles` VALUES ('27', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '725991', '4', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:32:23');
INSERT INTO `vehicles` VALUES ('28', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '68632', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:36:27');
INSERT INTO `vehicles` VALUES ('29', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '417768', '6', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:39:05');
INSERT INTO `vehicles` VALUES ('30', 'civ', 'C_Hatchback_01_F', 'Car', '76561198022865586', '1', '0', '1', '634375', '1', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:40:27');
INSERT INTO `vehicles` VALUES ('31', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '254527', '6', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:48:23');
INSERT INTO `vehicles` VALUES ('32', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '474310', '0', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-04 22:52:25');
INSERT INTO `vehicles` VALUES ('33', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '456065', '2', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-05 10:56:36');
INSERT INTO `vehicles` VALUES ('34', 'cop', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '597640', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-06 19:20:30');
INSERT INTO `vehicles` VALUES ('35', 'cop', 'C_SUV_01_F', 'Car', '76561198022865586', '1', '0', '1', '417909', '3', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-06 21:58:43');
INSERT INTO `vehicles` VALUES ('36', 'civ', 'C_Offroad_02_unarmed_F', 'Car', '76561198022865586', '1', '0', '1', '700083', '4', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-07 19:17:51');
INSERT INTO `vehicles` VALUES ('37', 'civ', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '996533', '5', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-08 20:09:35');
INSERT INTO `vehicles` VALUES ('38', 'cop', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '497164', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-08 20:16:27');
INSERT INTO `vehicles` VALUES ('39', 'cop', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '587160', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-08 20:18:27');
INSERT INTO `vehicles` VALUES ('40', 'cop', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '735765', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-08 20:19:55');
INSERT INTO `vehicles` VALUES ('41', 'cop', 'C_Offroad_01_F', 'Car', '76561198022865586', '1', '0', '1', '399615', '7', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-08 20:21:35');
INSERT INTO `vehicles` VALUES ('42', 'civ', 'C_Heli_Light_01_civil_F', 'Air', '76561198022865586', '0', '0', '1', '277852', '9', '\"[[],0]\"', '\"[]\"', '1', '\"[]\"', '2017-02-08 20:59:34');

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
INSERT INTO `wanted` VALUES ('76561198022865586', 'hellokitty', '[]', '0', '0', '2017-02-08 19:33:17');

-- ----------------------------
-- Procedure structure for `deleteDeadVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteDeadVehicles`()
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
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldContainers`()
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
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldGangs`()
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
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldHouses`()
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
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldWanted`()
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
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END
;;
DELIMITER ;

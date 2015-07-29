/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50172
Source Host           : localhost:3306
Source Database       : storage

Target Server Type    : MYSQL
Target Server Version : 50172
File Encoding         : 65001

Date: 2015-07-30 01:02:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `list`
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list` (
  `code` char(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of list
-- ----------------------------
INSERT INTO `list` VALUES ('036', 'Австралийский доллар', '2015-07-29', '43.987');
INSERT INTO `list` VALUES ('051', 'Армянских драмов', '2015-07-29', '12.5727');
INSERT INTO `list` VALUES ('124', 'Канадский доллар', '2015-07-29', '46.2046');
INSERT INTO `list` VALUES ('156', 'Китайских юаней', '2015-07-29', '96.987');
INSERT INTO `list` VALUES ('203', 'Чешских крон', '2015-07-29', '24.6599');
INSERT INTO `list` VALUES ('208', 'Датских крон', '2015-07-29', '89.3319');
INSERT INTO `list` VALUES ('348', 'Венгерских форинтов', '2015-07-29', '21.5083');
INSERT INTO `list` VALUES ('356', 'Индийских рупий', '2015-07-29', '94.0619');
INSERT INTO `list` VALUES ('392', 'Японских иен', '2015-07-29', '48.7104');
INSERT INTO `list` VALUES ('398', 'Казахстанских тенге', '2015-07-29', '32.1619');
INSERT INTO `list` VALUES ('410', 'Вон Республики Корея', '2015-07-29', '51.6232');
INSERT INTO `list` VALUES ('417', 'Киргизских сомов', '2015-07-29', '98.6965');
INSERT INTO `list` VALUES ('498', 'Молдавских леев', '2015-07-29', '31.9063');
INSERT INTO `list` VALUES ('578', 'Норвежских крон', '2015-07-29', '73.4347');
INSERT INTO `list` VALUES ('702', 'Сингапурский доллар', '2015-07-29', '44.0453');
INSERT INTO `list` VALUES ('710', 'Южноафриканских рэндов', '2015-07-29', '47.723');
INSERT INTO `list` VALUES ('752', 'Шведских крон', '2015-07-29', '70.5841');
INSERT INTO `list` VALUES ('756', 'Швейцарский франк', '2015-07-29', '62.4527');
INSERT INTO `list` VALUES ('826', 'Фунт стерлингов Соединенного королевства', '2015-07-29', '93.5927');
INSERT INTO `list` VALUES ('840', 'Доллар США', '2015-07-29', '60.2231');
INSERT INTO `list` VALUES ('860', 'Узбекских сумов', '2015-07-29', '23.4058');
INSERT INTO `list` VALUES ('934', 'Новый туркменский манат', '2015-07-29', '17.214');
INSERT INTO `list` VALUES ('944', 'Азербайджанский манат', '2015-07-29', '57.339');
INSERT INTO `list` VALUES ('946', 'Новый румынский лей', '2015-07-29', '15.0905');
INSERT INTO `list` VALUES ('949', 'Турецкая лира', '2015-07-29', '21.7805');
INSERT INTO `list` VALUES ('960', 'СДР (специальные права заимствования)', '2015-07-29', '84.2184');
INSERT INTO `list` VALUES ('972', 'Таджикских сомони', '2015-07-29', '96.1339');
INSERT INTO `list` VALUES ('974', 'Белорусских рублей', '2015-07-29', '39.6988');
INSERT INTO `list` VALUES ('975', 'Болгарский лев', '2015-07-29', '34.0744');
INSERT INTO `list` VALUES ('978', 'Евро', '2015-07-29', '66.6248');
INSERT INTO `list` VALUES ('980', 'Украинских гривен', '2015-07-29', '27.2688');
INSERT INTO `list` VALUES ('985', 'Польский злотый', '2015-07-29', '16.166');
INSERT INTO `list` VALUES ('986', 'Бразильский реал', '2015-07-29', '17.9107');

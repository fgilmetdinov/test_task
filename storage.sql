/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50172
Source Host           : localhost:3306
Source Database       : storage

Target Server Type    : MYSQL
Target Server Version : 50172
File Encoding         : 65001

Date: 2015-07-30 11:21:49
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
INSERT INTO `list` VALUES ('AMD', 'Армянских драмов', '2015-07-30', '12.5297');
INSERT INTO `list` VALUES ('AUD', 'Австралийский доллар', '2015-07-30', '43.6953');
INSERT INTO `list` VALUES ('AZN', 'Азербайджанский манат', '2015-07-30', '56.9856');
INSERT INTO `list` VALUES ('BGN', 'Болгарский лев', '2015-07-30', '33.7931');
INSERT INTO `list` VALUES ('BRL', 'Бразильский реал', '2015-07-30', '17.7607');
INSERT INTO `list` VALUES ('BYR', 'Белорусских рублей', '2015-07-30', '39.346');
INSERT INTO `list` VALUES ('CAD', 'Канадский доллар', '2015-07-30', '46.1304');
INSERT INTO `list` VALUES ('CHF', 'Швейцарский франк', '2015-07-30', '62.0628');
INSERT INTO `list` VALUES ('CNY', 'Китайских юаней', '2015-07-30', '96.2579');
INSERT INTO `list` VALUES ('CZK', 'Чешских крон', '2015-07-30', '24.4574');
INSERT INTO `list` VALUES ('DKK', 'Датских крон', '2015-07-30', '88.581');
INSERT INTO `list` VALUES ('EUR', 'Евро', '2015-07-30', '65.9882');
INSERT INTO `list` VALUES ('GBP', 'Фунт стерлингов Соединенного королевства', '2015-07-30', '93.3134');
INSERT INTO `list` VALUES ('HUF', 'Венгерских форинтов', '2015-07-30', '21.349');
INSERT INTO `list` VALUES ('INR', 'Индийских рупий', '2015-07-30', '93.502');
INSERT INTO `list` VALUES ('JPY', 'Японских иен', '2015-07-30', '48.345');
INSERT INTO `list` VALUES ('KGS', 'Киргизских сомов', '2015-07-30', '98.0851');
INSERT INTO `list` VALUES ('KRW', 'Вон Республики Корея', '2015-07-30', '51.5246');
INSERT INTO `list` VALUES ('KZT', 'Казахстанских тенге', '2015-07-30', '31.8891');
INSERT INTO `list` VALUES ('MDL', 'Молдавских леев', '2015-07-30', '31.7653');
INSERT INTO `list` VALUES ('NOK', 'Норвежских крон', '2015-07-30', '73.3295');
INSERT INTO `list` VALUES ('PLN', 'Польский злотый', '2015-07-30', '15.9885');
INSERT INTO `list` VALUES ('RON', 'Новый румынский лей', '2015-07-30', '14.9555');
INSERT INTO `list` VALUES ('SEK', 'Шведских крон', '2015-07-30', '69.7034');
INSERT INTO `list` VALUES ('SGD', 'Сингапурский доллар', '2015-07-30', '43.7689');
INSERT INTO `list` VALUES ('TJS', 'Таджикских сомони', '2015-07-30', '95.4736');
INSERT INTO `list` VALUES ('TMT', 'Новый туркменский манат', '2015-07-30', '17.0883');
INSERT INTO `list` VALUES ('TRY', 'Турецкая лира', '2015-07-30', '21.5958');
INSERT INTO `list` VALUES ('UAH', 'Украинских гривен', '2015-07-30', '27.105');
INSERT INTO `list` VALUES ('USD', 'Доллар США', '2015-07-30', '59.7665');
INSERT INTO `list` VALUES ('UZS', 'Узбекских сумов', '2015-07-30', '23.2103');
INSERT INTO `list` VALUES ('XDR', 'СДР (специальные права заимствования)', '2015-07-30', '83.5165');
INSERT INTO `list` VALUES ('ZAR', 'Южноафриканских рэндов', '2015-07-30', '47.5288');

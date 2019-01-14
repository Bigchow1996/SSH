/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : ssh2

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2019-01-13 21:14:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` varchar(255) NOT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu` (`pid`),
  CONSTRAINT `fk_menu` FOREIGN KEY (`pid`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('buggl', 'xtgl', 'bug管理', null, '/admin/buggl.jsp');
INSERT INTO `menu` VALUES ('sy', null, '首页', null, '');
INSERT INTO `menu` VALUES ('xngl', 'xtgl', '性能管理', null, '/admin/xngl.jsp');
INSERT INTO `menu` VALUES ('xtgl', 'sy', '系统管理', null, null);
INSERT INTO `menu` VALUES ('yhgl', 'xtgl', '用户管理', null, '/admin/yhgl.jsp');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('40289c81683b678701683b7772730001', 'bigchow', 'bfd59291e825b5f2bbf1eb76569f8fe7', '2019-01-11 13:51:50', null);

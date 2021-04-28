/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : fileshop

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2021-04-28 10:47:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` int(20) NOT NULL COMMENT '订单id',
  `fileid` int(20) NOT NULL COMMENT '资料id',
  `id` int(20) NOT NULL COMMENT '用户id',
  `money` varchar(50) NOT NULL COMMENT '金额',
  PRIMARY KEY  (`oid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `paytable` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `paytable`
-- ----------------------------
DROP TABLE IF EXISTS `paytable`;
CREATE TABLE `paytable` (
  `pid` int(20) NOT NULL COMMENT '支付id',
  `oid` int(20) NOT NULL COMMENT '订单id',
  `pay_money` varchar(50) NOT NULL COMMENT '支付金额',
  `ptime` varchar(50) NOT NULL COMMENT '支付时间',
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paytable
-- ----------------------------

-- ----------------------------
-- Table structure for `price`
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id` int(20) NOT NULL COMMENT '用户id',
  `fileid` int(20) NOT NULL COMMENT '文件id',
  `money` varchar(50) NOT NULL COMMENT '价格',
  `edate` varchar(50) NOT NULL COMMENT '生效日期',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price
-- ----------------------------

-- ----------------------------
-- Table structure for `ufile`
-- ----------------------------
DROP TABLE IF EXISTS `ufile`;
CREATE TABLE `ufile` (
  `id` int(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `ofile_name` varchar(50) NOT NULL COMMENT '原文件名',
  `classfied` varchar(50) NOT NULL COMMENT '分类',
  `valid` varchar(20) NOT NULL COMMENT '有效性',
  `utime` varchar(50) NOT NULL COMMENT '上传时间',
  PRIMARY KEY  (`id`),
  CONSTRAINT `ufile_ibfk_1` FOREIGN KEY (`id`) REFERENCES `price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ufile
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `ugender` varchar(20) NOT NULL COMMENT '性别',
  `inumber` varchar(50) NOT NULL COMMENT '身份证号',
  `phone` varchar(50) NOT NULL COMMENT '联系方式',
  `state` varchar(20) NOT NULL COMMENT '用户状态',
  PRIMARY KEY  (`id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ufile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50560
Source Host           : 127.0.0.1:3306
Source Database       : sc

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-07-31 15:15:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(40) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  `cscore` double(40,0) NOT NULL,
  `cteacher` int(40) DEFAULT NULL,
  `crid` int(40) DEFAULT NULL,
  `cdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`),
  KEY `crid` (`crid`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`crid`) REFERENCES `croom` (`crid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '英语', '4', '6', '4', '周三7,8节课');
INSERT INTO `course` VALUES ('2', '高等数学', '4', '2', '5', '周二7,8节课');
INSERT INTO `course` VALUES ('3', 'c语言', '3', '8', '3', '周五3,4节');
INSERT INTO `course` VALUES ('4', '物理', '2', '10', '3', '周五7,8节');
INSERT INTO `course` VALUES ('5', '化学', '2', '7', '2', '周一3,4节');
INSERT INTO `course` VALUES ('6', '历史', '1', '2', '1', '周二3,4节课');
INSERT INTO `course` VALUES ('7', 'Java SE', '2', '8', '3', '周五1,2节');
INSERT INTO `course` VALUES ('8', 'Java EE', '2', '7', '3', '周五7,8节');
INSERT INTO `course` VALUES ('10', 'JavaScript', '1', '8', '3', '周一3,4节');

-- ----------------------------
-- Table structure for croom
-- ----------------------------
DROP TABLE IF EXISTS `croom`;
CREATE TABLE `croom` (
  `crid` int(40) NOT NULL AUTO_INCREMENT,
  `crname` varchar(255) NOT NULL,
  `crmaxnum` int(40) NOT NULL,
  PRIMARY KEY (`crid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of croom
-- ----------------------------
INSERT INTO `croom` VALUES ('1', '2#202', '35');
INSERT INTO `croom` VALUES ('2', '7#308', '26');
INSERT INTO `croom` VALUES ('3', '3#304', '33');
INSERT INTO `croom` VALUES ('4', '1#304', '32');
INSERT INTO `croom` VALUES ('5', '3#207', '36');
INSERT INTO `croom` VALUES ('6', '7#302', '33');
INSERT INTO `croom` VALUES ('9', '3#211', '33');

-- ----------------------------
-- Table structure for notes
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `nid` int(40) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `start_time` date NOT NULL,
  `stop_time` date NOT NULL,
  `ndesc` varchar(255) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes
-- ----------------------------
INSERT INTO `notes` VALUES ('5', '测试公告1', '2018-06-11', '2018-06-13', '测试公告1');
INSERT INTO `notes` VALUES ('20', '测试公告2', '2018-06-08', '2018-06-16', '测试公告2');
INSERT INTO `notes` VALUES ('21', '测试公告', '2018-06-06', '2018-06-16', '测试公告3');
INSERT INTO `notes` VALUES ('22', '测试公告', '2018-06-07', '2018-06-16', '测试公告4');
INSERT INTO `notes` VALUES ('23', '测试公告', '2018-06-07', '2018-06-16', '测试公告5');
INSERT INTO `notes` VALUES ('24', '测试公告', '2018-06-07', '2018-06-16', '测试公告6');
INSERT INTO `notes` VALUES ('25', '测试公告', '2018-06-07', '2018-06-16', '测试公告7');
INSERT INTO `notes` VALUES ('26', '测试公告', '2018-06-07', '2018-06-16', '测试公告8');
INSERT INTO `notes` VALUES ('27', '测试公告', '2018-06-07', '2018-06-16', '测试公告9');
INSERT INTO `notes` VALUES ('28', '测试公告', '2018-06-07', '2018-06-16', '测试公告10');
INSERT INTO `notes` VALUES ('29', '测试公告', '2018-06-07', '2018-06-16', '测试公告11');
INSERT INTO `notes` VALUES ('30', '测试公告', '2018-06-07', '2018-06-16', '测试公告12');
INSERT INTO `notes` VALUES ('31', '测试公告', '2018-06-07', '2018-06-16', '测试公告13');
INSERT INTO `notes` VALUES ('32', '测试公告', '2018-06-07', '2018-06-16', '测试公告14');
INSERT INTO `notes` VALUES ('33', '测试公告', '2018-06-07', '2018-06-16', '测试公告15');
INSERT INTO `notes` VALUES ('34', '测试公告', '2018-06-07', '2018-06-16', '测试公告16');
INSERT INTO `notes` VALUES ('35', '测试公告', '2018-06-07', '2018-06-16', '测试公告17');
INSERT INTO `notes` VALUES ('36', '测试公告', '2018-06-07', '2018-06-16', '测试公告18');
INSERT INTO `notes` VALUES ('37', '测试公告', '2018-06-07', '2018-06-16', '测试公告19');
INSERT INTO `notes` VALUES ('38', '测试公告', '2018-06-07', '2018-06-16', '测试公告20');
INSERT INTO `notes` VALUES ('39', '测试公告', '2018-06-07', '2018-06-16', '测试公告21');
INSERT INTO `notes` VALUES ('40', '测试公告', '2018-06-07', '2018-06-16', '测试公告22');
INSERT INTO `notes` VALUES ('41', '测试公告', '2018-06-07', '2018-06-16', '测试公告23');
INSERT INTO `notes` VALUES ('42', '测试公告', '2018-06-07', '2018-06-16', '测试公告24');
INSERT INTO `notes` VALUES ('43', '测试公告', '2018-06-07', '2018-06-16', '测试公告25');
INSERT INTO `notes` VALUES ('44', '测试公告', '2018-06-07', '2018-06-16', '测试公告26');
INSERT INTO `notes` VALUES ('45', '测试公告', '2018-06-07', '2018-06-16', '测试公告27');
INSERT INTO `notes` VALUES ('46', '测试公告', '2018-06-07', '2018-06-16', '测试公告28');
INSERT INTO `notes` VALUES ('47', '测试公告', '2018-06-07', '2018-06-16', '测试公告29');
INSERT INTO `notes` VALUES ('48', '测试公告', '2018-06-07', '2018-06-16', '测试公告30');
INSERT INTO `notes` VALUES ('49', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('50', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('51', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('52', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('53', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('54', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('55', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('56', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('57', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('58', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('59', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('60', '测试公告', '2018-06-07', '2018-06-23', '测试公告');
INSERT INTO `notes` VALUES ('61', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('62', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('63', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('64', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('65', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('66', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('67', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('68', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('69', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('70', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('71', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('72', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('73', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('74', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('75', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('76', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('77', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('78', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('79', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('80', '测试公告', '2018-06-07', '2018-06-16', '测试公告');
INSERT INTO `notes` VALUES ('81', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');
INSERT INTO `notes` VALUES ('82', '测试公告', '2018-06-07', '2018-06-16', '测试公告31a');
INSERT INTO `notes` VALUES ('83', '测试公告', '2018-06-07', '2018-06-16', '测试公告31');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `sid` int(40) NOT NULL AUTO_INCREMENT,
  `ucid` int(40) NOT NULL,
  `pscore` double(40,0) DEFAULT NULL,
  `qscore` double(40,0) DEFAULT NULL,
  `zscore` double(40,0) DEFAULT NULL,
  PRIMARY KEY (`sid`,`ucid`),
  KEY `ucid` (`ucid`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`ucid`) REFERENCES `ucourse` (`ucid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '1', '56', '78', '69');
INSERT INTO `score` VALUES ('2', '2', '98', '80', '87');
INSERT INTO `score` VALUES ('3', '3', '66', '85', '77');
INSERT INTO `score` VALUES ('4', '4', '89', '86', '87');
INSERT INTO `score` VALUES ('5', '5', '96', '70', '80');
INSERT INTO `score` VALUES ('6', '6', '49', '62', '57');
INSERT INTO `score` VALUES ('7', '7', '70', '91', '83');
INSERT INTO `score` VALUES ('8', '8', '68', '95', '84');
INSERT INTO `score` VALUES ('9', '9', '86', '87', '86');
INSERT INTO `score` VALUES ('10', '10', '77', '86', '82');
INSERT INTO `score` VALUES ('11', '11', '56', '89', '76');
INSERT INTO `score` VALUES ('12', '12', '79', '53', '63');
INSERT INTO `score` VALUES ('13', '13', '92', '75', '82');

-- ----------------------------
-- Table structure for ucourse
-- ----------------------------
DROP TABLE IF EXISTS `ucourse`;
CREATE TABLE `ucourse` (
  `ucid` int(40) NOT NULL AUTO_INCREMENT,
  `uid` int(40) NOT NULL,
  `cid` int(40) NOT NULL,
  PRIMARY KEY (`ucid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  CONSTRAINT `ucourse_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `ucourse_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ucourse
-- ----------------------------
INSERT INTO `ucourse` VALUES ('1', '3', '1');
INSERT INTO `ucourse` VALUES ('2', '3', '2');
INSERT INTO `ucourse` VALUES ('3', '12', '2');
INSERT INTO `ucourse` VALUES ('4', '12', '3');
INSERT INTO `ucourse` VALUES ('5', '13', '1');
INSERT INTO `ucourse` VALUES ('6', '13', '3');
INSERT INTO `ucourse` VALUES ('7', '14', '1');
INSERT INTO `ucourse` VALUES ('8', '15', '3');
INSERT INTO `ucourse` VALUES ('9', '14', '2');
INSERT INTO `ucourse` VALUES ('10', '16', '3');
INSERT INTO `ucourse` VALUES ('11', '16', '1');
INSERT INTO `ucourse` VALUES ('12', '16', '2');
INSERT INTO `ucourse` VALUES ('13', '13', '2');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `school_num` varchar(20) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `grade` varchar(40) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(10) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `school_num` (`school_num`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users 角色0为管理员，1为老师，2为学生
-- ----------------------------
INSERT INTO `users` VALUES ('1', null, 'harry', null, null, null, '123@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '0', null, null, null, null);
INSERT INTO `users` VALUES ('2', 'tc001', '杜甫', '', '', '', '234@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', '男', '234', '13345670980', '社区3');
INSERT INTO `users` VALUES ('3', 'stu001', '李太白', '2010', '杭州商学院', '土木工程', '345@qq.com', 'c81e728d9d4c2f636f067f89cc14862c', '2', '男', '345', '13337894334', '社区8');
INSERT INTO `users` VALUES ('6', 'tc002', '李白', null, null, null, '134@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', '男', '134', '13333334791', '社区2');
INSERT INTO `users` VALUES ('7', 'tc003', '孟浩然', null, null, null, '135@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', '男', '135', '13333334327', '社区2');
INSERT INTO `users` VALUES ('8', 'tc004', '陶渊明', null, null, null, '136@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', '男', '136', '13334783333', '社区2');
INSERT INTO `users` VALUES ('9', 'tc005', '屈原', null, null, null, '137@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', '男', '123', '1334332863', '社区2');
INSERT INTO `users` VALUES ('10', 'tc006', '白居易', null, null, null, '138@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', '男', '123', '1334343863', '社区2');
INSERT INTO `users` VALUES ('11', 'tc007', '李斯', null, '', null, '139@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', '男', '123', '1334347863', '社区2');
INSERT INTO `users` VALUES ('12', 'stu002', '李商隐', '2010', '杭州商学院', '机械', '346@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2', '女', '346', '13337894333', '社区3');
INSERT INTO `users` VALUES ('13', 'stu003', '李薇', '2010', '杭州商学院', '计算机', '347@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2', '女', '347', '13337894335', '社区4');
INSERT INTO `users` VALUES ('14', 'stu004', '林达', '2010', '杭州商学院', '航空航天', '348@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2', '男', '348', '13337894332', '社区5');
INSERT INTO `users` VALUES ('15', 'stu005', '张国胜', '2010', '杭州商学院', '水利水电', '349@qq.com', '202cb962ac59075b964b07152d234b70', '2', '男', '349', '13337894333', '社区6');
INSERT INTO `users` VALUES ('16', 'stu006', '赵芸', '2010', '杭州商学院', '生物工程', '350@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2', '男', '350', '13337894333', '社区1');
INSERT INTO `users` VALUES ('17', 'stu007', '张伟', '2010', '杭州商学院', '行政管理', '351@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2', '男', '351', '13678900987', '社区10');
INSERT INTO `users` VALUES ('21', 'stu008', '王芳', '2010', '杭州商学院', '汉语言文学', '352@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2', '女', '352', '13678300987', '社区9');
INSERT INTO `users` VALUES ('22', '', '', '', '', '', '', 'ks2a62ds87D9AS', '0', '', '', '', '');
INSERT INTO `users` VALUES ('24', 'stu009', '李林', '2010', '杭州', '化工', '353@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2', '男', '353', '13245670981', '社区41');
INSERT INTO `users` VALUES ('26', 'stu010', '张敏', '2010', '杭州商学院1', '行政管理', '354@qq.com', '202cb962ac59075b964b07152d234b70', '2', '女', '354', '13678900987', '社区6');
INSERT INTO `users` VALUES ('27', 'stu011', '李秀英', '2011', '杭州商学院', '材料科学与工程', '355@qq.com', 'c20ad4d76fe97759aa27a0c99bff6710', '2', '女', '355', '13337894312', '社区10');
INSERT INTO `users` VALUES ('28', 'stu012', '李娜', '2010', '杭州商学院', '汉语言文学', '356@qq.com', '202cb962ac59075b964b07152d234b70', '2', '女', '356', '13337894346', '社区9');

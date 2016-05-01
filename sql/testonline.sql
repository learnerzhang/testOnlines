/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : testonline

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-30 20:56:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `className` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '软件1班');
INSERT INTO `class` VALUES ('2', '软件2班');
INSERT INTO `class` VALUES ('3', '软件3班');
INSERT INTO `class` VALUES ('4', '软件4班');

-- ----------------------------
-- Table structure for `ctmp`
-- ----------------------------
DROP TABLE IF EXISTS `ctmp`;
CREATE TABLE `ctmp` (
  `id` int(10) NOT NULL DEFAULT '0',
  `score` varchar(30) DEFAULT NULL,
  `crank` bigint(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ctmp
-- ----------------------------
INSERT INTO `ctmp` VALUES ('19', '5', '1');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '信息学院');
INSERT INTO `department` VALUES ('2', '外国语学院');
INSERT INTO `department` VALUES ('3', '理学院');

-- ----------------------------
-- Table structure for `errortest`
-- ----------------------------
DROP TABLE IF EXISTS `errortest`;
CREATE TABLE `errortest` (
  `uid` varchar(10) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `examtestid` int(10) NOT NULL,
  `errorselection` varchar(50) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `paperid` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `paperName` varchar(50) DEFAULT NULL,
  `answerContext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of errortest
-- ----------------------------
INSERT INTO `errortest` VALUES ('2', '76', '29', '', '2016-04-30 09:25', '7', '第一代计算机', '计算机原理', 'ENIAC');
INSERT INTO `errortest` VALUES ('2', '77', '15', '', '2016-04-30 09:25', '7', '在Word97中,按钮 的作用是:', '计算机原理', '打开');
INSERT INTO `errortest` VALUES ('2', '78', '36', '', '2016-04-30 09:25', '7', '南大门', '计算机原理', 'c:11;d:22');
INSERT INTO `errortest` VALUES ('2', '79', '43', '', '2016-04-30 09:25', '7', '计算机主要部件有', '计算机原理', 'a:显示器;b:主机;c:外设');
INSERT INTO `errortest` VALUES ('2', '80', '29', '', '2016-04-30 09:29', '7', '第一代计算机', '计算机原理', 'ENIAC');
INSERT INTO `errortest` VALUES ('2', '81', '15', '', '2016-04-30 09:29', '7', '在Word97中,按钮 的作用是:', '计算机原理', '打开');
INSERT INTO `errortest` VALUES ('2', '82', '36', '', '2016-04-30 09:29', '7', '南大门', '计算机原理', 'c:11;d:22');
INSERT INTO `errortest` VALUES ('2', '83', '43', '', '2016-04-30 09:29', '7', '计算机主要部件有', '计算机原理', 'a:显示器;b:主机;c:外设');
INSERT INTO `errortest` VALUES ('2', '84', '36', '', '2016-04-30 09:29', '7', '南大门', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '85', '43', '', '2016-04-30 09:29', '7', '计算机主要部件有', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '86', '29', '', '2016-04-30 09:30', '7', '第一代计算机', '计算机原理', 'ENIAC');
INSERT INTO `errortest` VALUES ('2', '87', '15', '', '2016-04-30 09:30', '7', '在Word97中,按钮 的作用是:', '计算机原理', '打开');
INSERT INTO `errortest` VALUES ('2', '88', '36', '', '2016-04-30 09:30', '7', '南大门', '计算机原理', 'c:11;d:22');
INSERT INTO `errortest` VALUES ('2', '89', '43', '', '2016-04-30 09:30', '7', '计算机主要部件有', '计算机原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES ('2', '90', '36', '', '2016-04-30 09:30', '7', '南大门', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '91', '43', '', '2016-04-30 09:30', '7', '计算机主要部件有', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '92', '29', '', '2016-04-30 09:31', '7', '第一代计算机', '计算机原理', 'ENIAC');
INSERT INTO `errortest` VALUES ('2', '93', '15', '', '2016-04-30 09:31', '7', '在Word97中,按钮 的作用是:', '计算机原理', '打开');
INSERT INTO `errortest` VALUES ('2', '94', '36', '', '2016-04-30 09:31', '7', '南大门', '计算机原理', 'c:11;d:22');
INSERT INTO `errortest` VALUES ('2', '95', '43', '', '2016-04-30 09:31', '7', '计算机主要部件有', '计算机原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES ('2', '96', '36', '', '2016-04-30 09:31', '7', '南大门', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '97', '43', '', '2016-04-30 09:31', '7', '计算机主要部件有', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '98', '29', '', '2016-04-30 09:31', '7', '第一代计算机', '计算机原理', 'ENIAC');
INSERT INTO `errortest` VALUES ('2', '99', '15', '', '2016-04-30 09:31', '7', '在Word97中,按钮 的作用是:', '计算机原理', '打开');
INSERT INTO `errortest` VALUES ('2', '100', '36', '', '2016-04-30 09:31', '7', '南大门', '计算机原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '101', '43', '', '2016-04-30 09:31', '7', '计算机主要部件有', '计算机原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES ('2', '102', '36', '', '2016-04-30 09:31', '7', '南大门', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '103', '43', '', '2016-04-30 09:31', '7', '计算机主要部件有', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '104', '29', '', '2016-04-30 09:34', '7', '第一代计算机', '计算机原理', 'ENIAC');
INSERT INTO `errortest` VALUES ('2', '105', '15', '', '2016-04-30 09:34', '7', '在Word97中,按钮 的作用是:', '计算机原理', '打开');
INSERT INTO `errortest` VALUES ('2', '106', '36', '', '2016-04-30 09:34', '7', '南大门', '计算机原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '107', '43', '', '2016-04-30 09:34', '7', '计算机主要部件有', '计算机原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES ('2', '108', '36', 'a', '2016-04-30 09:39', '7', '南大门', '计算机原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '109', '43', 'a,d', '2016-04-30 09:39', '7', '计算机主要部件有', '计算机原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES ('2', '110', '29', '', '2016-04-30 09:39', '7', '第一代计算机', '计算机原理', 'ENIAC');
INSERT INTO `errortest` VALUES ('2', '111', '15', '', '2016-04-30 09:39', '7', '在Word97中,按钮 的作用是:', '计算机原理', '打开');
INSERT INTO `errortest` VALUES ('2', '112', '36', '', '2016-04-30 09:39', '7', '南大门', '计算机原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '113', '43', '', '2016-04-30 09:39', '7', '计算机主要部件有', '计算机原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES ('2', '114', '33', '', '2016-04-30 09:39', '7', '3是奇数', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '115', '44', '', '2016-04-30 09:39', '7', '计算机不需要操作系统', '计算机原理', '');
INSERT INTO `errortest` VALUES ('2', '116', '36', 'a', '2016-04-30 09:39', '7', '南大门', '计算机原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '117', '43', 'a', '2016-04-30 09:39', '7', '计算机主要部件有', '计算机原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES (null, '118', '16', 'a', '2016-04-30 10:15', '17', '在Word 97的编辑状态，打开文档ABC，修改后另存为ABD，则', 'JAVA', 'ABD是当前文档');
INSERT INTO `errortest` VALUES (null, '119', '38', 'a,b', '2016-04-30 10:15', '17', '下列是C语言的关键字', 'JAVA', 'a：int;b：printf;c：no');
INSERT INTO `errortest` VALUES (null, '120', '29', '', '2016-04-30 10:15', '7', '第一代计算机', '计算机组成原理', 'ENIAC');
INSERT INTO `errortest` VALUES (null, '121', '11', '', '2016-04-30 10:15', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES (null, '122', '35', '', '2016-04-30 10:15', '7', 'hahah', '计算机组成原理', '2');
INSERT INTO `errortest` VALUES (null, '123', '7', '', '2016-04-30 10:15', '7', '在计算机中，一个字节是由多少个二进制位组成的', '计算机组成原理', '8');
INSERT INTO `errortest` VALUES (null, '124', '28', '', '2016-04-30 10:15', '7', '在Foxpro环境下，存储有关年月日的数据，通常使用的字段类型是', '计算机组成原理', '日期型');
INSERT INTO `errortest` VALUES (null, '125', '15', '', '2016-04-30 10:15', '7', '在Word97中,按钮 的作用是:', '计算机组成原理', '打开');
INSERT INTO `errortest` VALUES (null, '126', '12', '', '2016-04-30 10:15', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES (null, '127', '18', '', '2016-04-30 10:15', '7', '在Word97的编辑状态中，\"复制\"操作的组合键是', '计算机组成原理', 'Ctrl+C');
INSERT INTO `errortest` VALUES (null, '128', '17', '', '2016-04-30 10:15', '7', '在Word97的编辑状态中，若设置一个文字格式为下标形式，应使用\"格式\"菜单中的菜单项为', '计算机组成原理', '字体');
INSERT INTO `errortest` VALUES (null, '129', '14', '', '2016-04-30 10:15', '7', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', '计算机组成原理', '查看');
INSERT INTO `errortest` VALUES (null, '130', '6', '', '2016-04-30 10:15', '7', '软盘不能写入只能读出的原因是', '计算机组成原理', '写保护');
INSERT INTO `errortest` VALUES (null, '131', '19', '', '2016-04-30 10:15', '7', '在Word97的编辑状态中，统计文档的字数，需要使用的菜单是', '计算机组成原理', '工具');
INSERT INTO `errortest` VALUES (null, '132', '43', '', '2016-04-30 10:15', '7', '计算机主要部件有', '计算机组成原理', 'a：显示器;b：主机;c：外设');
INSERT INTO `errortest` VALUES (null, '133', '20', '', '2016-04-30 10:26', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES (null, '134', '12', '', '2016-04-30 10:26', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES (null, '135', '11', '', '2016-04-30 10:26', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES (null, '136', '31', '', '2016-04-30 10:26', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES (null, '137', '36', '', '2016-04-30 10:26', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES (null, '138', '33', '', '2016-04-30 10:26', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '139', '20', 'b', '2016-04-30 10:27', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '140', '36', 'a', '2016-04-30 10:27', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '141', '20', '', '2016-04-30 10:33', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '142', '12', '', '2016-04-30 10:33', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '143', '11', '', '2016-04-30 10:33', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '144', '31', '', '2016-04-30 10:33', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '145', '36', '', '2016-04-30 10:33', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '146', '33', '', '2016-04-30 10:33', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '147', '20', '', '2016-04-30 10:34', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '148', '12', '', '2016-04-30 10:34', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '149', '11', '', '2016-04-30 10:34', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '150', '31', '', '2016-04-30 10:34', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '151', '36', '', '2016-04-30 10:34', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '152', '33', '', '2016-04-30 10:34', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '153', '20', '', '2016-04-30 10:35', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '154', '12', '', '2016-04-30 10:35', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '155', '36', '', '2016-04-30 10:35', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '156', '20', '', '2016-04-30 10:45', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '157', '12', '', '2016-04-30 10:45', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '158', '11', '', '2016-04-30 10:45', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '159', '31', '', '2016-04-30 10:45', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '160', '36', '', '2016-04-30 10:45', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '161', '33', '', '2016-04-30 10:45', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '162', '14', 'a', '2016-04-30 10:56', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('2', '163', '15', '', '2016-04-30 10:56', '16', '在Word97中,按钮 的作用是:', 'C语言', '打开');
INSERT INTO `errortest` VALUES ('2', '164', '14', '', '2016-04-30 10:56', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('2', '165', '15', 'b', '2016-04-30 10:56', '16', '在Word97中,按钮 的作用是:', 'C语言', '打开');
INSERT INTO `errortest` VALUES ('2', '166', '20', '', '2016-04-30 10:59', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '167', '12', '', '2016-04-30 10:59', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '168', '11', '', '2016-04-30 10:59', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '169', '31', '', '2016-04-30 10:59', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '170', '36', '', '2016-04-30 10:59', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '171', '33', '', '2016-04-30 10:59', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '172', '14', '', '2016-04-30 11:00', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('2', '173', '15', '', '2016-04-30 11:00', '16', '在Word97中,按钮 的作用是:', 'C语言', '打开');
INSERT INTO `errortest` VALUES ('2', '174', '14', '', '2016-04-30 11:01', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('2', '175', '14', '', '2016-04-30 11:03', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('2', '176', '15', '', '2016-04-30 11:03', '16', '在Word97中,按钮 的作用是:', 'C语言', '打开');
INSERT INTO `errortest` VALUES ('2', '177', '14', 'a', '2016-04-30 11:03', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('2', '178', '11', 'a', '2016-04-30 11:06', '15', 'Windows95中是多少位的操作系统', '数据结构', '32位');
INSERT INTO `errortest` VALUES ('2', '179', '17', 'b', '2016-04-30 11:06', '15', '在Word97的编辑状态中，若设置一个文字格式为下标形式，应使用\"格式\"菜单中的菜单项为', '数据结构', '字体');
INSERT INTO `errortest` VALUES ('2', '180', '12', 'a', '2016-04-30 11:06', '15', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '数据结构', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '181', '20', '', '2016-04-30 11:22', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '182', '12', '', '2016-04-30 11:22', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '183', '11', '', '2016-04-30 11:22', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '184', '31', '', '2016-04-30 11:22', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '185', '36', '', '2016-04-30 11:22', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '186', '33', '', '2016-04-30 11:22', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '187', '20', '', '2016-04-30 11:23', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '188', '12', '', '2016-04-30 11:23', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '189', '11', '', '2016-04-30 11:23', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '190', '31', '', '2016-04-30 11:23', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '191', '36', '', '2016-04-30 11:23', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '192', '33', '', '2016-04-30 11:23', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '193', '20', '', '2016-04-30 11:30', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '194', '12', '', '2016-04-30 11:30', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '195', '11', '', '2016-04-30 11:30', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '196', '31', '', '2016-04-30 11:30', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '197', '36', '', '2016-04-30 11:30', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '198', '33', '', '2016-04-30 11:30', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('1', '199', '20', '', '2016-04-30 11:38', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('1', '200', '12', '', '2016-04-30 11:38', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('1', '201', '11', '', '2016-04-30 11:38', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('1', '202', '36', 'a', '2016-04-30 11:38', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES (null, '203', '14', '', '2016-04-30 01:04', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES (null, '204', '20', '', '2016-04-30 01:06', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES (null, '205', '12', '', '2016-04-30 01:06', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES (null, '206', '11', '', '2016-04-30 01:06', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES (null, '207', '36', '', '2016-04-30 01:06', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES (null, '208', '20', '', '2016-04-30 01:06', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES (null, '209', '12', '', '2016-04-30 01:06', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES (null, '210', '11', '', '2016-04-30 01:06', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES (null, '211', '31', '', '2016-04-30 01:06', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES (null, '212', '36', 'b,d', '2016-04-30 01:06', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES (null, '213', '33', '', '2016-04-30 01:06', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES (null, '214', '14', '', '2016-04-30 01:09', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES (null, '215', '7', 'a', '2016-04-30 01:10', '11', '在计算机中，一个字节是由多少个二进制位组成的', '操作系统', '8');
INSERT INTO `errortest` VALUES (null, '216', '2', 'a', '2016-04-30 01:10', '11', '下面有关计算机操作系统的叙述中，不正确的是:', '操作系统', '操作系统只负责管理内存储器，而不管理外存储器');
INSERT INTO `errortest` VALUES (null, '217', '9', '', '2016-04-30 01:10', '11', '下列选项中，不属于计算机病毒特征的是', '操作系统', '免疫性');
INSERT INTO `errortest` VALUES (null, '218', '14', '', '2016-04-30 01:11', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('1', '219', '20', '', '2016-04-30 01:15', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('1', '220', '36', 'a,b', '2016-04-30 01:15', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '221', '30', 'd', '2016-04-30 01:16', '10', '下面是关系型数据库的是', 'SQL', 'MYSQL');
INSERT INTO `errortest` VALUES ('1', '222', '30', 'b', '2016-04-30 01:17', '10', '下面是关系型数据库的是', 'SQL', 'MYSQL');
INSERT INTO `errortest` VALUES ('2', '223', '20', '', '2016-04-30 01:37', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '224', '12', '', '2016-04-30 01:37', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '225', '11', '', '2016-04-30 01:37', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '226', '31', '', '2016-04-30 01:37', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '227', '36', '', '2016-04-30 01:37', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '228', '33', '', '2016-04-30 01:37', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('2', '229', '20', '', '2016-04-30 01:42', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('2', '230', '12', '', '2016-04-30 01:42', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('2', '231', '11', 'a', '2016-04-30 01:42', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('2', '232', '31', 'a', '2016-04-30 01:42', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('2', '233', '36', 'a', '2016-04-30 01:42', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('2', '234', '10', '', '2016-04-30 01:46', '13', '以下操作系统中，不是网络操作系统的是', '计算机艺术', 'MS-DOS');
INSERT INTO `errortest` VALUES ('1', '235', '14', 'a', '2016-04-30 01:47', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('1', '236', '15', 'b', '2016-04-30 01:47', '16', '在Word97中,按钮 的作用是:', 'C语言', '打开');
INSERT INTO `errortest` VALUES ('1', '237', '20', '', '2016-04-30 01:48', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('1', '238', '12', '', '2016-04-30 01:48', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('1', '239', '11', '', '2016-04-30 01:48', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('1', '240', '31', '', '2016-04-30 01:48', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('1', '241', '36', '', '2016-04-30 01:48', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('1', '242', '20', '', '2016-04-30 01:50', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('1', '243', '12', '', '2016-04-30 01:50', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('1', '244', '11', '', '2016-04-30 01:50', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('1', '245', '36', '', '2016-04-30 01:50', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('1', '246', '12', 'a', '2016-04-30 01:51', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('1', '247', '11', 'a', '2016-04-30 01:51', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('1', '248', '36', '', '2016-04-30 01:51', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('1', '249', '14', '', '2016-04-30 01:55', '16', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', 'C语言', '查看');
INSERT INTO `errortest` VALUES ('1', '250', '15', '', '2016-04-30 01:55', '16', '在Word97中,按钮 的作用是:', 'C语言', '打开');
INSERT INTO `errortest` VALUES ('1', '251', '11', 'a', '2016-04-30 01:58', '15', 'Windows95中是多少位的操作系统', '数据结构', '32位');
INSERT INTO `errortest` VALUES ('1', '252', '12', 'a', '2016-04-30 01:58', '15', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '数据结构', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('1', '253', '18', 'a', '2016-04-30 01:58', '15', '在Word97的编辑状态中，\"复制\"操作的组合键是', '数据结构', 'Ctrl+C');
INSERT INTO `errortest` VALUES ('1', '254', '14', 'a', '2016-04-30 01:58', '15', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', '数据结构', '查看');
INSERT INTO `errortest` VALUES ('1', '255', '11', '', '2016-04-30 02:00', '15', 'Windows95中是多少位的操作系统', '数据结构', '32位');
INSERT INTO `errortest` VALUES ('1', '256', '17', '', '2016-04-30 02:00', '15', '在Word97的编辑状态中，若设置一个文字格式为下标形式，应使用\"格式\"菜单中的菜单项为', '数据结构', '字体');
INSERT INTO `errortest` VALUES ('1', '257', '12', '', '2016-04-30 02:00', '15', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '数据结构', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('1', '258', '18', '', '2016-04-30 02:00', '15', '在Word97的编辑状态中，\"复制\"操作的组合键是', '数据结构', 'Ctrl+C');
INSERT INTO `errortest` VALUES ('1', '259', '14', '', '2016-04-30 02:00', '15', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', '数据结构', '查看');
INSERT INTO `errortest` VALUES ('1', '260', '20', '', '2016-04-30 02:02', '7', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '计算机组成原理', '编辑');
INSERT INTO `errortest` VALUES ('1', '261', '12', '', '2016-04-30 02:02', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('1', '262', '11', '', '2016-04-30 02:02', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('1', '263', '31', '', '2016-04-30 02:02', '7', '偶数', '计算机组成原理', 'a：2;c：4');
INSERT INTO `errortest` VALUES ('1', '264', '36', '', '2016-04-30 02:02', '7', '南大门', '计算机组成原理', 'c：11;d：22');
INSERT INTO `errortest` VALUES ('1', '265', '33', '', '2016-04-30 02:02', '7', '3是奇数', '计算机组成原理', '');
INSERT INTO `errortest` VALUES ('1', '266', '7', 'a', '2016-04-30 02:03', '11', '在计算机中，一个字节是由多少个二进制位组成的', '操作系统', '8');
INSERT INTO `errortest` VALUES ('1', '267', '5', 'b', '2016-04-30 02:03', '11', '下列存储器中存取速度最快的是', '操作系统', '内存');
INSERT INTO `errortest` VALUES ('1', '268', '2', 'a', '2016-04-30 02:03', '11', '下面有关计算机操作系统的叙述中，不正确的是:', '操作系统', '操作系统只负责管理内存储器，而不管理外存储器');
INSERT INTO `errortest` VALUES ('1', '269', '9', 'a', '2016-04-30 02:03', '11', '下列选项中，不属于计算机病毒特征的是', '操作系统', '免疫性');
INSERT INTO `errortest` VALUES ('1', '270', '7', '', '2016-04-30 02:07', '11', '在计算机中，一个字节是由多少个二进制位组成的', '操作系统', '8');
INSERT INTO `errortest` VALUES ('1', '271', '5', '', '2016-04-30 02:07', '11', '下列存储器中存取速度最快的是', '操作系统', '内存');
INSERT INTO `errortest` VALUES ('1', '272', '9', 'a', '2016-04-30 02:07', '11', '下列选项中，不属于计算机病毒特征的是', '操作系统', '免疫性');
INSERT INTO `errortest` VALUES ('10', '273', '12', 'a', '2016-04-30 07:03', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('10', '274', '11', '', '2016-04-30 07:03', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('10', '275', '36', '', '2016-04-30 07:03', '7', '南大门', '计算机组成原理', 'c:11;d:22');
INSERT INTO `errortest` VALUES ('10', '276', '12', 'a', '2016-04-30 07:03', '7', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', '计算机组成原理', 'Ctrl+A');
INSERT INTO `errortest` VALUES ('10', '277', '11', 'a', '2016-04-30 07:03', '7', 'Windows95中是多少位的操作系统', '计算机组成原理', '32位');
INSERT INTO `errortest` VALUES ('10', '278', '36', 'a', '2016-04-30 07:03', '7', '南大门', '计算机组成原理', 'c:11;d:22');

-- ----------------------------
-- Table structure for `exampaper`
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subjectId` int(20) DEFAULT NULL,
  `paperName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `choiceNum` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `choiceId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multipleChoiceNum` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `multipleChoiceId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optionNum` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `optionId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalPoint` int(10) NOT NULL,
  `time` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES ('7', '计算机', '1', '计算机组成原理', '3', '20,12,11', '2', '31,36', '1', '33', '8', '20');
INSERT INTO `exampaper` VALUES ('10', '数据库', '3', 'SQL', '1', '30', '0', '', '0', '', '1', '1');
INSERT INTO `exampaper` VALUES ('11', '计算机', '1', '操作系统', '5', '7,5,2,9,10', '0', '', '0', '', '100', '30');
INSERT INTO `exampaper` VALUES ('16', '编程语言', '2', 'C语言', '2', '14,15', '0', '', '0', '', '20', '30');
INSERT INTO `exampaper` VALUES ('13', '计算机', '1', '计算机艺术', '2', '10,5', '0', '', '0', '', '100', '30');
INSERT INTO `exampaper` VALUES ('14', '计算机', '1', '计算机基础', '1', '9', '0', '', '0', '', '100', '30');
INSERT INTO `exampaper` VALUES ('15', '计算机', '1', '数据结构', '5', '11,17,12,18,14', '0', '', '0', '', '5', '5');
INSERT INTO `exampaper` VALUES ('17', '编程语言', '2', 'JAVA', '1', '16', '1', '38', '1', '34', '4', '10');
INSERT INTO `exampaper` VALUES ('18', '计算机', '1', '计算机辅助设计', '2', '20,29', '2', '43,31', '0', '', '6', '6');
INSERT INTO `exampaper` VALUES ('20', 'CET', '8', '啧啧啧', '0', '', '1', '41', '0', '', '2', '20');
INSERT INTO `exampaper` VALUES ('19', '编程语言', '2', 'PHP', '1', '16', '0', '', '0', '', '1', '20');
INSERT INTO `exampaper` VALUES ('21', '会计科1', '12', ' 会计1', '2', '48,45', '1', '46', '1', '47', '5', '20');
INSERT INTO `exampaper` VALUES ('22', '化学科', '13', '化学基础知识', '1', '50', '1', '52', '2', '54,53', '5', '20');

-- ----------------------------
-- Table structure for `examtest`
-- ----------------------------
DROP TABLE IF EXISTS `examtest`;
CREATE TABLE `examtest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subjectId` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `a` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `isChosen` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0:选择题   1：填空题  2： 判断题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of examtest
-- ----------------------------
INSERT INTO `examtest` VALUES ('2', '计算机', '1', '下面有关计算机操作系统的叙述中，不正确的是:', '操作系统属于系统软', '操作系统只负责管理内存储器，而不管理外存储器', 'UNIX是一种操作系统', '计算机的处理器、内存等硬件资源也由操作系统管理', 'b', 'yes', '0');
INSERT INTO `examtest` VALUES ('5', '计算机', '1', '下列存储器中存取速度最快的是', '内存', '硬盘', '光盘', '软盘', 'a', 'no', '0');
INSERT INTO `examtest` VALUES ('6', '计算机', '1', '软盘不能写入只能读出的原因是', '新盘未格式化', '已使用过的软盘片', '写保护', '以上均不正确', 'c', 'no', '0');
INSERT INTO `examtest` VALUES ('7', '计算机', '1', '在计算机中，一个字节是由多少个二进制位组成的', '4', '8', '16', '24', 'b', 'no', '0');
INSERT INTO `examtest` VALUES ('9', '计算机', '1', '下列选项中，不属于计算机病毒特征的是', '破坏性', '潜伏性', '传染性', '免疫性', 'd', 'no', '0');
INSERT INTO `examtest` VALUES ('10', '计算机', '1', '以下操作系统中，不是网络操作系统的是', 'MS-DOS', 'Windows', 'Windows', 'Novell', 'a', 'no', '0');
INSERT INTO `examtest` VALUES ('11', '计算机', '1', 'Windows95中是多少位的操作系统', '16位', '32位', '64位', '128位', 'b', 'no', '0');
INSERT INTO `examtest` VALUES ('12', '计算机', '1', 'Windows95中，欲选定当前文件夹中的全部文件和文件夹对象，可使用的组合键是', 'Ctrl+V', 'Ctrl+A', 'Ctrl+X', 'Ctrl+D', 'b', 'no', '0');
INSERT INTO `examtest` VALUES ('14', '计算机', '1', '在Windows95的\"资源管理器\"窗口中，为了改变隐藏文件的显示情况，应首先选用的菜单是', '文件', '编辑', '查看', '帮助', 'c', 'no', '0');
INSERT INTO `examtest` VALUES ('15', '计算机', '1', '在Word97中,按钮 的作用是:', '打开', '贴粘', '保存', '复制', 'a', 'no', '0');
INSERT INTO `examtest` VALUES ('16', '', '2', '在Word 97的编辑状态，打开文档ABC，修改后另存为ABD，则', 'ABC是当前文档', 'ABD是当前文档', 'ABC和ABD均是当前文档', 'ABC和ABD均不是当前文档', 'b', 'no', '0');
INSERT INTO `examtest` VALUES ('17', '计算机', '1', '在Word97的编辑状态中，若设置一个文字格式为下标形式，应使用\"格式\"菜单中的菜单项为', '字体', '段落', '文字方向', '组合字符', 'a', 'no', '0');
INSERT INTO `examtest` VALUES ('18', '计算机', '1', '在Word97的编辑状态中，\"复制\"操作的组合键是', 'Ctrl+A', 'Ctrl+X', 'Ctrl+V', 'Ctrl+C', 'd', 'no', '0');
INSERT INTO `examtest` VALUES ('19', '计算机', '1', '在Word97的编辑状态中，统计文档的字数，需要使用的菜单是', '文件', '视图', '格式', '工具', 'd', 'no', '0');
INSERT INTO `examtest` VALUES ('20', '计算机', '1', '在Word97的编辑状态中，对已经输入的文档设置首字下沉，需要使用的菜单是', '编辑', '视图', '格式', '工具', 'a', 'no', '0');
INSERT INTO `examtest` VALUES ('28', '计算机', '1', '在Foxpro环境下，存储有关年月日的数据，通常使用的字段类型是', '逻辑型', '日期型', '数值型', '浮点型', 'b', 'no', '0');
INSERT INTO `examtest` VALUES ('29', '计算机', '1', '第一代计算机', 'ENIAC', 'HHSK', 'SSF', 'SSS', 'a', 'yes', '0');
INSERT INTO `examtest` VALUES ('30', '数据库', '3', '下面是关系型数据库的是', 'MYSQL', 'Redis', 'MondDB', 'BD2', 'a', 'yes', '0');
INSERT INTO `examtest` VALUES ('31', '计算机', '1', '偶数', '2', '3', '4', '5', 'a,c', 'yes', '1');
INSERT INTO `examtest` VALUES ('32', '计算机', '1', '2质数', '', '', '', '', 'right', 'no', '2');
INSERT INTO `examtest` VALUES ('33', '计算机', '1', '3是奇数', '', '', '', '', 'right', 'no', '2');
INSERT INTO `examtest` VALUES ('34', '编程语言', '2', 'c语言是面向过程的么', '', '', '', '', 'right', 'no', '2');
INSERT INTO `examtest` VALUES ('35', '计算机', '1', 'hahah', '2', '22', '22', '222', 'a', 'yes', '0');
INSERT INTO `examtest` VALUES ('36', '计算机', '1', '南大门', '2', '22', '11', '22', 'c,d', 'yes', '1');
INSERT INTO `examtest` VALUES ('37', '计算机网络', '5', 'IP是使用到哪层协议', '数据链路层', '网络层', '传输层', '应用层', 'a,b', 'no', '1');
INSERT INTO `examtest` VALUES ('38', '编程语言', '2', '下列是C语言的关键字', 'int', 'printf', 'no', 'make', 'a,b,c', 'no', '1');
INSERT INTO `examtest` VALUES ('39', '线性代数', '11', '下列矩阵可逆的是：', 'R(A)=R(AT)', 'A*AT=E', 'E', 'A(m*n)  m!=n', 'b,c', 'yes', '1');
INSERT INTO `examtest` VALUES ('40', '线性代数', '11', '下列矩阵不可逆的是', '0', 'E', 'A*AT=E', 'A(m*n) m!=n', 'a,d', 'no', '1');
INSERT INTO `examtest` VALUES ('41', 'CET', '8', '表示好的单词', 'good', 'nice', 'bad', 'hate', 'a,b', 'yes', '1');
INSERT INTO `examtest` VALUES ('42', '高等数学', '10', 'e函数可导', '', '', '', '', 'right', 'yes', '2');
INSERT INTO `examtest` VALUES ('43', '计算机', '1', '计算机主要部件有', '显示器', '主机', '外设', '手写板', 'a,b,c', 'yes', '1');
INSERT INTO `examtest` VALUES ('44', '计算机', '1', '计算机不需要操作系统', '', '', '', '', 'error', 'yes', '2');
INSERT INTO `examtest` VALUES ('45', '会计科1', '12', '会计1+1=？', '2', '1', '5', '3', 'a', 'yes', '0');
INSERT INTO `examtest` VALUES ('46', '会计科1', '12', '会计科目主要设计的那些大类？', '经济类', '数学类', '物理类', '化学类', 'a,b', 'yes', '1');
INSERT INTO `examtest` VALUES ('47', '会计科1', '12', '会计的前景很好么', '', '', '', '', 'right', 'yes', '2');
INSERT INTO `examtest` VALUES ('48', '会计科1', '12', '常用的工具有哪些', 'execl', 'ppt', 'pc', 'chart', 'a', 'yes', '0');
INSERT INTO `examtest` VALUES ('49', '化学科', '13', '水分子的化学元素是', 'CO2', 'H2O', 'H2', 'CO', 'b', 'yes', '0');
INSERT INTO `examtest` VALUES ('50', '化学科', '13', '化合反应的特征', '只有一种产物', '多种产物', '没有产物', '以上都可能', 'a', 'yes', '0');
INSERT INTO `examtest` VALUES ('51', '计算机', '1', '电解水会生产那些物质', 'H2', 'O2', 'CO', 'CO2', 'a,b', 'yes', '1');
INSERT INTO `examtest` VALUES ('52', '化学科', '13', '化学方程以大类划分', '氧化反应', '还原反应', '吸热反应', '放热反应', 'a,b', 'yes', '1');
INSERT INTO `examtest` VALUES ('53', '化学科', '13', '化学反应遵守能量守恒', '', '', '', '', 'right', 'yes', '2');
INSERT INTO `examtest` VALUES ('54', '化学科', '13', '化学反应一般会重组原子', '', '', '', '', 'error', 'yes', '2');

-- ----------------------------
-- Table structure for `loginuser`
-- ----------------------------
DROP TABLE IF EXISTS `loginuser`;
CREATE TABLE `loginuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classes` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grad` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of loginuser
-- ----------------------------
INSERT INTO `loginuser` VALUES ('2', 'admin', 'admin', '1', '软件技术班1', '1', null, '1');
INSERT INTO `loginuser` VALUES ('10', 'lc', '1111', '1', '软件技术班1', '1', null, '1');
INSERT INTO `loginuser` VALUES ('1', 'zz', '123456', '1', '计算机1', '1', null, '1');
INSERT INTO `loginuser` VALUES ('3', 'hlc', '123456', '1', '计算机1', '1', null, '1');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `isManager` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', 'admin', 'yes', '19056785666');
INSERT INTO `manager` VALUES ('2', 't', '1234', 'no', '19056785666');
INSERT INTO `manager` VALUES ('8', 'test', '1234', 'no', null);
INSERT INTO `manager` VALUES ('12', 'zz', '123456', 'yes', null);
INSERT INTO `manager` VALUES ('13', 'wzd', '123456', 'no', null);

-- ----------------------------
-- Table structure for `scores`
-- ----------------------------
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `score` varchar(30) DEFAULT NULL,
  `paperid` varchar(30) DEFAULT NULL,
  `paperName` varchar(255) DEFAULT NULL,
  `rank` varchar(10) DEFAULT NULL,
  `crank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scores
-- ----------------------------
INSERT INTO `scores` VALUES ('2', '2', '1', '7', '计算机组成原理', '2', '2');
INSERT INTO `scores` VALUES ('3', '2', '1', '16', 'C语言', '1', '1');
INSERT INTO `scores` VALUES ('4', '2', '0', '10', 'SQL', '2', '2');
INSERT INTO `scores` VALUES ('5', '2', '2', '15', '数据结构', '1', '1');
INSERT INTO `scores` VALUES ('6', '1', '0', '7', '计算机组成原理', '3', '3');
INSERT INTO `scores` VALUES ('11', '2', '2', '11', '操作系统', '1', '1');
INSERT INTO `scores` VALUES ('13', '1', '1', '10', 'SQL', '1', '1');
INSERT INTO `scores` VALUES ('14', '2', '1', '13', '计算机艺术', '1', null);
INSERT INTO `scores` VALUES ('15', '1', '0', '16', 'C语言', '2', '2');
INSERT INTO `scores` VALUES ('16', '1', '0', '15', '数据结构', '2', '2');
INSERT INTO `scores` VALUES ('17', '1', '2', '11', '操作系统', '2', '2');
INSERT INTO `scores` VALUES ('18', '10', '4', '7', '计算机组成原理', '1', '1');
INSERT INTO `scores` VALUES ('19', '10', '5', '22', '化学基础知识', '1', '1');

-- ----------------------------
-- Table structure for `stmp`
-- ----------------------------
DROP TABLE IF EXISTS `stmp`;
CREATE TABLE `stmp` (
  `id` int(10) NOT NULL DEFAULT '0',
  `userid` varchar(255) DEFAULT NULL,
  `score` varchar(30) DEFAULT NULL,
  `classid` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stmp
-- ----------------------------
INSERT INTO `stmp` VALUES ('19', '10', '5', '1');

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '计算机');
INSERT INTO `subject` VALUES ('2', '编程语言');
INSERT INTO `subject` VALUES ('3', '数据库');
INSERT INTO `subject` VALUES ('4', '三级网络技术');
INSERT INTO `subject` VALUES ('5', '计算机网络');
INSERT INTO `subject` VALUES ('6', 'CCNP');
INSERT INTO `subject` VALUES ('7', 'CCNA');
INSERT INTO `subject` VALUES ('8', 'CET');
INSERT INTO `subject` VALUES ('9', '大学英语');
INSERT INTO `subject` VALUES ('10', '高等数学');
INSERT INTO `subject` VALUES ('11', '线性代数');
INSERT INTO `subject` VALUES ('12', '会计科1');
INSERT INTO `subject` VALUES ('13', '化学科');

-- ----------------------------
-- Table structure for `tmp`
-- ----------------------------
DROP TABLE IF EXISTS `tmp`;
CREATE TABLE `tmp` (
  `id` int(10) NOT NULL DEFAULT '0',
  `score` varchar(30) DEFAULT NULL,
  `rank` bigint(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmp
-- ----------------------------
INSERT INTO `tmp` VALUES ('19', '5', '1');

/*
Navicat MySQL Data Transfer

Source Server         : toolman
Source Server Version : 50729
Source Host           : www.dh9710.com:3306
Source Database       : toolman

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-07-09 21:53:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  0：已删除 1：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('8', '0', '测试部', '1', '1');
INSERT INTO `sys_dept` VALUES ('9', '8', '测试一', '0', '1');
INSERT INTO `sys_dept` VALUES ('10', '8', '测试二', '1', '1');
INSERT INTO `sys_dept` VALUES ('11', '0', '管理部', '0', '1');
INSERT INTO `sys_dept` VALUES ('12', '11', '管理一部', '0', '1');
INSERT INTO `sys_dept` VALUES ('13', '11', '管理二部', '1', '1');
INSERT INTO `sys_dept` VALUES ('14', '0', '广东财经大学华商学院', '2', '1');
INSERT INTO `sys_dept` VALUES ('15', '14', '数据科学学院', '0', '1');
INSERT INTO `sys_dept` VALUES ('16', '14', '会计学院', '1', '1');
INSERT INTO `sys_dept` VALUES ('17', '15', '计算机科学与技术', '0', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('10', '会议通告', '1', 'notify_type', '通知通告类型', '1', '0', null, null, null, null, '', '0');
INSERT INTO `sys_dict` VALUES ('11', '奖惩通告', '2', 'notify_type', '通知通告类型', '1', '0', null, null, null, null, '', '0');
INSERT INTO `sys_dict` VALUES ('12', '活动通告', '3', 'notify_type', '通知通告类型', '1', '0', null, null, null, null, '', '0');
INSERT INTO `sys_dict` VALUES ('13', '草稿', '0', 'notify_status', '通知通告状态', '2', '0', null, null, null, null, '', '0');
INSERT INTO `sys_dict` VALUES ('14', '发布', '1', 'notify_status', '通知通告状态', '2', '0', null, null, null, null, '', '0');
INSERT INTO `sys_dict` VALUES ('15', '未读', '0', 'notify_read', '通知通告状态', '3', '0', null, null, null, null, '', '0');
INSERT INTO `sys_dict` VALUES ('16', '已读', '1', 'notify_read', '通知通告状态', '3', '0', null, null, null, null, '', '0');
INSERT INTO `sys_dict` VALUES ('17', '作业', '1', 'homewrok_type', '学生作业类型', '4', '0', '3', '2020-07-09 11:06:57', null, '2020-07-09 11:06:57', '', '0');
INSERT INTO `sys_dict` VALUES ('18', '已完成', '1', 'homework_status', '学生作业状态', '4', '0', '3', '2020-07-09 11:07:45', null, '2020-07-09 11:07:45', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '未完成', '0', 'homework_status', '学生作业状态', '4', '0', '3', '2020-07-09 11:08:07', null, '2020-07-09 11:08:07', '', '0');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', '0', '/files/a7377a84-39e8-49bf-986c-93a8916a4407.gif', '2020-07-06 18:29:52', '2020-07-06 18:29:52');
INSERT INTO `sys_file` VALUES ('2', '0', '/files/30fe9547-8ead-404d-8db9-b3dbba5d5056.jpg', '2020-07-06 18:46:14', '2020-07-06 18:46:14');
INSERT INTO `sys_file` VALUES ('3', '0', '/files/9e157c5a-ee9d-4ca8-a172-79a39109d97b.gif', '2020-07-06 18:54:16', '2020-07-06 18:54:16');
INSERT INTO `sys_file` VALUES ('4', '0', '/files/ba9cd19d-c88e-40b8-980b-e169aa266f1f.jpg', '2020-07-07 14:32:51', '2020-07-07 14:32:51');
INSERT INTO `sys_file` VALUES ('5', '0', '/files/05c1434e-2ee8-4363-a7c6-0c04d0eaf3ff.png', '2020-07-08 02:25:05', '2020-07-08 02:25:05');
INSERT INTO `sys_file` VALUES ('6', '0', '/files/68ae0881-636f-46dd-ac70-ac47eea50807.png', '2020-07-09 19:04:21', '2020-07-09 19:04:21');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1323 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '1', 'admin', '登录', '2050', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', '', '192.168.17.159', '2020-07-04 23:45:56');
INSERT INTO `sys_log` VALUES ('2', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-04 23:55:17');
INSERT INTO `sys_log` VALUES ('3', '1', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-04 23:55:24');
INSERT INTO `sys_log` VALUES ('4', '1', 'admin', '登录', '65', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-04 23:57:13');
INSERT INTO `sys_log` VALUES ('5', '1', 'admin', '请求访问主页', '118', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-04 23:57:13');
INSERT INTO `sys_log` VALUES ('6', '1', 'admin', '登录', '1107', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 00:00:09');
INSERT INTO `sys_log` VALUES ('7', '1', 'admin', '请求访问主页', '223', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 00:00:10');
INSERT INTO `sys_log` VALUES ('8', '1', 'admin', '登录', '387', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 00:14:11');
INSERT INTO `sys_log` VALUES ('9', '1', 'admin', '请求访问主页', '124', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 00:14:12');
INSERT INTO `sys_log` VALUES ('10', '1', 'admin', 'error', null, 'http://localhost:8083/main', 'java.lang.ArithmeticException: / by zero', null, '2020-07-05 00:14:13');
INSERT INTO `sys_log` VALUES ('11', '1', 'admin', 'error', null, 'http://localhost:8083/main', 'java.lang.ArithmeticException: / by zero', null, '2020-07-05 00:14:13');
INSERT INTO `sys_log` VALUES ('12', '1', 'admin', '登录', '137', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 00:40:50');
INSERT INTO `sys_log` VALUES ('13', '1', 'admin', '请求访问主页', '189', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 00:40:50');
INSERT INTO `sys_log` VALUES ('14', '1', 'admin', '登录', '105', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 00:42:11');
INSERT INTO `sys_log` VALUES ('15', '1', 'admin', '请求访问主页', '112', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 00:42:12');
INSERT INTO `sys_log` VALUES ('16', '1', 'admin', '请求访问主页', '140', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 00:45:07');
INSERT INTO `sys_log` VALUES ('17', '1', 'admin', '登录', '57', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 01:00:09');
INSERT INTO `sys_log` VALUES ('18', '2', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 01:00:09');
INSERT INTO `sys_log` VALUES ('19', '1', 'admin', 'error', null, 'http://localhost:8083/main', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', null, '2020-07-05 01:00:10');
INSERT INTO `sys_log` VALUES ('20', '1', 'admin', '登录', '60', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 01:08:09');
INSERT INTO `sys_log` VALUES ('21', '1', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 01:08:09');
INSERT INTO `sys_log` VALUES ('22', '1', 'admin', '登录', '263', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 11:37:19');
INSERT INTO `sys_log` VALUES ('23', '1', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 11:37:19');
INSERT INTO `sys_log` VALUES ('24', '1', 'admin', 'error', null, 'http://localhost:8083/sys/user/list', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 11:37:28');
INSERT INTO `sys_log` VALUES ('25', '1', 'admin', '登录', '92', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 11:42:38');
INSERT INTO `sys_log` VALUES ('26', '1', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 11:42:39');
INSERT INTO `sys_log` VALUES ('27', '-1', '获取用户信息为空', '登录', '173', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 12:25:39');
INSERT INTO `sys_log` VALUES ('28', '1', 'admin', '登录', '48', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 12:25:55');
INSERT INTO `sys_log` VALUES ('29', '1', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 12:25:55');
INSERT INTO `sys_log` VALUES ('30', '1', 'admin', 'error', null, 'http://localhost:8083/sys/user/list', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 12:26:03');
INSERT INTO `sys_log` VALUES ('31', '1', 'admin', '登录', '399', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 12:48:21');
INSERT INTO `sys_log` VALUES ('32', '1', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 12:48:22');
INSERT INTO `sys_log` VALUES ('33', '1', 'admin', '登录', '767', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 12:52:32');
INSERT INTO `sys_log` VALUES ('34', '1', 'admin', '登录', '773', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 12:55:43');
INSERT INTO `sys_log` VALUES ('35', '1', 'admin', '登录', '744', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 12:58:40');
INSERT INTO `sys_log` VALUES ('36', '-1', '获取用户信息为空', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 13:41:39');
INSERT INTO `sys_log` VALUES ('37', '1', 'admin', '登录', '561', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 13:41:48');
INSERT INTO `sys_log` VALUES ('38', '1', 'admin', '登录', '570', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 13:44:46');
INSERT INTO `sys_log` VALUES ('39', '1', 'admin', '请求访问主页', '291', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 13:44:47');
INSERT INTO `sys_log` VALUES ('40', '1', 'admin', '登录', '616', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 13:47:15');
INSERT INTO `sys_log` VALUES ('41', '1', 'admin', '登录', '595', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 13:48:21');
INSERT INTO `sys_log` VALUES ('42', '1', 'admin', '登录', '489', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 13:55:57');
INSERT INTO `sys_log` VALUES ('43', '1', 'admin', '请求访问主页', '228', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 13:55:58');
INSERT INTO `sys_log` VALUES ('44', '1', 'admin', '登录', '176', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 13:59:40');
INSERT INTO `sys_log` VALUES ('45', '1', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 13:59:40');
INSERT INTO `sys_log` VALUES ('46', '1', 'admin', 'error', null, 'http://localhost:8081/sys/menu/list', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysMenu parameter \'params\' is not present', null, '2020-07-05 14:02:10');
INSERT INTO `sys_log` VALUES ('47', '1', 'admin', '登录', '172', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 14:33:23');
INSERT INTO `sys_log` VALUES ('48', '1', 'admin', '请求访问主页', '143', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 14:33:23');
INSERT INTO `sys_log` VALUES ('49', '1', 'admin', '登录', '191', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 15:00:18');
INSERT INTO `sys_log` VALUES ('50', '1', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 15:00:18');
INSERT INTO `sys_log` VALUES ('51', '1', 'admin', '登录', '2052', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 15:17:11');
INSERT INTO `sys_log` VALUES ('52', '1', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 15:17:11');
INSERT INTO `sys_log` VALUES ('53', '1', 'admin', '登录', '190', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 16:04:54');
INSERT INTO `sys_log` VALUES ('54', '1', 'admin', '请求访问主页', '101', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 16:04:54');
INSERT INTO `sys_log` VALUES ('55', '1', 'admin', '添加菜单', '170', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:08:01');
INSERT INTO `sys_log` VALUES ('56', '1', 'admin', '登录', '194', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 16:14:19');
INSERT INTO `sys_log` VALUES ('57', '1', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 16:14:19');
INSERT INTO `sys_log` VALUES ('58', '1', 'admin', '登录', '185', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 16:18:55');
INSERT INTO `sys_log` VALUES ('59', '1', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 16:18:56');
INSERT INTO `sys_log` VALUES ('60', '1', 'admin', '登录', '179', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 16:23:36');
INSERT INTO `sys_log` VALUES ('61', '1', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 16:23:36');
INSERT INTO `sys_log` VALUES ('62', '1', 'admin', '登录', '193', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 16:27:19');
INSERT INTO `sys_log` VALUES ('63', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 16:27:19');
INSERT INTO `sys_log` VALUES ('64', '1', 'admin', '登录', '2047', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 16:40:27');
INSERT INTO `sys_log` VALUES ('65', '1', 'admin', '请求访问主页', '74', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 16:40:27');
INSERT INTO `sys_log` VALUES ('66', '1', 'admin', '添加菜单', '172', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:42:39');
INSERT INTO `sys_log` VALUES ('67', '1', 'admin', '添加菜单', '126', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:43:19');
INSERT INTO `sys_log` VALUES ('68', '1', 'admin', '添加菜单', '125', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:43:41');
INSERT INTO `sys_log` VALUES ('69', '1', 'admin', '添加菜单', '128', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:44:41');
INSERT INTO `sys_log` VALUES ('70', '1', 'admin', '添加菜单', '128', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:45:03');
INSERT INTO `sys_log` VALUES ('71', '1', 'admin', '添加菜单', '124', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:46:05');
INSERT INTO `sys_log` VALUES ('72', '1', 'admin', '添加菜单', '128', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:46:27');
INSERT INTO `sys_log` VALUES ('73', '1', 'admin', '添加菜单', '243', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:47:02');
INSERT INTO `sys_log` VALUES ('74', '1', 'admin', '添加菜单', '127', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:48:50');
INSERT INTO `sys_log` VALUES ('75', '1', 'admin', '添加菜单', '126', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:49:07');
INSERT INTO `sys_log` VALUES ('76', '1', 'admin', '更新菜单', '87', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-05 16:49:28');
INSERT INTO `sys_log` VALUES ('77', '1', 'admin', '添加菜单', '126', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 16:49:47');
INSERT INTO `sys_log` VALUES ('78', '1', 'admin', '登录', '168', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 17:21:31');
INSERT INTO `sys_log` VALUES ('79', '1', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 17:21:31');
INSERT INTO `sys_log` VALUES ('80', '1', 'admin', '添加菜单', '117', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-05 17:24:41');
INSERT INTO `sys_log` VALUES ('81', '1', 'admin', '更新菜单', '79', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-05 17:25:04');
INSERT INTO `sys_log` VALUES ('82', '1', 'admin', '更新菜单', '80', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-05 17:25:37');
INSERT INTO `sys_log` VALUES ('83', '1', 'admin', '登录', '180', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 17:31:34');
INSERT INTO `sys_log` VALUES ('84', '1', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 17:31:34');
INSERT INTO `sys_log` VALUES ('85', '1', 'admin', '登录', '167', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 17:43:18');
INSERT INTO `sys_log` VALUES ('86', '1', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 17:43:18');
INSERT INTO `sys_log` VALUES ('87', '1', 'admin', '登录', '177', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 18:49:21');
INSERT INTO `sys_log` VALUES ('88', '1', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 18:49:22');
INSERT INTO `sys_log` VALUES ('89', '1', 'admin', '登录', '2049', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 19:41:21');
INSERT INTO `sys_log` VALUES ('90', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 19:41:21');
INSERT INTO `sys_log` VALUES ('91', '1', 'admin', '登录', '164', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 19:51:39');
INSERT INTO `sys_log` VALUES ('92', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 19:51:39');
INSERT INTO `sys_log` VALUES ('93', '1', 'admin', '登录', '171', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 19:59:09');
INSERT INTO `sys_log` VALUES ('94', '1', 'admin', '请求访问主页', '78', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 19:59:09');
INSERT INTO `sys_log` VALUES ('95', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 19:59:19');
INSERT INTO `sys_log` VALUES ('96', '1', 'admin', '登录', '173', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:09:05');
INSERT INTO `sys_log` VALUES ('97', '1', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:09:05');
INSERT INTO `sys_log` VALUES ('98', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.HttpMediaTypeNotSupportedException: Content type \'application/x-www-form-urlencoded;charset=UTF-8\' not supported', null, '2020-07-05 20:09:17');
INSERT INTO `sys_log` VALUES ('99', '1', 'admin', '登录', '52', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:15:46');
INSERT INTO `sys_log` VALUES ('100', '1', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:15:46');
INSERT INTO `sys_log` VALUES ('101', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 20:15:57');
INSERT INTO `sys_log` VALUES ('102', '1', 'admin', '登录', '169', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:17:53');
INSERT INTO `sys_log` VALUES ('103', '1', 'admin', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:17:53');
INSERT INTO `sys_log` VALUES ('104', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 20:18:00');
INSERT INTO `sys_log` VALUES ('105', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 20:23:45');
INSERT INTO `sys_log` VALUES ('106', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.method.annotation.MethodArgumentConversionNotSupportedException: Failed to convert value of type \'java.lang.String\' to required type \'com.hzy.toolman.db.domain.system.SysUser\'; nested exception is java.lang.IllegalStateException: Cannot convert value of type \'java.lang.String\' to required type \'com.hzy.toolman.db.domain.system.SysUser\': no matching editors or conversion strategy found', null, '2020-07-05 20:24:56');
INSERT INTO `sys_log` VALUES ('107', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 20:25:03');
INSERT INTO `sys_log` VALUES ('108', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysUser parameter \'sysUser\' is not present', null, '2020-07-05 20:25:12');
INSERT INTO `sys_log` VALUES ('109', '1', 'admin', '登录', '52', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:26:23');
INSERT INTO `sys_log` VALUES ('110', '1', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:26:23');
INSERT INTO `sys_log` VALUES ('111', '1', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:27:59');
INSERT INTO `sys_log` VALUES ('112', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:27:59');
INSERT INTO `sys_log` VALUES ('113', '1', 'admin', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:28:13');
INSERT INTO `sys_log` VALUES ('114', '1', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:28:14');
INSERT INTO `sys_log` VALUES ('115', '1', 'admin', '登录', '171', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:35:51');
INSERT INTO `sys_log` VALUES ('116', '1', 'admin', '请求访问主页', '101', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:35:51');
INSERT INTO `sys_log` VALUES ('117', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'com.alibaba.fastjson.JSONException: expect string', null, '2020-07-05 20:36:02');
INSERT INTO `sys_log` VALUES ('118', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/exist', 'com.alibaba.fastjson.JSONException: expect string', null, '2020-07-05 20:36:21');
INSERT INTO `sys_log` VALUES ('119', null, null, '登录', '3', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:40:42');
INSERT INTO `sys_log` VALUES ('120', null, null, '登录', '0', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:40:50');
INSERT INTO `sys_log` VALUES ('121', null, null, '登录', '71', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:40:54');
INSERT INTO `sys_log` VALUES ('122', '1', 'admin', '登录', '44', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:41:02');
INSERT INTO `sys_log` VALUES ('123', '1', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:41:02');
INSERT INTO `sys_log` VALUES ('124', '1', 'admin', '登录', '213', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 20:50:49');
INSERT INTO `sys_log` VALUES ('125', '1', 'admin', '请求访问主页', '97', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 20:50:49');
INSERT INTO `sys_log` VALUES ('126', '1', 'admin', '添加用户', '111', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-05 20:51:13');
INSERT INTO `sys_log` VALUES ('127', '1', 'admin', '添加用户', '113', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-05 20:52:55');
INSERT INTO `sys_log` VALUES ('128', '1', 'admin', '登录', '194', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 21:31:16');
INSERT INTO `sys_log` VALUES ('129', '1', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 21:31:16');
INSERT INTO `sys_log` VALUES ('130', '1', 'admin', '更新用户', '85', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-05 21:31:38');
INSERT INTO `sys_log` VALUES ('131', '1', 'admin', '更新用户', '82', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-05 21:31:43');
INSERT INTO `sys_log` VALUES ('132', '1', 'admin', '更新用户', '82', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-05 21:32:11');
INSERT INTO `sys_log` VALUES ('133', '1', 'admin', '删除用户', '83', 'com.hzy.toolman.system.controller.SysUserController.remove()', null, '127.0.0.1', '2020-07-05 21:32:24');
INSERT INTO `sys_log` VALUES ('134', '1', 'admin', '登录', '224', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 21:50:20');
INSERT INTO `sys_log` VALUES ('135', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 21:50:21');
INSERT INTO `sys_log` VALUES ('136', '1', 'admin', '更新用户', '281', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-05 21:50:33');
INSERT INTO `sys_log` VALUES ('137', '1', 'admin', '更新用户', '270', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-05 21:50:37');
INSERT INTO `sys_log` VALUES ('138', '1', 'admin', '添加用户', '306', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-05 21:51:28');
INSERT INTO `sys_log` VALUES ('139', '1', 'admin', '添加用户', '245', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-05 21:53:58');
INSERT INTO `sys_log` VALUES ('140', '1', 'admin', '登录', '185', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:01:59');
INSERT INTO `sys_log` VALUES ('141', '1', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:01:59');
INSERT INTO `sys_log` VALUES ('142', '1', 'admin', '批量删除用户', '170', 'com.hzy.toolman.system.controller.SysUserController.batchRemove()', null, '127.0.0.1', '2020-07-05 22:02:12');
INSERT INTO `sys_log` VALUES ('143', '1', 'admin', '登录', '191', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:21:06');
INSERT INTO `sys_log` VALUES ('144', '1', 'admin', '请求访问主页', '110', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:21:06');
INSERT INTO `sys_log` VALUES ('145', '1', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:26:58');
INSERT INTO `sys_log` VALUES ('146', '1', 'admin', '请求访问主页', '114', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:26:58');
INSERT INTO `sys_log` VALUES ('147', '1', 'admin', '管理员更改密码', '88', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-05 22:27:17');
INSERT INTO `sys_log` VALUES ('148', '1', 'admin', '管理员更改密码', '77', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-05 22:28:11');
INSERT INTO `sys_log` VALUES ('149', null, null, '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:28:24');
INSERT INTO `sys_log` VALUES ('150', null, null, '登录', '39', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:28:30');
INSERT INTO `sys_log` VALUES ('151', '1', 'admin', '登录', '42', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:28:38');
INSERT INTO `sys_log` VALUES ('152', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:28:38');
INSERT INTO `sys_log` VALUES ('153', '1', 'admin', '管理员更改密码', '81', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-05 22:28:50');
INSERT INTO `sys_log` VALUES ('154', null, null, '登录', '46', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:29:14');
INSERT INTO `sys_log` VALUES ('155', '1', 'admin', '登录', '42', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:29:43');
INSERT INTO `sys_log` VALUES ('156', '1', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:29:43');
INSERT INTO `sys_log` VALUES ('157', '1', 'admin', '管理员更改密码', '83', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-05 22:30:26');
INSERT INTO `sys_log` VALUES ('158', '1', 'admin', '管理员更改密码', '80', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-05 22:33:54');
INSERT INTO `sys_log` VALUES ('159', '1', 'admin', '登录', '56', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:38:00');
INSERT INTO `sys_log` VALUES ('160', '1', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:38:01');
INSERT INTO `sys_log` VALUES ('161', '1', 'admin', '管理员更改密码', '0', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-05 22:38:34');
INSERT INTO `sys_log` VALUES ('162', '1', 'admin', '管理员更改密码', '88', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-05 22:38:43');
INSERT INTO `sys_log` VALUES ('163', '3', 'hzy', '登录', '46', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:38:55');
INSERT INTO `sys_log` VALUES ('164', '3', 'hzy', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:38:56');
INSERT INTO `sys_log` VALUES ('165', '1', 'admin', '登录', '44', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:39:17');
INSERT INTO `sys_log` VALUES ('166', '1', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:39:17');
INSERT INTO `sys_log` VALUES ('167', '1', 'admin', '登录', '196', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:44:39');
INSERT INTO `sys_log` VALUES ('168', '1', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:44:39');
INSERT INTO `sys_log` VALUES ('169', '1', 'admin', '登录', '82', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 22:48:02');
INSERT INTO `sys_log` VALUES ('170', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 22:48:03');
INSERT INTO `sys_log` VALUES ('171', '1', 'admin', '登录', '186', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 23:13:46');
INSERT INTO `sys_log` VALUES ('172', '1', 'admin', '请求访问主页', '115', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 23:13:46');
INSERT INTO `sys_log` VALUES ('173', '1', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 23:16:52');
INSERT INTO `sys_log` VALUES ('174', '1', 'admin', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 23:16:52');
INSERT INTO `sys_log` VALUES ('175', '1', 'admin', '登录', '179', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 23:44:52');
INSERT INTO `sys_log` VALUES ('176', '1', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 23:44:52');
INSERT INTO `sys_log` VALUES ('177', '1', 'admin', 'error', null, 'http://localhost:8081/sys/role/save', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'sysRoleMenus\' not found. Available parameters are [collection, list]', null, '2020-07-05 23:45:17');
INSERT INTO `sys_log` VALUES ('178', '1', 'admin', '登录', '227', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 23:48:36');
INSERT INTO `sys_log` VALUES ('179', '1', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 23:48:36');
INSERT INTO `sys_log` VALUES ('180', '1', 'admin', '添加角色', '0', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-05 23:48:50');
INSERT INTO `sys_log` VALUES ('181', '1', 'admin', '登录', '206', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 23:55:00');
INSERT INTO `sys_log` VALUES ('182', '1', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 23:55:00');
INSERT INTO `sys_log` VALUES ('183', '1', 'admin', '添加角色', '1', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-05 23:55:11');
INSERT INTO `sys_log` VALUES ('184', '1', 'admin', '登录', '245', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 23:55:57');
INSERT INTO `sys_log` VALUES ('185', '1', 'admin', '请求访问主页', '102', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 23:55:57');
INSERT INTO `sys_log` VALUES ('186', '1', 'admin', 'error', null, 'http://localhost:8081/sys/role/save', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'sysRoleMenus\' not found. Available parameters are [collection, list]', null, '2020-07-05 23:58:13');
INSERT INTO `sys_log` VALUES ('187', '1', 'admin', '登录', '232', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-05 23:59:59');
INSERT INTO `sys_log` VALUES ('188', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-05 23:59:59');
INSERT INTO `sys_log` VALUES ('189', '1', 'admin', 'error', null, 'http://localhost:8081/sys/role/save', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'sysRoleMenus\' not found. Available parameters are [collection, list]', null, '2020-07-06 00:00:16');
INSERT INTO `sys_log` VALUES ('190', '1', 'admin', '登录', '226', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:06:24');
INSERT INTO `sys_log` VALUES ('191', '1', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:06:24');
INSERT INTO `sys_log` VALUES ('192', '1', 'admin', '添加角色', '293', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-06 00:06:45');
INSERT INTO `sys_log` VALUES ('193', '1', 'admin', '登录', '219', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:11:22');
INSERT INTO `sys_log` VALUES ('194', '1', 'admin', '请求访问主页', '97', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:11:22');
INSERT INTO `sys_log` VALUES ('195', '1', 'admin', '更新角色', '254', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:11:34');
INSERT INTO `sys_log` VALUES ('196', '1', 'admin', '登录', '187', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:25:20');
INSERT INTO `sys_log` VALUES ('197', '1', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:25:20');
INSERT INTO `sys_log` VALUES ('198', '1', 'admin', '更新角色', '266', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:25:36');
INSERT INTO `sys_log` VALUES ('199', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:25:42');
INSERT INTO `sys_log` VALUES ('200', '1', 'admin', '删除角色', '245', 'com.hzy.toolman.system.controller.SysRoleController.remove()', null, '127.0.0.1', '2020-07-06 00:25:55');
INSERT INTO `sys_log` VALUES ('201', '1', 'admin', '更新角色', '149', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:26:46');
INSERT INTO `sys_log` VALUES ('202', '1', 'admin', '更新角色', '213', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:26:57');
INSERT INTO `sys_log` VALUES ('203', '1', 'admin', '登录', '69', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:29:47');
INSERT INTO `sys_log` VALUES ('204', '1', 'admin', '请求访问主页', '70', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:29:47');
INSERT INTO `sys_log` VALUES ('205', '1', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:31:19');
INSERT INTO `sys_log` VALUES ('206', '1', 'admin', '添加菜单', '113', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-06 00:32:19');
INSERT INTO `sys_log` VALUES ('207', '1', 'admin', '更新角色', '217', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:32:50');
INSERT INTO `sys_log` VALUES ('208', '2', 'test', '登录', '68', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:34:29');
INSERT INTO `sys_log` VALUES ('209', '2', 'test', '请求访问主页', '69', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:34:29');
INSERT INTO `sys_log` VALUES ('210', '2', 'test', 'error', null, 'http://localhost:8081/main', 'java.lang.NullPointerException', null, '2020-07-06 00:34:30');
INSERT INTO `sys_log` VALUES ('211', '2', 'test', 'error', null, 'http://localhost:8081/main', 'java.lang.NullPointerException', null, '2020-07-06 00:34:31');
INSERT INTO `sys_log` VALUES ('212', '1', 'admin', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:34:46');
INSERT INTO `sys_log` VALUES ('213', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:34:46');
INSERT INTO `sys_log` VALUES ('214', '1', 'admin', '更新用户', '212', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-06 00:35:08');
INSERT INTO `sys_log` VALUES ('215', '1', 'admin', '更新角色', '213', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:35:21');
INSERT INTO `sys_log` VALUES ('216', null, null, '登录', '37', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:35:36');
INSERT INTO `sys_log` VALUES ('217', '1', 'admin', '登录', '36', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:35:43');
INSERT INTO `sys_log` VALUES ('218', '1', 'admin', '请求访问主页', '68', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:35:43');
INSERT INTO `sys_log` VALUES ('219', '1', 'admin', '管理员更改密码', '83', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-06 00:35:52');
INSERT INTO `sys_log` VALUES ('220', '3', 'hzy', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:35:58');
INSERT INTO `sys_log` VALUES ('221', '3', 'hzy', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:35:58');
INSERT INTO `sys_log` VALUES ('222', '3', 'hzy', '更新角色', '140', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:36:12');
INSERT INTO `sys_log` VALUES ('223', '3', 'hzy', '请求访问主页', '66', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:36:18');
INSERT INTO `sys_log` VALUES ('224', '1', 'admin', '登录', '36', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:36:26');
INSERT INTO `sys_log` VALUES ('225', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:36:27');
INSERT INTO `sys_log` VALUES ('226', '1', 'admin', '更新角色', '249', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:36:35');
INSERT INTO `sys_log` VALUES ('227', '1', 'admin', '更新角色', '246', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 00:37:39');
INSERT INTO `sys_log` VALUES ('228', '1', 'admin', '登录', '42', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 00:37:57');
INSERT INTO `sys_log` VALUES ('229', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 00:37:58');
INSERT INTO `sys_log` VALUES ('230', '1', 'admin', '批量删除角色', '244', 'com.hzy.toolman.system.controller.SysRoleController.batchRemove()', null, '127.0.0.1', '2020-07-06 00:38:04');
INSERT INTO `sys_log` VALUES ('231', '1', 'admin', '登录', '194', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 01:07:51');
INSERT INTO `sys_log` VALUES ('232', '1', 'admin', '请求访问主页', '97', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 01:07:52');
INSERT INTO `sys_log` VALUES ('233', '1', 'admin', '登录', '193', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 01:43:36');
INSERT INTO `sys_log` VALUES ('234', '1', 'admin', '请求访问主页', '106', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 01:43:36');
INSERT INTO `sys_log` VALUES ('235', '1', 'admin', '删除部门', '47', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:43:45');
INSERT INTO `sys_log` VALUES ('236', '1', 'admin', '删除部门', '87', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:43:49');
INSERT INTO `sys_log` VALUES ('237', '1', 'admin', '请求访问主页', '131', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 01:48:13');
INSERT INTO `sys_log` VALUES ('238', '1', 'admin', '添加部门', '124', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-06 01:48:21');
INSERT INTO `sys_log` VALUES ('239', '1', 'admin', '添加部门', '125', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-06 01:48:35');
INSERT INTO `sys_log` VALUES ('240', '1', 'admin', '请求访问主页', '124', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 01:51:35');
INSERT INTO `sys_log` VALUES ('241', '1', 'admin', '添加部门', '121', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-06 01:51:45');
INSERT INTO `sys_log` VALUES ('242', '1', 'admin', '请求访问主页', '122', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 01:54:39');
INSERT INTO `sys_log` VALUES ('243', '1', 'admin', '更新部门', '85', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-06 01:54:46');
INSERT INTO `sys_log` VALUES ('244', '1', 'admin', '删除部门', '161', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:54:50');
INSERT INTO `sys_log` VALUES ('245', '1', 'admin', '删除部门', '161', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:54:53');
INSERT INTO `sys_log` VALUES ('246', '1', 'admin', '添加部门', '120', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-06 01:55:05');
INSERT INTO `sys_log` VALUES ('247', '1', 'admin', '更新部门', '81', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-06 01:55:10');
INSERT INTO `sys_log` VALUES ('248', '1', 'admin', '删除部门', '40', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:55:14');
INSERT INTO `sys_log` VALUES ('249', '1', 'admin', '删除部门', '161', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:55:16');
INSERT INTO `sys_log` VALUES ('250', '1', 'admin', '删除部门', '157', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:55:18');
INSERT INTO `sys_log` VALUES ('251', '1', 'admin', '删除部门', '77', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:55:22');
INSERT INTO `sys_log` VALUES ('252', '1', 'admin', '更新部门', '83', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-06 01:55:34');
INSERT INTO `sys_log` VALUES ('253', '1', 'admin', '更新部门', '84', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-06 01:55:48');
INSERT INTO `sys_log` VALUES ('254', '1', 'admin', '更新部门', '82', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-06 01:55:58');
INSERT INTO `sys_log` VALUES ('255', '1', 'admin', '更新部门', '83', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-06 01:56:10');
INSERT INTO `sys_log` VALUES ('256', '1', 'admin', '更新部门', '87', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-06 01:56:48');
INSERT INTO `sys_log` VALUES ('257', '1', 'admin', '删除部门', '78', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:57:20');
INSERT INTO `sys_log` VALUES ('258', '1', 'admin', '更新用户', '153', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-06 01:57:40');
INSERT INTO `sys_log` VALUES ('259', '1', 'admin', '删除部门', '144', 'com.hzy.toolman.system.controller.SysDeptController.remove()', null, '127.0.0.1', '2020-07-06 01:57:53');
INSERT INTO `sys_log` VALUES ('260', '1', 'admin', '登录', '301', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 16:19:03');
INSERT INTO `sys_log` VALUES ('261', '1', 'admin', '请求访问主页', '108', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:19:04');
INSERT INTO `sys_log` VALUES ('262', '1', 'admin', '请求访问主页', '122', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:25:22');
INSERT INTO `sys_log` VALUES ('263', '1', 'admin', '请求访问主页', '135', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:26:56');
INSERT INTO `sys_log` VALUES ('264', '1', 'admin', '登录', '54', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 16:42:54');
INSERT INTO `sys_log` VALUES ('265', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:42:54');
INSERT INTO `sys_log` VALUES ('266', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 16:42:59');
INSERT INTO `sys_log` VALUES ('267', '1', 'admin', '登录', '262', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 16:43:38');
INSERT INTO `sys_log` VALUES ('268', '1', 'admin', '请求访问主页', '154', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:43:39');
INSERT INTO `sys_log` VALUES ('269', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 16:43:45');
INSERT INTO `sys_log` VALUES ('270', '1', 'admin', '登录', '264', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 16:47:37');
INSERT INTO `sys_log` VALUES ('271', '1', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:47:37');
INSERT INTO `sys_log` VALUES ('272', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 16:47:45');
INSERT INTO `sys_log` VALUES ('273', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-12]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.time.LocalDateTime] for value \'1997-11-12\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-12]]', null, '2020-07-06 16:49:06');
INSERT INTO `sys_log` VALUES ('274', '1', 'admin', '登录', '327', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 16:51:46');
INSERT INTO `sys_log` VALUES ('275', '1', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:51:46');
INSERT INTO `sys_log` VALUES ('276', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-10]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.time.LocalDateTime] for value \'1997-11-10\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-10]]', null, '2020-07-06 16:51:53');
INSERT INTO `sys_log` VALUES ('277', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [2020-07-16]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.time.LocalDateTime] for value \'2020-07-16\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [2020-07-16]]', null, '2020-07-06 16:54:59');
INSERT INTO `sys_log` VALUES ('278', '1', 'admin', '登录', '238', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 16:58:34');
INSERT INTO `sys_log` VALUES ('279', '1', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 16:58:35');
INSERT INTO `sys_log` VALUES ('280', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 16:58:42');
INSERT INTO `sys_log` VALUES ('281', '1', 'admin', '登录', '302', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:02:22');
INSERT INTO `sys_log` VALUES ('282', '1', 'admin', '请求访问主页', '102', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:02:23');
INSERT INTO `sys_log` VALUES ('283', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:02:28');
INSERT INTO `sys_log` VALUES ('284', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:02:36');
INSERT INTO `sys_log` VALUES ('285', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:07:26');
INSERT INTO `sys_log` VALUES ('286', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:07:31');
INSERT INTO `sys_log` VALUES ('287', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:07:40');
INSERT INTO `sys_log` VALUES ('288', '1', 'admin', '登录', '251', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:12:16');
INSERT INTO `sys_log` VALUES ('289', '1', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:12:17');
INSERT INTO `sys_log` VALUES ('290', '1', 'admin', '请求访问主页', '108', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:12:43');
INSERT INTO `sys_log` VALUES ('291', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-04]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-04\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-04]]', null, '2020-07-06 17:12:51');
INSERT INTO `sys_log` VALUES ('292', '1', 'admin', '请求访问主页', '139', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:13:58');
INSERT INTO `sys_log` VALUES ('293', '1', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:14:09');
INSERT INTO `sys_log` VALUES ('294', null, null, '登录', '4', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:16:37');
INSERT INTO `sys_log` VALUES ('295', '1', 'admin', '登录', '97', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:16:41');
INSERT INTO `sys_log` VALUES ('296', '1', 'admin', '请求访问主页', '112', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:16:41');
INSERT INTO `sys_log` VALUES ('297', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat @com.fasterxml.jackson.annotation.JsonFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:16:46');
INSERT INTO `sys_log` VALUES ('298', '1', 'admin', '登录', '166', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:18:06');
INSERT INTO `sys_log` VALUES ('299', '1', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:18:07');
INSERT INTO `sys_log` VALUES ('300', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.web.HttpMediaTypeNotSupportedException: Content type \'application/x-www-form-urlencoded;charset=UTF-8\' not supported', null, '2020-07-06 17:18:11');
INSERT INTO `sys_log` VALUES ('301', null, null, '登录', '3', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:23:11');
INSERT INTO `sys_log` VALUES ('302', '1', 'admin', '登录', '73', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:23:15');
INSERT INTO `sys_log` VALUES ('303', '1', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:23:15');
INSERT INTO `sys_log` VALUES ('304', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'\n    where user_id = ?\', expect SET, actual WHERE pos 32, line 1, column 16, token WHERE : update sys_user\n      \n    where user_id = ?\r\n### SQL: update sys_user            where user_id = ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'\n    where user_id = ?\', expect SET, actual WHERE pos 32, line 1, column 16, token WHERE : update sys_user\n      \n    where user_id = ?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'\n    where user_id = ?\', expect SET, actual WHERE pos 32, line 1, column 16, token WHERE : update sys_user\n      \n    where user_id = ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'\n    where user_id = ?\', expect SET, actual WHERE pos 32, line 1, column 16, token WHERE : update sys_user\n      \n    where user_id = ?', null, '2020-07-06 17:23:26');
INSERT INTO `sys_log` VALUES ('305', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:24:46');
INSERT INTO `sys_log` VALUES ('306', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:24:55');
INSERT INTO `sys_log` VALUES ('307', '1', 'admin', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:25:47');
INSERT INTO `sys_log` VALUES ('308', '1', 'admin', '登录', '169', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:30:21');
INSERT INTO `sys_log` VALUES ('309', '1', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:30:21');
INSERT INTO `sys_log` VALUES ('310', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:30:28');
INSERT INTO `sys_log` VALUES ('311', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:30:34');
INSERT INTO `sys_log` VALUES ('312', '1', 'admin', '登录', '48', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:33:08');
INSERT INTO `sys_log` VALUES ('313', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:33:09');
INSERT INTO `sys_log` VALUES ('314', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-20]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-20\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-20]]', null, '2020-07-06 17:33:21');
INSERT INTO `sys_log` VALUES ('315', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [2020-07-25]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'2020-07-25\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [2020-07-25]]', null, '2020-07-06 17:33:31');
INSERT INTO `sys_log` VALUES ('316', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [2020-06-30]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'2020-06-30\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [2020-06-30]]', null, '2020-07-06 17:33:36');
INSERT INTO `sys_log` VALUES ('317', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [2020-06-30]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'2020-06-30\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [2020-06-30]]', null, '2020-07-06 17:33:42');
INSERT INTO `sys_log` VALUES ('318', '1', 'admin', '登录', '174', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:41:45');
INSERT INTO `sys_log` VALUES ('319', '1', 'admin', '请求访问主页', '106', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:41:45');
INSERT INTO `sys_log` VALUES ('320', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/updatePersonal', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'sysUser\' on field \'birth\': rejected value [1997-11-09]; codes [typeMismatch.sysUser.birth,typeMismatch.birth,typeMismatch.java.time.LocalDateTime,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sysUser.birth,birth]; arguments []; default message [birth]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.time.LocalDateTime\' for property \'birth\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [@org.springframework.format.annotation.DateTimeFormat java.time.LocalDateTime] for value \'1997-11-09\'; nested exception is java.lang.IllegalArgumentException: Parse attempt failed for value [1997-11-09]]', null, '2020-07-06 17:41:52');
INSERT INTO `sys_log` VALUES ('321', '1', 'admin', '登录', '176', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:53:29');
INSERT INTO `sys_log` VALUES ('322', '1', 'admin', '请求访问主页', '108', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:53:30');
INSERT INTO `sys_log` VALUES ('323', '1', 'admin', '用户自行更改信息', '92', 'com.hzy.toolman.system.controller.SysUserController.updatePersonal()', null, '127.0.0.1', '2020-07-06 17:53:34');
INSERT INTO `sys_log` VALUES ('324', '1', 'admin', '用户自行更改密码', '0', 'com.hzy.toolman.system.controller.SysUserController.resetPwdByUser()', null, '127.0.0.1', '2020-07-06 17:54:13');
INSERT INTO `sys_log` VALUES ('325', '1', 'admin', '用户自行更改信息', '93', 'com.hzy.toolman.system.controller.SysUserController.updatePersonal()', null, '127.0.0.1', '2020-07-06 17:55:18');
INSERT INTO `sys_log` VALUES ('326', '1', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:55:28');
INSERT INTO `sys_log` VALUES ('327', null, null, '登录', '48', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:55:39');
INSERT INTO `sys_log` VALUES ('328', '1', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:55:44');
INSERT INTO `sys_log` VALUES ('329', '1', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:55:44');
INSERT INTO `sys_log` VALUES ('330', '1', 'admin', '登录', '233', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 17:59:40');
INSERT INTO `sys_log` VALUES ('331', '1', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 17:59:40');
INSERT INTO `sys_log` VALUES ('332', '1', 'admin', '用户自行更改密码', '15623', 'com.hzy.toolman.system.controller.SysUserController.resetPwdByUser()', null, '127.0.0.1', '2020-07-06 18:00:05');
INSERT INTO `sys_log` VALUES ('333', '1', 'admin', '用户自行更改密码', '34023', 'com.hzy.toolman.system.controller.SysUserController.resetPwdByUser()', null, '127.0.0.1', '2020-07-06 18:00:41');
INSERT INTO `sys_log` VALUES ('334', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:01:27');
INSERT INTO `sys_log` VALUES ('335', '1', 'admin', '用户自行更改密码', '16171', 'com.hzy.toolman.system.controller.SysUserController.resetPwdByUser()', null, '127.0.0.1', '2020-07-06 18:01:56');
INSERT INTO `sys_log` VALUES ('336', '1', 'admin', '登录', '42', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:02:07');
INSERT INTO `sys_log` VALUES ('337', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:02:08');
INSERT INTO `sys_log` VALUES ('338', '1', 'admin', '用户自行更改密码', '1833', 'com.hzy.toolman.system.controller.SysUserController.resetPwdByUser()', null, '127.0.0.1', '2020-07-06 18:02:21');
INSERT INTO `sys_log` VALUES ('339', '1', 'admin', '用户自行更改密码', '85', 'com.hzy.toolman.system.controller.SysUserController.resetPwdByUser()', null, '127.0.0.1', '2020-07-06 18:02:29');
INSERT INTO `sys_log` VALUES ('340', '1', 'admin', '登录', '171', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:29:11');
INSERT INTO `sys_log` VALUES ('341', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:29:12');
INSERT INTO `sys_log` VALUES ('342', '1', 'admin', '用户上传头像', '323', 'com.hzy.toolman.system.controller.SysUserController.uploadImg()', null, '127.0.0.1', '2020-07-06 18:29:52');
INSERT INTO `sys_log` VALUES ('343', '1', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:29:59');
INSERT INTO `sys_log` VALUES ('344', '1', 'admin', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:30:10');
INSERT INTO `sys_log` VALUES ('345', '1', 'admin', 'error', null, 'http://localhost:8081/index', 'java.lang.NullPointerException', null, '2020-07-06 18:30:10');
INSERT INTO `sys_log` VALUES ('346', '1', 'admin', '登录', '42', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:34:56');
INSERT INTO `sys_log` VALUES ('347', '1', 'admin', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:34:57');
INSERT INTO `sys_log` VALUES ('348', null, null, '登录', '2', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:41:09');
INSERT INTO `sys_log` VALUES ('349', '1', 'admin', '登录', '85', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:41:15');
INSERT INTO `sys_log` VALUES ('350', '1', 'admin', '请求访问主页', '85049', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:42:40');
INSERT INTO `sys_log` VALUES ('351', '1', 'admin', '登录', '185', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:45:52');
INSERT INTO `sys_log` VALUES ('352', '1', 'admin', '请求访问主页', '102', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:45:52');
INSERT INTO `sys_log` VALUES ('353', '1', 'admin', '用户上传头像', '249', 'com.hzy.toolman.system.controller.SysUserController.uploadImg()', null, '127.0.0.1', '2020-07-06 18:46:14');
INSERT INTO `sys_log` VALUES ('354', '1', 'admin', '登录', '44', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:46:21');
INSERT INTO `sys_log` VALUES ('355', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:46:22');
INSERT INTO `sys_log` VALUES ('356', '1', 'admin', '登录', '53', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:54:04');
INSERT INTO `sys_log` VALUES ('357', '1', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:54:04');
INSERT INTO `sys_log` VALUES ('358', '1', 'admin', '用户上传头像', '317', 'com.hzy.toolman.system.controller.SysUserController.uploadImg()', null, '127.0.0.1', '2020-07-06 18:54:16');
INSERT INTO `sys_log` VALUES ('359', '1', 'admin', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:54:24');
INSERT INTO `sys_log` VALUES ('360', '1', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:54:25');
INSERT INTO `sys_log` VALUES ('361', '1', 'admin', '登录', '47', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 18:54:59');
INSERT INTO `sys_log` VALUES ('362', '1', 'admin', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 18:55:00');
INSERT INTO `sys_log` VALUES ('363', '1', 'admin', '登录', '182', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 22:46:12');
INSERT INTO `sys_log` VALUES ('364', '1', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 22:46:12');
INSERT INTO `sys_log` VALUES ('365', '1', 'admin', '管理员更改密码', '1', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-06 22:46:58');
INSERT INTO `sys_log` VALUES ('366', '1', 'admin', '用户自行更改信息', '88', 'com.hzy.toolman.system.controller.SysUserController.updatePersonal()', null, '127.0.0.1', '2020-07-06 22:47:21');
INSERT INTO `sys_log` VALUES ('367', '1', 'admin', '登录', '2049', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:06:58');
INSERT INTO `sys_log` VALUES ('368', '1', 'admin', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:06:58');
INSERT INTO `sys_log` VALUES ('369', '1', 'admin', '登录', '76', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:08:23');
INSERT INTO `sys_log` VALUES ('370', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:08:23');
INSERT INTO `sys_log` VALUES ('371', '1', 'admin', '添加菜单', '162', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-06 23:09:26');
INSERT INTO `sys_log` VALUES ('372', '1', 'admin', '登录', '78', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:10:48');
INSERT INTO `sys_log` VALUES ('373', '1', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:10:49');
INSERT INTO `sys_log` VALUES ('374', '1', 'admin', '添加菜单', '112', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-06 23:11:40');
INSERT INTO `sys_log` VALUES ('375', '1', 'admin', '更新角色', '225', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 23:11:51');
INSERT INTO `sys_log` VALUES ('376', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:11:53');
INSERT INTO `sys_log` VALUES ('377', '1', 'admin', '登录', '173', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:12:41');
INSERT INTO `sys_log` VALUES ('378', '1', 'admin', '请求访问主页', '118', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:12:41');
INSERT INTO `sys_log` VALUES ('379', '1', 'admin', '登录', '46', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:13:00');
INSERT INTO `sys_log` VALUES ('380', '1', 'admin', '登录', '0', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:13:04');
INSERT INTO `sys_log` VALUES ('381', '3', 'hzy', '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:13:15');
INSERT INTO `sys_log` VALUES ('382', '3', 'hzy', '请求访问主页', '74', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:13:15');
INSERT INTO `sys_log` VALUES ('383', null, null, '登录', '90', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '192.168.17.159', '2020-07-06 23:14:26');
INSERT INTO `sys_log` VALUES ('384', '3', 'hzy', '登录', '46', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '192.168.17.159', '2020-07-06 23:14:41');
INSERT INTO `sys_log` VALUES ('385', '3', 'hzy', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '192.168.17.159', '2020-07-06 23:14:42');
INSERT INTO `sys_log` VALUES ('386', '1', 'admin', '登录', '90', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:21:25');
INSERT INTO `sys_log` VALUES ('387', '1', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:21:26');
INSERT INTO `sys_log` VALUES ('388', '1', 'admin', '请求访问主页', '125', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:23:57');
INSERT INTO `sys_log` VALUES ('389', '1', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:24:12');
INSERT INTO `sys_log` VALUES ('390', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:24:12');
INSERT INTO `sys_log` VALUES ('391', '1', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:26:46');
INSERT INTO `sys_log` VALUES ('392', '3', 'hzy', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:27:49');
INSERT INTO `sys_log` VALUES ('393', '3', 'hzy', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:27:50');
INSERT INTO `sys_log` VALUES ('394', '3', 'hzy', '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:28:06');
INSERT INTO `sys_log` VALUES ('395', '3', 'hzy', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:28:06');
INSERT INTO `sys_log` VALUES ('396', null, null, '登录', '0', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:28:32');
INSERT INTO `sys_log` VALUES ('397', '1', 'admin', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:28:35');
INSERT INTO `sys_log` VALUES ('398', '1', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:28:35');
INSERT INTO `sys_log` VALUES ('399', '1', 'admin', '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:29:15');
INSERT INTO `sys_log` VALUES ('400', '1', 'admin', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:29:15');
INSERT INTO `sys_log` VALUES ('401', '3', 'hzy', '登录', '39', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '192.168.17.159', '2020-07-06 23:29:40');
INSERT INTO `sys_log` VALUES ('402', '3', 'hzy', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '192.168.17.159', '2020-07-06 23:29:40');
INSERT INTO `sys_log` VALUES ('403', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:30:46');
INSERT INTO `sys_log` VALUES ('404', '1', 'admin', '请求访问主页', '78', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:31:23');
INSERT INTO `sys_log` VALUES ('405', '1', 'admin', '登录', '210', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:47:16');
INSERT INTO `sys_log` VALUES ('406', '1', 'admin', '请求访问主页', '116', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:47:16');
INSERT INTO `sys_log` VALUES ('407', '1', 'admin', '添加菜单', '129', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-06 23:47:54');
INSERT INTO `sys_log` VALUES ('408', '1', 'admin', '更新菜单', '136', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-06 23:50:05');
INSERT INTO `sys_log` VALUES ('409', '1', 'admin', '更新角色', '268', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-06 23:50:20');
INSERT INTO `sys_log` VALUES ('410', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:50:21');
INSERT INTO `sys_log` VALUES ('411', '1', 'admin', 'error', null, 'http://localhost:8081/sys/log', 'java.lang.NullPointerException', null, '2020-07-06 23:50:23');
INSERT INTO `sys_log` VALUES ('412', '1', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-06 23:51:46');
INSERT INTO `sys_log` VALUES ('413', '1', 'admin', '请求访问主页', '110', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-06 23:51:47');
INSERT INTO `sys_log` VALUES ('414', '1', 'admin', 'error', null, 'http://localhost:8081/sys/log', 'org.springframework.web.bind.MissingServletRequestParameterException: Required SysLog parameter \'sysLog\' is not present', null, '2020-07-06 23:51:49');
INSERT INTO `sys_log` VALUES ('415', '1', 'admin', '登录', '209', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:05:03');
INSERT INTO `sys_log` VALUES ('416', '1', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:05:04');
INSERT INTO `sys_log` VALUES ('417', '1', 'admin', '登录', '204', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:07:27');
INSERT INTO `sys_log` VALUES ('418', '1', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:07:27');
INSERT INTO `sys_log` VALUES ('419', '1', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:08:32');
INSERT INTO `sys_log` VALUES ('420', '1', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:08:32');
INSERT INTO `sys_log` VALUES ('421', '1', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:10:23');
INSERT INTO `sys_log` VALUES ('422', '1', 'admin', '请求访问主页', '97', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:10:23');
INSERT INTO `sys_log` VALUES ('423', '1', 'admin', '添加菜单', '124', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 00:12:55');
INSERT INTO `sys_log` VALUES ('424', '1', 'admin', '添加菜单', '117', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 00:13:09');
INSERT INTO `sys_log` VALUES ('425', '1', 'admin', '添加菜单', '121', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 00:13:27');
INSERT INTO `sys_log` VALUES ('426', '1', 'admin', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:13:41');
INSERT INTO `sys_log` VALUES ('427', '1', 'admin', '请求访问主页', '114', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:16:19');
INSERT INTO `sys_log` VALUES ('428', '1', 'admin', '更新角色', '248', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:18:18');
INSERT INTO `sys_log` VALUES ('429', '1', 'admin', '请求访问主页', '76', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:18:20');
INSERT INTO `sys_log` VALUES ('430', '1', 'admin', '更新菜单', '80', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 00:22:49');
INSERT INTO `sys_log` VALUES ('431', '1', 'admin', '更新角色', '241', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:23:19');
INSERT INTO `sys_log` VALUES ('432', '1', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:23:48');
INSERT INTO `sys_log` VALUES ('433', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:23:49');
INSERT INTO `sys_log` VALUES ('434', '1', 'admin', '更新角色', '236', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:24:03');
INSERT INTO `sys_log` VALUES ('435', '1', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:24:07');
INSERT INTO `sys_log` VALUES ('436', '1', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:24:18');
INSERT INTO `sys_log` VALUES ('437', '1', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:24:18');
INSERT INTO `sys_log` VALUES ('438', '1', 'admin', '更新菜单', '80', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 00:25:37');
INSERT INTO `sys_log` VALUES ('439', '1', 'admin', '更新菜单', '82', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 00:26:03');
INSERT INTO `sys_log` VALUES ('440', '1', 'admin', '更新菜单', '80', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 00:26:21');
INSERT INTO `sys_log` VALUES ('441', '1', 'admin', '添加菜单', '119', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 00:26:40');
INSERT INTO `sys_log` VALUES ('442', '1', 'admin', '添加菜单', '134', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 00:27:12');
INSERT INTO `sys_log` VALUES ('443', '1', 'admin', '更新角色', '267', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:27:33');
INSERT INTO `sys_log` VALUES ('444', '1', 'admin', '登录', '190', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:37:04');
INSERT INTO `sys_log` VALUES ('445', '1', 'admin', '请求访问主页', '101', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:37:04');
INSERT INTO `sys_log` VALUES ('446', '1', 'admin', '更新角色', '260', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:37:24');
INSERT INTO `sys_log` VALUES ('447', '1', 'admin', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:37:35');
INSERT INTO `sys_log` VALUES ('448', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:37:35');
INSERT INTO `sys_log` VALUES ('449', '1', 'admin', '更新角色', '246', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:37:48');
INSERT INTO `sys_log` VALUES ('454', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:39:29');
INSERT INTO `sys_log` VALUES ('455', '1', 'admin', '登录', '196', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:48:33');
INSERT INTO `sys_log` VALUES ('456', '1', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:48:33');
INSERT INTO `sys_log` VALUES ('457', '1', 'admin', '添加菜单', '121', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 00:48:56');
INSERT INTO `sys_log` VALUES ('458', '1', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:48:58');
INSERT INTO `sys_log` VALUES ('459', '1', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:49:03');
INSERT INTO `sys_log` VALUES ('460', '1', 'admin', '更新角色', '232', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:49:12');
INSERT INTO `sys_log` VALUES ('461', '1', 'admin', '请求访问主页', '76', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:49:13');
INSERT INTO `sys_log` VALUES ('462', '1', 'admin', '添加菜单', '115', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 00:54:04');
INSERT INTO `sys_log` VALUES ('463', '1', 'admin', '更新角色', '246', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 00:54:11');
INSERT INTO `sys_log` VALUES ('464', null, null, '登录', '5', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:55:04');
INSERT INTO `sys_log` VALUES ('465', '1', 'admin', '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 00:55:07');
INSERT INTO `sys_log` VALUES ('466', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 00:55:07');
INSERT INTO `sys_log` VALUES ('467', '1', 'admin', '登录', '1645', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 01:14:20');
INSERT INTO `sys_log` VALUES ('468', '1', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:14:20');
INSERT INTO `sys_log` VALUES ('469', '1', 'admin', '登录', '171', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 01:28:56');
INSERT INTO `sys_log` VALUES ('470', '1', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:28:57');
INSERT INTO `sys_log` VALUES ('471', '1', 'admin', '登录', '266', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 01:45:06');
INSERT INTO `sys_log` VALUES ('472', '1', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 01:45:57');
INSERT INTO `sys_log` VALUES ('473', '1', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:45:57');
INSERT INTO `sys_log` VALUES ('474', '1', 'admin', '请求访问主页', '1608', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:54:28');
INSERT INTO `sys_log` VALUES ('475', '1', 'admin', '请求访问主页', '110', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:55:57');
INSERT INTO `sys_log` VALUES ('476', '1', 'admin', '登录', '37', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 01:56:37');
INSERT INTO `sys_log` VALUES ('477', '1', 'admin', '请求访问主页', '76', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:56:37');
INSERT INTO `sys_log` VALUES ('478', '1', 'admin', '请求访问主页', '126', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:57:46');
INSERT INTO `sys_log` VALUES ('479', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:57:55');
INSERT INTO `sys_log` VALUES ('480', '1', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:58:02');
INSERT INTO `sys_log` VALUES ('481', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 01:58:09');
INSERT INTO `sys_log` VALUES ('482', '1', 'admin', '请求访问主页', '2084', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:08:28');
INSERT INTO `sys_log` VALUES ('483', '1', 'admin', '请求访问主页', '114', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:13:32');
INSERT INTO `sys_log` VALUES ('484', '1', 'admin', '登录', '181', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 02:20:05');
INSERT INTO `sys_log` VALUES ('485', '1', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:20:05');
INSERT INTO `sys_log` VALUES ('486', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:20:16');
INSERT INTO `sys_log` VALUES ('487', '1', 'admin', '登录', '252', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 02:24:59');
INSERT INTO `sys_log` VALUES ('488', '1', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:24:59');
INSERT INTO `sys_log` VALUES ('489', '1', 'admin', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:25:36');
INSERT INTO `sys_log` VALUES ('490', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:25:39');
INSERT INTO `sys_log` VALUES ('491', '1', 'admin', '登录', '175', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 02:28:44');
INSERT INTO `sys_log` VALUES ('492', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 02:28:44');
INSERT INTO `sys_log` VALUES ('493', '1', 'admin', '登录', '197', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:17:32');
INSERT INTO `sys_log` VALUES ('494', '1', 'admin', '请求访问主页', '108', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:17:32');
INSERT INTO `sys_log` VALUES ('495', '1', 'admin', '登录', '1560', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:28:19');
INSERT INTO `sys_log` VALUES ('496', '1', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:28:20');
INSERT INTO `sys_log` VALUES ('497', '1', 'admin', '登录', '255', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:39:24');
INSERT INTO `sys_log` VALUES ('498', '1', 'admin', '登录', '87', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:40:38');
INSERT INTO `sys_log` VALUES ('499', '1', 'admin', '登录', '88', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:45:49');
INSERT INTO `sys_log` VALUES ('500', '1', 'admin', '请求访问主页', '141', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:48:02');
INSERT INTO `sys_log` VALUES ('501', '1', 'admin', '登录', '221', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:50:01');
INSERT INTO `sys_log` VALUES ('502', '1', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:50:01');
INSERT INTO `sys_log` VALUES ('503', '1', 'admin', '请求访问主页', '126', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:53:26');
INSERT INTO `sys_log` VALUES ('504', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:53:28');
INSERT INTO `sys_log` VALUES ('505', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:53:29');
INSERT INTO `sys_log` VALUES ('506', '1', 'admin', '登录', '164', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:53:59');
INSERT INTO `sys_log` VALUES ('507', '1', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:53:59');
INSERT INTO `sys_log` VALUES ('508', '1', 'admin', '登录', '177', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:57:52');
INSERT INTO `sys_log` VALUES ('509', '1', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:57:53');
INSERT INTO `sys_log` VALUES ('510', '1', 'admin', '登录', '184', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 13:59:25');
INSERT INTO `sys_log` VALUES ('511', '1', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 13:59:25');
INSERT INTO `sys_log` VALUES ('512', '1', 'admin', '登录', '168', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:07:05');
INSERT INTO `sys_log` VALUES ('513', '1', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:07:05');
INSERT INTO `sys_log` VALUES ('514', '1', 'admin', '请求访问主页', '117', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:11:26');
INSERT INTO `sys_log` VALUES ('515', '1', 'admin', '请求访问主页', '115', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:13:41');
INSERT INTO `sys_log` VALUES ('516', '1', 'admin', '更新菜单', '80', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 14:14:47');
INSERT INTO `sys_log` VALUES ('517', '1', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:14:48');
INSERT INTO `sys_log` VALUES ('518', '1', 'admin', '登录', '38', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:15:04');
INSERT INTO `sys_log` VALUES ('519', '1', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:15:04');
INSERT INTO `sys_log` VALUES ('520', '1', 'admin', '更新菜单', '77', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 14:15:13');
INSERT INTO `sys_log` VALUES ('521', '1', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:16:21');
INSERT INTO `sys_log` VALUES ('522', '1', 'admin', '请求访问主页', '114', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:18:12');
INSERT INTO `sys_log` VALUES ('523', '1', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:18:20');
INSERT INTO `sys_log` VALUES ('524', '1', 'admin', 'error', null, 'http://localhost:8081/sys/index', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2020-07-07 14:19:21');
INSERT INTO `sys_log` VALUES ('525', '1', 'admin', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:19:22');
INSERT INTO `sys_log` VALUES ('526', '1', 'admin', '请求访问主页', '118', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:21:59');
INSERT INTO `sys_log` VALUES ('527', '1', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:22:25');
INSERT INTO `sys_log` VALUES ('528', '1', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:22:25');
INSERT INTO `sys_log` VALUES ('529', '1', 'admin', '登录', '169', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:23:59');
INSERT INTO `sys_log` VALUES ('530', '1', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:23:59');
INSERT INTO `sys_log` VALUES ('531', '1', 'admin', '请求访问主页', '137', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:27:52');
INSERT INTO `sys_log` VALUES ('532', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:28:37');
INSERT INTO `sys_log` VALUES ('533', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:29:59');
INSERT INTO `sys_log` VALUES ('534', '1', 'admin', '添加用户', '317', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-07 14:30:51');
INSERT INTO `sys_log` VALUES ('535', '1', 'admin', '管理员更改密码', '91', 'com.hzy.toolman.system.controller.SysUserController.adminResetPwd()', null, '127.0.0.1', '2020-07-07 14:31:08');
INSERT INTO `sys_log` VALUES ('536', '7', 'test1', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:31:19');
INSERT INTO `sys_log` VALUES ('537', '7', 'test1', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:31:20');
INSERT INTO `sys_log` VALUES ('538', '7', 'test1', '用户自行更改信息', '90', 'com.hzy.toolman.system.controller.SysUserController.updatePersonal()', null, '127.0.0.1', '2020-07-07 14:32:14');
INSERT INTO `sys_log` VALUES ('539', '7', 'test1', '用户自行更改密码', '92', 'com.hzy.toolman.system.controller.SysUserController.resetPwdByUser()', null, '127.0.0.1', '2020-07-07 14:32:33');
INSERT INTO `sys_log` VALUES ('540', '7', 'test1', '用户上传头像', '351', 'com.hzy.toolman.system.controller.SysUserController.uploadImg()', null, '127.0.0.1', '2020-07-07 14:32:52');
INSERT INTO `sys_log` VALUES ('541', '7', 'test1', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:32:56');
INSERT INTO `sys_log` VALUES ('542', '7', 'test1', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:33:24');
INSERT INTO `sys_log` VALUES ('543', '7', 'test1', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:33:26');
INSERT INTO `sys_log` VALUES ('544', '1', 'admin', '登录', '86', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:35:16');
INSERT INTO `sys_log` VALUES ('545', '1', 'admin', '请求访问主页', '129', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:35:16');
INSERT INTO `sys_log` VALUES ('546', '1', 'admin', '登录', '180', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:37:59');
INSERT INTO `sys_log` VALUES ('547', '1', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:37:59');
INSERT INTO `sys_log` VALUES ('548', '1', 'admin', '登录', '164', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:41:21');
INSERT INTO `sys_log` VALUES ('549', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:41:22');
INSERT INTO `sys_log` VALUES ('550', '1', 'admin', '登录', '192', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:42:42');
INSERT INTO `sys_log` VALUES ('551', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:42:42');
INSERT INTO `sys_log` VALUES ('552', '1', 'admin', '登录', '55', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:43:14');
INSERT INTO `sys_log` VALUES ('553', '1', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:43:14');
INSERT INTO `sys_log` VALUES ('554', '1', 'admin', '登录', '182', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:44:23');
INSERT INTO `sys_log` VALUES ('555', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:44:23');
INSERT INTO `sys_log` VALUES ('556', '1', 'admin', '登录', '194', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:45:17');
INSERT INTO `sys_log` VALUES ('557', '1', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:45:17');
INSERT INTO `sys_log` VALUES ('558', '1', 'admin', '登录', '79', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:47:24');
INSERT INTO `sys_log` VALUES ('559', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:47:25');
INSERT INTO `sys_log` VALUES ('560', '1', 'admin', '登录', '196', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:48:13');
INSERT INTO `sys_log` VALUES ('561', '1', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:48:13');
INSERT INTO `sys_log` VALUES ('562', '1', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:49:53');
INSERT INTO `sys_log` VALUES ('563', '1', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:49:53');
INSERT INTO `sys_log` VALUES ('564', '1', 'admin', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:50:37');
INSERT INTO `sys_log` VALUES ('565', '1', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:50:37');
INSERT INTO `sys_log` VALUES ('566', '1', 'admin', '登录', '205', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:51:55');
INSERT INTO `sys_log` VALUES ('567', '1', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:51:55');
INSERT INTO `sys_log` VALUES ('568', '1', 'admin', '登录', '164', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:56:33');
INSERT INTO `sys_log` VALUES ('569', '1', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:56:34');
INSERT INTO `sys_log` VALUES ('570', '1', 'admin', '登录', '39', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:56:44');
INSERT INTO `sys_log` VALUES ('571', '1', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:56:45');
INSERT INTO `sys_log` VALUES ('572', '1', 'admin', '登录', '90', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 14:57:28');
INSERT INTO `sys_log` VALUES ('573', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:57:28');
INSERT INTO `sys_log` VALUES ('574', '1', 'admin', '更新用户', '249', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-07 14:57:51');
INSERT INTO `sys_log` VALUES ('575', '1', 'admin', '删除用户', '82', 'com.hzy.toolman.system.controller.SysUserController.remove()', null, '127.0.0.1', '2020-07-07 14:57:54');
INSERT INTO `sys_log` VALUES ('576', '1', 'admin', '添加角色', '291', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-07 14:58:07');
INSERT INTO `sys_log` VALUES ('577', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 14:59:04');
INSERT INTO `sys_log` VALUES ('578', '1', 'admin', '登录', '210', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 15:07:35');
INSERT INTO `sys_log` VALUES ('579', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:07:35');
INSERT INTO `sys_log` VALUES ('580', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:08:11');
INSERT INTO `sys_log` VALUES ('581', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:10:12');
INSERT INTO `sys_log` VALUES ('582', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:10:53');
INSERT INTO `sys_log` VALUES ('583', '1', 'admin', '请求访问主页', '112', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:12:18');
INSERT INTO `sys_log` VALUES ('584', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:12:37');
INSERT INTO `sys_log` VALUES ('585', '1', 'admin', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 15:12:58');
INSERT INTO `sys_log` VALUES ('586', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:12:58');
INSERT INTO `sys_log` VALUES ('587', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:13:45');
INSERT INTO `sys_log` VALUES ('588', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:14:21');
INSERT INTO `sys_log` VALUES ('589', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:14:23');
INSERT INTO `sys_log` VALUES ('590', '1', 'admin', '请求访问主页', '71', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:14:32');
INSERT INTO `sys_log` VALUES ('591', '1', 'admin', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:14:49');
INSERT INTO `sys_log` VALUES ('592', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:15:31');
INSERT INTO `sys_log` VALUES ('593', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:15:44');
INSERT INTO `sys_log` VALUES ('594', '1', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:17:41');
INSERT INTO `sys_log` VALUES ('595', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:18:40');
INSERT INTO `sys_log` VALUES ('596', '1', 'admin', '请求访问主页', '120', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:19:58');
INSERT INTO `sys_log` VALUES ('597', '1', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:20:35');
INSERT INTO `sys_log` VALUES ('598', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:20:48');
INSERT INTO `sys_log` VALUES ('599', '1', 'admin', '请求访问主页', '73', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:21:53');
INSERT INTO `sys_log` VALUES ('600', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:22:11');
INSERT INTO `sys_log` VALUES ('601', '1', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:23:38');
INSERT INTO `sys_log` VALUES ('602', '1', 'admin', '更新菜单', '86', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 15:24:16');
INSERT INTO `sys_log` VALUES ('603', '1', 'admin', '更新菜单', '83', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 15:24:24');
INSERT INTO `sys_log` VALUES ('604', '1', 'admin', '请求访问主页', '2081', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:33:41');
INSERT INTO `sys_log` VALUES ('605', '1', 'admin', '请求访问主页', '135', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:37:53');
INSERT INTO `sys_log` VALUES ('606', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:38:25');
INSERT INTO `sys_log` VALUES ('607', '1', 'admin', '请求访问主页', '71', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:38:49');
INSERT INTO `sys_log` VALUES ('608', '1', 'admin', '添加菜单', '133', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 15:39:20');
INSERT INTO `sys_log` VALUES ('609', '1', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:39:21');
INSERT INTO `sys_log` VALUES ('610', '1', 'admin', '请求访问主页', '74', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:39:24');
INSERT INTO `sys_log` VALUES ('611', '1', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 15:39:35');
INSERT INTO `sys_log` VALUES ('612', '1', 'admin', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:39:35');
INSERT INTO `sys_log` VALUES ('613', '1', 'admin', '更新角色', '270', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 15:39:48');
INSERT INTO `sys_log` VALUES ('614', '1', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:39:50');
INSERT INTO `sys_log` VALUES ('615', '1', 'admin', '添加菜单', '183', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 15:43:55');
INSERT INTO `sys_log` VALUES ('616', '1', 'admin', '更新菜单', '87', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 15:44:07');
INSERT INTO `sys_log` VALUES ('617', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:44:18');
INSERT INTO `sys_log` VALUES ('618', '1', 'admin', '更新菜单', '73', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 15:44:34');
INSERT INTO `sys_log` VALUES ('619', '1', 'admin', '更新菜单', '73', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 15:44:37');
INSERT INTO `sys_log` VALUES ('620', '1', 'admin', '更新角色', '225', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 15:44:45');
INSERT INTO `sys_log` VALUES ('621', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:44:47');
INSERT INTO `sys_log` VALUES ('622', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:45:55');
INSERT INTO `sys_log` VALUES ('623', '1', 'admin', '请求访问主页', '74', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:46:19');
INSERT INTO `sys_log` VALUES ('624', '1', 'admin', '更新角色', '375', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 15:46:51');
INSERT INTO `sys_log` VALUES ('625', '1', 'admin', '登录', '208', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 15:51:01');
INSERT INTO `sys_log` VALUES ('626', '1', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 15:51:02');
INSERT INTO `sys_log` VALUES ('627', null, null, '登录', '9', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 16:06:24');
INSERT INTO `sys_log` VALUES ('628', '1', 'admin', '登录', '47', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 16:06:29');
INSERT INTO `sys_log` VALUES ('629', '1', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 16:06:30');
INSERT INTO `sys_log` VALUES ('630', '1', 'admin', '登录', '212', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 16:54:01');
INSERT INTO `sys_log` VALUES ('631', '1', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 16:54:01');
INSERT INTO `sys_log` VALUES ('632', '1', 'admin', '更新菜单', '89', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 16:54:32');
INSERT INTO `sys_log` VALUES ('633', null, null, '登录', '3', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 16:55:16');
INSERT INTO `sys_log` VALUES ('634', '1', 'admin', '登录', '44', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 16:55:19');
INSERT INTO `sys_log` VALUES ('635', '1', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 16:55:19');
INSERT INTO `sys_log` VALUES ('636', '1', 'admin', '更新菜单', '88', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 16:55:43');
INSERT INTO `sys_log` VALUES ('637', '1', 'admin', '添加菜单', '131', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 16:56:24');
INSERT INTO `sys_log` VALUES ('638', '1', 'admin', '添加菜单', '134', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 16:56:41');
INSERT INTO `sys_log` VALUES ('639', '1', 'admin', '添加菜单', '132', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 16:57:00');
INSERT INTO `sys_log` VALUES ('640', '1', 'admin', '添加菜单', '130', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 16:57:20');
INSERT INTO `sys_log` VALUES ('641', '1', 'admin', '更新角色', '262', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 16:57:41');
INSERT INTO `sys_log` VALUES ('642', '1', 'admin', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 16:57:48');
INSERT INTO `sys_log` VALUES ('643', '1', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 16:57:48');
INSERT INTO `sys_log` VALUES ('644', '1', 'admin', 'error', null, 'http://localhost:8081/sys/dict/list', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', null, '2020-07-07 16:57:50');
INSERT INTO `sys_log` VALUES ('645', '1', 'admin', 'error', null, 'http://localhost:8081/sys/dict/list', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', null, '2020-07-07 16:57:59');
INSERT INTO `sys_log` VALUES ('646', '1', 'admin', 'error', null, 'http://localhost:8081/sys/dict/list', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', null, '2020-07-07 16:58:26');
INSERT INTO `sys_log` VALUES ('647', '1', 'admin', '登录', '51', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 16:59:27');
INSERT INTO `sys_log` VALUES ('648', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 16:59:27');
INSERT INTO `sys_log` VALUES ('649', '1', 'admin', '添加数据字典', '125', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:00:11');
INSERT INTO `sys_log` VALUES ('650', '1', 'admin', '添加数据字典', '123', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:00:30');
INSERT INTO `sys_log` VALUES ('651', '1', 'admin', '批量删除数据字典', '88', 'com.hzy.toolman.system.controller.SysDictController.batchRemove()', null, '127.0.0.1', '2020-07-07 17:00:44');
INSERT INTO `sys_log` VALUES ('652', '1', 'admin', '删除数据字典', '85', 'com.hzy.toolman.system.controller.SysDictController.remove()', null, '127.0.0.1', '2020-07-07 17:00:49');
INSERT INTO `sys_log` VALUES ('653', '1', 'admin', '登录', '47', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 17:04:36');
INSERT INTO `sys_log` VALUES ('654', '1', 'admin', '请求访问主页', '76', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:04:37');
INSERT INTO `sys_log` VALUES ('655', '1', 'admin', '更新数据字典', '71', 'com.hzy.toolman.system.controller.SysDictController.update()', null, '127.0.0.1', '2020-07-07 17:04:45');
INSERT INTO `sys_log` VALUES ('656', '1', 'admin', '请求访问主页', '74', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:05:03');
INSERT INTO `sys_log` VALUES ('657', '1', 'admin', '批量删除数据字典', '76', 'com.hzy.toolman.system.controller.SysDictController.batchRemove()', null, '127.0.0.1', '2020-07-07 17:05:16');
INSERT INTO `sys_log` VALUES ('658', null, null, '登录', '6', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 17:06:41');
INSERT INTO `sys_log` VALUES ('659', '1', 'admin', '登录', '35', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 17:06:44');
INSERT INTO `sys_log` VALUES ('660', '1', 'admin', '请求访问主页', '72', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:06:44');
INSERT INTO `sys_log` VALUES ('661', '1', 'admin', '添加数据字典', '105', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:07:39');
INSERT INTO `sys_log` VALUES ('662', '1', 'admin', '添加数据字典', '105', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:08:21');
INSERT INTO `sys_log` VALUES ('663', '1', 'admin', '添加数据字典', '106', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:08:36');
INSERT INTO `sys_log` VALUES ('664', '1', 'admin', '添加数据字典', '110', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:09:05');
INSERT INTO `sys_log` VALUES ('665', '1', 'admin', '更新数据字典', '73', 'com.hzy.toolman.system.controller.SysDictController.update()', null, '127.0.0.1', '2020-07-07 17:09:13');
INSERT INTO `sys_log` VALUES ('666', '1', 'admin', '更新数据字典', '74', 'com.hzy.toolman.system.controller.SysDictController.update()', null, '127.0.0.1', '2020-07-07 17:09:17');
INSERT INTO `sys_log` VALUES ('667', '1', 'admin', '更新数据字典', '70', 'com.hzy.toolman.system.controller.SysDictController.update()', null, '127.0.0.1', '2020-07-07 17:09:21');
INSERT INTO `sys_log` VALUES ('668', '1', 'admin', '添加数据字典', '108', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:09:43');
INSERT INTO `sys_log` VALUES ('669', '1', 'admin', '添加数据字典', '117', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:10:19');
INSERT INTO `sys_log` VALUES ('670', '1', 'admin', '更新数据字典', '78', 'com.hzy.toolman.system.controller.SysDictController.update()', null, '127.0.0.1', '2020-07-07 17:10:29');
INSERT INTO `sys_log` VALUES ('671', '1', 'admin', '添加数据字典', '103', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-07 17:10:46');
INSERT INTO `sys_log` VALUES ('672', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:11:27');
INSERT INTO `sys_log` VALUES ('673', '1', 'admin', '登录', '246', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 17:20:15');
INSERT INTO `sys_log` VALUES ('674', '1', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:20:15');
INSERT INTO `sys_log` VALUES ('675', '1', 'admin', '登录', '220', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 17:25:21');
INSERT INTO `sys_log` VALUES ('676', '1', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:25:22');
INSERT INTO `sys_log` VALUES ('677', '1', 'admin', '登录', '201', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 17:50:42');
INSERT INTO `sys_log` VALUES ('678', '1', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:50:42');
INSERT INTO `sys_log` VALUES ('679', '1', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:50:54');
INSERT INTO `sys_log` VALUES ('680', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 17:51:19');
INSERT INTO `sys_log` VALUES ('681', '1', 'admin', '登录', '255', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 18:03:09');
INSERT INTO `sys_log` VALUES ('682', '1', 'admin', '请求访问主页', '106', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 18:03:09');
INSERT INTO `sys_log` VALUES ('683', '1', 'admin', '添加菜单', '146', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 18:06:32');
INSERT INTO `sys_log` VALUES ('684', '1', 'admin', '更新菜单', '75', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 18:06:45');
INSERT INTO `sys_log` VALUES ('685', '1', 'admin', '添加菜单', '107', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 18:07:44');
INSERT INTO `sys_log` VALUES ('686', '1', 'admin', '添加菜单', '117', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 18:08:36');
INSERT INTO `sys_log` VALUES ('687', '1', 'admin', '登录', '74', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 18:09:39');
INSERT INTO `sys_log` VALUES ('688', '1', 'admin', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 18:09:39');
INSERT INTO `sys_log` VALUES ('689', '1', 'admin', '更新菜单', '86', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 18:10:12');
INSERT INTO `sys_log` VALUES ('690', '1', 'admin', '更新菜单', '126', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 18:11:24');
INSERT INTO `sys_log` VALUES ('691', '1', 'admin', '添加菜单', '125', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 18:12:19');
INSERT INTO `sys_log` VALUES ('692', '1', 'admin', '添加菜单', '127', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 18:13:53');
INSERT INTO `sys_log` VALUES ('693', '1', 'admin', '添加菜单', '125', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 18:14:10');
INSERT INTO `sys_log` VALUES ('694', '1', 'admin', '添加菜单', '125', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-07 18:14:48');
INSERT INTO `sys_log` VALUES ('695', '1', 'admin', '更新角色', '273', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-07 18:16:16');
INSERT INTO `sys_log` VALUES ('696', '1', 'admin', '登录', '44', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 18:16:33');
INSERT INTO `sys_log` VALUES ('697', '1', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 18:16:33');
INSERT INTO `sys_log` VALUES ('698', '1', 'admin', '登录', '219', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 18:38:42');
INSERT INTO `sys_log` VALUES ('699', '1', 'admin', '请求访问主页', '118', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 18:38:42');
INSERT INTO `sys_log` VALUES ('700', '1', 'admin', '更新菜单', '84', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-07 18:38:54');
INSERT INTO `sys_log` VALUES ('701', '1', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 18:38:57');
INSERT INTO `sys_log` VALUES ('702', '1', 'admin', 'error', null, 'http://localhost:8081/sys/notify/list', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'toolman.oa_notify\' doesn\'t exist\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\common\\TbNotifyMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select     `id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`     from oa_notify                      order by id desc                     limit ?, ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'toolman.oa_notify\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'toolman.oa_notify\' doesn\'t exist', null, '2020-07-07 18:39:01');
INSERT INTO `sys_log` VALUES ('703', '1', 'admin', '登录', '260', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-07 18:39:58');
INSERT INTO `sys_log` VALUES ('704', '1', 'admin', '请求访问主页', '122', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 18:39:58');
INSERT INTO `sys_log` VALUES ('705', '1', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-07 19:09:47');
INSERT INTO `sys_log` VALUES ('706', '1', 'admin', '登录', '333', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 00:41:08');
INSERT INTO `sys_log` VALUES ('707', '1', 'admin', '请求访问主页', '134', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 00:41:09');
INSERT INTO `sys_log` VALUES ('708', '1', 'admin', '请求访问主页', '140', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 00:41:48');
INSERT INTO `sys_log` VALUES ('709', '1', 'admin', '更新通知', '90', 'com.hzy.toolman.system.controller.SysNotifyController.update()', null, '127.0.0.1', '2020-07-08 00:42:10');
INSERT INTO `sys_log` VALUES ('710', '1', 'admin', '请求访问主页', '165', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 00:44:29');
INSERT INTO `sys_log` VALUES ('711', '1', 'admin', '请求访问主页', '125', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 00:46:33');
INSERT INTO `sys_log` VALUES ('712', '1', 'admin', '登录', '2044', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 00:56:31');
INSERT INTO `sys_log` VALUES ('713', '1', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 00:56:32');
INSERT INTO `sys_log` VALUES ('714', '1', 'admin', '删除通知', '167', 'com.hzy.toolman.system.controller.SysNotifyController.remove()', null, '127.0.0.1', '2020-07-08 00:56:42');
INSERT INTO `sys_log` VALUES ('715', '1', 'admin', 'error', null, 'http://localhost:8081/sys/notify/batchRemove', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long[] parameter \'ids\' is not present', null, '2020-07-08 00:56:45');
INSERT INTO `sys_log` VALUES ('716', '1', 'admin', 'error', null, 'http://localhost:8081/sys/notify/batchRemove', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long[] parameter \'ids\' is not present', null, '2020-07-08 00:57:05');
INSERT INTO `sys_log` VALUES ('717', '1', 'admin', '删除通知', '208', 'com.hzy.toolman.system.controller.SysNotifyController.remove()', null, '127.0.0.1', '2020-07-08 00:59:20');
INSERT INTO `sys_log` VALUES ('718', '1', 'admin', 'error', null, 'http://localhost:8081/sys/notify/batchRemove', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long[] parameter \'ids\' is not present', null, '2020-07-08 00:59:23');
INSERT INTO `sys_log` VALUES ('719', '1', 'admin', 'error', null, 'http://localhost:8081/sys/notify/batchRemove', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long[] parameter \'ids\' is not present', null, '2020-07-08 00:59:28');
INSERT INTO `sys_log` VALUES ('720', '1', 'admin', 'error', null, 'http://localhost:8081/sys/notify/batchRemove', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long[] parameter \'ids\' is not present', null, '2020-07-08 01:00:12');
INSERT INTO `sys_log` VALUES ('721', '1', 'admin', 'error', null, 'http://localhost:8081/sys/notify/batchRemove', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long[] parameter \'ids\' is not present', null, '2020-07-08 01:00:27');
INSERT INTO `sys_log` VALUES ('722', '1', 'admin', '登录', '167', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:01:25');
INSERT INTO `sys_log` VALUES ('723', '1', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:01:26');
INSERT INTO `sys_log` VALUES ('724', '1', 'admin', '更新菜单', '89', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-08 01:01:50');
INSERT INTO `sys_log` VALUES ('725', '1', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:01:51');
INSERT INTO `sys_log` VALUES ('726', '1', 'admin', '批量删除通知', '179', 'com.hzy.toolman.system.controller.SysNotifyController.batchRemove()', null, '127.0.0.1', '2020-07-08 01:01:59');
INSERT INTO `sys_log` VALUES ('727', '1', 'admin', '登录', '51', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:05:07');
INSERT INTO `sys_log` VALUES ('728', '1', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:05:08');
INSERT INTO `sys_log` VALUES ('729', '1', 'admin', '登录', '168', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:25:29');
INSERT INTO `sys_log` VALUES ('730', '1', 'admin', '请求访问主页', '124', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:25:29');
INSERT INTO `sys_log` VALUES ('731', '1', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:26:32');
INSERT INTO `sys_log` VALUES ('732', '1', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:26:32');
INSERT INTO `sys_log` VALUES ('733', '1', 'admin', '登录', '789', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:31:38');
INSERT INTO `sys_log` VALUES ('734', '1', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:31:38');
INSERT INTO `sys_log` VALUES ('735', '1', 'admin', '登录', '255', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:34:10');
INSERT INTO `sys_log` VALUES ('736', '1', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:34:10');
INSERT INTO `sys_log` VALUES ('737', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:34:19');
INSERT INTO `sys_log` VALUES ('738', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:35:27');
INSERT INTO `sys_log` VALUES ('739', '1', 'admin', '登录', '168', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:38:30');
INSERT INTO `sys_log` VALUES ('740', '1', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:38:30');
INSERT INTO `sys_log` VALUES ('741', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:38:37');
INSERT INTO `sys_log` VALUES ('742', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:39:03');
INSERT INTO `sys_log` VALUES ('743', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:39:17');
INSERT INTO `sys_log` VALUES ('744', '1', 'admin', '登录', '164', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 01:47:51');
INSERT INTO `sys_log` VALUES ('745', '1', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 01:47:52');
INSERT INTO `sys_log` VALUES ('746', '1', 'admin', '添加部门', '113', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 01:48:52');
INSERT INTO `sys_log` VALUES ('747', '1', 'admin', '添加部门', '128', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 01:49:03');
INSERT INTO `sys_log` VALUES ('748', '1', 'admin', '添加部门', '109', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 01:49:12');
INSERT INTO `sys_log` VALUES ('749', '1', 'admin', '添加部门', '120', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 01:49:20');
INSERT INTO `sys_log` VALUES ('750', '1', 'admin', '更新用户', '223', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 01:49:35');
INSERT INTO `sys_log` VALUES ('751', '1', 'admin', '更新用户', '150', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 01:49:41');
INSERT INTO `sys_log` VALUES ('752', '1', 'admin', '更新用户', '218', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 01:49:47');
INSERT INTO `sys_log` VALUES ('753', '1', 'admin', '更新用户', '242', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 01:50:01');
INSERT INTO `sys_log` VALUES ('754', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:50:09');
INSERT INTO `sys_log` VALUES ('755', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:51:45');
INSERT INTO `sys_log` VALUES ('756', '1', 'admin', 'error', null, 'http://localhost:8081/sys/user/tree', 'org.springframework.http.converter.HttpMessageNotWritableException: Could not write JSON: Infinite recursion (StackOverflowError); nested exception is com.fasterxml.jackson.databind.JsonMappingException: Infinite recursion (StackOverflowError) (through reference chain: java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[0]->com.hzy.toolman.core.domain.Tree[\"children\"]->java.util.ArrayList[', null, '2020-07-08 01:52:00');
INSERT INTO `sys_log` VALUES ('757', '1', 'admin', '更新角色', '266', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-08 01:57:49');
INSERT INTO `sys_log` VALUES ('758', '1', 'admin', '更新用户', '235', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 01:59:29');
INSERT INTO `sys_log` VALUES ('759', '1', 'admin', '更新角色', '236', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-08 01:59:57');
INSERT INTO `sys_log` VALUES ('760', '1', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:03:52');
INSERT INTO `sys_log` VALUES ('761', '3', 'hzy', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:04:01');
INSERT INTO `sys_log` VALUES ('762', '3', 'hzy', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:04:02');
INSERT INTO `sys_log` VALUES ('763', '3', 'hzy', '添加用户', '274', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-08 02:04:45');
INSERT INTO `sys_log` VALUES ('764', '3', 'hzy', '添加角色', '288', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-08 02:05:02');
INSERT INTO `sys_log` VALUES ('765', '3', 'hzy', '添加部门', '120', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 02:05:25');
INSERT INTO `sys_log` VALUES ('766', '3', 'hzy', '添加部门', '116', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 02:05:40');
INSERT INTO `sys_log` VALUES ('767', '3', 'hzy', '添加部门', '122', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 02:05:48');
INSERT INTO `sys_log` VALUES ('768', '3', 'hzy', '更新用户', '241', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 02:06:00');
INSERT INTO `sys_log` VALUES ('769', '3', 'hzy', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:06:03');
INSERT INTO `sys_log` VALUES ('770', '8', 'admin', '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:06:43');
INSERT INTO `sys_log` VALUES ('771', '8', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:06:43');
INSERT INTO `sys_log` VALUES ('772', '8', 'admin', '请求访问主页', '83', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:07:07');
INSERT INTO `sys_log` VALUES ('773', '8', 'admin', '登录', '191', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:20:00');
INSERT INTO `sys_log` VALUES ('774', '8', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:20:01');
INSERT INTO `sys_log` VALUES ('775', '8', 'admin', '删除角色', '222', 'com.hzy.toolman.system.controller.SysRoleController.remove()', null, '127.0.0.1', '2020-07-08 02:20:47');
INSERT INTO `sys_log` VALUES ('776', '8', 'admin', '删除用户', '82', 'com.hzy.toolman.system.controller.SysUserController.remove()', null, '127.0.0.1', '2020-07-08 02:20:54');
INSERT INTO `sys_log` VALUES ('777', null, null, '登录', '181', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:21:28');
INSERT INTO `sys_log` VALUES ('778', '3', 'hzy', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:21:33');
INSERT INTO `sys_log` VALUES ('779', '3', 'hzy', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:21:33');
INSERT INTO `sys_log` VALUES ('780', '3', 'hzy', '添加通知', '326', 'com.hzy.toolman.system.controller.SysNotifyController.save()', null, '127.0.0.1', '2020-07-08 02:21:55');
INSERT INTO `sys_log` VALUES ('781', '2', 'test', '登录', '38', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:22:37');
INSERT INTO `sys_log` VALUES ('782', '2', 'test', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:22:38');
INSERT INTO `sys_log` VALUES ('783', '2', 'test', '添加角色', '0', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-08 02:23:06');
INSERT INTO `sys_log` VALUES ('784', '3', 'hzy', '登录', '39', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:23:23');
INSERT INTO `sys_log` VALUES ('785', '3', 'hzy', '请求访问主页', '73', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:23:23');
INSERT INTO `sys_log` VALUES ('786', '3', 'hzy', '添加角色', '264', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-08 02:23:51');
INSERT INTO `sys_log` VALUES ('787', '3', 'hzy', '更新用户', '222', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 02:24:03');
INSERT INTO `sys_log` VALUES ('788', '3', 'hzy', '用户自行更改信息', '76', 'com.hzy.toolman.system.controller.SysUserController.updatePersonal()', null, '127.0.0.1', '2020-07-08 02:24:54');
INSERT INTO `sys_log` VALUES ('789', '3', 'hzy', '用户上传头像', '293', 'com.hzy.toolman.system.controller.SysUserController.uploadImg()', null, '127.0.0.1', '2020-07-08 02:25:05');
INSERT INTO `sys_log` VALUES ('790', '3', 'hzy', '登录', '36', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 02:25:22');
INSERT INTO `sys_log` VALUES ('791', '3', 'hzy', '请求访问主页', '75', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 02:25:22');
INSERT INTO `sys_log` VALUES ('792', '3', 'hzy', '添加通知', '314', 'com.hzy.toolman.system.controller.SysNotifyController.save()', null, '127.0.0.1', '2020-07-08 02:25:59');
INSERT INTO `sys_log` VALUES ('793', '3', 'hzy', '更新通知', '75', 'com.hzy.toolman.system.controller.SysNotifyController.update()', null, '127.0.0.1', '2020-07-08 02:26:08');
INSERT INTO `sys_log` VALUES ('794', '3', 'hzy', '更新通知', '80', 'com.hzy.toolman.system.controller.SysNotifyController.update()', null, '127.0.0.1', '2020-07-08 02:26:20');
INSERT INTO `sys_log` VALUES ('795', '3', 'hzy', '更新通知', '89', 'com.hzy.toolman.system.controller.SysNotifyController.update()', null, '127.0.0.1', '2020-07-08 02:26:26');
INSERT INTO `sys_log` VALUES ('796', '3', 'hzy', '更新通知', '75', 'com.hzy.toolman.system.controller.SysNotifyController.update()', null, '127.0.0.1', '2020-07-08 02:26:29');
INSERT INTO `sys_log` VALUES ('797', null, null, '登录', '221', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:27:59');
INSERT INTO `sys_log` VALUES ('798', null, null, '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:28:02');
INSERT INTO `sys_log` VALUES ('799', '3', 'hzy', '登录', '41', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:28:09');
INSERT INTO `sys_log` VALUES ('800', '3', 'hzy', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:28:09');
INSERT INTO `sys_log` VALUES ('801', '3', 'hzy', '添加用户', '261', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-08 10:28:47');
INSERT INTO `sys_log` VALUES ('802', '3', 'hzy', '登录', '169', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:30:22');
INSERT INTO `sys_log` VALUES ('803', '3', 'hzy', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:30:23');
INSERT INTO `sys_log` VALUES ('804', '3', 'hzy', 'error', null, 'http://localhost:8081/sys/user/edit/9', 'java.lang.NullPointerException', null, '2020-07-08 10:30:29');
INSERT INTO `sys_log` VALUES ('805', '3', 'hzy', '登录', '164', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:32:16');
INSERT INTO `sys_log` VALUES ('806', '3', 'hzy', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:32:16');
INSERT INTO `sys_log` VALUES ('807', '3', 'hzy', '更新用户', '222', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 10:32:30');
INSERT INTO `sys_log` VALUES ('808', '3', 'hzy', '更新用户', '217', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 10:33:53');
INSERT INTO `sys_log` VALUES ('809', '3', 'hzy', '登录', '172', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:36:23');
INSERT INTO `sys_log` VALUES ('810', '3', 'hzy', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:36:23');
INSERT INTO `sys_log` VALUES ('811', '3', 'hzy', '删除用户', '77', 'com.hzy.toolman.system.controller.SysUserController.remove()', null, '127.0.0.1', '2020-07-08 10:36:34');
INSERT INTO `sys_log` VALUES ('812', '3', 'hzy', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:39:31');
INSERT INTO `sys_log` VALUES ('813', '3', 'admin', '登录', '39', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:39:38');
INSERT INTO `sys_log` VALUES ('814', '3', 'admin', '请求访问主页', '76', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:39:39');
INSERT INTO `sys_log` VALUES ('815', '3', 'admin', '请求访问主页', '146', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:41:59');
INSERT INTO `sys_log` VALUES ('816', '3', 'admin', '登录', '39', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:42:15');
INSERT INTO `sys_log` VALUES ('817', '3', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:42:15');
INSERT INTO `sys_log` VALUES ('818', '3', 'admin', '登录', '48', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:43:28');
INSERT INTO `sys_log` VALUES ('819', '3', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:43:28');
INSERT INTO `sys_log` VALUES ('820', '3', 'admin', '登录', '203', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 10:49:17');
INSERT INTO `sys_log` VALUES ('821', '3', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:49:18');
INSERT INTO `sys_log` VALUES ('822', '3', 'admin', '请求访问主页', '124', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 10:51:53');
INSERT INTO `sys_log` VALUES ('823', '3', 'admin', '登录', '194', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:04:36');
INSERT INTO `sys_log` VALUES ('824', '3', 'admin', '请求访问主页', '116', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:04:36');
INSERT INTO `sys_log` VALUES ('825', '3', 'admin', '登录', '202', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:07:25');
INSERT INTO `sys_log` VALUES ('826', '3', 'admin', '请求访问主页', '106', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:07:25');
INSERT INTO `sys_log` VALUES ('827', '3', 'admin', '登录', '51', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:16:37');
INSERT INTO `sys_log` VALUES ('828', '3', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:16:37');
INSERT INTO `sys_log` VALUES ('829', '3', 'admin', '添加通知', '352', 'com.hzy.toolman.system.controller.SysNotifyController.save()', null, '127.0.0.1', '2020-07-08 11:17:07');
INSERT INTO `sys_log` VALUES ('830', '3', 'admin', '登录', '197', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:20:16');
INSERT INTO `sys_log` VALUES ('831', '3', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:20:16');
INSERT INTO `sys_log` VALUES ('832', '3', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:22:24');
INSERT INTO `sys_log` VALUES ('833', '3', 'admin', '请求访问主页', '131', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:24:45');
INSERT INTO `sys_log` VALUES ('834', '3', 'admin', '请求访问主页', '66', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:25:47');
INSERT INTO `sys_log` VALUES ('835', '3', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:26:39');
INSERT INTO `sys_log` VALUES ('836', '3', 'admin', '请求访问主页', '133', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:32:33');
INSERT INTO `sys_log` VALUES ('837', '3', 'admin', '请求访问主页', '71', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:35:31');
INSERT INTO `sys_log` VALUES ('838', '3', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:35:41');
INSERT INTO `sys_log` VALUES ('839', '3', 'admin', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:36:10');
INSERT INTO `sys_log` VALUES ('840', '3', 'admin', '登录', '197', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:38:38');
INSERT INTO `sys_log` VALUES ('841', '3', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:38:38');
INSERT INTO `sys_log` VALUES ('842', '3', 'admin', 'error', null, 'http://localhost:8081/sys/notify/save', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is com.alibaba.druid.pool.DataSourceClosedException: dataSource already closed at Wed Jul 08 11:39:12 CST 2020\r\n### Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is com.alibaba.druid.pool.DataSourceClosedException: dataSource already closed at Wed Jul 08 11:39:12 CST 2020', null, '2020-07-08 11:39:13');
INSERT INTO `sys_log` VALUES ('843', '3', 'admin', '登录', '238', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:40:46');
INSERT INTO `sys_log` VALUES ('844', '3', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:40:47');
INSERT INTO `sys_log` VALUES ('845', null, null, '登录', '9', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:48:38');
INSERT INTO `sys_log` VALUES ('846', '3', 'admin', '登录', '37', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:48:43');
INSERT INTO `sys_log` VALUES ('847', '3', 'admin', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:48:43');
INSERT INTO `sys_log` VALUES ('848', '3', 'admin', '登录', '192', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:52:52');
INSERT INTO `sys_log` VALUES ('849', '3', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:52:53');
INSERT INTO `sys_log` VALUES ('850', '3', 'admin', '添加通知', '4169', 'com.hzy.toolman.system.controller.SysNotifyController.save()', null, '127.0.0.1', '2020-07-08 11:53:08');
INSERT INTO `sys_log` VALUES ('851', '3', 'admin', '批量删除通知', '165', 'com.hzy.toolman.system.controller.SysNotifyController.batchRemove()', null, '127.0.0.1', '2020-07-08 11:53:30');
INSERT INTO `sys_log` VALUES ('852', '3', 'admin', '添加通知', '356', 'com.hzy.toolman.system.controller.SysNotifyController.save()', null, '127.0.0.1', '2020-07-08 11:53:41');
INSERT INTO `sys_log` VALUES ('853', '3', 'admin', '添加部门', '131', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 11:56:45');
INSERT INTO `sys_log` VALUES ('854', '3', 'admin', '更新部门', '91', 'com.hzy.toolman.system.controller.SysDeptController.update()', null, '127.0.0.1', '2020-07-08 11:56:54');
INSERT INTO `sys_log` VALUES ('855', '3', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 11:59:32');
INSERT INTO `sys_log` VALUES ('856', '3', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 11:59:32');
INSERT INTO `sys_log` VALUES ('857', '3', 'admin', '添加部门', '115', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 11:59:44');
INSERT INTO `sys_log` VALUES ('858', '3', 'admin', '添加部门', '116', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 11:59:54');
INSERT INTO `sys_log` VALUES ('859', '3', 'admin', '添加部门', '117', 'com.hzy.toolman.system.controller.SysDeptController.save()', null, '127.0.0.1', '2020-07-08 12:00:15');
INSERT INTO `sys_log` VALUES ('860', '3', 'admin', '添加角色', '198', 'com.hzy.toolman.system.controller.SysRoleController.add()', null, '127.0.0.1', '2020-07-08 12:00:55');
INSERT INTO `sys_log` VALUES ('861', '3', 'admin', '添加用户', '287', 'com.hzy.toolman.system.controller.SysUserController.add()', null, '127.0.0.1', '2020-07-08 12:01:16');
INSERT INTO `sys_log` VALUES ('862', '3', 'admin', '添加菜单', '158', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:03:18');
INSERT INTO `sys_log` VALUES ('863', '3', 'admin', '更新菜单', '85', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-08 12:03:34');
INSERT INTO `sys_log` VALUES ('864', '3', 'admin', '添加菜单', '120', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:04:19');
INSERT INTO `sys_log` VALUES ('865', '3', 'admin', '更新菜单', '85', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-08 12:05:05');
INSERT INTO `sys_log` VALUES ('866', '3', 'admin', '添加菜单', '119', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:05:43');
INSERT INTO `sys_log` VALUES ('867', '3', 'admin', '添加菜单', '120', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:08:37');
INSERT INTO `sys_log` VALUES ('868', '3', 'admin', '添加菜单', '119', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:09:22');
INSERT INTO `sys_log` VALUES ('869', '3', 'admin', '添加菜单', '121', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:09:41');
INSERT INTO `sys_log` VALUES ('870', '3', 'admin', '添加菜单', '122', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:10:02');
INSERT INTO `sys_log` VALUES ('871', '3', 'admin', '添加菜单', '121', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:10:33');
INSERT INTO `sys_log` VALUES ('872', '3', 'admin', '添加菜单', '119', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:11:08');
INSERT INTO `sys_log` VALUES ('873', '3', 'admin', '添加菜单', '120', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:11:41');
INSERT INTO `sys_log` VALUES ('874', '3', 'admin', '添加菜单', '119', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:11:54');
INSERT INTO `sys_log` VALUES ('875', '3', 'admin', '添加菜单', '121', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:12:07');
INSERT INTO `sys_log` VALUES ('876', '3', 'admin', '添加菜单', '119', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:12:20');
INSERT INTO `sys_log` VALUES ('877', '3', 'admin', '更新角色', '247', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-08 12:12:49');
INSERT INTO `sys_log` VALUES ('878', '10', 'hzy', '登录', '40', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 12:13:13');
INSERT INTO `sys_log` VALUES ('879', '10', 'hzy', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 12:13:13');
INSERT INTO `sys_log` VALUES ('880', '10', 'hzy', '添加菜单', '163', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:24:14');
INSERT INTO `sys_log` VALUES ('881', '10', 'hzy', '添加菜单', '126', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:24:51');
INSERT INTO `sys_log` VALUES ('882', '10', 'hzy', '添加菜单', '123', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:25:12');
INSERT INTO `sys_log` VALUES ('883', '10', 'hzy', '更新菜单', '86', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-08 12:25:24');
INSERT INTO `sys_log` VALUES ('884', '10', 'hzy', '更新菜单', '83', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-08 12:25:29');
INSERT INTO `sys_log` VALUES ('885', '10', 'hzy', '更新菜单', '83', 'com.hzy.toolman.system.controller.SysMenuController.update()', null, '127.0.0.1', '2020-07-08 12:25:39');
INSERT INTO `sys_log` VALUES ('886', '10', 'hzy', '添加菜单', '128', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:25:58');
INSERT INTO `sys_log` VALUES ('887', '10', 'hzy', 'error', null, 'http://localhost:8081/sys/menu/add', 'org.springframework.dao.TransientDataAccessResourceException: \r\n### Error updating database.  Cause: java.sql.SQLException: Could not retrieve transaction read-only status from server\r\n### The error may involve com.hzy.toolman.db.dao.system.SysMenuMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu      ( parent_id,                       `name`,                       url,                       perms,                       `type`,                       icon,                       order_num,                       gmt_create,                       gmt_modified )       values ( ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ? )\r\n### Cause: java.sql.SQLException: Could not retrieve transaction read-only status from server\n; Could not retrieve transaction read-only status from server; nested exception is java.sql.SQLException: Could not retrieve transaction read-only status from server', null, '2020-07-08 12:27:55');
INSERT INTO `sys_log` VALUES ('888', '10', 'hzy', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 12:28:09');
INSERT INTO `sys_log` VALUES ('889', '3', 'admin', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 12:28:23');
INSERT INTO `sys_log` VALUES ('890', '3', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 12:28:24');
INSERT INTO `sys_log` VALUES ('891', '3', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 12:28:49');
INSERT INTO `sys_log` VALUES ('892', '3', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 12:28:59');
INSERT INTO `sys_log` VALUES ('893', '3', 'admin', '添加菜单', '131', 'com.hzy.toolman.system.controller.SysMenuController.add()', null, '127.0.0.1', '2020-07-08 12:29:25');
INSERT INTO `sys_log` VALUES ('894', null, null, '登录', '6', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 13:47:15');
INSERT INTO `sys_log` VALUES ('895', '3', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 13:47:19');
INSERT INTO `sys_log` VALUES ('896', '3', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 13:47:19');
INSERT INTO `sys_log` VALUES ('897', '3', 'admin', '登录', '92', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 14:00:39');
INSERT INTO `sys_log` VALUES ('898', '3', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:00:39');
INSERT INTO `sys_log` VALUES ('899', '3', 'admin', '登录', '215', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 14:10:55');
INSERT INTO `sys_log` VALUES ('900', '3', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:10:56');
INSERT INTO `sys_log` VALUES ('901', '3', 'admin', '更新角色', '284', 'com.hzy.toolman.system.controller.SysRoleController.update()', null, '127.0.0.1', '2020-07-08 14:11:12');
INSERT INTO `sys_log` VALUES ('902', '3', 'admin', '请求访问主页', '78', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:11:14');
INSERT INTO `sys_log` VALUES ('903', '3', 'admin', '更新用户', '244', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-08 14:11:35');
INSERT INTO `sys_log` VALUES ('904', '3', 'admin', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:11:37');
INSERT INTO `sys_log` VALUES ('905', '3', 'admin', '登录', '39', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 14:11:52');
INSERT INTO `sys_log` VALUES ('906', '3', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:11:53');
INSERT INTO `sys_log` VALUES ('907', '3', 'admin', '登录', '55', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 14:15:54');
INSERT INTO `sys_log` VALUES ('908', '3', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:15:54');
INSERT INTO `sys_log` VALUES ('909', '3', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 14:25:59');
INSERT INTO `sys_log` VALUES ('910', '3', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:26:00');
INSERT INTO `sys_log` VALUES ('911', '3', 'admin', '登录', '198', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 14:57:51');
INSERT INTO `sys_log` VALUES ('912', '3', 'admin', '请求访问主页', '106', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:57:52');
INSERT INTO `sys_log` VALUES ('913', '3', 'admin', '请求访问主页', '149', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 14:59:45');
INSERT INTO `sys_log` VALUES ('914', '3', 'admin', '登录', '255', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 15:05:45');
INSERT INTO `sys_log` VALUES ('915', '3', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:05:45');
INSERT INTO `sys_log` VALUES ('916', '3', 'admin', '请求访问主页', '137', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:08:11');
INSERT INTO `sys_log` VALUES ('917', '3', 'admin', '请求访问主页', '79', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:09:26');
INSERT INTO `sys_log` VALUES ('918', '3', 'admin', '登录', '48', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 15:21:34');
INSERT INTO `sys_log` VALUES ('919', '3', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:21:35');
INSERT INTO `sys_log` VALUES ('920', '3', 'admin', '登录', '228', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 15:46:35');
INSERT INTO `sys_log` VALUES ('921', '3', 'admin', '请求访问主页', '110', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:46:35');
INSERT INTO `sys_log` VALUES ('922', '3', 'admin', '请求访问主页', '195', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:47:40');
INSERT INTO `sys_log` VALUES ('923', '3', 'admin', '请求访问主页', '123', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:51:00');
INSERT INTO `sys_log` VALUES ('924', '3', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:51:41');
INSERT INTO `sys_log` VALUES ('925', '3', 'admin', '添加班级', '205', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-08 15:51:49');
INSERT INTO `sys_log` VALUES ('926', '3', 'admin', '请求访问主页', '122', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:52:53');
INSERT INTO `sys_log` VALUES ('927', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/save', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN\r\n### SQL: update tb_student     set classes_id = ?     where stu_id IN\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN; nested exception is java.sql.SQLException: sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN', null, '2020-07-08 15:52:56');
INSERT INTO `sys_log` VALUES ('928', '3', 'admin', '请求访问主页', '86', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:53:33');
INSERT INTO `sys_log` VALUES ('929', '3', 'admin', '添加班级', '202', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-08 15:53:46');
INSERT INTO `sys_log` VALUES ('930', '3', 'admin', '请求访问主页', '132', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:56:06');
INSERT INTO `sys_log` VALUES ('931', '3', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:56:25');
INSERT INTO `sys_log` VALUES ('932', '3', 'admin', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 15:57:24');
INSERT INTO `sys_log` VALUES ('933', '3', 'admin', '请求访问主页', '82', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:57:24');
INSERT INTO `sys_log` VALUES ('934', '3', 'admin', '登录', '224', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 15:58:42');
INSERT INTO `sys_log` VALUES ('935', '3', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 15:58:43');
INSERT INTO `sys_log` VALUES ('936', '3', 'admin', '登录', '55', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 16:00:02');
INSERT INTO `sys_log` VALUES ('937', '3', 'admin', '请求访问主页', '92', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 16:00:02');
INSERT INTO `sys_log` VALUES ('938', '3', 'admin', '登录', '207', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 16:03:04');
INSERT INTO `sys_log` VALUES ('939', '3', 'admin', '请求访问主页', '119', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 16:03:04');
INSERT INTO `sys_log` VALUES ('940', null, null, '登录', '10', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 16:08:09');
INSERT INTO `sys_log` VALUES ('941', '3', 'admin', '登录', '53', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 16:08:13');
INSERT INTO `sys_log` VALUES ('942', '3', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 16:08:14');
INSERT INTO `sys_log` VALUES ('943', '3', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 16:28:50');
INSERT INTO `sys_log` VALUES ('944', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 16:28:50');
INSERT INTO `sys_log` VALUES ('945', '3', 'admin', '登录', '242', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 16:36:24');
INSERT INTO `sys_log` VALUES ('946', '3', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 16:36:25');
INSERT INTO `sys_log` VALUES ('947', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/edit/undefined', 'org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Long\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"', null, '2020-07-08 16:36:36');
INSERT INTO `sys_log` VALUES ('948', '3', 'admin', '登录', '198', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 16:41:06');
INSERT INTO `sys_log` VALUES ('949', '3', 'admin', '请求访问主页', '110', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 16:41:06');
INSERT INTO `sys_log` VALUES ('950', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/edit/undefined', 'org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Long\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"', null, '2020-07-08 16:41:11');
INSERT INTO `sys_log` VALUES ('951', '3', 'admin', '请求访问主页', '128', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 16:44:24');
INSERT INTO `sys_log` VALUES ('952', '3', 'admin', 'error', null, 'http://localhost:8081/sys/menu/tree/undefined', 'org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Long\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"', null, '2020-07-08 16:44:35');
INSERT INTO `sys_log` VALUES ('953', '3', 'admin', 'error', null, 'http://localhost:8081/sys/menu/tree/undefined', 'org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Long\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"', null, '2020-07-08 16:48:54');
INSERT INTO `sys_log` VALUES ('954', '3', 'admin', 'error', null, 'http://localhost:8081/sys/menu/tree/undefined', 'org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Long\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"', null, '2020-07-08 16:49:01');
INSERT INTO `sys_log` VALUES ('955', '3', 'admin', '登录', '190', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 17:23:40');
INSERT INTO `sys_log` VALUES ('956', '3', 'admin', '请求访问主页', '110', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:23:40');
INSERT INTO `sys_log` VALUES ('957', '3', 'admin', '删除班级', '149', 'com.hzy.toolman.system.controller.SysClassesController.remove()', null, '127.0.0.1', '2020-07-08 17:23:46');
INSERT INTO `sys_log` VALUES ('958', '3', 'admin', '删除班级', '46', 'com.hzy.toolman.system.controller.SysClassesController.remove()', null, '127.0.0.1', '2020-07-08 17:23:48');
INSERT INTO `sys_log` VALUES ('959', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/batchRemove', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long[] parameter \'ids[]\' is not present', null, '2020-07-08 17:23:57');
INSERT INTO `sys_log` VALUES ('960', '3', 'admin', '批量删除班级', '47', 'com.hzy.toolman.system.controller.SysClassesController.batchRemove()', null, '127.0.0.1', '2020-07-08 17:24:55');
INSERT INTO `sys_log` VALUES ('961', '3', 'admin', '批量删除班级', '57', 'com.hzy.toolman.system.controller.SysClassesController.batchRemove()', null, '127.0.0.1', '2020-07-08 17:25:03');
INSERT INTO `sys_log` VALUES ('962', '3', 'admin', '批量删除班级', '145', 'com.hzy.toolman.system.controller.SysClassesController.batchRemove()', null, '127.0.0.1', '2020-07-08 17:25:07');
INSERT INTO `sys_log` VALUES ('963', '3', 'admin', '请求访问主页', '134', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:26:23');
INSERT INTO `sys_log` VALUES ('964', '3', 'admin', '登录', '204', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 17:31:55');
INSERT INTO `sys_log` VALUES ('965', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:31:55');
INSERT INTO `sys_log` VALUES ('966', '3', 'admin', '登录', '191', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 17:41:34');
INSERT INTO `sys_log` VALUES ('967', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:41:34');
INSERT INTO `sys_log` VALUES ('968', '3', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:47:39');
INSERT INTO `sys_log` VALUES ('969', '3', 'admin', '登录', '187', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 17:50:42');
INSERT INTO `sys_log` VALUES ('970', '3', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:50:42');
INSERT INTO `sys_log` VALUES ('971', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:52:57');
INSERT INTO `sys_log` VALUES ('972', '3', 'admin', '登录', '202', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 17:54:09');
INSERT INTO `sys_log` VALUES ('973', '3', 'admin', '请求访问主页', '141', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:54:10');
INSERT INTO `sys_log` VALUES ('974', '3', 'admin', '请求访问主页', '112', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 17:59:46');
INSERT INTO `sys_log` VALUES ('975', '3', 'admin', '登录', '188', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:08:56');
INSERT INTO `sys_log` VALUES ('976', '3', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:08:56');
INSERT INTO `sys_log` VALUES ('977', '3', 'admin', '登录', '51', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:12:02');
INSERT INTO `sys_log` VALUES ('978', '3', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:12:02');
INSERT INTO `sys_log` VALUES ('979', '3', 'admin', '更新班级', '155', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-08 18:12:16');
INSERT INTO `sys_log` VALUES ('980', '3', 'admin', '更新班级', '143', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-08 18:12:19');
INSERT INTO `sys_log` VALUES ('981', '3', 'admin', '更新班级', '146', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-08 18:12:32');
INSERT INTO `sys_log` VALUES ('982', '3', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:18:33');
INSERT INTO `sys_log` VALUES ('983', '3', 'admin', '请求访问主页', '102', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:18:33');
INSERT INTO `sys_log` VALUES ('984', '3', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:23:37');
INSERT INTO `sys_log` VALUES ('985', null, null, '登录', '11', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:40:20');
INSERT INTO `sys_log` VALUES ('986', '3', 'admin', '登录', '105', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:40:23');
INSERT INTO `sys_log` VALUES ('987', '3', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:40:23');
INSERT INTO `sys_log` VALUES ('988', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/list', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ncat(concat(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like concat(concat(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\common\\TbStudentMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.common.TbStudentMapper.list\r\n### The error occurred while executing a query\r\n### SQL: select           id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified         from tb_student      WHERE `name` like concat(concat(\'%\', ?), \'%\'),                              classes_id = ?,      order by stu_id asc             limit ?, ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ncat(concat(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like concat(concat(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'ncat(concat(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like concat(concat(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ncat(concat(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like concat(concat(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?', null, '2020-07-08 18:40:27');
INSERT INTO `sys_log` VALUES ('989', '3', 'admin', '登录', '190', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:41:48');
INSERT INTO `sys_log` VALUES ('990', '3', 'admin', '请求访问主页', '98', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:41:49');
INSERT INTO `sys_log` VALUES ('991', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/list', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'NCAT(CONCAT(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like CONCAT(CONCAT(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\common\\TbStudentMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.common.TbStudentMapper.list\r\n### The error occurred while executing a query\r\n### SQL: select           id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified         from tb_student      WHERE `name` like CONCAT(CONCAT(\'%\', ?), \'%\'),                              classes_id = ?,      order by stu_id asc             limit ?, ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'NCAT(CONCAT(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like CONCAT(CONCAT(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'NCAT(CONCAT(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like CONCAT(CONCAT(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'NCAT(CONCAT(\'%\', ?), \'%\'),\n      \n \', expect COMMA, actual COMMA pos 183, line 6, column 52, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` like CONCAT(CONCAT(\'%\', ?), \'%\'),\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?', null, '2020-07-08 18:41:51');
INSERT INTO `sys_log` VALUES ('992', '3', 'admin', '登录', '189', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:42:51');
INSERT INTO `sys_log` VALUES ('993', '3', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:42:52');
INSERT INTO `sys_log` VALUES ('994', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/list', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'HERE `name` = ?,\n      \n      \n    \', expect COMMA, actual COMMA pos 154, line 6, column 23, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\common\\TbStudentMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.common.TbStudentMapper.list\r\n### The error occurred while executing a query\r\n### SQL: select           id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified         from tb_student      WHERE `name` = ?,                              classes_id = ?,      order by stu_id asc             limit ?, ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'HERE `name` = ?,\n      \n      \n    \', expect COMMA, actual COMMA pos 154, line 6, column 23, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'HERE `name` = ?,\n      \n      \n    \', expect COMMA, actual COMMA pos 154, line 6, column 23, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'HERE `name` = ?,\n      \n      \n    \', expect COMMA, actual COMMA pos 154, line 6, column 23, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE `name` = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?', null, '2020-07-08 18:42:57');
INSERT INTO `sys_log` VALUES ('995', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/list', 'java.lang.NullPointerException', null, '2020-07-08 18:43:08');
INSERT INTO `sys_log` VALUES ('996', '3', 'admin', '登录', '193', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:46:40');
INSERT INTO `sys_log` VALUES ('997', '3', 'admin', '请求访问主页', '118', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:46:40');
INSERT INTO `sys_log` VALUES ('998', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/list', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'HERE name = ?,\n      \n      \n      \', expect COMMA, actual COMMA pos 152, line 6, column 21, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE name = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\common\\TbStudentMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.common.TbStudentMapper.list\r\n### The error occurred while executing a query\r\n### SQL: select           id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified         from tb_student      WHERE name = ?,                              classes_id = ?,      order by stu_id asc             limit ?, ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'HERE name = ?,\n      \n      \n      \', expect COMMA, actual COMMA pos 152, line 6, column 21, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE name = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'HERE name = ?,\n      \n      \n      \', expect COMMA, actual COMMA pos 152, line 6, column 21, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE name = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'HERE name = ?,\n      \n      \n      \', expect COMMA, actual COMMA pos 152, line 6, column 21, token COMMA : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE name = ?,\n      \n      \n      \n        classes_id = ?, \n    order by stu_id asc\n     \n      limit ?, ?', null, '2020-07-08 18:46:43');
INSERT INTO `sys_log` VALUES ('999', '3', 'admin', '登录', '208', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:50:36');
INSERT INTO `sys_log` VALUES ('1000', '3', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:50:36');
INSERT INTO `sys_log` VALUES ('1001', '3', 'admin', '请求访问主页', '126', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:53:04');
INSERT INTO `sys_log` VALUES ('1002', '3', 'admin', '登录', '196', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:56:36');
INSERT INTO `sys_log` VALUES ('1003', '3', 'admin', '请求访问主页', '101', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:56:36');
INSERT INTO `sys_log` VALUES ('1004', '3', 'admin', '登录', '58', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:59:03');
INSERT INTO `sys_log` VALUES ('1005', '3', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:59:04');
INSERT INTO `sys_log` VALUES ('1006', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/list', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\common\\TbStudentMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.common.TbStudentMapper.list\r\n### The error occurred while executing a query\r\n### SQL: select           id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified         from tb_student      WHERE  stu_id like concat(concat(\'%\', ?, \'%\')                              and `name` like concat(concat(\'%\', ?), \'%\')                              and classes_id like concat(concat(\'%\', ?), \'%\')      order by stu_id asc             limit ?, ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?', null, '2020-07-08 18:59:07');
INSERT INTO `sys_log` VALUES ('1007', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/list', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\common\\TbStudentMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.common.TbStudentMapper.list\r\n### The error occurred while executing a query\r\n### SQL: select           id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified         from tb_student      WHERE  stu_id like concat(concat(\'%\', ?, \'%\')                              and `name` like concat(concat(\'%\', ?), \'%\')                              and classes_id like concat(concat(\'%\', ?), \'%\')      order by stu_id asc             limit ?, ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual LIMIT pos 375, line 15, column 25, token LIMIT : select\n     \n    id, stu_id, `password`, `name`, email, classes_id, `status`, sex, gmt_create, gmt_modified\n   \n    from tb_student\n     WHERE  stu_id like concat(concat(\'%\', ?, \'%\')\n      \n      \n      \n        and `name` like concat(concat(\'%\', ?), \'%\')\n      \n      \n      \n        and classes_id like concat(concat(\'%\', ?), \'%\') \n    order by stu_id asc\n     \n      limit ?, ?', null, '2020-07-08 18:59:08');
INSERT INTO `sys_log` VALUES ('1008', '3', 'admin', '登录', '181', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 18:59:53');
INSERT INTO `sys_log` VALUES ('1009', '3', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 18:59:54');
INSERT INTO `sys_log` VALUES ('1010', '3', 'admin', '登录', '56', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 19:01:00');
INSERT INTO `sys_log` VALUES ('1011', '3', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 19:01:00');
INSERT INTO `sys_log` VALUES ('1012', '3', 'admin', '登录', '216', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 19:04:18');
INSERT INTO `sys_log` VALUES ('1013', '3', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 19:04:18');
INSERT INTO `sys_log` VALUES ('1014', '3', 'admin', '登录', '193', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 19:05:20');
INSERT INTO `sys_log` VALUES ('1015', '3', 'admin', '请求访问主页', '114', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 19:05:21');
INSERT INTO `sys_log` VALUES ('1016', '3', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 19:05:43');
INSERT INTO `sys_log` VALUES ('1017', '3', 'admin', '登录', '503', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 21:59:50');
INSERT INTO `sys_log` VALUES ('1018', '3', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 21:59:50');
INSERT INTO `sys_log` VALUES ('1019', '3', 'admin', '登录', '210', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 22:14:01');
INSERT INTO `sys_log` VALUES ('1020', '3', 'admin', '请求访问主页', '140', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:14:02');
INSERT INTO `sys_log` VALUES ('1021', '3', 'admin', '登录', '48', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 22:28:31');
INSERT INTO `sys_log` VALUES ('1022', '3', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:28:32');
INSERT INTO `sys_log` VALUES ('1023', '3', 'admin', '请求访问主页', '112', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:30:16');
INSERT INTO `sys_log` VALUES ('1024', '3', 'admin', '登录', '199', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 22:33:22');
INSERT INTO `sys_log` VALUES ('1025', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:33:22');
INSERT INTO `sys_log` VALUES ('1026', '3', 'admin', '请求访问主页', '87', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:35:49');
INSERT INTO `sys_log` VALUES ('1027', '3', 'admin', '请求访问主页', '77', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:36:45');
INSERT INTO `sys_log` VALUES ('1028', '3', 'admin', '登录', '200', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 22:37:59');
INSERT INTO `sys_log` VALUES ('1029', '3', 'admin', '请求访问主页', '123', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:37:59');
INSERT INTO `sys_log` VALUES ('1030', '3', 'admin', '登录', '49', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 22:41:59');
INSERT INTO `sys_log` VALUES ('1031', '3', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:42:00');
INSERT INTO `sys_log` VALUES ('1032', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/exist', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'username\' is not present', null, '2020-07-08 22:42:07');
INSERT INTO `sys_log` VALUES ('1033', '3', 'admin', '登录', '206', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 22:42:51');
INSERT INTO `sys_log` VALUES ('1034', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:42:52');
INSERT INTO `sys_log` VALUES ('1035', '3', 'admin', '登录', '189', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 22:46:57');
INSERT INTO `sys_log` VALUES ('1036', '3', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 22:46:57');
INSERT INTO `sys_log` VALUES ('1037', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/add', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2020-07-08 22:47:13');
INSERT INTO `sys_log` VALUES ('1038', '3', 'admin', '登录', '280', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 23:14:59');
INSERT INTO `sys_log` VALUES ('1039', '3', 'admin', '请求访问主页', '122', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:14:59');
INSERT INTO `sys_log` VALUES ('1040', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/add', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'tbStudent\' on field \'classesId\': rejected value [--选择班级--]; codes [typeMismatch.tbStudent.classesId,typeMismatch.classesId,typeMismatch.java.lang.Long,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [tbStudent.classesId,classesId]; arguments []; default message [classesId]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Long\' for property \'classesId\'; nested exception is java.lang.NumberFormatException: For input string: \"--选择班级--\"]', null, '2020-07-08 23:15:20');
INSERT INTO `sys_log` VALUES ('1041', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/student/add', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'tbStudent\' on field \'classesId\': rejected value [--选择班级--]; codes [typeMismatch.tbStudent.classesId,typeMismatch.classesId,typeMismatch.java.lang.Long,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [tbStudent.classesId,classesId]; arguments []; default message [classesId]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Long\' for property \'classesId\'; nested exception is java.lang.NumberFormatException: For input string: \"--选择班级--\"]', null, '2020-07-08 23:17:26');
INSERT INTO `sys_log` VALUES ('1042', '3', 'admin', '请求访问主页', '89', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:17:57');
INSERT INTO `sys_log` VALUES ('1043', '3', 'admin', '添加学生', '13978', 'com.hzy.toolman.system.controller.SysStudentController.save()', null, '127.0.0.1', '2020-07-08 23:18:29');
INSERT INTO `sys_log` VALUES ('1044', '3', 'admin', '登录', '200', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 23:19:32');
INSERT INTO `sys_log` VALUES ('1045', '3', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:19:33');
INSERT INTO `sys_log` VALUES ('1046', '3', 'admin', '添加学生', '0', 'com.hzy.toolman.system.controller.SysStudentController.save()', null, '127.0.0.1', '2020-07-08 23:19:48');
INSERT INTO `sys_log` VALUES ('1047', '3', 'admin', '添加学生', '137', 'com.hzy.toolman.system.controller.SysStudentController.save()', null, '127.0.0.1', '2020-07-08 23:20:03');
INSERT INTO `sys_log` VALUES ('1048', '3', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:21:00');
INSERT INTO `sys_log` VALUES ('1049', '3', 'admin', '请求访问主页', '128', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:25:42');
INSERT INTO `sys_log` VALUES ('1050', '3', 'admin', '请求访问主页', '131', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:27:00');
INSERT INTO `sys_log` VALUES ('1051', '3', 'admin', '删除学生', '83', 'com.hzy.toolman.system.controller.SysStudentController.remove()', null, '127.0.0.1', '2020-07-08 23:27:52');
INSERT INTO `sys_log` VALUES ('1052', '3', 'admin', '批量删除学生', '83', 'com.hzy.toolman.system.controller.SysStudentController.batchRemove()', null, '127.0.0.1', '2020-07-08 23:28:00');
INSERT INTO `sys_log` VALUES ('1053', '3', 'admin', '登录', '214', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 23:32:07');
INSERT INTO `sys_log` VALUES ('1054', '3', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:32:07');
INSERT INTO `sys_log` VALUES ('1055', '3', 'admin', '请求访问主页', '121', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:34:22');
INSERT INTO `sys_log` VALUES ('1056', '3', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:35:08');
INSERT INTO `sys_log` VALUES ('1057', '3', 'admin', '登录', '185', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-08 23:44:14');
INSERT INTO `sys_log` VALUES ('1058', '3', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:44:14');
INSERT INTO `sys_log` VALUES ('1059', '3', 'admin', '管理员更改密码', '82', 'com.hzy.toolman.system.controller.SysStudentController.adminResetPwd()', null, '127.0.0.1', '2020-07-08 23:44:27');
INSERT INTO `sys_log` VALUES ('1060', '3', 'admin', '管理员更改密码', '78', 'com.hzy.toolman.system.controller.SysStudentController.adminResetPwd()', null, '127.0.0.1', '2020-07-08 23:44:38');
INSERT INTO `sys_log` VALUES ('1061', '3', 'admin', '请求访问主页', '80', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-08 23:45:53');
INSERT INTO `sys_log` VALUES ('1062', '3', 'admin', '更新学生', '79', 'com.hzy.toolman.system.controller.SysStudentController.update()', null, '127.0.0.1', '2020-07-08 23:46:02');
INSERT INTO `sys_log` VALUES ('1063', '3', 'admin', '更新学生', '82', 'com.hzy.toolman.system.controller.SysStudentController.update()', null, '127.0.0.1', '2020-07-08 23:46:10');
INSERT INTO `sys_log` VALUES ('1064', '3', 'admin', '更新学生', '88', 'com.hzy.toolman.system.controller.SysStudentController.update()', null, '127.0.0.1', '2020-07-08 23:46:28');
INSERT INTO `sys_log` VALUES ('1065', '3', 'admin', '更新学生', '77', 'com.hzy.toolman.system.controller.SysStudentController.update()', null, '127.0.0.1', '2020-07-08 23:46:53');
INSERT INTO `sys_log` VALUES ('1066', '3', 'admin', '更新学生', '80', 'com.hzy.toolman.system.controller.SysStudentController.update()', null, '127.0.0.1', '2020-07-08 23:46:59');
INSERT INTO `sys_log` VALUES ('1067', '3', 'admin', '登录', '187', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 10:56:15');
INSERT INTO `sys_log` VALUES ('1068', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 10:56:15');
INSERT INTO `sys_log` VALUES ('1069', '3', 'admin', '登录', '182', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 11:06:28');
INSERT INTO `sys_log` VALUES ('1070', '3', 'admin', '请求访问主页', '185', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 11:06:29');
INSERT INTO `sys_log` VALUES ('1071', '3', 'admin', '添加数据字典', '130', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-09 11:06:57');
INSERT INTO `sys_log` VALUES ('1072', '3', 'admin', '添加数据字典', '152', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-09 11:07:45');
INSERT INTO `sys_log` VALUES ('1073', '3', 'admin', '添加数据字典', '127', 'com.hzy.toolman.system.controller.SysDictController.add()', null, '127.0.0.1', '2020-07-09 11:08:07');
INSERT INTO `sys_log` VALUES ('1074', '3', 'admin', '登录', '53', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 11:11:04');
INSERT INTO `sys_log` VALUES ('1075', '3', 'admin', '请求访问主页', '97', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 11:11:04');
INSERT INTO `sys_log` VALUES ('1076', '3', 'admin', '登录', '85', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 11:37:26');
INSERT INTO `sys_log` VALUES ('1077', '3', 'admin', '请求访问主页', '95', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 11:37:26');
INSERT INTO `sys_log` VALUES ('1078', '3', 'admin', '登录', '54', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 11:51:00');
INSERT INTO `sys_log` VALUES ('1079', '3', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 11:51:00');
INSERT INTO `sys_log` VALUES ('1080', '3', 'admin', '登录', '222', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 13:12:25');
INSERT INTO `sys_log` VALUES ('1081', '3', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 13:12:25');
INSERT INTO `sys_log` VALUES ('1082', '3', 'admin', '登录', '193', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 13:14:11');
INSERT INTO `sys_log` VALUES ('1083', '3', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 13:14:11');
INSERT INTO `sys_log` VALUES ('1084', null, null, '登录', '5', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 13:52:47');
INSERT INTO `sys_log` VALUES ('1085', '3', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 13:52:50');
INSERT INTO `sys_log` VALUES ('1086', '3', 'admin', '请求访问主页', '97', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 13:52:51');
INSERT INTO `sys_log` VALUES ('1087', '3', 'admin', '登录', '54', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:00:07');
INSERT INTO `sys_log` VALUES ('1088', '3', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:00:07');
INSERT INTO `sys_log` VALUES ('1089', '3', 'admin', '登录', '198', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:14:49');
INSERT INTO `sys_log` VALUES ('1090', '3', 'admin', '请求访问主页', '126', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:14:49');
INSERT INTO `sys_log` VALUES ('1091', '3', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:21:57');
INSERT INTO `sys_log` VALUES ('1092', '3', 'admin', '请求访问主页', '115', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:21:58');
INSERT INTO `sys_log` VALUES ('1093', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/edit/3', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\system\\SysUserMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.system.SysUserMapper.getTeachers\r\n### The error occurred while executing a query\r\n### SQL: select * from sys_user where user_id in\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: EOF : select * from sys_user where user_id in; nested exception is java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in', null, '2020-07-09 14:22:10');
INSERT INTO `sys_log` VALUES ('1094', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/edit/3', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\system\\SysUserMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.system.SysUserMapper.getTeachers\r\n### The error occurred while executing a query\r\n### SQL: select * from sys_user where user_id in\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: EOF : select * from sys_user where user_id in; nested exception is java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in', null, '2020-07-09 14:24:08');
INSERT INTO `sys_log` VALUES ('1095', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/edit/3', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\system\\SysUserMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.system.SysUserMapper.getTeachers\r\n### The error occurred while executing a query\r\n### SQL: select * from sys_user where user_id in\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: EOF : select * from sys_user where user_id in; nested exception is java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in', null, '2020-07-09 14:25:32');
INSERT INTO `sys_log` VALUES ('1096', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/edit/3', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\system\\SysUserMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.system.SysUserMapper.getTeachers\r\n### The error occurred while executing a query\r\n### SQL: select * from sys_user where user_id in\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: EOF : select * from sys_user where user_id in; nested exception is java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in', null, '2020-07-09 14:25:55');
INSERT INTO `sys_log` VALUES ('1097', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/edit/3', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\r\n### The error may exist in file [D:\\Project\\Back-End\\toolman\\toolman-db\\target\\classes\\mybatis\\system\\SysUserMapper.xml]\r\n### The error may involve com.hzy.toolman.db.dao.system.SysUserMapper.getTeachers\r\n### The error occurred while executing a query\r\n### SQL: select * from sys_user where user_id in\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: EOF : select * from sys_user where user_id in; nested exception is java.sql.SQLException: sql injection violation, syntax error: EOF : select * from sys_user where user_id in', null, '2020-07-09 14:26:38');
INSERT INTO `sys_log` VALUES ('1098', '3', 'admin', '登录', '208', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:37:40');
INSERT INTO `sys_log` VALUES ('1099', '3', 'admin', '请求访问主页', '121', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:37:41');
INSERT INTO `sys_log` VALUES ('1100', '3', 'admin', '登录', '196', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:41:01');
INSERT INTO `sys_log` VALUES ('1101', '3', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:41:01');
INSERT INTO `sys_log` VALUES ('1102', '3', 'admin', '登录', '202', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:43:49');
INSERT INTO `sys_log` VALUES ('1103', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:43:49');
INSERT INTO `sys_log` VALUES ('1104', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/save', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN\r\n### SQL: update tb_student     set classes_id = ?     where stu_id IN\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN; nested exception is java.sql.SQLException: sql injection violation, syntax error: EOF : update tb_student\n    set classes_id = ?\n    where stu_id IN', null, '2020-07-09 14:46:03');
INSERT INTO `sys_log` VALUES ('1105', '3', 'admin', '登录', '241', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:51:31');
INSERT INTO `sys_log` VALUES ('1106', '3', 'admin', '请求访问主页', '116', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:51:32');
INSERT INTO `sys_log` VALUES ('1107', '3', 'admin', '添加班级', '0', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-09 14:51:44');
INSERT INTO `sys_log` VALUES ('1108', '3', 'admin', '添加班级', '0', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-09 14:51:55');
INSERT INTO `sys_log` VALUES ('1109', '3', 'admin', '登录', '187', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:52:52');
INSERT INTO `sys_log` VALUES ('1110', '3', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:52:52');
INSERT INTO `sys_log` VALUES ('1111', '3', 'admin', '添加班级', '0', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-09 14:53:04');
INSERT INTO `sys_log` VALUES ('1112', '3', 'admin', '添加班级', '171', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-09 14:53:16');
INSERT INTO `sys_log` VALUES ('1113', '3', 'admin', '登录', '200', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 14:56:04');
INSERT INTO `sys_log` VALUES ('1114', '3', 'admin', '请求访问主页', '126', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 14:56:04');
INSERT INTO `sys_log` VALUES ('1115', '3', 'admin', '添加班级', '0', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-09 14:56:13');
INSERT INTO `sys_log` VALUES ('1116', '3', 'admin', '添加班级', '229', 'com.hzy.toolman.system.controller.SysClassesController.save()', null, '127.0.0.1', '2020-07-09 14:56:19');
INSERT INTO `sys_log` VALUES ('1117', '3', 'admin', '登录', '101', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:00:20');
INSERT INTO `sys_log` VALUES ('1118', '3', 'admin', '请求访问主页', '97', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:00:20');
INSERT INTO `sys_log` VALUES ('1119', '3', 'admin', '更新班级', '187', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:00:47');
INSERT INTO `sys_log` VALUES ('1120', '3', 'admin', '更新班级', '0', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:01:10');
INSERT INTO `sys_log` VALUES ('1121', '3', 'admin', '更新班级', '181', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:01:16');
INSERT INTO `sys_log` VALUES ('1122', '3', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:02:57');
INSERT INTO `sys_log` VALUES ('1123', '3', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:02:57');
INSERT INTO `sys_log` VALUES ('1124', '3', 'admin', '更新班级', '214', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:03:07');
INSERT INTO `sys_log` VALUES ('1125', '3', 'admin', '更新班级', '224', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:03:14');
INSERT INTO `sys_log` VALUES ('1126', '3', 'admin', '更新班级', '142', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:03:26');
INSERT INTO `sys_log` VALUES ('1127', '3', 'admin', '更新班级', '142', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:03:33');
INSERT INTO `sys_log` VALUES ('1128', null, null, '登录', '8', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:11:58');
INSERT INTO `sys_log` VALUES ('1129', '3', 'admin', '登录', '49', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:12:00');
INSERT INTO `sys_log` VALUES ('1130', '3', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:12:00');
INSERT INTO `sys_log` VALUES ('1131', '3', 'admin', '登录', '194', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:13:25');
INSERT INTO `sys_log` VALUES ('1132', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:13:25');
INSERT INTO `sys_log` VALUES ('1133', '3', 'admin', '更新班级', '276', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:13:37');
INSERT INTO `sys_log` VALUES ('1134', '3', 'admin', '更新班级', '176', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:13:42');
INSERT INTO `sys_log` VALUES ('1135', '3', 'admin', '更新班级', '260', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:13:47');
INSERT INTO `sys_log` VALUES ('1136', '3', 'admin', '更新班级', '174', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:13:52');
INSERT INTO `sys_log` VALUES ('1137', '3', 'admin', '更新班级', '173', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:13:57');
INSERT INTO `sys_log` VALUES ('1138', '3', 'admin', '登录', '209', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:18:12');
INSERT INTO `sys_log` VALUES ('1139', '3', 'admin', '请求访问主页', '114', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:18:12');
INSERT INTO `sys_log` VALUES ('1140', '3', 'admin', '更新班级', '87', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:18:24');
INSERT INTO `sys_log` VALUES ('1141', '3', 'admin', '更新班级', '79', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:18:37');
INSERT INTO `sys_log` VALUES ('1142', '3', 'admin', '登录', '223', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:19:28');
INSERT INTO `sys_log` VALUES ('1143', '3', 'admin', '请求访问主页', '151', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:19:28');
INSERT INTO `sys_log` VALUES ('1144', '3', 'admin', '更新班级', '205', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:19:36');
INSERT INTO `sys_log` VALUES ('1145', '3', 'admin', '登录', '192', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:21:12');
INSERT INTO `sys_log` VALUES ('1146', '3', 'admin', '请求访问主页', '109', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:21:12');
INSERT INTO `sys_log` VALUES ('1147', '3', 'admin', '更新班级', '379', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:21:20');
INSERT INTO `sys_log` VALUES ('1148', '3', 'admin', '更新班级', '367', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:21:57');
INSERT INTO `sys_log` VALUES ('1149', '3', 'admin', '更新班级', '272', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:24:54');
INSERT INTO `sys_log` VALUES ('1150', '3', 'admin', '更新班级', '280', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:25:02');
INSERT INTO `sys_log` VALUES ('1151', '3', 'admin', '更新班级', '291', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:25:07');
INSERT INTO `sys_log` VALUES ('1152', '3', 'admin', '更新班级', '280', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:25:15');
INSERT INTO `sys_log` VALUES ('1153', '3', 'admin', '登录', '228', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:25:45');
INSERT INTO `sys_log` VALUES ('1154', '3', 'admin', '请求访问主页', '102', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:25:46');
INSERT INTO `sys_log` VALUES ('1155', '3', 'admin', '更新班级', '296', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:26:10');
INSERT INTO `sys_log` VALUES ('1156', '3', 'admin', '更新班级', '352', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:26:24');
INSERT INTO `sys_log` VALUES ('1157', '3', 'admin', '更新班级', '260', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:26:33');
INSERT INTO `sys_log` VALUES ('1158', '3', 'admin', '更新班级', '322', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:26:55');
INSERT INTO `sys_log` VALUES ('1159', '3', 'admin', '更新班级', '251', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:27:07');
INSERT INTO `sys_log` VALUES ('1160', '3', 'admin', '更新班级', '243', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:27:28');
INSERT INTO `sys_log` VALUES ('1161', '3', 'admin', '更新班级', '253', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:27:49');
INSERT INTO `sys_log` VALUES ('1162', '3', 'admin', '更新班级', '254', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:28:13');
INSERT INTO `sys_log` VALUES ('1163', '3', 'admin', '更新用户', '245', 'com.hzy.toolman.system.controller.SysUserController.update()', null, '127.0.0.1', '2020-07-09 15:30:08');
INSERT INTO `sys_log` VALUES ('1164', '3', 'admin', '更新班级', '322', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:30:49');
INSERT INTO `sys_log` VALUES ('1165', '3', 'admin', '更新班级', '321', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:31:00');
INSERT INTO `sys_log` VALUES ('1166', '3', 'admin', '更新班级', '315', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:31:25');
INSERT INTO `sys_log` VALUES ('1167', '3', 'admin', '登录', '193', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:32:45');
INSERT INTO `sys_log` VALUES ('1168', '3', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:32:46');
INSERT INTO `sys_log` VALUES ('1169', '3', 'admin', '更新班级', '301', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:32:55');
INSERT INTO `sys_log` VALUES ('1170', '3', 'admin', '更新班级', '296', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:33:02');
INSERT INTO `sys_log` VALUES ('1171', '3', 'admin', '更新班级', '394', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:33:22');
INSERT INTO `sys_log` VALUES ('1172', '3', 'admin', '更新班级', '221', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:33:42');
INSERT INTO `sys_log` VALUES ('1173', '3', 'admin', '更新班级', '349', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:34:27');
INSERT INTO `sys_log` VALUES ('1174', '3', 'admin', '登录', '80', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:38:15');
INSERT INTO `sys_log` VALUES ('1175', '3', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:38:15');
INSERT INTO `sys_log` VALUES ('1176', '3', 'admin', '登录', '188', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:47:14');
INSERT INTO `sys_log` VALUES ('1177', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:47:14');
INSERT INTO `sys_log` VALUES ('1178', '3', 'admin', '登录', '93', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:53:18');
INSERT INTO `sys_log` VALUES ('1179', '3', 'admin', '请求访问主页', '94', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:53:18');
INSERT INTO `sys_log` VALUES ('1180', '3', 'admin', '登录', '45', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:56:06');
INSERT INTO `sys_log` VALUES ('1181', '3', 'admin', '请求访问主页', '81', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:56:06');
INSERT INTO `sys_log` VALUES ('1182', '3', 'admin', '更新班级', '332', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 15:56:11');
INSERT INTO `sys_log` VALUES ('1183', '3', 'admin', '登录', '188', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:58:15');
INSERT INTO `sys_log` VALUES ('1184', '3', 'admin', '请求访问主页', '122', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:58:15');
INSERT INTO `sys_log` VALUES ('1185', null, null, '登录', '0', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:58:51');
INSERT INTO `sys_log` VALUES ('1186', '3', 'admin', '登录', '50', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 15:58:55');
INSERT INTO `sys_log` VALUES ('1187', '3', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 15:58:56');
INSERT INTO `sys_log` VALUES ('1188', '3', 'admin', '登录', '189', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 16:03:06');
INSERT INTO `sys_log` VALUES ('1189', '3', 'admin', '请求访问主页', '102', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 16:03:07');
INSERT INTO `sys_log` VALUES ('1190', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/classes/classesTree', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'id\' in \'class java.lang.Long\'', null, '2020-07-09 16:03:08');
INSERT INTO `sys_log` VALUES ('1191', '3', 'admin', '登录', '201', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 16:08:05');
INSERT INTO `sys_log` VALUES ('1192', '3', 'admin', '请求访问主页', '117', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 16:08:05');
INSERT INTO `sys_log` VALUES ('1193', '3', 'admin', '更新班级', '366', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 16:08:22');
INSERT INTO `sys_log` VALUES ('1194', '3', 'admin', '更新班级', '378', 'com.hzy.toolman.system.controller.SysClassesController.update()', null, '127.0.0.1', '2020-07-09 16:09:12');
INSERT INTO `sys_log` VALUES ('1195', '3', 'admin', '更新学生', '90', 'com.hzy.toolman.system.controller.SysStudentController.update()', null, '127.0.0.1', '2020-07-09 16:09:31');
INSERT INTO `sys_log` VALUES ('1196', '3', 'admin', '登录', '48', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 16:11:31');
INSERT INTO `sys_log` VALUES ('1197', '3', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 16:11:31');
INSERT INTO `sys_log` VALUES ('1198', '3', 'admin', '登录', '53', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 16:20:21');
INSERT INTO `sys_log` VALUES ('1199', '3', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 16:20:22');
INSERT INTO `sys_log` VALUES ('1200', '3', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 16:48:15');
INSERT INTO `sys_log` VALUES ('1201', '3', 'admin', '请求访问主页', '105', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 16:48:15');
INSERT INTO `sys_log` VALUES ('1202', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/list', 'java.lang.NullPointerException', null, '2020-07-09 16:48:56');
INSERT INTO `sys_log` VALUES ('1203', '3', 'admin', '登录', '202', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 16:55:17');
INSERT INTO `sys_log` VALUES ('1204', '3', 'admin', '请求访问主页', '127', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 16:55:18');
INSERT INTO `sys_log` VALUES ('1205', '3', 'admin', '登录', '195', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 17:16:18');
INSERT INTO `sys_log` VALUES ('1206', '3', 'admin', '请求访问主页', '136', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:16:18');
INSERT INTO `sys_log` VALUES ('1207', '3', 'admin', '登录', '221', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 17:18:56');
INSERT INTO `sys_log` VALUES ('1208', '3', 'admin', '请求访问主页', '96', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:18:56');
INSERT INTO `sys_log` VALUES ('1209', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/add', 'org.springframework.web.multipart.MultipartException: Current request is not a multipart request', null, '2020-07-09 17:19:06');
INSERT INTO `sys_log` VALUES ('1210', '3', 'admin', '登录', '192', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 17:23:26');
INSERT INTO `sys_log` VALUES ('1211', '3', 'admin', '请求访问主页', '131', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:23:26');
INSERT INTO `sys_log` VALUES ('1212', '3', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:25:02');
INSERT INTO `sys_log` VALUES ('1213', '3', 'admin', '登录', '193', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 17:26:24');
INSERT INTO `sys_log` VALUES ('1214', '3', 'admin', '请求访问主页', '143', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:26:24');
INSERT INTO `sys_log` VALUES ('1215', '3', 'admin', '请求访问主页', '84', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:27:43');
INSERT INTO `sys_log` VALUES ('1216', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/add', 'org.springframework.web.multipart.MultipartException: Current request is not a multipart request', null, '2020-07-09 17:27:56');
INSERT INTO `sys_log` VALUES ('1217', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/add', 'org.springframework.web.multipart.MultipartException: Current request is not a multipart request', null, '2020-07-09 17:28:03');
INSERT INTO `sys_log` VALUES ('1218', '3', 'admin', '请求访问主页', '125', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:30:04');
INSERT INTO `sys_log` VALUES ('1219', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/add', 'org.springframework.web.multipart.MultipartException: Current request is not a multipart request', null, '2020-07-09 17:30:20');
INSERT INTO `sys_log` VALUES ('1220', '3', 'admin', '请求访问主页', '117', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:32:05');
INSERT INTO `sys_log` VALUES ('1221', '3', 'admin', '登录', '212', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 17:47:26');
INSERT INTO `sys_log` VALUES ('1222', '3', 'admin', '请求访问主页', '112', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:47:27');
INSERT INTO `sys_log` VALUES ('1223', '3', 'admin', '登录', '244', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 17:49:56');
INSERT INTO `sys_log` VALUES ('1224', '3', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 17:49:56');
INSERT INTO `sys_log` VALUES ('1225', '3', 'admin', '登录', '222', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:02:13');
INSERT INTO `sys_log` VALUES ('1226', '3', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:02:13');
INSERT INTO `sys_log` VALUES ('1227', '3', 'admin', '上传作业', '271', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 18:02:33');
INSERT INTO `sys_log` VALUES ('1228', '3', 'admin', '登录', '201', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:12:21');
INSERT INTO `sys_log` VALUES ('1229', '3', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:12:21');
INSERT INTO `sys_log` VALUES ('1230', '3', 'admin', '上传作业', '275', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 18:12:37');
INSERT INTO `sys_log` VALUES ('1231', '3', 'admin', '请求访问主页', '133', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:16:44');
INSERT INTO `sys_log` VALUES ('1232', '3', 'admin', '上传作业', '308', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 18:18:45');
INSERT INTO `sys_log` VALUES ('1233', '3', 'admin', '登录', '205', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:19:25');
INSERT INTO `sys_log` VALUES ('1234', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:19:26');
INSERT INTO `sys_log` VALUES ('1235', null, null, '登录', '0', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:20:17');
INSERT INTO `sys_log` VALUES ('1236', '3', 'admin', '登录', '44', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:20:23');
INSERT INTO `sys_log` VALUES ('1237', '3', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:20:23');
INSERT INTO `sys_log` VALUES ('1238', '3', 'admin', '上传作业', '2442', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 18:20:38');
INSERT INTO `sys_log` VALUES ('1239', '3', 'admin', '上传作业', '214', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 18:20:55');
INSERT INTO `sys_log` VALUES ('1240', '3', 'admin', '上传作业', '245', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 18:21:48');
INSERT INTO `sys_log` VALUES ('1241', '3', 'admin', '登录', '216', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:54:31');
INSERT INTO `sys_log` VALUES ('1242', '3', 'admin', '请求访问主页', '103', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:54:31');
INSERT INTO `sys_log` VALUES ('1243', '3', 'admin', '登录', '55', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:57:04');
INSERT INTO `sys_log` VALUES ('1244', '3', 'admin', '请求访问主页', '99', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:57:04');
INSERT INTO `sys_log` VALUES ('1245', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/remove', 'org.springframework.web.bind.MissingPathVariableException: Missing URI template variable \'id\' for method parameter of type Long', null, '2020-07-09 18:57:10');
INSERT INTO `sys_log` VALUES ('1246', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/remove', 'org.springframework.web.bind.MissingPathVariableException: Missing URI template variable \'id\' for method parameter of type Long', null, '2020-07-09 18:57:39');
INSERT INTO `sys_log` VALUES ('1247', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/remove', 'org.springframework.web.bind.MissingPathVariableException: Missing URI template variable \'id\' for method parameter of type Long', null, '2020-07-09 18:57:51');
INSERT INTO `sys_log` VALUES ('1248', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/remove', 'org.springframework.web.bind.MissingPathVariableException: Missing URI template variable \'id\' for method parameter of type Long', null, '2020-07-09 18:58:00');
INSERT INTO `sys_log` VALUES ('1249', '3', 'admin', '登录', '226', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 18:59:02');
INSERT INTO `sys_log` VALUES ('1250', '3', 'admin', '请求访问主页', '122', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 18:59:02');
INSERT INTO `sys_log` VALUES ('1251', '3', 'admin', '删除作业', '163', 'com.hzy.toolman.system.controller.SysHomeWorkController.remove()', null, '127.0.0.1', '2020-07-09 18:59:09');
INSERT INTO `sys_log` VALUES ('1252', '3', 'admin', '批量删除作业', '158', 'com.hzy.toolman.system.controller.SysHomeWorkController.batchRemove()', null, '127.0.0.1', '2020-07-09 18:59:15');
INSERT INTO `sys_log` VALUES ('1253', '3', 'admin', '批量删除作业', '155', 'com.hzy.toolman.system.controller.SysHomeWorkController.batchRemove()', null, '127.0.0.1', '2020-07-09 18:59:20');
INSERT INTO `sys_log` VALUES ('1254', '3', 'admin', '更新作业', '290', 'com.hzy.toolman.system.controller.SysHomeWorkController.update()', null, '127.0.0.1', '2020-07-09 19:00:14');
INSERT INTO `sys_log` VALUES ('1255', '3', 'admin', '更新作业', '275', 'com.hzy.toolman.system.controller.SysHomeWorkController.update()', null, '127.0.0.1', '2020-07-09 19:00:56');
INSERT INTO `sys_log` VALUES ('1256', '3', 'admin', '登录', '211', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:04:07');
INSERT INTO `sys_log` VALUES ('1257', '3', 'admin', '请求访问主页', '107', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:04:08');
INSERT INTO `sys_log` VALUES ('1258', '3', 'admin', '用户上传头像', '330', 'com.hzy.toolman.system.controller.SysUserController.uploadImg()', null, '127.0.0.1', '2020-07-09 19:04:21');
INSERT INTO `sys_log` VALUES ('1259', '3', 'admin', '登录', '47', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:04:29');
INSERT INTO `sys_log` VALUES ('1260', '3', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:04:29');
INSERT INTO `sys_log` VALUES ('1261', null, null, '登录', '3', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:10:50');
INSERT INTO `sys_log` VALUES ('1262', '3', 'admin', '登录', '86', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:10:53');
INSERT INTO `sys_log` VALUES ('1263', '3', 'admin', '请求访问主页', '106', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:10:54');
INSERT INTO `sys_log` VALUES ('1264', '3', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:12:08');
INSERT INTO `sys_log` VALUES ('1265', '3', 'admin', '登录', '220', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:33:42');
INSERT INTO `sys_log` VALUES ('1266', '3', 'admin', '请求访问主页', '130', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:33:43');
INSERT INTO `sys_log` VALUES ('1267', '3', 'admin', '请求访问主页', '128', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:35:00');
INSERT INTO `sys_log` VALUES ('1268', '3', 'admin', '请求访问主页', '126', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:36:06');
INSERT INTO `sys_log` VALUES ('1269', '3', 'admin', '请求访问主页', '88', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:36:20');
INSERT INTO `sys_log` VALUES ('1270', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long parameter \'id\' is not present', null, '2020-07-09 19:36:28');
INSERT INTO `sys_log` VALUES ('1271', '3', 'admin', '请求访问主页', '114', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:37:06');
INSERT INTO `sys_log` VALUES ('1272', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download', 'org.springframework.web.HttpMediaTypeNotAcceptableException: Could not find acceptable representation', null, '2020-07-09 19:37:11');
INSERT INTO `sys_log` VALUES ('1273', '3', 'admin', '登录', '108', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:39:03');
INSERT INTO `sys_log` VALUES ('1274', '3', 'admin', '请求访问主页', '91', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:39:03');
INSERT INTO `sys_log` VALUES ('1275', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download', 'org.springframework.web.HttpMediaTypeNotAcceptableException: Could not find acceptable representation', null, '2020-07-09 19:39:09');
INSERT INTO `sys_log` VALUES ('1276', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download', 'org.springframework.web.HttpMediaTypeNotAcceptableException: Could not find acceptable representation', null, '2020-07-09 19:42:51');
INSERT INTO `sys_log` VALUES ('1277', null, null, '登录', '6', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:53:02');
INSERT INTO `sys_log` VALUES ('1278', '3', 'admin', '登录', '83', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 19:53:05');
INSERT INTO `sys_log` VALUES ('1279', '3', 'admin', '请求访问主页', '116', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 19:53:05');
INSERT INTO `sys_log` VALUES ('1280', null, null, '登录', '3', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 20:04:33');
INSERT INTO `sys_log` VALUES ('1281', '3', 'admin', '登录', '80', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 20:04:38');
INSERT INTO `sys_log` VALUES ('1282', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 20:04:38');
INSERT INTO `sys_log` VALUES ('1283', '3', 'admin', '请求访问主页', '121', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 20:06:40');
INSERT INTO `sys_log` VALUES ('1284', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long parameter \'id\' is not present', null, '2020-07-09 20:06:43');
INSERT INTO `sys_log` VALUES ('1285', '3', 'admin', '登录', '2062', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:01:36');
INSERT INTO `sys_log` VALUES ('1286', '3', 'admin', '请求访问主页', '90', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:01:36');
INSERT INTO `sys_log` VALUES ('1287', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download', 'org.springframework.web.bind.MissingServletRequestParameterException: Required Long parameter \'id\' is not present', null, '2020-07-09 21:01:47');
INSERT INTO `sys_log` VALUES ('1288', '3', 'admin', '登录', '229', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:06:43');
INSERT INTO `sys_log` VALUES ('1289', '3', 'admin', '请求访问主页', '128', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:06:43');
INSERT INTO `sys_log` VALUES ('1290', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download', 'org.springframework.web.HttpMediaTypeNotAcceptableException: Could not find acceptable representation', null, '2020-07-09 21:06:54');
INSERT INTO `sys_log` VALUES ('1291', '3', 'admin', '登录', '211', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:10:23');
INSERT INTO `sys_log` VALUES ('1292', '3', 'admin', '请求访问主页', '110', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:10:23');
INSERT INTO `sys_log` VALUES ('1293', '3', 'admin', '请求访问主页', '136', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:12:10');
INSERT INTO `sys_log` VALUES ('1294', '3', 'admin', '登录', '199', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:16:37');
INSERT INTO `sys_log` VALUES ('1295', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:16:38');
INSERT INTO `sys_log` VALUES ('1296', '3', 'admin', '登录', '43', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:17:12');
INSERT INTO `sys_log` VALUES ('1297', '3', 'admin', '请求访问主页', '85', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:17:12');
INSERT INTO `sys_log` VALUES ('1298', '3', 'admin', '上传作业', '273', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 21:17:56');
INSERT INTO `sys_log` VALUES ('1299', '3', 'admin', '删除作业', '176', 'com.hzy.toolman.system.controller.SysHomeWorkController.remove()', null, '127.0.0.1', '2020-07-09 21:18:19');
INSERT INTO `sys_log` VALUES ('1300', '3', 'admin', '上传作业', '264', 'com.hzy.toolman.system.controller.SysHomeWorkController.save()', null, '127.0.0.1', '2020-07-09 21:18:23');
INSERT INTO `sys_log` VALUES ('1301', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download/10', 'java.lang.NullPointerException', null, '2020-07-09 21:18:24');
INSERT INTO `sys_log` VALUES ('1302', '3', 'admin', 'error', null, 'http://localhost:8081/sys/teach/homework/download/10', 'java.lang.NullPointerException', null, '2020-07-09 21:18:46');
INSERT INTO `sys_log` VALUES ('1303', '3', 'admin', '登录', '200', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:22:19');
INSERT INTO `sys_log` VALUES ('1304', '3', 'admin', '请求访问主页', '147', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:22:19');
INSERT INTO `sys_log` VALUES ('1305', null, null, '登录', '10', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:25:50');
INSERT INTO `sys_log` VALUES ('1306', '3', 'admin', '登录', '87', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:25:55');
INSERT INTO `sys_log` VALUES ('1307', '3', 'admin', '请求访问主页', '104', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:25:55');
INSERT INTO `sys_log` VALUES ('1308', '3', 'admin', '请求访问主页', '117', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:27:40');
INSERT INTO `sys_log` VALUES ('1309', '3', 'admin', '请求访问主页', '113', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:30:14');
INSERT INTO `sys_log` VALUES ('1310', '3', 'admin', '登录', '231', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:36:28');
INSERT INTO `sys_log` VALUES ('1311', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:36:28');
INSERT INTO `sys_log` VALUES ('1312', '3', 'admin', '登录', '219', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:37:42');
INSERT INTO `sys_log` VALUES ('1313', '3', 'admin', '请求访问主页', '127', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:37:42');
INSERT INTO `sys_log` VALUES ('1314', '3', 'admin', '登录', '207', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:38:23');
INSERT INTO `sys_log` VALUES ('1315', '3', 'admin', '请求访问主页', '111', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:38:24');
INSERT INTO `sys_log` VALUES ('1316', '3', 'admin', '登录', '219', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:39:33');
INSERT INTO `sys_log` VALUES ('1317', '3', 'admin', '请求访问主页', '118', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:39:34');
INSERT INTO `sys_log` VALUES ('1318', '3', 'admin', '登录', '192', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:42:12');
INSERT INTO `sys_log` VALUES ('1319', '3', 'admin', '请求访问主页', '100', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:42:12');
INSERT INTO `sys_log` VALUES ('1320', '3', 'admin', '登录', '203', 'com.hzy.toolman.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2020-07-09 21:44:52');
INSERT INTO `sys_log` VALUES ('1321', '3', 'admin', '请求访问主页', '141', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:44:52');
INSERT INTO `sys_log` VALUES ('1322', '3', 'admin', '请求访问主页', '93', 'com.hzy.toolman.system.controller.LoginController.index()', null, '127.0.0.1', '2020-07-09 21:45:28');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '1', '2020-07-03 22:49:47', '2020-07-07 15:44:07');
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', '', '', '0', 'fa fa-desktop', '2', '2020-07-03 23:06:55', '2020-07-07 15:44:34');
INSERT INTO `sys_menu` VALUES ('3', '2', '系统菜单', '/sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', '2020-07-03 22:55:15', '2020-07-03 13:06:52');
INSERT INTO `sys_menu` VALUES ('4', '2', '用户管理', '/sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', '2020-07-03 14:12:11', '2020-07-03 13:07:14');
INSERT INTO `sys_menu` VALUES ('5', '2', '角色管理', '/sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', '2020-07-03 14:13:19', '2020-07-03 13:08:11');
INSERT INTO `sys_menu` VALUES ('6', '3', '新增', null, 'sys:menu:add', '2', null, '0', '2020-07-05 15:19:11', '2020-07-05 15:19:14');
INSERT INTO `sys_menu` VALUES ('7', '3', '编辑', null, 'sys:menu:edit', '2', null, '0', '2020-07-05 15:20:05', '2020-07-05 15:20:07');
INSERT INTO `sys_menu` VALUES ('8', '3', '删除', null, 'sys:menu:remove', '2', null, '0', '2020-07-05 15:20:25', '2020-07-05 15:20:28');
INSERT INTO `sys_menu` VALUES ('9', '2', '部门管理', '/sys/dept', 'sys:dept:dept', '1', 'fa fa-users', '3', null, null);
INSERT INTO `sys_menu` VALUES ('10', '4', '新增', '', 'sys:user:add', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('11', '4', '编辑', '', 'sys:user:edit', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('12', '4', '删除', '', 'sys:user:remove', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('13', '4', '停用', '', 'sys:user:disable', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('14', '4', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('15', '5', '新增', '', 'sys:role:add', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('16', '5', '编辑', '', 'sys:role:edit', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('17', '5', '删除', '', 'sys:role:remove', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('18', '9', '新增', '', 'sys:dept:add', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('19', '9', '编辑', '', 'sys:dept:edit', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('20', '9', '删除', '', 'sys:dept:remove', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('21', '4', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', null, null);
INSERT INTO `sys_menu` VALUES ('22', '5', '批量删除', '', 'sys:role:batchRemove', '2', '', '0', '2020-07-06 00:32:19', '2020-07-06 00:32:19');
INSERT INTO `sys_menu` VALUES ('23', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '3', '2020-07-06 23:09:26', '2020-07-07 15:44:37');
INSERT INTO `sys_menu` VALUES ('24', '23', '在线用户', '/sys/online', 'sys:online:online', '1', 'fa fa-user', null, '2020-07-06 23:11:40', '2020-07-07 00:26:03');
INSERT INTO `sys_menu` VALUES ('25', '23', '系统日志', '/sys/log', 'sys:log:log', '1', 'fa fa-leaf', '1', '2020-07-06 23:47:54', '2020-07-07 00:26:21');
INSERT INTO `sys_menu` VALUES ('26', '25', '刷新', '', 'sys:log:list', '2', '', '0', '2020-07-07 00:12:54', '2020-07-07 00:12:54');
INSERT INTO `sys_menu` VALUES ('27', '25', '删除', '', 'sys:log:remove', '2', '', '0', '2020-07-07 00:13:09', '2020-07-07 00:13:09');
INSERT INTO `sys_menu` VALUES ('28', '25', '清空', '', 'sys:log:batchRemove', '2', '', '0', '2020-07-07 00:13:26', '2020-07-07 00:22:49');
INSERT INTO `sys_menu` VALUES ('29', '24', '刷新', '', 'sys:online:list', '2', '', null, '2020-07-07 00:26:40', '2020-07-07 00:26:40');
INSERT INTO `sys_menu` VALUES ('30', '24', '强制下线', '', 'sys:online:forceLogout', '2', '', null, '2020-07-07 00:27:12', '2020-07-07 00:27:12');
INSERT INTO `sys_menu` VALUES ('31', '23', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', '2020-07-07 00:48:56', '2020-07-07 00:48:56');
INSERT INTO `sys_menu` VALUES ('32', '23', 'Swagger', '/swagger-ui.html', '', '1', '', '0', '2020-07-07 00:54:04', '2020-07-07 00:54:04');
INSERT INTO `sys_menu` VALUES ('33', '1', '数据字典', '/sys/dict', 'sys:dict:dict', '1', 'fa fa-book', '1', '2020-07-07 15:39:20', '2020-07-07 16:55:43');
INSERT INTO `sys_menu` VALUES ('34', '0', '首页', '/sys/main', '', '0', 'fa fa-home', '0', '2020-07-07 15:43:54', '2020-07-07 15:43:54');
INSERT INTO `sys_menu` VALUES ('35', '33', '增加', '', 'sys:dict:add', '2', '', '0', '2020-07-07 16:56:24', '2020-07-07 16:56:24');
INSERT INTO `sys_menu` VALUES ('36', '33', '编辑', '', 'sys:dict:edit', '2', '', '1', '2020-07-07 16:56:41', '2020-07-07 16:56:41');
INSERT INTO `sys_menu` VALUES ('37', '33', '删除', '', 'sys:dict:remove', '2', '', '2', '2020-07-07 16:57:00', '2020-07-07 16:57:00');
INSERT INTO `sys_menu` VALUES ('38', '33', '批量删除', '', 'sys:dict:batchRemove', '2', '', '3', '2020-07-07 16:57:20', '2020-07-07 16:57:20');
INSERT INTO `sys_menu` VALUES ('39', '0', '通知管理', '', '', '0', 'fa fa-envelope', '4', '2020-07-07 18:06:32', '2020-07-07 18:38:54');
INSERT INTO `sys_menu` VALUES ('40', '39', '通知通告', '/sys/notify', 'sys:notify:notify', '1', 'fa fa-pencil-square', '0', '2020-07-07 18:07:44', '2020-07-07 18:11:24');
INSERT INTO `sys_menu` VALUES ('41', '39', '我的通知', '/sys/notify/selfNotify', 'sys:notify:selfNotify', '1', 'fa fa-envelope-square', '1', '2020-07-07 18:08:36', '2020-07-08 01:01:50');
INSERT INTO `sys_menu` VALUES ('42', '40', '新增', '', 'sys:notify:add', '2', '', '0', '2020-07-07 18:12:19', '2020-07-07 18:12:19');
INSERT INTO `sys_menu` VALUES ('43', '40', '编辑', '', 'sys:notify:edit', '2', '', '0', '2020-07-07 18:13:53', '2020-07-07 18:13:53');
INSERT INTO `sys_menu` VALUES ('44', '40', '删除', '', 'sys:notify:remove', '2', '', '0', '2020-07-07 18:14:10', '2020-07-07 18:14:10');
INSERT INTO `sys_menu` VALUES ('45', '40', '批量删除', '', 'sys:notify:batchRemove', '2', '', '0', '2020-07-07 18:14:48', '2020-07-07 18:14:48');
INSERT INTO `sys_menu` VALUES ('46', '0', '教学管理', '', '', '0', 'fa fa-graduation-cap', '5', '2020-07-08 12:03:18', '2020-07-08 12:03:34');
INSERT INTO `sys_menu` VALUES ('47', '46', '学生管理', '/sys/teach/student', 'sys:teach:student', '1', 'fa fa-user', '1', '2020-07-08 12:04:19', '2020-07-08 12:25:29');
INSERT INTO `sys_menu` VALUES ('48', '46', '作业管理', '/sys/teach/homework', 'sys:teach:homework', '1', 'fa fa-book', '2', '2020-07-08 12:05:43', '2020-07-08 12:25:39');
INSERT INTO `sys_menu` VALUES ('49', '47', '新增', '', 'sys:teach:student:add', '2', '', '0', '2020-07-08 12:08:37', '2020-07-08 12:08:37');
INSERT INTO `sys_menu` VALUES ('50', '47', '编辑', '', 'sys:teach:student:edit', '2', '', '1', '2020-07-08 12:09:22', '2020-07-08 12:09:22');
INSERT INTO `sys_menu` VALUES ('51', '47', '删除', '', 'sys:teach:student:remove', '2', '', '2', '2020-07-08 12:09:41', '2020-07-08 12:09:41');
INSERT INTO `sys_menu` VALUES ('52', '47', '批量删除', '', 'sys:teach:student:batchRemove', '2', '', '4', '2020-07-08 12:10:02', '2020-07-08 12:10:02');
INSERT INTO `sys_menu` VALUES ('53', '47', '导入Excel文件', '', 'sys:teach:student:import', '2', '', '4', '2020-07-08 12:10:32', '2020-07-08 12:10:32');
INSERT INTO `sys_menu` VALUES ('54', '47', '导出Excel文件', '', 'sys:teach:student:export', '2', '', '5', '2020-07-08 12:11:07', '2020-07-08 12:11:07');
INSERT INTO `sys_menu` VALUES ('55', '48', '新增', '', 'sys:teach:homework:add', '2', '', '0', '2020-07-08 12:11:41', '2020-07-08 12:11:41');
INSERT INTO `sys_menu` VALUES ('56', '48', '编辑', '', 'sys:teach:homework:edit', '2', '', '1', '2020-07-08 12:11:53', '2020-07-08 12:11:53');
INSERT INTO `sys_menu` VALUES ('57', '48', '删除', '', 'sys:teach:homework:remove', '2', '', '2', '2020-07-08 12:12:07', '2020-07-08 12:12:07');
INSERT INTO `sys_menu` VALUES ('58', '48', '批量删除', '', 'sys:teach:homework:batchRemove', '2', '', '4', '2020-07-08 12:12:20', '2020-07-08 12:12:20');
INSERT INTO `sys_menu` VALUES ('59', '46', '班级管理', '/sys/teach/classes', 'sys:teach:classes', '1', 'fa fa-users', '0', '2020-07-08 12:24:14', '2020-07-08 12:25:24');
INSERT INTO `sys_menu` VALUES ('60', '59', '新增', '', 'sys:teach:classs:add', '2', '', '0', '2020-07-08 12:24:51', '2020-07-08 12:24:51');
INSERT INTO `sys_menu` VALUES ('61', '59', '编辑', '', 'sys:teach:classs:edit', '2', '', '1', '2020-07-08 12:25:12', '2020-07-08 12:25:12');
INSERT INTO `sys_menu` VALUES ('62', '59', '删除', '', 'sys:teach:classs:remove', '2', '', '3', '2020-07-08 12:25:57', '2020-07-08 12:25:57');
INSERT INTO `sys_menu` VALUES ('63', '59', '批量删除', '', 'sys:teach:classs:batchRemove', '2', '', '3', '2020-07-08 12:29:25', '2020-07-08 12:29:25');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('2', '普通用户', '', '基本用户权限', '1', '2020-07-03 12:28:42', '2020-07-08 01:59:57');
INSERT INTO `sys_role` VALUES ('8', '测试', null, 'test', '1', '2020-07-07 14:58:06', '2020-07-08 01:57:48');
INSERT INTO `sys_role` VALUES ('10', '超级管理员', null, '拥有最高权限', '3', '2020-07-08 02:23:51', '2020-07-08 14:11:12');
INSERT INTO `sys_role` VALUES ('11', '教师', null, '教学管理权限', '3', '2020-07-08 12:00:55', '2020-07-08 12:12:49');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=858 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('595', '8', '6');
INSERT INTO `sys_role_menu` VALUES ('596', '8', '7');
INSERT INTO `sys_role_menu` VALUES ('597', '8', '8');
INSERT INTO `sys_role_menu` VALUES ('598', '8', '10');
INSERT INTO `sys_role_menu` VALUES ('599', '8', '11');
INSERT INTO `sys_role_menu` VALUES ('600', '8', '12');
INSERT INTO `sys_role_menu` VALUES ('601', '8', '13');
INSERT INTO `sys_role_menu` VALUES ('602', '8', '14');
INSERT INTO `sys_role_menu` VALUES ('603', '8', '21');
INSERT INTO `sys_role_menu` VALUES ('604', '8', '15');
INSERT INTO `sys_role_menu` VALUES ('605', '8', '16');
INSERT INTO `sys_role_menu` VALUES ('606', '8', '17');
INSERT INTO `sys_role_menu` VALUES ('607', '8', '22');
INSERT INTO `sys_role_menu` VALUES ('608', '8', '18');
INSERT INTO `sys_role_menu` VALUES ('609', '8', '19');
INSERT INTO `sys_role_menu` VALUES ('610', '8', '20');
INSERT INTO `sys_role_menu` VALUES ('611', '8', '3');
INSERT INTO `sys_role_menu` VALUES ('612', '8', '4');
INSERT INTO `sys_role_menu` VALUES ('613', '8', '5');
INSERT INTO `sys_role_menu` VALUES ('614', '8', '9');
INSERT INTO `sys_role_menu` VALUES ('615', '8', '2');
INSERT INTO `sys_role_menu` VALUES ('616', '8', '-1');
INSERT INTO `sys_role_menu` VALUES ('617', '8', '35');
INSERT INTO `sys_role_menu` VALUES ('618', '8', '36');
INSERT INTO `sys_role_menu` VALUES ('619', '8', '37');
INSERT INTO `sys_role_menu` VALUES ('620', '8', '38');
INSERT INTO `sys_role_menu` VALUES ('621', '8', '33');
INSERT INTO `sys_role_menu` VALUES ('622', '8', '29');
INSERT INTO `sys_role_menu` VALUES ('623', '8', '30');
INSERT INTO `sys_role_menu` VALUES ('624', '8', '26');
INSERT INTO `sys_role_menu` VALUES ('625', '8', '27');
INSERT INTO `sys_role_menu` VALUES ('626', '8', '28');
INSERT INTO `sys_role_menu` VALUES ('627', '8', '24');
INSERT INTO `sys_role_menu` VALUES ('628', '8', '25');
INSERT INTO `sys_role_menu` VALUES ('629', '8', '31');
INSERT INTO `sys_role_menu` VALUES ('630', '8', '32');
INSERT INTO `sys_role_menu` VALUES ('631', '8', '42');
INSERT INTO `sys_role_menu` VALUES ('632', '8', '43');
INSERT INTO `sys_role_menu` VALUES ('633', '8', '44');
INSERT INTO `sys_role_menu` VALUES ('634', '8', '45');
INSERT INTO `sys_role_menu` VALUES ('635', '8', '40');
INSERT INTO `sys_role_menu` VALUES ('636', '8', '41');
INSERT INTO `sys_role_menu` VALUES ('637', '8', '1');
INSERT INTO `sys_role_menu` VALUES ('638', '8', '23');
INSERT INTO `sys_role_menu` VALUES ('639', '8', '34');
INSERT INTO `sys_role_menu` VALUES ('640', '8', '39');
INSERT INTO `sys_role_menu` VALUES ('641', '2', '6');
INSERT INTO `sys_role_menu` VALUES ('642', '2', '7');
INSERT INTO `sys_role_menu` VALUES ('643', '2', '8');
INSERT INTO `sys_role_menu` VALUES ('644', '2', '10');
INSERT INTO `sys_role_menu` VALUES ('645', '2', '11');
INSERT INTO `sys_role_menu` VALUES ('646', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('647', '2', '13');
INSERT INTO `sys_role_menu` VALUES ('648', '2', '14');
INSERT INTO `sys_role_menu` VALUES ('649', '2', '21');
INSERT INTO `sys_role_menu` VALUES ('650', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('651', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('652', '2', '17');
INSERT INTO `sys_role_menu` VALUES ('653', '2', '22');
INSERT INTO `sys_role_menu` VALUES ('654', '2', '18');
INSERT INTO `sys_role_menu` VALUES ('655', '2', '19');
INSERT INTO `sys_role_menu` VALUES ('656', '2', '20');
INSERT INTO `sys_role_menu` VALUES ('657', '2', '34');
INSERT INTO `sys_role_menu` VALUES ('658', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('659', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('660', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('661', '2', '9');
INSERT INTO `sys_role_menu` VALUES ('662', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('663', '2', '-1');
INSERT INTO `sys_role_menu` VALUES ('664', '2', '35');
INSERT INTO `sys_role_menu` VALUES ('665', '2', '36');
INSERT INTO `sys_role_menu` VALUES ('666', '2', '37');
INSERT INTO `sys_role_menu` VALUES ('667', '2', '38');
INSERT INTO `sys_role_menu` VALUES ('668', '2', '33');
INSERT INTO `sys_role_menu` VALUES ('669', '2', '29');
INSERT INTO `sys_role_menu` VALUES ('670', '2', '30');
INSERT INTO `sys_role_menu` VALUES ('671', '2', '26');
INSERT INTO `sys_role_menu` VALUES ('672', '2', '27');
INSERT INTO `sys_role_menu` VALUES ('673', '2', '28');
INSERT INTO `sys_role_menu` VALUES ('674', '2', '24');
INSERT INTO `sys_role_menu` VALUES ('675', '2', '25');
INSERT INTO `sys_role_menu` VALUES ('676', '2', '31');
INSERT INTO `sys_role_menu` VALUES ('677', '2', '32');
INSERT INTO `sys_role_menu` VALUES ('678', '2', '42');
INSERT INTO `sys_role_menu` VALUES ('679', '2', '43');
INSERT INTO `sys_role_menu` VALUES ('680', '2', '44');
INSERT INTO `sys_role_menu` VALUES ('681', '2', '45');
INSERT INTO `sys_role_menu` VALUES ('682', '2', '40');
INSERT INTO `sys_role_menu` VALUES ('683', '2', '41');
INSERT INTO `sys_role_menu` VALUES ('684', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('685', '2', '23');
INSERT INTO `sys_role_menu` VALUES ('686', '2', '39');
INSERT INTO `sys_role_menu` VALUES ('779', '11', '34');
INSERT INTO `sys_role_menu` VALUES ('780', '11', '46');
INSERT INTO `sys_role_menu` VALUES ('781', '11', '49');
INSERT INTO `sys_role_menu` VALUES ('782', '11', '50');
INSERT INTO `sys_role_menu` VALUES ('783', '11', '51');
INSERT INTO `sys_role_menu` VALUES ('784', '11', '52');
INSERT INTO `sys_role_menu` VALUES ('785', '11', '53');
INSERT INTO `sys_role_menu` VALUES ('786', '11', '54');
INSERT INTO `sys_role_menu` VALUES ('787', '11', '55');
INSERT INTO `sys_role_menu` VALUES ('788', '11', '56');
INSERT INTO `sys_role_menu` VALUES ('789', '11', '57');
INSERT INTO `sys_role_menu` VALUES ('790', '11', '58');
INSERT INTO `sys_role_menu` VALUES ('791', '11', '47');
INSERT INTO `sys_role_menu` VALUES ('792', '11', '48');
INSERT INTO `sys_role_menu` VALUES ('793', '11', '-1');
INSERT INTO `sys_role_menu` VALUES ('794', '10', '35');
INSERT INTO `sys_role_menu` VALUES ('795', '10', '36');
INSERT INTO `sys_role_menu` VALUES ('796', '10', '37');
INSERT INTO `sys_role_menu` VALUES ('797', '10', '38');
INSERT INTO `sys_role_menu` VALUES ('798', '10', '6');
INSERT INTO `sys_role_menu` VALUES ('799', '10', '7');
INSERT INTO `sys_role_menu` VALUES ('800', '10', '8');
INSERT INTO `sys_role_menu` VALUES ('801', '10', '10');
INSERT INTO `sys_role_menu` VALUES ('802', '10', '11');
INSERT INTO `sys_role_menu` VALUES ('803', '10', '12');
INSERT INTO `sys_role_menu` VALUES ('804', '10', '13');
INSERT INTO `sys_role_menu` VALUES ('805', '10', '14');
INSERT INTO `sys_role_menu` VALUES ('806', '10', '21');
INSERT INTO `sys_role_menu` VALUES ('807', '10', '15');
INSERT INTO `sys_role_menu` VALUES ('808', '10', '16');
INSERT INTO `sys_role_menu` VALUES ('809', '10', '17');
INSERT INTO `sys_role_menu` VALUES ('810', '10', '22');
INSERT INTO `sys_role_menu` VALUES ('811', '10', '18');
INSERT INTO `sys_role_menu` VALUES ('812', '10', '19');
INSERT INTO `sys_role_menu` VALUES ('813', '10', '20');
INSERT INTO `sys_role_menu` VALUES ('814', '10', '29');
INSERT INTO `sys_role_menu` VALUES ('815', '10', '30');
INSERT INTO `sys_role_menu` VALUES ('816', '10', '26');
INSERT INTO `sys_role_menu` VALUES ('817', '10', '27');
INSERT INTO `sys_role_menu` VALUES ('818', '10', '28');
INSERT INTO `sys_role_menu` VALUES ('819', '10', '31');
INSERT INTO `sys_role_menu` VALUES ('820', '10', '32');
INSERT INTO `sys_role_menu` VALUES ('821', '10', '34');
INSERT INTO `sys_role_menu` VALUES ('822', '10', '42');
INSERT INTO `sys_role_menu` VALUES ('823', '10', '43');
INSERT INTO `sys_role_menu` VALUES ('824', '10', '44');
INSERT INTO `sys_role_menu` VALUES ('825', '10', '45');
INSERT INTO `sys_role_menu` VALUES ('826', '10', '41');
INSERT INTO `sys_role_menu` VALUES ('827', '10', '33');
INSERT INTO `sys_role_menu` VALUES ('828', '10', '1');
INSERT INTO `sys_role_menu` VALUES ('829', '10', '3');
INSERT INTO `sys_role_menu` VALUES ('830', '10', '4');
INSERT INTO `sys_role_menu` VALUES ('831', '10', '5');
INSERT INTO `sys_role_menu` VALUES ('832', '10', '9');
INSERT INTO `sys_role_menu` VALUES ('833', '10', '2');
INSERT INTO `sys_role_menu` VALUES ('834', '10', '24');
INSERT INTO `sys_role_menu` VALUES ('835', '10', '25');
INSERT INTO `sys_role_menu` VALUES ('836', '10', '23');
INSERT INTO `sys_role_menu` VALUES ('837', '10', '40');
INSERT INTO `sys_role_menu` VALUES ('838', '10', '39');
INSERT INTO `sys_role_menu` VALUES ('839', '10', '46');
INSERT INTO `sys_role_menu` VALUES ('840', '10', '49');
INSERT INTO `sys_role_menu` VALUES ('841', '10', '50');
INSERT INTO `sys_role_menu` VALUES ('842', '10', '51');
INSERT INTO `sys_role_menu` VALUES ('843', '10', '52');
INSERT INTO `sys_role_menu` VALUES ('844', '10', '53');
INSERT INTO `sys_role_menu` VALUES ('845', '10', '54');
INSERT INTO `sys_role_menu` VALUES ('846', '10', '55');
INSERT INTO `sys_role_menu` VALUES ('847', '10', '56');
INSERT INTO `sys_role_menu` VALUES ('848', '10', '57');
INSERT INTO `sys_role_menu` VALUES ('849', '10', '58');
INSERT INTO `sys_role_menu` VALUES ('850', '10', '60');
INSERT INTO `sys_role_menu` VALUES ('851', '10', '61');
INSERT INTO `sys_role_menu` VALUES ('852', '10', '62');
INSERT INTO `sys_role_menu` VALUES ('853', '10', '63');
INSERT INTO `sys_role_menu` VALUES ('854', '10', '47');
INSERT INTO `sys_role_menu` VALUES ('855', '10', '48');
INSERT INTO `sys_role_menu` VALUES ('856', '10', '59');
INSERT INTO `sys_role_menu` VALUES ('857', '10', '-1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别 0：女 1：男',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', '9', 'test@bootdo.com', '', '1', '1', '2017-08-14 13:43:05', '2020-07-09 15:30:08', '1', '2020-07-03 12:23:59', null, '', '', '', '', '');
INSERT INTO `sys_user` VALUES ('3', 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', '12', 'admin@admin.com', '13715573978', '1', '0', '2020-07-08 10:40:28', '2020-07-09 19:04:21', '1', '1997-11-09 00:00:00', '6', '碣石镇东风门', null, '广东省', '汕尾市', '陆丰市');
INSERT INTO `sys_user` VALUES ('10', 'hzy', '黄子越', 'cbebe21ea63feabe504826329f0d3bb2', '17', '719491759@qq.com', null, '1', '3', '2020-07-08 12:01:16', '2020-07-08 12:01:16', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('11', '7', '1');
INSERT INTO `sys_user_role` VALUES ('12', '7', '2');
INSERT INTO `sys_user_role` VALUES ('22', '9', '2');
INSERT INTO `sys_user_role` VALUES ('23', '9', '8');
INSERT INTO `sys_user_role` VALUES ('24', '10', '11');
INSERT INTO `sys_user_role` VALUES ('25', '3', '10');
INSERT INTO `sys_user_role` VALUES ('26', '3', '11');
INSERT INTO `sys_user_role` VALUES ('28', '2', '11');

-- ----------------------------
-- Table structure for tb_classes
-- ----------------------------
DROP TABLE IF EXISTS `tb_classes`;
CREATE TABLE `tb_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `status` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_classes
-- ----------------------------
INSERT INTO `tb_classes` VALUES ('3', '17计科3班', '2020-07-08 14:10:39', '2020-07-09 16:09:11', '1');
INSERT INTO `tb_classes` VALUES ('6', '17计科5班', '2020-07-08 15:53:46', '2020-07-09 15:26:10', '1');
INSERT INTO `tb_classes` VALUES ('7', '17计科4班', '2020-07-09 14:46:03', '2020-07-09 15:33:42', '1');
INSERT INTO `tb_classes` VALUES ('8', '17计科1班', '2020-07-09 14:53:15', '2020-07-09 16:08:22', '1');
INSERT INTO `tb_classes` VALUES ('9', '17计科2班', '2020-07-09 14:56:19', '2020-07-09 15:28:13', '1');

-- ----------------------------
-- Table structure for tb_classes_homework
-- ----------------------------
DROP TABLE IF EXISTS `tb_classes_homework`;
CREATE TABLE `tb_classes_homework` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classes_id` bigint(20) DEFAULT NULL,
  `homework_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_classes_homework
-- ----------------------------
INSERT INTO `tb_classes_homework` VALUES ('10', '6', '8');
INSERT INTO `tb_classes_homework` VALUES ('12', '8', '10');

-- ----------------------------
-- Table structure for tb_homework
-- ----------------------------
DROP TABLE IF EXISTS `tb_homework`;
CREATE TABLE `tb_homework` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` tinyint(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_homework
-- ----------------------------
INSERT INTO `tb_homework` VALUES ('8', '实验1', '/files/7d216d95-1425-4632-ae59-02897efa767b.rar', '1', '2020-07-09 18:21:48', '2020-07-09 19:00:56', '3', '周一之前完成', '学号+姓名');
INSERT INTO `tb_homework` VALUES ('10', '123', null, '1', '2020-07-09 21:18:23', '2020-07-09 21:18:23', '3', '', '');

-- ----------------------------
-- Table structure for tb_notify
-- ----------------------------
DROP TABLE IF EXISTS `tb_notify`;
CREATE TABLE `tb_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';

-- ----------------------------
-- Records of tb_notify
-- ----------------------------
INSERT INTO `tb_notify` VALUES ('53', '3', '123123', '123213123', null, '1', '3', null, null, '2020-07-08 11:53:40', '', '0');

-- ----------------------------
-- Table structure for tb_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_notify_record`;
CREATE TABLE `tb_notify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notify_id` bigint(20) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '接受人',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`is_read`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';

-- ----------------------------
-- Records of tb_notify_record
-- ----------------------------
INSERT INTO `tb_notify_record` VALUES ('11', '53', '2', '0', null);
INSERT INTO `tb_notify_record` VALUES ('12', '53', '3', '1', '2020-07-08');

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `classes_id` bigint(20) DEFAULT NULL,
  `status` tinyint(255) DEFAULT NULL,
  `sex` tinyint(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('1', '417240512', 'e3e7ed35c23e7fa9a2e742411f9ee2a2', '黄子越', '719491759@qq.com', '8', '1', '1', '2020-07-08 14:37:38', '2020-07-08 23:46:02');
INSERT INTO `tb_student` VALUES ('3', '417240531', 'e3e7ed35c23e7fa9a2e742411f9ee2a2', 'test', 'test@qq.com', '3', '1', '0', '2020-07-08 14:38:20', '2020-07-09 16:09:31');

-- ----------------------------
-- Table structure for tb_user_classes
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_classes`;
CREATE TABLE `tb_user_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classes_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_classes
-- ----------------------------
INSERT INTO `tb_user_classes` VALUES ('22', '6', '10');
INSERT INTO `tb_user_classes` VALUES ('23', '6', '3');
INSERT INTO `tb_user_classes` VALUES ('29', '9', '3');
INSERT INTO `tb_user_classes` VALUES ('30', '9', '10');
INSERT INTO `tb_user_classes` VALUES ('45', '7', '3');
INSERT INTO `tb_user_classes` VALUES ('49', '8', '3');
INSERT INTO `tb_user_classes` VALUES ('50', '8', '10');
INSERT INTO `tb_user_classes` VALUES ('51', '3', '10');
INSERT INTO `tb_user_classes` VALUES ('52', '3', '3');

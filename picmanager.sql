/*
 Navicat Premium Data Transfer

 Source Server         : PicManager
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 34.92.201.227:3306
 Source Schema         : picmanager

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 11/02/2020 10:42:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asset
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `assetid` int(11) NOT NULL AUTO_INCREMENT,
  `assetname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `assettype` enum('pic','video') DEFAULT NULL,
  `category` enum('photograph','gis','cloud') DEFAULT NULL,
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `acq_date` datetime DEFAULT NULL,
  `scale` varchar(100) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_date` datetime DEFAULT NULL COMMENT '修改时间',
  `uploader_uid` int(11) DEFAULT NULL COMMENT '上传者UID',
  PRIMARY KEY (`assetid`) USING BTREE,
  UNIQUE KEY `assetid` (`assetid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asset
-- ----------------------------
BEGIN;
INSERT INTO `asset` VALUES (5, '示例图片 1', 'pic', 'gis', '/assets/GIS001.jpg', '中国', '四川', '12', '12', '2019-12-07 21:59:34', '1:100', '2019-12-07 22:00:26', '2019-12-15 19:04:15', 100);
INSERT INTO `asset` VALUES (6, '示例图片2', 'pic', 'gis', '/assets/GIS002.jpg', '中国', '北京', '12', '13.4', '2019-12-07 21:59:34', '1:10', '2019-12-07 22:00:26', '2019-12-23 12:51:20', 100);
INSERT INTO `asset` VALUES (7, '示例图片3', 'pic', 'gis', '/assets/GIS007.jpg', '中国', '吉林', '12', '12', '2019-12-07 21:59:34', '1:100', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (8, '示例图片4', 'pic', 'gis', '/assets/GIS009.jpg', '中国', '青海', '12', '12', '2019-12-07 21:59:34', '1:10', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (9, '示例图片5', 'pic', 'gis', '/assets/GIS011.jpg', '美国', 'Los Angeles', '12', '12', '2019-12-07 21:59:34', '1:100', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (10, '示例图片6', 'pic', 'gis', '/assets/GIS025.jpg', '美国', 'San Francisco', '12', '12', '2019-12-07 21:59:34', '1:1000', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (11, '示例图片7', 'pic', 'photograph', '/assets/scene010.jpg', '中国', '杭州', '12', '12', '2019-12-07 21:59:34', '1:100', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (12, '示例图片8', 'pic', 'photograph', '/assets/scene011.jpg', '英国', 'London', '12', '12', '2019-12-07 21:59:34', '1:1000', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (13, '示例图片9', 'pic', 'photograph', '/assets/scene012.jpg', '中国', '香港', '12', '12', '2019-12-07 21:59:34', '1:100', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (14, '示例图片10', 'pic', 'photograph', '/assets/scene049.jpg', '法国', 'Paris', '12', '12', '2019-12-07 21:59:34', '1:1000', '2019-12-07 22:00:26', '2019-12-07 22:00:29', 100);
INSERT INTO `asset` VALUES (19, 'Example', 'pic', 'photograph', '/assets/example.png', '中国', '上海', '12', '12', '2019-12-15 02:16:21', '1:1', '2019-12-15 02:16:21', '2019-12-15 17:19:09', 108);
INSERT INTO `asset` VALUES (21, 'ARRAU CLAUDIO', 'pic', 'photograph', '/assets/-2001022011.jpg', '中国', '上海', '110 E', '31.3 N', '2019-12-15 03:12:41', '1:1', '2019-12-15 03:12:41', '2019-12-16 02:18:53', 108);
INSERT INTO `asset` VALUES (26, '卫星云图示例', 'pic', 'cloud', '/assets/u=2071841825,3549710455&fm=26&gp=0.jpg', '中国', '上海', '101 E', '31 N', '2019-12-17 13:23:08', '1:1000', '2019-12-17 13:23:08', '2019-12-17 13:23:49', 108);
INSERT INTO `asset` VALUES (27, 'cjt', 'pic', 'cloud', '/assets/VW1A0409_2001çå¯æ¬.jpg', 'zdfghj1', 'fdghjk', 'xcgjh', 'cvjk', '2019-12-23 14:13:13', '1:1', '2019-12-23 14:13:13', '2019-12-23 14:13:13', 108);
COMMIT;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `assetid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` enum('upload','download','delete','modify','login','logout') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `assetname` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `request_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '可选，详细日志',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
BEGIN;
INSERT INTO `log` VALUES (1, '100', 'root', '-1', 'login', 'N/A', '2019-12-07 23:17:51', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (2, '100', 'root', '-1', 'login', 'N/A', '2019-12-07 23:42:31', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (3, '100', 'root', '-1', 'login', 'N/A', '2019-12-07 23:47:46', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (4, '100', 'root', '-1', 'login', 'N/A', '2019-12-07 23:52:26', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (5, '100', 'root', '-1', 'login', 'N/A', '2019-12-07 23:53:59', '192.168.31.41', NULL);
INSERT INTO `log` VALUES (6, '100', 'root', '-1', 'login', 'N/A', '2019-12-07 23:55:28', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (7, '100', 'root', '-1', 'login', 'N/A', '2019-12-07 23:57:02', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (8, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 00:08:52', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (9, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 00:11:44', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (10, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 00:12:57', '192.168.31.41', NULL);
INSERT INTO `log` VALUES (11, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 00:16:07', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (12, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 01:08:43', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (13, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 01:24:38', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (14, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 01:29:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (15, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 01:38:26', '192.168.31.41', NULL);
INSERT INTO `log` VALUES (16, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 01:56:28', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (17, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 01:59:36', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (18, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:04:54', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (19, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:13:23', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (20, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:23:28', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (21, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:26:17', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (22, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:39:04', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (23, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:43:19', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (24, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:52:15', '192.168.31.41', NULL);
INSERT INTO `log` VALUES (25, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:53:29', '192.168.31.41', NULL);
INSERT INTO `log` VALUES (26, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 02:56:25', '192.168.31.190', NULL);
INSERT INTO `log` VALUES (27, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 03:01:19', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (28, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 13:22:24', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (29, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 13:40:02', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (30, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 14:49:01', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (31, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 15:06:54', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (32, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 15:41:25', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (33, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 15:48:01', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (34, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 15:56:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (35, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 16:18:25', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (36, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 16:28:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (37, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 16:30:19', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (38, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 16:54:47', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (39, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 17:11:04', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (40, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 17:12:43', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (41, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 17:23:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (42, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 18:05:52', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (43, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 18:09:11', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (44, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 18:46:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (45, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 18:53:00', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (46, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 19:32:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (47, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 19:32:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (48, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 00:00:07', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (49, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 00:17:16', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (50, 'null', 'root', '12', 'download', '示例图片8', '2019-12-09 00:18:42', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (51, 'null', 'root', '12', 'download', '示例图片8', '2019-12-09 00:23:01', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (52, 'null', 'root', '12', 'download', '示例图片8', '2019-12-09 00:31:33', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (53, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 00:32:56', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (54, 'null', 'root', '1', 'download', '示例图片 0', '2019-12-09 00:33:00', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (55, '100', 'root', '14', 'download', '示例图片10', '2019-12-09 00:35:07', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (56, '100', 'root', '13', 'download', '示例图片9', '2019-12-09 00:35:27', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (57, '100', 'root', '5', 'download', '示例图片 1', '2019-12-09 00:37:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (58, '100', 'root', '9', 'download', '示例图片5', '2019-12-09 00:40:42', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (59, '100', 'root', '12', 'download', '示例图片8', '2019-12-09 00:43:49', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (60, '100', 'root', '13', 'download', '示例图片9', '2019-12-09 00:44:33', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (61, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 01:07:57', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (62, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 18:23:42', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (63, '100', 'root', '7', 'download', '示例图片3', '2019-12-08 18:23:51', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (64, '100', 'root', '-1', 'login', 'N/A', '2019-12-08 18:29:30', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (65, '100', 'root', '6', 'download', '示例图片2', '2019-12-08 18:33:50', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (66, '100', 'root', '1', 'download', '示例图片 0', '2019-12-08 18:49:13', '117.136.8.129', NULL);
INSERT INTO `log` VALUES (67, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 02:10:41', '219.228.146.162', NULL);
INSERT INTO `log` VALUES (68, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 10:27:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (69, '100', 'root', '10', 'download', '示例图片6', '2019-12-09 10:28:12', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (70, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 04:11:15', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (71, '100', 'root', '11', 'download', '示例图片7', '2019-12-09 04:11:42', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (72, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 13:16:18', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (73, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 13:36:19', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (74, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 13:37:31', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (75, '100', 'root', '13', 'download', '示例图片9', '2019-12-09 13:58:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (76, '103', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-09 14:21:03', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (77, '106', '1231', '-1', 'login', 'N/A', '2019-12-09 14:47:48', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (78, '103', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-09 06:48:42', '219.228.146.162', NULL);
INSERT INTO `log` VALUES (79, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 15:07:54', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (80, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 15:12:51', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (81, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-09 15:27:14', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (82, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-09 15:50:02', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (83, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-09 15:55:57', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (84, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-09 17:33:10', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (85, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-09 17:34:14', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (86, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-09 17:40:05', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (87, '100', 'root', '-1', 'login', 'N/A', '2019-12-09 17:43:01', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (88, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 02:55:38', '219.228.146.220', NULL);
INSERT INTO `log` VALUES (89, '108', 'BillChen2000', '12', 'download', '示例图片8', '2019-12-11 02:56:07', '219.228.146.220', NULL);
INSERT INTO `log` VALUES (90, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 20:40:17', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (91, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 21:03:03', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (92, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 22:27:35', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (93, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 22:56:17', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (94, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 22:57:07', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (95, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 22:57:11', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (96, '100', 'root', '-1', 'login', 'N/A', '2019-12-11 15:20:28', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (97, '100', 'root', '-1', 'login', 'N/A', '2019-12-11 15:22:13', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (98, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 23:23:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (99, '100', 'root', '-1', 'login', 'N/A', '2019-12-11 15:24:22', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (100, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 23:29:18', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (101, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 23:38:32', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (102, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-11 23:48:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (103, '100', 'root', '-1', 'login', 'N/A', '2019-12-12 02:16:26', '219.228.146.139', NULL);
INSERT INTO `log` VALUES (104, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-12 10:17:06', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (105, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-12 10:19:56', '219.228.146.102', NULL);
INSERT INTO `log` VALUES (106, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-12 21:35:55', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (107, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-12 13:37:42', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (108, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-12 21:46:23', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (109, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-12 23:35:45', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (110, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-12 23:36:22', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (111, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-12 23:42:30', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (112, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-12 23:44:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (113, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-13 15:00:05', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (114, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-13 19:23:28', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (115, '100', 'root', '-1', 'login', 'N/A', '2019-12-13 15:04:34', '223.104.212.91', NULL);
INSERT INTO `log` VALUES (116, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-14 14:10:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (117, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 00:13:44', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (118, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 00:15:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (119, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 00:19:24', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (120, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 00:48:06', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (121, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 00:58:49', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (122, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 00:58:50', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (123, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 01:43:56', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (124, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 01:45:17', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (125, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 01:45:19', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (126, '108', 'BillChen2000', '19', 'download', 'Example', '2019-12-15 03:45:45', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (127, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 13:44:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (128, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 14:26:48', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (129, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 14:37:24', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (130, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 14:40:21', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (131, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 14:52:36', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (132, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 15:11:26', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (133, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 15:17:33', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (134, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 15:28:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (135, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 16:00:31', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (136, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 16:03:18', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (137, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 16:04:31', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (138, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 16:11:40', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (139, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 16:29:06', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (140, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 16:35:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (141, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 16:39:01', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (142, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 16:41:31', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (143, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 16:41:31', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (144, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 16:43:59', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (145, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 16:48:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (146, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 16:55:00', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (147, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 17:04:24', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (148, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:05:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (149, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:09:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (150, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:11:36', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (151, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:18:58', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (152, '107', 'zxp', '19', 'modify', 'Example', '2019-12-15 17:19:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (153, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 17:19:44', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (154, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:22:13', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (155, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 17:22:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (156, '108', 'BillChen2000', '22', 'download', '又一个测试', '2019-12-15 17:36:04', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (157, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 17:45:27', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (158, '111', 'Hello', '-1', 'login', 'N/A', '2019-12-15 17:45:35', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (159, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:47:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (160, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 17:50:05', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (161, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 17:50:56', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (162, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 17:52:23', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (163, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 17:54:45', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (164, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:56:20', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (165, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 17:56:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (166, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 17:58:06', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (167, '111', 'Hello', '-1', 'login', 'N/A', '2019-12-15 17:58:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (168, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 17:58:42', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (169, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 17:59:26', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (170, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 17:59:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (171, '100', 'root', '-1', 'login', 'N/A', '2019-12-15 18:09:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (172, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 18:15:30', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (173, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 18:21:10', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (174, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 18:24:08', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (175, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 18:27:08', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (176, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 18:30:25', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (177, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 18:33:11', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (178, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 18:34:33', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (179, '100', 'root', '13', 'download', '示例图片9', '2019-12-15 18:51:06', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (180, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 19:27:10', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (181, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 19:31:44', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (182, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 19:39:26', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (183, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 19:42:26', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (184, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 19:42:28', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (185, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 19:46:51', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (186, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 19:51:05', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (187, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:21:38', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (188, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 22:22:51', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (189, '111', 'Hello', '-1', 'login', 'N/A', '2019-12-15 22:23:55', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (190, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:25:43', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (191, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:25:44', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (192, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 22:27:08', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (193, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:29:12', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (194, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:29:17', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (195, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:30:15', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (196, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:38:00', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (197, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:40:05', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (198, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:45:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (199, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:47:18', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (200, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:54:10', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (201, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:54:11', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (202, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 22:59:52', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (203, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:02:23', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (204, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:07:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (205, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:11:12', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (206, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:11:12', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (207, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:18:03', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (208, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:20:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (209, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:23:55', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (210, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-15 23:49:20', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (211, '107', 'zxp', '5', 'modify', '示例图片 1', '2019-12-15 23:49:33', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (212, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 23:49:49', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (213, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 23:50:27', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (214, '107', 'zxp', 'null', 'modify', 'null', '2019-12-15 23:51:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (215, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 00:27:31', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (216, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-16 00:29:30', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (217, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 00:30:29', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (218, '108', 'BillChen2000', 'null', 'modify', 'null', '2019-12-16 00:30:45', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (219, '108', 'BillChen2000', 'null', 'modify', 'null', '2019-12-16 00:31:49', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (220, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 00:33:24', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (221, '111', 'Hello3', '-1', 'login', 'N/A', '2019-12-16 00:40:32', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (222, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 00:41:20', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (223, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 00:41:23', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (224, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 00:49:27', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (225, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 00:52:11', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (226, '108', 'BillChen2000', '21', 'modify', '上传例子', '2019-12-16 00:52:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (227, '111', 'Hello', '-1', 'login', 'N/A', '2019-12-16 01:00:33', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (228, '111', 'Hello', '14', 'download', '示例图片10', '2019-12-16 01:00:47', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (229, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 01:01:26', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (230, '100', 'root', '-1', 'login', 'N/A', '2019-12-16 01:14:25', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (231, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 17:21:03', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (232, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 01:42:47', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (233, '108', 'BillChen2000', '21', 'modify', '上传例子', '2019-12-15 17:45:56', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (234, '108', 'BillChen2000', 'null', 'upload', 'null', '2019-12-15 17:47:55', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (235, '108', 'BillChen2000', '23', 'download', '春秋代序', '2019-12-15 17:49:04', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (236, '108', 'BillChen2000', '24', 'upload', 'HI', '2019-12-16 02:14:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (237, '108', 'BillChen2000', 'null', 'modify', 'null', '2019-12-15 18:15:05', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (238, '108', 'BillChen2000', '25', 'upload', 'TITLE', '2019-12-16 02:17:42', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (239, '108', 'BillChen2000', '25', 'delete', 'TITLE', '2019-12-16 02:18:02', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (240, '108', 'BillChen2000', '21', 'modify', 'ARRAU CLAUDIO', '2019-12-16 02:18:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (241, '108', 'BillChen2000', '23', 'delete', '春秋代序', '2019-12-16 02:19:10', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (242, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-15 19:03:51', '223.104.210.106', NULL);
INSERT INTO `log` VALUES (243, '108', 'BillChen2000', '5', 'modify', '示例图片 1', '2019-12-15 19:04:15', '223.104.210.106', NULL);
INSERT INTO `log` VALUES (244, '108', 'BillChen2000', '21', 'download', 'ARRAU CLAUDIO', '2019-12-15 19:06:57', '223.104.210.106', NULL);
INSERT INTO `log` VALUES (245, '100', 'root', '-1', 'login', 'N/A', '2019-12-15 19:17:43', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (246, '100', 'root', '-1', 'login', 'N/A', '2019-12-15 19:20:10', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (247, '100', 'root', '-1', 'login', 'N/A', '2019-12-15 19:20:11', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (248, '100', 'root', '-1', 'login', 'N/A', '2019-12-15 19:20:26', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (249, '100', 'root', '-1', 'login', 'N/A', '2019-12-15 19:21:34', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (250, '100', 'root', '21', 'download', 'ARRAU CLAUDIO', '2019-12-16 03:26:02', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (251, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 11:06:00', '219.228.146.82', NULL);
INSERT INTO `log` VALUES (252, '100', 'root', '-1', 'login', 'N/A', '2019-12-16 13:12:18', '219.228.146.82', NULL);
INSERT INTO `log` VALUES (253, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:20:52', '219.228.146.82', NULL);
INSERT INTO `log` VALUES (254, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:21:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (255, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:21:55', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (256, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:23:51', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (257, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:24:01', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (258, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:39:00', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (259, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:41:08', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (260, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:43:08', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (261, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:47:25', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (262, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:52:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (263, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:53:10', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (264, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 13:54:59', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (265, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-16 14:19:01', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (266, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:26:26', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (267, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:26:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (268, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:26:47', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (269, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:26:54', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (270, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:30:38', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (271, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:30:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (272, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:31:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (273, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:31:45', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (274, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:32:35', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (275, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:32:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (276, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:33:02', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (277, '107', 'zxp', '12', 'download', '示例图片8', '2019-12-16 14:34:56', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (278, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:35:20', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (279, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:35:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (280, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:50:07', '219.228.146.82', NULL);
INSERT INTO `log` VALUES (281, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 14:51:20', '219.228.146.82', NULL);
INSERT INTO `log` VALUES (282, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 16:25:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (283, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 16:26:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (284, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 16:26:42', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (285, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 17:33:43', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (286, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:35', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (287, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:36', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (288, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:36', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (289, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:36', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (290, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:36', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (291, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (292, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:37', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (293, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:38', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (294, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:38', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (295, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (296, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:39', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (297, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:41:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (298, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 21:42:23', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (299, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 23:19:59', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (300, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-16 23:22:33', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (301, '108', 'BillChen2000', '19', 'download', 'Example', '2019-12-16 23:22:41', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (302, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 00:00:09', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (303, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 00:00:34', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (304, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 12:55:16', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (305, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 12:55:24', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (306, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 13:05:16', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (307, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 13:14:40', '219.228.146.153', NULL);
INSERT INTO `log` VALUES (308, '108', 'BillChen2000', '26', 'upload', '卫星云图', '2019-12-17 13:23:08', '219.228.146.153', NULL);
INSERT INTO `log` VALUES (309, '108', 'BillChen2000', '26', 'modify', '卫星云图示例', '2019-12-17 13:23:49', '219.228.146.153', NULL);
INSERT INTO `log` VALUES (310, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 13:24:18', '219.228.146.153', NULL);
INSERT INTO `log` VALUES (311, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 17:55:29', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (312, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-17 23:16:05', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (313, '108', 'BillChen2000', '26', 'download', '卫星云图示例', '2019-12-17 23:16:15', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (314, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-18 14:56:53', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (315, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-18 15:19:14', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (316, '111', 'user', '-1', 'login', 'N/A', '2019-12-18 15:21:57', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (317, '111', 'user', '-1', 'login', 'N/A', '2019-12-18 15:35:04', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (318, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-18 15:39:52', '127.0.0.1', NULL);
INSERT INTO `log` VALUES (319, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-18 16:39:49', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (320, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 11:21:35', '219.228.146.95', NULL);
INSERT INTO `log` VALUES (321, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 17:56:51', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (322, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 18:10:42', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (323, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 18:19:36', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (324, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 18:20:48', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (325, '111', 'user', '-1', 'login', 'N/A', '2019-12-19 18:42:57', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (326, '111', 'user', '-1', 'login', 'N/A', '2019-12-19 19:56:17', '171.209.94.103', NULL);
INSERT INTO `log` VALUES (327, '114', 'lolipop', '-1', 'login', 'N/A', '2019-12-19 19:58:43', '199.168.143.47', NULL);
INSERT INTO `log` VALUES (328, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 21:23:08', '114.85.182.114', NULL);
INSERT INTO `log` VALUES (329, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 21:57:44', '114.85.182.114', NULL);
INSERT INTO `log` VALUES (330, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-19 22:03:41', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (331, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-21 19:39:29', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (332, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-22 14:50:07', '35.241.110.135', NULL);
INSERT INTO `log` VALUES (333, '100', 'root', '-1', 'login', 'N/A', '2019-12-23 01:26:46', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (334, '100', 'root', '12', 'download', '示例图片8', '2019-12-23 01:27:02', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (335, '100', 'root', '-1', 'login', 'N/A', '2019-12-23 12:50:53', '219.228.146.38', NULL);
INSERT INTO `log` VALUES (336, '100', 'root', '6', 'modify', '示例图片2', '2019-12-23 12:51:21', '219.228.146.38', NULL);
INSERT INTO `log` VALUES (337, '111', 'user', '-1', 'login', 'N/A', '2019-12-23 13:23:55', '219.228.146.38', NULL);
INSERT INTO `log` VALUES (338, '100', 'root', '-1', 'login', 'N/A', '2019-12-23 13:33:37', '219.228.146.38', NULL);
INSERT INTO `log` VALUES (339, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-23 14:10:06', '223.104.210.135', NULL);
INSERT INTO `log` VALUES (340, '108', 'BillChen2000', '12', 'download', '示例图片8', '2019-12-23 14:10:43', '223.104.210.135', NULL);
INSERT INTO `log` VALUES (341, '107', 'zxp', '-1', 'login', 'N/A', '2019-12-23 14:12:00', '219.228.146.123', NULL);
INSERT INTO `log` VALUES (342, '108', 'BillChen2000', '27', 'upload', 'cjt', '2019-12-23 14:13:13', '223.104.210.135', NULL);
INSERT INTO `log` VALUES (343, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-23 14:23:54', '223.104.210.135', NULL);
INSERT INTO `log` VALUES (344, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-23 17:09:31', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (345, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-23 17:49:29', '180.160.63.246', NULL);
INSERT INTO `log` VALUES (346, '108', 'BillChen2000', '-1', 'login', 'N/A', '2019-12-30 13:54:44', '219.228.146.84', NULL);
INSERT INTO `log` VALUES (347, '108', 'BillChen2000', '-1', 'login', 'N/A', '2020-01-04 12:07:24', '219.228.146.89', NULL);
INSERT INTO `log` VALUES (348, '100', 'root', '-1', 'login', 'N/A', '2020-01-13 19:13:01', '104.168.236.7', NULL);
INSERT INTO `log` VALUES (349, '108', 'BillChen2000', '-1', 'login', 'N/A', '2020-01-14 04:17:13', '35.241.110.135', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_last_changed` datetime DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `security_problem` varchar(1000) DEFAULT NULL,
  `security_answer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密保问题和答案，均为未使用的字段',
  `registration_date` datetime DEFAULT NULL COMMENT '密保问题和答案，均为未使用的字段',
  `registration_ip` varchar(255) DEFAULT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (100, 'root', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785', NULL, NULL, NULL, NULL, '2019-12-09 15:30:10', '127.0.0.1', 'root');
INSERT INTO `user` VALUES (107, 'zxp', '9134c50aaa37f0b317dba16ac0da61d5316aae89', NULL, 'zxp@zxp.com', NULL, NULL, '2019-12-09 15:26:58', '127.0.0.1', 'admin');
INSERT INTO `user` VALUES (108, 'BillChen2000', 'a834422ea7838f58ce3f2b6872f7b9f41aefd99a', '2019-12-17 13:25:14', 'Bill.Chen@live.com', NULL, NULL, '2019-12-09 15:49:51', '127.0.0.1', 'admin');
INSERT INTO `user` VALUES (110, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2019-12-16 13:12:43', 'newUser@hi.com', NULL, NULL, '2019-12-15 16:28:58', '127.0.0.1', 'admin');
INSERT INTO `user` VALUES (111, 'user', '12dea96fec20593566ab75692c9949596833adc9', '2019-12-16 13:12:37', 'Hello@hi.com', NULL, NULL, '2019-12-15 16:43:42', '127.0.0.1', 'user');
INSERT INTO `user` VALUES (114, 'lolipop', '2885bbb9e01cfb6ebda0d9a72ffaa351062fc3ab', NULL, '408550192@qq.com', NULL, NULL, '2019-12-19 19:58:26', '199.168.143.47', 'admin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

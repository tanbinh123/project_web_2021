/*
 Navicat Premium Data Transfer

 Source Server         : My SQL
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : course

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 10/03/2021 00:09:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` int(1) NULL DEFAULT 1,
  `delete` int(1) NULL DEFAULT 0,
  `level` int(1) NULL DEFAULT 1,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, 'hoang', '865bedd2fba8fe20b828ed07600c64a4', 'tanhoang@gmail.com', 1, 0, 1, 'image/avatar/momo.webp');
INSERT INTO `accounts` VALUES (2, 'quan', '865bedd2fba8fe20b828ed07600c64a4', 'hearterzouest99.999@gmail.com', 1, 0, 1, 'image/avatar/momo.webp');

SET FOREIGN_KEY_CHECKS = 1;

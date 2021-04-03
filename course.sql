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

 Date: 03/04/2021 21:10:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_role
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role`  (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE,
  UNIQUE INDEX `APP_ROLE_UK`(`ROLE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_role
-- ----------------------------
INSERT INTO `app_role` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `app_role` VALUES (2, 'ROLE_USER');

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user`  (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'image/avatar/momo.webp',
  `deleted` bit(1) NULL DEFAULT b'0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  UNIQUE INDEX `APP_USER_UK`(`USER_NAME`) USING BTREE,
  UNIQUE INDEX `email_uq`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (1, 'admin', 'cBrlgyL2GI2GINuLUUwgojITuIufFycpLG4490dhGtY=', b'1', 'image/default/momo.webp', b'0', 'tanhoang99.999@gmail.com');
INSERT INTO `app_user` VALUES (2, 'user', 'cBrlgyL2GI2GINuLUUwgojITuIufFycpLG4490dhGtY=', b'1', 'image/default/momo.webp', b'0', 'hearterzouest99.999@gmail.com');
INSERT INTO `app_user` VALUES (28, 'hello', 'Wwtf1LEt+oBYjbew/WeFdU+HFW+oMIGDhTy+E6Q0f4Q=', b'1', 'image/avatar/momo.webp', b'0', 'test@gmail.com');
INSERT INTO `app_user` VALUES (30, 'sang', '3sPcFxUAEJv0+aHpLnEa87B8F9Dbo03RG9mPyIGGGtk=', b'1', 'image/avatar/momo.webp', b'0', 'anonkill1999@gmail.com');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `ratestar` double(1, 0) NULL DEFAULT NULL,
  `bought` int(10) NULL DEFAULT NULL,
  `update_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'user/user/image/ganyu-h-4.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 1', 'Demo 1', 1000000, 1, 66, '2019-10-08 17:51:59');
INSERT INTO `course` VALUES (2, 'user/user/image/ganyu-h-4.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 2', 'Demo 2', 2000000, 5, 88, '2019-02-03 22:20:54');
INSERT INTO `course` VALUES (3, 'user/user/image/ganyu-h-9.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 3', 'Demo 3', 3000000, 5, 4, '2020-10-25 13:14:43');
INSERT INTO `course` VALUES (4, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 4', 'Demo 4', 4000000, 2, 0, '2019-12-19 15:45:06');
INSERT INTO `course` VALUES (5, 'user/user/image/ganyu-h-3.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 5', 'Demo 5', 5000000, 5, 33, '2019-11-19 04:34:37');
INSERT INTO `course` VALUES (6, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 6', 'Demo 6', 6000000, 3, 89, '2019-05-17 05:12:53');
INSERT INTO `course` VALUES (7, 'user/user/image/ganyu-h-4.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 7', 'Demo 7', 7000000, 0, 92, '2020-09-20 15:11:21');
INSERT INTO `course` VALUES (8, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 8', 'Demo 8', 8000000, 4, 8, '2019-07-18 22:46:10');
INSERT INTO `course` VALUES (9, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 9', 'Demo 9', 9000000, 5, 85, '2020-07-18 23:15:11');
INSERT INTO `course` VALUES (10, 'user/user/image/ganyu-h-1.png', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 10', 'Demo 10', 1000000, 5, 59, '2020-12-27 16:51:58');
INSERT INTO `course` VALUES (11, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 11', 'Demo 11', 2000000, 1, 57, '2019-08-09 23:43:09');
INSERT INTO `course` VALUES (12, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 12', 'Demo 12', 3000000, 3, 17, '2019-11-03 13:48:52');
INSERT INTO `course` VALUES (13, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 13', 'Demo 13', 4000000, 4, 41, '2019-11-10 16:24:45');
INSERT INTO `course` VALUES (14, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 14', 'Demo 14', 5000000, 5, 91, '2020-04-08 12:19:46');
INSERT INTO `course` VALUES (15, 'user/user/image/ganyu-h-2.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 15', 'Demo 15', 6000000, 3, 1, '2020-02-03 00:36:45');
INSERT INTO `course` VALUES (16, 'user/user/image/ganyu-h-2.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 16', 'Demo 16', 7000000, 3, 47, '2020-01-08 17:22:10');
INSERT INTO `course` VALUES (17, 'user/user/image/ganyu-h-6.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 17', 'Demo 17', 8000000, 5, 91, '2019-03-16 10:42:38');
INSERT INTO `course` VALUES (18, 'user/user/image/ganyu-h-1.png', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 18', 'Demo 18', 9000000, 1, 82, '2020-04-23 17:19:24');
INSERT INTO `course` VALUES (19, 'user/user/image/ganyu-h-2.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 19', 'Demo 19', 1000000, 1, 13, '2020-09-04 09:42:36');
INSERT INTO `course` VALUES (20, 'user/user/image/ganyu-h-1.png', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 20', 'Demo 20', 2000000, 5, 59, '2019-09-10 11:44:52');
INSERT INTO `course` VALUES (21, 'user/user/image/ganyu-h-3.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 21', 'Demo 21', 3000000, 4, 88, '2019-08-21 10:21:29');
INSERT INTO `course` VALUES (22, 'user/user/image/ganyu-h-4.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 22', 'Demo 22', 4000000, 2, 38, '2020-04-01 13:07:39');
INSERT INTO `course` VALUES (23, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 23', 'Demo 23', 5000000, 2, 57, '2019-09-26 17:59:34');
INSERT INTO `course` VALUES (24, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 24', 'Demo 24', 6000000, 5, 3, '2020-03-19 00:04:43');
INSERT INTO `course` VALUES (25, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 25', 'Demo 25', 7000000, 0, 19, '2019-11-09 13:23:32');
INSERT INTO `course` VALUES (26, 'user/user/image/ganyu-h-4.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 26', 'Demo 26', 8000000, 3, 10, '2019-05-07 14:56:25');
INSERT INTO `course` VALUES (27, 'user/user/image/ganyu-h-5.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 27', 'Demo 27', 9000000, 5, 44, '2020-07-18 15:42:21');
INSERT INTO `course` VALUES (28, 'user/user/image/ganyu-h-6.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 28', 'Demo 28', 1000000, 0, 27, '2019-04-10 21:53:51');
INSERT INTO `course` VALUES (29, 'user/user/image/ganyu-h-4.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 29', 'Demo 29', 2000000, 4, 36, '2019-06-22 05:20:33');
INSERT INTO `course` VALUES (30, 'user/user/image/ganyu-h-3.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 30', 'Demo 30', 3000000, 4, 61, '2020-07-22 08:48:36');
INSERT INTO `course` VALUES (31, 'user/user/image/ganyu-h-1.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 31', 'Demo 31', 4000000, 3, 72, '2020-09-26 07:17:13');
INSERT INTO `course` VALUES (32, 'user/user/image/ganyu-h-1.png', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 32', 'Demo 32', 5000000, 3, 10, '2020-10-24 05:42:58');
INSERT INTO `course` VALUES (33, 'user/user/image/ganyu-h-8.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 33', 'Demo 33', 6000000, 0, 39, '2019-03-10 02:56:36');
INSERT INTO `course` VALUES (34, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 34', 'Demo 34', 7000000, 5, 26, '2019-10-21 01:31:06');
INSERT INTO `course` VALUES (35, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 35', 'Demo 35', 8000000, 3, 61, '2020-03-04 23:31:52');
INSERT INTO `course` VALUES (36, 'user/user/image/ganyu-h-8.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 36', 'Demo 36', 9000000, 4, 68, '2020-02-21 20:54:33');
INSERT INTO `course` VALUES (37, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 37', 'Demo 37', 1000000, 1, 3, '2019-12-07 22:12:22');
INSERT INTO `course` VALUES (38, 'user/user/image/ganyu-h-9.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 38', 'Demo 38', 2000000, 3, 61, '2019-05-04 05:38:01');
INSERT INTO `course` VALUES (39, 'user/user/image/ganyu-h-6.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 39', 'Demo 39', 3000000, 0, 36, '2019-01-11 09:06:53');
INSERT INTO `course` VALUES (40, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 40', 'Demo 40', 4000000, 5, 16, '2019-09-13 09:05:06');
INSERT INTO `course` VALUES (41, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 41', 'Demo 41', 5000000, 0, 39, '2020-06-14 00:04:40');
INSERT INTO `course` VALUES (42, 'user/user/image/ganyu-h-1.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 42', 'Demo 42', 6000000, 0, 84, '2019-02-20 23:05:11');
INSERT INTO `course` VALUES (43, 'user/user/image/ganyu-h-8.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 43', 'Demo 43', 7000000, 2, 32, '2019-10-14 02:21:09');
INSERT INTO `course` VALUES (44, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 44', 'Demo 44', 8000000, 2, 70, '2020-12-22 13:19:30');
INSERT INTO `course` VALUES (45, 'user/user/image/ganyu-h-4.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 45', 'Demo 45', 9000000, 3, 28, '2020-07-22 13:58:23');
INSERT INTO `course` VALUES (46, 'user/user/image/ganyu-h-1.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 46', 'Demo 46', 1000000, 0, 35, '2019-04-17 16:45:52');
INSERT INTO `course` VALUES (47, 'user/user/image/ganyu-h-1.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 47', 'Demo 47', 2000000, 2, 62, '2019-02-10 15:49:58');
INSERT INTO `course` VALUES (48, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 48', 'Demo 48', 3000000, 4, 50, '2019-05-27 14:45:43');
INSERT INTO `course` VALUES (49, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 49', 'Demo 49', 4000000, 4, 69, '2019-04-02 03:48:03');
INSERT INTO `course` VALUES (50, 'user/user/image/ganyu-h-7.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 50', 'Demo 50', 5000000, 3, 29, '2020-03-12 10:56:34');
INSERT INTO `course` VALUES (51, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 51', 'Demo 51', 6000000, 4, 25, '2019-10-27 02:21:34');
INSERT INTO `course` VALUES (52, 'user/user/image/ganyu-h-5.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 52', 'Demo 52', 7000000, 0, 61, '2019-03-03 15:27:41');
INSERT INTO `course` VALUES (53, 'user/user/image/ganyu-h-5.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 53', 'Demo 53', 8000000, 1, 98, '2020-02-28 16:02:19');
INSERT INTO `course` VALUES (54, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 54', 'Demo 54', 9000000, 0, 15, '2019-04-07 10:07:06');
INSERT INTO `course` VALUES (55, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 55', 'Demo 55', 1000000, 0, 52, '2019-08-24 10:47:50');
INSERT INTO `course` VALUES (56, 'user/user/image/ganyu-h-3.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 56', 'Demo 56', 2000000, 5, 95, '2020-10-01 12:44:37');
INSERT INTO `course` VALUES (57, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 57', 'Demo 57', 3000000, 4, 66, '2020-12-07 16:27:51');
INSERT INTO `course` VALUES (58, 'user/user/image/ganyu-h-6.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 58', 'Demo 58', 4000000, 1, 53, '2019-03-17 14:13:49');
INSERT INTO `course` VALUES (59, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 59', 'Demo 59', 5000000, 1, 79, '2020-02-19 08:30:37');
INSERT INTO `course` VALUES (60, 'user/user/image/ganyu-h-1.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 60', 'Demo 60', 6000000, 0, 56, '2019-06-12 20:44:41');
INSERT INTO `course` VALUES (61, 'user/user/image/ganyu-h-3.png', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 61', 'Demo 61', 7000000, 0, 89, '2020-01-14 03:43:20');
INSERT INTO `course` VALUES (62, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 62', 'Demo 62', 8000000, 3, 36, '2019-05-25 19:54:43');
INSERT INTO `course` VALUES (63, 'user/user/image/ganyu-h-6.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 63', 'Demo 63', 9000000, 0, 15, '2019-09-11 18:05:53');
INSERT INTO `course` VALUES (64, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 64', 'Demo 64', 1000000, 5, 32, '2020-12-06 09:31:09');
INSERT INTO `course` VALUES (65, 'user/user/image/ganyu-h-4.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 65', 'Demo 65', 2000000, 2, 73, '2019-03-07 16:27:44');
INSERT INTO `course` VALUES (66, 'user/user/image/ganyu-h-3.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 66', 'Demo 66', 3000000, 2, 60, '2019-01-02 17:29:07');
INSERT INTO `course` VALUES (67, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 67', 'Demo 67', 4000000, 1, 52, '2019-11-25 06:29:58');
INSERT INTO `course` VALUES (68, 'user/user/image/ganyu-h-2.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 68', 'Demo 68', 5000000, 4, 35, '2020-09-27 09:32:02');
INSERT INTO `course` VALUES (69, 'user/user/image/ganyu-h-8.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 69', 'Demo 69', 6000000, 5, 89, '2019-03-04 16:01:53');
INSERT INTO `course` VALUES (70, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 70', 'Demo 70', 7000000, 2, 66, '2020-12-09 01:15:45');
INSERT INTO `course` VALUES (71, 'user/user/image/ganyu-h-9.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 71', 'Demo 71', 8000000, 2, 1, '2020-10-23 22:40:51');
INSERT INTO `course` VALUES (72, 'user/user/image/ganyu-h-9.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 72', 'Demo 72', 9000000, 0, 66, '2020-11-25 11:21:39');
INSERT INTO `course` VALUES (73, 'user/user/image/ganyu-h-4.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 73', 'Demo 73', 1000000, 0, 58, '2020-09-14 14:46:33');
INSERT INTO `course` VALUES (74, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 74', 'Demo 74', 2000000, 1, 1, '2019-10-22 19:10:24');
INSERT INTO `course` VALUES (75, 'user/user/image/ganyu-h-4.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 75', 'Demo 75', 3000000, 4, 32, '2019-08-27 01:28:50');
INSERT INTO `course` VALUES (76, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 76', 'Demo 76', 4000000, 5, 46, '2019-11-22 20:07:46');
INSERT INTO `course` VALUES (77, 'user/user/image/ganyu-h-7.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 77', 'Demo 77', 5000000, 4, 34, '2019-06-02 11:58:52');
INSERT INTO `course` VALUES (78, 'user/user/image/ganyu-h-4.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 78', 'Demo 78', 6000000, 5, 9, '2019-10-06 20:54:55');
INSERT INTO `course` VALUES (79, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 79', 'Demo 79', 7000000, 0, 47, '2019-01-19 15:29:31');
INSERT INTO `course` VALUES (80, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 80', 'Demo 80', 8000000, 0, 11, '2020-05-13 21:17:32');
INSERT INTO `course` VALUES (81, 'user/user/image/ganyu-h-4.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 81', 'Demo 81', 9000000, 5, 39, '2020-09-17 22:53:41');
INSERT INTO `course` VALUES (82, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 82', 'Demo 82', 1000000, 4, 48, '2019-01-27 08:25:27');
INSERT INTO `course` VALUES (83, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 83', 'Demo 83', 2000000, 0, 62, '2019-02-12 05:58:06');
INSERT INTO `course` VALUES (84, 'user/user/image/ganyu-h-9.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 84', 'Demo 84', 3000000, 3, 32, '2019-12-13 12:20:26');
INSERT INTO `course` VALUES (85, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 85', 'Demo 85', 4000000, 4, 28, '2019-09-15 19:02:11');
INSERT INTO `course` VALUES (86, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 86', 'Demo 86', 5000000, 3, 87, '2020-07-16 16:10:21');
INSERT INTO `course` VALUES (87, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 87', 'Demo 87', 6000000, 4, 60, '2019-10-20 19:39:28');
INSERT INTO `course` VALUES (88, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 88', 'Demo 88', 7000000, 2, 3, '2020-09-12 12:32:16');
INSERT INTO `course` VALUES (89, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 89', 'Demo 89', 8000000, 1, 82, '2019-12-19 12:56:09');
INSERT INTO `course` VALUES (90, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 90', 'Demo 90', 9000000, 0, 28, '2019-02-11 01:04:26');
INSERT INTO `course` VALUES (91, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 91', 'Demo 91', 1000000, 1, 62, '2019-07-11 06:52:01');
INSERT INTO `course` VALUES (92, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 92', 'Demo 92', 2000000, 0, 58, '2020-10-23 02:42:38');
INSERT INTO `course` VALUES (93, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 93', 'Demo 93', 3000000, 1, 29, '2020-03-11 11:40:02');
INSERT INTO `course` VALUES (94, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 94', 'Demo 94', 4000000, 0, 85, '2020-02-27 06:03:14');
INSERT INTO `course` VALUES (95, 'user/user/image/ganyu-h-2.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 95', 'Demo 95', 5000000, 4, 3, '2020-01-27 16:59:40');
INSERT INTO `course` VALUES (96, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 96', 'Demo 96', 6000000, 0, 66, '2020-02-23 14:44:28');
INSERT INTO `course` VALUES (97, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 97', 'Demo 97', 7000000, 0, 10, '2019-03-28 06:07:10');
INSERT INTO `course` VALUES (98, 'user/user/image/ganyu-h-9.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 98', 'Demo 98', 8000000, 5, 66, '2020-12-03 13:56:06');
INSERT INTO `course` VALUES (99, 'user/user/image/ganyu-h-4.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 99', 'Demo 99', 9000000, 1, 61, '2019-02-10 17:27:57');
INSERT INTO `course` VALUES (100, 'user/user/image/ganyu-h-7.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 100', 'Demo 100', 1000000, 2, 38, '2019-12-07 00:04:46');
INSERT INTO `course` VALUES (101, 'user/user/image/ganyu-h-5.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 101', 'Demo 101', 2000000, 1, 42, '2020-10-10 09:49:08');
INSERT INTO `course` VALUES (102, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 102', 'Demo 102', 3000000, 1, 10, '2019-06-18 08:23:22');
INSERT INTO `course` VALUES (103, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 103', 'Demo 103', 4000000, 3, 69, '2019-09-05 12:57:43');
INSERT INTO `course` VALUES (104, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 104', 'Demo 104', 5000000, 2, 51, '2019-01-22 08:34:57');
INSERT INTO `course` VALUES (105, 'user/user/image/ganyu-h-6.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 105', 'Demo 105', 6000000, 5, 57, '2020-01-23 17:15:40');
INSERT INTO `course` VALUES (106, 'user/user/image/ganyu-h-5.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 106', 'Demo 106', 7000000, 0, 45, '2020-05-08 00:07:33');
INSERT INTO `course` VALUES (107, 'user/user/image/ganyu-h-5.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 107', 'Demo 107', 8000000, 1, 77, '2020-06-04 02:36:46');
INSERT INTO `course` VALUES (108, 'user/user/image/ganyu-h-5.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 108', 'Demo 108', 9000000, 2, 99, '2020-01-27 12:44:25');
INSERT INTO `course` VALUES (109, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 109', 'Demo 109', 1000000, 4, 48, '2020-11-06 17:06:56');
INSERT INTO `course` VALUES (110, 'user/user/image/ganyu-h-6.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 110', 'Demo 110', 2000000, 1, 39, '2019-06-22 20:24:22');
INSERT INTO `course` VALUES (111, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 111', 'Demo 111', 3000000, 3, 82, '2019-09-15 15:50:14');
INSERT INTO `course` VALUES (112, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 112', 'Demo 112', 4000000, 4, 99, '2019-06-27 19:55:29');
INSERT INTO `course` VALUES (113, 'user/user/image/ganyu-h-5.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 113', 'Demo 113', 5000000, 5, 76, '2019-01-16 00:47:12');
INSERT INTO `course` VALUES (114, 'user/user/image/ganyu-h-6.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 114', 'Demo 114', 6000000, 2, 50, '2019-02-22 07:28:45');
INSERT INTO `course` VALUES (115, 'user/user/image/ganyu-h-7.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 115', 'Demo 115', 7000000, 3, 37, '2019-02-04 02:26:25');
INSERT INTO `course` VALUES (116, 'user/user/image/ganyu-h-1.png', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 116', 'Demo 116', 8000000, 3, 1, '2019-10-01 04:05:41');
INSERT INTO `course` VALUES (117, 'user/user/image/ganyu-h-5.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 117', 'Demo 117', 9000000, 5, 71, '2019-03-01 10:48:21');
INSERT INTO `course` VALUES (118, 'user/user/image/ganyu-h-1.png', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 118', 'Demo 118', 1000000, 3, 41, '2019-09-21 22:10:04');
INSERT INTO `course` VALUES (119, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 119', 'Demo 119', 2000000, 1, 71, '2020-04-17 02:54:54');
INSERT INTO `course` VALUES (120, 'user/user/image/ganyu-h-2.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 120', 'Demo 120', 3000000, 3, 17, '2020-06-16 06:51:44');
INSERT INTO `course` VALUES (121, 'user/user/image/ganyu-h-5.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 121', 'Demo 121', 4000000, 5, 42, '2019-01-18 10:40:54');
INSERT INTO `course` VALUES (122, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 122', 'Demo 122', 5000000, 3, 64, '2019-08-11 12:16:12');
INSERT INTO `course` VALUES (123, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 123', 'Demo 123', 6000000, 0, 48, '2019-08-03 04:35:50');
INSERT INTO `course` VALUES (124, 'user/user/image/ganyu-h-9.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 124', 'Demo 124', 7000000, 3, 89, '2019-11-25 05:15:00');
INSERT INTO `course` VALUES (125, 'user/user/image/ganyu-h-5.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 125', 'Demo 125', 8000000, 2, 28, '2020-09-17 05:57:19');
INSERT INTO `course` VALUES (126, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 126', 'Demo 126', 9000000, 3, 44, '2020-09-22 10:47:46');
INSERT INTO `course` VALUES (127, 'user/user/image/ganyu-h-1.png', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 127', 'Demo 127', 1000000, 0, 42, '2019-04-07 12:35:42');
INSERT INTO `course` VALUES (128, 'user/user/image/ganyu-h-1.png', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 128', 'Demo 128', 2000000, 4, 78, '2019-02-23 15:55:58');
INSERT INTO `course` VALUES (129, 'user/user/image/ganyu-h-4.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 129', 'Demo 129', 3000000, 1, 5, '2020-01-19 18:53:08');
INSERT INTO `course` VALUES (130, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 130', 'Demo 130', 4000000, 5, 33, '2020-05-27 20:05:26');
INSERT INTO `course` VALUES (131, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 131', 'Demo 131', 5000000, 1, 40, '2019-07-16 14:34:34');
INSERT INTO `course` VALUES (132, 'user/user/image/ganyu-h-8.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 132', 'Demo 132', 6000000, 4, 82, '2019-05-13 18:17:09');
INSERT INTO `course` VALUES (133, 'user/user/image/ganyu-h-1.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 133', 'Demo 133', 7000000, 5, 62, '2020-01-22 04:11:24');
INSERT INTO `course` VALUES (134, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 134', 'Demo 134', 8000000, 0, 47, '2020-10-21 07:59:44');
INSERT INTO `course` VALUES (135, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 135', 'Demo 135', 9000000, 4, 23, '2019-07-19 17:30:53');
INSERT INTO `course` VALUES (136, 'user/user/image/ganyu-h-2.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 136', 'Demo 136', 1000000, 2, 79, '2020-04-08 00:20:05');
INSERT INTO `course` VALUES (137, 'user/user/image/ganyu-h-9.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 137', 'Demo 137', 2000000, 3, 100, '2020-08-08 04:53:34');
INSERT INTO `course` VALUES (138, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 138', 'Demo 138', 3000000, 2, 68, '2020-07-05 06:54:31');
INSERT INTO `course` VALUES (139, 'user/user/image/ganyu-h-5.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 139', 'Demo 139', 4000000, 3, 88, '2019-07-17 12:49:09');
INSERT INTO `course` VALUES (140, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 140', 'Demo 140', 5000000, 1, 51, '2019-11-04 20:13:56');
INSERT INTO `course` VALUES (141, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 141', 'Demo 141', 6000000, 2, 37, '2019-12-16 17:17:44');
INSERT INTO `course` VALUES (142, 'user/user/image/ganyu-h-7.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 142', 'Demo 142', 7000000, 3, 10, '2020-11-13 09:14:31');
INSERT INTO `course` VALUES (143, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 143', 'Demo 143', 8000000, 5, 57, '2020-03-19 09:39:08');
INSERT INTO `course` VALUES (144, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 144', 'Demo 144', 9000000, 1, 92, '2019-04-15 00:02:10');
INSERT INTO `course` VALUES (145, 'user/user/image/ganyu-h-9.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 145', 'Demo 145', 1000000, 4, 58, '2019-01-01 02:30:18');
INSERT INTO `course` VALUES (146, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 146', 'Demo 146', 2000000, 5, 47, '2019-05-18 22:03:33');
INSERT INTO `course` VALUES (147, 'user/user/image/ganyu-h-9.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 147', 'Demo 147', 3000000, 1, 85, '2019-12-25 09:50:59');
INSERT INTO `course` VALUES (148, 'user/user/image/ganyu-h-2.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 148', 'Demo 148', 4000000, 0, 36, '2019-03-15 14:22:52');
INSERT INTO `course` VALUES (149, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 149', 'Demo 149', 5000000, 5, 78, '2019-01-21 20:24:08');
INSERT INTO `course` VALUES (150, 'user/user/image/ganyu-h-3.png', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 150', 'Demo 150', 6000000, 5, 92, '2020-06-03 13:40:56');
INSERT INTO `course` VALUES (151, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 151', 'Demo 151', 7000000, 2, 21, '2020-03-07 13:32:40');
INSERT INTO `course` VALUES (152, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 152', 'Demo 152', 8000000, 2, 41, '2019-01-13 00:42:54');
INSERT INTO `course` VALUES (153, 'user/user/image/ganyu-h-6.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 153', 'Demo 153', 9000000, 2, 29, '2019-07-28 06:37:36');
INSERT INTO `course` VALUES (154, 'user/user/image/ganyu-h-2.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 154', 'Demo 154', 1000000, 3, 29, '2020-08-13 13:29:43');
INSERT INTO `course` VALUES (155, 'user/user/image/ganyu-h-7.jpg', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 155', 'Demo 155', 2000000, 5, 71, '2020-12-06 20:49:25');
INSERT INTO `course` VALUES (156, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 156', 'Demo 156', 3000000, 0, 94, '2020-05-14 21:26:24');
INSERT INTO `course` VALUES (157, 'user/user/image/ganyu-h-3.png', 'Mặc dù thực tế là cô ấy không còn phải chiến đấu nữa, cô ấy vẫn làm chủ cung tên với đôi mắt của mình. Khi Ganyu rèn cung, anh ta thu hồi một tỷ lệ nhất định của các khoáng chất được sử dụng.', b'0', 'Khóa học demo 157', 'Demo 157', 4000000, 4, 56, '2019-02-18 21:13:06');
INSERT INTO `course` VALUES (158, 'user/user/image/ganyu-h-8.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 158', 'Demo 158', 5000000, 1, 56, '2020-08-25 02:22:55');
INSERT INTO `course` VALUES (159, 'user/user/image/ganyu-h-9.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 159', 'Demo 159', 6000000, 1, 70, '2019-04-20 14:15:53');
INSERT INTO `course` VALUES (160, 'user/user/image/ganyu-h-7.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 160', 'Demo 160', 7000000, 1, 41, '2020-07-12 07:23:45');
INSERT INTO `course` VALUES (161, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 161', 'Demo 161', 8000000, 0, 42, '2020-01-05 13:35:00');
INSERT INTO `course` VALUES (162, 'user/user/image/ganyu-h-6.jpg', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 162', 'Demo 162', 9000000, 5, 5, '2020-07-09 07:27:04');
INSERT INTO `course` VALUES (163, 'user/user/image/ganyu-h-6.jpg', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 163', 'Demo 163', 1000000, 0, 20, '2020-07-17 20:00:26');
INSERT INTO `course` VALUES (164, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 164', 'Demo 164', 2000000, 3, 3, '2019-11-12 16:28:02');
INSERT INTO `course` VALUES (165, 'user/user/image/ganyu-h-5.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 165', 'Demo 165', 3000000, 2, 53, '2020-08-20 17:28:14');
INSERT INTO `course` VALUES (166, 'user/user/image/ganyu-h-7.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 166', 'Demo 166', 4000000, 1, 30, '2020-04-05 18:15:10');
INSERT INTO `course` VALUES (167, 'user/user/image/ganyu-h-1.png', 'Với sự thịnh vượng hiện tại của Liyue, điều tự nhiên là sự hỗ trợ hoạt động của thành phố phù hợp với quy mô lớn của nó. Trong hàng thiên niên kỷ, từ các thành viên ban đầu của Seven Stars cho đến nay, tất cả họ đều tin tưởng thư ký của Yuehai Pavilion. C', b'0', 'Khóa học demo 167', 'Demo 167', 5000000, 1, 100, '2019-05-20 12:25:32');
INSERT INTO `course` VALUES (168, 'user/user/image/ganyu-h-8.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 168', 'Demo 168', 6000000, 2, 3, '2019-08-05 10:18:41');
INSERT INTO `course` VALUES (169, 'user/user/image/ganyu-h-6.jpg', 'Ganyu là một cung thủ có năng khiếu đặc biệt về những cú bắn chính xác. Sự thông thạo của anh ấy về nguyên tố Cryo cho phép tấn công mạnh mẽ. Đồng thời, khả năng của cô ấy giúp ích rất nhiều cho cô ấy và đồng minh của cô ấy trong khi chiến đấu. Với hàng t', b'0', 'Khóa học demo 169', 'Demo 169', 7000000, 3, 41, '2019-12-20 19:03:14');
INSERT INTO `course` VALUES (170, 'user/user/image/ganyu-h-3.png', 'Mặc dù tôi ghét các vị thần và không thích Adeptus đã ký hợp đồng với Archon Geo, một người như Ganyu đáng để tôi tôn trọng. Công việc của tôi là hoàn thành hợp đồng với Rex Lapis và bảo vệ quyền lợi của tất cả các sinh vật sống ở Liyue. Mặc dù tuyên bố r', b'0', 'Khóa học demo 170', 'Demo 170', 8000000, 0, 70, '2020-11-14 12:05:41');

-- ----------------------------
-- Table structure for ower_course
-- ----------------------------
DROP TABLE IF EXISTS `ower_course`;
CREATE TABLE `ower_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `course_id_uq`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `ower_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ower_course_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ower_course
-- ----------------------------
INSERT INTO `ower_course` VALUES (1, 1, 1);
INSERT INTO `ower_course` VALUES (2, 1, 2);
INSERT INTO `ower_course` VALUES (3, 1, 3);
INSERT INTO `ower_course` VALUES (4, 1, 4);
INSERT INTO `ower_course` VALUES (5, 1, 5);
INSERT INTO `ower_course` VALUES (6, 1, 6);
INSERT INTO `ower_course` VALUES (7, 1, 7);
INSERT INTO `ower_course` VALUES (8, 1, 8);
INSERT INTO `ower_course` VALUES (9, 1, 9);
INSERT INTO `ower_course` VALUES (10, 1, 10);
INSERT INTO `ower_course` VALUES (11, 1, 11);
INSERT INTO `ower_course` VALUES (12, 1, 12);
INSERT INTO `ower_course` VALUES (13, 1, 13);
INSERT INTO `ower_course` VALUES (14, 1, 14);
INSERT INTO `ower_course` VALUES (15, 1, 15);
INSERT INTO `ower_course` VALUES (16, 1, 16);
INSERT INTO `ower_course` VALUES (17, 1, 17);
INSERT INTO `ower_course` VALUES (18, 1, 18);
INSERT INTO `ower_course` VALUES (19, 1, 19);
INSERT INTO `ower_course` VALUES (20, 1, 20);
INSERT INTO `ower_course` VALUES (21, 1, 21);
INSERT INTO `ower_course` VALUES (22, 1, 22);
INSERT INTO `ower_course` VALUES (23, 1, 23);
INSERT INTO `ower_course` VALUES (24, 1, 24);
INSERT INTO `ower_course` VALUES (25, 1, 25);
INSERT INTO `ower_course` VALUES (26, 1, 26);
INSERT INTO `ower_course` VALUES (27, 1, 27);
INSERT INTO `ower_course` VALUES (28, 1, 28);
INSERT INTO `ower_course` VALUES (29, 1, 29);
INSERT INTO `ower_course` VALUES (30, 1, 30);
INSERT INTO `ower_course` VALUES (31, 1, 31);
INSERT INTO `ower_course` VALUES (32, 1, 32);
INSERT INTO `ower_course` VALUES (33, 1, 33);
INSERT INTO `ower_course` VALUES (34, 1, 34);
INSERT INTO `ower_course` VALUES (35, 1, 35);
INSERT INTO `ower_course` VALUES (36, 1, 36);
INSERT INTO `ower_course` VALUES (37, 1, 37);
INSERT INTO `ower_course` VALUES (38, 1, 38);
INSERT INTO `ower_course` VALUES (39, 1, 39);
INSERT INTO `ower_course` VALUES (40, 1, 40);
INSERT INTO `ower_course` VALUES (41, 1, 41);
INSERT INTO `ower_course` VALUES (42, 1, 42);
INSERT INTO `ower_course` VALUES (43, 1, 43);
INSERT INTO `ower_course` VALUES (44, 1, 44);
INSERT INTO `ower_course` VALUES (45, 1, 45);
INSERT INTO `ower_course` VALUES (46, 1, 46);
INSERT INTO `ower_course` VALUES (47, 1, 47);
INSERT INTO `ower_course` VALUES (48, 1, 48);
INSERT INTO `ower_course` VALUES (49, 1, 49);
INSERT INTO `ower_course` VALUES (50, 1, 50);
INSERT INTO `ower_course` VALUES (51, 1, 51);
INSERT INTO `ower_course` VALUES (52, 1, 52);
INSERT INTO `ower_course` VALUES (53, 1, 53);
INSERT INTO `ower_course` VALUES (54, 1, 54);
INSERT INTO `ower_course` VALUES (55, 1, 55);
INSERT INTO `ower_course` VALUES (56, 1, 56);
INSERT INTO `ower_course` VALUES (57, 1, 57);
INSERT INTO `ower_course` VALUES (58, 1, 58);
INSERT INTO `ower_course` VALUES (59, 1, 59);
INSERT INTO `ower_course` VALUES (60, 1, 60);
INSERT INTO `ower_course` VALUES (61, 1, 61);
INSERT INTO `ower_course` VALUES (62, 1, 62);
INSERT INTO `ower_course` VALUES (63, 1, 63);
INSERT INTO `ower_course` VALUES (64, 1, 64);
INSERT INTO `ower_course` VALUES (65, 1, 65);
INSERT INTO `ower_course` VALUES (66, 1, 66);
INSERT INTO `ower_course` VALUES (67, 1, 67);
INSERT INTO `ower_course` VALUES (68, 1, 68);
INSERT INTO `ower_course` VALUES (69, 1, 69);
INSERT INTO `ower_course` VALUES (70, 1, 70);
INSERT INTO `ower_course` VALUES (71, 1, 71);
INSERT INTO `ower_course` VALUES (72, 1, 72);
INSERT INTO `ower_course` VALUES (73, 1, 73);
INSERT INTO `ower_course` VALUES (74, 1, 74);
INSERT INTO `ower_course` VALUES (75, 1, 75);
INSERT INTO `ower_course` VALUES (76, 1, 76);
INSERT INTO `ower_course` VALUES (77, 1, 77);
INSERT INTO `ower_course` VALUES (78, 1, 78);
INSERT INTO `ower_course` VALUES (79, 1, 79);
INSERT INTO `ower_course` VALUES (80, 1, 80);
INSERT INTO `ower_course` VALUES (81, 1, 81);
INSERT INTO `ower_course` VALUES (82, 1, 82);
INSERT INTO `ower_course` VALUES (83, 1, 83);
INSERT INTO `ower_course` VALUES (84, 1, 84);
INSERT INTO `ower_course` VALUES (85, 1, 85);
INSERT INTO `ower_course` VALUES (86, 1, 86);
INSERT INTO `ower_course` VALUES (87, 1, 87);
INSERT INTO `ower_course` VALUES (88, 1, 88);
INSERT INTO `ower_course` VALUES (89, 1, 89);
INSERT INTO `ower_course` VALUES (90, 1, 90);
INSERT INTO `ower_course` VALUES (91, 1, 91);
INSERT INTO `ower_course` VALUES (92, 1, 92);
INSERT INTO `ower_course` VALUES (93, 1, 93);
INSERT INTO `ower_course` VALUES (94, 1, 94);
INSERT INTO `ower_course` VALUES (95, 1, 95);
INSERT INTO `ower_course` VALUES (96, 1, 96);
INSERT INTO `ower_course` VALUES (97, 1, 97);
INSERT INTO `ower_course` VALUES (98, 1, 98);
INSERT INTO `ower_course` VALUES (99, 1, 99);
INSERT INTO `ower_course` VALUES (100, 1, 100);
INSERT INTO `ower_course` VALUES (101, 1, 101);
INSERT INTO `ower_course` VALUES (102, 1, 102);
INSERT INTO `ower_course` VALUES (103, 1, 103);
INSERT INTO `ower_course` VALUES (104, 1, 104);
INSERT INTO `ower_course` VALUES (105, 1, 105);
INSERT INTO `ower_course` VALUES (106, 1, 106);
INSERT INTO `ower_course` VALUES (107, 1, 107);
INSERT INTO `ower_course` VALUES (108, 1, 108);
INSERT INTO `ower_course` VALUES (109, 1, 109);
INSERT INTO `ower_course` VALUES (110, 1, 110);
INSERT INTO `ower_course` VALUES (111, 1, 111);
INSERT INTO `ower_course` VALUES (112, 1, 112);
INSERT INTO `ower_course` VALUES (113, 1, 113);
INSERT INTO `ower_course` VALUES (114, 1, 114);
INSERT INTO `ower_course` VALUES (115, 1, 115);
INSERT INTO `ower_course` VALUES (116, 1, 116);
INSERT INTO `ower_course` VALUES (117, 1, 117);
INSERT INTO `ower_course` VALUES (118, 1, 118);
INSERT INTO `ower_course` VALUES (119, 1, 119);
INSERT INTO `ower_course` VALUES (120, 1, 120);
INSERT INTO `ower_course` VALUES (121, 1, 121);
INSERT INTO `ower_course` VALUES (122, 1, 122);
INSERT INTO `ower_course` VALUES (123, 1, 123);
INSERT INTO `ower_course` VALUES (124, 1, 124);
INSERT INTO `ower_course` VALUES (125, 1, 125);
INSERT INTO `ower_course` VALUES (126, 1, 126);
INSERT INTO `ower_course` VALUES (127, 1, 127);
INSERT INTO `ower_course` VALUES (128, 1, 128);
INSERT INTO `ower_course` VALUES (129, 1, 129);
INSERT INTO `ower_course` VALUES (130, 1, 130);
INSERT INTO `ower_course` VALUES (131, 1, 131);
INSERT INTO `ower_course` VALUES (132, 1, 132);
INSERT INTO `ower_course` VALUES (133, 1, 133);
INSERT INTO `ower_course` VALUES (134, 1, 134);
INSERT INTO `ower_course` VALUES (135, 1, 135);
INSERT INTO `ower_course` VALUES (136, 1, 136);
INSERT INTO `ower_course` VALUES (137, 1, 137);
INSERT INTO `ower_course` VALUES (138, 1, 138);
INSERT INTO `ower_course` VALUES (139, 1, 139);
INSERT INTO `ower_course` VALUES (140, 1, 140);
INSERT INTO `ower_course` VALUES (141, 1, 141);
INSERT INTO `ower_course` VALUES (142, 1, 142);
INSERT INTO `ower_course` VALUES (143, 1, 143);
INSERT INTO `ower_course` VALUES (144, 1, 144);
INSERT INTO `ower_course` VALUES (145, 1, 145);
INSERT INTO `ower_course` VALUES (146, 1, 146);
INSERT INTO `ower_course` VALUES (147, 1, 147);
INSERT INTO `ower_course` VALUES (148, 1, 148);
INSERT INTO `ower_course` VALUES (149, 1, 149);
INSERT INTO `ower_course` VALUES (150, 1, 150);
INSERT INTO `ower_course` VALUES (151, 1, 151);
INSERT INTO `ower_course` VALUES (152, 1, 152);
INSERT INTO `ower_course` VALUES (153, 1, 153);
INSERT INTO `ower_course` VALUES (154, 1, 154);
INSERT INTO `ower_course` VALUES (155, 1, 155);
INSERT INTO `ower_course` VALUES (156, 1, 156);
INSERT INTO `ower_course` VALUES (157, 1, 157);
INSERT INTO `ower_course` VALUES (158, 1, 158);
INSERT INTO `ower_course` VALUES (159, 1, 159);
INSERT INTO `ower_course` VALUES (160, 1, 160);
INSERT INTO `ower_course` VALUES (161, 1, 161);
INSERT INTO `ower_course` VALUES (162, 1, 162);
INSERT INTO `ower_course` VALUES (163, 1, 163);
INSERT INTO `ower_course` VALUES (164, 1, 164);
INSERT INTO `ower_course` VALUES (165, 1, 165);
INSERT INTO `ower_course` VALUES (166, 1, 166);
INSERT INTO `ower_course` VALUES (167, 1, 167);
INSERT INTO `ower_course` VALUES (168, 1, 168);
INSERT INTO `ower_course` VALUES (169, 1, 169);
INSERT INTO `ower_course` VALUES (170, 1, 170);

-- ----------------------------
-- Table structure for request_reset_password
-- ----------------------------
DROP TABLE IF EXISTS `request_reset_password`;
CREATE TABLE `request_reset_password`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `request_reset_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of request_reset_password
-- ----------------------------
INSERT INTO `request_reset_password` VALUES (36, 30, '2021-03-22 16:49:11', '9bed089d4cc3afdc7cba517596a8d13c');
INSERT INTO `request_reset_password` VALUES (37, 30, '2021-03-22 16:51:25', 'f80813504b422b783411d217dca27803');
INSERT INTO `request_reset_password` VALUES (38, 30, '2021-03-22 16:55:13', '11570a4edb9ba7dd54a5961595d8344e');
INSERT INTO `request_reset_password` VALUES (39, 30, '2021-03-22 17:07:24', '3dc25625fe095578b8c304012fa1dccd');
INSERT INTO `request_reset_password` VALUES (40, 30, '2021-03-22 17:15:55', '73d765e7fdab569518b8cbd6ef997278');
INSERT INTO `request_reset_password` VALUES (41, 30, '2021-03-22 17:18:23', '6625fdce8706796bb97aadf2935cecae');
INSERT INTO `request_reset_password` VALUES (42, 30, '2021-03-22 17:18:47', 'da896c69d6709f61acbb79feec192542');
INSERT INTO `request_reset_password` VALUES (43, 30, '2021-03-22 17:19:33', '5bcdf649b382467c0bf22c4f12827a0a');
INSERT INTO `request_reset_password` VALUES (44, 30, '2021-03-22 17:20:45', '489ec2cafb3abeaef125d7c57b90bac1');
INSERT INTO `request_reset_password` VALUES (45, 2, '2021-03-26 17:57:07', 'df3343279d56bcba1d03ebfcbfe0c93f');
INSERT INTO `request_reset_password` VALUES (46, 2, '2021-03-26 17:57:50', '88bb9f9a77036eedb8ea5f2fe741ebd7');
INSERT INTO `request_reset_password` VALUES (47, 2, '2021-03-26 17:59:46', 'e4cda8e22531b46cea059ef0f878246c');
INSERT INTO `request_reset_password` VALUES (48, 2, '2021-03-27 12:06:44', 'c0906467d96609f1c95f31da9d7d18a2');
INSERT INTO `request_reset_password` VALUES (49, 2, '2021-03-27 12:09:19', '443387710ddbf5c46dc7d30b5896eae0');
INSERT INTO `request_reset_password` VALUES (50, 2, '2021-03-27 12:35:04', '98ec36e44a22ffd406c57759c294cb4d');
INSERT INTO `request_reset_password` VALUES (51, 2, '2021-04-01 16:11:47', '47b9f8a1a498405a378ed16b8c2292bf');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `test_uk`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (12, NULL);
INSERT INTO `test` VALUES (13, b'1');

-- ----------------------------
-- Table structure for user_course
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `USER_COURSE_UK`(`user_id`, `course_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `user_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_course
-- ----------------------------
INSERT INTO `user_course` VALUES (1, 1, 1);
INSERT INTO `user_course` VALUES (2, 1, 2);
INSERT INTO `user_course` VALUES (3, 1, 3);
INSERT INTO `user_course` VALUES (4, 1, 4);
INSERT INTO `user_course` VALUES (5, 1, 5);
INSERT INTO `user_course` VALUES (6, 1, 6);
INSERT INTO `user_course` VALUES (7, 1, 7);
INSERT INTO `user_course` VALUES (8, 1, 8);
INSERT INTO `user_course` VALUES (9, 1, 9);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `USER_ROLE_UK`(`USER_ID`, `ROLE_ID`) USING BTREE,
  INDEX `USER_ROLE_FK2`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `app_role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_3` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `duration` int(255) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

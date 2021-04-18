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

 Date: 16/04/2021 15:44:00
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
  `avatar_id` bigint(20) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  UNIQUE INDEX `APP_USER_UK`(`USER_NAME`) USING BTREE,
  UNIQUE INDEX `email_uq`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (1, 'admin', 'dQNjUIMorJb8Ubj2+wVGYp6eAeYkdekqAcnYp+aRq5w=', b'1', 1, b'0', 'tanhoang99.999@gmail.com');
INSERT INTO `app_user` VALUES (2, 'user', 'cBrlgyL2GI2GINuLUUwgojITuIufFycpLG4490dhGtY=', b'1', 1, b'0', 'hearterzouest99.999@gmail.com');
INSERT INTO `app_user` VALUES (28, 'hello', 'Wwtf1LEt+oBYjbew/WeFdU+HFW+oMIGDhTy+E6Q0f4Q=', b'1', 1, b'0', 'test@gmail.com');
INSERT INTO `app_user` VALUES (30, 'sang', '3sPcFxUAEJv0+aHpLnEa87B8F9Dbo03RG9mPyIGGGtk=', b'1', 1, b'0', 'anonkill1999@gmail.com');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `deleted` bit(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 0) UNSIGNED NOT NULL,
  `rate_star` double(1, 0) UNSIGNED NOT NULL DEFAULT 0,
  `bought` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_at` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `poster_id` bigint(20) NOT NULL,
  `demo_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '10', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 1', 'Demo 1', 12845000, 1, 66, '2019-10-08 17:51:59', 2, NULL);
INSERT INTO `course` VALUES (2, '5', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 2', 'Demo 2', 12288000, 5, 88, '2019-02-03 22:20:54', 2, NULL);
INSERT INTO `course` VALUES (3, '10', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 3', 'Demo 3', 14929000, 5, 4, '2020-10-25 13:14:43', 2, NULL);
INSERT INTO `course` VALUES (4, '7', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 4', 'Demo 4', 4382000, 2, 0, '2019-12-19 15:45:06', 2, NULL);
INSERT INTO `course` VALUES (5, '7', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 5', 'Demo 5', 4172000, 5, 33, '2019-11-19 04:34:37', 2, NULL);
INSERT INTO `course` VALUES (6, '5', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 6', 'Demo 6', 5487000, 3, 89, '2019-05-17 05:12:53', 2, NULL);
INSERT INTO `course` VALUES (7, '8', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 7', 'Demo 7', 4233000, 0, 92, '2020-09-20 15:11:21', 2, NULL);
INSERT INTO `course` VALUES (8, '8', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 8', 'Demo 8', 4391000, 4, 8, '2019-07-18 22:46:10', 2, NULL);
INSERT INTO `course` VALUES (9, '4', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 9', 'Demo 9', 13756000, 5, 85, '2020-07-18 23:15:11', 2, NULL);
INSERT INTO `course` VALUES (10, '4', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 10', 'Demo 10', 6154000, 5, 59, '2020-12-27 16:51:58', 2, NULL);
INSERT INTO `course` VALUES (11, '4', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 11', 'Demo 11', 2462000, 1, 57, '2019-08-09 23:43:09', 2, NULL);
INSERT INTO `course` VALUES (12, '9', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 12', 'Demo 12', 3312000, 3, 17, '2019-11-03 13:48:52', 2, NULL);
INSERT INTO `course` VALUES (13, '4', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 13', 'Demo 13', 13238000, 4, 41, '2019-11-10 16:24:45', 2, NULL);
INSERT INTO `course` VALUES (14, '3', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 14', 'Demo 14', 7300000, 5, 91, '2020-04-08 12:19:46', 2, NULL);
INSERT INTO `course` VALUES (15, '8', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 15', 'Demo 15', 2532000, 3, 1, '2020-02-03 00:36:45', 2, NULL);
INSERT INTO `course` VALUES (16, '7', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 16', 'Demo 16', 2800000, 3, 47, '2020-01-08 17:22:10', 2, NULL);
INSERT INTO `course` VALUES (17, '2', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 17', 'Demo 17', 5954000, 5, 91, '2019-03-16 10:42:38', 2, NULL);
INSERT INTO `course` VALUES (18, '10', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 18', 'Demo 18', 10419000, 1, 82, '2020-04-23 17:19:24', 2, NULL);
INSERT INTO `course` VALUES (19, '8', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 19', 'Demo 19', 14312000, 1, 13, '2020-09-04 09:42:36', 2, NULL);
INSERT INTO `course` VALUES (20, '4', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 20', 'Demo 20', 14976000, 5, 59, '2019-09-10 11:44:52', 2, NULL);
INSERT INTO `course` VALUES (21, '10', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 21', 'Demo 21', 2563000, 4, 88, '2019-08-21 10:21:29', 2, NULL);
INSERT INTO `course` VALUES (22, '10', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 22', 'Demo 22', 7672000, 2, 38, '2020-04-01 13:07:39', 2, NULL);
INSERT INTO `course` VALUES (23, '9', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 23', 'Demo 23', 3247000, 2, 57, '2019-09-26 17:59:34', 2, NULL);
INSERT INTO `course` VALUES (24, '4', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 24', 'Demo 24', 12605000, 5, 3, '2020-03-19 00:04:43', 2, NULL);
INSERT INTO `course` VALUES (25, '4', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 25', 'Demo 25', 13641000, 0, 19, '2019-11-09 13:23:32', 2, NULL);
INSERT INTO `course` VALUES (26, '5', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 26', 'Demo 26', 10305000, 3, 10, '2019-05-07 14:56:25', 2, NULL);
INSERT INTO `course` VALUES (27, '6', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 27', 'Demo 27', 9571000, 5, 44, '2020-07-18 15:42:21', 2, NULL);
INSERT INTO `course` VALUES (28, '4', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 28', 'Demo 28', 7109000, 0, 27, '2019-04-10 21:53:51', 2, NULL);
INSERT INTO `course` VALUES (29, '2', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 29', 'Demo 29', 7184000, 4, 36, '2019-06-22 05:20:33', 2, NULL);
INSERT INTO `course` VALUES (30, '4', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 30', 'Demo 30', 1389000, 4, 61, '2020-07-22 08:48:36', 2, NULL);
INSERT INTO `course` VALUES (31, '2', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 31', 'Demo 31', 5308000, 3, 72, '2020-09-26 07:17:13', 2, NULL);
INSERT INTO `course` VALUES (32, '4', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 32', 'Demo 32', 4657000, 3, 10, '2020-10-24 05:42:58', 2, NULL);
INSERT INTO `course` VALUES (33, '2', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 33', 'Demo 33', 7485000, 0, 39, '2019-03-10 02:56:36', 2, NULL);
INSERT INTO `course` VALUES (34, '8', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 34', 'Demo 34', 6508000, 5, 26, '2019-10-21 01:31:06', 2, NULL);
INSERT INTO `course` VALUES (35, '10', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 35', 'Demo 35', 10056000, 3, 61, '2020-03-04 23:31:52', 2, NULL);
INSERT INTO `course` VALUES (36, '9', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 36', 'Demo 36', 7615000, 4, 68, '2020-02-21 20:54:33', 2, NULL);
INSERT INTO `course` VALUES (37, '9', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 37', 'Demo 37', 1525000, 1, 3, '2019-12-07 22:12:22', 2, NULL);
INSERT INTO `course` VALUES (38, '2', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 38', 'Demo 38', 13154000, 3, 61, '2019-05-04 05:38:01', 2, NULL);
INSERT INTO `course` VALUES (39, '10', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 39', 'Demo 39', 14878000, 0, 36, '2019-01-11 09:06:53', 2, NULL);
INSERT INTO `course` VALUES (40, '6', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 40', 'Demo 40', 3910000, 5, 16, '2019-09-13 09:05:06', 2, NULL);
INSERT INTO `course` VALUES (41, '2', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 41', 'Demo 41', 5919000, 0, 39, '2020-06-14 00:04:40', 2, NULL);
INSERT INTO `course` VALUES (42, '5', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 42', 'Demo 42', 7545000, 0, 84, '2019-02-20 23:05:11', 2, NULL);
INSERT INTO `course` VALUES (43, '3', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 43', 'Demo 43', 2724000, 2, 32, '2019-10-14 02:21:09', 2, NULL);
INSERT INTO `course` VALUES (44, '2', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 44', 'Demo 44', 11915000, 2, 70, '2020-12-22 13:19:30', 2, NULL);
INSERT INTO `course` VALUES (45, '7', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 45', 'Demo 45', 1801000, 3, 28, '2020-07-22 13:58:23', 2, NULL);
INSERT INTO `course` VALUES (46, '7', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 46', 'Demo 46', 11453000, 0, 35, '2019-04-17 16:45:52', 2, NULL);
INSERT INTO `course` VALUES (47, '9', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 47', 'Demo 47', 9642000, 2, 62, '2019-02-10 15:49:58', 2, NULL);
INSERT INTO `course` VALUES (48, '5', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 48', 'Demo 48', 12077000, 4, 50, '2019-05-27 14:45:43', 2, NULL);
INSERT INTO `course` VALUES (49, '6', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 49', 'Demo 49', 3534000, 4, 69, '2019-04-02 03:48:03', 2, NULL);
INSERT INTO `course` VALUES (50, '7', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 50', 'Demo 50', 7589000, 3, 29, '2020-03-12 10:56:34', 2, NULL);
INSERT INTO `course` VALUES (51, '3', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 51', 'Demo 51', 12339000, 4, 25, '2019-10-27 02:21:34', 2, NULL);
INSERT INTO `course` VALUES (52, '9', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 52', 'Demo 52', 2942000, 0, 61, '2019-03-03 15:27:41', 2, NULL);
INSERT INTO `course` VALUES (53, '7', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 53', 'Demo 53', 904000, 1, 98, '2020-02-28 16:02:19', 2, NULL);
INSERT INTO `course` VALUES (54, '7', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 54', 'Demo 54', 2078000, 0, 15, '2019-04-07 10:07:06', 2, NULL);
INSERT INTO `course` VALUES (55, '3', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 55', 'Demo 55', 6516000, 0, 52, '2019-08-24 10:47:50', 2, NULL);
INSERT INTO `course` VALUES (56, '2', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 56', 'Demo 56', 8357000, 5, 95, '2020-10-01 12:44:37', 2, NULL);
INSERT INTO `course` VALUES (57, '6', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 57', 'Demo 57', 429000, 4, 66, '2020-12-07 16:27:51', 2, NULL);
INSERT INTO `course` VALUES (58, '10', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 58', 'Demo 58', 6443000, 1, 53, '2019-03-17 14:13:49', 2, NULL);
INSERT INTO `course` VALUES (59, '2', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 59', 'Demo 59', 5652000, 1, 79, '2020-02-19 08:30:37', 2, NULL);
INSERT INTO `course` VALUES (60, '10', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 60', 'Demo 60', 1657000, 0, 56, '2019-06-12 20:44:41', 2, NULL);
INSERT INTO `course` VALUES (61, '9', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 61', 'Demo 61', 7801000, 0, 89, '2020-01-14 03:43:20', 2, NULL);
INSERT INTO `course` VALUES (62, '2', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 62', 'Demo 62', 13757000, 3, 36, '2019-05-25 19:54:43', 2, NULL);
INSERT INTO `course` VALUES (63, '7', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 63', 'Demo 63', 3034000, 0, 15, '2019-09-11 18:05:53', 2, NULL);
INSERT INTO `course` VALUES (64, '8', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 64', 'Demo 64', 5199000, 5, 32, '2020-12-06 09:31:09', 2, NULL);
INSERT INTO `course` VALUES (65, '6', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 65', 'Demo 65', 4711000, 2, 73, '2019-03-07 16:27:44', 2, NULL);
INSERT INTO `course` VALUES (66, '10', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 66', 'Demo 66', 10435000, 2, 60, '2019-01-02 17:29:07', 2, NULL);
INSERT INTO `course` VALUES (67, '7', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 67', 'Demo 67', 12744000, 1, 52, '2019-11-25 06:29:58', 2, NULL);
INSERT INTO `course` VALUES (68, '7', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 68', 'Demo 68', 12699000, 4, 35, '2020-09-27 09:32:02', 2, NULL);
INSERT INTO `course` VALUES (69, '5', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 69', 'Demo 69', 3297000, 5, 89, '2019-03-04 16:01:53', 2, NULL);
INSERT INTO `course` VALUES (70, '6', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 70', 'Demo 70', 6332000, 2, 66, '2020-12-09 01:15:45', 2, NULL);
INSERT INTO `course` VALUES (71, '9', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 71', 'Demo 71', 7122000, 2, 1, '2020-10-23 22:40:51', 2, NULL);
INSERT INTO `course` VALUES (72, '7', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 72', 'Demo 72', 8977000, 0, 66, '2020-11-25 11:21:39', 2, NULL);
INSERT INTO `course` VALUES (73, '10', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 73', 'Demo 73', 8996000, 0, 58, '2020-09-14 14:46:33', 2, NULL);
INSERT INTO `course` VALUES (74, '10', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 74', 'Demo 74', 4556000, 1, 1, '2019-10-22 19:10:24', 2, NULL);
INSERT INTO `course` VALUES (75, '2', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 75', 'Demo 75', 13823000, 4, 32, '2019-08-27 01:28:50', 2, NULL);
INSERT INTO `course` VALUES (76, '8', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 76', 'Demo 76', 11196000, 5, 46, '2019-11-22 20:07:46', 2, NULL);
INSERT INTO `course` VALUES (77, '8', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 77', 'Demo 77', 8066000, 4, 34, '2019-06-02 11:58:52', 2, NULL);
INSERT INTO `course` VALUES (78, '10', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 78', 'Demo 78', 12731000, 5, 9, '2019-10-06 20:54:55', 2, NULL);
INSERT INTO `course` VALUES (79, '8', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 79', 'Demo 79', 10985000, 0, 47, '2019-01-19 15:29:31', 2, NULL);
INSERT INTO `course` VALUES (80, '6', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 80', 'Demo 80', 6147000, 0, 11, '2020-05-13 21:17:32', 2, NULL);
INSERT INTO `course` VALUES (81, '7', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 81', 'Demo 81', 11310000, 5, 39, '2020-09-17 22:53:41', 2, NULL);
INSERT INTO `course` VALUES (82, '9', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 82', 'Demo 82', 12980000, 4, 48, '2019-01-27 08:25:27', 2, NULL);
INSERT INTO `course` VALUES (83, '10', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 83', 'Demo 83', 12597000, 0, 62, '2019-02-12 05:58:06', 2, NULL);
INSERT INTO `course` VALUES (84, '4', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 84', 'Demo 84', 4227000, 3, 32, '2019-12-13 12:20:26', 2, NULL);
INSERT INTO `course` VALUES (85, '2', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 85', 'Demo 85', 10733000, 4, 28, '2019-09-15 19:02:11', 2, NULL);
INSERT INTO `course` VALUES (86, '9', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 86', 'Demo 86', 14258000, 3, 87, '2020-07-16 16:10:21', 2, NULL);
INSERT INTO `course` VALUES (87, '5', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 87', 'Demo 87', 3223000, 4, 60, '2019-10-20 19:39:28', 2, NULL);
INSERT INTO `course` VALUES (88, '8', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 88', 'Demo 88', 4146000, 2, 3, '2020-09-12 12:32:16', 2, NULL);
INSERT INTO `course` VALUES (89, '2', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 89', 'Demo 89', 13213000, 1, 82, '2019-12-19 12:56:09', 2, NULL);
INSERT INTO `course` VALUES (90, '8', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 90', 'Demo 90', 6813000, 0, 28, '2019-02-11 01:04:26', 2, NULL);
INSERT INTO `course` VALUES (91, '6', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 91', 'Demo 91', 6703000, 1, 62, '2019-07-11 06:52:01', 2, NULL);
INSERT INTO `course` VALUES (92, '10', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 92', 'Demo 92', 12974000, 0, 58, '2020-10-23 02:42:38', 2, NULL);
INSERT INTO `course` VALUES (93, '4', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 93', 'Demo 93', 3080000, 1, 29, '2020-03-11 11:40:02', 2, NULL);
INSERT INTO `course` VALUES (94, '4', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 94', 'Demo 94', 9757000, 0, 85, '2020-02-27 06:03:14', 2, NULL);
INSERT INTO `course` VALUES (95, '6', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 95', 'Demo 95', 2627000, 4, 3, '2020-01-27 16:59:40', 2, NULL);
INSERT INTO `course` VALUES (96, '2', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 96', 'Demo 96', 12257000, 0, 66, '2020-02-23 14:44:28', 2, NULL);
INSERT INTO `course` VALUES (97, '9', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 97', 'Demo 97', 8108000, 0, 10, '2019-03-28 06:07:10', 2, NULL);
INSERT INTO `course` VALUES (98, '2', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 98', 'Demo 98', 8844000, 5, 66, '2020-12-03 13:56:06', 2, NULL);
INSERT INTO `course` VALUES (99, '3', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 99', 'Demo 99', 674000, 1, 61, '2019-02-10 17:27:57', 2, NULL);
INSERT INTO `course` VALUES (100, '9', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 100', 'Demo 100', 14916000, 2, 38, '2019-12-07 00:04:46', 2, NULL);
INSERT INTO `course` VALUES (101, '6', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 101', 'Demo 101', 7320000, 1, 42, '2020-10-10 09:49:08', 2, NULL);
INSERT INTO `course` VALUES (102, '7', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 102', 'Demo 102', 12593000, 1, 10, '2019-06-18 08:23:22', 2, NULL);
INSERT INTO `course` VALUES (103, '5', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 103', 'Demo 103', 3956000, 3, 69, '2019-09-05 12:57:43', 2, NULL);
INSERT INTO `course` VALUES (104, '4', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 104', 'Demo 104', 14978000, 2, 51, '2019-01-22 08:34:57', 2, NULL);
INSERT INTO `course` VALUES (105, '9', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 105', 'Demo 105', 7367000, 5, 57, '2020-01-23 17:15:40', 2, NULL);
INSERT INTO `course` VALUES (106, '8', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 106', 'Demo 106', 8807000, 0, 45, '2020-05-08 00:07:33', 2, NULL);
INSERT INTO `course` VALUES (107, '5', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 107', 'Demo 107', 3964000, 1, 77, '2020-06-04 02:36:46', 2, NULL);
INSERT INTO `course` VALUES (108, '7', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 108', 'Demo 108', 10797000, 2, 99, '2020-01-27 12:44:25', 2, NULL);
INSERT INTO `course` VALUES (109, '9', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 109', 'Demo 109', 5210000, 4, 48, '2020-11-06 17:06:56', 2, NULL);
INSERT INTO `course` VALUES (110, '5', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 110', 'Demo 110', 8229000, 1, 39, '2019-06-22 20:24:22', 2, NULL);
INSERT INTO `course` VALUES (111, '9', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 111', 'Demo 111', 7533000, 3, 82, '2019-09-15 15:50:14', 2, NULL);
INSERT INTO `course` VALUES (112, '4', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 112', 'Demo 112', 10012000, 4, 99, '2019-06-27 19:55:29', 2, NULL);
INSERT INTO `course` VALUES (113, '2', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 113', 'Demo 113', 10821000, 5, 76, '2019-01-16 00:47:12', 2, NULL);
INSERT INTO `course` VALUES (114, '6', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 114', 'Demo 114', 2735000, 2, 50, '2019-02-22 07:28:45', 2, NULL);
INSERT INTO `course` VALUES (115, '4', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 115', 'Demo 115', 1315000, 3, 37, '2019-02-04 02:26:25', 2, NULL);
INSERT INTO `course` VALUES (116, '10', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 116', 'Demo 116', 12823000, 3, 1, '2019-10-01 04:05:41', 2, NULL);
INSERT INTO `course` VALUES (117, '4', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 117', 'Demo 117', 5076000, 5, 71, '2019-03-01 10:48:21', 2, NULL);
INSERT INTO `course` VALUES (118, '3', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 118', 'Demo 118', 12674000, 3, 41, '2019-09-21 22:10:04', 2, NULL);
INSERT INTO `course` VALUES (119, '5', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 119', 'Demo 119', 6192000, 1, 71, '2020-04-17 02:54:54', 2, NULL);
INSERT INTO `course` VALUES (120, '9', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 120', 'Demo 120', 6683000, 3, 17, '2020-06-16 06:51:44', 2, NULL);
INSERT INTO `course` VALUES (121, '10', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 121', 'Demo 121', 13992000, 5, 42, '2019-01-18 10:40:54', 2, NULL);
INSERT INTO `course` VALUES (122, '6', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 122', 'Demo 122', 2423000, 3, 64, '2019-08-11 12:16:12', 2, NULL);
INSERT INTO `course` VALUES (123, '10', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 123', 'Demo 123', 9741000, 0, 48, '2019-08-03 04:35:50', 2, NULL);
INSERT INTO `course` VALUES (124, '5', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 124', 'Demo 124', 12638000, 3, 89, '2019-11-25 05:15:00', 2, NULL);
INSERT INTO `course` VALUES (125, '9', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 125', 'Demo 125', 5720000, 2, 28, '2020-09-17 05:57:19', 2, NULL);
INSERT INTO `course` VALUES (126, '2', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 126', 'Demo 126', 5369000, 3, 44, '2020-09-22 10:47:46', 2, NULL);
INSERT INTO `course` VALUES (127, '4', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 127', 'Demo 127', 14245000, 0, 42, '2019-04-07 12:35:42', 2, NULL);
INSERT INTO `course` VALUES (128, '7', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 128', 'Demo 128', 7815000, 4, 78, '2019-02-23 15:55:58', 2, NULL);
INSERT INTO `course` VALUES (129, '4', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 129', 'Demo 129', 2030000, 1, 5, '2020-01-19 18:53:08', 2, NULL);
INSERT INTO `course` VALUES (130, '10', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 130', 'Demo 130', 13389000, 5, 33, '2020-05-27 20:05:26', 2, NULL);
INSERT INTO `course` VALUES (131, '10', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 131', 'Demo 131', 3204000, 1, 40, '2019-07-16 14:34:34', 2, NULL);
INSERT INTO `course` VALUES (132, '4', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 132', 'Demo 132', 8463000, 4, 82, '2019-05-13 18:17:09', 2, NULL);
INSERT INTO `course` VALUES (133, '10', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 133', 'Demo 133', 2295000, 5, 62, '2020-01-22 04:11:24', 2, NULL);
INSERT INTO `course` VALUES (134, '6', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 134', 'Demo 134', 10776000, 0, 47, '2020-10-21 07:59:44', 2, NULL);
INSERT INTO `course` VALUES (135, '8', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 135', 'Demo 135', 14565000, 4, 23, '2019-07-19 17:30:53', 2, NULL);
INSERT INTO `course` VALUES (136, '8', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 136', 'Demo 136', 5324000, 2, 79, '2020-04-08 00:20:05', 2, NULL);
INSERT INTO `course` VALUES (137, '3', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 137', 'Demo 137', 7429000, 3, 100, '2020-08-08 04:53:34', 2, NULL);
INSERT INTO `course` VALUES (138, '8', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 138', 'Demo 138', 10839000, 2, 68, '2020-07-05 06:54:31', 2, NULL);
INSERT INTO `course` VALUES (139, '5', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 139', 'Demo 139', 4690000, 3, 88, '2019-07-17 12:49:09', 2, NULL);
INSERT INTO `course` VALUES (140, '10', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 140', 'Demo 140', 10257000, 1, 51, '2019-11-04 20:13:56', 2, NULL);
INSERT INTO `course` VALUES (141, '8', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 141', 'Demo 141', 3754000, 2, 37, '2019-12-16 17:17:44', 2, NULL);
INSERT INTO `course` VALUES (142, '5', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 142', 'Demo 142', 14365000, 3, 10, '2020-11-13 09:14:31', 2, NULL);
INSERT INTO `course` VALUES (143, '4', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 143', 'Demo 143', 2646000, 5, 57, '2020-03-19 09:39:08', 2, NULL);
INSERT INTO `course` VALUES (144, '2', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 144', 'Demo 144', 1813000, 1, 92, '2019-04-15 00:02:10', 2, NULL);
INSERT INTO `course` VALUES (145, '6', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 145', 'Demo 145', 12608000, 4, 58, '2019-01-01 02:30:18', 2, NULL);
INSERT INTO `course` VALUES (146, '8', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 146', 'Demo 146', 5325000, 5, 47, '2019-05-18 22:03:33', 2, NULL);
INSERT INTO `course` VALUES (147, '8', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 147', 'Demo 147', 11340000, 1, 85, '2019-12-25 09:50:59', 2, NULL);
INSERT INTO `course` VALUES (148, '6', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 148', 'Demo 148', 13030000, 0, 36, '2019-03-15 14:22:52', 2, NULL);
INSERT INTO `course` VALUES (149, '3', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 149', 'Demo 149', 14890000, 5, 78, '2019-01-21 20:24:08', 2, NULL);
INSERT INTO `course` VALUES (150, '6', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 150', 'Demo 150', 11735000, 5, 92, '2020-06-03 13:40:56', 2, NULL);
INSERT INTO `course` VALUES (151, '9', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 151', 'Demo 151', 13892000, 2, 21, '2020-03-07 13:32:40', 2, NULL);
INSERT INTO `course` VALUES (152, '10', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 152', 'Demo 152', 11053000, 2, 41, '2019-01-13 00:42:54', 2, NULL);
INSERT INTO `course` VALUES (153, '6', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 153', 'Demo 153', 5501000, 2, 29, '2019-07-28 06:37:36', 2, NULL);
INSERT INTO `course` VALUES (154, '3', 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Khóa học demo 154', 'Demo 154', 8593000, 3, 29, '2020-08-13 13:29:43', 2, NULL);
INSERT INTO `course` VALUES (155, '8', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 155', 'Demo 155', 2199000, 5, 71, '2020-12-06 20:49:25', 2, NULL);
INSERT INTO `course` VALUES (156, '10', 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Khóa học demo 156', 'Demo 156', 10471000, 0, 94, '2020-05-14 21:26:24', 2, NULL);
INSERT INTO `course` VALUES (157, '10', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 157', 'Demo 157', 4461000, 4, 56, '2019-02-18 21:13:06', 2, NULL);
INSERT INTO `course` VALUES (158, '3', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 158', 'Demo 158', 13436000, 1, 56, '2020-08-25 02:22:55', 2, NULL);
INSERT INTO `course` VALUES (159, '6', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 159', 'Demo 159', 12428000, 1, 70, '2019-04-20 14:15:53', 2, NULL);
INSERT INTO `course` VALUES (160, '5', 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Khóa học demo 160', 'Demo 160', 3175000, 1, 41, '2020-07-12 07:23:45', 2, NULL);
INSERT INTO `course` VALUES (161, '4', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 161', 'Demo 161', 14063000, 0, 42, '2020-01-05 13:35:00', 2, NULL);
INSERT INTO `course` VALUES (162, '7', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 162', 'Demo 162', 4704000, 5, 5, '2020-07-09 07:27:04', 2, NULL);
INSERT INTO `course` VALUES (163, '9', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 163', 'Demo 163', 9372000, 0, 20, '2020-07-17 20:00:26', 2, NULL);
INSERT INTO `course` VALUES (164, '2', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 164', 'Demo 164', 4539000, 3, 3, '2019-11-12 16:28:02', 2, NULL);
INSERT INTO `course` VALUES (165, '2', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 165', 'Demo 165', 6026000, 2, 53, '2020-08-20 17:28:14', 2, NULL);
INSERT INTO `course` VALUES (166, '6', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 166', 'Demo 166', 8734000, 1, 30, '2020-04-05 18:15:10', 2, NULL);
INSERT INTO `course` VALUES (167, '4', 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Khóa học demo 167', 'Demo 167', 14691000, 1, 100, '2019-05-20 12:25:32', 2, NULL);
INSERT INTO `course` VALUES (168, '7', 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Khóa học demo 168', 'Demo 168', 3276000, 2, 3, '2019-08-05 10:18:41', 2, NULL);
INSERT INTO `course` VALUES (169, '2', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Khóa học demo 169', 'Demo 169', 3712000, 3, 41, '2019-12-20 19:03:14', 2, NULL);
INSERT INTO `course` VALUES (170, '6', 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Khóa học demo 170', 'Demo 170', 13879000, 0, 70, '2020-11-14 12:05:41', 2, NULL);
INSERT INTO `course` VALUES (171, '11', 'Kiến thức cơ bản dành cho dân IT, không phân biệt bạn theo Front-end, Back-end hay Devops', b'0', '', 'Kiến thức cơ bản, cốt lõi dân IT cần học trước', 10857000, 0, 0, '2021-04-22 23:36:51', 1, 1);

-- ----------------------------
-- Table structure for learning
-- ----------------------------
DROP TABLE IF EXISTS `learning`;
CREATE TABLE `learning`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `learning` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of learning
-- ----------------------------
INSERT INTO `learning` VALUES (1, '171', 'Các kiến thức cơ bản, nền móng của ngành IT');
INSERT INTO `learning` VALUES (2, '171', 'Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng');
INSERT INTO `learning` VALUES (3, '171', 'Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng');
INSERT INTO `learning` VALUES (4, '171', 'Hiểu hơn về cách internet và máy vi tính hoạt động');

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `duration` bigint(20) NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES (1, 1, '8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!', 387, '8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!.mp4');
INSERT INTO `lesson` VALUES (2, 1, 'Phương pháp & quan điểm học lập trình của Sơn Đặng', 1445, NULL);
INSERT INTO `lesson` VALUES (3, 2, 'Làm sao để có thu nhập cao và đi xa hơn trong ngành IT?', 1539, NULL);
INSERT INTO `lesson` VALUES (4, 3, 'Mô hình Client - Server', 695, NULL);
INSERT INTO `lesson` VALUES (5, 3, 'Domain là gì? Bạn đã thật sự hiểu về domain?', 633, NULL);
INSERT INTO `lesson` VALUES (6, 4, 'Trang web này sử dụng những công nghệ gì?', 1252, NULL);
INSERT INTO `lesson` VALUES (7, 4, 'Quản lý thư mục dự án trên máy tính và VSCode hiệu quả hơn', 709, NULL);
INSERT INTO `lesson` VALUES (8, 4, 'Học IT cần tố chất gì?', 1449, NULL);

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
INSERT INTO `ower_course` VALUES (1, 2, 1);
INSERT INTO `ower_course` VALUES (2, 2, 2);
INSERT INTO `ower_course` VALUES (3, 2, 3);
INSERT INTO `ower_course` VALUES (4, 2, 4);
INSERT INTO `ower_course` VALUES (5, 2, 5);
INSERT INTO `ower_course` VALUES (6, 2, 6);
INSERT INTO `ower_course` VALUES (7, 2, 7);
INSERT INTO `ower_course` VALUES (8, 2, 8);
INSERT INTO `ower_course` VALUES (9, 2, 9);
INSERT INTO `ower_course` VALUES (10, 2, 10);
INSERT INTO `ower_course` VALUES (11, 2, 11);
INSERT INTO `ower_course` VALUES (12, 2, 12);
INSERT INTO `ower_course` VALUES (13, 2, 13);
INSERT INTO `ower_course` VALUES (14, 2, 14);
INSERT INTO `ower_course` VALUES (15, 2, 15);
INSERT INTO `ower_course` VALUES (16, 2, 16);
INSERT INTO `ower_course` VALUES (17, 2, 17);
INSERT INTO `ower_course` VALUES (18, 2, 18);
INSERT INTO `ower_course` VALUES (19, 2, 19);
INSERT INTO `ower_course` VALUES (20, 2, 20);
INSERT INTO `ower_course` VALUES (21, 2, 21);
INSERT INTO `ower_course` VALUES (22, 2, 22);
INSERT INTO `ower_course` VALUES (23, 2, 23);
INSERT INTO `ower_course` VALUES (24, 2, 24);
INSERT INTO `ower_course` VALUES (25, 2, 25);
INSERT INTO `ower_course` VALUES (26, 2, 26);
INSERT INTO `ower_course` VALUES (27, 2, 27);
INSERT INTO `ower_course` VALUES (28, 2, 28);
INSERT INTO `ower_course` VALUES (29, 2, 29);
INSERT INTO `ower_course` VALUES (30, 2, 30);
INSERT INTO `ower_course` VALUES (31, 2, 31);
INSERT INTO `ower_course` VALUES (32, 2, 32);
INSERT INTO `ower_course` VALUES (33, 2, 33);
INSERT INTO `ower_course` VALUES (34, 2, 34);
INSERT INTO `ower_course` VALUES (35, 2, 35);
INSERT INTO `ower_course` VALUES (36, 2, 36);
INSERT INTO `ower_course` VALUES (37, 2, 37);
INSERT INTO `ower_course` VALUES (38, 2, 38);
INSERT INTO `ower_course` VALUES (39, 2, 39);
INSERT INTO `ower_course` VALUES (40, 2, 40);
INSERT INTO `ower_course` VALUES (41, 2, 41);
INSERT INTO `ower_course` VALUES (42, 2, 42);
INSERT INTO `ower_course` VALUES (43, 2, 43);
INSERT INTO `ower_course` VALUES (44, 2, 44);
INSERT INTO `ower_course` VALUES (45, 2, 45);
INSERT INTO `ower_course` VALUES (46, 2, 46);
INSERT INTO `ower_course` VALUES (47, 2, 47);
INSERT INTO `ower_course` VALUES (48, 2, 48);
INSERT INTO `ower_course` VALUES (49, 2, 49);
INSERT INTO `ower_course` VALUES (50, 2, 50);
INSERT INTO `ower_course` VALUES (51, 2, 51);
INSERT INTO `ower_course` VALUES (52, 2, 52);
INSERT INTO `ower_course` VALUES (53, 2, 53);
INSERT INTO `ower_course` VALUES (54, 2, 54);
INSERT INTO `ower_course` VALUES (55, 2, 55);
INSERT INTO `ower_course` VALUES (56, 2, 56);
INSERT INTO `ower_course` VALUES (57, 2, 57);
INSERT INTO `ower_course` VALUES (58, 2, 58);
INSERT INTO `ower_course` VALUES (59, 2, 59);
INSERT INTO `ower_course` VALUES (60, 2, 60);
INSERT INTO `ower_course` VALUES (61, 2, 61);
INSERT INTO `ower_course` VALUES (62, 2, 62);
INSERT INTO `ower_course` VALUES (63, 2, 63);
INSERT INTO `ower_course` VALUES (64, 2, 64);
INSERT INTO `ower_course` VALUES (65, 2, 65);
INSERT INTO `ower_course` VALUES (66, 2, 66);
INSERT INTO `ower_course` VALUES (67, 2, 67);
INSERT INTO `ower_course` VALUES (68, 2, 68);
INSERT INTO `ower_course` VALUES (69, 2, 69);
INSERT INTO `ower_course` VALUES (70, 2, 70);
INSERT INTO `ower_course` VALUES (71, 2, 71);
INSERT INTO `ower_course` VALUES (72, 2, 72);
INSERT INTO `ower_course` VALUES (73, 2, 73);
INSERT INTO `ower_course` VALUES (74, 2, 74);
INSERT INTO `ower_course` VALUES (75, 2, 75);
INSERT INTO `ower_course` VALUES (76, 2, 76);
INSERT INTO `ower_course` VALUES (77, 2, 77);
INSERT INTO `ower_course` VALUES (78, 2, 78);
INSERT INTO `ower_course` VALUES (79, 2, 79);
INSERT INTO `ower_course` VALUES (80, 2, 80);
INSERT INTO `ower_course` VALUES (81, 2, 81);
INSERT INTO `ower_course` VALUES (82, 2, 82);
INSERT INTO `ower_course` VALUES (83, 2, 83);
INSERT INTO `ower_course` VALUES (84, 2, 84);
INSERT INTO `ower_course` VALUES (85, 2, 85);
INSERT INTO `ower_course` VALUES (86, 2, 86);
INSERT INTO `ower_course` VALUES (87, 2, 87);
INSERT INTO `ower_course` VALUES (88, 2, 88);
INSERT INTO `ower_course` VALUES (89, 2, 89);
INSERT INTO `ower_course` VALUES (90, 2, 90);
INSERT INTO `ower_course` VALUES (91, 2, 91);
INSERT INTO `ower_course` VALUES (92, 2, 92);
INSERT INTO `ower_course` VALUES (93, 2, 93);
INSERT INTO `ower_course` VALUES (94, 2, 94);
INSERT INTO `ower_course` VALUES (95, 2, 95);
INSERT INTO `ower_course` VALUES (96, 2, 96);
INSERT INTO `ower_course` VALUES (97, 2, 97);
INSERT INTO `ower_course` VALUES (98, 2, 98);
INSERT INTO `ower_course` VALUES (99, 2, 99);
INSERT INTO `ower_course` VALUES (100, 2, 100);
INSERT INTO `ower_course` VALUES (101, 2, 101);
INSERT INTO `ower_course` VALUES (102, 2, 102);
INSERT INTO `ower_course` VALUES (103, 2, 103);
INSERT INTO `ower_course` VALUES (104, 2, 104);
INSERT INTO `ower_course` VALUES (105, 2, 105);
INSERT INTO `ower_course` VALUES (106, 2, 106);
INSERT INTO `ower_course` VALUES (107, 2, 107);
INSERT INTO `ower_course` VALUES (108, 2, 108);
INSERT INTO `ower_course` VALUES (109, 2, 109);
INSERT INTO `ower_course` VALUES (110, 2, 110);
INSERT INTO `ower_course` VALUES (111, 2, 111);
INSERT INTO `ower_course` VALUES (112, 2, 112);
INSERT INTO `ower_course` VALUES (113, 2, 113);
INSERT INTO `ower_course` VALUES (114, 2, 114);
INSERT INTO `ower_course` VALUES (115, 2, 115);
INSERT INTO `ower_course` VALUES (116, 2, 116);
INSERT INTO `ower_course` VALUES (117, 2, 117);
INSERT INTO `ower_course` VALUES (118, 2, 118);
INSERT INTO `ower_course` VALUES (119, 2, 119);
INSERT INTO `ower_course` VALUES (120, 2, 120);
INSERT INTO `ower_course` VALUES (121, 2, 121);
INSERT INTO `ower_course` VALUES (122, 2, 122);
INSERT INTO `ower_course` VALUES (123, 2, 123);
INSERT INTO `ower_course` VALUES (124, 2, 124);
INSERT INTO `ower_course` VALUES (125, 2, 125);
INSERT INTO `ower_course` VALUES (126, 2, 126);
INSERT INTO `ower_course` VALUES (127, 2, 127);
INSERT INTO `ower_course` VALUES (128, 2, 128);
INSERT INTO `ower_course` VALUES (129, 2, 129);
INSERT INTO `ower_course` VALUES (130, 2, 130);
INSERT INTO `ower_course` VALUES (131, 2, 131);
INSERT INTO `ower_course` VALUES (132, 2, 132);
INSERT INTO `ower_course` VALUES (133, 2, 133);
INSERT INTO `ower_course` VALUES (134, 2, 134);
INSERT INTO `ower_course` VALUES (135, 2, 135);
INSERT INTO `ower_course` VALUES (136, 2, 136);
INSERT INTO `ower_course` VALUES (137, 2, 137);
INSERT INTO `ower_course` VALUES (138, 2, 138);
INSERT INTO `ower_course` VALUES (139, 2, 139);
INSERT INTO `ower_course` VALUES (140, 2, 140);
INSERT INTO `ower_course` VALUES (141, 2, 141);
INSERT INTO `ower_course` VALUES (142, 2, 142);
INSERT INTO `ower_course` VALUES (143, 2, 143);
INSERT INTO `ower_course` VALUES (144, 2, 144);
INSERT INTO `ower_course` VALUES (145, 2, 145);
INSERT INTO `ower_course` VALUES (146, 2, 146);
INSERT INTO `ower_course` VALUES (147, 2, 147);
INSERT INTO `ower_course` VALUES (148, 2, 148);
INSERT INTO `ower_course` VALUES (149, 2, 149);
INSERT INTO `ower_course` VALUES (150, 2, 150);
INSERT INTO `ower_course` VALUES (151, 2, 151);
INSERT INTO `ower_course` VALUES (152, 2, 152);
INSERT INTO `ower_course` VALUES (153, 2, 153);
INSERT INTO `ower_course` VALUES (154, 2, 154);
INSERT INTO `ower_course` VALUES (155, 2, 155);
INSERT INTO `ower_course` VALUES (156, 2, 156);
INSERT INTO `ower_course` VALUES (157, 2, 157);
INSERT INTO `ower_course` VALUES (158, 2, 158);
INSERT INTO `ower_course` VALUES (159, 2, 159);
INSERT INTO `ower_course` VALUES (160, 2, 160);
INSERT INTO `ower_course` VALUES (161, 2, 161);
INSERT INTO `ower_course` VALUES (162, 2, 162);
INSERT INTO `ower_course` VALUES (163, 2, 163);
INSERT INTO `ower_course` VALUES (164, 2, 164);
INSERT INTO `ower_course` VALUES (165, 2, 165);
INSERT INTO `ower_course` VALUES (166, 2, 166);
INSERT INTO `ower_course` VALUES (167, 2, 167);
INSERT INTO `ower_course` VALUES (168, 2, 168);
INSERT INTO `ower_course` VALUES (169, 2, 169);
INSERT INTO `ower_course` VALUES (170, 2, 170);

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `number_lesson` int(11) NULL DEFAULT 0,
  `duration` decimal(65, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES (1, 171, 'Phương pháp học tập', 2, 1832000);
INSERT INTO `part` VALUES (2, 171, 'Tư duy phát triển', 1, 1539000);
INSERT INTO `part` VALUES (3, 171, 'Khái niệm kỹ thuật cần biết', 2, 1539000);
INSERT INTO `part` VALUES (4, 171, 'Tham khảo thêm', 3, 1539000);

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
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `request_reset_password` VALUES (52, 2, '2021-04-05 07:21:51', '8b6b88c3c50a96dce0691865c3b10e9f');
INSERT INTO `request_reset_password` VALUES (53, 1, '2021-04-05 07:30:19', '59bdbbf9c9e6e544a6da294f01796edc');

-- ----------------------------
-- Table structure for resource_image
-- ----------------------------
DROP TABLE IF EXISTS `resource_image`;
CREATE TABLE `resource_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `update_at` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_image
-- ----------------------------
INSERT INTO `resource_image` VALUES (1, 'image/default/momo.webp', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (2, 'user/user/image/ganyu-h-1.png', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (3, 'user/user/image/ganyu-h-2.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (4, 'user/user/image/ganyu-h-3.png', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (5, 'user/user/image/ganyu-h-4.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (6, 'user/user/image/ganyu-h-5.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (7, 'user/user/image/ganyu-h-6.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (8, 'user/user/image/ganyu-h-7.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (9, 'user/user/image/ganyu-h-8.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (10, 'user/user/image/ganyu-h-9.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (11, 'user/user/image/demo.jpg', b'0', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (12, 'image/default/momo.webp', b'1', '2021-04-05 14:48:50');
INSERT INTO `resource_image` VALUES (13, 'image/default/momo.webp', b'1', '2021-04-05 14:48:50');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, 'user/admin/video/mp4/toystory', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

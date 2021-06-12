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

 Date: 13/06/2021 01:55:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for active_account
-- ----------------------------
DROP TABLE IF EXISTS `active_account`;
CREATE TABLE `active_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alive` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `active_account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of active_account
-- ----------------------------
INSERT INTO `active_account` VALUES (89, 1, '2021-05-25 16:28:28', '8ea0418123cdd0d52eb89f19c39b06af', b'0');
INSERT INTO `active_account` VALUES (90, 2, '2021-05-27 10:46:29', 'b5208a7ee82c9d5d6ccb1b90175f6b71', b'0');
INSERT INTO `active_account` VALUES (94, 45, '2021-05-27 11:45:55', 'f2b75a186fea6156c9f9ca180b90426e', b'0');
INSERT INTO `active_account` VALUES (95, 1, '2021-05-27 16:35:33', '2f36d1ad7b6f9f427a04f8d7b42aca1c', b'0');
INSERT INTO `active_account` VALUES (96, 2, '2021-06-04 18:10:29', '0ceb05f4d6a91521c519f882c9ad6ee9', b'0');
INSERT INTO `active_account` VALUES (97, 2, '2021-06-04 18:26:12', '61e3b60389a39347c1968e5c7f488272', b'0');
INSERT INTO `active_account` VALUES (98, 2, '2021-06-04 18:28:02', 'a517d3b80ca8793a80f8b6dbf02f7f6b', b'0');
INSERT INTO `active_account` VALUES (99, 2, '2021-06-04 18:29:48', 'd296bc7258d3a0c684b821045c098c83', b'0');
INSERT INTO `active_account` VALUES (100, 2, '2021-06-04 18:33:47', '12d95e4f1085baaf6e268439620439a2', b'0');

-- ----------------------------
-- Table structure for app_role
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `APP_ROLE_UK`(`ROLE_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `avatar_id` bigint(20) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `actived` bit(1) NULL DEFAULT b'0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `birth_day` datetime(0) NULL DEFAULT utc_timestamp,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `APP_USER_UK`(`USER_NAME`) USING BTREE,
  UNIQUE INDEX `email_uq`(`email`) USING BTREE,
  INDEX `avatar_id`(`avatar_id`) USING BTREE,
  CONSTRAINT `app_user_ibfk_1` FOREIGN KEY (`avatar_id`) REFERENCES `resource_image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (1, 'admin', 'dQNjUIMorJb8Ubj2+wVGYp6eAeYkdekqAcnYp+aRq5w=', b'1', 1, b'0', 'tanhoang99.999@gmail.com', b'0', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', '2021-05-13 10:58:52', '0399115950', 'NAM', 'https://www.facebook.com/Hearter.Zouest', 'tanhoang99.999@gmail.com', '2021-05-19 15:37:37', '2021-05-19 15:37:37', NULL, NULL);
INSERT INTO `app_user` VALUES (2, 'user', 'cBrlgyL2GI2GINuLUUwgojITuIufFycpLG4490dhGtY=', b'1', 84, b'0', 'hearterzouest99.999@gmail.com', b'0', 'Saitama (One punch Man) là một siêu anh hùng dễ dàng đánh bại bất kỳ đối thủ nào với một cú đấm của mình. Anh là một chàng trai cơ bắp 25 tuổi và bị hói đầu, được biết do quá trình tập luyện quá mức của anh gây ra. Saitama thường xuyên cứu những người vô tội khỏi các quái vật xuất hiện trong thế giới của mình. Tuy nhiên, anh không bao giờ nhận được bất kỳ sự công nhận nào từ dân chúng, mặc dù cuối cùng anh gia nhập Hiệp hội siêu Anh hùng và kể từ đó đã tăng lên đến hạng 7 cấp B. Sau khi đánh bại rất nhiều kẻ thù mà không cần dùng đến nhiều sức của mình, anh cảm thấy buồn chán và trống rỗng, không ngừng tìm kiếm đối thủ người thực sự có thể gây ra một thách thức đối với anh ta. Anh bị xem thường bởi hầu hết thành viên của Hiệp hội siêu Anh hùng và những người bình thường, nguyên nhân anh mất danh tiếng và uy tín của mình vì cách đánh bại kẻ thù một cách dễ dàng (đặc biệt là những kẻ thù đã đánh bại nhiều anh hùng cấp cao) và anh không quan tâm đến dư luận hay thiệt hại tài sản. Mặc dù vậy, Saitama là người có đạo đức hơn so với hầu hết các anh hùng trong sê-ri và không ham muốn hư danh, chẳng hạn như khi anh cải trang mình như một cảnh sát để đánh bại một con quái vật đang tàn phá vì người dân mất niềm tin vào cảnh sát (ngoại truyện).', '1999-08-25 17:00:00', '399115950', 'NAM', 'https://www.facebook.com/Hearter.Zouest', 'tanhoang99.999@gmail.com\r\n', '2021-05-19 15:37:37', '2021-05-19 15:37:37', 'Saiama', 'Thành phố Z');
INSERT INTO `app_user` VALUES (41, 'sang99', 'U4gf9z4kq0cQ7Yyf9MWgW6Uk+lsZD/riI0dK9+dIWAw=', b'0', 1, b'0', 'anonkill1999@gmail.com', b'0', NULL, NULL, NULL, 'NAM', NULL, NULL, '2021-05-19 15:37:37', '2021-05-19 15:37:37', NULL, NULL);
INSERT INTO `app_user` VALUES (45, 'hoang001', 'fF+0wvfyJWXQLsSpZgtCH/gAaj21CVjBMxI5QppoMkc=', b'0', 1, b'0', 'hoang001@gmail.com', b'0', NULL, NULL, NULL, 'NAM', NULL, NULL, '2021-05-27 11:45:30', '2021-05-27 11:45:30', NULL, NULL);
INSERT INTO `app_user` VALUES (46, 'hoang002', 'fF+0wvfyJWXQLsSpZgtCH/gAaj21CVjBMxI5QppoMkc=', b'0', 1, b'0', '17130073@st.hcmuaf.edu.vn', b'0', NULL, NULL, NULL, 'NAM', NULL, NULL, '2021-05-27 11:45:30', '2021-05-27 11:45:30', NULL, NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `actived` bit(1) NOT NULL DEFAULT b'1',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `create_time` datetime(0) NOT NULL DEFAULT utc_timestamp,
  `update_time` datetime(0) NOT NULL DEFAULT utc_timestamp,
  `total_course` bigint(20) NOT NULL DEFAULT 0,
  `duration_learned` decimal(10, 0) UNSIGNED NOT NULL DEFAULT 0,
  `total_money` decimal(30, 0) UNSIGNED NOT NULL DEFAULT 0,
  `total_course_bought` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Game Master', b'1', b'0', '2021-05-25 09:53:03', '2021-05-25 09:53:03', 170, 0, 13915000, 3);
INSERT INTO `categories` VALUES (2, 'Lập trình', b'1', b'0', '2021-05-19 10:57:38', '2021-05-19 10:57:38', 2, 500, 32601000, 5);
INSERT INTO `categories` VALUES (19, 'Kiểm thử', b'1', b'0', '2021-05-25 09:52:33', '2021-05-25 09:52:33', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img_poster_id` bigint(20) NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(15, 0) UNSIGNED NOT NULL,
  `rate_star` double(1, 0) UNSIGNED NOT NULL DEFAULT 0,
  `bought` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_at` timestamp(0) NOT NULL DEFAULT utc_timestamp,
  `user_poster_id` bigint(20) NOT NULL,
  `demo_id` bigint(20) NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `create_at` datetime(0) NOT NULL DEFAULT utc_timestamp,
  `actived` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `img_poster_id`(`img_poster_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`img_poster_id`) REFERENCES `resource_image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 91, 'Eula với danh hiệu \"Kỵ Sĩ Sóng Nước\", không những tinh thông kiếm thuật mà còn rất mưu trí và gan dạ. Đại đội trưởng Varka đã từng đánh giá cô cực kỳ cao, gọi cô là chiến binh xuất sắc có thể sánh vai với \"Kỵ Sĩ Bồ Công Anh\". ', b'0', 'Tìm hiểu Eula 1', 25000000, 1, 2, '2021-06-12 18:30:24', 1, 1, 1, '2021-05-25 14:25:29', b'1');
INSERT INTO `course` VALUES (2, 5, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Tìm hiểu Ganyu 1', 12288000, 5, 0, '2021-06-06 08:04:45', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (3, 99, 'Độc cô cửu kiếm được coi là triết lý đặc sắc của Đạo gia đề cao việc sử dụng kiếm thuật một cách linh hoạt, người luyện kiếm pháp này sẽ trở thành một cao thủ kiếm khách, có thể phá giải hết tất cả võ học trong thiên hạ. Luyện đến cảnh giới cuối cùng có thể dùng bất cứ thứ gì làm kiếm, đạt tới cảnh giới \"vô chiêu thắng hữu chiêu\". ', b'0', 'Độc cô cửu kiếm', 14929000, 5, 0, '2021-06-09 17:18:47', 1, 22, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (4, 7, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 4', 4382000, 2, 0, '2019-12-19 15:45:06', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (5, 7, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 5', 4172000, 5, 0, '2019-11-19 04:34:37', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (6, 5, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 6', 5487000, 3, 0, '2019-05-17 05:12:53', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (7, 8, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 7', 4233000, 0, 0, '2020-09-20 15:11:21', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (8, 8, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 8', 4391000, 4, 0, '2019-07-18 22:46:10', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (9, 4, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 9', 13756000, 5, 0, '2020-07-18 23:15:11', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (10, 4, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 10', 6154000, 5, 0, '2020-12-27 16:51:58', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (11, 4, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 11', 2462000, 1, 0, '2019-08-09 23:43:09', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (12, 9, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 12', 3312000, 3, 0, '2019-11-03 13:48:52', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (13, 4, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 13', 13238000, 4, 0, '2019-11-10 16:24:45', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (14, 3, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 14', 7300000, 5, 0, '2020-04-08 12:19:46', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (15, 8, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 15', 2532000, 3, 0, '2020-02-03 00:36:45', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (16, 7, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 16', 2800000, 3, 0, '2020-01-08 17:22:10', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (17, 2, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 17', 5954000, 5, 0, '2019-03-16 10:42:38', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (18, 10, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 18', 10419000, 1, 0, '2020-04-23 17:19:24', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (19, 8, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 19', 14312000, 1, 0, '2020-09-04 09:42:36', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (20, 4, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 20', 14976000, 5, 0, '2019-09-10 11:44:52', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (21, 10, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 21', 2563000, 4, 0, '2019-08-21 10:21:29', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (22, 10, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 22', 7672000, 2, 0, '2020-04-01 13:07:39', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (23, 9, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 23', 3247000, 2, 0, '2019-09-26 17:59:34', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (24, 4, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 24', 12605000, 5, 0, '2020-03-19 00:04:43', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (25, 4, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 25', 13641000, 0, 0, '2019-11-09 13:23:32', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (26, 5, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 26', 10305000, 3, 0, '2019-05-07 14:56:25', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (27, 6, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 27', 9571000, 5, 0, '2020-07-18 15:42:21', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (28, 4, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 28', 7109000, 0, 0, '2019-04-10 21:53:51', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (29, 2, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 29', 7184000, 4, 0, '2019-06-22 05:20:33', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (30, 4, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 30', 1389000, 4, 0, '2020-07-22 08:48:36', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (31, 2, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 31', 5308000, 3, 0, '2020-09-26 07:17:13', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (32, 4, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 32', 4657000, 3, 0, '2020-10-24 05:42:58', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (33, 2, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 33', 7485000, 0, 0, '2019-03-10 02:56:36', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (34, 8, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 34', 6508000, 5, 0, '2019-10-21 01:31:06', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (35, 10, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 35', 10056000, 3, 0, '2020-03-04 23:31:52', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (36, 9, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 36', 7615000, 4, 0, '2020-02-21 20:54:33', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (37, 9, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 37', 1525000, 1, 0, '2019-12-07 22:12:22', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (38, 2, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 38', 13154000, 3, 0, '2019-05-04 05:38:01', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (39, 10, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 39', 14878000, 0, 0, '2019-01-11 09:06:53', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (40, 6, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 40', 3910000, 5, 0, '2019-09-13 09:05:06', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (41, 2, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 41', 5919000, 0, 0, '2020-06-14 00:04:40', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (42, 5, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 42', 7545000, 0, 0, '2019-02-20 23:05:11', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (43, 3, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 43', 2724000, 2, 0, '2019-10-14 02:21:09', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (44, 2, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 44', 11915000, 2, 1, '2020-12-22 13:19:30', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (45, 7, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 45', 1801000, 3, 0, '2020-07-22 13:58:23', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (46, 7, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 46', 11453000, 0, 0, '2019-04-17 16:45:52', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (47, 9, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 47', 9642000, 2, 0, '2019-02-10 15:49:58', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (48, 5, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 48', 12077000, 4, 0, '2019-05-27 14:45:43', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (49, 6, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 49', 3534000, 4, 0, '2019-04-02 03:48:03', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (50, 7, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 50', 7589000, 3, 0, '2020-03-12 10:56:34', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (51, 3, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 51', 12339000, 4, 0, '2019-10-27 02:21:34', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (52, 9, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 52', 2942000, 0, 0, '2019-03-03 15:27:41', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (53, 7, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 53', 904000, 1, 0, '2020-02-28 16:02:19', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (54, 7, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 54', 2078000, 0, 0, '2019-04-07 10:07:06', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (55, 3, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 55', 6516000, 0, 0, '2019-08-24 10:47:50', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (56, 2, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 56', 8357000, 5, 0, '2020-10-01 12:44:37', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (57, 6, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 57', 429000, 4, 0, '2020-12-07 16:27:51', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (58, 10, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 58', 6443000, 1, 0, '2019-03-17 14:13:49', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (59, 2, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 59', 5652000, 1, 0, '2020-02-19 08:30:37', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (60, 10, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 60', 1657000, 0, 0, '2019-06-12 20:44:41', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (61, 9, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 61', 7801000, 0, 0, '2020-01-14 03:43:20', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (62, 2, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 62', 13757000, 3, 0, '2019-05-25 19:54:43', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (63, 7, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 63', 3034000, 0, 0, '2019-09-11 18:05:53', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (64, 8, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 64', 5199000, 5, 0, '2020-12-06 09:31:09', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (65, 6, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 65', 4711000, 2, 0, '2019-03-07 16:27:44', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (66, 10, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 66', 10435000, 2, 0, '2019-01-02 17:29:07', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (67, 7, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 67', 12744000, 1, 0, '2019-11-25 06:29:58', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (68, 7, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 68', 12699000, 4, 0, '2020-09-27 09:32:02', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (69, 5, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 69', 3297000, 5, 0, '2019-03-04 16:01:53', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (70, 6, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 70', 6332000, 2, 0, '2020-12-09 01:15:45', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (71, 9, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 71', 7122000, 2, 0, '2020-10-23 22:40:51', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (72, 7, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 72', 8977000, 0, 0, '2020-11-25 11:21:39', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (73, 10, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 73', 8996000, 0, 0, '2020-09-14 14:46:33', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (74, 10, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 74', 4556000, 1, 0, '2019-10-22 19:10:24', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (75, 2, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 75', 13823000, 4, 0, '2019-08-27 01:28:50', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (76, 8, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 76', 11196000, 5, 0, '2019-11-22 20:07:46', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (77, 8, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 77', 8066000, 4, 0, '2019-06-02 11:58:52', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (78, 10, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 78', 12731000, 5, 0, '2019-10-06 20:54:55', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (79, 8, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 79', 10985000, 0, 0, '2019-01-19 15:29:31', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (80, 6, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 80', 6147000, 0, 0, '2020-05-13 21:17:32', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (81, 7, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 81', 11310000, 5, 0, '2020-09-17 22:53:41', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (82, 9, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 82', 12980000, 4, 0, '2019-01-27 08:25:27', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (83, 10, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 83', 12597000, 0, 0, '2019-02-12 05:58:06', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (84, 4, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 84', 4227000, 3, 0, '2019-12-13 12:20:26', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (85, 2, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 85', 10733000, 4, 0, '2019-09-15 19:02:11', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (86, 9, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 86', 14258000, 3, 0, '2020-07-16 16:10:21', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (87, 5, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 87', 3223000, 4, 0, '2019-10-20 19:39:28', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (88, 8, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 88', 4146000, 2, 0, '2020-09-12 12:32:16', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (89, 2, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 89', 13213000, 1, 0, '2019-12-19 12:56:09', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (90, 8, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 90', 6813000, 0, 0, '2019-02-11 01:04:26', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (91, 6, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 91', 6703000, 1, 0, '2019-07-11 06:52:01', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (92, 10, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 92', 12974000, 0, 0, '2020-10-23 02:42:38', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (93, 4, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 93', 3080000, 1, 0, '2020-03-11 11:40:02', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (94, 4, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 94', 9757000, 0, 0, '2020-02-27 06:03:14', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (95, 6, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 95', 2627000, 4, 0, '2020-01-27 16:59:40', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (96, 2, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 96', 12257000, 0, 0, '2020-02-23 14:44:28', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (97, 9, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 97', 8108000, 0, 0, '2019-03-28 06:07:10', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (98, 2, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 98', 8844000, 5, 0, '2020-12-03 13:56:06', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (99, 3, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 99', 674000, 1, 0, '2019-02-10 17:27:57', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (100, 9, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 100', 14916000, 2, 0, '2019-12-07 00:04:46', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (101, 6, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 101', 7320000, 1, 0, '2020-10-10 09:49:08', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (102, 7, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 102', 12593000, 1, 0, '2019-06-18 08:23:22', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (103, 5, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 103', 3956000, 3, 0, '2019-09-05 12:57:43', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (104, 4, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 104', 14978000, 2, 0, '2019-01-22 08:34:57', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (105, 9, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 105', 7367000, 5, 0, '2020-01-23 17:15:40', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (106, 8, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 106', 8807000, 0, 0, '2020-05-08 00:07:33', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (107, 5, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 107', 3964000, 1, 0, '2020-06-04 02:36:46', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (108, 7, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 108', 10797000, 2, 0, '2020-01-27 12:44:25', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (109, 9, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 109', 5210000, 4, 0, '2020-11-06 17:06:56', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (110, 5, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 110', 8229000, 1, 0, '2019-06-22 20:24:22', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (111, 9, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 111', 7533000, 3, 0, '2019-09-15 15:50:14', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (112, 4, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 112', 10012000, 4, 0, '2019-06-27 19:55:29', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (113, 2, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 113', 10821000, 5, 0, '2019-01-16 00:47:12', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (114, 6, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 114', 2735000, 2, 0, '2019-02-22 07:28:45', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (115, 4, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 115', 1315000, 3, 0, '2019-02-04 02:26:25', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (116, 10, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 116', 12823000, 3, 0, '2019-10-01 04:05:41', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (117, 4, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 117', 5076000, 5, 0, '2019-03-01 10:48:21', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (118, 3, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 118', 12674000, 3, 0, '2019-09-21 22:10:04', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (119, 5, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 119', 6192000, 1, 0, '2020-04-17 02:54:54', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (120, 9, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 120', 6683000, 3, 0, '2020-06-16 06:51:44', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (121, 10, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 121', 13992000, 5, 0, '2019-01-18 10:40:54', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (122, 6, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 122', 2423000, 3, 0, '2019-08-11 12:16:12', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (123, 10, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 123', 9741000, 0, 0, '2019-08-03 04:35:50', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (124, 5, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 124', 12638000, 3, 0, '2019-11-25 05:15:00', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (125, 9, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 125', 5720000, 2, 0, '2020-09-17 05:57:19', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (126, 2, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 126', 5369000, 3, 0, '2020-09-22 10:47:46', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (127, 4, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 127', 14245000, 0, 0, '2019-04-07 12:35:42', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (128, 7, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 128', 7815000, 4, 0, '2019-02-23 15:55:58', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (129, 4, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 129', 2030000, 1, 0, '2020-01-19 18:53:08', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (130, 10, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 130', 13389000, 5, 0, '2020-05-27 20:05:26', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (131, 10, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 131', 3204000, 1, 0, '2019-07-16 14:34:34', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (132, 4, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 132', 8463000, 4, 0, '2019-05-13 18:17:09', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (133, 10, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 133', 2295000, 5, 0, '2020-01-22 04:11:24', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (134, 6, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 134', 10776000, 0, 0, '2020-10-21 07:59:44', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (135, 8, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 135', 14565000, 4, 0, '2019-07-19 17:30:53', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (136, 8, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 136', 5324000, 2, 0, '2020-04-08 00:20:05', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (137, 3, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 137', 7429000, 3, 0, '2020-08-08 04:53:34', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (138, 8, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 138', 10839000, 2, 0, '2020-07-05 06:54:31', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (139, 5, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 139', 4690000, 3, 0, '2019-07-17 12:49:09', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (140, 10, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 140', 10257000, 1, 0, '2019-11-04 20:13:56', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (141, 8, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 141', 3754000, 2, 0, '2019-12-16 17:17:44', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (142, 5, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 142', 14365000, 3, 0, '2020-11-13 09:14:31', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (143, 4, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 143', 2646000, 5, 0, '2020-03-19 09:39:08', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (144, 2, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 144', 1813000, 1, 0, '2019-04-15 00:02:10', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (145, 6, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 145', 12608000, 4, 0, '2019-01-01 02:30:18', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (146, 8, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 146', 5325000, 5, 0, '2019-05-18 22:03:33', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (147, 8, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 147', 11340000, 1, 0, '2019-12-25 09:50:59', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (148, 6, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 148', 13030000, 0, 0, '2019-03-15 14:22:52', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (149, 3, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 149', 14890000, 5, 0, '2019-01-21 20:24:08', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (150, 6, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 150', 11735000, 5, 0, '2020-06-03 13:40:56', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (151, 9, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 151', 13892000, 2, 0, '2020-03-07 13:32:40', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (152, 10, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 152', 11053000, 2, 0, '2019-01-13 00:42:54', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (153, 6, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 153', 5501000, 2, 0, '2019-07-28 06:37:36', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (154, 3, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 154', 8593000, 3, 0, '2020-08-13 13:29:43', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (155, 8, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 155', 2199000, 5, 0, '2020-12-06 20:49:25', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (156, 10, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 156', 10471000, 0, 0, '2020-05-14 21:26:24', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (157, 10, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 157', 4461000, 4, 0, '2019-02-18 21:13:06', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (158, 3, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 158', 13436000, 1, 0, '2020-08-25 02:22:55', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (159, 6, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 159', 12428000, 1, 0, '2019-04-20 14:15:53', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (160, 5, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 160', 3175000, 1, 0, '2020-07-12 07:23:45', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (161, 4, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 161', 14063000, 0, 0, '2020-01-05 13:35:00', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (162, 7, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 162', 4704000, 5, 0, '2020-07-09 07:27:04', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (163, 9, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 163', 9372000, 0, 0, '2020-07-17 20:00:26', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (164, 2, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 164', 4539000, 3, 0, '2019-11-12 16:28:02', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (165, 2, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 165', 6026000, 2, 0, '2020-08-20 17:28:14', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (166, 6, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 166', 8734000, 1, 0, '2020-04-05 18:15:10', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (167, 4, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 167', 14691000, 1, 0, '2019-05-20 12:25:32', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (168, 7, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 168', 3276000, 2, 0, '2019-08-05 10:18:41', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (169, 2, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 169', 3712000, 3, 0, '2019-12-20 19:03:14', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (170, 6, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 170', 13879000, 0, 0, '2020-11-14 12:05:41', 1, 6, 1, '2021-05-19 15:35:12', b'1');
INSERT INTO `course` VALUES (171, 71, 'Kiến thức cơ bản dành cho dân IT, không phân biệt bạn theo Front-end, Back-end hay Devops', b'0', 'Kiến thức cơ bản, cốt lõi dân IT cần học trước', 10857000, 0, 3, '2021-05-25 14:02:46', 1, 6, 2, '2021-05-25 14:02:46', b'1');
INSERT INTO `course` VALUES (178, 72, 'Khóa học đề cao việc thực hành qua những ví dụ trong thực tế giúp học viên nhanh chóng xây dựng được giao diện website', b'0', 'HTML, CSS từ Zero đến Hero', 15000, 0, 2, '2021-05-25 14:15:57', 1, 1, 2, '2021-05-25 14:15:57', b'1');
INSERT INTO `course` VALUES (179, 92, 'Eula là đội trưởng của \"tiểu đội du kích\" trong Đội Kỵ Sĩ Tây Phong.\n\nDo yêu cầu công việc, cô ấy phải thường xuyên dẫn đội đi săn ma vật và Giáo Đoàn Vực Sâu ở bên ngoài trong thời gian dài, rất ít khi trở về Thành Mondstadt. ', b'0', 'Tìm hiểu Eula 2', 260000, 0, 0, '2021-06-06 08:03:26', 1, 1, 19, '2021-05-25 14:28:25', b'1');
INSERT INTO `course` VALUES (180, 2, '2', b'0', '1', 2, 0, 0, '2021-06-12 18:46:13', 1, NULL, NULL, '2021-06-12 18:46:13', b'1');
INSERT INTO `course` VALUES (181, NULL, '12313', b'0', 'Test', 54646, 0, 0, '2021-06-12 18:48:10', 1, NULL, NULL, '2021-06-12 18:48:10', b'1');

-- ----------------------------
-- Table structure for learning
-- ----------------------------
DROP TABLE IF EXISTS `learning`;
CREATE TABLE `learning`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NOT NULL,
  `learning` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `learning_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of learning
-- ----------------------------
INSERT INTO `learning` VALUES (1, 171, 'Các kiến thức cơ bản, nền móng của ngành IT', b'0');
INSERT INTO `learning` VALUES (2, 171, 'Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng', b'0');
INSERT INTO `learning` VALUES (3, 171, 'Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng', b'0');
INSERT INTO `learning` VALUES (4, 171, 'Hiểu hơn về cách internet và máy vi tính hoạt động', b'0');
INSERT INTO `learning` VALUES (33, 1, 'Chém thẳng', b'0');
INSERT INTO `learning` VALUES (35, 1, 'Chém dọc', b'0');
INSERT INTO `learning` VALUES (45, 178, 'Biết cách xây dựng giao diện web với HTML, CSS', b'0');
INSERT INTO `learning` VALUES (47, 178, 'Biết cách phân tích giao diện website', b'0');
INSERT INTO `learning` VALUES (48, 178, 'Biết cách đặt tên class CSS theo chuẩn BEM', b'0');
INSERT INTO `learning` VALUES (49, 178, 'Biết cách làm giao diện web responsive', b'0');
INSERT INTO `learning` VALUES (50, 178, 'Làm chủ Flexbox khi dựng bố cục website', b'0');
INSERT INTO `learning` VALUES (51, 178, 'Sở hữu 2 giao diện web khi học xong khóa học', b'0');
INSERT INTO `learning` VALUES (52, 178, 'Biết cách tự tạo động lực cho bản thân', b'0');
INSERT INTO `learning` VALUES (53, 178, 'Biết cách tự học những kiến thức mới', b'0');
INSERT INTO `learning` VALUES (54, 1, 'Bổ ngang', b'0');
INSERT INTO `learning` VALUES (58, 1, 'Quăng kiếm', b'0');
INSERT INTO `learning` VALUES (61, 1, 'Hồi mã thương', b'0');
INSERT INTO `learning` VALUES (64, 3, 'Tổng Quát Thức', b'0');
INSERT INTO `learning` VALUES (65, 3, 'Phá Kiếm Thức', b'0');
INSERT INTO `learning` VALUES (66, 3, 'Phá Đao Thức', b'0');
INSERT INTO `learning` VALUES (67, 3, 'Phá Khí Thức', b'0');
INSERT INTO `learning` VALUES (68, 3, 'Phá Chưởng Thức', b'0');
INSERT INTO `learning` VALUES (69, 3, 'Phá Tiễn Thức', b'0');
INSERT INTO `learning` VALUES (70, 3, 'Phá Thương Thức', b'0');
INSERT INTO `learning` VALUES (71, 3, 'Phá Tiên Thức', b'0');
INSERT INTO `learning` VALUES (72, 3, 'Phá Sách Thức', b'0');

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `part_id` bigint(20) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duration` bigint(20) NULL DEFAULT NULL,
  `video_id` bigint(20) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  INDEX `part_id`(`part_id`) USING BTREE,
  CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES (1, 1, '8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!', 387, 2, b'0');
INSERT INTO `lesson` VALUES (2, 1, 'Phương pháp & quan điểm học lập trình của Sơn Đặng', 1445, 3, b'0');
INSERT INTO `lesson` VALUES (3, 2, 'Làm sao để có thu nhập cao và đi xa hơn trong ngành IT?', 1539, 4, b'0');
INSERT INTO `lesson` VALUES (4, 3, 'Mô hình Client - Server', 695, 5, b'0');
INSERT INTO `lesson` VALUES (5, 3, 'Domain là gì? Bạn đã thật sự hiểu về domain?', 633, 6, b'0');
INSERT INTO `lesson` VALUES (6, 4, 'Trang web này sử dụng những công nghệ gì?', 1252, 1, b'0');
INSERT INTO `lesson` VALUES (7, 4, 'Quản lý thư mục dự án trên máy tính và VSCode hiệu quả hơn', 709, 8, b'0');
INSERT INTO `lesson` VALUES (8, 4, 'Học IT cần tố chất gì?', 1449, 8, b'0');
INSERT INTO `lesson` VALUES (19, 27, 'Xin chào', NULL, 3, b'0');
INSERT INTO `lesson` VALUES (20, 27, 'Hello', NULL, 1, b'0');
INSERT INTO `lesson` VALUES (38, 33, 'Làm được gì sau khi khóa học?', NULL, 1, b'0');
INSERT INTO `lesson` VALUES (39, 34, 'Làm quen với DevTooll', NULL, 3, b'0');
INSERT INTO `lesson` VALUES (48, 33, 'HTML, CSS là gì?', NULL, 1, b'0');
INSERT INTO `lesson` VALUES (49, 34, 'Cài đặt môi trường', NULL, 1, b'0');

-- ----------------------------
-- Table structure for ower_course
-- ----------------------------
DROP TABLE IF EXISTS `ower_course`;
CREATE TABLE `ower_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL,
  `successed` bit(1) NOT NULL DEFAULT b'0',
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_time` datetime(0) NULL DEFAULT utc_timestamp,
  `update_time` datetime(0) NULL DEFAULT utc_timestamp,
  `duration_learned` decimal(10, 0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `payment_id`(`payment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `ower_course_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ower_course_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ower_course_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ower_course
-- ----------------------------
INSERT INTO `ower_course` VALUES (32, 1, 1, 60, b'1', b'0', '2021-05-24 16:10:07', '2021-05-24 16:10:07', 10000);
INSERT INTO `ower_course` VALUES (33, 1, 171, 61, b'1', b'0', '2021-05-24 16:10:48', '2021-05-24 16:10:48', 500);
INSERT INTO `ower_course` VALUES (34, 1, 178, 62, b'1', b'0', '2021-05-26 14:36:19', '2021-05-26 14:36:19', 0);
INSERT INTO `ower_course` VALUES (35, 2, 1, 63, b'1', b'0', '2021-05-27 10:38:04', '2021-05-27 10:38:04', 0);
INSERT INTO `ower_course` VALUES (37, 45, 171, 65, b'1', b'0', '2021-05-27 11:49:27', '2021-05-27 11:49:27', 0);
INSERT INTO `ower_course` VALUES (38, 45, 44, 66, b'1', b'0', '2021-05-27 15:34:06', '2021-05-27 15:34:06', 0);
INSERT INTO `ower_course` VALUES (39, 46, 178, 67, b'1', b'0', '2021-05-28 07:03:19', '2021-05-28 07:03:19', 0);

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `number_lesson` int(11) NULL DEFAULT 0,
  `duration` decimal(65, 0) NULL DEFAULT 0,
  `deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `part_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES (1, 171, 'Phương pháp học tập', 2, 1832000, b'0');
INSERT INTO `part` VALUES (2, 171, 'Tư duy phát triển', 1, 1539000, b'0');
INSERT INTO `part` VALUES (3, 171, 'Khái niệm kỹ thuật cần biết', 2, 1539000, b'0');
INSERT INTO `part` VALUES (4, 171, 'Tham khảo thêm', 3, 1539000, b'0');
INSERT INTO `part` VALUES (27, 1, 'Part 1', 0, 0, b'0');
INSERT INTO `part` VALUES (33, 178, 'Giới thiệu', 0, 0, b'0');
INSERT INTO `part` VALUES (34, 178, 'Làm quen với công cụ', 0, 0, b'0');
INSERT INTO `part` VALUES (50, 3, '', 0, 0, b'0');
INSERT INTO `part` VALUES (51, 3, '', 0, 0, b'0');
INSERT INTO `part` VALUES (52, 3, '12313', 0, 0, b'0');
INSERT INTO `part` VALUES (53, 3, '123', 0, 0, b'0');
INSERT INTO `part` VALUES (54, 3, '', 0, 0, b'0');
INSERT INTO `part` VALUES (55, 1, 'Hoàng Test', 0, 0, b'0');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `amount` decimal(65, 0) NULL DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `transaction_Status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url_pay` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `params_url_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `url_return` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (42, 1, '2021-05-16 10:14:07', 1085700000, '0:0:0:0:0:0:0:1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210516171407&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F42&vnp_TmnCode=67LF6OWG&vnp_TxnRef=42&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=22e79e5e7ff1fa342a25f2b5f9369126ec95efeeea2d249cb9b13f4f8f352e3a', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210516171446&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13505342&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=42&vnp_SecureHash=687f2b0a4af38654128f096d61fe826842be12794bbd0295d997b3200ba4a09e', 'http://localhost:25001/test/returnurl');
INSERT INTO `payment` VALUES (43, 41, '2021-05-18 12:22:55', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192256&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F43&vnp_TmnCode=67LF6OWG&vnp_TxnRef=43&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=119203cb2feb8c04c45ad04f21f210b246acd1592e2bb9fea458968a45fe93d2', NULL, 'http://192.168.0.111:3000/course/171');
INSERT INTO `payment` VALUES (44, 41, '2021-05-18 12:24:20', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192421&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F44&vnp_TmnCode=67LF6OWG&vnp_TxnRef=44&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=62e50ada83490158cfef62b1a629e9afcf32e87ae935790992003df2a3f80290', NULL, 'http://192.168.0.111:3000/course/171');
INSERT INTO `payment` VALUES (45, 41, '2021-05-18 12:24:36', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192436&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F45&vnp_TmnCode=67LF6OWG&vnp_TxnRef=45&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4a71868f029d48c22f624b6166e01e1a0bffd55a0e0acf4c7a23cd3ed7308749', NULL, 'http://192.168.0.111:3000/course/171?null');
INSERT INTO `payment` VALUES (46, 41, '2021-05-18 12:28:33', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192833&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F46&vnp_TmnCode=67LF6OWG&vnp_TxnRef=46&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=75c72e1f682247179462e1f83642807e56f3455e7805355723aa481d878cb9f0', NULL, 'http://192.168.0.111:3000/course/171');
INSERT INTO `payment` VALUES (47, 41, '2021-05-18 12:30:06', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193006&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F47&vnp_TmnCode=67LF6OWG&vnp_TxnRef=47&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=8a74e18f5e4316f481657e9e02cfbbc21bd5684c8cb43527b8d768583dc64070', NULL, 'http://192.168.0.111:3000/course/171?null');
INSERT INTO `payment` VALUES (48, 41, '2021-05-18 12:32:56', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193257&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F48&vnp_TmnCode=67LF6OWG&vnp_TxnRef=48&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=e2a9a1bbeb35421dd3f314a2e23b52caecdaefa74a40bb0d431ea18bc79280d1', NULL, 'http://192.168.0.111:3000/course/171?null');
INSERT INTO `payment` VALUES (49, 41, '2021-05-18 12:34:06', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193406&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F49&vnp_TmnCode=67LF6OWG&vnp_TxnRef=49&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=7d6fad91f93a5cf03b1875eb7e497f78c1f75148d31a3ef0437f7e225fd0e09f', NULL, 'http://192.168.0.111:3000/course/171');
INSERT INTO `payment` VALUES (50, 41, '2021-05-18 12:34:25', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193425&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F50&vnp_TmnCode=67LF6OWG&vnp_TxnRef=50&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=05330df32547acbbd8e302729e91fafecdc9a6a1a7d52c71e9ec3678014cd825', NULL, 'http://192.168.0.111:3000/course/171?null');
INSERT INTO `payment` VALUES (51, 1, '2021-05-18 12:35:35', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518193535&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F51&vnp_TmnCode=67LF6OWG&vnp_TxnRef=51&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=e52c3fbc8486391fd33776800440376b3e3ce42816d931d567187c8b6576a1ce', NULL, 'http://localhost:3000/course/1');
INSERT INTO `payment` VALUES (52, 1, '2021-05-18 12:36:56', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518193656&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F52&vnp_TmnCode=67LF6OWG&vnp_TxnRef=52&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=fe39df9c27e2f23f409eb8e4506c8eb5d8ef339163f2b5cb252a3750a750f4f6', NULL, 'http://localhost:3000/course/1?null');
INSERT INTO `payment` VALUES (53, 1, '2021-05-18 12:42:28', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518194228&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F53&vnp_TmnCode=67LF6OWG&vnp_TxnRef=53&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=16cc5eefac46107e3488bffd399c9b680f5c4aace831bd371e26a000f250e6f4', NULL, 'http://localhost:3000/course/1?null?null');
INSERT INTO `payment` VALUES (54, 1, '2021-05-18 12:49:23', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518194924&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F54&vnp_TmnCode=67LF6OWG&vnp_TxnRef=54&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=c51867705b9de0b6e5c97b2136a794a6e26d4ed1129ab2fb0a7032f8068b1ac4', NULL, 'http://localhost:3000/course/1');
INSERT INTO `payment` VALUES (55, 1, '2021-05-19 00:13:13', 100000000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210519071313&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F55&vnp_TmnCode=67LF6OWG&vnp_TxnRef=55&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=bff0749a9bf9823f7b63a96e05e6fe5f3aeaae891b306e84d836c3556f4330e0', 'vnp_Amount=100000000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210519141313&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13506785&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=55&vnp_SecureHash=46cda1c9efc5c7ee95cff1e3979c66113573dcea7d8ef344f51902d5a005f844', 'http://localhost:3000/course/1');
INSERT INTO `payment` VALUES (56, 41, '2021-05-19 02:28:40', 1085700000, '192.168.0.222', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210519092841&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F56&vnp_TmnCode=67LF6OWG&vnp_TxnRef=56&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=343fa5b6c5ad6d5920c20e9708b7f7202d0d7555b10ac3d77adb64aa2fb56796', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210519162841&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13506835&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=56&vnp_SecureHash=b263fc73d6f42d74ee9a17b32abd9d2255cc9fc2c24fe69f05cb31b425bbfbea', 'http://192.168.0.111:3000/course/171');
INSERT INTO `payment` VALUES (57, 1, '2021-05-23 10:30:38', 615400000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=615400000&vnp_Command=pay&vnp_CreateDate=20210523173038&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F57&vnp_TmnCode=67LF6OWG&vnp_TxnRef=57&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=1dc55d20facd3c38526baef37f2762a9fbcd3bfbbe8a3db5c9b46cec6aa358e3', 'vnp_Amount=615400000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210523173107&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13509574&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=57&vnp_SecureHash=10802bf22c10f4c6d5d49d80ff8d35be8032fd412ba152bf0cd05214dcf1a0b2', 'http://localhost:3000/course/10');
INSERT INTO `payment` VALUES (58, 1, '2021-05-24 15:45:02', 1191500000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1191500000&vnp_Command=pay&vnp_CreateDate=20210524224502&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F58&vnp_TmnCode=67LF6OWG&vnp_TxnRef=58&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=346064aca26c7a7d284aca7c51efaa3b91ae167a120430b4bf8a19e732c8da43', 'vnp_Amount=1191500000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524224513&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510481&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=58&vnp_SecureHash=881042864bfaf52f93ac4a60de3a9cf2ad6c57854f2fa90ce28167382241a56c', 'http://localhost:3000/course/44');
INSERT INTO `payment` VALUES (59, 1, '2021-05-24 16:03:38', 42900000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=42900000&vnp_Command=pay&vnp_CreateDate=20210524230339&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F59&vnp_TmnCode=67LF6OWG&vnp_TxnRef=59&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=410ec64aa9d4260cf69274149e053677c6e65e2aafb891d5b1c050c3233e10cc', 'vnp_Amount=42900000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524230341&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510483&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=59&vnp_SecureHash=e75648fbf018bcd865b26224780518db0b468553625551ed6ab369b4bb152927', 'http://localhost:3000/course/57');
INSERT INTO `payment` VALUES (60, 1, '2021-05-24 16:10:07', 100000000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210524231007&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F60&vnp_TmnCode=67LF6OWG&vnp_TxnRef=60&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=ef2751f9671212b31a3ba9a85fe7924dd80cf895b5e562827b624ec12b1a9614', 'vnp_Amount=100000000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524231011&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510484&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=60&vnp_SecureHash=122ceff7ab034f06c8ca408685a876acaa6a281f5b206c202bdeef25b95ac357', 'http://localhost:3000/course/1');
INSERT INTO `payment` VALUES (61, 1, '2021-05-24 16:10:48', 1085700000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210524231048&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F61&vnp_TmnCode=67LF6OWG&vnp_TxnRef=61&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4025a668a29ed6acc0f099d5f1292bdd6181fbed18596b71b3fe3a8229363de9', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524231046&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510485&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=61&vnp_SecureHash=9f38afbe75b06bf35e358c9d5085ded85935b7ddfb9d5be09c7ede809b969cc7', 'http://localhost:3000/course/171');
INSERT INTO `payment` VALUES (62, 1, '2021-05-26 14:36:19', 1500000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1500000&vnp_Command=pay&vnp_CreateDate=20210526213620&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F62&vnp_TmnCode=67LF6OWG&vnp_TxnRef=62&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4ce24c284ac8870421e87dd1f28a82de553e4edacd3d97297fb7bfb70566951a', 'vnp_Amount=1500000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210526213637&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13512167&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=62&vnp_SecureHash=1bdebc60e2386b2ac3929fdf8996c01e1168133ac8bebc8ea53460ab2ee63853', 'http://localhost:3000/course/178');
INSERT INTO `payment` VALUES (63, 2, '2021-05-27 10:38:04', 100000000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210527173804&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F63&vnp_TmnCode=67LF6OWG&vnp_TxnRef=63&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=8a87e89b1694dfef6707dc59c2fa93e69c52e0f98a5bfbe9184c20fdb3cd04af', 'vnp_Amount=100000000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210527173817&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13512924&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=63&vnp_SecureHash=00f9b5d883061718066d26f9a4afe893714c75a2d9b522fa64933e59144c3072', 'http://localhost:3000/course/1');
INSERT INTO `payment` VALUES (65, 45, '2021-05-27 11:49:27', 1085700000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210527184927&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F65&vnp_TmnCode=67LF6OWG&vnp_TxnRef=65&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=46fd5543d95e5244e636b0c6ce5c836968e8c502bbe41cafa8dd1e83b5d107e6', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210527185005&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13512956&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=65&vnp_SecureHash=156d609f55d149b0771e4f182af5ac02d47a5951dd5ca0f7e312326c96a4dbe9', 'http://localhost:3000/course/171');
INSERT INTO `payment` VALUES (66, 45, '2021-05-27 15:34:06', 1191500000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1191500000&vnp_Command=pay&vnp_CreateDate=20210527223406&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F66&vnp_TmnCode=67LF6OWG&vnp_TxnRef=66&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4bc1079f299262e278b2ab06c0f628a00637f33fe79053350b70f625ece326f9', 'vnp_Amount=1191500000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210527223422&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13513046&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=66&vnp_SecureHash=92f97bf2dc4d308fab436f351227de00476111ee58cf9f518e811c7769c24b72', 'http://localhost:3000/course/44');
INSERT INTO `payment` VALUES (67, 46, '2021-05-28 07:03:19', 1500000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1500000&vnp_Command=pay&vnp_CreateDate=20210528140320&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F67&vnp_TmnCode=67LF6OWG&vnp_TxnRef=67&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=8b970484b83fbdf9f1339b75d201786b0f46acc0be436288a96432632fa5eb1e', 'vnp_Amount=1500000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210528210320&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13513517&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=67&vnp_SecureHash=687f02adbaea0c68c31ca1c5a54dd0cd0ba482b9cb48cd622857caa89d8ce894', 'http://localhost:3000/course/178');

-- ----------------------------
-- Table structure for queue_check_payment
-- ----------------------------
DROP TABLE IF EXISTS `queue_check_payment`;
CREATE TABLE `queue_check_payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) NOT NULL,
  `last_check` datetime(0) NULL DEFAULT utc_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for request_reset_password
-- ----------------------------
DROP TABLE IF EXISTS `request_reset_password`;
CREATE TABLE `request_reset_password`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alive` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `request_reset_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of request_reset_password
-- ----------------------------
INSERT INTO `request_reset_password` VALUES (66, 45, '2021-05-27 11:47:20', '93555c504e3bfdebee73e898098e4b92', b'0');
INSERT INTO `request_reset_password` VALUES (67, 45, '2021-05-27 15:21:08', '9b2401571f86e72e4d0d7875840a9a10', b'1');
INSERT INTO `request_reset_password` VALUES (68, 45, '2021-05-27 15:22:06', '1ad2ad01de884d32305ac63ae45ebc56', b'1');
INSERT INTO `request_reset_password` VALUES (69, 45, '2021-05-27 15:22:47', 'a6565a7061bc51fef1cdadff43360d94', b'0');

-- ----------------------------
-- Table structure for resource_image
-- ----------------------------
DROP TABLE IF EXISTS `resource_image`;
CREATE TABLE `resource_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `update_at` datetime(0) NOT NULL DEFAULT utc_timestamp,
  `user_poster_id` bigint(20) NULL DEFAULT NULL,
  `count_linked` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `create_at` datetime(0) NOT NULL DEFAULT utc_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_image
-- ----------------------------
INSERT INTO `resource_image` VALUES (1, 'image/default/momo.webp', b'0', '2021-04-05 14:48:50', 2, 4, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (2, 'user/user/image/ganyu-h-1.png', b'0', '2021-05-19 01:20:05', 2, 22, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (3, 'user/user/image/ganyu-h-2.jpg', b'0', '2021-04-05 14:48:50', 2, 10, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (4, 'user/user/image/ganyu-h-3.png', b'0', '2021-04-05 14:48:50', 2, 23, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (5, 'user/user/image/ganyu-h-4.jpg', b'0', '2021-04-05 14:48:50', 2, 15, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (6, 'user/user/image/ganyu-h-5.jpg', b'0', '2021-04-05 14:48:50', 2, 20, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (7, 'user/user/image/ganyu-h-6.jpg', b'0', '2021-04-05 14:48:50', 2, 18, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (8, 'user/user/image/ganyu-h-7.jpg', b'0', '2021-04-05 14:48:50', 2, 19, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (9, 'user/user/image/ganyu-h-8.jpg', b'0', '2021-04-05 14:48:50', 2, 19, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (10, 'user/user/image/ganyu-h-9.jpg', b'0', '2021-05-16 07:05:29', 2, 23, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (11, 'user/user/image/demo.jpg', b'0', '2021-04-05 14:48:50', 2, 7, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (71, 'user/admin/image/sddefault.jpg', b'0', '2021-05-25 14:01:08', 1, 1, '2021-05-25 14:01:08');
INSERT INTO `resource_image` VALUES (72, 'user/admin/image/html.jpg', b'0', '2021-05-25 14:05:14', 1, 1, '2021-05-25 14:05:14');
INSERT INTO `resource_image` VALUES (84, 'user/user/image/anh-1-1600587301890166145683.webp', b'0', '2021-06-06 05:42:45', 2, 1, '2021-06-06 05:42:45');
INSERT INTO `resource_image` VALUES (91, 'user/admin/image/1616839149520.png', b'0', '2021-06-06 07:42:25', 1, 1, '2021-06-06 07:42:25');
INSERT INTO `resource_image` VALUES (92, 'user/admin/image/1616839149535.png', b'0', '2021-06-06 08:03:26', 1, 1, '2021-06-06 08:03:26');
INSERT INTO `resource_image` VALUES (99, 'user/admin/image/4fa665b22e75a78b038ec14ae2e24296.jpg', b'0', '2021-06-06 17:06:13', 1, 1, '2021-06-06 17:06:13');

-- ----------------------------
-- Table structure for revenue
-- ----------------------------
DROP TABLE IF EXISTS `revenue`;
CREATE TABLE `revenue`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `month` int(255) NULL DEFAULT NULL,
  `year` int(255) NULL DEFAULT NULL,
  `money` decimal(60, 0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unque_key`(`month`, `year`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of revenue
-- ----------------------------
INSERT INTO `revenue` VALUES (1, b'0', '2020-01-07 19:07:33', '2021-01-26 19:07:33', 1, 2021, 5000000);
INSERT INTO `revenue` VALUES (2, b'0', '2021-02-01 19:08:13', '2021-02-26 19:08:13', 2, 2021, 15000000);
INSERT INTO `revenue` VALUES (3, b'0', '2021-03-26 19:10:41', '2021-03-26 19:10:41', 3, 2021, 15150000);
INSERT INTO `revenue` VALUES (4, b'0', '2021-04-26 19:09:33', '2021-04-26 19:09:33', 4, 2021, 27000000);
INSERT INTO `revenue` VALUES (50, b'0', '2021-05-26 18:37:41', '2021-05-26 18:37:41', 5, 2021, 46516000);

-- ----------------------------
-- Table structure for spring_session
-- ----------------------------
DROP TABLE IF EXISTS `spring_session`;
CREATE TABLE `spring_session`  (
  `PRIMARY_ID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SESSION_ID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`) USING BTREE,
  UNIQUE INDEX `SPRING_SESSION_IX1`(`SESSION_ID`) USING BTREE,
  INDEX `SPRING_SESSION_IX2`(`EXPIRY_TIME`) USING BTREE,
  INDEX `SPRING_SESSION_IX3`(`PRINCIPAL_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spring_session
-- ----------------------------
INSERT INTO `spring_session` VALUES ('f164c41a-69d6-4fc0-bd18-667163e98311', '95a44b23-dc94-4ab9-aa10-abf4ee8fd088', 1623522377833, 1623522377834, 1800, 1623524177834, NULL);

-- ----------------------------
-- Table structure for spring_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS `spring_session_attributes`;
CREATE TABLE `spring_session_attributes`  (
  `SESSION_PRIMARY_ID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`) USING BTREE,
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for templates
-- ----------------------------
DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `actived` bit(1) NULL DEFAULT b'0',
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of templates
-- ----------------------------
INSERT INTO `templates` VALUES (1, 'Genshin Impact', b'1', b'1', '2021-05-19 15:39:04', '2021-05-19 15:39:04');
INSERT INTO `templates` VALUES (2, 'Lập trình', b'1', b'1', '2021-05-19 15:39:04', '2021-05-19 15:39:04');

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
INSERT INTO `test` VALUES (1, b'1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `USER_ROLE_UK`(`USER_ID`, `ROLE_ID`) USING BTREE,
  INDEX `USER_ROLE_FK2`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `app_role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);
INSERT INTO `user_role` VALUES (23, 41, 2);
INSERT INTO `user_role` VALUES (27, 45, 2);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img_poster_id` bigint(20) NULL DEFAULT NULL,
  `duration` int(255) UNSIGNED NOT NULL DEFAULT 0,
  `count_linked` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `actived` bit(1) NOT NULL DEFAULT b'0',
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `user_poster_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `poster`(`img_poster_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, 'user/admin/video/171/mp4/toystory', 11, 10000000, 8, b'0', b'0', '2021-05-19 15:41:11', '2021-05-19 15:41:11', 1);
INSERT INTO `video` VALUES (2, 'user/admin/video/171/mp4/8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!', 11, 10000000, 1, b'0', b'0', '2021-05-19 15:41:11', '2021-05-19 15:41:11', 1);
INSERT INTO `video` VALUES (3, 'user/admin/video/171/mp4/8 lý do bạn nên học trên Fullstackeduvn hơn là Youtube!', 11, 10000000, 3, b'0', b'0', '2021-05-19 15:41:11', '2021-05-19 15:41:11', 1);
INSERT INTO `video` VALUES (4, 'user/admin/video/171/mp4/Domain là gì Bạn đã thật sự hiểu về domain', 11, 10000000, 1, b'0', b'0', '2021-05-19 15:41:11', '2021-05-19 15:41:11', 1);
INSERT INTO `video` VALUES (5, 'user/admin/video/171/mp4/Mô hình Client - Server', 11, 10000000, 1, b'0', b'0', '2021-05-19 15:41:11', '2021-05-19 15:41:11', 1);
INSERT INTO `video` VALUES (6, 'user/admin/video/default/mp4/Character Teaser - Ganyu A Night in Liyue Harbor  Genshin Impact', 11, 10000000, 170, b'0', b'0', '2021-05-19 15:41:11', '2021-05-19 15:41:11', 1);
INSERT INTO `video` VALUES (8, 'user/admin/video/default/mp4/SƠN TÙNG M-TP  MUỘN RỒI MÀ SAO CÒN  OFFICIAL MUSIC VIDEO', 11, 10000000, 2, b'0', b'0', '2021-05-19 15:41:11', '2021-05-19 15:41:11', 1);
INSERT INTO `video` VALUES (22, 'user/admin/video/Trailer game Độc Cô Cửu Kiếm mobile.mp4', NULL, 0, 1, b'1', b'0', '2021-06-06 17:28:26', '2021-06-06 17:28:26', 1);
INSERT INTO `video` VALUES (23, 'user/admin/video/toystory.mp4', NULL, 0, 0, b'1', b'0', '2021-06-10 16:20:39', '2021-06-10 16:20:39', 1);
INSERT INTO `video` VALUES (24, 'user/admin/video/toystory.mp4', NULL, 0, 0, b'1', b'0', '2021-06-10 16:22:02', '2021-06-10 16:22:02', 1);
INSERT INTO `video` VALUES (25, 'user/admin/video/toystory.mp4', NULL, 0, 0, b'1', b'0', '2021-06-10 16:30:09', '2021-06-10 16:30:09', 1);

-- ----------------------------
-- Triggers structure for table app_user
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_app_user`;
delimiter ;;
CREATE TRIGGER `after_insert_app_user` AFTER INSERT ON `app_user` FOR EACH ROW BEGIN
				if new.avatar_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.avatar_id;					
			
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table app_user
-- ----------------------------
DROP TRIGGER IF EXISTS `after_update_app_user`;
delimiter ;;
CREATE TRIGGER `after_update_app_user` AFTER UPDATE ON `app_user` FOR EACH ROW BEGIN
			if old.avatar_id <> new.avatar_id  then		
				if new.avatar_id is not null then
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.avatar_id;
				end if;
			
				if old.avatar_id is not null then
				UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.avatar_id;		
				end if;
			end if;
			
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table app_user
-- ----------------------------
DROP TRIGGER IF EXISTS `before_delete_app_user`;
delimiter ;;
CREATE TRIGGER `before_delete_app_user` BEFORE DELETE ON `app_user` FOR EACH ROW BEGIN
			DELETE FROM ower_course WHERE user_id=old.id ;
			DELETE FROM active_account WHERE user_id=old.id ;
			DELETE FROM request_reset_password WHERE user_id=old.id ;
			DELETE FROM user_role WHERE user_id=old.id ;
			DELETE FROM request_reset_password WHERE user_id=old.id ;
			DELETE FROM payment WHERE user_id=old.id ;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table app_user
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_app_user`;
delimiter ;;
CREATE TRIGGER `after_delete_app_user` AFTER DELETE ON `app_user` FOR EACH ROW BEGIN
				if old.avatar_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.avatar_id;					
			
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_course`;
delimiter ;;
CREATE TRIGGER `after_insert_course` AFTER INSERT ON `course` FOR EACH ROW BEGIN
				if new.img_poster_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.img_poster_id;					
			
			end if;
			if new.demo_id is not null  then		
			
					UPDATE video SET count_linked=count_linked+1 WHERE id =  new.demo_id;					
			
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `after_update_course`;
delimiter ;;
CREATE TRIGGER `after_update_course` AFTER UPDATE ON `course` FOR EACH ROW BEGIN
			if old.category_id <> new.category_id  then
		
			UPDATE categories SET categories.total_course=categories.total_course+1 WHERE categories.id =  new.category_id;
			UPDATE categories SET categories.total_course=categories.total_course-1 WHERE categories.id =  old.category_id;
			end if;
			
			if old.img_poster_id <> new.img_poster_id  then		
					if new.img_poster_id is not null then
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.img_poster_id;
					end if;
					if new.img_poster_id is not null then
						UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.img_poster_id;		
					end if;
			end if;
			
			if old.demo_id <> new.demo_id  then		
					if new.demo_id is not null then
					UPDATE video SET count_linked=count_linked+1 WHERE id =  new.demo_id;
					end if;
					if new.demo_id is not null then
					UPDATE video SET count_linked=count_linked-1 WHERE id =  old.demo_id;		
					end if;
			end if;
			
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `before_delete_course`;
delimiter ;;
CREATE TRIGGER `before_delete_course` BEFORE DELETE ON `course` FOR EACH ROW BEGIN
			DELETE FROM ower_course WHERE course_id=old.id;
			DELETE FROM user_course WHERE course_id=old.id;
			DELETE FROM part WHERE course_id=old.id;
			DELETE FROM learning WHERE course_id=old.id;
			UPDATE categories SET categories.total_course=categories.total_course-1 WHERE categories.id = old.category_id;
			
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_course`;
delimiter ;;
CREATE TRIGGER `after_delete_course` AFTER DELETE ON `course` FOR EACH ROW BEGIN
				if old.img_poster_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.img_poster_id;					
			
			end if;
			
				if old.demo_id is not null  then		
			
					UPDATE video SET count_linked=count_linked-1 WHERE id =  old.demo_id;					
			
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lesson
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_lesson`;
delimiter ;;
CREATE TRIGGER `after_insert_lesson` AFTER INSERT ON `lesson` FOR EACH ROW BEGIN
					if new.video_id is not null  then		
			
					UPDATE video SET count_linked=count_linked+1 WHERE id =  new.video_id;					
			
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lesson
-- ----------------------------
DROP TRIGGER IF EXISTS `after_update_lesson`;
delimiter ;;
CREATE TRIGGER `after_update_lesson` AFTER UPDATE ON `lesson` FOR EACH ROW BEGIN
			if old.video_id <> new.video_id  then		
				if new.video_id is not null then
				UPDATE video SET count_linked=count_linked+1 WHERE id =  new.video_id;
				end if;
				if old.video_id is not null then
				UPDATE video SET count_linked=count_linked-1 WHERE id =  old.video_id;						
				end if;
			end if;
			
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lesson
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_lesson`;
delimiter ;;
CREATE TRIGGER `after_delete_lesson` AFTER DELETE ON `lesson` FOR EACH ROW BEGIN
					if old.video_id is not null  then		
			
					UPDATE video SET count_linked=count_linked-1 WHERE id =  old.video_id;					
			
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ower_course
-- ----------------------------
DROP TRIGGER IF EXISTS `after_update_ower_course`;
delimiter ;;
CREATE TRIGGER `after_update_ower_course` AFTER UPDATE ON `ower_course` FOR EACH ROW BEGIN
			
			SET @duration_than = new.duration_learned - old.duration_learned;  		
			SET @TMP = 0;
			SELECT category_id  into @TMP	FROM course WHERE id = old.course_id;  
			UPDATE categories SET categories.duration_learned=categories.duration_learned+@duration_than WHERE categories.id =  @TMP;
			
			if old.successed <> new.successed and new.successed = 1 then
				SET @TMP_PRICE = 0;
				SELECT price  into @TMP_PRICE	FROM course WHERE id = old.course_id;  
				UPDATE categories SET categories.total_money=categories.total_money+@TMP_PRICE WHERE categories.id =  @TMP;
				SET @_year = YEAR(NOW());
				SET @_month = MONTH(NOW());
				SELECT revenue.id  into @revenue_id	FROM revenue WHERE revenue.`year` = YEAR(NOW()) and revenue.`month` = MONTH(NOW());
				if @revenue_id is null then 				
					insert  INTO revenue (`month`, `year`) VALUES( @_month, @_year);
				end if;				
				UPDATE revenue SET revenue.money=revenue.money+@TMP_PRICE WHERE revenue.`year` = @_year and revenue.`month` =  @_month;
				UPDATE categories SET categories.total_course_bought=categories.total_course_bought+1 WHERE categories.id =  @TMP;
				UPDATE course SET course.bought=course.bought+1 WHERE course.id =  old.course_id;
		
		end if;
			if old.successed <> new.successed and new.successed = 0 then
			SET @TMP_PRICE = 0;
				SELECT price  into @TMP_PRICE	FROM course WHERE id = old.course_id;  
				UPDATE categories SET categories.total_money=categories.total_money-@TMP_PRICE WHERE categories.id =  @TMP;
				SET @_year = YEAR(NOW());
				SET @_month = MONTH(NOW());
				SELECT revenue.id  into @revenue_id	FROM revenue WHERE revenue.`year` = @_year and revenue.`month` = @_month;
				if @revenue_id is null then 				
					insert  INTO revenue (`month`, `year`) VALUES( @_month, @_year);
				end if;				
				UPDATE revenue SET revenue.money=revenue.money-@TMP_PRICE WHERE revenue.`year` = @_year and revenue.`month` =  @_month;
				UPDATE categories SET categories.total_course_bought=categories.total_course_bought-1 WHERE categories.id =  @TMP;
				UPDATE course SET course.bought=course.bought-1 WHERE course.id =  old.course_id;
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table part
-- ----------------------------
DROP TRIGGER IF EXISTS `before_delete_part`;
delimiter ;;
CREATE TRIGGER `before_delete_part` BEFORE DELETE ON `part` FOR EACH ROW BEGIN
			DELETE FROM lesson WHERE part_id=old.id ;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table payment
-- ----------------------------
DROP TRIGGER IF EXISTS `before_delete_payment`;
delimiter ;;
CREATE TRIGGER `before_delete_payment` BEFORE DELETE ON `payment` FOR EACH ROW BEGIN
			DELETE FROM ower_course WHERE payment_id=old.id ;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table resource_image
-- ----------------------------
DROP TRIGGER IF EXISTS `before_insert_resource_image`;
delimiter ;;
CREATE TRIGGER `before_insert_resource_image` BEFORE INSERT ON `resource_image` FOR EACH ROW BEGIN
			-- SET new.img_path=
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table video
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_video`;
delimiter ;;
CREATE TRIGGER `after_insert_video` AFTER INSERT ON `video` FOR EACH ROW BEGIN
				if new.img_poster_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.img_poster_id;					
			
			end if;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table video
-- ----------------------------
DROP TRIGGER IF EXISTS `before_delete_video`;
delimiter ;;
CREATE TRIGGER `before_delete_video` BEFORE DELETE ON `video` FOR EACH ROW BEGIN
			DELETE FROM lesson WHERE video_id=old.id ;
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table video
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_video`;
delimiter ;;
CREATE TRIGGER `after_delete_video` AFTER DELETE ON `video` FOR EACH ROW BEGIN
				if old.img_poster_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.img_poster_id;					
			
			end if;
	 END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

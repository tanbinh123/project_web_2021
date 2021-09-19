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

 Date: 19/09/2021 14:01:20
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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `active_account` VALUES (101, 1, '2021-09-14 12:24:10', '954c5d46d758ff52e88ae3b6a2a7104b', b'1');
INSERT INTO `active_account` VALUES (102, 1, '2021-09-14 12:27:47', '879e4b5559c307c8ba1a255069390c04', b'1');
INSERT INTO `active_account` VALUES (103, 1, '2021-09-14 12:28:36', '9344bf9da3d0b7c424958422908e4ece', b'1');
INSERT INTO `active_account` VALUES (104, 1, '2021-09-14 12:29:53', '2a5bd79f6000c8ac28798e3e2799e7b2', b'1');
INSERT INTO `active_account` VALUES (105, 1, '2021-09-14 12:31:34', 'b68d6e0198214ac136ebf2070af7f1ea', b'0');
INSERT INTO `active_account` VALUES (106, 66, '2021-09-14 12:36:01', 'fc347a318b380f76e6af1defbdc672fc', b'1');
INSERT INTO `active_account` VALUES (107, 68, '2021-09-17 00:00:06', 'd4b81bd6f9fff45dcccca349b01ca96d', b'0');
INSERT INTO `active_account` VALUES (108, 1, '2021-09-18 08:15:21', '7098880d7fe84d4c2131f754dc6469ae', b'0');
INSERT INTO `active_account` VALUES (109, 66, '2021-09-18 14:54:35', '2a65a6859ccb863e07bb17e4768ae2b4', b'0');
INSERT INTO `active_account` VALUES (110, 69, '2021-09-18 19:45:57', '1edf1fb621085b752f74a2f4d1dc25b7', b'0');

-- ----------------------------
-- Table structure for app_role
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `create_at` datetime(0) NOT NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NOT NULL DEFAULT utc_timestamp,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `APP_ROLE_UK`(`ROLE_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_role
-- ----------------------------
INSERT INTO `app_role` VALUES (1, 'ROLE_ADMIN', b'0', '2021-06-29 08:20:11', '2021-06-29 08:20:11');
INSERT INTO `app_role` VALUES (2, 'ROLE_USER', b'0', '2021-06-29 08:20:11', '2021-06-29 08:20:11');

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
  `blocked` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `APP_USER_UK`(`USER_NAME`) USING BTREE,
  UNIQUE INDEX `email_uq`(`email`) USING BTREE,
  INDEX `avatar_id`(`avatar_id`) USING BTREE,
  CONSTRAINT `app_user_ibfk_1` FOREIGN KEY (`avatar_id`) REFERENCES `resource_image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (1, 'admin', 'dQNjUIMorJb8Ubj2+wVGYp6eAeYkdekqAcnYp+aRq5w=', b'1', 169, b'0', 'tanhoang99.999@gmail.com', b'1', 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', '1999-08-25 17:00:00', '0399115950', 'NAM', 'https://www.facebook.com/Hearter.Zouest', 'tanhoang99.999@gmail.com', '2021-05-19 15:37:37', '2021-05-19 15:37:37', 'Vua phá lưới', 'Am Bình - Phú Giáo', b'0');
INSERT INTO `app_user` VALUES (2, 'user', 'cBrlgyL2GI2GINuLUUwgojITuIufFycpLG4490dhGtY=', b'1', 84, b'0', 'hearterzouest99.999@gmail.com', b'1', 'Saitama (One punch Man) là một siêu anh hùng dễ dàng đánh bại bất kỳ đối thủ nào với một cú đấm của mình. Anh là một chàng trai cơ bắp 25 tuổi và bị hói đầu, được biết do quá trình tập luyện quá mức của anh gây ra. Saitama thường xuyên cứu những người vô tội khỏi các quái vật xuất hiện trong thế giới của mình. Tuy nhiên, anh không bao giờ nhận được bất kỳ sự công nhận nào từ dân chúng, mặc dù cuối cùng anh gia nhập Hiệp hội siêu Anh hùng và kể từ đó đã tăng lên đến hạng 7 cấp B. Sau khi đánh bại rất nhiều kẻ thù mà không cần dùng đến nhiều sức của mình, anh cảm thấy buồn chán và trống rỗng, không ngừng tìm kiếm đối thủ người thực sự có thể gây ra một thách thức đối với anh ta. Anh bị xem thường bởi hầu hết thành viên của Hiệp hội siêu Anh hùng và những người bình thường, nguyên nhân anh mất danh tiếng và uy tín của mình vì cách đánh bại kẻ thù một cách dễ dàng (đặc biệt là những kẻ thù đã đánh bại nhiều anh hùng cấp cao) và anh không quan tâm đến dư luận hay thiệt hại tài sản. Mặc dù vậy, Saitama là người có đạo đức hơn so với hầu hết các anh hùng trong sê-ri và không ham muốn hư danh, chẳng hạn như khi anh cải trang mình như một cảnh sát để đánh bại một con quái vật đang tàn phá vì người dân mất niềm tin vào cảnh sát (ngoại truyện).', '1999-08-24 17:00:00', '399115950', 'NAM', 'https://www.facebook.com/Hearter.Zouest', 'tanhoang99.999@gmail.com\r\n', '2021-05-19 15:37:37', '2021-05-19 15:37:37', 'Saiama', 'Thành phố Z', b'0');
INSERT INTO `app_user` VALUES (41, 'sang99', 'U4gf9z4kq0cQ7Yyf9MWgW6Uk+lsZD/riI0dK9+dIWAw=', b'0', 1, b'0', 'anonkill19991@gmail.com', b'0', NULL, '2021-09-07 19:54:29', NULL, 'NAM', NULL, NULL, '2021-05-19 15:37:37', '2021-05-19 15:37:37', NULL, NULL, b'0');
INSERT INTO `app_user` VALUES (45, 'hoang001', 'fF+0wvfyJWXQLsSpZgtCH/gAaj21CVjBMxI5QppoMkc=', b'0', 1, b'0', 'hoang001@gmail.com', b'0', NULL, '2021-09-28 19:54:33', NULL, 'NAM', NULL, NULL, '2021-05-27 11:45:30', '2021-05-27 11:45:30', NULL, NULL, b'0');
INSERT INTO `app_user` VALUES (56, 'saitama', '+LKwVQ2dswVWrIwemPIIZap6myYUFzqG2JFrIELlbfs=', b'0', 1, b'0', '17130073@st.hcmuaf.edu.vn', b'0', NULL, '2021-09-23 19:54:36', NULL, 'NAM', NULL, NULL, '2021-06-29 08:11:21', '2021-06-29 08:11:21', NULL, NULL, b'0');
INSERT INTO `app_user` VALUES (57, 'il.com', '+TrtPoa0tOT5i3zDUaSKBF/HGByGgoRE9IEMAa5XNXg=', b'0', NULL, b'0', 'anonkill199@gmail.com', b'0', NULL, '2021-09-21 19:54:39', NULL, 'NAM', NULL, NULL, '2021-09-10 21:34:18', '2021-09-10 21:34:18', NULL, NULL, b'0');
INSERT INTO `app_user` VALUES (66, 'sang', '3sPcFxUAEJv0+aHpLnEa87B8F9Dbo03RG9mPyIGGGtk=', b'0', 133, b'0', 'anonkill1999@gmail.com', b'1', NULL, '2021-09-16 17:00:00', NULL, 'NAM', NULL, NULL, '2021-09-10 22:06:13', '2021-09-10 22:06:13', 'Sang Nguyễn', NULL, b'0');
INSERT INTO `app_user` VALUES (67, 'hello', 'Wwtf1LEt+oBYjbew/WeFdU+HFW+oMIGDhTy+E6Q0f4Q=', b'0', 1, b'0', 'test@gmail.com', b'0', NULL, '2021-10-20 19:54:42', NULL, 'NAM', NULL, NULL, '2021-09-13 11:39:41', '2021-09-13 11:39:41', NULL, NULL, b'0');
INSERT INTO `app_user` VALUES (68, '7B0trqMqSBWVBBGuitP9m8Kypw12', 'OyAxCjg9LUhUD6K0OtjHvlCopxO2FnV0cVtZ6ZajxNw=', b'0', 134, b'0', 'block33015@gmail.com', b'1', NULL, '1999-08-15 17:00:00', NULL, 'NAM', NULL, NULL, '2021-09-14 14:04:03', '2021-09-14 14:04:03', 'Sang Nguyen', 'Bình Dương', b'0');
INSERT INTO `app_user` VALUES (69, 'block33016', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', b'0', 1, b'0', 'block33016@gmail.com', b'1', NULL, '2021-09-18 18:27:18', NULL, 'NAM', NULL, NULL, '2021-09-18 18:27:18', '2021-09-18 18:27:18', NULL, NULL, b'0');
INSERT INTO `app_user` VALUES (70, 'testdk1', 'BFzlOUYlxtEYVA7WAMMr0eaKXEU95cqrnw2Iq8X/pZo=', b'0', 186, b'0', 'testdk1@gmail.com', b'0', 'Người này rất lười không để lại gì', '2021-09-18 17:00:00', NULL, 'NAM', NULL, NULL, '2021-09-18 18:35:17', '2021-09-18 18:35:17', 'Thành Sang', NULL, b'0');
INSERT INTO `app_user` VALUES (71, 'testdk2', 'BFzlOUYlxtEYVA7WAMMr0eaKXEU95cqrnw2Iq8X/pZo=', b'0', 1, b'0', 'testdk2@gmail.com', b'0', NULL, '2021-09-18 18:40:37', NULL, 'NAM', NULL, NULL, '2021-09-18 18:40:37', '2021-09-18 18:40:37', NULL, NULL, b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Chưa phân loại', b'1', b'0', '2021-05-25 09:53:03', '2021-05-25 09:53:03', 169, 0, 47850050, 6);
INSERT INTO `categories` VALUES (2, 'Lập trình', b'1', b'0', '2021-05-19 10:57:38', '2021-05-19 10:57:38', 5, 500, 32601000, 5);
INSERT INTO `categories` VALUES (19, 'Kiểm thử', b'1', b'0', '2021-05-25 09:52:33', '2021-05-25 09:52:33', 3, 0, 0, 0);
INSERT INTO `categories` VALUES (22, 'Genshin Impact', b'1', b'0', '2021-06-28 06:39:44', '2021-06-28 06:39:44', 11, 0, 3020000, 2);
INSERT INTO `categories` VALUES (23, 'Phong cách sống', b'1', b'0', '2021-09-15 08:28:55', '2021-09-15 08:28:55', 12, 0, 1029000, 2);
INSERT INTO `categories` VALUES (24, 'Kĩ năng sống', b'1', b'0', '2021-09-15 20:09:51', '2021-09-15 20:09:51', 0, 0, 0, 0);
INSERT INTO `categories` VALUES (25, 'Kinh tế', b'1', b'0', '2021-09-15 22:03:55', '2021-09-15 22:03:55', 1, 0, 97500, 1);
INSERT INTO `categories` VALUES (28, 'Ngoại ngữ', b'1', b'0', '2021-09-15 22:10:06', '2021-09-15 22:10:06', 0, 0, 0, 0);
INSERT INTO `categories` VALUES (29, 'Tiếng anh', b'1', b'0', '2021-09-15 22:10:20', '2021-09-15 22:10:20', 0, 0, 0, 0);
INSERT INTO `categories` VALUES (30, 'Tiếng Trung', b'1', b'0', '2021-09-15 22:10:45', '2021-09-15 22:10:45', 0, 0, 0, 0);
INSERT INTO `categories` VALUES (31, 'Tin học', b'1', b'0', '2021-09-15 22:12:31', '2021-09-15 22:12:31', 0, 0, 0, 0);
INSERT INTO `categories` VALUES (32, 'Thiết kế', b'1', b'0', '2021-09-18 19:02:37', '2021-09-18 19:02:37', 3, 0, 504000, 1);
INSERT INTO `categories` VALUES (33, 'Nuội dạy con', b'1', b'0', '2021-09-19 06:51:10', '2021-09-19 06:51:10', 2, 0, 0, 0);

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
  `price` decimal(60, 0) UNSIGNED NOT NULL,
  `sum_star` decimal(10, 0) UNSIGNED NOT NULL DEFAULT 0,
  `bought` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_at` timestamp(0) NOT NULL DEFAULT utc_timestamp,
  `user_poster_id` bigint(20) NOT NULL,
  `demo_id` bigint(20) NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `create_at` datetime(0) NOT NULL DEFAULT utc_timestamp,
  `actived` bit(1) NOT NULL DEFAULT b'1',
  `sum_rating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rate_star` int(11) NOT NULL DEFAULT 0,
  `origin_price` decimal(60, 2) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `long_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `img_poster_id`(`img_poster_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`img_poster_id`) REFERENCES `resource_image` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 181, 'Video ngắn và TikTok đang ngày càng chiếm được vị trí quan trọng, và là kênh Marketing online không thể thiếu... HÃY BẮT ĐẦU NGAY !', b'0', 'TikTok : Tiếp cận 100.000+ khách hàng trong 30 ngày với chi phí 0 đồng', 97500, 5, 3, '2021-09-18 20:42:11', 1, 58, 25, '2021-05-25 14:25:29', b'1', 1, 5, 390000.00, 75, '<p><strong>Bạn có biết: </strong><br><br>Từ khi Facebook vào Việt Nam năm 2008 và nền tảng Facebook cũng như Youtube, phát triển rầm rộ từ những năm 2012 trở đi, đã giúp một bộ phận lớn người Việt Nam giàu lên nhanh chóng nhờ tận dụng tốt được các nền tảng mạng xã hội này, đặc biệt là những người trẻ. <br><br>Tuy nhiên, có thể bạn đã không tận dụng được cơ hội từ 2 nền tảng này để giàu lên như bạn muốn. Và bạn thấy kinh doanh trên Facebook hiện nay đang ngày một khó khăn, chi phí thì càng ngày càng đắt đỏ. <br><br>Vậy chẳng nhẽ, những người như bạn đã hết cơ hội để giàu lên từ Internet, từ kinh doanh, bán hàng online ? <br><br><strong>Bạn sẽ chọn cách nào? </strong><br>Theo như những gì tôi biết, từng trải qua và chứng kiến với rất nhiều người thành công từ việc kiếm tiền trên Facebook. Xung quanh tôi, tôi có ít nhất 5 người bạn, mặc dù còn khá trẻ (đều sinh năm 9x), nhưng tài sản của họ đều từ con số 10 tỷ trở lên, và người thì bắt đầu học kinh doanh và bán hàng trên Facebook từ năm 2013, 2014 ... và tôi biết họ đều là những người nắm bắt cơ hội rất, rất giỏi. Còn tôi thì ... mới bằng 1 phần nhỏ trong số họ. <br><br>Tôi biết, hiện tại vẫn đang còn rất nhiều người ngoài kia, họ vẫn đang kiếm tiền và kiếm rất nhiều tiền hàng ngày trên Facebook. Nhưng nếu bạn là những người mà mới kinh doanh online được khoảng 6 tháng, 1 năm. Vốn của bạn chưa nhiều: Có thể là 5-10 triệu hoặc có thể là 50 triệu, 100 triệu; thì theo bạn, cơ hội để bạn chiến thắng và giàu lên nhờ Facebook là bao nhiêu phần trăm? <br>Ở đây, tôi không có ý nói xấu Facebook vì chính bản thân tôi, cũng đang chạy quảng cáo và kiếm tiền trên này. Nhưng nếu bình tĩnh nhìn lại, thì có phải bạn thấy rằng: <br><br>- Facebook ngày xưa kinh doanh dễ hơn bây giờ <br><br>- Facebook ngày xưa cứ đăng bài là bán được hàng <br><br>- Facebook ngày xưa tương tác cực tốt, tăng like trên page cực dễ <br><br>- Facebook ngày xưa cũng có thời bị coi là toàn \"trẻ con\", \"trẻ trâu\"<br><br>...&nbsp;</p>\n<p><br><br><strong>Hiện tại thì sao? </strong><br><br>- Kinh doanh trên Facebook ngày càng khó khăn, đơn giản thôi: Vì ai ai cũng bán hàng trên đấy, thì lấy đâu người mua? Chưa kể người mua bây giờ họ thông minh hơn rồi, không còn dễ tính như xưa. <br><br>- Facebook bây giờ nếu có full 5000 bạn bè, thì đăng 1 bài chắc cũng được 200-500 lượt tiếp cận, vậy thì bán cho ai đây? <br><br>- Facebook bây giờ chạy quảng cáo cũng cực kỳ khoai, hơi tý thì vi phạm chính sách, vô hiệu hóa tài khoản...mà chạy được thì giá thầu cũng đắt. Không tối ưu tối, là lỗ sặc tiết ngay. <br><br>... Đấy, mới vài vấn đề này thôi, đã thấy đau đầu rồi bạn nhỉ? Thực chất là nếu bạn quyết tâm, đương đầu -&gt; thì vẫn có cách giải quyết thôi. Hoặc là, có 1 cách khác, là hãy thử sức với 1 nền tảng khác đi, vì sao? <br><br>- Vì cái gì mới thì nó cũng dễ hơn, để nó kéo người dùng <br><br>- Vì mỗi nền tảng mới sinh ra, đều giúp cho 1 bộ phận lớn những người giàu lên. Mình chưa giàu nhờ Facebook, nhưng mình sẽ giàu nhờ TikTok thì sao? <br><br>- Vì rất nhiều đứa ngoài kia, nó cũng chuyển sang TikTok rồi, giờ nếu mình không làm thì chả nhẽ để \"chúng nó\" làm chán chê mình mới làm à ? <br><br>- Vì ... Khóa học này có vài trăm nghìn thôi, rất đáng để thử. Và nếu học xong không hài lòng, thì cứ inbox cho Cấn Mạnh Linh tôi, tôi sẽ hoàn lại tiền, 100% luôn nhé. À, nhân tiện thì cho tôi giới thiệu Cấn Mạnh Linh là ai ?, và khóa học sẽ giúp được gì cho bạn nhé. <br><br>     Cấn Mạnh Linh, là Founder của TikTokVip, tổ chức đã đào tạo 6 kênh TikTok dành cho kinh doanh từ 1 đến 4 triệu follows; 15 kênh dẫn đầu các ngành nghề; hơn 32 kênh trên 100k follow trong vòng 6 tháng ... Trong đó có những học viên tiêu biểu như kênh @elkayvietnam - trùm thiết kế với 4,1m follows, tháng doanh thu cả tỷ đồng; kênh sếp quốc dân @lechilinh88 - 2,5m follows, thủ môn Bùi Tiến Dũng 1,7m follows, kênh phong thủy sư thế giới - @phongthuyphunggia 354k follow đứng đầu lĩnh vực phong thủy ... Hay kênh mẹ bỉm @dshahung, người bán 100 đơn/ ngày, liên tiếp 15 ngày .... <br><br>Và tất cả những gì chúng tôi nói ra, đều là những thứ chúng tôi đã làm được, và đây là khóa học đóng gói kiến thức của những thành công vang dội trên, nó được đóng gói theo lộ trình: <br>- Phần 1: Hiểu về tầm nhìn, và lý do tại sao TikTok lại giúp chúng ta kiếm rất nhiều tiền <br><br>- Phần 2: Hiểu rõ về thuật toán TikTok: Tại sao có clip nhiều view, clip ít view; Làm sao để có 1 video lên đề xuất; Định hình rõ con đường bạn muốn đi, để dẫn dắt khách hàng, từ lúc họ biết đến bạn đến khi họ mua hàng; Những điều cơ bản cần tránh khi làm TikTok để tài khoản phát triển mạnh mẽ, bền vững; Làm sao để có những clip triệu view ... <br><br>- Phần 3: 10 kỹ năng edit clip của các TikToker, mà chỉ cần dùng điện thoại <br><br>Đó, rất nhiều học viên của tôi họ đã áp dụng những kiến thức trên và thành công. Nếu bạn muốn tìm hiểu kỹ hơn về tôi thì hãy tìm Facebook \"Cấn Mạnh Linh\" hoặc vào tìm TikTokVip nhé. <br><br>P/s: Có 1 câu nói mà tôi rất tâm đắc rằng: \"Có 2 thời điểm tốt nhất để trồng cây, thời điểm thứ 1 là cách đây 20 năm trước, và thời điểm thứ 2 là NGAY BÂY GIỜ\". Và nếu bạn không muốn bỏ lỡ cơ hội để giàu lên với Internet, với TikTok, thì hãy BẮT ĐẦU NGAY nhé. Sẽ chẳng có gì xảy ra nếu bạn đọc xong mà không hành động đâu. Hẹn gặp bạn trong khóa học !</p>\n');
INSERT INTO `course` VALUES (2, 192, 'Dinh dưỡng cho trẻ nhỏ, cách cho ăn dặm, chăm sóc con từ 6 - 12 tháng tuổi thông minh, khoẻ mạnh, lớn nhanh. ', b'0', 'Bí quyết cho trẻ ăn dặm lớn nhanh, khỏe mạnh', 399000, 0, 1, '2021-09-19 06:58:30', 1, 58, 33, '2021-05-19 15:35:12', b'1', 0, 0, 700000.00, 43, '<h3><strong>Mẹ có biết:</strong>&nbsp;</h3>\n<p>6 -12 tháng tuổi là giai đoạn vô cùng quan trọng trong quá trình phát<br> triển của con. Vai trò của dinh dưỡng quyết định đến sự phát triển về <br>trí não và thể chất của bé. &nbsp;</p>\n<p>Đó cũng là giai đoạn trẻ dễ mắc bệnh suy dinh dưỡng nhất. Nếu bố mẹ, <br>người chăm trẻ không đủ kiến thức để chăm sóc con thì việc trẻ bị suy <br>dinh dưỡng rất dễ xảy ra.&nbsp;</p>\n<h3><strong>Tuy nhiên, mẹ cần chú ý:</strong>&nbsp;</h3>\n<p>⚠️ Để cung cấp đầy đủ chất dinh dưỡng cho trẻ và cho con ăn đúng <br>cách, mẹ cần có kiến thức về dinh dưỡng, phương pháp chế biến thức ăn, <br>cách cho con ăn hợp lý về không gian thời gian.&nbsp;</p>\n<p>⚠️ Hiểu được nhu cầu và tính cách của từng trẻ để có phương pháp phù <br>hợp. Tránh tình trạng cho trẻ ăn theo công thức chung mà không quan tâm <br>đến sức khỏe, nhu cầu, tính cách của bé.&nbsp;</p>\n<p>⚠️Khi chăm sóc trẻ cần hiểu được tầm quan trọng, vai trò các thành <br>phần dinh dưỡng trong khẩu ăn cho bé. Hiểu được những dấu hiệu trẻ có <br>nhu cầu ăn dặm. &nbsp;</p>\n<p>⚠️Nắm được những nguyên tắc cơ bản của việc chế thức ăn để tránh tình<br> trạng mất cân đối trong khẩu phần ăn, khiến cho trẻ không có hứng thú <br>ăn uống.&nbsp;</p>\n<p>⚠️ Việc cho ăn cũng rất cần đến phương pháp và cách tiếp cận trẻ, <br>biết cách tính toán hợp lý giữa sữa mẹ và thức ăn bổ sung trên từng trẻ <br>cụ thể, tạo tâm lý thoải mái để trẻ hứng thú với việc ăn uống.&nbsp;</p>\n<p>Chính vì thế, khóa học nuôi dạy con “<strong>Bí quyết cho trẻ ăn dặm lớn nhanh, khỏe mạnh”</strong><br> của giảng viên Đào Ngọc Cường chuyên gia đào tạo hàng đầu Việt Nam về <br>phát triển con người và tạo động lực sẽ giúp các bậc cha mẹ nắm bắt được<br> từng giai đoạn để có cách bổ sung thức ăn hợp lý, phù hợp với độ tuổi <br>của trẻ. Nắm được những điều nên và không nên làm trong quá trình cho ăn<br> dặm.      &nbsp;</p>\n<p>Ngay hôm nay, bạn hãy đăng ký để sở hữu những bí quyết chưa bật mí của khóa học “<strong>Bí quyết cho trẻ ăn dặm lớn nhanh, khỏe mạnh</strong>” ngay nhé!&nbsp;</p>\n');
INSERT INTO `course` VALUES (3, 99, 'Độc cô cửu kiếm được coi là triết lý đặc sắc của Đạo gia đề cao việc sử dụng kiếm thuật một cách linh hoạt, người luyện kiếm pháp này sẽ trở thành một cao thủ kiếm khách, có thể phá giải hết tất cả võ học trong thiên hạ. Luyện đến cảnh giới cuối cùng có thể dùng bất cứ thứ gì làm kiếm, đạt tới cảnh giới \"vô chiêu thắng hữu chiêu\". ', b'0', 'Độc cô cửu kiếm', 6718050, 4, 2, '2021-06-20 06:58:19', 1, 58, 1, '2021-05-19 15:35:12', b'1', 2, 2, 14929000.00, 55, NULL);
INSERT INTO `course` VALUES (4, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 4', 657300, 0, 0, '2021-09-18 17:09:21', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4382000.00, 85, NULL);
INSERT INTO `course` VALUES (5, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 5', 458920, 0, 0, '2019-11-19 04:34:37', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4172000.00, 89, NULL);
INSERT INTO `course` VALUES (6, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 6', 3237330, 0, 0, '2019-05-17 05:12:53', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5487000.00, 41, NULL);
INSERT INTO `course` VALUES (7, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 7', 3513390, 0, 0, '2020-09-20 15:11:21', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4233000.00, 17, NULL);
INSERT INTO `course` VALUES (8, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 8', 2415050, 0, 0, '2019-07-18 22:46:10', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4391000.00, 45, NULL);
INSERT INTO `course` VALUES (9, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 9', 4814600, 0, 0, '2020-07-18 23:15:11', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13756000.00, 65, NULL);
INSERT INTO `course` VALUES (10, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 10', 3877020, 0, 0, '2020-12-27 16:51:58', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6154000.00, 37, NULL);
INSERT INTO `course` VALUES (11, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 11', 344680, 0, 0, '2019-08-09 23:43:09', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2462000.00, 86, NULL);
INSERT INTO `course` VALUES (12, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 12', 861120, 0, 0, '2019-11-03 13:48:52', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3312000.00, 74, NULL);
INSERT INTO `course` VALUES (13, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 13', 7413280, 0, 0, '2019-11-10 16:24:45', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13238000.00, 44, NULL);
INSERT INTO `course` VALUES (14, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 14', 365000, 0, 0, '2020-04-08 12:19:46', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7300000.00, 95, NULL);
INSERT INTO `course` VALUES (15, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 15', 354480, 0, 0, '2020-02-03 00:36:45', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2532000.00, 86, NULL);
INSERT INTO `course` VALUES (16, 190, 'Thiết kế và làm việc với phần mềm CorelDraw một cách chuyên nghiệp, nhanh chóng và tiết kiệm thời gian', b'0', 'Khóa học CorelDRAW thiết kế quảng cáo', 504000, 0, 1, '2021-09-18 20:32:48', 1, 91, 32, '2021-05-19 15:35:12', b'1', 0, 0, 800000.00, 37, '<p><strong>Khóa học phù hợp cho mọi đối tượng yêu thích ngành thiết kế đồ họa.</strong><br><br>✔ Bạn là sinh viên các chuyên ngành mỹ thuật, thiết đồ họa,… cần kỹ năng sử dụng thành thạo phần mềm CorelDraw để phục vụ cho công việc và học thiết kế.<br><br>✔ Bạn là người đang đi làm cần bổ sung, chuẩn hóa kiến thức, tăng khả năng hoàn thiện và thăng tiến trong nghề nghiệp có liên quan đến sáng tạo.<br><br>✔ Bạn là nhân viên thiết kế hình ảnh thương hiệu của công ty, doanh nghiệp…<br><br>✔ Bạn đang làm về công việc thiết kế in ấn và quảng cáo.<br><br>✔ Bạn mong muốn thiết kế được các sản phẩm như biển quảng cáo, biển đèn led, cardvisit, standee, Logo, vỏ hộp, vỏ bao bì...<br><br>✔ Tất cả những ai có đam mê về thiết kế.<br><br><strong>=&gt; Đây chính là khóa học dành cho bạn.<br><br>Lợi ích của khóa học CorelDraw</strong><br><br>CorelDraw luôn là lựa chọn ưu tiên của những Designer chuyên nghiệp tại Việt Nam. Hiện nay các xưởng in ấn đều tương thích với file in đuôi CDR. Do vậy CorelDraw luôn là lựa chọn an toàn cho những nhà thiết kế chuyên nghiệp. Hơn nữa, một số phần mềm cắt chữ vi tính, có thể đặt lệnh cắt trực tiếp từ CorelDraw hoặc xuất sang định dạng khác. Giao diện của phần mềm đơn giản, dễ sử dụng. Trong khóa học này tôi sẽ giúp bạn tìm hiểu các công cụ quan trọng để có thể sử dụng phần mềm thiết kế CorelDraw một cách nhanh chóng và hiệu quả.</p>\n');
INSERT INTO `course` VALUES (17, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 17', 3631940, 0, 0, '2019-03-16 10:42:38', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5954000.00, 39, NULL);
INSERT INTO `course` VALUES (18, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 18', 7710060, 0, 0, '2020-04-23 17:19:24', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10419000.00, 26, NULL);
INSERT INTO `course` VALUES (19, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 19', 12308320, 0, 0, '2020-09-04 09:42:36', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14312000.00, 14, NULL);
INSERT INTO `course` VALUES (20, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 20', 11980800, 0, 0, '2019-09-10 11:44:52', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14976000.00, 20, NULL);
INSERT INTO `course` VALUES (21, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 21', 1332760, 0, 0, '2019-08-21 10:21:29', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2563000.00, 48, NULL);
INSERT INTO `course` VALUES (22, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 22', 306880, 0, 0, '2020-04-01 13:07:39', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7672000.00, 96, NULL);
INSERT INTO `course` VALUES (23, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 23', 2110550, 0, 0, '2019-09-26 17:59:34', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3247000.00, 35, NULL);
INSERT INTO `course` VALUES (24, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 24', 4285700, 0, 0, '2020-03-19 00:04:43', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12605000.00, 66, NULL);
INSERT INTO `course` VALUES (25, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 25', 4910760, 0, 0, '2019-11-09 13:23:32', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13641000.00, 64, NULL);
INSERT INTO `course` VALUES (26, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 26', 1339650, 0, 0, '2019-05-07 14:56:25', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10305000.00, 87, NULL);
INSERT INTO `course` VALUES (27, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 27', 4211240, 0, 0, '2020-07-18 15:42:21', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 9571000.00, 56, NULL);
INSERT INTO `course` VALUES (28, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 28', 3554500, 0, 0, '2019-04-10 21:53:51', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7109000.00, 50, NULL);
INSERT INTO `course` VALUES (29, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 29', 6178240, 0, 0, '2019-06-22 05:20:33', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7184000.00, 14, NULL);
INSERT INTO `course` VALUES (30, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 30', 458370, 0, 0, '2020-07-22 08:48:36', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 1389000.00, 67, NULL);
INSERT INTO `course` VALUES (31, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 31', 4777200, 0, 0, '2020-09-26 07:17:13', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5308000.00, 10, NULL);
INSERT INTO `course` VALUES (32, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 32', 46570, 0, 0, '2020-10-24 05:42:58', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4657000.00, 99, NULL);
INSERT INTO `course` VALUES (33, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 33', 3592800, 0, 0, '2019-03-10 02:56:36', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7485000.00, 52, NULL);
INSERT INTO `course` VALUES (34, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 34', 4360360, 0, 0, '2019-10-21 01:31:06', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6508000.00, 33, NULL);
INSERT INTO `course` VALUES (35, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 35', 3016800, 0, 0, '2020-03-04 23:31:52', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10056000.00, 70, NULL);
INSERT INTO `course` VALUES (36, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 36', 6244300, 0, 0, '2020-02-21 20:54:33', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7615000.00, 18, NULL);
INSERT INTO `course` VALUES (37, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 37', 1021750, 0, 0, '2019-12-07 22:12:22', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 1525000.00, 33, NULL);
INSERT INTO `course` VALUES (38, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 38', 11312440, 0, 0, '2019-05-04 05:38:01', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13154000.00, 14, NULL);
INSERT INTO `course` VALUES (39, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 39', 3124380, 0, 0, '2019-01-11 09:06:53', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14878000.00, 79, NULL);
INSERT INTO `course` VALUES (40, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 40', 2189600, 0, 0, '2019-09-13 09:05:06', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3910000.00, 44, NULL);
INSERT INTO `course` VALUES (41, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 41', 3137070, 0, 0, '2020-06-14 00:04:40', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5919000.00, 47, NULL);
INSERT INTO `course` VALUES (42, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 42', 3018000, 0, 0, '2019-02-20 23:05:11', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7545000.00, 60, NULL);
INSERT INTO `course` VALUES (43, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 43', 2696760, 0, 0, '2019-10-14 02:21:09', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2724000.00, 1, NULL);
INSERT INTO `course` VALUES (44, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 44', 7983050, 0, 1, '2020-12-22 13:19:30', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 11915000.00, 33, NULL);
INSERT INTO `course` VALUES (45, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 45', 828460, 0, 0, '2020-07-22 13:58:23', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 1801000.00, 54, NULL);
INSERT INTO `course` VALUES (46, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 46', 9620520, 0, 0, '2019-04-17 16:45:52', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 11453000.00, 16, NULL);
INSERT INTO `course` VALUES (47, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 47', 3953220, 0, 0, '2019-02-10 15:49:58', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 9642000.00, 59, NULL);
INSERT INTO `course` VALUES (48, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 48', 8091590, 0, 0, '2019-05-27 14:45:43', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12077000.00, 33, NULL);
INSERT INTO `course` VALUES (49, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 49', 2791860, 0, 0, '2019-04-02 03:48:03', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3534000.00, 21, NULL);
INSERT INTO `course` VALUES (50, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 50', 2883820, 0, 0, '2020-03-12 10:56:34', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7589000.00, 62, NULL);
INSERT INTO `course` VALUES (51, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 51', 6416280, 0, 0, '2019-10-27 02:21:34', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12339000.00, 48, NULL);
INSERT INTO `course` VALUES (52, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 52', 1353320, 0, 0, '2019-03-03 15:27:41', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2942000.00, 54, NULL);
INSERT INTO `course` VALUES (53, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 53', 569520, 0, 0, '2020-02-28 16:02:19', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 904000.00, 37, NULL);
INSERT INTO `course` VALUES (54, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 54', 1371480, 0, 0, '2019-04-07 10:07:06', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2078000.00, 34, NULL);
INSERT INTO `course` VALUES (55, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 55', 5603760, 0, 0, '2019-08-24 10:47:50', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6516000.00, 14, NULL);
INSERT INTO `course` VALUES (56, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 56', 7688440, 0, 0, '2020-10-01 12:44:37', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8357000.00, 8, NULL);
INSERT INTO `course` VALUES (57, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 57', 64350, 0, 0, '2020-12-07 16:27:51', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 429000.00, 85, NULL);
INSERT INTO `course` VALUES (58, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 58', 5605410, 0, 0, '2019-03-17 14:13:49', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6443000.00, 13, NULL);
INSERT INTO `course` VALUES (59, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 59', 226080, 0, 0, '2020-02-19 08:30:37', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5652000.00, 96, NULL);
INSERT INTO `course` VALUES (60, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 60', 347970, 0, 0, '2019-06-12 20:44:41', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 1657000.00, 79, NULL);
INSERT INTO `course` VALUES (61, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 61', 6396820, 0, 0, '2020-01-14 03:43:20', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7801000.00, 18, NULL);
INSERT INTO `course` VALUES (62, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 62', 12381300, 0, 0, '2019-05-25 19:54:43', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13757000.00, 10, NULL);
INSERT INTO `course` VALUES (63, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 63', 2882300, 0, 0, '2019-09-11 18:05:53', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3034000.00, 5, NULL);
INSERT INTO `course` VALUES (64, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 64', 4159200, 0, 0, '2020-12-06 09:31:09', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5199000.00, 20, NULL);
INSERT INTO `course` VALUES (65, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 65', 1554630, 0, 0, '2019-03-07 16:27:44', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4711000.00, 67, NULL);
INSERT INTO `course` VALUES (66, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 66', 208700, 0, 0, '2019-01-02 17:29:07', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10435000.00, 98, NULL);
INSERT INTO `course` VALUES (67, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 67', 0, 0, 0, '2019-11-25 06:29:58', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12744000.00, 100, NULL);
INSERT INTO `course` VALUES (68, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 68', 4825620, 0, 0, '2020-09-27 09:32:02', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12699000.00, 62, NULL);
INSERT INTO `course` VALUES (69, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 69', 2637600, 0, 0, '2019-03-04 16:01:53', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3297000.00, 20, NULL);
INSERT INTO `course` VALUES (70, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 70', 5002280, 0, 0, '2020-12-09 01:15:45', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6332000.00, 21, NULL);
INSERT INTO `course` VALUES (71, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 71', 1922940, 0, 0, '2020-10-23 22:40:51', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7122000.00, 73, NULL);
INSERT INTO `course` VALUES (72, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 72', 3141950, 0, 0, '2020-11-25 11:21:39', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8977000.00, 65, NULL);
INSERT INTO `course` VALUES (73, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 73', 4947800, 0, 0, '2020-09-14 14:46:33', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8996000.00, 45, NULL);
INSERT INTO `course` VALUES (74, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 74', 1867960, 0, 0, '2019-10-22 19:10:24', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4556000.00, 59, NULL);
INSERT INTO `course` VALUES (75, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 75', 2349910, 0, 0, '2019-08-27 01:28:50', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13823000.00, 83, NULL);
INSERT INTO `course` VALUES (76, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 76', 3022920, 0, 0, '2019-11-22 20:07:46', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 11196000.00, 73, NULL);
INSERT INTO `course` VALUES (77, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 77', 161320, 0, 0, '2019-06-02 11:58:52', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8066000.00, 98, NULL);
INSERT INTO `course` VALUES (78, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 78', 11203280, 0, 0, '2019-10-06 20:54:55', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12731000.00, 12, NULL);
INSERT INTO `course` VALUES (79, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 79', 9117550, 0, 0, '2019-01-19 15:29:31', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10985000.00, 17, NULL);
INSERT INTO `course` VALUES (80, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 80', 5778180, 0, 0, '2020-05-13 21:17:32', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6147000.00, 6, NULL);
INSERT INTO `course` VALUES (81, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 81', 2827500, 0, 0, '2020-09-17 22:53:41', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 11310000.00, 75, NULL);
INSERT INTO `course` VALUES (82, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 82', 5711200, 0, 0, '2019-01-27 08:25:27', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12980000.00, 56, NULL);
INSERT INTO `course` VALUES (83, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 83', 7180290, 0, 0, '2019-02-12 05:58:06', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12597000.00, 43, NULL);
INSERT INTO `course` VALUES (84, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 84', 3846570, 0, 0, '2019-12-13 12:20:26', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4227000.00, 9, NULL);
INSERT INTO `course` VALUES (85, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 85', 2683250, 0, 0, '2019-09-15 19:02:11', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10733000.00, 75, NULL);
INSERT INTO `course` VALUES (86, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 86', 13259940, 0, 0, '2020-07-16 16:10:21', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14258000.00, 7, NULL);
INSERT INTO `course` VALUES (87, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 87', 0, 0, 0, '2019-10-20 19:39:28', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3223000.00, 100, NULL);
INSERT INTO `course` VALUES (88, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 88', 3524100, 0, 0, '2020-09-12 12:32:16', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4146000.00, 15, NULL);
INSERT INTO `course` VALUES (89, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 89', 12155960, 0, 0, '2019-12-19 12:56:09', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13213000.00, 8, NULL);
INSERT INTO `course` VALUES (90, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 90', 2043900, 0, 0, '2019-02-11 01:04:26', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6813000.00, 70, NULL);
INSERT INTO `course` VALUES (91, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 91', 2614170, 0, 0, '2019-07-11 06:52:01', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6703000.00, 61, NULL);
INSERT INTO `course` VALUES (92, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 92', 12974000, 0, 0, '2020-10-23 02:42:38', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12974000.00, 0, NULL);
INSERT INTO `course` VALUES (93, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 93', 2956800, 0, 0, '2020-03-11 11:40:02', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3080000.00, 4, NULL);
INSERT INTO `course` VALUES (94, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 94', 3317380, 0, 0, '2020-02-27 06:03:14', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 9757000.00, 66, NULL);
INSERT INTO `course` VALUES (95, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 95', 78810, 0, 0, '2020-01-27 16:59:40', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2627000.00, 97, NULL);
INSERT INTO `course` VALUES (96, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 96', 11889290, 0, 0, '2020-02-23 14:44:28', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12257000.00, 3, NULL);
INSERT INTO `course` VALUES (97, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 97', 5837760, 0, 0, '2019-03-28 06:07:10', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8108000.00, 28, NULL);
INSERT INTO `course` VALUES (98, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 98', 353760, 0, 0, '2020-12-03 13:56:06', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8844000.00, 96, NULL);
INSERT INTO `course` VALUES (99, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 99', 674000, 0, 0, '2019-02-10 17:27:57', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 674000.00, 0, NULL);
INSERT INTO `course` VALUES (100, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 100', 4027320, 0, 0, '2019-12-07 00:04:46', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14916000.00, 73, NULL);
INSERT INTO `course` VALUES (101, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 101', 2708400, 0, 0, '2020-10-10 09:49:08', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7320000.00, 63, NULL);
INSERT INTO `course` VALUES (102, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 102', 2644530, 0, 0, '2019-06-18 08:23:22', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12593000.00, 79, NULL);
INSERT INTO `course` VALUES (103, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 103', 1107680, 0, 0, '2019-09-05 12:57:43', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3956000.00, 72, NULL);
INSERT INTO `course` VALUES (104, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 104', 10634380, 0, 0, '2019-01-22 08:34:57', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14978000.00, 29, NULL);
INSERT INTO `course` VALUES (105, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 105', 6114610, 0, 0, '2020-01-23 17:15:40', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7367000.00, 17, NULL);
INSERT INTO `course` VALUES (106, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 106', 4579640, 0, 0, '2020-05-08 00:07:33', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8807000.00, 48, NULL);
INSERT INTO `course` VALUES (107, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 107', 1347760, 0, 0, '2020-06-04 02:36:46', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3964000.00, 66, NULL);
INSERT INTO `course` VALUES (108, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 108', 1727520, 0, 0, '2020-01-27 12:44:25', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10797000.00, 84, NULL);
INSERT INTO `course` VALUES (109, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 109', 4636900, 0, 0, '2020-11-06 17:06:56', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5210000.00, 11, NULL);
INSERT INTO `course` VALUES (110, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 110', 3703050, 0, 0, '2019-06-22 20:24:22', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8229000.00, 55, NULL);
INSERT INTO `course` VALUES (111, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 111', 7081020, 0, 0, '2019-09-15 15:50:14', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7533000.00, 6, NULL);
INSERT INTO `course` VALUES (112, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 112', 6107320, 0, 0, '2019-06-27 19:55:29', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10012000.00, 39, NULL);
INSERT INTO `course` VALUES (113, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 113', 2705250, 0, 0, '2019-01-16 00:47:12', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10821000.00, 75, NULL);
INSERT INTO `course` VALUES (114, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 114', 1312800, 0, 0, '2019-02-22 07:28:45', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2735000.00, 52, NULL);
INSERT INTO `course` VALUES (115, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 115', 118350, 0, 0, '2019-02-04 02:26:25', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 1315000.00, 91, NULL);
INSERT INTO `course` VALUES (116, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 116', 12566540, 0, 0, '2019-10-01 04:05:41', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12823000.00, 2, NULL);
INSERT INTO `course` VALUES (117, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 117', 1776600, 0, 0, '2019-03-01 10:48:21', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5076000.00, 65, NULL);
INSERT INTO `course` VALUES (118, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 118', 11786820, 0, 0, '2019-09-21 22:10:04', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12674000.00, 7, NULL);
INSERT INTO `course` VALUES (119, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 119', 4767840, 0, 0, '2020-04-17 02:54:54', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6192000.00, 23, NULL);
INSERT INTO `course` VALUES (120, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 120', 1603920, 0, 0, '2020-06-16 06:51:44', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6683000.00, 76, NULL);
INSERT INTO `course` VALUES (121, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 121', 10354080, 0, 0, '2019-01-18 10:40:54', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13992000.00, 26, NULL);
INSERT INTO `course` VALUES (122, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 122', 48460, 0, 0, '2019-08-11 12:16:12', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2423000.00, 98, NULL);
INSERT INTO `course` VALUES (123, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 123', 8474670, 0, 0, '2019-08-03 04:35:50', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 9741000.00, 13, NULL);
INSERT INTO `course` VALUES (124, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 124', 7709180, 0, 0, '2019-11-25 05:15:00', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12638000.00, 39, NULL);
INSERT INTO `course` VALUES (125, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 125', 5262400, 0, 0, '2020-09-17 05:57:19', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5720000.00, 8, NULL);
INSERT INTO `course` VALUES (126, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 126', 2147600, 0, 0, '2020-09-22 10:47:46', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5369000.00, 60, NULL);
INSERT INTO `course` VALUES (127, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 127', 712250, 0, 0, '2019-04-07 12:35:42', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14245000.00, 95, NULL);
INSERT INTO `course` VALUES (128, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 128', 1015950, 0, 0, '2019-02-23 15:55:58', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7815000.00, 87, NULL);
INSERT INTO `course` VALUES (129, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 129', 1664600, 0, 0, '2020-01-19 18:53:08', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2030000.00, 18, NULL);
INSERT INTO `course` VALUES (130, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 130', 5087820, 0, 0, '2020-05-27 20:05:26', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13389000.00, 62, NULL);
INSERT INTO `course` VALUES (131, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 131', 2082600, 0, 0, '2019-07-16 14:34:34', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3204000.00, 35, NULL);
INSERT INTO `course` VALUES (132, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 132', 2454270, 0, 0, '2019-05-13 18:17:09', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8463000.00, 71, NULL);
INSERT INTO `course` VALUES (133, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 133', 940950, 0, 0, '2020-01-22 04:11:24', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2295000.00, 59, NULL);
INSERT INTO `course` VALUES (134, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 134', 4094880, 0, 0, '2020-10-21 07:59:44', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10776000.00, 62, NULL);
INSERT INTO `course` VALUES (135, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 135', 8010750, 0, 0, '2019-07-19 17:30:53', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14565000.00, 45, NULL);
INSERT INTO `course` VALUES (136, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 136', 3939760, 0, 0, '2020-04-08 00:20:05', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5324000.00, 26, NULL);
INSERT INTO `course` VALUES (137, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 137', 5720330, 0, 0, '2020-08-08 04:53:34', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 7429000.00, 23, NULL);
INSERT INTO `course` VALUES (138, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 138', 2167800, 0, 0, '2020-07-05 06:54:31', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10839000.00, 80, NULL);
INSERT INTO `course` VALUES (139, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 139', 1782200, 0, 0, '2019-07-17 12:49:09', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4690000.00, 62, NULL);
INSERT INTO `course` VALUES (140, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 140', 7179900, 0, 0, '2019-11-04 20:13:56', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10257000.00, 30, NULL);
INSERT INTO `course` VALUES (141, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 141', 1464060, 0, 0, '2019-12-16 17:17:44', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3754000.00, 61, NULL);
INSERT INTO `course` VALUES (142, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 142', 9480900, 0, 0, '2020-11-13 09:14:31', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14365000.00, 34, NULL);
INSERT INTO `course` VALUES (143, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 143', 502740, 0, 0, '2020-03-19 09:39:08', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2646000.00, 81, NULL);
INSERT INTO `course` VALUES (144, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 144', 924630, 0, 0, '2019-04-15 00:02:10', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 1813000.00, 49, NULL);
INSERT INTO `course` VALUES (145, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 145', 12608000, 0, 0, '2019-01-01 02:30:18', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12608000.00, 0, NULL);
INSERT INTO `course` VALUES (146, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 146', 319500, 0, 0, '2019-05-18 22:03:33', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5325000.00, 94, NULL);
INSERT INTO `course` VALUES (147, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 147', 3061800, 0, 0, '2019-12-25 09:50:59', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 11340000.00, 73, NULL);
INSERT INTO `course` VALUES (148, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 148', 8730100, 0, 0, '2019-03-15 14:22:52', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13030000.00, 33, NULL);
INSERT INTO `course` VALUES (149, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 149', 6551600, 0, 0, '2019-01-21 20:24:08', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14890000.00, 56, NULL);
INSERT INTO `course` VALUES (150, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 150', 704100, 0, 0, '2020-06-03 13:40:56', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 11735000.00, 94, NULL);
INSERT INTO `course` VALUES (151, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 151', 13058480, 0, 0, '2020-03-07 13:32:40', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13892000.00, 6, NULL);
INSERT INTO `course` VALUES (152, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 152', 10831940, 0, 0, '2019-01-13 00:42:54', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 11053000.00, 2, NULL);
INSERT INTO `course` VALUES (153, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 153', 2035370, 0, 0, '2019-07-28 06:37:36', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 5501000.00, 63, NULL);
INSERT INTO `course` VALUES (154, 179, 'Đối với Thất Tinh cư trú tại \"Ngọc Kinh Đài\" cao vời vợi kia mà nói, Ganyu tuyệt không phải là \"hộ tinh\" phục vụ họ, mà là người điều phối mạng lưới thông tin phức tạp khắp cảng Liyue, cũng là người xây dựng nền tảng hiệu quả hành chính của cảng Liyue.', b'0', 'Demo 154', 1374880, 0, 0, '2020-08-13 13:29:43', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8593000.00, 84, NULL);
INSERT INTO `course` VALUES (155, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 155', 109950, 0, 0, '2020-12-06 20:49:25', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 2199000.00, 95, NULL);
INSERT INTO `course` VALUES (156, 179, 'Trong mắt của cô gái nửa người nửa tiên Ganyu, rốt cuộc giữa biển người tấp nập và những ngọn núi tĩnh mịch nơi đâu mới được gọi là nhà?', b'0', 'Demo 156', 2827170, 0, 0, '2020-05-14 21:26:24', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 10471000.00, 73, NULL);
INSERT INTO `course` VALUES (157, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 157', 1293690, 0, 0, '2019-02-18 21:13:06', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4461000.00, 71, NULL);
INSERT INTO `course` VALUES (158, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 158', 11958040, 0, 0, '2020-08-25 02:22:55', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13436000.00, 11, NULL);
INSERT INTO `course` VALUES (159, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 159', 10812360, 0, 0, '2019-04-20 14:15:53', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 12428000.00, 13, NULL);
INSERT INTO `course` VALUES (160, 179, 'Trải qua hàng nghìn năm, người lên đảm nhiệm chức vụ Thất Tinh không ngừng thay đổi, chỉ có Ganyu vẫn luôn ở đây chứng kiến cảnh phồn hoa náo nhiệt của cảng Liyue.', b'0', 'Demo 160', 2190750, 0, 0, '2020-07-12 07:23:45', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3175000.00, 31, NULL);
INSERT INTO `course` VALUES (161, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 161', 6890870, 0, 0, '2020-01-05 13:35:00', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14063000.00, 51, NULL);
INSERT INTO `course` VALUES (162, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 162', 3433920, 0, 0, '2020-07-09 07:27:04', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4704000.00, 27, NULL);
INSERT INTO `course` VALUES (163, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 163', 7122720, 0, 0, '2020-07-17 20:00:26', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 9372000.00, 24, NULL);
INSERT INTO `course` VALUES (164, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 164', 2768790, 0, 0, '2019-11-12 16:28:02', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 4539000.00, 39, NULL);
INSERT INTO `course` VALUES (165, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 165', 4338720, 0, 0, '2020-08-20 17:28:14', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 6026000.00, 28, NULL);
INSERT INTO `course` VALUES (166, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 166', 4192320, 0, 0, '2020-04-05 18:15:10', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 8734000.00, 52, NULL);
INSERT INTO `course` VALUES (167, 179, 'Ganyu là nhân vật cuối cùng của phiên bản 1.2 “Vôi trắng và rồng đen” được nhà phát triển Mihoyo giới thiệu đến cộng đồng. Ngay từ những ngày đầu tiên, cô nàng Ganyu này đã nhanh chóng chinh phục trái tim game thủ Genshin Impact với ngoại hình cũng như tính cách dễ mến, mặc dù luôn chìm đắm trong công việc và hay quên.', b'0', 'Demo 167', 14397180, 0, 0, '2019-05-20 12:25:32', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 14691000.00, 2, NULL);
INSERT INTO `course` VALUES (168, 179, 'Bên cạnh sức mạnh và khả năng phối hợp đội hình gần như hoàn hảo của Cocogoat, chuỗi nhiệm vụ cốt truyện của Ganyu được đánh giá khá nhàm chán và thiếu đi những giây phút cao trào hoành tráng. Tuy nhiên theo Cái Bang tôi thì cốt truyện của Ganyu cũng giống như một cuốn sách, khi bạn đọc xong và gấp lại thì những eater eggs thú vị trong game mới lần lượt lộ rõ. Hãy cùng 2game điểm qua những chi tiết thú vị trong cốt truyện của Ganyu và những pha bẻ cua thú vị của nhà phát triển nhé.', b'0', 'Demo 168', 851760, 0, 0, '2019-08-05 10:18:41', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3276000.00, 74, NULL);
INSERT INTO `course` VALUES (169, 179, 'Những biên bản cuộc họp phức tạp, những dữ liệu báo cáo lộn xộn... Mỗi ngày công văn chồng chất như núi, đều được một tay cô ấy sắp xếp thành những văn bản rõ ràng và rành mạch, hỗ trợ Thất Tinh trong mọi quyết sách và hiệp định, cho đến các chỉ thị luân chuyển trong các bộ phận đơn vị khác nhau.', b'0', 'Demo 169', 2598400, 0, 0, '2019-12-20 19:03:14', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 3712000.00, 30, NULL);
INSERT INTO `course` VALUES (170, 179, 'Dòng máu \"con người\" chảy trong huyết quản khiến cô lưu luyến ánh đèn thành phố rực rỡ, nhưng bản chất \"tiên\" lại khiến cô hoài niệm những tháng ngày nhàn nhã thong dong nơi tiên sơn động phủ.', b'0', 'Demo 170', 13323840, 0, 0, '2020-11-14 12:05:41', 1, 58, 1, '2021-05-19 15:35:12', b'1', 0, 0, 13879000.00, 4, NULL);
INSERT INTO `course` VALUES (171, 182, 'Kiến thức cơ bản dành cho dân IT, không phân biệt bạn theo Front-end, Back-end hay Devops', b'0', 'Kiến thức cơ bản, cốt lõi dân IT cần học trước', 7165620, 0, 3, '2021-09-18 17:33:07', 1, 58, 2, '2021-05-25 14:02:46', b'1', 0, 0, 10857000.00, 34, NULL);
INSERT INTO `course` VALUES (178, 183, 'Khóa học đề cao việc thực hành qua những ví dụ trong thực tế giúp học viên nhanh chóng xây dựng được giao diện website', b'0', 'HTML, CSS từ Zero đến Hero', 2850, 0, 2, '2021-09-18 17:33:33', 1, 58, 2, '2021-05-25 14:15:57', b'1', 0, 0, 15000.00, 81, NULL);
INSERT INTO `course` VALUES (179, 184, 'Eula là đội trưởng của \"tiểu đội du kích\" trong Đội Kỵ Sĩ Tây Phong.\n\nDo yêu cầu công việc, cô ấy phải thường xuyên dẫn đội đi săn ma vật và Giáo Đoàn Vực Sâu ở bên ngoài trong thời gian dài, rất ít khi trở về Thành Mondstadt. ', b'0', 'Tìm hiểu Eula 2', 54600, 0, 0, '2021-09-18 17:34:01', 1, 58, 19, '2021-05-25 14:28:25', b'1', 0, 0, 260000.00, 79, NULL);
INSERT INTO `course` VALUES (180, 179, 'Waifu', b'0', 'Ganyu', 138000, 0, 0, '2021-06-21 20:07:46', 1, NULL, 1, '2021-06-12 18:46:13', b'1', 0, 0, 200000.00, 31, NULL);
INSERT INTO `course` VALUES (181, 188, 'Khóa học phần mềm Corel online giúp bạn thành thạo các kỹ năng thiết kế liên quan đến ngành quảng cáo - in ấn làm ra các sản phẩm in trên máy in Kỹ Thuật Số', b'0', 'Thiết kế quảng cáo với phần mềm CorelDRAW', 347900, 0, 0, '2021-09-18 20:32:51', 1, 84, 32, '2021-06-12 18:48:10', b'0', 0, 0, 490000.00, 29, '<p><strong>Phần mềm CorelDRAW là gì?</strong><br>Đồ họa vector là phần mềm giúp bạn tạo ra các đối tượng, hình ảnh dựa vào các thuật toán. Một bản thiết kế hoàn chỉnh của nhiều đối tượng vector riêng biệt. Mỗi đối tượng vector được tô màu dựa trên các điểm và đường giới hạn.<br><br>Phần mềm đồ họa vector CorelDraw là phần mềm vẽ minh họa, giúp bạn tạo ra những đối tượng và những bản thiết kế dưới dạng vector. Đồng thời CorelDraw là một trong những phần mềm thiết kế đồ họa được ưa thích nhất.<br><br><strong>Tuy nhiên:</strong><br>❌ Để học được các kiến thức về phần mềm  CorelDraw rất khó. Chúng rất khô khan, nhàm chám và khó tiếp thu.<br><br>❌ Tự học đồ họa muốn giỏi thì bạn cần phải học được các kiến thức nền tảng, căn bản nhất để từ đó có tư duy, cách học thiết kế đúng nhất, chuẩn nhất.<br><br>❌ Bạn cần hiểu, nắm chắc và thực hành được các file làm việc mới cũng như thiết lập được hệ màu trong in ấn và làm việc với file.<br><br>❌  Biết cách làm quen với giao diện hiển thị, vùng làm việc của phần mềm CorelDraw. Thực hiện quản lý các thanh điều khiển, thanh công cụ, vùng làm việc cơ bản của Corel.<br><br>❌  Ghi nhớ những phím tắt thường xuyên được sử dụng với phần mềm.<br><br>Để bạn nắm vững những điều này, không gặp khó khăn khi học phần mềm Corel online, chúng tôi muốn giới thiệu đến các bạn khóa học “Thiết kế quảng cáo với phần mềm CorelDRAW” của giảng viên Nguyễn Đức Minh trên UNICA.<br><br>Khóa học \"<strong>Thiết kế quảng cáo với phần mềm CorelDRAW</strong> \" được rút gọn - đúc kết từ những kinh nghiệm thực tế 90% thực hành, các mẫu thiết kế của chuyên gia Design quảng cáo. Áp dụng vào lĩnh vực in ấn-  bảng quảng cáo, bảng đèn Led..<br><br>Kết thúc khóa học phần mềm Corel online này, chúng tôi tin rằng bạn sẽ biết cách sử dụng phần mềm này để thiết kế quảng cáo một cách thuần thục, nhanh chóng…<br><br>Hãy đăng ký khóa học “<strong>Thiết kế quảng cáo với phần mềm CorelDRAW</strong>” ngay hôm nay nhé!</p>\n');
INSERT INTO `course` VALUES (182, 167, 'Best Waifu', b'0', 'Ganyu', 88500, 0, 0, '2021-09-18 08:06:43', 1, NULL, 2, '2021-06-20 06:14:06', b'1', 0, 0, 150000.00, 41, NULL);
INSERT INTO `course` VALUES (183, 179, 'Best Waifu', b'0', 'Tìm hiểu Ganyu 4', 1921260, 0, 0, '2021-06-21 07:08:07', 1, NULL, 2, '2021-06-20 08:53:57', b'1', 0, 0, 2343000.00, 18, NULL);
INSERT INTO `course` VALUES (184, 179, 'Test', b'0', 'Hoàng Test', 1127000, 0, 0, '2021-06-21 07:02:44', 1, NULL, 19, '2021-06-21 07:02:44', b'1', 0, 0, 1150000.00, 2, NULL);
INSERT INTO `course` VALUES (185, 179, 'Ganyu', b'0', 'Tìm Hiểu Ganyu', 30000, 0, 0, '2021-06-28 06:40:31', 1, NULL, 22, '2021-06-28 06:40:31', b'1', 0, 0, 150000.00, 80, NULL);
INSERT INTO `course` VALUES (186, 179, 'Ganyu', b'0', 'Tìm Hiểu Ganyu', 30000, 0, 0, '2021-06-28 06:42:27', 1, NULL, 22, '2021-06-28 06:42:27', b'1', 0, 0, 150000.00, 80, NULL);
INSERT INTO `course` VALUES (187, 165, 'hodsfjofds', b'0', 'Test 1', 30000, 0, 0, '2021-09-18 08:05:56', 1, NULL, 2, '2021-07-05 08:18:52', b'1', 0, 0, 150000.00, 80, NULL);
INSERT INTO `course` VALUES (188, 179, '12313', b'0', 'Eula', 22162, 0, 0, '2021-07-05 10:00:47', 1, NULL, 22, '2021-07-05 10:00:47', b'1', 0, 0, 123123.00, 82, NULL);
INSERT INTO `course` VALUES (189, 179, '123123', b'0', 'Eula', 8852853, 0, 0, '2021-07-05 10:08:29', 1, NULL, 19, '2021-07-05 10:08:29', b'1', 0, 0, 13213213.00, 33, NULL);
INSERT INTO `course` VALUES (190, 179, '34342342', b'0', 'Eula', 604000, 0, 0, '2021-07-05 10:09:10', 1, NULL, 22, '2021-07-05 10:09:10', b'1', 0, 0, 1510000.00, 60, NULL);
INSERT INTO `course` VALUES (191, 179, '34342342', b'0', 'Eula', 1268400, 0, 0, '2021-07-05 10:10:47', 1, NULL, 22, '2021-07-05 10:10:47', b'1', 0, 0, 1510000.00, 16, NULL);
INSERT INTO `course` VALUES (192, 179, '34342342', b'0', 'Eula', 1147600, 0, 0, '2021-07-05 10:12:02', 1, NULL, 22, '2021-07-05 10:12:02', b'1', 0, 0, 1510000.00, 24, NULL);
INSERT INTO `course` VALUES (193, 179, '34342342', b'0', 'Eula', 422800, 0, 0, '2021-07-05 10:15:45', 1, NULL, 22, '2021-07-05 10:15:45', b'1', 0, 0, 1510000.00, 72, NULL);
INSERT INTO `course` VALUES (194, 179, '34342342', b'0', 'Eula', 1087200, 0, 1, '2021-07-05 10:18:59', 1, NULL, 22, '2021-07-05 10:18:59', b'1', 0, 0, 1510000.00, 28, NULL);
INSERT INTO `course` VALUES (195, 179, '34342342', b'0', 'Eula', 437900, 0, 0, '2021-07-05 10:20:58', 1, NULL, 22, '2021-07-05 10:20:58', b'1', 0, 0, 1510000.00, 71, NULL);
INSERT INTO `course` VALUES (196, 179, '34342342', b'0', 'Eula', 588900, 0, 0, '2021-07-05 10:22:08', 1, NULL, 22, '2021-07-05 10:22:08', b'1', 0, 0, 1510000.00, 61, NULL);
INSERT INTO `course` VALUES (197, 179, '34342342', b'0', 'Eula', 770100, 0, 1, '2021-07-05 10:27:51', 1, NULL, 22, '2021-07-05 10:27:51', b'1', 0, 0, 1510000.00, 49, NULL);
INSERT INTO `course` VALUES (198, 159, 'Khóa học chứng khoán online giúp bạn nắm bắt được kiến thức đầu tư chứng khoán đầy đủ, bài bản và chi tiết nhất dành cho người mới bắt đầu tham gia. Bí quyết để nhanh chóng có được nguồn lợi nhuận khổng lồ từ thị trường chứng khoán', b'0', 'Nhập môn chứng khoán', 300000, 0, 0, '2021-09-18 07:57:01', 1, 58, 1, '2021-09-05 10:47:11', b'1', 0, 0, 600000.00, 50, NULL);
INSERT INTO `course` VALUES (199, 138, 'Bạn là người yêu thích công việc nội trợ, yêu thích việc làm bánh và quan tâm tới những thực phẩm, đồ ăn vegan (thuần chay)? Bạn hiểu được những tác dụng “thần kỳ” của việc ăn chay đối với sức khoẻ của mình như: tăng cường sức khoẻ, giúp thọ lâu nhờ protein có trong các loại rau củ, ngũ cốc, giúp tâm tính được hiền hoà an vui, giúp giảm cân, giảm thiểu rất nhiều bệnh lý cho con người và giúp làn da trở nên tươi trẻ và đẹp hơn rất nhiều. \n\nBạn muốn mang đến những chiếc bánh thuần chay dinh dưỡng, tốt cho sức khoẻ đến bạn bè người thân như một món quà nhỏ chan chứa đầy tình cảm. Vậy tại sao bạn không thử bắt tay ngay vào với khóa học làm bánh thuần chay của UNICA để thực hiện điều ý nghĩa này.\n\nHãy đến ngay với khóa học 20 công thức bánh thuần chay tốt cho sức khỏe của giảng viên Lê Thủy Xuân tại Unica.vn. \n\nKhóa học làm 20 loại bánh ngọt vegan (bánh ngọt thuần chay) được thiết kế để giúp những người cảm thấy e ngại với công việc bếp núc có thể tự tin thể hiện bản thân, làm ra nhiều loại bánh tuyệt vời cho những người thân yêu. Với cách làm đơn giản, các nguyên liệu tốt cho sức khỏe, dễ dàng tìm mua được ở Việt Nam, khóa học sẽ đem đến cho bạn những kỹ năng làm bánh như những người thợ bánh chuyên nghiệp.\n\nMục đích ăn chay đối với nhiều người có thể chỉ được xem như một niềm tin tôn giáo, tuy nhiên, thực phẩm chay cũng đem lại những lợi ích tuyệt vời đối với sức khỏe.\n\nNgười theo chế độ ăn thuần chay tránh tất cả các sản phẩm từ động vật, kể cả mật ong, phấn ong, nước mắm, sữa, bơ, pho mát... Họ chỉ ăn các sản phẩm từ thực vật như: Các loại rau, củ, trái cây, các loại đậu đỗ, thảo mộc, rong biển, nước ép trái cây hay rau củ, tinh dầu ép lạnh (dầu dừa, dầu olive...), mứt, bơ thực vật, thực phẩm lên men (miso, kimchi...), siro, giấm, chocolate (loại không sữa)...\n\nHãy đăng ký ngay khoá học 20 công thức bánh thuần chay tốt cho sức khỏe của giảng viên Lê Thủy Xuân ngay hôm nay nhé!', b'0', '20 công thức bánh thuần chay tốt cho sức khỏe', 7800, 0, 0, '2021-09-15 10:26:39', 1, 50, 23, '2021-09-15 07:03:00', b'1', 0, 0, 13684.00, 43, NULL);
INSERT INTO `course` VALUES (200, 158, 'Cung cấp 18+ công thức làm bánh và cách hướng dẫn chi tiết cách làm các loại bánh ngọt không cần lò nướng để chiêu đãi gia đình và bạn bè, tự tạo làm nên những món quà tặng ý nghĩa dành cho người thân ', b'0', 'Tự làm 18 loại bánh tại nhà không cần lò nướng', 505750, 0, 0, '2021-09-18 07:21:05', 1, 58, 23, '2021-09-15 08:56:15', b'1', 0, 0, 595000.00, 15, NULL);
INSERT INTO `course` VALUES (201, 164, NULL, b'0', '20 cách làm bánh sinh nhật hiện đại', 630000, 5, 1, '2021-09-18 08:00:55', 1, 52, 23, '2021-09-15 08:57:10', b'1', 1, 5, 700000.00, 10, NULL);
INSERT INTO `course` VALUES (202, 163, NULL, b'0', 'Tự làm bánh mì mềm và pizza tại nhà', 402000, 0, 0, '2021-09-18 08:00:22', 1, NULL, 23, '2021-09-15 10:39:47', b'1', 0, 0, 600000.00, 33, NULL);
INSERT INTO `course` VALUES (203, 162, 'Tự tay làm được những chiếc bánh Nerikiri xinh xắn với vô vàn hình dạng, màu sắc đẹp mắt, thỏa mãn đam mê, tiết kiệm tài chính và an toàn thực phẩm ', b'0', 'Kỹ thuật làm bánh Nerikiri (Wagashi) cơ bản', 599000, 0, 0, '2021-09-18 07:59:46', 1, 59, 23, '2021-09-17 20:10:12', b'1', 0, 0, 599000.00, 0, NULL);
INSERT INTO `course` VALUES (204, 161, 'Mở rộng hiểu biết về văn hóa ẩm thực Nhật Bản, tự tay làm các loại bánh Mochi và Yatsuhashi nổi tiếng của Nhật cho người thân, bạn bè hay kinh doanh ', b'0', 'Tự làm các loại bánh Mochi Nhật Bản', 599000, 0, 0, '2021-09-18 07:59:15', 1, 64, 23, '2021-09-17 20:16:02', b'1', 0, 0, 599000.00, 0, NULL);
INSERT INTO `course` VALUES (205, 160, NULL, b'0', 'Tự tay làm 20 loại bánh bổ dưỡng cho con tại nhà', 499000, 0, 0, '2021-09-18 07:58:50', 1, 64, 23, '2021-09-17 20:39:31', b'1', 0, 0, 499000.00, 0, NULL);
INSERT INTO `course` VALUES (206, 168, 'Nắm công thức ngon nhất để làm ra 20 loại bánh quy từ cơ bản - phổ biến nhất tới các loại bánh quy trang trí độc đáo, mới lạ nhất. ', b'0', 'Tự tay làm 20 loại bánh quy Tết độc đáo', 498000, 0, 0, '2021-09-18 08:27:31', 1, 69, 23, '2021-09-18 08:13:22', b'1', 0, 0, 600000.00, 17, '<p>12313123</p>\n');
INSERT INTO `course` VALUES (207, 170, 'Tự tay làm món bánh su và cookie thơm ngon, không chất bảo quản, thỏa mãn nhu cầu ăn uống trong gia đình hoặc mở tiệm kinh doanh nhỏ. ', b'0', '10 Món bánh su và 12 món bánh cookie', 999000, 0, 0, '2021-09-18 08:33:47', 1, 70, 23, '2021-09-18 08:32:57', b'1', 0, 0, 999000.00, 0, '<p style=\"text-align:justify;\"><strong><em>Vấn đề của khách hàng</em></strong>&nbsp;</p>\r\n<p style=\"text-align:justify;\">❌ Bạn có niềm đam mê ẩm thực và mong muốn tự tay mình làm ra những chiếc bánh thơm ngon mời người thân và bạn bè.&nbsp;</p>\r\n<p style=\"text-align:justify;\">❌ Bạn không thuận lợi trong việc sắp xếp thời gian tham gia các khóa học làm bánh ở các trung tâm đào tạo.&nbsp;</p>\r\n<p style=\"text-align:justify;\">❌ Bạn chỉ muốn học làm bánh cơ bản để thử sức khả năng của mình trong lĩnh việc làm bánh này.&nbsp;</p>\r\n<p style=\"text-align:justify;\">❌ Hoặc bạn muốn mở một tiệm bánh nhỏ để kinh doanh hoặc đi kèm với kinh doanh thức uống.&nbsp;</p>\r\n<p style=\"text-align:justify;\"><strong><em>Bạn đừng quá lo lắng, </em></strong>&nbsp;</p>\r\n<p style=\"text-align:justify;\">&gt;&gt; Khóa học online với chuyên đề <strong><em>10 món bánh su và 12 món bánh cookies</em></strong> được biên soạn bởi giảng viên<strong><em> Bạch Huỳnh Uyên Linh </em></strong>sẽ đáp ứng được những nhu cầu cơ bản nhất cho các bạn mới bước chân vào lĩnh vực làm bánh này. &nbsp;</p>\r\n<p style=\"text-align:justify;\"><strong><em>Điểm đặc biệt của khóa học</em></strong>&nbsp;</p>\r\n<p style=\"text-align:justify;\">✔️ Khóa học mua một lần sở hữu <br>trọn đời. Bạn có thể học mọi lúc, mọi nơi, bất kỳ lúc nào mình rảnh rỗi <br>và cũng dễ dàng sắm cho mình 1 số dụng cụ, nguyên vật liệu để làm ra <br>được những chiếc bánh su thơm ngon với nhân kem không chất bảo quản, hay<br> những chiếc bánh cookie để dành cho trẻ con ăn vặt mà không phải lo sợ <br>về hóa chất hay phẩm màu.&nbsp;</p>\r\n');
INSERT INTO `course` VALUES (208, 171, 'Giúp bạn biết cách làm những chiếc bánh thạch, bánh rau câu trung thu thơm ngon, hấp dẫn, an toàn cho sức khỏe để chiêu đãi cả nhà, hoặc làm bánh thạch làm quà tặng ý nghĩa thân thương ', b'0', 'Nghệ thuật làm bánh thạch trung thu', 399000, 0, 1, '2021-09-18 09:00:51', 1, 72, 23, '2021-09-18 08:37:46', b'1', 0, 0, 700000.00, 43, '<h3><span style=\"font-size: 14px;\"><strong>Bánh trung thu - nét đẹp văn hóa truyền thống</strong></span>&nbsp;</h3>\r\n<p>    Mỗi dịp hè qua, thu lại đến, mọi người rộn rã chuẩn bị cho dịp <br>trung thu đêm rằm. Đi trên các con phố, bạn dễ dàng bắt gặp những quầy <br>bán bánh trung thu với đủ các thương hiệu. Những chiếc bánh nướng, bánh <br>dẻo thơm ngon mang đậm hương vị truyền thống đang được bày bán khắp <br>nơi. Tuy nhiên không phải ai cũng thích ăn loại bánh này, vì cái vị <br>ngậy, béo, nhiều đường của chúng.&nbsp;</p>\r\n<p>    Mùa trung thu năm nay, bạn có muốn trổ tài khéo tay bằng những chiếc Bánh Trung thu thạch rau câu?&nbsp;</p>\r\n<p>    Dù bạn có ăn kiêng, bạn sợ đồ ngọt cũng vẫn có thể thưởng thức <br>được loại bánh này. Được làm từ nguyên liệu chính là bột thạch (bột rau <br>câu), kết hợp với các loại rau củ quả quanh mình, vô cùng an toàn cho <br>sức khỏe.&nbsp;</p>\r\n<h3><span style=\"font-size: 14px;\"><strong>Hãy đến với khóa học làm bánh \"Nghệ thuật làm bánh thạch trung thu\" tại Unica!</strong></span>&nbsp;</h3>\r\n<p>    Khóa học \"<strong>Nghệ thuật làm bánh thạch trung thu\"</strong> do <strong>Phù thủy thạch 3d Phương Nga</strong><br> hướng dẫn bạn học làm bánh với những chiếc bánh thạch thơm ngon, hấp <br>dẫn, vừa mang dáng vẻ của bánh trung thu truyền thống, lại có vị ngọt <br>dịu, màu sắc hấp dẫn mà bất kỳ ai cũng thích.&nbsp;</p>\r\n<p>    Với chất liệu rau câu, bạn có thể tùy ý biến tấu thành nhiều vị <br>với nhiều màu sắc hấp dẫn tùy theo sở thích của mỗi người và đặc biệt là<br> bạn có thể ăn nhiều chiếc bánh cùng lúc mà không bị ngán.&nbsp;</p>\r\n<p>    Kết thúc khóa học bạn hoàn toàn có thể tự tạo tạo nên những chiếc<br> bánh thạch trung thu hấp dẫn và chinh phục được bất cứ ai khi nhìn thấy<br> thành phẩm của bạn.&nbsp;</p>\r\n<h3><span style=\"font-size: 14px;\"><strong>Bạn sẽ biết cách làm:</strong></span>&nbsp;&nbsp;</h3>\r\n<ul>\r\n<li>Bánh Thạch trung thu hoa quả&nbsp;</li>\r\n<li> Bánh Thạch trung thu vị cà phê sữa dừa&nbsp;</li>\r\n<li>Bánh Thạch trung thu dẻo&nbsp;</li>\r\n<li>Bánh Thạch trung thu sữa chua hoa quả&nbsp;</li>\r\n<li>Bánh Thạch trung thu nhân hoa quả, thanh long, chanh leo&nbsp;</li>\r\n</ul>\r\n<p>Và còn rất rất nhiều các loại bánh thạch trung thu khác do chính phù thủy bánh thạch 3D trực tiếp hướng dẫn bạn.&nbsp;</p>\r\n<p>Đừng chần chừ nữa hãy đăng ký ngay khóa học \"<strong>Nghệ thuật làm bánh thạch trung thu\" </strong>tại Unica!&nbsp;</p>\r\n');
INSERT INTO `course` VALUES (209, 172, 'Dành cho người có định hướng với nghề Phun Xăm Thẩm Mỹ ', b'0', 'Phun Xăm Thẩm Mỹ Cơ Bản', 696500, 0, 0, '2021-09-18 08:53:40', 1, 71, 23, '2021-09-18 08:52:46', b'1', 0, 0, 1990000.00, 65, '<p>Nhu cầu làm đẹp của mọi người ngày càng nhiều. Đặc biệt là ở các chị <br>em phụ nữ. Vì vậy Phun Xăm Thẩm Mỹ đang là 1 trong những nghành làm đẹp <br>Hot nhất hiện nay Tại Việt Nam, với con số hơn 2.500 Spa, thẩm mỹ viện <br>hàng năm được thành lập Ngành này đang cần khoảng 15.000 chuyên viên <br>phun xăm thẩm mỹ có tay nghề cao&nbsp;</p>\r\n<p>Nếu bạn là 1 người yêu thích nghề làm đẹp và muốn học 1 nghề để kiếm <br>được tiền hoặc bạn đang làm việc tại các Spa, Thẩm mỹ viện, Bênh viện <br>thẩm mỹ. Thì đây là khóa học dành riêng cho bạn.&nbsp;</p>\r\n<p>Trong khoá học này, tôi sẽ giúp bạn nắm bắt quy trình từ A-Z để 1 <br>người mới bắt đầu học Phun xăm thẩm mỹ cho đến khi thành thạo và ra làm <br>nghề được&nbsp;</p>\r\n<p>Khóa học duy nhất trên thị trường hướng dẫn tỉ mỉ, chi tiết về phun xăm thẩm mỹ. Mua 1 lần - Học mãi mãi và Hỗ trợ trọn đời&nbsp;</p>\r\n');
INSERT INTO `course` VALUES (210, 180, 'Hướng dẫn cách kê khai và làm quyết toán thuế thu nhập cá nhân, giúp kế toán viên tự tin trong công việc', b'0', 'Kinh nghiệm kê khai và quyết toán thuế thu nhập cá nhân từ A - Z', 496000, 0, 0, '2021-09-18 17:27:51', 1, 73, 23, '2021-09-18 12:54:34', b'1', 0, 0, 800000.00, 38, '<p>Guitar đã trở thành một nhạc cụ vô cùng quen thuộc ngày nay, chúng góp phần cho cuộc sống của con người thêm vui vẻ và hài hòa. Thực tế cho thấy những người có khả năng chơi một loại nhạc cụ nào đó thì luôn biết cách làm mình nổi bật giữa đám đông và vô cùng tự tin. <br><br>Trong một cuộc khảo sát tâm lý mới đây, với câu hỏi: Người đàn ông lý tưởng của bạn là gì? Có đến 70% các cô gái được hỏi đã nói: Người đàn ông lý tưởng của họ là người biết chơi Guitar.<br><br>Vậy tại sao bạn lại không chơi Guitar?<br><br>Guitar đệm hát đang là xu hướng dẫn đầu trong cộng đồng người yêu thích và chơi đàn guitar, cũng là phương thức chơi đàn thông dụng kết hợp song song giữa việc chơi đàn và hát<br><br>Hãy đến với khóa học âm nhạc \"Đệm hát Guitar cơ bản của Hà Kế Tú\" - một Guitarist - giảng viên Guitar nổi tiếng Việt Nam được nhắc đến với cái tên Haketu để làm chủ cây đàn Guitar trong tay và hát nghêu ngao cùng bạn bè, người yêu... chỉ trong một thời gian ngắn học guitar cơ bản đệm hát và thực hành.<br><br>Khóa học có gì dành cho bạn?<br><br>✔️ Trong khóa học, bạn sẽ biết các kiến thức cơ bản học guitar đệm hát trong Guitar để bạn có thể làm chủ một cách nhanh chóng cây đàn<br><br>✔️ Kiến thức nhạc lý cơ bản, đệm lý trong guitar đệm hát và một số hợp âm cơ bản cần nắm được<br><br>✔️ Mẹo chỉnh dây đàn guitar chuẩn và nhanh chóng<br><br>✔️ Được học guitar cơ bản đệm hát về các điệu: Valse, Boston, Slow Rock, Surf Ballad, Disco... thông qua 10+ bài tập thực hành chơi guitar các bài hát tiêu biểu.<br><br>✔️ Hoàn thiện kỹ năng chơi guitar một cách hoàn chỉnh thành thạo với 10+ bài đêm hát khác<br><br>✔️ Được định hướng phong cách chơi và định hướng con đường chuyên nghiệp cho người chơi guitar về sau.<br><br>Vậy còn chờ gì nữa mà không học guitar đệm hát cùng Haketu nhanh chóng làm chủ cây đàn Guitar ngay tại nhà với khóa học \"Đệm hát Guitar cơ bản của Hà Kế Tú\" thôi nào!</p>\n');
INSERT INTO `course` VALUES (211, 187, 'Bạn muốn tự tay thiết kế nội thất cho gia đình? Bạn muốn theo đuổi ngành thiết kế nội thất. Tham gia khóa học thiết kế nội thất online bạn sẽ nắm được kỹ thuật về thiết kế bằng 3D-Max chuyên nghiệp', b'0', 'Thiết kế nội thất bằng 3D-Max', 389350, 0, 0, '2021-09-18 19:22:28', 1, 78, 32, '2021-09-18 19:03:57', b'1', 0, 0, 599000.00, 35, '<p><strong>Bạn thân mến, </strong><br><br>Xã hội ngày càng phát triển, nhu cầu về một cuộc sống chất lượng cũng được nâng cao. Ngày nay, gia chủ không chỉ quan tâm đến độ bền vững của ngôi nhà mà họ còn để ý nhiều hơn, chú trọng sâu hơn đến một không gian sống tiện nghi, hợp thời, thể hiện được tính cách của mình. Đây đang là xu hướng chung của xã hội và điều đó khiến nghề thiết kế nội thất trở nên đắt giá hơn bao giờ hết. Nếu như kiến trúc sư công trình được ví von như người sinh ra một cơ thể sống thì các nhà thiết kế nội thất là người “thổi hồn”, tô điểm để cơ thể sống đó trở thành một con người đẹp đẽ với diện mạo mới, tạo nên giá trị sống mới.<br><br>Khóa học \"<strong>Thiết kế nội thất bằng 3D-Max</strong>\" do giảng viên Nguyễn Thy Đoan Trinh được ra mắt với mục đích nhằm cung cấp cho học viên cái nhìn tổng quan nhất về thiết kế nội thất bằng công cụ 3D - Max, hiểu được các kỹ năng tạo hình 3D các mẫu thiết kế về nội thất sao cho giống thật nhất .<br><br>Sau khi hoàn thành khóa học thiết kế nội thất online, học viên sẽ có thể:<br><br>     ✔️ Học thiết kế để hiểu về công cụ 3D Max, về các thao tác và lệnh làm việc cơ bản<br><br>     ✔️ Nắm được các kỹ thuật cơ bản nhất về thiết kế nội thất trong môi trường 3D<br><br>     ✔️ Trực tiếp thực hành vẽ các sản phẩm như tuýt kem, màn cửa, khung tranh, đồng hồ, kệ sách, quạt... những đồ nội thất cơ bản của một ngôi nhà<br><br>     ✔️ Thực hành vẽ đồ nội thất chuyên biệt cho từng phòng, khu vực riêng như phòng khách, phòng ngủ, cầu thang,...<br><br>     ✔️ Có tư duy thiết kế đồ dùng và sắp xếp đồ nội thất.<br><br>     ✔️ Có kiến thức nền tảng vững chắc để bạn có thể bắt đầu làm việc việc tại các công ty chuyên thực hiện thiết kế mô hình 3D, nhất là thiết kế nội thất 3D.<br><br>Tham gia khóa học thiết kế nội thất online trực tuyến \"<strong>Thiết kế nội thất bằng 3D-Max</strong>\" của giảng viên Nguyễn Thy Đoan Trinh ngay hôm nay thôi!</p>\n');
INSERT INTO `course` VALUES (212, 191, 'Lắng nghe con, phát huy điểm mạnh của con, gần gũi với con cái, thấu hiểu con cái để nuôi dạy con tốt nhất. ', b'0', '19 Tuyệt chiêu nuôi dạy con thành tài', 548390, 0, 0, '2021-09-19 06:54:16', 1, 92, 33, '2021-09-19 06:52:06', b'1', 0, 0, 899000.00, 39, '<p>Sinh con và nuôi dạy con là cả một quá trình gian nan mà bất kỳ <br>bậc cha mẹ nào cũng trải qua. Trẻ con giống như một trang giấy trắng, <br>được tô đen, bồi hồng và phát triển theo đúng những gì chúng trông thấy <br>và trải qua. Vì vậy, việc giáo dục và nuôi dạy con cái từ khi còn nhỏ <br>là rất quan trọng.&nbsp;</p>\r\n<p>Có rất nhiều phụ huynh phàn nàn về việc không thể nói chuyện được với<br> con khi con lớn. Trước hết, hãy làm bạn với con, lắng nghe con, từ đó <br>con sẽ lắng nghe mình.&nbsp;</p>\r\n<p>Khóa học <strong>“19 Tuyệt chiêu nuôi dạy con thành tài”</strong> của <strong>Diễn giả Đào Ngọc Cường</strong><br> sẽ tiết lộ cho Bạn – các bậc cha mẹ, thầy cô những bí quyết để trở <br>thành những người bạn, người đồng hành để tư vấn, hướng dẫn, hỗ trợ cho <br>con sống có mục tiêu, quan tâm yêu thương gia đình hơn.&nbsp;</p>\r\n<p><strong>Bạn sẽ biết cách:</strong>&nbsp;&nbsp;</p>\r\n<ul>\r\n<li>Thông qua những quan sát, giúp phát hiện ra những điểm mạnh, sở trường của con để giúp con phát huy, thấu hiểu con&nbsp;</li>\r\n<li>Lý giải những hành động của trẻ mà bạn không thể hiểu nổi.&nbsp;</li>\r\n<li>Giúp cha mẹ tìm ra tiếng nói chung với con cái trong độ tuổi phát triển thay đổi về tâm sinh lý.&nbsp;</li>\r\n<li>Tránh được những sai lầm của cha mẹ trong quá trình nuôi dạy con&nbsp;</li>\r\n<li>Hiểu được đam mê, sở trường, sở thích, năng khiếu của con để có <br>phương pháp giáo dục phù hợp, định hướng tương lai nghề nghiệp cho con <br>sau này.&nbsp;</li>\r\n<li>Giải quyết tình trạng biếng ăn của trẻ.  &nbsp;</li>\r\n</ul>\r\n<p>Đối với cha mẹ, việc học nuôi dạy con phát triển toàn diện cả về thể <br>chất và tinh thần đòi hỏi quá trình lâu dài và thật sự kiên trì. Bởi từ <br>khi sinh ra, các bậc làm cha, làm mẹ đều phải ý thức được vai trò và <br>nghĩa vụ của mình trong việc nuôi dạy và định hướng cho con. Vậy nên, <br>nếu thật sai lầm khi bố mẹ bỏ qua khóa học <strong>“19 Tuyệt chiêu nuôi dạy con thành tài”</strong> của<strong> Diễn giả Đào Ngọc Cường</strong> có trên Unica.                     &nbsp;</p>\r\n');

-- ----------------------------
-- Table structure for evaluates
-- ----------------------------
DROP TABLE IF EXISTS `evaluates`;
CREATE TABLE `evaluates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `user_poster_id` bigint(20) NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_poster_id`(`user_poster_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `evaluates_ibfk_1` FOREIGN KEY (`user_poster_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evaluates_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evaluates
-- ----------------------------
INSERT INTO `evaluates` VALUES (1, 'Khóa học rất bổ ích', b'0', '2021-09-05 19:16:37', '2021-09-05 19:16:37', 1, 5, 1);
INSERT INTO `evaluates` VALUES (2, 'Hay', b'0', '2021-09-05 19:16:37', '2021-09-05 19:16:37', 1, 1, 3);
INSERT INTO `evaluates` VALUES (12, 'test danh gia', b'0', '2021-09-18 13:22:01', '2021-09-18 13:22:01', 68, 5, 201);
INSERT INTO `evaluates` VALUES (13, 'Tốt', b'0', '2021-09-19 06:48:53', '2021-09-19 06:48:53', 2, 3, 3);

-- ----------------------------
-- Table structure for image_admin
-- ----------------------------
DROP TABLE IF EXISTS `image_admin`;
CREATE TABLE `image_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) NOT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_admin
-- ----------------------------
INSERT INTO `image_admin` VALUES (13, 128, b'0', '2021-09-04 06:13:16', '2021-09-04 06:13:16', 'background_home', '1');
INSERT INTO `image_admin` VALUES (14, 129, b'0', '2021-09-04 06:13:25', '2021-09-04 06:13:25', 'background_home', '2');
INSERT INTO `image_admin` VALUES (15, 130, b'0', '2021-09-04 06:13:31', '2021-09-04 06:13:31', 'background_home', '3');
INSERT INTO `image_admin` VALUES (16, 131, b'0', '2021-09-04 06:13:37', '2021-09-04 06:13:37', 'background_home', '4');

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
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of learning
-- ----------------------------
INSERT INTO `learning` VALUES (1, 171, 'Các kiến thức cơ bản, nền móng của ngành IT', b'0');
INSERT INTO `learning` VALUES (2, 171, 'Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng', b'0');
INSERT INTO `learning` VALUES (3, 171, 'Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng', b'0');
INSERT INTO `learning` VALUES (4, 171, 'Hiểu hơn về cách internet và máy vi tính hoạt động', b'0');
INSERT INTO `learning` VALUES (33, 1, 'Hiểu rõ tại sao TikToker thế giới kiếm được 10 triệu đô/năm  ', b'0');
INSERT INTO `learning` VALUES (35, 1, 'Biết cách xây dựng phong cách riêng cho kênh TikTok của mình', b'0');
INSERT INTO `learning` VALUES (45, 178, 'Biết cách xây dựng giao diện web với HTML, CSS', b'0');
INSERT INTO `learning` VALUES (47, 178, 'Biết cách phân tích giao diện website', b'0');
INSERT INTO `learning` VALUES (48, 178, 'Biết cách đặt tên class CSS theo chuẩn BEM', b'0');
INSERT INTO `learning` VALUES (49, 178, 'Biết cách làm giao diện web responsive', b'0');
INSERT INTO `learning` VALUES (50, 178, 'Làm chủ Flexbox khi dựng bố cục website', b'0');
INSERT INTO `learning` VALUES (51, 178, 'Sở hữu 2 giao diện web khi học xong khóa học', b'0');
INSERT INTO `learning` VALUES (52, 178, 'Biết cách tự tạo động lực cho bản thân', b'0');
INSERT INTO `learning` VALUES (53, 178, 'Biết cách tự học những kiến thức mới', b'0');
INSERT INTO `learning` VALUES (54, 1, 'Học được 10 kỹ năng edit clip trên điện thoại cho TikToker', b'0');
INSERT INTO `learning` VALUES (58, 1, 'Hiểu rõ về cơ chế đề xuất clip, để sản xuất có clip triệu View', b'0');
INSERT INTO `learning` VALUES (61, 1, 'Được thêm vào nhóm kín 2000 học viên TikTokVip', b'0');
INSERT INTO `learning` VALUES (64, 3, 'Tổng Quát Thức', b'0');
INSERT INTO `learning` VALUES (65, 3, 'Phá Kiếm Thức', b'0');
INSERT INTO `learning` VALUES (66, 3, 'Phá Đao Thức', b'0');
INSERT INTO `learning` VALUES (67, 3, 'Phá Khí Thức', b'0');
INSERT INTO `learning` VALUES (68, 3, 'Phá Chưởng Thức', b'0');
INSERT INTO `learning` VALUES (69, 3, 'Phá Tiễn Thức', b'0');
INSERT INTO `learning` VALUES (70, 3, 'Phá Thương Thức', b'0');
INSERT INTO `learning` VALUES (71, 3, 'Phá Tiên Thức', b'0');
INSERT INTO `learning` VALUES (72, 3, 'Phá Sách Thức', b'0');
INSERT INTO `learning` VALUES (73, 187, 'gjyggyjigyig', b'0');
INSERT INTO `learning` VALUES (74, 187, 'ouhgiyhbiy', b'0');
INSERT INTO `learning` VALUES (75, 199, 'Biết cách làm hơn 20 loại bánh ngọt thuần chay.', b'0');
INSERT INTO `learning` VALUES (76, 199, 'Hiểu biết về các thành phần và kĩ thuật cần thiết để làm các loại bánh ngọt thuần chay ', b'0');
INSERT INTO `learning` VALUES (77, 199, 'Hiểu biết về các thành phần và kĩ thuật cần thiết để làm các loại bánh ngọt thuần chay ', b'0');
INSERT INTO `learning` VALUES (78, 199, 'Tự tin hơn với công việc bếp núc.', b'0');
INSERT INTO `learning` VALUES (79, 199, 'Có thể kinh doanh bán bánh thuần chay online tại nhà hoặc mở tiệm sau khi hoàn ', b'0');
INSERT INTO `learning` VALUES (80, 199, ' Rèn luyện thêm những kỹ năng làm bánh chuyên nghiệp', b'0');
INSERT INTO `learning` VALUES (81, 201, 'Phương pháp làm bánh kem sinh nhật  với hơn 20 Làm trang trí ', b'0');
INSERT INTO `learning` VALUES (82, 201, ' Hướng dẫn pha màu, xếp bánh nhiều tầng', b'0');
INSERT INTO `learning` VALUES (83, 201, 'Tự tay làm bánh tặng những người thân yêu, đồng nghiệp', b'0');
INSERT INTO `learning` VALUES (84, 201, 'Các kỹ thuật thực tế về làm bánh theo phong cách hiện đại', b'0');
INSERT INTO `learning` VALUES (85, 201, 'Kỹ thuật trang trí bánh với kem bơ phong cách Hàn Quốc', b'0');
INSERT INTO `learning` VALUES (86, 201, 'Mở cửa hàng bánh sinh nhật hoặc kinh doanh online thêm thu nhập', b'0');
INSERT INTO `learning` VALUES (87, 198, 'Kiến thức cơ bản nhất về thị trường chứng khoán, về đầu tư chứng khoán và', b'0');
INSERT INTO `learning` VALUES (88, 198, 'Nắm được những công cụ để đánh giá, phân tích và đầu tư chứng khoán sớm có', b'0');
INSERT INTO `learning` VALUES (89, 198, 'Nhanh chóng biết cách đầu tư chứng khoán để đem về nguồn lợi nhuận khổng lồ', b'0');
INSERT INTO `learning` VALUES (90, 198, 'Có được tư duy đúng trong đầu tư cổ phiếu hiệu quả, thông minh', b'0');
INSERT INTO `learning` VALUES (91, 198, 'Tránh được những rủi ro thua lỗ, cạm bẫy trên TTCK', b'0');
INSERT INTO `learning` VALUES (92, 198, 'Đầy đủ những hướng dẫn \"cầm tay chỉ việc\" để có thể tự tin tham gia TTCK', b'0');
INSERT INTO `learning` VALUES (93, 203, 'Hiểu đúng ý nghĩa, nguồn gốc, lịch sử phát triển của dòng bánh', b'0');
INSERT INTO `learning` VALUES (94, 203, 'Làm được mứt đậu trắng, đậu đỏ, vỏ bánh, một số loại nhân bánh truyền thống của ', b'0');
INSERT INTO `learning` VALUES (95, 203, 'Thực hiện được các kỹ thuật tạo hình Wagashi cơ bản và một số tạo hình nâng', b'0');
INSERT INTO `learning` VALUES (96, 203, 'Cách chọn nguyên liệu, các loại dụng cụ (Nhật và thay thế), cách bảo quản sản phẩm', b'0');
INSERT INTO `learning` VALUES (97, 203, 'Biết cách sử dụng một số loại dụng cụ tạo hình Wagashi cơ bản của Nhật Bản và dụng ', b'0');
INSERT INTO `learning` VALUES (98, 203, ' Trình bày sản phẩm đẹp mắt và mang đậm phong cách Nhật Bản (trên đĩa, hộp sơn mài, gói sản phẩm để mang đi biếu tặng)', b'0');
INSERT INTO `learning` VALUES (99, 206, 'Nắm công thức ngon nhất để làm ra 20 loại bánh quy từ cơ bản - phổ biến nhất tới các loại bánh quy trang trí độc đáo, mới lạ nh', b'0');
INSERT INTO `learning` VALUES (100, 206, 'Được hướng dẫn cách làm ra bánh và tạo hình bánh vô cùng đáng yêu trong \"vỏ bọc\" ', b'0');
INSERT INTO `learning` VALUES (101, 206, 'Được hướng dẫn cách làm bánh quy thạch anh - một sáng tạo mới lạ của giảng viên khóa học. Không chỉ bắt mắt, bánh còn rấ', b'0');
INSERT INTO `learning` VALUES (102, 206, 'Cập nhật công thức ngon nhất cho Red velvet Chocolate chip, Biscotti Chocolate ', b'0');
INSERT INTO `learning` VALUES (103, 209, 'Tổng quan về nghành phun xăm thẩm mỹ', b'0');
INSERT INTO `learning` VALUES (104, 209, 'Các dụng cụ cần phải có khi học và làm nghề phun xăm ', b'0');
INSERT INTO `learning` VALUES (105, 209, 'Phân biệt các loại da và dáng lông mày phù hợp với từng khuôn mặt của khách hàng', b'0');
INSERT INTO `learning` VALUES (106, 209, 'Tự vẽ đươc dáng mày mong muốn trên người thật', b'0');
INSERT INTO `learning` VALUES (107, 209, 'Các thao tác trong khi phun xăm Mày - Môi  ', b'0');
INSERT INTO `learning` VALUES (108, 209, 'Thành thạo các kĩ thuật phun mày trên da giả: Nano Shading, Vi chạm hạt, Omber', b'0');
INSERT INTO `learning` VALUES (109, 209, 'Phương pháp xử lý lông mày trổ Xanh - trổ Đỏ', b'0');
INSERT INTO `learning` VALUES (110, 209, 'Kỹ thuật ghim hạt môi. Kỹ thuật phun môi xí muội', b'0');
INSERT INTO `learning` VALUES (111, 209, 'Quy trình chăm sóc và phục hồi Mày - Môi sau phun', b'0');
INSERT INTO `learning` VALUES (112, 209, 'Được hỗ trợ trọn đời từ trực tiếp từ giảng viên', b'0');
INSERT INTO `learning` VALUES (113, 210, 'Kiến thức nhạc lý và các hợp âm guitar cơ bản nhất', b'0');
INSERT INTO `learning` VALUES (114, 210, 'Có cái nhìn tổng quát nhất về Guitar đệm hát ngày nay', b'0');
INSERT INTO `learning` VALUES (115, 210, 'Thành thạo đệm hát 20+ bản nhạc mới và phổ biến ngày nay', b'0');
INSERT INTO `learning` VALUES (116, 210, 'Được định hướng phong cách chơi guitar và định hướng tương lai của người chơi', b'0');
INSERT INTO `learning` VALUES (117, 211, 'Có kiến thức nền tảng cơ bản về thiết kế 3D và thiết kế nội thất 3D bằng công cụ 3D', b'0');
INSERT INTO `learning` VALUES (118, 211, 'Tìm được một công việc ổn định với mức lương cao trong các công ty thiết kế 3D', b'0');
INSERT INTO `learning` VALUES (119, 211, 'Tạo ra không gian sống đẹp mắt với các hình ảnh 3D', b'0');
INSERT INTO `learning` VALUES (120, 211, 'Tự mình thiết kế ra gian nội thất mong muốn, tự mình vẽ ra các nhân vậy 3D mà', b'0');
INSERT INTO `learning` VALUES (121, 211, 'Tự mình thiết kế ra mẫu game mà bạn mong muốn không cần lệ thuộc vào ai', b'0');
INSERT INTO `learning` VALUES (122, 211, 'Tự tin ứng tuyển các vị trí thiết kế bằng 3D - Max chuyên nghiệp cho các công ty', b'0');
INSERT INTO `learning` VALUES (123, 181, 'Kỹ năng thiết kế liên quan đến nghành quảng cáo - in ấn', b'0');
INSERT INTO `learning` VALUES (124, 181, 'Thiết kế ấn phẩm cho in ấn, bao bì, nhãn   mác..', b'0');
INSERT INTO `learning` VALUES (125, 181, 'Thiết kế dàn trang cho sách báo, tạp  chí…', b'0');
INSERT INTO `learning` VALUES (126, 181, 'Thiết  kế logo, thương hiệu sản phẩm, doanh  nghiệp', b'0');
INSERT INTO `learning` VALUES (127, 181, 'Thiết kế quảng cáo: Card  Visit, thiệp cưới, áo đồng  phục…', b'0');
INSERT INTO `learning` VALUES (128, 181, 'Thiết kế các sản phẩm truyền thông khác', b'0');
INSERT INTO `learning` VALUES (129, 16, 'Biết cách sử dụng các công cụ quan trọng', b'0');
INSERT INTO `learning` VALUES (130, 16, 'Thiết kế biển bảng quảng cáo, biển đèn Led.', b'0');
INSERT INTO `learning` VALUES (131, 16, 'Biết được các mẹo làm việc nhanh chóng', b'0');
INSERT INTO `learning` VALUES (132, 16, 'Thiết kế được Logo, Banner, Cardvist.', b'0');
INSERT INTO `learning` VALUES (133, 212, 'Nắm được mấu chốt của việc nuôi dạy con đúng phương pháp', b'0');
INSERT INTO `learning` VALUES (134, 212, 'Có giải pháp giải quyết ngay tình trạng con mình đang gặp phải', b'0');
INSERT INTO `learning` VALUES (135, 212, 'Có định hướng cho tương lai con dựa vào năng lực và sở trường của con', b'0');
INSERT INTO `learning` VALUES (136, 212, 'Biết cách vận dụng dạy con mọi lúc mọi nơi thông qua các hoạt động hàng ngày', b'0');
INSERT INTO `learning` VALUES (137, 212, 'Có tầm nhìn xa để định hướng đúng đắn về nghề nghiệp của con sau này', b'0');
INSERT INTO `learning` VALUES (138, 212, 'Biết nắm bắt được chìa khóa để giúp con phát huy năng lực, sở trường, khắc phục hạn chế của con', b'0');
INSERT INTO `learning` VALUES (139, 2, 'Nắm được những kiến thức tổng quan về thời kỳ ăn dặm của trẻ, các dưỡng chất cần thiết cho trẻ ăn dặm', b'0');
INSERT INTO `learning` VALUES (140, 2, 'Biết cách phòng chống và xử lý những tình huống gây bệnh lý của trẻ trong giai đoạn ăn dặm', b'0');
INSERT INTO `learning` VALUES (141, 2, 'Tạo không khí vui vẻ khi ăn uống, tạo nếp ăn uống khoa học, tạo tính tự lập cho trẻ        ', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES (1, 1, '8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!', 387, 58, b'0');
INSERT INTO `lesson` VALUES (2, 1, 'Phương pháp & quan điểm học lập trình của Sơn Đặng', 1445, 58, b'0');
INSERT INTO `lesson` VALUES (3, 2, 'Làm sao để có thu nhập cao và đi xa hơn trong ngành IT?', 1539, 58, b'0');
INSERT INTO `lesson` VALUES (4, 3, 'Mô hình Client - Server', 695, 58, b'0');
INSERT INTO `lesson` VALUES (5, 3, 'Domain là gì? Bạn đã thật sự hiểu về domain?', 633, 58, b'0');
INSERT INTO `lesson` VALUES (6, 4, 'Trang web này sử dụng những công nghệ gì?', 1252, 58, b'0');
INSERT INTO `lesson` VALUES (7, 4, 'Quản lý thư mục dự án trên máy tính và VSCode hiệu quả hơn', 709, 58, b'0');
INSERT INTO `lesson` VALUES (8, 4, 'Học IT cần tố chất gì?', 1449, 58, b'0');
INSERT INTO `lesson` VALUES (19, 27, 'Tại sao bạn cần phải làm Tik Tok ngay bây giờ ?', NULL, 75, b'0');
INSERT INTO `lesson` VALUES (20, 27, 'Thiết kế mô hình kiếm tiền của bạn – Đừng làm TikTok khi chưa có điều này !', NULL, 76, b'0');
INSERT INTO `lesson` VALUES (38, 33, 'Làm được gì sau khi khóa học?', NULL, 58, b'0');
INSERT INTO `lesson` VALUES (39, 34, 'Làm quen với DevTooll', NULL, 58, b'0');
INSERT INTO `lesson` VALUES (48, 33, 'HTML, CSS là gì?', NULL, 58, b'0');
INSERT INTO `lesson` VALUES (49, 34, 'Cài đặt môi trường', NULL, 58, b'0');
INSERT INTO `lesson` VALUES (52, 59, 'Bánh ngọt chay vị Vani - Vanilla vegan cake', NULL, 58, b'0');
INSERT INTO `lesson` VALUES (53, 59, 'Bánh ngọt chay vị Chocolate - Chocolate vegan cake', NULL, 58, b'0');
INSERT INTO `lesson` VALUES (54, 67, 'Giới thiệu chung về khóa học', NULL, 74, b'0');
INSERT INTO `lesson` VALUES (55, 55, 'Bẻ khoá thuật toán – để liên tục có clip triệu view', NULL, 77, b'0');
INSERT INTO `lesson` VALUES (56, 68, 'Tìm hiểu về giao diện và các thanh công cụ', NULL, 79, b'0');
INSERT INTO `lesson` VALUES (57, 69, 'Giới thiệu mẫu lệnh và thực hành các lệnh trên các đối tượng', NULL, 80, b'0');
INSERT INTO `lesson` VALUES (58, 71, 'Giới thiệu về nghành in ấn - quảng cáo thiết kế trong CorelDRAW P.1', NULL, 81, b'0');
INSERT INTO `lesson` VALUES (59, 72, 'Vẽ Logo Adidas p.1', NULL, 82, b'0');
INSERT INTO `lesson` VALUES (60, 73, 'Thiết kế bảng hiệu quảng cáo đơn giản p.1', NULL, 83, b'0');
INSERT INTO `lesson` VALUES (61, 74, 'Tìm hiểu các chức năng cơ bản của phần mềm', NULL, 85, b'0');
INSERT INTO `lesson` VALUES (62, 74, 'Phân biệt 2 dạng ảnh Vector và Bitmap', NULL, 86, b'0');
INSERT INTO `lesson` VALUES (63, 75, 'Nhóm công cụ lựa chọn đối tượng Pick, Freehand pick', NULL, 87, b'0');
INSERT INTO `lesson` VALUES (64, 75, 'Nhóm công cụ tạo ra các hình cơ bản Rectangle, Elipse, Polygon', NULL, 88, b'0');
INSERT INTO `lesson` VALUES (65, 76, 'Nhóm công cụ sửa điểm, sửa cạnh, làm biến dạng hình', NULL, 89, b'0');
INSERT INTO `lesson` VALUES (66, 76, ' Công cụ Trasparency làm trong suốt đối tượng', NULL, 90, b'0');
INSERT INTO `lesson` VALUES (67, 77, 'Dạy con từ thuở còn thơ ', NULL, 93, b'0');
INSERT INTO `lesson` VALUES (68, 77, 'Làm bạn và lắng nghe con để khi mình nói, con mình nghe ', NULL, 94, b'0');
INSERT INTO `lesson` VALUES (69, 78, ' Vai trò của dinh dưỡng trong việc nuôi dạy con ', NULL, 95, b'0');
INSERT INTO `lesson` VALUES (70, 78, ' Muốn con lớn hãy biết cách cho con ăn ', NULL, 96, b'0');
INSERT INTO `lesson` VALUES (71, 79, ' Bài 1: Tầm quan trọng của dinh dưỡng trong quá trình phát triển của trẻ ', NULL, 97, b'0');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `actived` bit(1) NULL DEFAULT b'0',
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `seen` bit(1) NOT NULL DEFAULT b'0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_sent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', NULL, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (2, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 1, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (3, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 1, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (4, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 1, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (5, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 1, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (6, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 1, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (7, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (8, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (9, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (10, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (11, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (12, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (13, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (14, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (15, 'Genshin Impact', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (16, 'Lập trình', b'1', b'0', '2021-05-19 15:39:04', '2021-05-19 15:39:04', 2, b'0', 'Wellcome', 1);
INSERT INTO `notifications` VALUES (17, '', b'0', b'0', '2021-09-13 09:23:39', '2021-09-13 09:23:39', NULL, b'0', '123', 1);
INSERT INTO `notifications` VALUES (18, '', b'0', b'0', '2021-09-13 09:36:49', '2021-09-13 09:36:49', NULL, b'0', '123', 1);
INSERT INTO `notifications` VALUES (19, '', b'0', b'0', '2021-09-13 09:46:41', '2021-09-13 09:46:41', 1, b'0', '123', 1);
INSERT INTO `notifications` VALUES (20, 'Hot New', b'1', b'0', '2021-09-13 10:38:23', '2021-09-13 10:38:23', 1, b'0', '123', 1);
INSERT INTO `notifications` VALUES (21, 'Hot New', b'1', b'0', '2021-09-13 10:38:31', '2021-09-13 10:38:31', NULL, b'0', '123', 1);
INSERT INTO `notifications` VALUES (22, 'Hot New 2', b'0', b'0', '2021-09-13 10:42:23', '2021-09-13 10:42:23', NULL, b'0', '123', 1);
INSERT INTO `notifications` VALUES (23, 'giảm giá bất ngờ', b'1', b'0', '2021-09-15 18:12:50', '2021-09-15 18:12:50', NULL, b'0', 'day la noi dung thong bao', 1);
INSERT INTO `notifications` VALUES (24, 'giảm giá bất ngờ', b'1', b'0', '2021-09-15 19:14:47', '2021-09-15 19:14:47', 45, b'0', 'day la thong bao den tai khoan block 33015', 1);
INSERT INTO `notifications` VALUES (25, 'thong bao den 33015', b'1', b'0', '2021-09-15 19:18:49', '2021-09-15 19:18:49', 45, b'0', '1231231', 1);
INSERT INTO `notifications` VALUES (26, 'thong bao den 33015', b'1', b'0', '2021-09-15 19:38:55', '2021-09-15 19:38:55', 68, b'0', 'dsadas', 1);
INSERT INTO `notifications` VALUES (27, 'thong bao den 33015', b'1', b'0', '2021-09-15 19:43:05', '2021-09-15 19:43:05', 68, b'0', 'noi dung thong bao den 33015', 1);
INSERT INTO `notifications` VALUES (28, 'thong bao den sang', b'1', b'0', '2021-09-15 19:47:23', '2021-09-15 19:47:23', 66, b'0', 'noi dung thong bao den sang', 1);
INSERT INTO `notifications` VALUES (29, 'thong bao den 33015', b'1', b'0', '2021-09-15 19:50:13', '2021-09-15 19:50:13', 68, b'0', 'noi dung thong bao den 33015 2', 1);
INSERT INTO `notifications` VALUES (30, 'Hello', b'1', b'1', '2021-09-16 09:55:44', '2021-09-17 01:10:58', NULL, b'0', 'dfdsfs', 1);
INSERT INTO `notifications` VALUES (31, 'Test Thông Báo', b'1', b'0', '2021-09-16 09:57:16', '2021-09-16 09:57:16', NULL, b'0', '7h', 1);
INSERT INTO `notifications` VALUES (32, 'Wellcome to new word', b'1', b'1', '2021-09-16 09:57:47', '2021-09-16 10:13:13', 1, b'0', 'Hello World! ', 1);
INSERT INTO `notifications` VALUES (33, 'Test thông báo', b'1', b'0', '2021-09-16 09:59:20', '2021-09-16 09:59:20', NULL, b'0', 'Đến toàn bộ người dùng 8:29', 1);
INSERT INTO `notifications` VALUES (34, 'Thông báo cá nhân', b'1', b'0', '2021-09-16 09:59:57', '2021-09-16 09:59:57', 1, b'0', 'Tài khoản của bạn đang vi phạm', 1);
INSERT INTO `notifications` VALUES (35, 'Test tài khoản khác', b'1', b'1', '2021-09-16 10:06:18', '2021-09-16 10:09:06', 2, b'0', 'h', 1);
INSERT INTO `notifications` VALUES (36, 'Hello', b'1', b'0', '2021-09-17 10:35:37', '2021-09-17 10:35:37', 1, b'0', 'Xin chào', 1);
INSERT INTO `notifications` VALUES (37, 'Test Send Mail', b'1', b'0', '2021-09-17 10:45:59', '2021-09-17 10:45:59', 2, b'0', 'Mail for you', 1);
INSERT INTO `notifications` VALUES (38, 'Test Send Mail', b'1', b'0', '2021-09-17 10:53:19', '2021-09-17 10:53:19', 2, b'0', 'Mail for you', 1);
INSERT INTO `notifications` VALUES (39, 'test gui email', b'1', b'0', '2021-09-18 14:50:09', '2021-09-18 14:50:09', 68, b'0', 'day la noi dung', 1);
INSERT INTO `notifications` VALUES (40, 'Gửi email tất cả người dùng', b'1', b'0', '2021-09-18 14:55:41', '2021-09-18 14:55:41', NULL, b'0', 'đây là nội dung', 1);
INSERT INTO `notifications` VALUES (41, 'Gửi email tất cả người dùng', b'1', b'0', '2021-09-18 14:58:58', '2021-09-18 14:58:58', NULL, b'0', 'day la noi dung thong bao', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ower_course
-- ----------------------------
INSERT INTO `ower_course` VALUES (32, 1, 1, 60, b'1', b'0', '2021-05-24 16:10:07', '2021-05-24 16:10:07', 10000);
INSERT INTO `ower_course` VALUES (33, 1, 171, 61, b'1', b'0', '2021-05-24 16:10:48', '2021-05-24 16:10:48', 500);
INSERT INTO `ower_course` VALUES (34, 1, 178, 62, b'1', b'0', '2021-05-26 14:36:19', '2021-05-26 14:36:19', 0);
INSERT INTO `ower_course` VALUES (35, 2, 1, 63, b'1', b'0', '2021-05-27 10:38:04', '2021-05-27 10:38:04', 0);
INSERT INTO `ower_course` VALUES (37, 45, 171, 65, b'1', b'0', '2021-05-27 11:49:27', '2021-05-27 11:49:27', 0);
INSERT INTO `ower_course` VALUES (38, 45, 44, 66, b'1', b'0', '2021-05-27 15:34:06', '2021-05-27 15:34:06', 0);
INSERT INTO `ower_course` VALUES (40, 1, 3, 68, b'1', b'0', '2021-06-20 06:46:30', '2021-06-20 06:46:30', 0);
INSERT INTO `ower_course` VALUES (41, 1, 2, 69, b'1', b'0', '2021-09-13 11:32:06', '2021-09-13 11:32:06', 0);
INSERT INTO `ower_course` VALUES (42, 1, 197, 70, b'1', b'0', '2021-09-13 11:37:15', '2021-09-13 11:37:15', 0);
INSERT INTO `ower_course` VALUES (43, 1, 194, 71, b'1', b'0', '2021-09-13 11:38:37', '2021-09-13 11:38:37', 0);
INSERT INTO `ower_course` VALUES (44, 68, 201, 72, b'1', b'0', '2021-09-17 00:01:05', '2021-09-17 00:01:05', 0);
INSERT INTO `ower_course` VALUES (45, 1, 208, 73, b'1', b'0', '2021-09-18 08:58:43', '2021-09-18 08:58:43', 0);
INSERT INTO `ower_course` VALUES (46, 66, 210, 74, b'0', b'0', '2021-09-18 15:01:32', '2021-09-18 15:01:32', 0);
INSERT INTO `ower_course` VALUES (47, 66, 1, 75, b'1', b'0', '2021-09-18 15:02:12', '2021-09-18 15:02:12', 0);
INSERT INTO `ower_course` VALUES (49, 69, 16, 77, b'1', b'0', '2021-09-18 19:47:54', '2021-09-18 19:47:54', 0);
INSERT INTO `ower_course` VALUES (50, 69, 211, 78, b'0', b'0', '2021-09-18 19:49:13', '2021-09-18 19:49:13', 0);
INSERT INTO `ower_course` VALUES (51, 69, 181, 79, b'0', b'0', '2021-09-18 20:29:59', '2021-09-18 20:29:59', 0);
INSERT INTO `ower_course` VALUES (52, 69, 181, 80, b'0', b'0', '2021-09-18 20:32:56', '2021-09-18 20:32:56', 0);
INSERT INTO `ower_course` VALUES (53, 69, 211, 81, b'0', b'0', '2021-09-18 20:40:57', '2021-09-18 20:40:57', 0);
INSERT INTO `ower_course` VALUES (54, 2, 3, 82, b'1', b'0', '2021-09-19 06:47:58', '2021-09-19 06:47:58', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES (1, 171, 'Phương pháp học tập', 2, 1832000, b'0');
INSERT INTO `part` VALUES (2, 171, 'Tư duy phát triển', 1, 1539000, b'0');
INSERT INTO `part` VALUES (3, 171, 'Khái niệm kỹ thuật cần biết', 2, 1539000, b'0');
INSERT INTO `part` VALUES (4, 171, 'Tham khảo thêm', 3, 1539000, b'0');
INSERT INTO `part` VALUES (27, 1, 'TÌM HIỂU THỊ TRƯỜNG VÀ CHUẨN BỊ CƠ BẢN', 0, 0, b'0');
INSERT INTO `part` VALUES (33, 178, 'Giới thiệu', 0, 0, b'0');
INSERT INTO `part` VALUES (34, 178, 'Làm quen với công cụ', 0, 0, b'0');
INSERT INTO `part` VALUES (50, 3, '', 0, 0, b'0');
INSERT INTO `part` VALUES (51, 3, '', 0, 0, b'0');
INSERT INTO `part` VALUES (52, 3, '12313', 0, 0, b'0');
INSERT INTO `part` VALUES (53, 3, '123', 0, 0, b'0');
INSERT INTO `part` VALUES (54, 3, '', 0, 0, b'0');
INSERT INTO `part` VALUES (55, 1, 'CHÍNH SÁCH VÀ THUẬT TOÁN TIKTOK', 0, 0, b'0');
INSERT INTO `part` VALUES (58, 187, '5478494', 0, 0, b'0');
INSERT INTO `part` VALUES (59, 199, 'Các loại bánh thuần chay cơ bản', 0, 0, b'0');
INSERT INTO `part` VALUES (60, 199, 'Các loại bánh phô mai thuần chay (Vegan cheesecakes)', 0, 0, b'0');
INSERT INTO `part` VALUES (61, 199, 'Các loại bánh thuần chay khác', 0, 0, b'0');
INSERT INTO `part` VALUES (62, 198, 'Nền tảng', 0, 0, b'0');
INSERT INTO `part` VALUES (63, 198, '07 tư duy đúng', 0, 0, b'0');
INSERT INTO `part` VALUES (64, 198, ' Tại sao bạn nên tham gia đầu tư ngay bây giờ?', 0, 0, b'0');
INSERT INTO `part` VALUES (65, 198, 'Những vấn đề thường gặp của nhà đầu tư mới', 0, 0, b'0');
INSERT INTO `part` VALUES (66, 209, 'Tổng quan về nghành phun xăm thẩm mỹ', 0, 0, b'0');
INSERT INTO `part` VALUES (67, 210, 'Khởi động', 0, 0, b'0');
INSERT INTO `part` VALUES (68, 211, 'Các thao tác, công cụ và lệnh cơ bản', 0, 0, b'0');
INSERT INTO `part` VALUES (69, 211, ' Thực hành vẽ sản phẩm tuýt kem', 0, 0, b'0');
INSERT INTO `part` VALUES (70, 211, 'Vẽ cái màn cửa và bức tranh', 0, 0, b'0');
INSERT INTO `part` VALUES (71, 181, 'Giao diện CorelDRAW và các thao tác cơ bản', 0, 0, b'0');
INSERT INTO `part` VALUES (72, 181, 'Sử dụng công cụ vẽ - chỉnh sửa vector trong CorelDRAW', 0, 0, b'0');
INSERT INTO `part` VALUES (73, 181, 'Thiết kế áp dụng phối màu trong CorelDRAW', 0, 0, b'0');
INSERT INTO `part` VALUES (74, 16, 'Giới thiệu', 0, 0, b'0');
INSERT INTO `part` VALUES (75, 16, 'Tìm hiểu các công cụ quan trọng', 0, 0, b'0');
INSERT INTO `part` VALUES (76, 16, 'Luyện tập thực hành các công cụ', 0, 0, b'0');
INSERT INTO `part` VALUES (77, 212, 'Giới thiệu chung', 0, 0, b'0');
INSERT INTO `part` VALUES (78, 212, 'Dinh dưỡng cho con ', 0, 0, b'0');
INSERT INTO `part` VALUES (79, 2, 'Ăn dặm', 0, 0, b'0');
INSERT INTO `part` VALUES (80, 2, 'Bé lớn nhanh, khỏe mạnh', 0, 0, b'0');

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
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (42, 1, '2021-05-16 10:14:07', 1085700000, '0:0:0:0:0:0:0:1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210516171407&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F42&vnp_TmnCode=67LF6OWG&vnp_TxnRef=42&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=22e79e5e7ff1fa342a25f2b5f9369126ec95efeeea2d249cb9b13f4f8f352e3a', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210516171446&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13505342&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=42&vnp_SecureHash=687f2b0a4af38654128f096d61fe826842be12794bbd0295d997b3200ba4a09e', 'http://localhost:25001/test/returnurl', b'0');
INSERT INTO `payment` VALUES (43, 41, '2021-05-18 12:22:55', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192256&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F43&vnp_TmnCode=67LF6OWG&vnp_TxnRef=43&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=119203cb2feb8c04c45ad04f21f210b246acd1592e2bb9fea458968a45fe93d2', NULL, 'http://192.168.0.111:3000/course/171', b'0');
INSERT INTO `payment` VALUES (44, 41, '2021-05-18 12:24:20', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192421&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F44&vnp_TmnCode=67LF6OWG&vnp_TxnRef=44&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=62e50ada83490158cfef62b1a629e9afcf32e87ae935790992003df2a3f80290', NULL, 'http://192.168.0.111:3000/course/171', b'0');
INSERT INTO `payment` VALUES (45, 41, '2021-05-18 12:24:36', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192436&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F45&vnp_TmnCode=67LF6OWG&vnp_TxnRef=45&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4a71868f029d48c22f624b6166e01e1a0bffd55a0e0acf4c7a23cd3ed7308749', NULL, 'http://192.168.0.111:3000/course/171?null', b'0');
INSERT INTO `payment` VALUES (46, 41, '2021-05-18 12:28:33', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518192833&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F46&vnp_TmnCode=67LF6OWG&vnp_TxnRef=46&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=75c72e1f682247179462e1f83642807e56f3455e7805355723aa481d878cb9f0', NULL, 'http://192.168.0.111:3000/course/171', b'0');
INSERT INTO `payment` VALUES (47, 41, '2021-05-18 12:30:06', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193006&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F47&vnp_TmnCode=67LF6OWG&vnp_TxnRef=47&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=8a74e18f5e4316f481657e9e02cfbbc21bd5684c8cb43527b8d768583dc64070', NULL, 'http://192.168.0.111:3000/course/171?null', b'0');
INSERT INTO `payment` VALUES (48, 41, '2021-05-18 12:32:56', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193257&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F48&vnp_TmnCode=67LF6OWG&vnp_TxnRef=48&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=e2a9a1bbeb35421dd3f314a2e23b52caecdaefa74a40bb0d431ea18bc79280d1', NULL, 'http://192.168.0.111:3000/course/171?null', b'0');
INSERT INTO `payment` VALUES (49, 41, '2021-05-18 12:34:06', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193406&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F49&vnp_TmnCode=67LF6OWG&vnp_TxnRef=49&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=7d6fad91f93a5cf03b1875eb7e497f78c1f75148d31a3ef0437f7e225fd0e09f', NULL, 'http://192.168.0.111:3000/course/171', b'0');
INSERT INTO `payment` VALUES (50, 41, '2021-05-18 12:34:25', 1085700000, '192.168.0.222', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210518193425&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F50&vnp_TmnCode=67LF6OWG&vnp_TxnRef=50&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=05330df32547acbbd8e302729e91fafecdc9a6a1a7d52c71e9ec3678014cd825', NULL, 'http://192.168.0.111:3000/course/171?null', b'0');
INSERT INTO `payment` VALUES (51, 1, '2021-05-18 12:35:35', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518193535&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F51&vnp_TmnCode=67LF6OWG&vnp_TxnRef=51&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=e52c3fbc8486391fd33776800440376b3e3ce42816d931d567187c8b6576a1ce', NULL, 'http://localhost:3000/course/1', b'0');
INSERT INTO `payment` VALUES (52, 1, '2021-05-18 12:36:56', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518193656&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F52&vnp_TmnCode=67LF6OWG&vnp_TxnRef=52&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=fe39df9c27e2f23f409eb8e4506c8eb5d8ef339163f2b5cb252a3750a750f4f6', NULL, 'http://localhost:3000/course/1?null', b'0');
INSERT INTO `payment` VALUES (53, 1, '2021-05-18 12:42:28', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518194228&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F53&vnp_TmnCode=67LF6OWG&vnp_TxnRef=53&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=16cc5eefac46107e3488bffd399c9b680f5c4aace831bd371e26a000f250e6f4', NULL, 'http://localhost:3000/course/1?null?null', b'0');
INSERT INTO `payment` VALUES (54, 1, '2021-05-18 12:49:23', 100000000, '192.168.0.111', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210518194924&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F54&vnp_TmnCode=67LF6OWG&vnp_TxnRef=54&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=c51867705b9de0b6e5c97b2136a794a6e26d4ed1129ab2fb0a7032f8068b1ac4', NULL, 'http://localhost:3000/course/1', b'0');
INSERT INTO `payment` VALUES (55, 1, '2021-05-19 00:13:13', 100000000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210519071313&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F55&vnp_TmnCode=67LF6OWG&vnp_TxnRef=55&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=bff0749a9bf9823f7b63a96e05e6fe5f3aeaae891b306e84d836c3556f4330e0', 'vnp_Amount=100000000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210519141313&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13506785&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=55&vnp_SecureHash=46cda1c9efc5c7ee95cff1e3979c66113573dcea7d8ef344f51902d5a005f844', 'http://localhost:3000/course/1', b'0');
INSERT INTO `payment` VALUES (56, 41, '2021-05-19 02:28:40', 1085700000, '192.168.0.222', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210519092841&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.222&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F56&vnp_TmnCode=67LF6OWG&vnp_TxnRef=56&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=343fa5b6c5ad6d5920c20e9708b7f7202d0d7555b10ac3d77adb64aa2fb56796', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210519162841&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13506835&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=56&vnp_SecureHash=b263fc73d6f42d74ee9a17b32abd9d2255cc9fc2c24fe69f05cb31b425bbfbea', 'http://192.168.0.111:3000/course/171', b'0');
INSERT INTO `payment` VALUES (57, 1, '2021-05-23 10:30:38', 615400000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=615400000&vnp_Command=pay&vnp_CreateDate=20210523173038&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F57&vnp_TmnCode=67LF6OWG&vnp_TxnRef=57&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=1dc55d20facd3c38526baef37f2762a9fbcd3bfbbe8a3db5c9b46cec6aa358e3', 'vnp_Amount=615400000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210523173107&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13509574&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=57&vnp_SecureHash=10802bf22c10f4c6d5d49d80ff8d35be8032fd412ba152bf0cd05214dcf1a0b2', 'http://localhost:3000/course/10', b'0');
INSERT INTO `payment` VALUES (58, 1, '2021-05-24 15:45:02', 1191500000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1191500000&vnp_Command=pay&vnp_CreateDate=20210524224502&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F58&vnp_TmnCode=67LF6OWG&vnp_TxnRef=58&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=346064aca26c7a7d284aca7c51efaa3b91ae167a120430b4bf8a19e732c8da43', 'vnp_Amount=1191500000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524224513&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510481&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=58&vnp_SecureHash=881042864bfaf52f93ac4a60de3a9cf2ad6c57854f2fa90ce28167382241a56c', 'http://localhost:3000/course/44', b'0');
INSERT INTO `payment` VALUES (59, 1, '2021-05-24 16:03:38', 42900000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=42900000&vnp_Command=pay&vnp_CreateDate=20210524230339&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F59&vnp_TmnCode=67LF6OWG&vnp_TxnRef=59&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=410ec64aa9d4260cf69274149e053677c6e65e2aafb891d5b1c050c3233e10cc', 'vnp_Amount=42900000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524230341&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510483&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=59&vnp_SecureHash=e75648fbf018bcd865b26224780518db0b468553625551ed6ab369b4bb152927', 'http://localhost:3000/course/57', b'0');
INSERT INTO `payment` VALUES (60, 1, '2021-05-24 16:10:07', 100000000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210524231007&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F60&vnp_TmnCode=67LF6OWG&vnp_TxnRef=60&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=ef2751f9671212b31a3ba9a85fe7924dd80cf895b5e562827b624ec12b1a9614', 'vnp_Amount=100000000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524231011&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510484&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=60&vnp_SecureHash=122ceff7ab034f06c8ca408685a876acaa6a281f5b206c202bdeef25b95ac357', 'http://localhost:3000/course/1', b'0');
INSERT INTO `payment` VALUES (61, 1, '2021-05-24 16:10:48', 1085700000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210524231048&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F61&vnp_TmnCode=67LF6OWG&vnp_TxnRef=61&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4025a668a29ed6acc0f099d5f1292bdd6181fbed18596b71b3fe3a8229363de9', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210524231046&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13510485&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=61&vnp_SecureHash=9f38afbe75b06bf35e358c9d5085ded85935b7ddfb9d5be09c7ede809b969cc7', 'http://localhost:3000/course/171', b'0');
INSERT INTO `payment` VALUES (62, 1, '2021-05-26 14:36:19', 1500000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1500000&vnp_Command=pay&vnp_CreateDate=20210526213620&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F62&vnp_TmnCode=67LF6OWG&vnp_TxnRef=62&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4ce24c284ac8870421e87dd1f28a82de553e4edacd3d97297fb7bfb70566951a', 'vnp_Amount=1500000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210526213637&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13512167&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=62&vnp_SecureHash=1bdebc60e2386b2ac3929fdf8996c01e1168133ac8bebc8ea53460ab2ee63853', 'http://localhost:3000/course/178', b'0');
INSERT INTO `payment` VALUES (63, 2, '2021-05-27 10:38:04', 100000000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=100000000&vnp_Command=pay&vnp_CreateDate=20210527173804&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F63&vnp_TmnCode=67LF6OWG&vnp_TxnRef=63&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=8a87e89b1694dfef6707dc59c2fa93e69c52e0f98a5bfbe9184c20fdb3cd04af', 'vnp_Amount=100000000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210527173817&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13512924&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=63&vnp_SecureHash=00f9b5d883061718066d26f9a4afe893714c75a2d9b522fa64933e59144c3072', 'http://localhost:3000/course/1', b'0');
INSERT INTO `payment` VALUES (65, 45, '2021-05-27 11:49:27', 1085700000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1085700000&vnp_Command=pay&vnp_CreateDate=20210527184927&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F65&vnp_TmnCode=67LF6OWG&vnp_TxnRef=65&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=46fd5543d95e5244e636b0c6ce5c836968e8c502bbe41cafa8dd1e83b5d107e6', 'vnp_Amount=1085700000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210527185005&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13512956&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=65&vnp_SecureHash=156d609f55d149b0771e4f182af5ac02d47a5951dd5ca0f7e312326c96a4dbe9', 'http://localhost:3000/course/171', b'0');
INSERT INTO `payment` VALUES (66, 45, '2021-05-27 15:34:06', 1191500000, '192.168.0.111', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1191500000&vnp_Command=pay&vnp_CreateDate=20210527223406&vnp_CurrCode=VND&vnp_IpAddr=192.168.0.111&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2F192.168.0.111%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F66&vnp_TmnCode=67LF6OWG&vnp_TxnRef=66&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=4bc1079f299262e278b2ab06c0f628a00637f33fe79053350b70f625ece326f9', 'vnp_Amount=1191500000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210527223422&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13513046&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=66&vnp_SecureHash=92f97bf2dc4d308fab436f351227de00476111ee58cf9f518e811c7769c24b72', 'http://localhost:3000/course/44', b'0');
INSERT INTO `payment` VALUES (68, 1, '2021-06-20 06:46:30', 1492900000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1492900000&vnp_Command=pay&vnp_CreateDate=20210620134630&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F68&vnp_TmnCode=67LF6OWG&vnp_TxnRef=68&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=622947be814e45607794b78d58839af33e786e76d1197c38adc6a44a5b938161', 'vnp_Amount=1492900000&vnp_BankCode=NCB&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210620134706&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_TransactionNo=13527800&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=68&vnp_SecureHash=0ec1f339191fc48baba971fed7ae4f862d880f6bed53fc92bd315046e9a63fa6', 'http://localhost:3000/course/3', b'0');
INSERT INTO `payment` VALUES (69, 1, '2021-09-13 11:32:06', 1228800000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1228800000&vnp_Command=pay&vnp_CreateDate=20210913183207&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F69&vnp_TmnCode=67LF6OWG&vnp_TxnRef=69&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=bcb90f54d20dd4bb9700c1971eaaf3ecc1d073ab4b6cf2079e504bbdc6d18199', 'vnp_Amount=1228800000&vnp_BankCode=NCB&vnp_CardHolder=nguyen+van+a&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210913183237&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=265368&vnp_TransactionNo=13583248&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=69&vnp_SecureHash=217669a64089d4f116a0d512852c745503f596c003d342717458afcb3d9172c9', 'http://localhost:3000/course/2', b'0');
INSERT INTO `payment` VALUES (70, 1, '2021-09-13 11:37:15', 151000000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=151000000&vnp_Command=pay&vnp_CreateDate=20210913183715&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F70&vnp_TmnCode=67LF6OWG&vnp_TxnRef=70&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=a4aa461b41117232f06263bfb024683d49413ed8e5659c6ce58071c5f0ef2a64', 'vnp_Amount=151000000&vnp_BankCode=NCB&vnp_CardHolder=nguyen+van+a&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210913183737&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=265370&vnp_TransactionNo=13583249&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=70&vnp_SecureHash=1bc1cb4d7f91e6efaee1cec0ac6f5e622c360594da7631c59243792bc4f81c0b', 'http://localhost:3000/course/197', b'0');
INSERT INTO `payment` VALUES (71, 1, '2021-09-13 11:38:37', 151000000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=151000000&vnp_Command=pay&vnp_CreateDate=20210913183837&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F71&vnp_TmnCode=67LF6OWG&vnp_TxnRef=71&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=1b101081df4fda10d7b1643910718a8378590807a343dd65a839f45e861ca3ee', 'vnp_Amount=151000000&vnp_BankCode=NCB&vnp_CardHolder=nguyen+van+a&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210913183914&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=265376&vnp_TransactionNo=13583252&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=71&vnp_SecureHash=1d7f8b55ff5008bc24c4bc16499744d02d791c572466bfd82a1c61ce063cb32e', 'http://localhost:3000/course/194', b'0');
INSERT INTO `payment` VALUES (72, 68, '2021-09-17 00:01:05', 63000000, '0:0:0:0:0:0:0:1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=63000000&vnp_Command=pay&vnp_CreateDate=20210917070105&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F72&vnp_TmnCode=67LF6OWG&vnp_TxnRef=72&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=351297a94c837fabb17c802f146332b972980ce9f8a8b2ec1ed0d5b969487dfa', 'vnp_Amount=63000000&vnp_BankCode=NCB&vnp_CardHolder=NGUYEN+VAN+A&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210917070135&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=269797&vnp_TransactionNo=13585548&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=72&vnp_SecureHash=064023f26409f8902947ed6ec705edad09bc5594633c3702b270b0b98b90601f', 'http://localhost:3000/course/201', b'0');
INSERT INTO `payment` VALUES (73, 1, '2021-09-18 08:58:43', 39900000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=39900000&vnp_Command=pay&vnp_CreateDate=20210918155843&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F73&vnp_TmnCode=67LF6OWG&vnp_TxnRef=73&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=c067e61bca8d0c15939d1c65e2eb39df9442272778b74a76ad779e56e8e27376', 'vnp_Amount=39900000&vnp_BankCode=NCB&vnp_CardHolder=nguyen+van+a&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210918155909&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=271386&vnp_TransactionNo=13586371&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=73&vnp_SecureHash=2248d911dd7e52fedb0acaddc9f43c621a375458ccaae438f2194328aec944de', 'http://localhost:3000/course/208', b'0');
INSERT INTO `payment` VALUES (74, 66, '2021-09-18 15:01:32', 49600000, '0:0:0:0:0:0:0:1', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=49600000&vnp_Command=pay&vnp_CreateDate=20210918220133&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F74&vnp_TmnCode=67LF6OWG&vnp_TxnRef=74&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=6e7a9419a054c482efdd5e9a66143a947afde9687d6a09dfeeb892f5f2255898', NULL, 'http://localhost:3000/course/210', b'0');
INSERT INTO `payment` VALUES (75, 66, '2021-09-18 15:02:12', 9750000, '0:0:0:0:0:0:0:1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=9750000&vnp_Command=pay&vnp_CreateDate=20210918220212&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F75&vnp_TmnCode=67LF6OWG&vnp_TxnRef=75&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=b477dd915bc0933c9644afcb142502cdfdfc64cc54eb0183eaaff9a0a17f0662', 'vnp_Amount=9750000&vnp_BankCode=NCB&vnp_CardHolder=NGUYEN+VAN+A&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210918220311&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=271504&vnp_TransactionNo=13586430&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=75&vnp_SecureHash=f2a022fd07541342d3782e28fb6c773d49af4cf985b25aebaddcb5dfd3275149', 'http://localhost:3000/course/1', b'0');
INSERT INTO `payment` VALUES (76, 69, '2021-09-18 19:47:12', 50400000, '0:0:0:0:0:0:0:1', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=50400000&vnp_Command=pay&vnp_CreateDate=20210919024713&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F76&vnp_TmnCode=67LF6OWG&vnp_TxnRef=76&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=102c7a509565686c8dea886136301466e272c8fcaf7d29ef80b12b0a3a2c502a', 'vnp_Amount=50400000&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210919024716&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=0&vnp_TransactionNo=1304707&vnp_TransactionStatus=01&vnp_TxnRef=76&vnp_SecureHash=5b5c35b940745966b7fccb47a50fb8e07a1210db7daa3c790b7aefd859aa38aa', 'http://localhost:3000/course/16', b'0');
INSERT INTO `payment` VALUES (77, 69, '2021-09-18 19:47:54', 50400000, '0:0:0:0:0:0:0:1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=50400000&vnp_Command=pay&vnp_CreateDate=20210919024754&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F77&vnp_TmnCode=67LF6OWG&vnp_TxnRef=77&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=d19303cd248b952e761860be24b27196f2691357e51fdd8ed126b944c5f44bcb', 'vnp_Amount=50400000&vnp_BankCode=NCB&vnp_CardHolder=NGUYEN+VAN+A&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210919024826&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=271548&vnp_TransactionNo=13586452&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=77&vnp_SecureHash=16aa79635f6b08b88166d40b05780d606fef1ff053ab83cea5e3f273ad5a4d30', 'http://localhost:3000/course/16', b'0');
INSERT INTO `payment` VALUES (78, 69, '2021-09-18 19:49:13', 38935000, '0:0:0:0:0:0:0:1', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=38935000&vnp_Command=pay&vnp_CreateDate=20210919024914&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F78&vnp_TmnCode=67LF6OWG&vnp_TxnRef=78&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=3746082d24cf261bfee9b8d8c2e9cfe905a48307afee6cce05dfe3d39173d2cc', 'vnp_Amount=38935000&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210919024917&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=0&vnp_TransactionNo=1304709&vnp_TransactionStatus=01&vnp_TxnRef=78&vnp_SecureHash=96fb12082cb1eede999d09720543dcc69a9a0516e6ec59300a5f18438336e274', 'http://localhost:3000/course/211', b'0');
INSERT INTO `payment` VALUES (79, 69, '2021-09-18 20:29:59', 34790000, '0:0:0:0:0:0:0:1', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=34790000&vnp_Command=pay&vnp_CreateDate=20210919032959&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F79&vnp_TmnCode=67LF6OWG&vnp_TxnRef=79&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=9645ea26d3b619b8efe06efa1f2ffe7b83055f49e20e91d682b35f49a04a0906', NULL, 'http://localhost:3000/course/181', b'0');
INSERT INTO `payment` VALUES (80, 69, '2021-09-18 20:32:56', 34790000, '0:0:0:0:0:0:0:1', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=34790000&vnp_Command=pay&vnp_CreateDate=20210919033257&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F80&vnp_TmnCode=67LF6OWG&vnp_TxnRef=80&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=2e5f7ab806ecece3738b8bab527e0a9ea102708461e511adbdfe0931c6164b64', NULL, 'http://localhost:3000/course/181', b'0');
INSERT INTO `payment` VALUES (81, 69, '2021-09-18 20:40:57', 38935000, '0:0:0:0:0:0:0:1', 'VND', 'UNCOMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=38935000&vnp_Command=pay&vnp_CreateDate=20210919034057&vnp_CurrCode=VND&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F81&vnp_TmnCode=67LF6OWG&vnp_TxnRef=81&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=b2bea81bd32da80a125c79d9b111688e88a37197b594285d948949c96061ac27', NULL, 'http://localhost:3000/course/211', b'0');
INSERT INTO `payment` VALUES (82, 2, '2021-09-19 06:47:58', 671805000, '127.0.0.1', 'VND', 'COMPLETE', 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=671805000&vnp_Command=pay&vnp_CreateDate=20210919134758&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=SpringBoot&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A25001%2Fpayment%2Fbuycourse%2Fcheck%2F82&vnp_TmnCode=67LF6OWG&vnp_TxnRef=82&vnp_Version=2.0.0&vnp_SecureHashType=SHA256&vnp_SecureHash=77fb2965d792efcd6e34b31980f14883ca7d48ebbee370bd618738db3b5d3ef3', 'vnp_Amount=671805000&vnp_BankCode=NCB&vnp_CardHolder=nguyen+van+a&vnp_CardNumber=970419xxxxxxxxx2198&vnp_Message=QueryDR+Success&vnp_OrderInfo=SpringBoot&vnp_PayDate=20210919134821&vnp_ResponseCode=00&vnp_TmnCode=67LF6OWG&vnp_Trace=271630&vnp_TransactionNo=13586495&vnp_TransactionStatus=00&vnp_TransactionType=01&vnp_TxnRef=82&vnp_SecureHash=ada72db35269ac46ca82d222a0b14ef78035c8f1b5bb04fd66a17cf7808e50c5', 'http://localhost:3000/course/3', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of request_reset_password
-- ----------------------------
INSERT INTO `request_reset_password` VALUES (66, 45, '2021-05-27 11:47:20', '93555c504e3bfdebee73e898098e4b92', b'0');
INSERT INTO `request_reset_password` VALUES (67, 45, '2021-05-27 15:21:08', '9b2401571f86e72e4d0d7875840a9a10', b'1');
INSERT INTO `request_reset_password` VALUES (68, 45, '2021-05-27 15:22:06', '1ad2ad01de884d32305ac63ae45ebc56', b'1');
INSERT INTO `request_reset_password` VALUES (69, 45, '2021-05-27 15:22:47', 'a6565a7061bc51fef1cdadff43360d94', b'0');
INSERT INTO `request_reset_password` VALUES (70, 66, '2021-09-15 19:48:28', 'f59b28fd350b06cada584ac2ac2bde7b', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_image
-- ----------------------------
INSERT INTO `resource_image` VALUES (1, 'image/default/momo.webp', b'1', '2021-04-05 14:48:50', 2, 6, '2021-05-19 22:29:00');
INSERT INTO `resource_image` VALUES (84, 'user/user/image/anh-1-1600587301890166145683.webp', b'1', '2021-06-06 05:42:45', 2, 1, '2021-06-06 05:42:45');
INSERT INTO `resource_image` VALUES (99, 'user/admin/image/4fa665b22e75a78b038ec14ae2e24296.jpg', b'1', '2021-06-06 17:06:13', 1, 1, '2021-06-06 17:06:13');
INSERT INTO `resource_image` VALUES (128, 'user/admin/image/dmitry-ratushny-O33IVNPb0RI-unsplash.jpg', b'0', '2021-09-04 06:13:16', 1, 1, '2021-09-04 06:13:16');
INSERT INTO `resource_image` VALUES (129, 'user/admin/image/element5-digital-OyCl7Y4y0Bk-unsplash.jpg', b'0', '2021-09-04 06:13:25', 1, 1, '2021-09-04 06:13:25');
INSERT INTO `resource_image` VALUES (130, 'user/admin/image/green-chameleon-s9CC2SKySJM-unsplash.jpg', b'0', '2021-09-04 06:13:31', 1, 1, '2021-09-04 06:13:31');
INSERT INTO `resource_image` VALUES (131, 'user/admin/image/j-kelly-brito-PeUJyoylfe4-unsplash.jpg', b'0', '2021-09-04 06:13:37', 1, 1, '2021-09-04 06:13:37');
INSERT INTO `resource_image` VALUES (133, 'https://lh3.googleusercontent.com/a-/AOh14GiKJvNAwn2SdzWX2-VJqxSMJ8oJH1_2VxJSC24W3A=s96-c', b'1', '2021-09-10 22:06:13', NULL, 1, '2021-09-10 22:06:13');
INSERT INTO `resource_image` VALUES (134, 'https://lh3.googleusercontent.com/a/AATXAJxq_tvbmTdiXnJRAPMDf2nQ9_s9cL1Xy9dytWdZ=s96-c', b'1', '2021-09-14 14:04:03', NULL, 1, '2021-09-14 14:04:03');
INSERT INTO `resource_image` VALUES (138, 'user/admin/image/ctnauan.jpg', b'1', '2021-09-15 08:47:43', 1, 1, '2021-09-15 08:47:43');
INSERT INTO `resource_image` VALUES (158, 'user/admin/image/tu_hoc_lam_18_loai_banh_khong_can_lo_nuong_m_1556177753.jpg', b'1', '2021-09-18 07:21:05', 1, 1, '2021-09-18 07:21:05');
INSERT INTO `resource_image` VALUES (159, 'user/admin/image/khoa_hoc_nhap_mon_chung_khoan_m_1555570756.jpg', b'1', '2021-09-18 07:57:01', 1, 1, '2021-09-18 07:57:01');
INSERT INTO `resource_image` VALUES (160, 'user/admin/image/20_loai_banh_bo_duong_m_1561523591.jpg', b'1', '2021-09-18 07:58:49', 1, 1, '2021-09-18 07:58:49');
INSERT INTO `resource_image` VALUES (161, 'user/admin/image/tu_lam_cac_loai_banh_mochi_nhat_ban_m_1561437748.jpg', b'1', '2021-09-18 07:59:15', 1, 1, '2021-09-18 07:59:15');
INSERT INTO `resource_image` VALUES (162, 'user/admin/image/ky_thuat_lam_banh_nerikiri_co_ban_m_1561428959.jpg', b'1', '2021-09-18 07:59:46', 1, 1, '2021-09-18 07:59:46');
INSERT INTO `resource_image` VALUES (163, 'user/admin/image/vlcsnap_2020_03_13_14h08m47s121_m.png', b'1', '2021-09-18 08:00:22', 1, 1, '2021-09-18 08:00:22');
INSERT INTO `resource_image` VALUES (164, 'user/admin/image/20_cach_lam_banh_sinh_nhat_hien_dai_m_1555657545.jpg', b'1', '2021-09-18 08:00:55', 1, 1, '2021-09-18 08:00:55');
INSERT INTO `resource_image` VALUES (165, 'user/admin/image/1609745981281.jpg', b'1', '2021-09-18 08:05:56', 1, 1, '2021-09-18 08:05:56');
INSERT INTO `resource_image` VALUES (167, 'user/admin/image/1609745981227.png', b'1', '2021-09-18 08:06:43', 1, 1, '2021-09-18 08:06:43');
INSERT INTO `resource_image` VALUES (168, 'user/admin/image/20_loai_banh_quy_tet_doc_dao_m_1561531316.jpg', b'1', '2021-09-18 08:13:22', 1, 1, '2021-09-18 08:13:22');
INSERT INTO `resource_image` VALUES (169, 'user/admin/image/images.png', b'1', '2021-09-18 08:13:47', 1, 1, '2021-09-18 08:13:47');
INSERT INTO `resource_image` VALUES (170, 'user/admin/image/10_mon_banh_su_12_mon_cookie_m_1561518923.jpg', b'1', '2021-09-18 08:32:57', 1, 1, '2021-09-18 08:32:57');
INSERT INTO `resource_image` VALUES (171, 'user/admin/image/banh_thach_trung_thu_m_1565925718.jpg', b'1', '2021-09-18 08:37:46', 1, 1, '2021-09-18 08:37:46');
INSERT INTO `resource_image` VALUES (172, 'user/admin/image/KH_A_H_C_PHUN_X_M_TH_M_M__C__B_N_m_1627909013.jpg', b'1', '2021-09-18 08:52:46', 1, 1, '2021-09-18 08:52:46');
INSERT INTO `resource_image` VALUES (179, 'user/admin/image/photo_1631847560046_32bc5ae736e5.jpg', b'1', '2021-09-18 17:09:21', 1, 181, '2021-09-18 17:09:21');
INSERT INTO `resource_image` VALUES (180, 'user/admin/image/kinh_nghiem_ke_khai_va_quyet_toan_thu_nhap_ca_nhan_tu_a_z_m_1555577651.jpg', b'1', '2021-09-18 17:27:51', 1, 1, '2021-09-18 17:27:51');
INSERT INTO `resource_image` VALUES (181, 'user/admin/image/Banner_UNICA_FINAL_m_1602667897.jpg', b'1', '2021-09-18 17:28:13', 1, 1, '2021-09-18 17:28:13');
INSERT INTO `resource_image` VALUES (182, 'user/admin/image/2.jpeg', b'1', '2021-09-18 17:33:07', 1, 1, '2021-09-18 17:33:07');
INSERT INTO `resource_image` VALUES (183, 'user/admin/image/5.jpeg', b'1', '2021-09-18 17:33:33', 1, 1, '2021-09-18 17:33:33');
INSERT INTO `resource_image` VALUES (184, 'user/admin/image/a_nh_bi_a_m_1592362677.jpg', b'1', '2021-09-18 17:34:01', 1, 1, '2021-09-18 17:34:01');
INSERT INTO `resource_image` VALUES (186, 'user/testdk1/image/cat.png', b'1', '2021-09-18 18:43:15', 70, 1, '2021-09-18 18:43:15');
INSERT INTO `resource_image` VALUES (187, 'user/admin/image/thiet_ke_noi_that_bang_3ds_max_m_1606357631.jpg', b'1', '2021-09-18 19:03:57', 1, 1, '2021-09-18 19:03:57');
INSERT INTO `resource_image` VALUES (188, 'user/admin/image/thiet_ke_quang_cao_voi_phan_mem_corel_draw_m_1555574537.jpg', b'1', '2021-09-18 19:34:00', 1, 1, '2021-09-18 19:34:00');
INSERT INTO `resource_image` VALUES (190, 'user/admin/image/Banner_m_1597440623.jpg', b'1', '2021-09-18 19:42:09', 1, 1, '2021-09-18 19:42:09');
INSERT INTO `resource_image` VALUES (191, 'user/admin/image/19tuyet_chieu_day_con_thanh_tai_m_1555577063.jpg', b'1', '2021-09-19 06:52:06', 1, 1, '2021-09-19 06:52:06');
INSERT INTO `resource_image` VALUES (192, 'user/admin/image/ANdam_m.jpg', b'1', '2021-09-19 06:57:55', 1, 1, '2021-09-19 06:57:55');

-- ----------------------------
-- Table structure for revenue
-- ----------------------------
DROP TABLE IF EXISTS `revenue`;
CREATE TABLE `revenue`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `money` decimal(60, 0) UNSIGNED NOT NULL DEFAULT 0,
  `day` int(11) NOT NULL,
  `new_member` decimal(60, 0) NOT NULL DEFAULT 0,
  `course_upload` decimal(60, 0) NOT NULL DEFAULT 0 COMMENT '`',
  `course_sell` decimal(60, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unque_key`(`month`, `year`, `day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of revenue
-- ----------------------------
INSERT INTO `revenue` VALUES (1, b'0', '2020-01-07 19:07:33', '2021-01-26 19:07:33', 1, 2021, 5000000, 1, 0, 0, 0);
INSERT INTO `revenue` VALUES (2, b'0', '2021-02-01 19:08:13', '2021-02-26 19:08:13', 2, 2021, 15000000, 1, 0, 0, 0);
INSERT INTO `revenue` VALUES (3, b'0', '2021-03-26 19:10:41', '2021-03-26 19:10:41', 3, 2021, 15150000, 1, 0, 0, 0);
INSERT INTO `revenue` VALUES (4, b'0', '2021-04-26 19:09:33', '2021-04-26 19:09:33', 4, 2021, 27000000, 1, 0, 0, 0);
INSERT INTO `revenue` VALUES (50, b'0', '2021-05-26 18:37:41', '2021-05-26 18:37:41', 5, 2021, 46516000, 1, 0, 0, 0);
INSERT INTO `revenue` VALUES (52, b'0', '2021-06-20 06:47:14', '2021-06-20 06:47:14', 6, 2021, 14929000, 1, 0, 0, 0);
INSERT INTO `revenue` VALUES (53, b'0', '2021-09-13 11:32:41', '2021-09-13 11:32:41', 9, 2021, 9858552, 13, 1, 0, 7);
INSERT INTO `revenue` VALUES (54, b'0', '2021-09-12 15:38:05', '2021-09-12 15:38:05', 9, 2021, 8448550, 12, 0, 0, 5);
INSERT INTO `revenue` VALUES (55, b'0', '2021-09-14 14:04:03', '2021-09-14 14:04:03', 9, 2021, 8348550, 14, 1, 0, 5);
INSERT INTO `revenue` VALUES (56, b'0', '2021-09-15 07:03:00', '2021-09-15 07:03:00', 9, 2021, 8348550, 15, 1, 0, 5);
INSERT INTO `revenue` VALUES (57, b'0', '2021-09-17 00:01:40', '2021-09-17 00:01:40', 9, 2021, 8348550, 17, 0, 0, 5);
INSERT INTO `revenue` VALUES (58, b'0', '2021-09-17 20:10:12', '2021-09-17 20:10:12', 9, 2021, 7718550, 18, 1, 0, 4);
INSERT INTO `revenue` VALUES (59, b'0', '2021-09-18 18:27:18', '2021-09-18 18:27:18', 9, 2021, 7222050, 19, 1, 0, 2);

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
INSERT INTO `spring_session` VALUES ('68767d6d-dbbf-4de5-9751-2124b3f0d0c3', '4735f6f2-d8dc-4184-8369-1d4479b2f58d', 1632034312983, 1632034312984, 1800, 1632036112984, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);
INSERT INTO `user_role` VALUES (23, 41, 2);
INSERT INTO `user_role` VALUES (27, 45, 2);
INSERT INTO `user_role` VALUES (28, 56, 2);
INSERT INTO `user_role` VALUES (30, 57, 2);
INSERT INTO `user_role` VALUES (35, 66, 2);
INSERT INTO `user_role` VALUES (36, 67, 2);
INSERT INTO `user_role` VALUES (37, 68, 2);
INSERT INTO `user_role` VALUES (38, 69, 2);
INSERT INTO `user_role` VALUES (39, 70, 2);
INSERT INTO `user_role` VALUES (40, 71, 2);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img_poster_id` bigint(20) NULL DEFAULT NULL,
  `duration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count_linked` decimal(20, 0) NOT NULL DEFAULT 0,
  `actived` bit(1) NOT NULL DEFAULT b'0',
  `deleted` bit(1) NULL DEFAULT b'0',
  `create_at` datetime(0) NULL DEFAULT utc_timestamp,
  `update_at` datetime(0) NULL DEFAULT utc_timestamp,
  `user_poster_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `poster`(`img_poster_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (52, 'user/admin/video/lambanh.mp4', NULL, 65316667, 1, b'1', b'0', '2021-09-15 10:30:29', '2021-09-15 10:30:29', 1);
INSERT INTO `video` VALUES (58, 'user/admin/video/videodemo.mp4', NULL, 21158000, 188, b'1', b'0', '2021-09-16 01:03:42', '2021-09-16 01:03:42', 1);
INSERT INTO `video` VALUES (59, 'user/admin/video/1.mp4', NULL, 9867000, 1, b'1', b'0', '2021-09-17 20:10:58', '2021-09-17 20:10:58', 1);
INSERT INTO `video` VALUES (64, 'user/admin/video/2.mp4', NULL, 11000000, 2, b'1', b'0', '2021-09-17 20:26:46', '2021-09-17 20:26:46', 1);
INSERT INTO `video` VALUES (69, 'user/admin/video/10.mp4', NULL, 10167000, 1, b'1', b'0', '2021-09-18 08:27:31', '2021-09-18 08:27:31', 1);
INSERT INTO `video` VALUES (70, 'user/admin/video/9.mp4', NULL, 11552000, 1, b'1', b'0', '2021-09-18 08:33:46', '2021-09-18 08:33:46', 1);
INSERT INTO `video` VALUES (71, 'user/admin/video/1.mp4', NULL, 9867000, 1, b'1', b'0', '2021-09-18 08:52:54', '2021-09-18 08:52:54', 1);
INSERT INTO `video` VALUES (72, 'user/admin/video/3.mp4', NULL, 11467000, 1, b'1', b'0', '2021-09-18 09:00:51', '2021-09-18 09:00:51', 1);
INSERT INTO `video` VALUES (73, 'user/admin/video/videodemo.mp4', NULL, 21158000, 1, b'1', b'0', '2021-09-18 12:54:49', '2021-09-18 12:54:49', 1);
INSERT INTO `video` VALUES (74, 'user/admin/video/1.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 12:55:39', '2021-09-18 12:55:39', 1);
INSERT INTO `video` VALUES (75, 'user/admin/video/1.mp4', NULL, 9867000, 1, b'1', b'0', '2021-09-18 13:47:33', '2021-09-18 13:47:33', 1);
INSERT INTO `video` VALUES (76, 'user/admin/video/2.mp4', NULL, 11000000, 1, b'1', b'0', '2021-09-18 13:47:46', '2021-09-18 13:47:46', 1);
INSERT INTO `video` VALUES (77, 'user/admin/video/8.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 13:48:14', '2021-09-18 13:48:14', 1);
INSERT INTO `video` VALUES (78, 'user/admin/video/videodemo.mp4', NULL, 21158000, 1, b'1', b'0', '2021-09-18 19:05:07', '2021-09-18 19:05:07', 1);
INSERT INTO `video` VALUES (79, 'user/admin/video/1.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:22:16', '2021-09-18 19:22:16', 1);
INSERT INTO `video` VALUES (80, 'user/admin/video/2.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:22:28', '2021-09-18 19:22:28', 1);
INSERT INTO `video` VALUES (81, 'user/admin/video/9.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:35:02', '2021-09-18 19:35:02', 1);
INSERT INTO `video` VALUES (82, 'user/admin/video/3.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:35:51', '2021-09-18 19:35:51', 1);
INSERT INTO `video` VALUES (83, 'user/admin/video/4.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:36:09', '2021-09-18 19:36:09', 1);
INSERT INTO `video` VALUES (84, 'user/admin/video/3.mp4', NULL, 11467000, 1, b'1', b'0', '2021-09-18 19:36:24', '2021-09-18 19:36:24', 1);
INSERT INTO `video` VALUES (85, 'user/admin/video/12.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:39:43', '2021-09-18 19:39:43', 1);
INSERT INTO `video` VALUES (86, 'user/admin/video/6.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:39:53', '2021-09-18 19:39:53', 1);
INSERT INTO `video` VALUES (87, 'user/admin/video/5.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:40:09', '2021-09-18 19:40:09', 1);
INSERT INTO `video` VALUES (88, 'user/admin/video/6.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:40:18', '2021-09-18 19:40:18', 1);
INSERT INTO `video` VALUES (89, 'user/admin/video/5.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:40:34', '2021-09-18 19:40:34', 1);
INSERT INTO `video` VALUES (90, 'user/admin/video/11.mp4', NULL, 0, 1, b'1', b'0', '2021-09-18 19:40:44', '2021-09-18 19:40:44', 1);
INSERT INTO `video` VALUES (91, 'user/admin/video/7.mp4', NULL, 15900000, 1, b'1', b'0', '2021-09-18 19:40:51', '2021-09-18 19:40:51', 1);
INSERT INTO `video` VALUES (92, 'user/admin/video/1.mp4', NULL, 9867000, 1, b'1', b'0', '2021-09-19 06:52:23', '2021-09-19 06:52:23', 1);
INSERT INTO `video` VALUES (93, 'user/admin/video/1.mp4', NULL, 0, 1, b'1', b'0', '2021-09-19 06:53:38', '2021-09-19 06:53:38', 1);
INSERT INTO `video` VALUES (94, 'user/admin/video/2.mp4', NULL, 0, 1, b'1', b'0', '2021-09-19 06:53:50', '2021-09-19 06:53:50', 1);
INSERT INTO `video` VALUES (95, 'user/admin/video/3.mp4', NULL, 0, 1, b'1', b'0', '2021-09-19 06:54:03', '2021-09-19 06:54:03', 1);
INSERT INTO `video` VALUES (96, 'user/admin/video/4.mp4', NULL, 0, 1, b'1', b'0', '2021-09-19 06:54:16', '2021-09-19 06:54:16', 1);
INSERT INTO `video` VALUES (97, 'user/admin/video/1.mp4', NULL, 0, 1, b'1', b'0', '2021-09-19 06:58:21', '2021-09-19 06:58:21', 1);

-- ----------------------------
-- Triggers structure for table app_user
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_app_user`;
delimiter ;;
CREATE TRIGGER `after_insert_app_user` AFTER INSERT ON `app_user` FOR EACH ROW BEGIN
				if new.avatar_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.avatar_id;					
			
			end if;
				SET @_year = YEAR(NOW());
				SET @_month = MONTH(NOW());
				SET @_day = DAY(NOW());
			SELECT revenue.id  into @revenue_id	FROM revenue WHERE revenue.`year` = @_year and revenue.`month` = @_month and  revenue.`day` = @_day;
				if @revenue_id is null then 				
					insert  INTO revenue (`month`, `year`,`day`) VALUES( @_month, @_year,@_day);
				end if;	
				UPDATE revenue SET revenue.new_member=revenue.new_member+1 WHERE revenue.`year` = @_year and revenue.`month` =  @_month and  revenue.`day` = @_day;	
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
DROP TRIGGER IF EXISTS `before_insert_course`;
delimiter ;;
CREATE TRIGGER `before_insert_course` BEFORE INSERT ON `course` FOR EACH ROW BEGIN
			 SET new.price=new.origin_price*(100-new.discount)/100;
			 	SELECT video.id into @demo_id 	FROM video WHERE id = new.demo_id;  
				if @demo_id is null then
				set new.demo_id=null;
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
			
		if new.sum_rating <> 0  then		
			
					UPDATE course set rate_star=sum_star/sum_rating where id =new.id;
			
			end if;
			
			UPDATE categories SET categories.total_course=categories.total_course+1 WHERE categories.id =new.category_id;
			SET @_year = YEAR(NOW());
				SET @_month = MONTH(NOW());
				SET @_day = DAY(NOW());
			SELECT revenue.id  into @revenue_id	FROM revenue WHERE revenue.`year` = @_year and revenue.`month` = @_month and  revenue.`day` = @_day;
				if @revenue_id is null then 				
					insert  INTO revenue (`month`, `year`,`day`) VALUES( @_month, @_year,@_day);
				end if;	
				UPDATE revenue SET revenue.new_member=revenue.course_upload+1 WHERE revenue.`year` = @_year and revenue.`month` =  @_month and  revenue.`day` = @_day;	


END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `before_update_course`;
delimiter ;;
CREATE TRIGGER `before_update_course` BEFORE UPDATE ON `course` FOR EACH ROW BEGIN
			SET new.price=new.origin_price*(100-new.discount)/100;
			
				if new.sum_rating <> 0 and new.sum_star <> 0   then		
			
					set	new.rate_star=new.sum_star/new.sum_rating;
			
				end if;
				
				SELECT video.id into @demo_id 	FROM video WHERE id = new.demo_id;  
				if @demo_id is null then
				set new.demo_id=null;
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
			if new.img_poster_id is not null then
				UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.img_poster_id;
			end if;
			if new.img_poster_id is not null then
					UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.img_poster_id;		
			end if;
	
			if new.demo_id is not null then
					UPDATE video SET count_linked=count_linked+1 WHERE id =  new.demo_id;
			end if;
			if old.demo_id is not null then
						UPDATE video SET count_linked=count_linked-1 WHERE id =  old.demo_id;		
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
-- Triggers structure for table evaluates
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_evaluate`;
delimiter ;;
CREATE TRIGGER `after_insert_evaluate` AFTER INSERT ON `evaluates` FOR EACH ROW BEGIN
					
			if new.deleted=0  then		
						UPDATE course SET sum_rating=sum_rating+1 WHERE id =  new.course_id;					
						UPDATE course SET sum_star=sum_star+new.rating WHERE id =  new.course_id;					
				end if;
				
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table evaluates
-- ----------------------------
DROP TRIGGER IF EXISTS `after_update_evaluate`;
delimiter ;;
CREATE TRIGGER `after_update_evaluate` AFTER UPDATE ON `evaluates` FOR EACH ROW BEGIN
				if (new.deleted=0 and old.deleted=1) then		
						UPDATE course SET sum_rating=sum_rating+1 WHERE id =  new.course_id;					
						UPDATE course SET sum_star=sum_star+new.rating WHERE id =  new.course_id;					
				end if;
				if (new.deleted=1 and old.deleted=0) then		
						UPDATE course SET sum_rating=sum_rating-1 WHERE id =  old.course_id;					
						UPDATE course SET sum_star=sum_star-old.rating WHERE id =  old.course_id;					
				end if;
					if (new.deleted=0 and old.deleted=0) then		
							UPDATE course SET sum_star=sum_star+new.rating WHERE id =  new.course_id;			
							UPDATE course SET sum_star=sum_star-old.rating WHERE id =  old.course_id;							
							
				end if;
			
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table image_admin
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_image_admin`;
delimiter ;;
CREATE TRIGGER `after_insert_image_admin` AFTER INSERT ON `image_admin` FOR EACH ROW BEGIN
				if new.image_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.image_id;					
			
			end if;
			
			
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table image_admin
-- ----------------------------
DROP TRIGGER IF EXISTS `update_image_admin`;
delimiter ;;
CREATE TRIGGER `update_image_admin` AFTER UPDATE ON `image_admin` FOR EACH ROW BEGIN
		
			if old.image_id <> new.image_id  then		
					if new.image_id is not null then
					UPDATE resource_image SET count_linked=count_linked+1 WHERE id =  new.image_id;
					end if;
					if old.image_id is not null then
						UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.image_id;		
					end if;
			end if;
			
		
	 END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table image_admin
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_image_admin`;
delimiter ;;
CREATE TRIGGER `after_delete_image_admin` AFTER DELETE ON `image_admin` FOR EACH ROW BEGIN
				if old.image_id is not null  then		
			
					UPDATE resource_image SET count_linked=count_linked-1 WHERE id =  old.image_id;					
			
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
				SET @_day = DAY(NOW());
			SELECT revenue.id  into @revenue_id	FROM revenue WHERE revenue.`year` = @_year and revenue.`month` = @_month and  revenue.`day` = @_day;
				if @revenue_id is null then 				
					insert  INTO revenue (`month`, `year`, `day`) VALUES( @_month, @_year, @_day);
				end if;				
				UPDATE revenue SET revenue.money=revenue.money+@TMP_PRICE,revenue.course_sell=revenue.course_sell+1 WHERE revenue.`year` = @_year and revenue.`month` =  @_month;
				UPDATE categories SET categories.total_course_bought=categories.total_course_bought+1 WHERE categories.id =  @TMP;
				UPDATE course SET course.bought=course.bought+1 WHERE course.id =  old.course_id;
		
		end if;
			if old.successed <> new.successed and new.successed = 0 then
			SET @TMP_PRICE = 0;
				SELECT price  into @TMP_PRICE	FROM course WHERE id = old.course_id;  
				UPDATE categories SET categories.total_money=categories.total_money-@TMP_PRICE WHERE categories.id =  @TMP;
				SET @_year = YEAR(NOW());
				SET @_month = MONTH(NOW());
				SET @_day = DAY(NOW());
			SELECT revenue.id  into @revenue_id	FROM revenue WHERE revenue.`year` = @_year and revenue.`month` = @_month and  revenue.`day` = @_day;
				if @revenue_id is null then 				
					insert  INTO revenue (`month`, `year`, `day`) VALUES( @_month, @_year, @_day);
				end if;				
				UPDATE revenue SET revenue.money=revenue.money-@TMP_PRICE,revenue.money=course_sell.course_sell-1 WHERE revenue.`year` = @_year and revenue.`month` =  @_month and  revenue.`day` = @_day;
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
-- Triggers structure for table resource_image
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_resource_image`;
delimiter ;;
CREATE TRIGGER `after_delete_resource_image` AFTER DELETE ON `resource_image` FOR EACH ROW BEGIN
					
			
						UPDATE course SET img_poster_id = null WHERE img_poster_id =  old.id;		
						UPDATE image_admin SET image_id = null WHERE image_id =  old.id;		
						UPDATE video SET video.img_poster_id = null WHERE video.img_poster_id =  old.id;		
			
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
					
					UPDATE lesson SET video_id = null WHERE video_id =  old.id;							
					UPDATE course SET demo_id = null WHERE demo_id =  old.id;					
			
	 END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

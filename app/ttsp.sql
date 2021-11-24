/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : ttsp

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 10/05/2021 21:07:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'hung', 1, 'hung', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `admin` VALUES (2, 'Em Hùng', 1, 'hungglevan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `admin` VALUES (3, 'Hùng Em', 1, 'hung2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `admin` VALUES (4, 'ha ha', 1, 'ha@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `admin` VALUES (5, 'Lê Hùng', 1, 'hunggle@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `mp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `admin_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, '1620542486769.mp3', 'hung', 1, 1, 1, '2021-05-09 13:41:26');
INSERT INTO `history` VALUES (2, '1620546108566.mp3', ' Chào mừng bạn đến với Hero bot', 1, 1, 1, '2021-05-09 14:41:48');
INSERT INTO `history` VALUES (3, '1620546180587.mp3', 'KM/h', 1, 1, 1, '2021-05-09 14:43:00');
INSERT INTO `history` VALUES (4, '1620546208484.mp3', 'KM / H', 1, 1, 1, '2021-05-09 14:43:28');
INSERT INTO `history` VALUES (5, '1620546221691.mp3', 'CM', 1, 1, 1, '2021-05-09 14:43:41');
INSERT INTO `history` VALUES (6, '1620546231843.mp3', 'cm', 1, 1, 1, '2021-05-09 14:43:51');
INSERT INTO `history` VALUES (7, '1620546239081.mp3', '%', 1, 1, 1, '2021-05-09 14:43:59');
INSERT INTO `history` VALUES (8, '1620546252956.mp3', '30%', 1, 1, 1, '2021-05-09 14:44:13');
INSERT INTO `history` VALUES (9, '1620546270177.mp3', '99,99%', 1, 1, 1, '2021-05-09 14:44:30');
INSERT INTO `history` VALUES (10, '1620565313384.mp3', 'hello my name\'s Hùng', 1, 1, 1, '2021-05-09 20:01:53');
INSERT INTO `history` VALUES (11, '1620565586884.mp3', 'hello my name\'s Hùng', 1, 1, 1, '2021-05-09 20:06:29');
INSERT INTO `history` VALUES (12, '1620653683162.mp3', 'hello my ame', 1, 1, 1, '2021-05-10 20:34:45');
INSERT INTO `history` VALUES (13, '1620653905566.mp3', '你好', 1, 1, 1, '2021-05-10 20:38:27');
INSERT INTO `history` VALUES (14, '1620654930066.mp3', ' Chào mừng bạn đến với Hero bot', 1, 1, 1, '2021-05-10 20:55:33');
INSERT INTO `history` VALUES (15, '1620654948053.mp3', ' Chào mừng bạn đến với Hero bot', 1, 1, 1, '2021-05-10 20:55:48');
INSERT INTO `history` VALUES (16, '1620654962166.mp3', ' Chào mừng bạn đến với Hero bot', 1, 1, 1, '2021-05-10 20:56:02');
INSERT INTO `history` VALUES (17, '1620655018484.mp3', 'Bonjour', 1, 1, 1, '2021-05-10 20:57:00');
INSERT INTO `history` VALUES (18, '1620655135533.mp3', 'บริการฟรีของ Google ที่แปลคำวลีและหน้าเว็บระหว่างภาษาเวียดนามและภาษาอื่น ๆ มากกว่า 100 ภาษาได้อย่างรวดเร็ว', 1, 1, 1, '2021-05-10 20:59:08');
INSERT INTO `history` VALUES (19, '1620655523836.mp3', 'You are testing if the values of the variables error and Already are present in ... Both of your if and elif tests therefore are false; there is no undefined object in', 1, 1, 1, '2021-05-10 21:05:37');

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `id` int(0) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `create_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES (2, 'af', 'Afrikaans', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (4, 'ar', 'Arabic', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (21, 'az', 'Azeri (Latin)', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (24, 'be', 'Belarusian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (26, 'bg', 'Bulgarian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (29, 'ca', 'Catalan', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (31, 'cs', 'Czech', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (33, 'cy', 'Welsh', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (35, 'da', 'Danish', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (37, 'de', 'German', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (43, 'dv', 'Divehi', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (45, 'el', 'Greek', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (47, 'en', 'English', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (61, 'eo', 'Esperanto', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (62, 'es', 'Spanish', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (83, 'et', 'Estonian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (85, 'eu', 'Basque', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (87, 'fa', 'Farsi', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (89, 'fi', 'Finnish', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (91, 'fo', 'Faroese', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (93, 'fr', 'French', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (100, 'gl', 'Galician', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (102, 'gu', 'Gujarati', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (104, 'he', 'Hebrew', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (106, 'hi', 'Hindi', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (108, 'hr', 'Croatian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (111, 'hu', 'Hungarian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (113, 'hy', 'Armenian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (115, 'id', 'Indonesian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (117, 'is', 'Icelandic', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (119, 'it', 'Italian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (122, 'ja', 'Japanese', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (124, 'ka', 'Georgian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (126, 'kk', 'Kazakh', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (128, 'kn', 'Kannada', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (130, 'ko', 'Korean', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (134, 'ky', 'Kyrgyz', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (136, 'lt', 'Lithuanian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (138, 'lv', 'Latvian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (140, 'mi', 'Maori', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (142, 'mk', 'FYRO Macedonian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (144, 'mn', 'Mongolian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (146, 'mr', 'Marathi', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (148, 'ms', 'Malay', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (151, 'mt', 'Maltese', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (153, 'nb', 'Norwegian (Bokm?l)', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (155, 'nl', 'Dutch', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (159, 'ns', 'Northern Sotho', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (161, 'pa', 'Punjabi', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (163, 'pl', 'Polish', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (165, 'ps', 'Pashto', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (167, 'pt', 'Portuguese', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (170, 'qu', 'Quechua', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (174, 'ro', 'Romanian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (176, 'ru', 'Russian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (178, 'sa', 'Sanskrit', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (180, 'se', 'Sami (Northern)', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (190, 'sk', 'Slovak', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (192, 'sl', 'Slovenian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (194, 'sq', 'Albanian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (200, 'sv', 'Swedish', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (203, 'sw', 'Swahili', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (207, 'ta', 'Tamil', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (209, 'te', 'Telugu', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (211, 'th', 'Thai', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (213, 'tl', 'Tagalog', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (215, 'tn', 'Tswana', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (217, 'tr', 'Turkish', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (219, 'tt', 'Tatar', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (221, 'ts', 'Tsonga', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (222, 'uk', 'Ukrainian', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (224, 'ur', 'Urdu', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (226, 'uz', 'Uzbek (Latin)', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (230, 'vi', 'Vietnamese (Viet Nam)', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (231, 'xh', 'Xhosa', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (233, 'zh', 'Chinese', '1', '2021-05-10 20:41:01');
INSERT INTO `language` VALUES (239, 'zu', 'Zulu', '1', '2021-05-10 20:41:01');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_id` float NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, 'Mỹ trở lại, cùng Trung Quốc cam kết cắt giảm khí thải', '/my-tro-lai-cung-trung-quoc-cam-ket-cat-giam-khi-thai-20210422211729021.htm', '1619103258554.mp3', 2.02104e16, 0, '2021-04-22 21:55:25');
INSERT INTO `paper` VALUES (2, 'Càng cao tuổi, càng ngủ ít là bình thường?', '/cang-cao-tuoi-cang-ngu-it-la-binh-thuong-20210422172706913.htm', '1619103325755.mp3', 2.02104e16, 0, '2021-04-22 21:55:26');
INSERT INTO `paper` VALUES (3, 'Tân Sơn Nhất lắp đặt thêm 5 máy soi chiếu an ninh, thoáng ngay', '/tan-son-nhat-lap-dat-them-5-may-soi-chieu-an-ninh-thoang-ngay-20210422202458671.htm', '1619103327068.mp3', 2.02104e16, 0, '2021-04-22 21:55:27');
INSERT INTO `paper` VALUES (4, 'Nguyên chủ tịch Sabeco: \'Bộ Công thương chỉ đạo thế nào thì làm theo như vậy\'', '/nguyen-chu-tich-sabeco-bo-cong-thuong-chi-dao-the-nao-thi-lam-theo-nhu-vay-20210422202308706.htm', '1619103328397.mp3', 2.02104e16, 0, '2021-04-22 21:55:29');
INSERT INTO `paper` VALUES (5, 'Nhiều nước châu Âu mở cửa kinh tế trở lại', '/nhieu-nuoc-chau-au-mo-cua-kinh-te-tro-lai-20210422171658293.htm', '1619103329871.mp3', 2.02104e16, 0, '2021-04-22 21:55:31');
INSERT INTO `paper` VALUES (6, 'Singapore có ca COVID đã tiêm đủ vắc xin, cấm người từng đến Ấn Độ', '/singapore-co-ca-covid-da-tiem-du-vac-xin-cam-nguoi-tung-den-an-do-20210422200653765.htm', '1619103334593.mp3', 2.02104e16, 0, '2021-04-22 21:55:35');
INSERT INTO `paper` VALUES (7, 'Bộ Y tế đồng loạt kiểm tra phòng chống dịch COVID-19 ở biên giới phía Nam', '/bo-y-te-dong-loat-kiem-tra-phong-chong-dich-covid-19-o-bien-gioi-phia-nam-2021042219380631.htm', '1619103335573.mp3', 2.02104e15, 0, '2021-04-22 21:55:36');
INSERT INTO `paper` VALUES (8, 'Thượng tướng Phan Văn Giang hội đàm với thượng tướng Trung Quốc Ngụy Phượng Hoà', '/thuong-tuong-phan-van-giang-hoi-dam-voi-thuong-tuong-trung-quoc-nguy-phuong-hoa-20210425184442256.htm', '1619353759145.mp3', 2.02104e16, 0, '2021-04-25 19:29:20');
INSERT INTO `paper` VALUES (9, 'Cháy nhà xưởng Công ty Doosan, khói đen bốc cuồn cuộn', '/chay-nha-xuong-cong-ty-doosan-khoi-den-boc-cuon-cuon-20210425190434085.htm', '1619353760900.mp3', 2.02104e16, 0, '2021-04-25 19:29:21');
INSERT INTO `paper` VALUES (10, 'Đà Nẵng vẫn còn nhiều người quên mang khẩu trang nơi công cộng', '/da-nang-van-con-nhieu-nguoi-quen-mang-khau-trang-noi-cong-cong-20210425182433769.htm', '1619353761924.mp3', 2.02104e16, 0, '2021-04-25 19:29:22');
INSERT INTO `paper` VALUES (11, 'Chiều 25-4: Việt Nam thêm 10 ca mắc COVID-19 mới, cách ly sau nhập cảnh', '/chieu-25-4-viet-nam-them-10-ca-mac-covid-19-moi-cach-ly-sau-nhap-canh-20210425181108088.htm', '1619353762738.mp3', 2.02104e16, 0, '2021-04-25 19:29:24');
INSERT INTO `paper` VALUES (12, 'Campuchia thêm 616 ca nhiễm và người Việt hành động đẹp, được hoan nghênh', '/campuchia-them-616-ca-nhiem-va-nguoi-viet-hanh-dong-dep-duoc-hoan-nghenh-20210425141932828.htm', '1619353764768.mp3', 2.02104e16, 0, '2021-04-25 19:29:25');
INSERT INTO `paper` VALUES (13, 'Cảnh sát biển Philippines diễn tập ở Biển Đông, gần Scarborough', '/canh-sat-bien-philippines-dien-tap-o-bien-dong-gan-scarborough-20210425174156889.htm', '1619353765776.mp3', 2.02104e16, 0, '2021-04-25 19:29:26');
INSERT INTO `paper` VALUES (14, 'Chống dịch hỗn loạn dẫn đến thảm kịch ở Ấn Độ', '/chong-dich-hon-loan-dan-den-tham-kich-o-an-do-20210425172612384.htm', '1619353766703.mp3', 2.02104e16, 0, '2021-04-25 19:29:28');
INSERT INTO `paper` VALUES (15, 'Lăng kính 24g: Đi xe khách bị tai nạn - Ai bồi thường?', '/lang-kinh-24g-di-xe-khach-bi-tai-nan-ai-boi-thuong-20210425170641489.htm', '1619353768900.mp3', 2.02104e16, 0, '2021-04-25 19:29:29');
INSERT INTO `paper` VALUES (16, 'Hàng trăm cầu thủ U9 ra sân vì những người bạn', '/hang-tram-cau-thu-u9-ra-san-vi-nhung-nguoi-ban-20210425170238815.htm', '1619353769354.mp3', 2.02104e16, 0, '2021-04-25 19:29:29');
INSERT INTO `paper` VALUES (17, 'Phe đối lập ở Myanmar: Đồng thuận về Myanmar của ASEAN là tin \'đáng khích lệ\'', '/phe-doi-lap-o-myanmar-dong-thuan-ve-myanmar-cua-asean-la-tin-dang-khich-le-20210425154017406.htm', '1619353770280.mp3', 2.02104e16, 0, '2021-04-25 19:29:30');
INSERT INTO `paper` VALUES (18, 'Thủ tướng Ấn Độ: \'COVID-19 làm rung chuyển đất nước chúng ta\'', '/thu-tuong-an-do-covid-19-lam-rung-chuyen-dat-nuoc-chung-ta-20210425172358349.htm', '1619353771193.mp3', 2.02104e16, 0, '2021-04-25 19:29:32');
INSERT INTO `paper` VALUES (19, 'Cảnh sát trưởng Phnom Penh: Cảnh sát cầm roi mây chỉ để răn đe người vi phạm lệnh phong tỏa COVID-19', '/canh-sat-truong-phnom-penh-canh-sat-cam-roi-may-chi-de-ran-de-nguoi-vi-pham-lenh-phong-toa-covid-19-20210425164037584.htm', '1619353772218.mp3', 2.02104e16, 0, '2021-04-25 19:29:32');
INSERT INTO `paper` VALUES (20, 'Du lịch: \'Chúng tôi sẽ không giảm giá mà còn tăng giá, tăng tiện tích, tăng trải nghiệm\'', '/du-lich-chung-toi-se-khong-giam-gia-ma-con-tang-gia-tang-tien-tich-tang-trai-nghiem-2021042411212916.htm', '1619353773283.mp3', 2.02104e15, 0, '2021-04-25 19:29:34');
INSERT INTO `paper` VALUES (21, 'Tàu ngầm Indonesia chìm: Người nhà muốn tìm được con bằng mọi giá', '/tau-ngam-indonesia-chim-nguoi-nha-muon-tim-duoc-con-bang-moi-gia-20210425162144086.htm', '1619353774832.mp3', 2.02104e16, 0, '2021-04-25 19:29:36');
INSERT INTO `paper` VALUES (22, 'Phát hiện thi thể bé trai sơ sinh trôi trên sông', '/phat-hien-thi-the-be-trai-so-sinh-troi-tren-song-20210425160400661.htm', '1619353776629.mp3', 2.02104e16, 0, '2021-04-25 19:29:37');
INSERT INTO `paper` VALUES (23, 'Một người chết sau khi xuống hầm biogas cứu người', '/mot-nguoi-chet-sau-khi-xuong-ham-biogas-cuu-nguoi-20210425114452841.htm', '1619353777451.mp3', 2.02104e16, 0, '2021-04-25 19:29:37');
INSERT INTO `paper` VALUES (24, 'Võ sĩ bị gãy chân, đối thủ quỳ gối trên sàn đấu cầu nguyện cho anh', '/vo-si-bi-gay-chan-doi-thu-quy-goi-tren-san-dau-cau-nguyen-cho-anh-20210425154440391.htm', '1619353778314.mp3', 2.02104e16, 0, '2021-04-25 19:29:38');
INSERT INTO `paper` VALUES (25, 'Dân Ấn Độ quay sang trách Mỹ về dịch COVID-19, Mỹ có thể giúp gì?', '/dan-an-do-quay-sang-trach-my-ve-dich-covid-19-my-co-the-giup-gi-20210425144415829.htm', '1619353779124.mp3', 2.02104e16, 0, '2021-04-25 19:29:40');
INSERT INTO `paper` VALUES (26, '\'Nhanh như chớp\' và Trường Giang sai kiến thức cơ bản: ‘Vợ nhặt’ của Nam Cao?', '/nhanh-nhu-chop-va-truong-giang-sai-kien-thuc-co-ban-vo-nhat-cua-nam-cao-20210425145733694.htm', '1619353781203.mp3', 2.02104e16, 0, '2021-04-25 19:29:43');
INSERT INTO `paper` VALUES (27, 'Nhớ chả lệch Nghệ An bởi mùa này, lệch nhiều trứng lắm', '/nho-cha-lech-nghe-an-boi-mua-nay-lech-nhieu-trung-lam-20210425091038005.htm', '1619353783423.mp3', 2.02104e16, 0, '2021-04-25 19:29:44');
INSERT INTO `paper` VALUES (28, 'Hình ảnh đầu tiên về tàu ngầm KRI Nanggala-402 bị chìm: Vỡ thành 3 mảnh', '/hinh-anh-dau-tien-ve-tau-ngam-kri-nanggala-402-bi-chim-vo-thanh-3-manh-20210425191625383.htm', '1619354273619.mp3', 2.02104e16, 0, '2021-04-25 19:37:54');
INSERT INTO `paper` VALUES (29, 'Lở cát - cái giá phải trả ở Bình Thuận', '/lo-cat-cai-gia-phai-tra-o-binh-thuan-20210426162919966.htm', '1619446047154.mp3', 2.02104e16, 0, '2021-04-26 21:07:28');
INSERT INTO `paper` VALUES (30, 'Bệnh nhân Ấn Độ lành COVID được khuyên trồng cây trả lại oxy cho tự nhiên', '/benh-nhan-an-do-lanh-covid-duoc-khuyen-trong-cay-tra-lai-oxy-cho-tu-nhien-20210426174527299.htm', '1619446050209.mp3', 2.02104e16, 0, '2021-04-26 21:07:31');
INSERT INTO `paper` VALUES (31, 'Đi chùa phải đeo khẩu trang, sát khuẩn', '/di-chua-phai-deo-khau-trang-sat-khuan-20210426202900619.htm', '1619446051329.mp3', 2.02104e16, 0, '2021-04-26 21:07:32');
INSERT INTO `paper` VALUES (32, 'Nhiều điều mới mẻ ở VBA 2021', '/nhieu-dieu-moi-me-o-vba-2021-20210426201643486.htm', '1619446065575.mp3', 2.02104e16, 0, '2021-04-26 21:07:48');
INSERT INTO `paper` VALUES (33, 'Nghi can chém chết người trong vụ hỗn chiến ở Phan Thiết đầu thú', '/nghi-can-chem-chet-nguoi-trong-vu-hon-chien-o-phan-thiet-dau-thu-20210426193646351.htm', '1619446068640.mp3', 2.02104e16, 0, '2021-04-26 21:07:49');
INSERT INTO `paper` VALUES (34, 'Đội vô địch bóng đá nữ quốc gia được thưởng 300 triệu đồng', '/doi-vo-dich-bong-da-nu-quoc-gia-duoc-thuong-300-trieu-dong-20210426174131255.htm', '1619446069555.mp3', 2.02104e16, 0, '2021-04-26 21:07:50');
INSERT INTO `paper` VALUES (35, 'Thủ tướng Thái Lan bị phạt tiền vì không đeo khẩu trang khi họp', '/thu-tuong-thai-lan-bi-phat-tien-vi-khong-deo-khau-trang-khi-hop-20210426193952616.htm', '1619446071999.mp3', 2.02104e16, 0, '2021-04-26 21:07:52');
INSERT INTO `paper` VALUES (36, 'TP.HCM ra công văn chỉ đạo khẩn về COVID-19', '/tp-hcm-ra-cong-van-chi-dao-khan-ve-covid-19-20210426202113648.htm', '1619446073254.mp3', 2.02104e16, 0, '2021-04-26 21:07:54');
INSERT INTO `paper` VALUES (37, 'Thủ tướng Phạm Minh Chính: Để xảy ra dịch COVID-19, xử lý kỷ luật tùy mức độ', '/thu-tuong-pham-minh-chinh-de-xay-ra-dich-covid-19-xu-ly-ky-luat-tuy-muc-do-20210426195500882.htm', '1619446074899.mp3', 2.02104e16, 0, '2021-04-26 21:07:56');
INSERT INTO `paper` VALUES (38, 'Học sinh lớp 4 bị sét đánh chết khi đi học về gần tới nhà', '/hoc-sinh-lop-4-bi-set-danh-chet-khi-di-hoc-ve-gan-toi-nha-20210426200506522.htm', '1619446076400.mp3', 2.02104e16, 0, '2021-04-26 21:07:57');
INSERT INTO `paper` VALUES (39, 'Làm rõ nghi vấn bảo kê 2 \'bến cóc\' lấn chiếm sông Bình Triệu', '/lam-ro-nghi-van-bao-ke-2-ben-coc-lan-chiem-song-binh-trieu-20210426184152385.htm', '1619446077323.mp3', 2.02104e16, 0, '2021-04-26 21:07:57');
INSERT INTO `paper` VALUES (40, 'Mong manh cơ hội thành công của đại hội cổ đông Eximbank', '/mong-manh-co-hoi-thanh-cong-cua-dai-hoi-co-dong-eximbank-20210426194025438.htm', '1619446078123.mp3', 2.02104e16, 0, '2021-04-26 21:08:00');
INSERT INTO `paper` VALUES (41, 'Tìm thấy thi thể du khách Nga gặp nạn khi thăm thác Đray Sáp', '/tim-thay-thi-the-du-khach-nga-gap-nan-khi-tham-thac-dray-sap-20210426191703477.htm', '1619446080468.mp3', 2.02104e16, 0, '2021-04-26 21:08:01');
INSERT INTO `paper` VALUES (42, '51 chung cư ở thành phố Thủ Đức chưa có giấy hồng', '/51-chung-cu-o-thanh-pho-thu-duc-chua-co-giay-hong-20210426192542351.htm', '1619446081387.mp3', 2.02104e16, 0, '2021-04-26 21:08:01');
INSERT INTO `paper` VALUES (43, 'Công an TP.HCM: Sau ngày 23-5, tập trung xử phạt vi phạm tiếng ồn', '/cong-an-tp-hcm-sau-ngay-23-5-tap-trung-xu-phat-vi-pham-tieng-on-20210426193136613.htm', '1619446082169.mp3', 2.02104e16, 0, '2021-04-26 21:08:03');
INSERT INTO `paper` VALUES (44, '5 triệu người Mỹ bỏ liều vắc xin thứ 2', '/5-trieu-nguoi-my-bo-lieu-vac-xin-thu-2-2021042618530687.htm', '1619446083384.mp3', 2.02104e16, 0, '2021-04-26 21:08:04');
INSERT INTO `paper` VALUES (45, 'Betrimex - nhà sản xuất sản phẩm từ dừa và hàng đầu tại VN', '/betrimex-nha-san-xuat-san-pham-tu-dua-va-hang-dau-tai-vn-20210426170128709.htm', '1619446085184.mp3', 2.02104e16, 0, '2021-04-26 21:08:05');
INSERT INTO `paper` VALUES (46, 'Cháy lớn gần Bệnh viện Thống Nhất giờ cao điểm', '/chay-lon-gan-benh-vien-thong-nhat-gio-cao-diem-20210426190730955.htm', '1619446087743.mp3', 2.02104e16, 0, '2021-04-26 21:08:08');
INSERT INTO `paper` VALUES (47, 'Tân HLV người Hàn của Hà Nội FC: \'Tôi đã đến gặp HLV Park Hang Seo\'', '/tan-hlv-nguoi-han-cua-ha-noi-fc-toi-da-den-gap-hlv-park-hang-seo-2021042617445287.htm', '1619446088614.mp3', 2.02104e16, 0, '2021-04-26 21:08:09');
INSERT INTO `paper` VALUES (48, 'Khán giả Việt Nam lên án vụ ăn thịt gấu của Quỳnh Trần JP', '/khan-gia-viet-nam-len-an-vu-an-thit-gau-cua-quynh-tran-jp-2021042614482933.htm', '1619446095530.mp3', 2.02104e16, 0, '2021-04-26 21:08:17');
INSERT INTO `paper` VALUES (49, 'Đà Nẵng, Quảng Ninh không bắn pháo hoa dịp lễ 30-4', '/da-nang-quang-ninh-khong-ban-phao-hoa-dip-le-30-4-20210426191157622.htm', '1619446951888.mp3', 2.02104e16, 0, '2021-04-26 21:22:32');
INSERT INTO `paper` VALUES (50, 'Lở cát - cái giá phải trả ở Bình Thuận', '/lo-cat-cai-gia-phai-tra-o-binh-thuan-20210426162919966.htm', '1619446955637.mp3', 2.02104e16, 0, '2021-04-26 21:22:36');
INSERT INTO `paper` VALUES (51, 'Bệnh nhân Ấn Độ lành COVID được khuyên trồng cây trả lại oxy cho tự nhiên', '/benh-nhan-an-do-lanh-covid-duoc-khuyen-trong-cay-tra-lai-oxy-cho-tu-nhien-20210426174527299.htm', '1619446958736.mp3', 2.02104e16, 0, '2021-04-26 21:22:39');
INSERT INTO `paper` VALUES (52, 'Đi chùa phải đeo khẩu trang, sát khuẩn', '/di-chua-phai-deo-khau-trang-sat-khuan-20210426202900619.htm', '1619446959908.mp3', 2.02104e16, 0, '2021-04-26 21:22:40');
INSERT INTO `paper` VALUES (53, 'Nhiều điều mới mẻ ở VBA 2021', '/nhieu-dieu-moi-me-o-vba-2021-20210426201643486.htm', '1619446961509.mp3', 2.02104e16, 0, '2021-04-26 21:22:43');
INSERT INTO `paper` VALUES (54, 'Nghi can chém chết người trong vụ hỗn chiến ở Phan Thiết đầu thú', '/nghi-can-chem-chet-nguoi-trong-vu-hon-chien-o-phan-thiet-dau-thu-20210426193646351.htm', '1619446965044.mp3', 2.02104e16, 0, '2021-04-26 21:22:45');
INSERT INTO `paper` VALUES (55, 'Đội vô địch bóng đá nữ quốc gia được thưởng 300 triệu đồng', '/doi-vo-dich-bong-da-nu-quoc-gia-duoc-thuong-300-trieu-dong-20210426174131255.htm', '1619446965877.mp3', 2.02104e16, 0, '2021-04-26 21:22:46');
INSERT INTO `paper` VALUES (56, 'Thủ tướng Thái Lan bị phạt tiền vì không đeo khẩu trang khi họp', '/thu-tuong-thai-lan-bi-phat-tien-vi-khong-deo-khau-trang-khi-hop-20210426193952616.htm', '1619446967733.mp3', 2.02104e16, 0, '2021-04-26 21:22:48');
INSERT INTO `paper` VALUES (57, 'TP.HCM ra công văn chỉ đạo khẩn về COVID-19', '/tp-hcm-ra-cong-van-chi-dao-khan-ve-covid-19-20210426202113648.htm', '1619446969066.mp3', 2.02104e16, 0, '2021-04-26 21:22:49');
INSERT INTO `paper` VALUES (58, 'Thủ tướng Phạm Minh Chính: Để xảy ra dịch COVID-19, xử lý kỷ luật tùy mức độ', '/thu-tuong-pham-minh-chinh-de-xay-ra-dich-covid-19-xu-ly-ky-luat-tuy-muc-do-20210426195500882.htm', '1619446970200.mp3', 2.02104e16, 0, '2021-04-26 21:22:52');
INSERT INTO `paper` VALUES (59, 'Học sinh lớp 4 bị sét đánh chết khi đi học về gần tới nhà', '/hoc-sinh-lop-4-bi-set-danh-chet-khi-di-hoc-ve-gan-toi-nha-20210426200506522.htm', '1619446973277.mp3', 2.02104e16, 0, '2021-04-26 21:22:54');
INSERT INTO `paper` VALUES (60, 'Làm rõ nghi vấn bảo kê 2 \'bến cóc\' lấn chiếm sông Bình Triệu', '/lam-ro-nghi-van-bao-ke-2-ben-coc-lan-chiem-song-binh-trieu-20210426184152385.htm', '1619446974766.mp3', 2.02104e16, 0, '2021-04-26 21:22:55');
INSERT INTO `paper` VALUES (61, 'Mong manh cơ hội thành công của đại hội cổ đông Eximbank', '/mong-manh-co-hoi-thanh-cong-cua-dai-hoi-co-dong-eximbank-20210426194025438.htm', '1619446977850.mp3', 2.02104e16, 0, '2021-04-26 21:22:59');
INSERT INTO `paper` VALUES (62, 'Tìm thấy thi thể du khách Nga gặp nạn khi thăm thác Đray Sáp', '/tim-thay-thi-the-du-khach-nga-gap-nan-khi-tham-thac-dray-sap-20210426191703477.htm', '1619446979687.mp3', 2.02104e16, 0, '2021-04-26 21:23:00');
INSERT INTO `paper` VALUES (63, '51 chung cư ở thành phố Thủ Đức chưa có giấy hồng', '/51-chung-cu-o-thanh-pho-thu-duc-chua-co-giay-hong-20210426192542351.htm', '1619446984470.mp3', 2.02104e16, 0, '2021-04-26 21:23:05');
INSERT INTO `paper` VALUES (64, 'Công an TP.HCM: Sau ngày 23-5, tập trung xử phạt vi phạm tiếng ồn', '/cong-an-tp-hcm-sau-ngay-23-5-tap-trung-xu-phat-vi-pham-tieng-on-20210426193136613.htm', '1619446986274.mp3', 2.02104e16, 0, '2021-04-26 21:23:07');
INSERT INTO `paper` VALUES (65, '5 triệu người Mỹ bỏ liều vắc xin thứ 2', '/5-trieu-nguoi-my-bo-lieu-vac-xin-thu-2-2021042618530687.htm', '1619446988483.mp3', 2.02104e16, 0, '2021-04-26 21:23:09');
INSERT INTO `paper` VALUES (66, 'Betrimex - nhà sản xuất sản phẩm từ dừa và hàng đầu tại VN', '/betrimex-nha-san-xuat-san-pham-tu-dua-va-hang-dau-tai-vn-20210426170128709.htm', '1619446994229.mp3', 2.02104e16, 0, '2021-04-26 21:23:14');
INSERT INTO `paper` VALUES (67, 'Cháy lớn gần Bệnh viện Thống Nhất giờ cao điểm', '/chay-lon-gan-benh-vien-thong-nhat-gio-cao-diem-20210426190730955.htm', '1619447002568.mp3', 2.02104e16, 0, '2021-04-26 21:23:22');
INSERT INTO `paper` VALUES (68, 'Tân HLV người Hàn của Hà Nội FC: \'Tôi đã đến gặp HLV Park Hang Seo\'', '/tan-hlv-nguoi-han-cua-ha-noi-fc-toi-da-den-gap-hlv-park-hang-seo-2021042617445287.htm', '1619447003233.mp3', 2.02104e16, 0, '2021-04-26 21:23:23');
INSERT INTO `paper` VALUES (69, 'Xuất hiện video thủy thủ tàu ngầm Indonesia ca hát trước khi gặp nạn', '/xuat-hien-video-thuy-thu-tau-ngam-indonesia-ca-hat-truoc-khi-gap-nan-20210426205502777.htm', '1619447475266.mp3', 2.02104e16, 0, '2021-04-26 21:31:16');
INSERT INTO `paper` VALUES (70, 'Đà Nẵng, Quảng Ninh không bắn pháo hoa dịp lễ 30-4', '/da-nang-quang-ninh-khong-ban-phao-hoa-dip-le-30-4-20210426191157622.htm', '1619447476533.mp3', 2.02104e16, 0, '2021-04-26 21:31:17');
INSERT INTO `paper` VALUES (71, 'Lở cát - cái giá phải trả ở Bình Thuận', '/lo-cat-cai-gia-phai-tra-o-binh-thuan-20210426162919966.htm', '1619447478188.mp3', 2.02104e16, 0, '2021-04-26 21:31:19');
INSERT INTO `paper` VALUES (72, 'Bệnh nhân Ấn Độ lành COVID được khuyên trồng cây trả lại oxy cho tự nhiên', '/benh-nhan-an-do-lanh-covid-duoc-khuyen-trong-cay-tra-lai-oxy-cho-tu-nhien-20210426174527299.htm', '1619447479937.mp3', 2.02104e16, 0, '2021-04-26 21:31:20');
INSERT INTO `paper` VALUES (73, 'Đi chùa phải đeo khẩu trang, sát khuẩn', '/di-chua-phai-deo-khau-trang-sat-khuan-20210426202900619.htm', '1619447480967.mp3', 2.02104e16, 0, '2021-04-26 21:31:21');
INSERT INTO `paper` VALUES (74, 'Nhiều điều mới mẻ ở VBA 2021', '/nhieu-dieu-moi-me-o-vba-2021-20210426201643486.htm', '1619447482654.mp3', 2.02104e16, 0, '2021-04-26 21:31:24');
INSERT INTO `paper` VALUES (75, 'Nghi can chém chết người trong vụ hỗn chiến ở Phan Thiết đầu thú', '/nghi-can-chem-chet-nguoi-trong-vu-hon-chien-o-phan-thiet-dau-thu-20210426193646351.htm', '1619447484927.mp3', 2.02104e16, 0, '2021-04-26 21:31:25');
INSERT INTO `paper` VALUES (76, 'Đội vô địch bóng đá nữ quốc gia được thưởng 300 triệu đồng', '/doi-vo-dich-bong-da-nu-quoc-gia-duoc-thuong-300-trieu-dong-20210426174131255.htm', '1619447485884.mp3', 2.02104e16, 0, '2021-04-26 21:31:26');
INSERT INTO `paper` VALUES (77, 'Thủ tướng Thái Lan bị phạt tiền vì không đeo khẩu trang khi họp', '/thu-tuong-thai-lan-bi-phat-tien-vi-khong-deo-khau-trang-khi-hop-20210426193952616.htm', '1619447487298.mp3', 2.02104e16, 0, '2021-04-26 21:31:28');
INSERT INTO `paper` VALUES (78, 'TP.HCM ra công văn chỉ đạo khẩn về COVID-19', '/tp-hcm-ra-cong-van-chi-dao-khan-ve-covid-19-20210426202113648.htm', '1619447488520.mp3', 2.02104e16, 0, '2021-04-26 21:31:29');
INSERT INTO `paper` VALUES (79, 'Thủ tướng Phạm Minh Chính: Để xảy ra dịch COVID-19, xử lý kỷ luật tùy mức độ', '/thu-tuong-pham-minh-chinh-de-xay-ra-dich-covid-19-xu-ly-ky-luat-tuy-muc-do-20210426195500882.htm', '1619447489969.mp3', 2.02104e16, 0, '2021-04-26 21:31:31');
INSERT INTO `paper` VALUES (80, 'Học sinh lớp 4 bị sét đánh chết khi đi học về gần tới nhà', '/hoc-sinh-lop-4-bi-set-danh-chet-khi-di-hoc-ve-gan-toi-nha-20210426200506522.htm', '1619447491410.mp3', 2.02104e16, 0, '2021-04-26 21:31:31');
INSERT INTO `paper` VALUES (81, 'Làm rõ nghi vấn bảo kê 2 \'bến cóc\' lấn chiếm sông Bình Triệu', '/lam-ro-nghi-van-bao-ke-2-ben-coc-lan-chiem-song-binh-trieu-20210426184152385.htm', '1619447492110.mp3', 2.02104e16, 0, '2021-04-26 21:31:32');
INSERT INTO `paper` VALUES (82, 'Mong manh cơ hội thành công của đại hội cổ đông Eximbank', '/mong-manh-co-hoi-thanh-cong-cua-dai-hoi-co-dong-eximbank-20210426194025438.htm', '1619447493328.mp3', 2.02104e16, 0, '2021-04-26 21:31:34');
INSERT INTO `paper` VALUES (83, 'Tìm thấy thi thể du khách Nga gặp nạn khi thăm thác Đray Sáp', '/tim-thay-thi-the-du-khach-nga-gap-nan-khi-tham-thac-dray-sap-20210426191703477.htm', '1619447495142.mp3', 2.02104e16, 0, '2021-04-26 21:31:35');
INSERT INTO `paper` VALUES (84, '51 chung cư ở thành phố Thủ Đức chưa có giấy hồng', '/51-chung-cu-o-thanh-pho-thu-duc-chua-co-giay-hong-20210426192542351.htm', '1619447499289.mp3', 2.02104e16, 0, '2021-04-26 21:31:39');
INSERT INTO `paper` VALUES (85, 'Công an TP.HCM: Sau ngày 23-5, tập trung xử phạt vi phạm tiếng ồn', '/cong-an-tp-hcm-sau-ngay-23-5-tap-trung-xu-phat-vi-pham-tieng-on-20210426193136613.htm', '1619447500109.mp3', 2.02104e16, 0, '2021-04-26 21:31:41');
INSERT INTO `paper` VALUES (86, '5 triệu người Mỹ bỏ liều vắc xin thứ 2', '/5-trieu-nguoi-my-bo-lieu-vac-xin-thu-2-2021042618530687.htm', '1619447501420.mp3', 2.02104e16, 0, '2021-04-26 21:31:42');
INSERT INTO `paper` VALUES (87, 'Betrimex - nhà sản xuất sản phẩm từ dừa và hàng đầu tại VN', '/betrimex-nha-san-xuat-san-pham-tu-dua-va-hang-dau-tai-vn-20210426170128709.htm', '1619447503681.mp3', 2.02104e16, 0, '2021-04-26 21:31:44');
INSERT INTO `paper` VALUES (88, 'Cháy lớn gần Bệnh viện Thống Nhất giờ cao điểm', '/chay-lon-gan-benh-vien-thong-nhat-gio-cao-diem-20210426190730955.htm', '1619447505880.mp3', 2.02104e16, 0, '2021-04-26 21:31:46');
INSERT INTO `paper` VALUES (89, 'Phá đường dây bán thuốc nổ cho ngư dân đánh bắt cá', '/pha-duong-day-ban-thuoc-no-cho-ngu-dan-danh-bat-ca-20210426212841345.htm', '1619449646185.mp3', 2.02104e16, 0, '2021-04-26 22:07:26');
INSERT INTO `paper` VALUES (90, 'Xuất hiện video thủy thủ tàu ngầm Indonesia hát bài \'Tạm biệt\'', '/xuat-hien-video-thuy-thu-tau-ngam-indonesia-hat-bai-tam-biet-20210426205502777.htm', '1619449647001.mp3', 2.02104e16, 0, '2021-04-26 22:07:27');
INSERT INTO `paper` VALUES (91, 'Đà Nẵng, Quảng Ninh không bắn pháo hoa dịp lễ 30-4', '/da-nang-quang-ninh-khong-ban-phao-hoa-dip-le-30-4-20210426191157622.htm', '1619449647990.mp3', 2.02104e16, 0, '2021-04-26 22:07:29');
INSERT INTO `paper` VALUES (92, 'Lở cát - cái giá phải trả ở Bình Thuận', '/lo-cat-cai-gia-phai-tra-o-binh-thuan-20210426162919966.htm', '1619449649852.mp3', 2.02104e16, 0, '2021-04-26 22:07:31');
INSERT INTO `paper` VALUES (93, 'Bệnh nhân Ấn Độ lành COVID được khuyên trồng cây trả lại oxy cho tự nhiên', '/benh-nhan-an-do-lanh-covid-duoc-khuyen-trong-cay-tra-lai-oxy-cho-tu-nhien-20210426174527299.htm', '1619449651802.mp3', 2.02104e16, 0, '2021-04-26 22:07:32');
INSERT INTO `paper` VALUES (94, 'Đi chùa phải đeo khẩu trang, sát khuẩn', '/di-chua-phai-deo-khau-trang-sat-khuan-20210426202900619.htm', '1619449653998.mp3', 2.02104e16, 0, '2021-04-26 22:07:35');
INSERT INTO `paper` VALUES (95, 'Nhiều điều mới mẻ ở VBA 2021', '/nhieu-dieu-moi-me-o-vba-2021-20210426201643486.htm', '1619449655403.mp3', 2.02104e16, 0, '2021-04-26 22:07:36');
INSERT INTO `paper` VALUES (96, 'Nghi can chém chết người trong vụ hỗn chiến ở Phan Thiết đầu thú', '/nghi-can-chem-chet-nguoi-trong-vu-hon-chien-o-phan-thiet-dau-thu-20210426193646351.htm', '1619449657165.mp3', 2.02104e16, 0, '2021-04-26 22:07:37');
INSERT INTO `paper` VALUES (97, 'Đội vô địch bóng đá nữ quốc gia được thưởng 300 triệu đồng', '/doi-vo-dich-bong-da-nu-quoc-gia-duoc-thuong-300-trieu-dong-20210426174131255.htm', '1619449658093.mp3', 2.02104e16, 0, '2021-04-26 22:07:39');
INSERT INTO `paper` VALUES (98, 'Thủ tướng Thái Lan bị phạt tiền vì không đeo khẩu trang khi họp', '/thu-tuong-thai-lan-bi-phat-tien-vi-khong-deo-khau-trang-khi-hop-20210426193952616.htm', '1619449659341.mp3', 2.02104e16, 0, '2021-04-26 22:07:39');
INSERT INTO `paper` VALUES (99, 'TP.HCM ra công văn chỉ đạo khẩn về COVID-19', '/tp-hcm-ra-cong-van-chi-dao-khan-ve-covid-19-20210426202113648.htm', '1619449660080.mp3', 2.02104e16, 0, '2021-04-26 22:07:40');
INSERT INTO `paper` VALUES (100, 'Thủ tướng Phạm Minh Chính: Để xảy ra dịch COVID-19, xử lý kỷ luật tùy mức độ', '/thu-tuong-pham-minh-chinh-de-xay-ra-dich-covid-19-xu-ly-ky-luat-tuy-muc-do-20210426195500882.htm', '1619449661771.mp3', 2.02104e16, 0, '2021-04-26 22:07:42');
INSERT INTO `paper` VALUES (101, 'Học sinh lớp 4 bị sét đánh chết khi đi học về gần tới nhà', '/hoc-sinh-lop-4-bi-set-danh-chet-khi-di-hoc-ve-gan-toi-nha-20210426200506522.htm', '1619449662793.mp3', 2.02104e16, 0, '2021-04-26 22:07:43');
INSERT INTO `paper` VALUES (102, 'Làm rõ nghi vấn bảo kê 2 \'bến cóc\' lấn chiếm sông Bình Triệu', '/lam-ro-nghi-van-bao-ke-2-ben-coc-lan-chiem-song-binh-trieu-20210426184152385.htm', '1619449663455.mp3', 2.02104e16, 0, '2021-04-26 22:07:43');
INSERT INTO `paper` VALUES (103, 'Mong manh cơ hội thành công của đại hội cổ đông Eximbank', '/mong-manh-co-hoi-thanh-cong-cua-dai-hoi-co-dong-eximbank-20210426194025438.htm', '1619449664180.mp3', 2.02104e16, 0, '2021-04-26 22:07:45');
INSERT INTO `paper` VALUES (104, 'Tìm thấy thi thể du khách Nga gặp nạn khi thăm thác Đray Sáp', '/tim-thay-thi-the-du-khach-nga-gap-nan-khi-tham-thac-dray-sap-20210426191703477.htm', '1619449665945.mp3', 2.02104e16, 0, '2021-04-26 22:07:46');
INSERT INTO `paper` VALUES (105, '51 chung cư ở thành phố Thủ Đức chưa có giấy hồng', '/51-chung-cu-o-thanh-pho-thu-duc-chua-co-giay-hong-20210426192542351.htm', '1619449666570.mp3', 2.02104e16, 0, '2021-04-26 22:07:46');
INSERT INTO `paper` VALUES (106, 'Công an TP.HCM: Sau ngày 23-5, tập trung xử phạt vi phạm tiếng ồn', '/cong-an-tp-hcm-sau-ngay-23-5-tap-trung-xu-phat-vi-pham-tieng-on-20210426193136613.htm', '1619449667145.mp3', 2.02104e16, 0, '2021-04-26 22:07:47');
INSERT INTO `paper` VALUES (107, '5 triệu người Mỹ bỏ liều vắc xin thứ 2', '/5-trieu-nguoi-my-bo-lieu-vac-xin-thu-2-2021042618530687.htm', '1619449667970.mp3', 2.02104e16, 0, '2021-04-26 22:07:48');
INSERT INTO `paper` VALUES (108, 'Betrimex - nhà sản xuất sản phẩm từ dừa và hàng đầu tại VN', '/betrimex-nha-san-xuat-san-pham-tu-dua-va-hang-dau-tai-vn-20210426170128709.htm', '1619449669142.mp3', 2.02104e16, 0, '2021-04-26 22:07:49');
INSERT INTO `paper` VALUES (109, 'Twitter chặn tài khoản chỉ trích Chính phủ Ấn Độ về chống dịch', 'https://congnghe.tuoitre.vn/twitter-chan-tai-khoan-chi-trich-chinh-phu-an-do-ve-chong-dich-20210426100604737.htm', '1619449749515.mp3', 0, 0, '2021-04-26 22:09:10');
INSERT INTO `paper` VALUES (110, '1.000 khách Việt đã đến Singapore bằng thẻ thông hành hàng không', 'https://dulich.tuoitre.vn/1-000-khach-viet-da-den-singapore-bang-the-thong-hanh-hang-khong-20210426142556525.htm', '1619449895175.mp3', 0, 0, '2021-04-26 22:11:36');
INSERT INTO `paper` VALUES (111, 'Xuân Trường: Cuộc cạnh tranh ở tuyến tiền vệ sẽ giúp ích cho đội tuyển Việt Nam', '/xuan-truong-cuoc-canh-tranh-o-tuyen-tien-ve-se-giup-ich-cho-doi-tuyen-viet-nam-20210509130851529.htm', '1620542454422.mp3', 2.02105e16, 1, '2021-05-09 13:40:55');
INSERT INTO `paper` VALUES (112, 'Nhiều tỉnh, thành cho học sinh nghỉ tiếp từ 10-5', '/nhieu-tinh-thanh-cho-hoc-sinh-nghi-tiep-tu-10-5-20210509111827811.htm', '1620542455498.mp3', 2.02105e16, 1, '2021-05-09 13:40:56');
INSERT INTO `paper` VALUES (113, '61 thầy cô, học sinh cách ly tập trung, thầy hiệu trưởng gửi tâm thư: \'Hãy vịn vai nhau để đi\'', '/61-thay-co-hoc-sinh-cach-ly-tap-trung-thay-hieu-truong-gui-tam-thu-hay-vin-vai-nhau-de-di-20210509120737045.htm', '1620542456938.mp3', 2.02105e16, 1, '2021-05-09 13:40:58');
INSERT INTO `paper` VALUES (114, 'Thừa Thiên Huế phát hiện ca nghi nhiễm COVID-19 thứ 3 liên quan thẩm mỹ viện Amida', '/thua-thien-hue-phat-hien-ca-nghi-nhiem-covid-19-thu-3-lien-quan-tham-my-vien-amida-20210509122410895.htm', '1620542458384.mp3', 2.02105e16, 1, '2021-05-09 13:40:59');
INSERT INTO `paper` VALUES (115, 'Cá ngần có chi mà lạ, nấu món gì cũng ngon', '/ca-ngan-co-chi-ma-la-nau-mon-gi-cung-ngon-20210509102538425.htm', '1620542460133.mp3', 2.02105e16, 1, '2021-05-09 13:41:01');
INSERT INTO `paper` VALUES (116, 'TP.HCM thí điểm thu thuế người cho thuê căn hộ, văn phòng trong chung cư', '/tp-hcm-thi-diem-thu-thue-nguoi-cho-thue-can-ho-van-phong-trong-chung-cu-2021050911593672.htm', '1620542461485.mp3', 2.02105e16, 1, '2021-05-09 13:41:02');
INSERT INTO `paper` VALUES (117, 'Học sinh Cần Thơ ngưng đến trường từ ngày 10-5', '/hoc-sinh-can-tho-ngung-den-truong-tu-ngay-10-5-20210509110614435.htm', '1620542463883.mp3', 2.02105e16, 1, '2021-05-09 13:41:04');
INSERT INTO `paper` VALUES (118, 'Cô gái khiếm thị Việt Nam đầu tiên làm việc cho UNDP: Nhắc chuyện buồn hoài chán lắm!', '/co-gai-khiem-thi-viet-nam-dau-tien-lam-viec-cho-undp-nhac-chuyen-buon-hoai-chan-lam-20210509082713197.htm', '1620542467697.mp3', 2.02105e16, 1, '2021-05-09 13:41:09');
INSERT INTO `paper` VALUES (119, 'Hủy vé bay, các khoản phí sân bay, phí an ninh vào túi ai?', '/huy-ve-bay-cac-khoan-phi-san-bay-phi-an-ninh-vao-tui-ai-20210509082747064.htm', '1620542469716.mp3', 2.02105e16, 1, '2021-05-09 13:41:10');
INSERT INTO `paper` VALUES (120, 'Chia sẻ cùng em thơ', '/chia-se-cung-em-tho-2021050909460948.htm', '1620542471077.mp3', 2.02105e16, 1, '2021-05-09 13:41:12');
INSERT INTO `paper` VALUES (121, 'Làm thế nào để học thật, thi thật, có nhân tài thật?', '/lam-the-nao-de-hoc-that-thi-that-co-nhan-tai-that-20210509081610912.htm', '1620542472380.mp3', 2.02105e16, 1, '2021-05-09 13:41:13');
INSERT INTO `paper` VALUES (122, 'Nửa thế kỷ nương nhau qua nắng mưa', '/nua-the-ky-nuong-nhau-qua-nang-mua-20210509100719479.htm', '1620542473524.mp3', 2.02105e16, 1, '2021-05-09 13:41:15');
INSERT INTO `paper` VALUES (123, 'Bệnh nhân COVID-19 người Việt tử vong tại Lào', '/benh-nhan-covid-19-nguoi-viet-tu-vong-tai-lao-20210509101722969.htm', '1620542475770.mp3', 2.02105e16, 1, '2021-05-09 13:41:16');
INSERT INTO `paper` VALUES (124, 'Coi chừng nhà hàng karaoke \"\'ve sầu thoát xác\'', '/coi-chung-nha-hang-karaoke-ve-sau-thoat-xac-20210509103224728.htm', '1620542476489.mp3', 2.02105e16, 1, '2021-05-09 13:41:16');
INSERT INTO `paper` VALUES (125, 'Xác minh clip nữ sinh lớp 7 bị đánh, lột áo trên cầu', '/xac-minh-clip-nu-sinh-lop-7-bi-danh-lot-ao-tren-cau-20210509104151385.htm', '1620542477078.mp3', 2.02105e16, 1, '2021-05-09 13:41:17');
INSERT INTO `paper` VALUES (126, 'Thừa Thiên Huế phong tỏa một xã, giãn cách xã hội toàn huyện Phong Điền', '/thua-thien-hue-phong-toa-mot-xa-gian-cach-xa-hoi-toan-huyen-phong-dien-20210509112347003.htm', '1620542477743.mp3', 2.02105e16, 1, '2021-05-09 13:41:18');
INSERT INTO `paper` VALUES (127, 'Số tài sản nguyên giám đốc Sở GTVT Trà Vinh bị trộm nguồn gốc \'tích cóp nhiều năm\'', '/so-tai-san-nguyen-giam-doc-so-gtvt-tra-vinh-bi-trom-nguon-goc-tich-cop-nhieu-nam-20210509103039163.htm', '1620542478269.mp3', 2.02105e16, 1, '2021-05-09 13:41:18');
INSERT INTO `paper` VALUES (128, 'TP.HCM: 342 người âm tính COVID-19, gỡ khoanh vùng con hẻm quận 3', '/tp-hcm-342-nguoi-am-tinh-covid-19-go-khoanh-vung-con-hem-quan-3-20210509113030482.htm', '1620542479114.mp3', 2.02105e16, 1, '2021-05-09 13:41:19');
INSERT INTO `paper` VALUES (129, 'Chủ tịch nước Nguyễn Xuân Phúc: TP.HCM phát triển thành hình mẫu thì không thể để Củ Chi lạc hậu', '/chu-tich-nuoc-nguyen-xuan-phuc-tp-hcm-phat-trien-thanh-hinh-mau-thi-khong-the-de-cu-chi-lac-hau-20210509104525152.htm', '1620542480043.mp3', 2.02105e16, 1, '2021-05-09 13:41:21');
INSERT INTO `paper` VALUES (130, 'Chợ Đà Nẵng thưa vắng khách trong ngày đầu thu phiếu đi chợ', '/cho-da-nang-thua-vang-khach-trong-ngay-dau-thu-phieu-di-cho-20210509105025251.htm', '1620542481191.mp3', 2.02105e16, 1, '2021-05-09 13:41:21');

-- ----------------------------
-- Table structure for voice
-- ----------------------------
DROP TABLE IF EXISTS `voice`;
CREATE TABLE `voice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mp3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voice
-- ----------------------------
INSERT INTO `voice` VALUES (1, 'Ban Mai (Nữ miền Bắc)', 'banmai.mp3', 'banmai', 'banmaiEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (2, 'Lê Minh (Nam miền Bắc)', 'leminh.mp3', 'leminh', 'leminhEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (3, 'Thu Minh (Nữ miền Bắc)', 'thuminh.mp3', 'thuminh', 'thuminhEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (4, 'Gia Huy (Nam miền Trung)', 'giahuy.mp3', 'giahuy', 'giahuyEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (5, 'Ngọc Lam (Nữ miền Trung)', 'ngoclam.mp3', 'ngoclam', 'ngoclanEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (6, 'Mỹ An (Nữ miền Trung)', 'myan.mp3', 'myan', 'myanEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (7, 'Lan Nhi (Nữ miền Nam)', 'lannhi.mp3', 'lannhi', 'lannhiEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (8, 'Linh San (Nữ miền Nam)', 'linhsan.mp3', 'linhsan', 'linhsanEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (9, 'Minh Quang (Nam miền Nam)', 'minhquang.mp3', 'minhquang', 'minhquangEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 0, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (10, 'Nữ miền nam', 'numiennam.mp3', '1', 'numiennamEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 1, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (11, 'Nữ miền bắc', 'numienbac.mp3', '2', 'numienbacEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 1, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (12, 'Nam miền nam', 'nammiennam.mp3', '3', 'nammiennamEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 1, '2021-04-13 08:58:17');
INSERT INTO `voice` VALUES (13, 'Nam miền bắc', 'nammienbac.mp3', '4', 'nammienbacEmYSqp9Uq5TrOqJKVUoVzWwamWtSIVxL', 1, '2021-04-13 08:58:17');

SET FOREIGN_KEY_CHECKS = 1;

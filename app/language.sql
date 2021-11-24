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

 Date: 10/05/2021 21:06:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

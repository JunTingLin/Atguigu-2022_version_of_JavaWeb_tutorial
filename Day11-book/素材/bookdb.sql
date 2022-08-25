/*
 Navicat Premium Data Transfer

 Source Server         : Local_db_root
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : bookdb

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 25/08/2022 16:32:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookImg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `saleCount` int(11) NULL DEFAULT NULL,
  `bookCount` int(11) NULL DEFAULT NULL,
  `bookStatus` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES (1, 'cyuyanrumenjingdian.jpg', 'C语言入门经典', 99.00, '亚历山大', 8, 197, 0);
INSERT INTO `t_book` VALUES (2, 'santi.jpg', '三体', 48.95, '周杰伦', 18, 892, 0);
INSERT INTO `t_book` VALUES (3, 'ailuntulingzhuan.jpg', '艾伦图灵传', 50.00, '刘若英', 12, 143, 0);
INSERT INTO `t_book` VALUES (4, 'bainiangudu.jpg', '百年孤独', 40.00, '王力宏', 3, 98, 0);
INSERT INTO `t_book` VALUES (5, 'biancheng.jpg', '边城', 30.00, '刘德华', 2, 99, 0);
INSERT INTO `t_book` VALUES (6, 'jieyouzahuodian.jpg', '解忧杂货店', 27.00, '东野圭吾', 5, 100, 0);
INSERT INTO `t_book` VALUES (7, 'zhongguozhexueshi.jpg', '中国哲学史', 45.00, '冯友兰', 3, 100, 0);
INSERT INTO `t_book` VALUES (8, 'huranqiri.jpg', '忽然七日', 19.00, '劳伦', 50, 200, 0);
INSERT INTO `t_book` VALUES (9, 'sudongpozhuan.jpg', '苏东坡传', 20.00, '林语堂', 50, 300, 0);
INSERT INTO `t_book` VALUES (10, 'fusang.jpg', '扶桑', 20.00, '严歌岑', 10, 89, 0);
INSERT INTO `t_book` VALUES (11, 'geihaizideshi.jpg', '给孩子的诗', 23.00, '北岛', 5, 99, 0);

-- ----------------------------
-- Table structure for t_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `t_cart_item`;
CREATE TABLE `t_cart_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book` int(11) NULL DEFAULT NULL,
  `buyCount` int(11) NULL DEFAULT NULL,
  `userBean` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_cart_book`(`book`) USING BTREE,
  INDEX `FK_cart_user`(`userBean`) USING BTREE,
  CONSTRAINT `FK_cart_book` FOREIGN KEY (`book`) REFERENCES `t_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_cart_user` FOREIGN KEY (`userBean`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cart_item
-- ----------------------------
INSERT INTO `t_cart_item` VALUES (9, 1, 1, 2);
INSERT INTO `t_cart_item` VALUES (10, 5, 1, 1);
INSERT INTO `t_cart_item` VALUES (11, 1, 2, 1);
INSERT INTO `t_cart_item` VALUES (12, 2, 13, 1);
INSERT INTO `t_cart_item` VALUES (13, 3, 2, 1);
INSERT INTO `t_cart_item` VALUES (14, 4, 1, 1);
INSERT INTO `t_cart_item` VALUES (15, 6, 1, 1);
INSERT INTO `t_cart_item` VALUES (16, 7, 1, 1);
INSERT INTO `t_cart_item` VALUES (17, 8, 1, 1);
INSERT INTO `t_cart_item` VALUES (18, 9, 1, 1);
INSERT INTO `t_cart_item` VALUES (19, 10, 1, 1);
INSERT INTO `t_cart_item` VALUES (20, 11, 4, 1);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderDate` datetime NULL DEFAULT NULL,
  `orderUser` int(11) NULL DEFAULT NULL,
  `orderMoney` double(10, 2) NULL DEFAULT NULL,
  `orderStatus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderNo`(`orderNo`) USING BTREE,
  INDEX `FK_order_user`(`orderUser`) USING BTREE,
  CONSTRAINT `FK_order_user` FOREIGN KEY (`orderUser`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (4, '5eaab6146dc54e0482fdb8b6120c229b_20211025112519', '2021-10-25 11:25:20', 1, 506.90, 0);
INSERT INTO `t_order` VALUES (5, 'f5a22aac925d42eabc6b49c45a3eb74f_20211025113004', '2021-10-25 11:30:04', 1, 48.95, 0);
INSERT INTO `t_order` VALUES (7, 'b521cd49ab2943f0bbc0630c95978f1c_20211025113039', '2021-10-25 11:30:40', 1, 48.95, 0);
INSERT INTO `t_order` VALUES (8, 'd4f366a82cd4491c9899b181753804b4_20211025113151', '2021-10-25 11:31:52', 1, 48.95, 0);
INSERT INTO `t_order` VALUES (9, '8f5869a839f4483e947bd2c3163f3c23_20211025113159', '2021-10-25 11:31:59', 1, 48.95, 0);
INSERT INTO `t_order` VALUES (10, 'c5fcd95dbe7f49669f96b4ad6444ae6b_20211025120531', '2021-10-25 12:05:32', 1, 147.95, 0);
INSERT INTO `t_order` VALUES (11, '6240ec3e5ac04e3583e1beb75a9e94ec_20211025120542', '2021-10-25 12:05:42', 1, 147.95, 0);

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book` int(11) NULL DEFAULT NULL,
  `buyCount` int(11) NULL DEFAULT NULL,
  `orderBean` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_detail_book`(`book`) USING BTREE,
  INDEX `FK_detail_order`(`orderBean`) USING BTREE,
  CONSTRAINT `FK_detail_book` FOREIGN KEY (`book`) REFERENCES `t_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_detail_order` FOREIGN KEY (`orderBean`) REFERENCES `t_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
INSERT INTO `t_order_item` VALUES (6, 1, 1, 4);
INSERT INTO `t_order_item` VALUES (7, 2, 2, 4);
INSERT INTO `t_order_item` VALUES (8, 10, 1, 4);
INSERT INTO `t_order_item` VALUES (9, 3, 5, 4);
INSERT INTO `t_order_item` VALUES (10, 4, 1, 4);
INSERT INTO `t_order_item` VALUES (11, 2, 1, 5);
INSERT INTO `t_order_item` VALUES (12, 2, 1, 7);
INSERT INTO `t_order_item` VALUES (13, 2, 1, 8);
INSERT INTO `t_order_item` VALUES (14, 2, 1, 9);
INSERT INTO `t_order_item` VALUES (15, 1, 1, 10);
INSERT INTO `t_order_item` VALUES (16, 2, 1, 10);
INSERT INTO `t_order_item` VALUES (17, 1, 1, 11);
INSERT INTO `t_order_item` VALUES (18, 2, 1, 11);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'lina', 'ok', 'lina@sina.com.cn', 0);
INSERT INTO `t_user` VALUES (2, 'kate', 'ok', 'hello_kate@126.com', 1);
INSERT INTO `t_user` VALUES (3, '鸠摩智', 'ok', 'jiujiu@126.com', 0);
INSERT INTO `t_user` VALUES (4, '宝2021', 'ok', 'bao2021@sohu.com.cn', 0);
INSERT INTO `t_user` VALUES (5, '宝2022', '123', 'bao2022@sohu.com.cn', 0);

SET FOREIGN_KEY_CHECKS = 1;

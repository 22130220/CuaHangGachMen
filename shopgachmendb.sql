/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 110302 (11.3.2-MariaDB)
 Source Host           : localhost:3307
 Source Schema         : shopgachmendb

 Target Server Type    : MariaDB
 Target Server Version : 110302 (11.3.2-MariaDB)
 File Encoding         : 65001

 Date: 18/12/2024 01:21:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Status` bit(1) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `ID` int(11) NOT NULL,
  `Fullname` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `SendDate` datetime NULL DEFAULT NULL,
  `IsReply` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES (1, 'MAXTOT');
INSERT INTO `manufacturer` VALUES (2, 'BAMBU');
INSERT INTO `manufacturer` VALUES (3, 'FAMITO');
INSERT INTO `manufacturer` VALUES (4, 'IVICASA');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NULL DEFAULT NULL,
  `Price` decimal(18, 2) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`, `ProductID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NULL DEFAULT NULL,
  `OrderDate` datetime NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Status` enum('Delivered','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `TotalPrice` decimal(18, 2) NULL DEFAULT NULL,
  `Des` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product_color_img
-- ----------------------------
DROP TABLE IF EXISTS `product_color_img`;
CREATE TABLE `product_color_img`  (
  `ProductID` int(11) NOT NULL,
  `ColorID` int(11) NOT NULL,
  `Url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`, `ColorID`) USING BTREE,
  INDEX `ColorID`(`ColorID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_color_img
-- ----------------------------

-- ----------------------------
-- Table structure for product_spec
-- ----------------------------
DROP TABLE IF EXISTS `product_spec`;
CREATE TABLE `product_spec`  (
  `ProductID` int(11) NOT NULL,
  `SpecID` int(11) NOT NULL,
  `Value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`, `SpecID`) USING BTREE,
  INDEX `SpecID`(`SpecID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_spec
-- ----------------------------
INSERT INTO `product_spec` VALUES (1, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (1, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (1, 3, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (1, 4, 'Nhám');
INSERT INTO `product_spec` VALUES (1, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (1, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (2, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (2, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (2, 3, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (2, 4, 'Nhám');
INSERT INTO `product_spec` VALUES (2, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (2, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (3, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (3, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (3, 3, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (3, 4, 'Nhám');
INSERT INTO `product_spec` VALUES (3, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (3, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (4, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (4, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (4, 3, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (4, 4, 'Nhám');
INSERT INTO `product_spec` VALUES (4, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (4, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (5, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (5, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (5, 3, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (5, 4, 'Nhám');
INSERT INTO `product_spec` VALUES (5, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (5, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (6, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (6, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (6, 3, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (6, 4, 'MAXTOT');
INSERT INTO `product_spec` VALUES (6, 5, 'Nhám');
INSERT INTO `product_spec` VALUES (6, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (7, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (7, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (7, 3, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (7, 4, 'Nhám');
INSERT INTO `product_spec` VALUES (7, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (7, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (8, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (8, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (8, 3, 'Nhám');
INSERT INTO `product_spec` VALUES (8, 4, 'Men Sugar mịn');
INSERT INTO `product_spec` VALUES (8, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (8, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (9, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (9, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (9, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (9, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (9, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (9, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (10, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (10, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (10, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (10, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (10, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (10, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (11, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (11, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (11, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (11, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (11, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (11, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (12, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (12, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (12, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (12, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (12, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (12, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (13, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (13, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (13, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (13, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (13, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (13, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (14, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (14, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (14, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (14, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (14, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (14, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (15, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (15, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (15, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (15, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (15, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (15, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (16, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (16, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (16, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (16, 4, 'MAXTOT');
INSERT INTO `product_spec` VALUES (16, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (16, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (17, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (17, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (17, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (17, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (17, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (17, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (18, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (18, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (18, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (18, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (18, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (18, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (19, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (19, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (19, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (19, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (19, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (19, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (20, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (20, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (20, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (20, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (20, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (20, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (21, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (21, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (21, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (21, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (21, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (21, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (22, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (22, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (22, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (22, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (22, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (22, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (23, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (23, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (23, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (23, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (23, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (23, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (24, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (24, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (24, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (24, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (24, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (24, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (25, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (25, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (25, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (25, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (25, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (25, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (26, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (26, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (26, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (26, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (26, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (26, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (27, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (27, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (27, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (27, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (27, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (27, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (28, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (28, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (28, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (28, 4, 'MAXTOT');
INSERT INTO `product_spec` VALUES (28, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (28, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (29, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (29, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (29, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (29, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (29, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (29, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (30, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (30, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (30, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (30, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (30, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (30, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (31, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (31, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (31, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (31, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (31, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (31, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (32, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (32, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (32, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (32, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (32, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (32, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (33, 1, '400×800 mm');
INSERT INTO `product_spec` VALUES (33, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (33, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (33, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (33, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (33, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (34, 1, '400×800 mm');
INSERT INTO `product_spec` VALUES (34, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (34, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (34, 4, 'MAXTOT');
INSERT INTO `product_spec` VALUES (34, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (34, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (35, 1, '400×800 mm');
INSERT INTO `product_spec` VALUES (35, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (35, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (35, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (35, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (35, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (36, 1, '400×800 mm');
INSERT INTO `product_spec` VALUES (36, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (36, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (36, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (36, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (36, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (37, 1, '400×800 mm');
INSERT INTO `product_spec` VALUES (37, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (37, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (37, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (37, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (37, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (38, 1, '400×800 mm');
INSERT INTO `product_spec` VALUES (38, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (38, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (38, 4, 'Bóng');
INSERT INTO `product_spec` VALUES (38, 5, 'MAXTOT');
INSERT INTO `product_spec` VALUES (38, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (39, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (39, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (39, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (39, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (39, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (39, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (40, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (40, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (40, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (40, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (40, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (40, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (41, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (41, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (41, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (41, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (41, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (41, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (42, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (42, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (42, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (42, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (42, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (42, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (43, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (43, 2, 'Ceramic');
INSERT INTO `product_spec` VALUES (43, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (43, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (43, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (43, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (44, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (44, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (44, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (44, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (44, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (44, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (45, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (45, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (45, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (45, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (45, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (45, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (46, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (46, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (46, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (46, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (46, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (46, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (47, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (47, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (47, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (47, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (47, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (47, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (48, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (48, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (48, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (48, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (48, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (48, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (49, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (49, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (49, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (49, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (49, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (49, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (50, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (50, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (50, 3, 'Men bóng');
INSERT INTO `product_spec` VALUES (50, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (50, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (50, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (51, 3, '600×600 mm');
INSERT INTO `product_spec` VALUES (51, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (51, 1, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (51, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (51, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (51, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (52, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (52, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (52, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (52, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (52, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (52, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (53, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (53, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (53, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (53, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (53, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (53, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (54, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (54, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (54, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (54, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (54, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (54, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (55, 1, '600×600 mm');
INSERT INTO `product_spec` VALUES (55, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (55, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (55, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (55, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (55, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (56, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (56, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (56, 3, 'Mài bóng');
INSERT INTO `product_spec` VALUES (56, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (56, 5, 'Bóng');
INSERT INTO `product_spec` VALUES (56, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (57, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (57, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (57, 3, 'Mài bóng');
INSERT INTO `product_spec` VALUES (57, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (57, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (57, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (58, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (58, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (58, 3, 'Mài bóng');
INSERT INTO `product_spec` VALUES (58, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (58, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (58, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (59, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (59, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (59, 3, 'Mài bóng');
INSERT INTO `product_spec` VALUES (59, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (59, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (59, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (60, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (60, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (60, 3, 'Mài bóng');
INSERT INTO `product_spec` VALUES (60, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (60, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (60, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (61, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (61, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (61, 3, 'Mài bóng');
INSERT INTO `product_spec` VALUES (61, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (61, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (61, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (62, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (62, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (62, 3, 'Mài bóng');
INSERT INTO `product_spec` VALUES (62, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (62, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (62, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (63, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (63, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (63, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (63, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (63, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (63, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (64, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (64, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (64, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (64, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (64, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (64, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (65, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (65, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (65, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (65, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (65, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (65, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (66, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (66, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (66, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (66, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (66, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (66, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (67, 1, '800×800 mm');
INSERT INTO `product_spec` VALUES (67, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (67, 3, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (67, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (67, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (67, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (68, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (68, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (68, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (68, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (68, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (68, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (69, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (69, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (69, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (69, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (69, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (69, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (70, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (70, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (70, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (70, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (70, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (70, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (71, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (71, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (71, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (71, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (71, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (71, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (72, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (72, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (72, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (72, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (72, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (72, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (73, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (73, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (73, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (73, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (73, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (73, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (74, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (74, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (74, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (74, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (74, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (74, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (75, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (75, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (75, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (75, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (75, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (75, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (76, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (76, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (76, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (76, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (76, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (76, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (77, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (77, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (77, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (77, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (77, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (77, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (78, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (78, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (78, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (78, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (78, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (78, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (79, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (79, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (79, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (79, 4, 'BAMBU');
INSERT INTO `product_spec` VALUES (79, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (79, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (80, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (80, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (80, 3, 'Sugar');
INSERT INTO `product_spec` VALUES (80, 4, 'FAMITO');
INSERT INTO `product_spec` VALUES (80, 5, 'Nhám');
INSERT INTO `product_spec` VALUES (80, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (81, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (81, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (81, 3, 'Sugar');
INSERT INTO `product_spec` VALUES (81, 4, 'FAMITO');
INSERT INTO `product_spec` VALUES (81, 5, 'Nhám');
INSERT INTO `product_spec` VALUES (81, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (82, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (82, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (82, 3, 'Sugar');
INSERT INTO `product_spec` VALUES (82, 4, 'FAMITO');
INSERT INTO `product_spec` VALUES (82, 5, 'Nhám');
INSERT INTO `product_spec` VALUES (82, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (83, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (83, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (83, 3, 'Sugar');
INSERT INTO `product_spec` VALUES (83, 4, 'FAMITO');
INSERT INTO `product_spec` VALUES (83, 5, 'Nhám');
INSERT INTO `product_spec` VALUES (83, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (84, 1, '500×500 mm');
INSERT INTO `product_spec` VALUES (84, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (84, 3, 'Sugar');
INSERT INTO `product_spec` VALUES (84, 4, 'FAMITO');
INSERT INTO `product_spec` VALUES (84, 5, 'Nhám');
INSERT INTO `product_spec` VALUES (84, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (85, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (85, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (85, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (85, 4, 'IVICASA');
INSERT INTO `product_spec` VALUES (85, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (85, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (86, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (86, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (86, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (86, 4, 'IVICASA');
INSERT INTO `product_spec` VALUES (86, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (86, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (87, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (87, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (87, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (87, 4, 'IVICASA');
INSERT INTO `product_spec` VALUES (87, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (87, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (88, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (88, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (88, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (88, 4, 'IVICASA');
INSERT INTO `product_spec` VALUES (88, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (88, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (89, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (89, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (89, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (89, 4, 'IVICASA');
INSERT INTO `product_spec` VALUES (89, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (89, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (90, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (90, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (90, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (90, 4, 'IVICASA');
INSERT INTO `product_spec` VALUES (90, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (90, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (91, 1, '300×600 mm');
INSERT INTO `product_spec` VALUES (91, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (91, 3, 'Glossy');
INSERT INTO `product_spec` VALUES (91, 4, 'IVICASA');
INSERT INTO `product_spec` VALUES (91, 5, 'Mài bóng');
INSERT INTO `product_spec` VALUES (91, 6, 'Việt Nam');
INSERT INTO `product_spec` VALUES (92, 1, NULL);
INSERT INTO `product_spec` VALUES (92, 2, NULL);
INSERT INTO `product_spec` VALUES (92, 3, NULL);
INSERT INTO `product_spec` VALUES (92, 4, NULL);
INSERT INTO `product_spec` VALUES (92, 5, NULL);
INSERT INTO `product_spec` VALUES (92, 6, NULL);
INSERT INTO `product_spec` VALUES (93, 1, NULL);
INSERT INTO `product_spec` VALUES (93, 2, NULL);
INSERT INTO `product_spec` VALUES (93, 3, NULL);
INSERT INTO `product_spec` VALUES (93, 4, NULL);
INSERT INTO `product_spec` VALUES (93, 5, NULL);
INSERT INTO `product_spec` VALUES (93, 6, NULL);
INSERT INTO `product_spec` VALUES (94, 1, NULL);
INSERT INTO `product_spec` VALUES (94, 2, NULL);
INSERT INTO `product_spec` VALUES (94, 3, NULL);
INSERT INTO `product_spec` VALUES (94, 4, NULL);
INSERT INTO `product_spec` VALUES (94, 5, NULL);
INSERT INTO `product_spec` VALUES (94, 6, NULL);
INSERT INTO `product_spec` VALUES (95, 1, NULL);
INSERT INTO `product_spec` VALUES (95, 2, NULL);
INSERT INTO `product_spec` VALUES (95, 3, NULL);
INSERT INTO `product_spec` VALUES (95, 4, NULL);
INSERT INTO `product_spec` VALUES (95, 5, NULL);
INSERT INTO `product_spec` VALUES (95, 6, NULL);
INSERT INTO `product_spec` VALUES (96, 1, NULL);
INSERT INTO `product_spec` VALUES (96, 2, NULL);
INSERT INTO `product_spec` VALUES (96, 3, NULL);
INSERT INTO `product_spec` VALUES (96, 4, NULL);
INSERT INTO `product_spec` VALUES (96, 5, NULL);
INSERT INTO `product_spec` VALUES (96, 6, NULL);
INSERT INTO `product_spec` VALUES (97, 1, NULL);
INSERT INTO `product_spec` VALUES (97, 2, NULL);
INSERT INTO `product_spec` VALUES (97, 3, NULL);
INSERT INTO `product_spec` VALUES (97, 4, NULL);
INSERT INTO `product_spec` VALUES (97, 5, NULL);
INSERT INTO `product_spec` VALUES (97, 6, NULL);
INSERT INTO `product_spec` VALUES (98, 1, NULL);
INSERT INTO `product_spec` VALUES (98, 2, NULL);
INSERT INTO `product_spec` VALUES (98, 3, NULL);
INSERT INTO `product_spec` VALUES (98, 4, NULL);
INSERT INTO `product_spec` VALUES (98, 5, NULL);
INSERT INTO `product_spec` VALUES (98, 6, NULL);
INSERT INTO `product_spec` VALUES (99, 1, NULL);
INSERT INTO `product_spec` VALUES (99, 2, NULL);
INSERT INTO `product_spec` VALUES (99, 3, NULL);
INSERT INTO `product_spec` VALUES (99, 4, NULL);
INSERT INTO `product_spec` VALUES (99, 5, NULL);
INSERT INTO `product_spec` VALUES (99, 6, NULL);
INSERT INTO `product_spec` VALUES (100, 1, NULL);
INSERT INTO `product_spec` VALUES (100, 2, NULL);
INSERT INTO `product_spec` VALUES (100, 3, NULL);
INSERT INTO `product_spec` VALUES (100, 4, NULL);
INSERT INTO `product_spec` VALUES (100, 5, NULL);
INSERT INTO `product_spec` VALUES (100, 6, NULL);
INSERT INTO `product_spec` VALUES (101, 1, NULL);
INSERT INTO `product_spec` VALUES (101, 2, NULL);
INSERT INTO `product_spec` VALUES (101, 3, NULL);
INSERT INTO `product_spec` VALUES (101, 4, NULL);
INSERT INTO `product_spec` VALUES (101, 5, NULL);
INSERT INTO `product_spec` VALUES (101, 6, NULL);
INSERT INTO `product_spec` VALUES (102, 1, NULL);
INSERT INTO `product_spec` VALUES (102, 2, NULL);
INSERT INTO `product_spec` VALUES (102, 3, NULL);
INSERT INTO `product_spec` VALUES (102, 4, NULL);
INSERT INTO `product_spec` VALUES (102, 5, NULL);
INSERT INTO `product_spec` VALUES (102, 6, NULL);
INSERT INTO `product_spec` VALUES (103, 1, NULL);
INSERT INTO `product_spec` VALUES (103, 2, NULL);
INSERT INTO `product_spec` VALUES (103, 3, NULL);
INSERT INTO `product_spec` VALUES (103, 4, NULL);
INSERT INTO `product_spec` VALUES (103, 5, NULL);
INSERT INTO `product_spec` VALUES (103, 6, NULL);
INSERT INTO `product_spec` VALUES (104, 1, NULL);
INSERT INTO `product_spec` VALUES (104, 2, NULL);
INSERT INTO `product_spec` VALUES (104, 3, NULL);
INSERT INTO `product_spec` VALUES (104, 4, NULL);
INSERT INTO `product_spec` VALUES (104, 5, NULL);
INSERT INTO `product_spec` VALUES (104, 6, NULL);
INSERT INTO `product_spec` VALUES (105, 1, NULL);
INSERT INTO `product_spec` VALUES (105, 2, NULL);
INSERT INTO `product_spec` VALUES (105, 3, NULL);
INSERT INTO `product_spec` VALUES (105, 4, NULL);
INSERT INTO `product_spec` VALUES (105, 5, NULL);
INSERT INTO `product_spec` VALUES (105, 6, NULL);
INSERT INTO `product_spec` VALUES (106, 1, NULL);
INSERT INTO `product_spec` VALUES (106, 2, NULL);
INSERT INTO `product_spec` VALUES (106, 3, NULL);
INSERT INTO `product_spec` VALUES (106, 4, NULL);
INSERT INTO `product_spec` VALUES (106, 5, NULL);
INSERT INTO `product_spec` VALUES (106, 6, NULL);
INSERT INTO `product_spec` VALUES (107, 1, NULL);
INSERT INTO `product_spec` VALUES (107, 2, NULL);
INSERT INTO `product_spec` VALUES (107, 3, NULL);
INSERT INTO `product_spec` VALUES (107, 4, NULL);
INSERT INTO `product_spec` VALUES (107, 5, NULL);
INSERT INTO `product_spec` VALUES (107, 6, NULL);
INSERT INTO `product_spec` VALUES (108, 1, NULL);
INSERT INTO `product_spec` VALUES (108, 2, NULL);
INSERT INTO `product_spec` VALUES (108, 3, NULL);
INSERT INTO `product_spec` VALUES (108, 4, NULL);
INSERT INTO `product_spec` VALUES (108, 5, NULL);
INSERT INTO `product_spec` VALUES (108, 6, NULL);
INSERT INTO `product_spec` VALUES (109, 1, NULL);
INSERT INTO `product_spec` VALUES (109, 2, NULL);
INSERT INTO `product_spec` VALUES (109, 3, NULL);
INSERT INTO `product_spec` VALUES (109, 4, NULL);
INSERT INTO `product_spec` VALUES (109, 5, NULL);
INSERT INTO `product_spec` VALUES (109, 6, NULL);
INSERT INTO `product_spec` VALUES (110, 1, NULL);
INSERT INTO `product_spec` VALUES (110, 2, NULL);
INSERT INTO `product_spec` VALUES (110, 3, NULL);
INSERT INTO `product_spec` VALUES (110, 4, NULL);
INSERT INTO `product_spec` VALUES (110, 5, NULL);
INSERT INTO `product_spec` VALUES (110, 6, NULL);
INSERT INTO `product_spec` VALUES (111, 1, NULL);
INSERT INTO `product_spec` VALUES (111, 2, NULL);
INSERT INTO `product_spec` VALUES (111, 3, NULL);
INSERT INTO `product_spec` VALUES (111, 4, NULL);
INSERT INTO `product_spec` VALUES (111, 5, NULL);
INSERT INTO `product_spec` VALUES (111, 6, NULL);
INSERT INTO `product_spec` VALUES (112, 1, NULL);
INSERT INTO `product_spec` VALUES (112, 2, NULL);
INSERT INTO `product_spec` VALUES (112, 3, NULL);
INSERT INTO `product_spec` VALUES (112, 4, NULL);
INSERT INTO `product_spec` VALUES (112, 5, NULL);
INSERT INTO `product_spec` VALUES (112, 6, NULL);
INSERT INTO `product_spec` VALUES (113, 1, NULL);
INSERT INTO `product_spec` VALUES (113, 2, NULL);
INSERT INTO `product_spec` VALUES (113, 3, NULL);
INSERT INTO `product_spec` VALUES (113, 4, NULL);
INSERT INTO `product_spec` VALUES (113, 5, NULL);
INSERT INTO `product_spec` VALUES (113, 6, NULL);
INSERT INTO `product_spec` VALUES (114, 1, NULL);
INSERT INTO `product_spec` VALUES (114, 2, NULL);
INSERT INTO `product_spec` VALUES (114, 3, NULL);
INSERT INTO `product_spec` VALUES (114, 4, NULL);
INSERT INTO `product_spec` VALUES (114, 5, NULL);
INSERT INTO `product_spec` VALUES (114, 6, NULL);
INSERT INTO `product_spec` VALUES (115, 1, NULL);
INSERT INTO `product_spec` VALUES (115, 2, NULL);
INSERT INTO `product_spec` VALUES (115, 3, NULL);
INSERT INTO `product_spec` VALUES (115, 4, NULL);
INSERT INTO `product_spec` VALUES (115, 5, NULL);
INSERT INTO `product_spec` VALUES (115, 6, NULL);
INSERT INTO `product_spec` VALUES (116, 1, NULL);
INSERT INTO `product_spec` VALUES (116, 2, NULL);
INSERT INTO `product_spec` VALUES (116, 3, NULL);
INSERT INTO `product_spec` VALUES (116, 4, NULL);
INSERT INTO `product_spec` VALUES (116, 5, NULL);
INSERT INTO `product_spec` VALUES (116, 6, NULL);
INSERT INTO `product_spec` VALUES (117, 1, NULL);
INSERT INTO `product_spec` VALUES (117, 2, NULL);
INSERT INTO `product_spec` VALUES (117, 3, NULL);
INSERT INTO `product_spec` VALUES (117, 4, NULL);
INSERT INTO `product_spec` VALUES (117, 5, NULL);
INSERT INTO `product_spec` VALUES (117, 6, NULL);
INSERT INTO `product_spec` VALUES (118, 1, NULL);
INSERT INTO `product_spec` VALUES (118, 2, NULL);
INSERT INTO `product_spec` VALUES (118, 3, NULL);
INSERT INTO `product_spec` VALUES (118, 4, NULL);
INSERT INTO `product_spec` VALUES (118, 5, NULL);
INSERT INTO `product_spec` VALUES (118, 6, NULL);
INSERT INTO `product_spec` VALUES (119, 1, NULL);
INSERT INTO `product_spec` VALUES (119, 2, NULL);
INSERT INTO `product_spec` VALUES (119, 3, NULL);
INSERT INTO `product_spec` VALUES (119, 4, NULL);
INSERT INTO `product_spec` VALUES (119, 5, NULL);
INSERT INTO `product_spec` VALUES (119, 6, NULL);
INSERT INTO `product_spec` VALUES (120, 1, NULL);
INSERT INTO `product_spec` VALUES (120, 2, NULL);
INSERT INTO `product_spec` VALUES (120, 3, NULL);
INSERT INTO `product_spec` VALUES (120, 4, NULL);
INSERT INTO `product_spec` VALUES (120, 5, NULL);
INSERT INTO `product_spec` VALUES (120, 6, NULL);
INSERT INTO `product_spec` VALUES (121, 1, NULL);
INSERT INTO `product_spec` VALUES (121, 2, NULL);
INSERT INTO `product_spec` VALUES (121, 3, NULL);
INSERT INTO `product_spec` VALUES (121, 4, NULL);
INSERT INTO `product_spec` VALUES (121, 5, NULL);
INSERT INTO `product_spec` VALUES (121, 6, NULL);
INSERT INTO `product_spec` VALUES (122, 1, NULL);
INSERT INTO `product_spec` VALUES (122, 2, NULL);
INSERT INTO `product_spec` VALUES (122, 3, NULL);
INSERT INTO `product_spec` VALUES (122, 4, NULL);
INSERT INTO `product_spec` VALUES (122, 5, NULL);
INSERT INTO `product_spec` VALUES (122, 6, NULL);
INSERT INTO `product_spec` VALUES (123, 1, NULL);
INSERT INTO `product_spec` VALUES (123, 2, NULL);
INSERT INTO `product_spec` VALUES (123, 3, NULL);
INSERT INTO `product_spec` VALUES (123, 4, NULL);
INSERT INTO `product_spec` VALUES (123, 5, NULL);
INSERT INTO `product_spec` VALUES (123, 6, NULL);
INSERT INTO `product_spec` VALUES (124, 1, NULL);
INSERT INTO `product_spec` VALUES (124, 2, NULL);
INSERT INTO `product_spec` VALUES (124, 3, NULL);
INSERT INTO `product_spec` VALUES (124, 4, NULL);
INSERT INTO `product_spec` VALUES (124, 5, NULL);
INSERT INTO `product_spec` VALUES (124, 6, NULL);
INSERT INTO `product_spec` VALUES (125, 1, NULL);
INSERT INTO `product_spec` VALUES (125, 2, NULL);
INSERT INTO `product_spec` VALUES (125, 3, NULL);
INSERT INTO `product_spec` VALUES (125, 4, NULL);
INSERT INTO `product_spec` VALUES (125, 5, NULL);
INSERT INTO `product_spec` VALUES (125, 6, NULL);
INSERT INTO `product_spec` VALUES (126, 1, NULL);
INSERT INTO `product_spec` VALUES (126, 2, NULL);
INSERT INTO `product_spec` VALUES (126, 3, NULL);
INSERT INTO `product_spec` VALUES (126, 4, NULL);
INSERT INTO `product_spec` VALUES (126, 5, NULL);
INSERT INTO `product_spec` VALUES (126, 6, NULL);
INSERT INTO `product_spec` VALUES (127, 1, NULL);
INSERT INTO `product_spec` VALUES (127, 2, NULL);
INSERT INTO `product_spec` VALUES (127, 3, NULL);
INSERT INTO `product_spec` VALUES (127, 4, NULL);
INSERT INTO `product_spec` VALUES (127, 5, NULL);
INSERT INTO `product_spec` VALUES (127, 6, NULL);
INSERT INTO `product_spec` VALUES (128, 1, NULL);
INSERT INTO `product_spec` VALUES (128, 2, NULL);
INSERT INTO `product_spec` VALUES (128, 3, NULL);
INSERT INTO `product_spec` VALUES (128, 4, NULL);
INSERT INTO `product_spec` VALUES (128, 5, NULL);
INSERT INTO `product_spec` VALUES (128, 6, NULL);
INSERT INTO `product_spec` VALUES (129, 1, NULL);
INSERT INTO `product_spec` VALUES (129, 2, NULL);
INSERT INTO `product_spec` VALUES (129, 3, NULL);
INSERT INTO `product_spec` VALUES (129, 4, NULL);
INSERT INTO `product_spec` VALUES (129, 5, NULL);
INSERT INTO `product_spec` VALUES (129, 6, NULL);
INSERT INTO `product_spec` VALUES (130, 1, NULL);
INSERT INTO `product_spec` VALUES (130, 2, NULL);
INSERT INTO `product_spec` VALUES (130, 3, NULL);
INSERT INTO `product_spec` VALUES (130, 4, NULL);
INSERT INTO `product_spec` VALUES (130, 5, NULL);
INSERT INTO `product_spec` VALUES (130, 6, NULL);
INSERT INTO `product_spec` VALUES (131, 1, NULL);
INSERT INTO `product_spec` VALUES (131, 2, NULL);
INSERT INTO `product_spec` VALUES (131, 3, NULL);
INSERT INTO `product_spec` VALUES (131, 4, NULL);
INSERT INTO `product_spec` VALUES (131, 5, NULL);
INSERT INTO `product_spec` VALUES (131, 6, NULL);
INSERT INTO `product_spec` VALUES (132, 1, NULL);
INSERT INTO `product_spec` VALUES (132, 2, NULL);
INSERT INTO `product_spec` VALUES (132, 3, NULL);
INSERT INTO `product_spec` VALUES (132, 4, NULL);
INSERT INTO `product_spec` VALUES (132, 5, NULL);
INSERT INTO `product_spec` VALUES (132, 6, NULL);
INSERT INTO `product_spec` VALUES (133, 1, NULL);
INSERT INTO `product_spec` VALUES (133, 2, NULL);
INSERT INTO `product_spec` VALUES (133, 3, NULL);
INSERT INTO `product_spec` VALUES (133, 4, NULL);
INSERT INTO `product_spec` VALUES (133, 5, NULL);
INSERT INTO `product_spec` VALUES (133, 6, NULL);
INSERT INTO `product_spec` VALUES (134, 1, NULL);
INSERT INTO `product_spec` VALUES (134, 2, NULL);
INSERT INTO `product_spec` VALUES (134, 3, NULL);
INSERT INTO `product_spec` VALUES (134, 4, NULL);
INSERT INTO `product_spec` VALUES (134, 5, NULL);
INSERT INTO `product_spec` VALUES (134, 6, NULL);
INSERT INTO `product_spec` VALUES (135, 1, NULL);
INSERT INTO `product_spec` VALUES (135, 2, NULL);
INSERT INTO `product_spec` VALUES (135, 3, NULL);
INSERT INTO `product_spec` VALUES (135, 4, NULL);
INSERT INTO `product_spec` VALUES (135, 5, NULL);
INSERT INTO `product_spec` VALUES (135, 6, NULL);
INSERT INTO `product_spec` VALUES (136, 1, NULL);
INSERT INTO `product_spec` VALUES (136, 2, NULL);
INSERT INTO `product_spec` VALUES (136, 3, NULL);
INSERT INTO `product_spec` VALUES (136, 4, NULL);
INSERT INTO `product_spec` VALUES (136, 5, NULL);
INSERT INTO `product_spec` VALUES (136, 6, NULL);
INSERT INTO `product_spec` VALUES (137, 1, NULL);
INSERT INTO `product_spec` VALUES (137, 2, NULL);
INSERT INTO `product_spec` VALUES (137, 3, NULL);
INSERT INTO `product_spec` VALUES (137, 4, NULL);
INSERT INTO `product_spec` VALUES (137, 5, NULL);
INSERT INTO `product_spec` VALUES (137, 6, NULL);
INSERT INTO `product_spec` VALUES (138, 1, NULL);
INSERT INTO `product_spec` VALUES (138, 2, NULL);
INSERT INTO `product_spec` VALUES (138, 3, NULL);
INSERT INTO `product_spec` VALUES (138, 4, NULL);
INSERT INTO `product_spec` VALUES (138, 5, NULL);
INSERT INTO `product_spec` VALUES (138, 6, NULL);
INSERT INTO `product_spec` VALUES (139, 1, NULL);
INSERT INTO `product_spec` VALUES (139, 2, NULL);
INSERT INTO `product_spec` VALUES (139, 3, NULL);
INSERT INTO `product_spec` VALUES (139, 4, NULL);
INSERT INTO `product_spec` VALUES (139, 5, NULL);
INSERT INTO `product_spec` VALUES (139, 6, NULL);
INSERT INTO `product_spec` VALUES (140, 1, NULL);
INSERT INTO `product_spec` VALUES (140, 2, NULL);
INSERT INTO `product_spec` VALUES (140, 3, NULL);
INSERT INTO `product_spec` VALUES (140, 4, NULL);
INSERT INTO `product_spec` VALUES (140, 5, NULL);
INSERT INTO `product_spec` VALUES (140, 6, NULL);
INSERT INTO `product_spec` VALUES (141, 1, NULL);
INSERT INTO `product_spec` VALUES (141, 2, NULL);
INSERT INTO `product_spec` VALUES (141, 3, NULL);
INSERT INTO `product_spec` VALUES (141, 4, NULL);
INSERT INTO `product_spec` VALUES (141, 5, NULL);
INSERT INTO `product_spec` VALUES (141, 6, NULL);
INSERT INTO `product_spec` VALUES (142, 1, NULL);
INSERT INTO `product_spec` VALUES (142, 2, NULL);
INSERT INTO `product_spec` VALUES (142, 3, NULL);
INSERT INTO `product_spec` VALUES (142, 4, NULL);
INSERT INTO `product_spec` VALUES (142, 5, NULL);
INSERT INTO `product_spec` VALUES (142, 6, NULL);
INSERT INTO `product_spec` VALUES (143, 1, NULL);
INSERT INTO `product_spec` VALUES (143, 2, NULL);
INSERT INTO `product_spec` VALUES (143, 3, NULL);
INSERT INTO `product_spec` VALUES (143, 4, NULL);
INSERT INTO `product_spec` VALUES (143, 5, NULL);
INSERT INTO `product_spec` VALUES (143, 6, NULL);
INSERT INTO `product_spec` VALUES (144, 1, NULL);
INSERT INTO `product_spec` VALUES (144, 2, NULL);
INSERT INTO `product_spec` VALUES (144, 3, NULL);
INSERT INTO `product_spec` VALUES (144, 4, NULL);
INSERT INTO `product_spec` VALUES (144, 5, NULL);
INSERT INTO `product_spec` VALUES (144, 6, NULL);
INSERT INTO `product_spec` VALUES (145, 1, NULL);
INSERT INTO `product_spec` VALUES (145, 2, NULL);
INSERT INTO `product_spec` VALUES (145, 3, NULL);
INSERT INTO `product_spec` VALUES (145, 4, NULL);
INSERT INTO `product_spec` VALUES (145, 5, NULL);
INSERT INTO `product_spec` VALUES (145, 6, NULL);
INSERT INTO `product_spec` VALUES (146, 1, NULL);
INSERT INTO `product_spec` VALUES (146, 2, NULL);
INSERT INTO `product_spec` VALUES (146, 3, NULL);
INSERT INTO `product_spec` VALUES (146, 4, NULL);
INSERT INTO `product_spec` VALUES (146, 5, NULL);
INSERT INTO `product_spec` VALUES (146, 6, NULL);
INSERT INTO `product_spec` VALUES (147, 1, NULL);
INSERT INTO `product_spec` VALUES (147, 2, NULL);
INSERT INTO `product_spec` VALUES (147, 3, NULL);
INSERT INTO `product_spec` VALUES (147, 4, NULL);
INSERT INTO `product_spec` VALUES (147, 5, NULL);
INSERT INTO `product_spec` VALUES (147, 6, NULL);
INSERT INTO `product_spec` VALUES (148, 1, NULL);
INSERT INTO `product_spec` VALUES (148, 2, NULL);
INSERT INTO `product_spec` VALUES (148, 3, NULL);
INSERT INTO `product_spec` VALUES (148, 4, NULL);
INSERT INTO `product_spec` VALUES (148, 5, NULL);
INSERT INTO `product_spec` VALUES (148, 6, NULL);
INSERT INTO `product_spec` VALUES (149, 1, NULL);
INSERT INTO `product_spec` VALUES (149, 2, NULL);
INSERT INTO `product_spec` VALUES (149, 3, NULL);
INSERT INTO `product_spec` VALUES (149, 4, NULL);
INSERT INTO `product_spec` VALUES (149, 5, NULL);
INSERT INTO `product_spec` VALUES (149, 6, NULL);
INSERT INTO `product_spec` VALUES (150, 1, NULL);
INSERT INTO `product_spec` VALUES (150, 2, NULL);
INSERT INTO `product_spec` VALUES (150, 3, NULL);
INSERT INTO `product_spec` VALUES (150, 4, NULL);
INSERT INTO `product_spec` VALUES (150, 5, NULL);
INSERT INTO `product_spec` VALUES (150, 6, NULL);
INSERT INTO `product_spec` VALUES (151, 1, NULL);
INSERT INTO `product_spec` VALUES (151, 2, NULL);
INSERT INTO `product_spec` VALUES (151, 3, NULL);
INSERT INTO `product_spec` VALUES (151, 4, NULL);
INSERT INTO `product_spec` VALUES (151, 5, NULL);
INSERT INTO `product_spec` VALUES (151, 6, NULL);
INSERT INTO `product_spec` VALUES (152, 1, NULL);
INSERT INTO `product_spec` VALUES (152, 2, NULL);
INSERT INTO `product_spec` VALUES (152, 3, NULL);
INSERT INTO `product_spec` VALUES (152, 4, NULL);
INSERT INTO `product_spec` VALUES (152, 5, NULL);
INSERT INTO `product_spec` VALUES (152, 6, NULL);
INSERT INTO `product_spec` VALUES (153, 1, NULL);
INSERT INTO `product_spec` VALUES (153, 2, NULL);
INSERT INTO `product_spec` VALUES (153, 3, NULL);
INSERT INTO `product_spec` VALUES (153, 4, NULL);
INSERT INTO `product_spec` VALUES (153, 5, NULL);
INSERT INTO `product_spec` VALUES (153, 6, NULL);
INSERT INTO `product_spec` VALUES (154, 1, NULL);
INSERT INTO `product_spec` VALUES (154, 2, NULL);
INSERT INTO `product_spec` VALUES (154, 3, NULL);
INSERT INTO `product_spec` VALUES (154, 4, NULL);
INSERT INTO `product_spec` VALUES (154, 5, NULL);
INSERT INTO `product_spec` VALUES (154, 6, NULL);
INSERT INTO `product_spec` VALUES (155, 1, NULL);
INSERT INTO `product_spec` VALUES (155, 2, NULL);
INSERT INTO `product_spec` VALUES (155, 3, NULL);
INSERT INTO `product_spec` VALUES (155, 4, NULL);
INSERT INTO `product_spec` VALUES (155, 5, NULL);
INSERT INTO `product_spec` VALUES (155, 6, NULL);
INSERT INTO `product_spec` VALUES (156, 1, NULL);
INSERT INTO `product_spec` VALUES (156, 2, NULL);
INSERT INTO `product_spec` VALUES (156, 3, NULL);
INSERT INTO `product_spec` VALUES (156, 4, NULL);
INSERT INTO `product_spec` VALUES (156, 5, NULL);
INSERT INTO `product_spec` VALUES (156, 6, NULL);
INSERT INTO `product_spec` VALUES (157, 1, NULL);
INSERT INTO `product_spec` VALUES (157, 2, NULL);
INSERT INTO `product_spec` VALUES (157, 3, NULL);
INSERT INTO `product_spec` VALUES (157, 4, NULL);
INSERT INTO `product_spec` VALUES (157, 5, NULL);
INSERT INTO `product_spec` VALUES (157, 6, NULL);
INSERT INTO `product_spec` VALUES (158, 1, NULL);
INSERT INTO `product_spec` VALUES (158, 2, NULL);
INSERT INTO `product_spec` VALUES (158, 3, NULL);
INSERT INTO `product_spec` VALUES (158, 4, NULL);
INSERT INTO `product_spec` VALUES (158, 5, NULL);
INSERT INTO `product_spec` VALUES (158, 6, NULL);
INSERT INTO `product_spec` VALUES (159, 1, NULL);
INSERT INTO `product_spec` VALUES (159, 2, NULL);
INSERT INTO `product_spec` VALUES (159, 3, NULL);
INSERT INTO `product_spec` VALUES (159, 4, NULL);
INSERT INTO `product_spec` VALUES (159, 5, NULL);
INSERT INTO `product_spec` VALUES (159, 6, NULL);
INSERT INTO `product_spec` VALUES (160, 1, NULL);
INSERT INTO `product_spec` VALUES (160, 2, NULL);
INSERT INTO `product_spec` VALUES (160, 3, NULL);
INSERT INTO `product_spec` VALUES (160, 4, NULL);
INSERT INTO `product_spec` VALUES (160, 5, NULL);
INSERT INTO `product_spec` VALUES (160, 6, NULL);
INSERT INTO `product_spec` VALUES (161, 1, NULL);
INSERT INTO `product_spec` VALUES (161, 2, NULL);
INSERT INTO `product_spec` VALUES (161, 3, NULL);
INSERT INTO `product_spec` VALUES (161, 4, NULL);
INSERT INTO `product_spec` VALUES (161, 5, NULL);
INSERT INTO `product_spec` VALUES (161, 6, NULL);
INSERT INTO `product_spec` VALUES (162, 1, NULL);
INSERT INTO `product_spec` VALUES (162, 2, NULL);
INSERT INTO `product_spec` VALUES (162, 3, NULL);
INSERT INTO `product_spec` VALUES (162, 4, NULL);
INSERT INTO `product_spec` VALUES (162, 5, NULL);
INSERT INTO `product_spec` VALUES (162, 6, NULL);
INSERT INTO `product_spec` VALUES (163, 1, NULL);
INSERT INTO `product_spec` VALUES (163, 2, NULL);
INSERT INTO `product_spec` VALUES (163, 3, NULL);
INSERT INTO `product_spec` VALUES (163, 4, NULL);
INSERT INTO `product_spec` VALUES (163, 5, NULL);
INSERT INTO `product_spec` VALUES (163, 6, NULL);
INSERT INTO `product_spec` VALUES (164, 1, NULL);
INSERT INTO `product_spec` VALUES (164, 2, NULL);
INSERT INTO `product_spec` VALUES (164, 3, NULL);
INSERT INTO `product_spec` VALUES (164, 4, NULL);
INSERT INTO `product_spec` VALUES (164, 5, NULL);
INSERT INTO `product_spec` VALUES (164, 6, NULL);
INSERT INTO `product_spec` VALUES (165, 1, NULL);
INSERT INTO `product_spec` VALUES (165, 2, NULL);
INSERT INTO `product_spec` VALUES (165, 3, NULL);
INSERT INTO `product_spec` VALUES (165, 4, NULL);
INSERT INTO `product_spec` VALUES (165, 5, NULL);
INSERT INTO `product_spec` VALUES (165, 6, NULL);
INSERT INTO `product_spec` VALUES (166, 1, NULL);
INSERT INTO `product_spec` VALUES (166, 2, NULL);
INSERT INTO `product_spec` VALUES (166, 3, NULL);
INSERT INTO `product_spec` VALUES (166, 4, NULL);
INSERT INTO `product_spec` VALUES (166, 5, NULL);
INSERT INTO `product_spec` VALUES (166, 6, NULL);
INSERT INTO `product_spec` VALUES (167, 5, NULL);
INSERT INTO `product_spec` VALUES (167, 6, NULL);
INSERT INTO `product_spec` VALUES (168, 1, NULL);
INSERT INTO `product_spec` VALUES (168, 2, NULL);
INSERT INTO `product_spec` VALUES (168, 3, NULL);
INSERT INTO `product_spec` VALUES (168, 4, NULL);
INSERT INTO `product_spec` VALUES (168, 5, NULL);
INSERT INTO `product_spec` VALUES (168, 6, NULL);
INSERT INTO `product_spec` VALUES (169, 1, NULL);
INSERT INTO `product_spec` VALUES (169, 2, NULL);
INSERT INTO `product_spec` VALUES (169, 3, NULL);
INSERT INTO `product_spec` VALUES (169, 4, NULL);
INSERT INTO `product_spec` VALUES (169, 5, NULL);
INSERT INTO `product_spec` VALUES (169, 6, NULL);
INSERT INTO `product_spec` VALUES (170, 1, NULL);
INSERT INTO `product_spec` VALUES (170, 2, NULL);
INSERT INTO `product_spec` VALUES (170, 3, NULL);
INSERT INTO `product_spec` VALUES (170, 4, NULL);
INSERT INTO `product_spec` VALUES (170, 5, NULL);
INSERT INTO `product_spec` VALUES (170, 6, NULL);
INSERT INTO `product_spec` VALUES (171, 1, NULL);
INSERT INTO `product_spec` VALUES (171, 2, NULL);
INSERT INTO `product_spec` VALUES (171, 3, NULL);
INSERT INTO `product_spec` VALUES (171, 4, NULL);
INSERT INTO `product_spec` VALUES (171, 5, NULL);
INSERT INTO `product_spec` VALUES (171, 6, NULL);
INSERT INTO `product_spec` VALUES (172, 1, NULL);
INSERT INTO `product_spec` VALUES (172, 2, NULL);
INSERT INTO `product_spec` VALUES (172, 3, NULL);
INSERT INTO `product_spec` VALUES (172, 4, NULL);
INSERT INTO `product_spec` VALUES (172, 5, NULL);
INSERT INTO `product_spec` VALUES (172, 6, NULL);
INSERT INTO `product_spec` VALUES (173, 1, NULL);
INSERT INTO `product_spec` VALUES (173, 2, NULL);
INSERT INTO `product_spec` VALUES (173, 3, NULL);
INSERT INTO `product_spec` VALUES (173, 4, NULL);
INSERT INTO `product_spec` VALUES (173, 5, NULL);
INSERT INTO `product_spec` VALUES (173, 6, NULL);
INSERT INTO `product_spec` VALUES (174, 1, NULL);
INSERT INTO `product_spec` VALUES (174, 2, NULL);
INSERT INTO `product_spec` VALUES (174, 3, NULL);
INSERT INTO `product_spec` VALUES (174, 4, NULL);
INSERT INTO `product_spec` VALUES (174, 5, NULL);
INSERT INTO `product_spec` VALUES (174, 6, NULL);
INSERT INTO `product_spec` VALUES (175, 1, NULL);
INSERT INTO `product_spec` VALUES (175, 2, NULL);
INSERT INTO `product_spec` VALUES (175, 3, NULL);
INSERT INTO `product_spec` VALUES (175, 4, NULL);
INSERT INTO `product_spec` VALUES (175, 5, NULL);
INSERT INTO `product_spec` VALUES (175, 6, NULL);
INSERT INTO `product_spec` VALUES (176, 1, NULL);
INSERT INTO `product_spec` VALUES (176, 2, NULL);
INSERT INTO `product_spec` VALUES (176, 3, NULL);
INSERT INTO `product_spec` VALUES (176, 4, NULL);
INSERT INTO `product_spec` VALUES (176, 5, NULL);
INSERT INTO `product_spec` VALUES (176, 6, NULL);
INSERT INTO `product_spec` VALUES (177, 1, NULL);
INSERT INTO `product_spec` VALUES (177, 2, NULL);
INSERT INTO `product_spec` VALUES (177, 3, NULL);
INSERT INTO `product_spec` VALUES (177, 4, NULL);
INSERT INTO `product_spec` VALUES (177, 5, NULL);
INSERT INTO `product_spec` VALUES (177, 6, NULL);
INSERT INTO `product_spec` VALUES (178, 1, NULL);
INSERT INTO `product_spec` VALUES (178, 2, NULL);
INSERT INTO `product_spec` VALUES (178, 3, NULL);
INSERT INTO `product_spec` VALUES (178, 4, NULL);
INSERT INTO `product_spec` VALUES (178, 5, NULL);
INSERT INTO `product_spec` VALUES (178, 6, NULL);
INSERT INTO `product_spec` VALUES (179, 1, NULL);
INSERT INTO `product_spec` VALUES (179, 2, NULL);
INSERT INTO `product_spec` VALUES (179, 3, NULL);
INSERT INTO `product_spec` VALUES (179, 4, NULL);
INSERT INTO `product_spec` VALUES (179, 5, NULL);
INSERT INTO `product_spec` VALUES (179, 6, NULL);
INSERT INTO `product_spec` VALUES (180, 1, NULL);
INSERT INTO `product_spec` VALUES (180, 2, NULL);
INSERT INTO `product_spec` VALUES (180, 3, NULL);
INSERT INTO `product_spec` VALUES (180, 4, NULL);
INSERT INTO `product_spec` VALUES (180, 5, NULL);
INSERT INTO `product_spec` VALUES (180, 6, NULL);
INSERT INTO `product_spec` VALUES (181, 1, NULL);
INSERT INTO `product_spec` VALUES (181, 2, NULL);
INSERT INTO `product_spec` VALUES (181, 3, NULL);
INSERT INTO `product_spec` VALUES (181, 4, NULL);
INSERT INTO `product_spec` VALUES (181, 5, NULL);
INSERT INTO `product_spec` VALUES (181, 6, NULL);
INSERT INTO `product_spec` VALUES (182, 1, NULL);
INSERT INTO `product_spec` VALUES (182, 2, NULL);
INSERT INTO `product_spec` VALUES (182, 3, NULL);
INSERT INTO `product_spec` VALUES (182, 4, NULL);
INSERT INTO `product_spec` VALUES (182, 5, NULL);
INSERT INTO `product_spec` VALUES (182, 6, NULL);
INSERT INTO `product_spec` VALUES (183, 1, NULL);
INSERT INTO `product_spec` VALUES (183, 2, NULL);
INSERT INTO `product_spec` VALUES (183, 3, NULL);
INSERT INTO `product_spec` VALUES (183, 4, NULL);
INSERT INTO `product_spec` VALUES (183, 5, NULL);
INSERT INTO `product_spec` VALUES (183, 6, NULL);
INSERT INTO `product_spec` VALUES (184, 1, NULL);
INSERT INTO `product_spec` VALUES (184, 2, NULL);
INSERT INTO `product_spec` VALUES (184, 3, NULL);
INSERT INTO `product_spec` VALUES (184, 4, NULL);
INSERT INTO `product_spec` VALUES (184, 5, NULL);
INSERT INTO `product_spec` VALUES (184, 6, NULL);
INSERT INTO `product_spec` VALUES (185, 1, NULL);
INSERT INTO `product_spec` VALUES (185, 2, NULL);
INSERT INTO `product_spec` VALUES (185, 3, NULL);
INSERT INTO `product_spec` VALUES (185, 4, NULL);
INSERT INTO `product_spec` VALUES (185, 5, NULL);
INSERT INTO `product_spec` VALUES (185, 6, NULL);
INSERT INTO `product_spec` VALUES (186, 1, NULL);
INSERT INTO `product_spec` VALUES (186, 2, NULL);
INSERT INTO `product_spec` VALUES (186, 3, NULL);
INSERT INTO `product_spec` VALUES (186, 4, NULL);
INSERT INTO `product_spec` VALUES (186, 5, NULL);
INSERT INTO `product_spec` VALUES (186, 6, NULL);
INSERT INTO `product_spec` VALUES (187, 1, NULL);
INSERT INTO `product_spec` VALUES (187, 2, NULL);
INSERT INTO `product_spec` VALUES (187, 3, NULL);
INSERT INTO `product_spec` VALUES (187, 4, NULL);
INSERT INTO `product_spec` VALUES (187, 5, NULL);
INSERT INTO `product_spec` VALUES (187, 6, NULL);
INSERT INTO `product_spec` VALUES (188, 1, NULL);
INSERT INTO `product_spec` VALUES (188, 2, NULL);
INSERT INTO `product_spec` VALUES (188, 3, NULL);
INSERT INTO `product_spec` VALUES (188, 4, NULL);
INSERT INTO `product_spec` VALUES (188, 5, NULL);
INSERT INTO `product_spec` VALUES (188, 6, NULL);
INSERT INTO `product_spec` VALUES (189, 1, NULL);
INSERT INTO `product_spec` VALUES (189, 2, NULL);
INSERT INTO `product_spec` VALUES (189, 3, NULL);
INSERT INTO `product_spec` VALUES (189, 4, NULL);
INSERT INTO `product_spec` VALUES (189, 5, NULL);
INSERT INTO `product_spec` VALUES (189, 6, NULL);
INSERT INTO `product_spec` VALUES (190, 1, NULL);
INSERT INTO `product_spec` VALUES (190, 2, NULL);
INSERT INTO `product_spec` VALUES (190, 3, NULL);
INSERT INTO `product_spec` VALUES (190, 4, NULL);
INSERT INTO `product_spec` VALUES (190, 5, NULL);
INSERT INTO `product_spec` VALUES (190, 6, NULL);
INSERT INTO `product_spec` VALUES (191, 1, NULL);
INSERT INTO `product_spec` VALUES (191, 2, NULL);
INSERT INTO `product_spec` VALUES (191, 3, NULL);
INSERT INTO `product_spec` VALUES (191, 4, NULL);
INSERT INTO `product_spec` VALUES (191, 5, NULL);
INSERT INTO `product_spec` VALUES (191, 6, NULL);
INSERT INTO `product_spec` VALUES (192, 1, NULL);
INSERT INTO `product_spec` VALUES (192, 2, NULL);
INSERT INTO `product_spec` VALUES (192, 3, NULL);
INSERT INTO `product_spec` VALUES (192, 4, NULL);
INSERT INTO `product_spec` VALUES (192, 5, NULL);
INSERT INTO `product_spec` VALUES (192, 6, NULL);
INSERT INTO `product_spec` VALUES (193, 1, NULL);
INSERT INTO `product_spec` VALUES (193, 2, NULL);
INSERT INTO `product_spec` VALUES (193, 3, NULL);
INSERT INTO `product_spec` VALUES (193, 4, NULL);
INSERT INTO `product_spec` VALUES (193, 5, NULL);
INSERT INTO `product_spec` VALUES (193, 6, NULL);
INSERT INTO `product_spec` VALUES (194, 1, NULL);
INSERT INTO `product_spec` VALUES (194, 2, NULL);
INSERT INTO `product_spec` VALUES (194, 3, NULL);
INSERT INTO `product_spec` VALUES (194, 4, NULL);
INSERT INTO `product_spec` VALUES (194, 5, NULL);
INSERT INTO `product_spec` VALUES (194, 6, NULL);
INSERT INTO `product_spec` VALUES (195, 1, NULL);
INSERT INTO `product_spec` VALUES (195, 2, NULL);
INSERT INTO `product_spec` VALUES (195, 3, NULL);
INSERT INTO `product_spec` VALUES (195, 4, NULL);
INSERT INTO `product_spec` VALUES (195, 5, NULL);
INSERT INTO `product_spec` VALUES (195, 6, NULL);
INSERT INTO `product_spec` VALUES (196, 1, NULL);
INSERT INTO `product_spec` VALUES (196, 2, NULL);
INSERT INTO `product_spec` VALUES (196, 3, NULL);
INSERT INTO `product_spec` VALUES (196, 4, NULL);
INSERT INTO `product_spec` VALUES (196, 5, NULL);
INSERT INTO `product_spec` VALUES (196, 6, NULL);
INSERT INTO `product_spec` VALUES (197, 1, NULL);
INSERT INTO `product_spec` VALUES (197, 2, NULL);
INSERT INTO `product_spec` VALUES (197, 3, NULL);
INSERT INTO `product_spec` VALUES (197, 4, NULL);
INSERT INTO `product_spec` VALUES (197, 5, NULL);
INSERT INTO `product_spec` VALUES (197, 6, NULL);
INSERT INTO `product_spec` VALUES (198, 1, NULL);
INSERT INTO `product_spec` VALUES (198, 2, NULL);
INSERT INTO `product_spec` VALUES (198, 3, NULL);
INSERT INTO `product_spec` VALUES (198, 4, NULL);
INSERT INTO `product_spec` VALUES (198, 5, NULL);
INSERT INTO `product_spec` VALUES (198, 6, NULL);
INSERT INTO `product_spec` VALUES (199, 1, NULL);
INSERT INTO `product_spec` VALUES (199, 2, NULL);
INSERT INTO `product_spec` VALUES (199, 3, NULL);
INSERT INTO `product_spec` VALUES (199, 4, NULL);
INSERT INTO `product_spec` VALUES (199, 5, NULL);
INSERT INTO `product_spec` VALUES (199, 6, NULL);
INSERT INTO `product_spec` VALUES (200, 1, NULL);
INSERT INTO `product_spec` VALUES (200, 2, NULL);
INSERT INTO `product_spec` VALUES (200, 3, NULL);
INSERT INTO `product_spec` VALUES (200, 4, NULL);
INSERT INTO `product_spec` VALUES (200, 5, NULL);
INSERT INTO `product_spec` VALUES (200, 6, NULL);

-- ----------------------------
-- Table structure for product_view
-- ----------------------------
DROP TABLE IF EXISTS `product_view`;
CREATE TABLE `product_view`  (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of product_view
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `PricePerBox` int(11) NULL DEFAULT NULL,
  `Stock` int(11) NULL DEFAULT NULL,
  `Des` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Status` bit(1) NULL DEFAULT b'1',
  `Rating` int(11) NULL DEFAULT 1,
  `Discount` bit(1) NULL DEFAULT b'0',
  `PromotionPrice` decimal(18, 2) NULL DEFAULT NULL,
  `QuantityPerBox` int(11) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CategoryID` int(11) NULL DEFAULT NULL,
  `SizeID` int(11) NULL DEFAULT NULL,
  `MaterialID` int(11) NULL DEFAULT NULL,
  `ManufacturerID` int(11) NULL DEFAULT NULL,
  `ImgThumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_categoryid`(`CategoryID`) USING BTREE,
  INDEX `fk_sizeid`(`SizeID`) USING BTREE,
  INDEX `fk_material`(`MaterialID`) USING BTREE,
  INDEX `fk_manufacturer`(`ManufacturerID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Gạch lát sân vườn MAXTOT MT5501', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:06:23', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (2, 'Gạch lát sân vườn MAXTOT MT5502', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:06:38', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (3, 'Gạch lát sân vườn MAXTOT MT5503', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:06:38', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (4, 'Gạch lát sân vườn MAXTOT MT5505', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:06:38', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (5, 'Gạch lát sân vườn MAXTOT MT5506', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:06:38', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (6, 'Gạch lát sân vườn MAXTOT MT5507', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (7, 'Gạch lát sân vườn MAXTOT MT5508', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (8, 'Gạch lát sân vườn MAXTOT MT5509', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (9, 'Gạch ốp tường MAXTOT MT3601', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (10, 'Gạch ốp tường MAXTOT MT3601D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (11, 'Gạch ốp tường MAXTOT MT3602', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (12, 'Gạch ốp tường MAXTOT MT3605', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (13, 'Gạch ốp tường MAXTOT MT3605D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (14, 'Gạch ốp tường MAXTOT MT3606', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (15, 'Gạch ốp tường MAXTOT MT3607', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (16, 'Gạch ốp tường MAXTOT MT3607D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (17, 'Gạch ốp tường MAXTOT MT3608', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (18, 'Gạch ốp tường MAXTOT MT3609', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (19, 'Gạch ốp tường MAXTOT MT3609D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (20, 'Gạch ốp tường MAXTOT MT3610', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (21, 'Gạch ốp tường MAXTOT MT3617', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (22, 'Gạch ốp tường MAXTOT MT3617D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (23, 'Gạch ốp tường MAXTOT MT3618', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (24, 'Gạch ốp tường MAXTOT MT3619', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (25, 'Gạch ốp tường MAXTOT MT3619D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (26, 'Gạch ốp tường MAXTOT MT3620', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (27, 'Gạch ốp tường MAXTOT MT3621', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (28, 'Gạch ốp tường MAXTOT MT3621D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (29, 'Gạch ốp tường MAXTOT MT3621V', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (30, 'Gạch ốp tường MAXTOT MT3623', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (31, 'Gạch ốp tường MAXTOT MT3623D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (32, 'Gạch ốp tường MAXTOT MT3624', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (33, 'Gạch ốp tường MAXTOT MT4802', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (34, 'Gạch ốp tường MAXTOT MT4802D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (35, 'Gạch ốp tường MAXTOT MT4803', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (36, 'Gạch ốp tường MAXTOT MT4804', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (37, 'Gạch ốp tường MAXTOT MT4804D', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (38, 'Gạch ốp tường MAXTOT MT4805', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:05', NULL, NULL, NULL, 1, NULL);
INSERT INTO `products` VALUES (39, 'Gạch lát sàn BAMBU BB66.1008', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:32', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (40, 'Gạch lát sàn BAMBU BB66.1011', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (41, 'Gạch lát sàn BAMBU BB66.1014', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (42, 'Gạch lát sàn BAMBU BB66.1015', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (43, 'Gạch lát sàn BAMBU BB66.1016', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (44, 'Gạch lát sàn BAMBU BB66.6003', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (45, 'Gạch lát sàn BAMBU BB66.6010', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (46, 'Gạch lát sàn BAMBU BB66.6011', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (47, 'Gạch lát sàn BAMBU BB66.6012', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (48, 'Gạch lát sàn BAMBU BB66.6013', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (49, 'Gạch lát sàn BAMBU BB66.6014', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (50, 'Gạch lát sàn BAMBU BB66.6015', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (51, 'Gạch lát sàn BAMBU BB66.6017VT', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (52, 'Gạch lát sàn BAMBU BB66.6018VT', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (53, 'Gạch lát sàn BAMBU BB66.6019VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (54, 'Gạch lát sàn BAMBU BB66.6020VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (55, 'Gạch lát sàn BAMBU BB66.6021VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (56, 'Gạch lát sàn BAMBU BB88.6003', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (57, 'Gạch lát sàn BAMBU BB88.6006', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (58, 'Gạch lát sàn BAMBU BB88.6008', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (59, 'Gạch lát sàn BAMBU BB88.6012', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (60, 'Gạch lát sàn BAMBU BB88.6013', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (61, 'Gạch lát sàn BAMBU BB88.6014', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (62, 'Gạch lát sàn BAMBU BB88.6015', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (63, 'Gạch lát sàn BAMBU BB88.6017VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (64, 'Gạch lát sàn BAMBU BB88.6018VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (65, 'Gạch lát sàn BAMBU BB88.6019VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (66, 'Gạch lát sàn BAMBU BB88.6020VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (67, 'Gạch lát sàn BAMBU BB88.6021VT', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (68, 'Gạch ốp tường BAMBU BB36.6001D', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (69, 'Gạch ốp tường BAMBU BB36.6001DE', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (70, 'Gạch ốp tường BAMBU BB36.6001L', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (71, 'Gạch ốp tường BAMBU BB36.6002D', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (72, 'Gạch ốp tường BAMBU BB36.6002DE', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (73, 'Gạch ốp tường BAMBU BB36.6002L', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (74, 'Gạch ốp tường BAMBU BB36.6003D', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (75, 'Gạch ốp tường BAMBU BB36.6003DE', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (76, 'Gạch ốp tường BAMBU BB36.6003L', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (77, 'Gạch ốp tường BAMBU BB36.6004DE', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (78, 'Gạch ốp tường BAMBU BB36.6004L', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (79, 'Gạch ốp tường BAMBU BB36.6004V', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:07:49', NULL, NULL, NULL, 2, NULL);
INSERT INTO `products` VALUES (80, 'Gạch lát sân vườn FAMITO F503', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:08:17', NULL, NULL, NULL, 3, NULL);
INSERT INTO `products` VALUES (81, 'Gạch lát sân vườn FAMITO F504', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:08:18', NULL, NULL, NULL, 3, NULL);
INSERT INTO `products` VALUES (82, 'Gạch lát sân vườn FAMITO F505', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:08:19', NULL, NULL, NULL, 3, NULL);
INSERT INTO `products` VALUES (83, 'Gạch lát sân vườn FAMITO F506', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:08:20', NULL, NULL, NULL, 3, NULL);
INSERT INTO `products` VALUES (84, 'Gạch men sân vườn FAMITO F502', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:08:23', NULL, NULL, NULL, 3, NULL);
INSERT INTO `products` VALUES (85, 'Gạch lát nền granite cao cấp IVICASA GA-P66001 600×600', NULL, NULL, '', b'1', 1, b'0', NULL, NULL, '2024-12-18 01:10:48', NULL, NULL, NULL, 4, '');
INSERT INTO `products` VALUES (86, 'Gạch lát nền granite cao cấp IVICASA GA-P66002 600×600', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:10:50', NULL, NULL, NULL, 4, NULL);
INSERT INTO `products` VALUES (87, 'Gạch lát nền granite cao cấp IVICASA GA-P66003 600×600', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:10:51', NULL, NULL, NULL, 4, NULL);
INSERT INTO `products` VALUES (88, 'Gạch lát nền granite cao cấp IVICASA GA-P66004 600×600', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:10:52', NULL, NULL, NULL, 4, NULL);
INSERT INTO `products` VALUES (89, 'Gạch lát nền granite cao cấp IVICASA GA-P66005 600×600', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:10:53', NULL, NULL, NULL, 4, NULL);
INSERT INTO `products` VALUES (90, 'Gạch lát nền granite cao cấp IVICASA GA-P66006 600×600', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:10:53', NULL, NULL, NULL, 4, NULL);
INSERT INTO `products` VALUES (91, 'Gạch lát nền granite cao cấp IVICASA GA-P66007 600×600', NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:10:54', NULL, NULL, NULL, 4, NULL);
INSERT INTO `products` VALUES (92, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, '2024-12-18 01:11:25', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (93, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (94, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (95, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (96, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (97, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (98, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (99, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (100, NULL, NULL, NULL, NULL, b'1', 1, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Rating` int(11) NULL DEFAULT NULL,
  `ReviewText` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ReviewDate` datetime NULL DEFAULT NULL,
  `OrderID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`, `ProductID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES (1, '500×500 mm');
INSERT INTO `size` VALUES (2, '300×600 mm');
INSERT INTO `size` VALUES (3, '400×800 mm');
INSERT INTO `size` VALUES (4, '600×600 mm');
INSERT INTO `size` VALUES (5, '800×800 mm');
INSERT INTO `size` VALUES (6, '500×500 mm');

-- ----------------------------
-- Table structure for spectype
-- ----------------------------
DROP TABLE IF EXISTS `spectype`;
CREATE TABLE `spectype`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spectype
-- ----------------------------
INSERT INTO `spectype` VALUES (1, 'Kích thước');
INSERT INTO `spectype` VALUES (2, 'Khung xương');
INSERT INTO `spectype` VALUES (3, 'Loại men');
INSERT INTO `spectype` VALUES (4, 'Bề mặt');
INSERT INTO `spectype` VALUES (5, 'Thương hiệu');
INSERT INTO `spectype` VALUES (6, 'Xuất xứ');

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `ID` int(11) NOT NULL,
  `StoreName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Latitude` decimal(8, 2) NULL DEFAULT NULL,
  `Longitude` decimal(8, 2) NULL DEFAULT NULL,
  `StorePhone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `WorkingTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stores
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birthtime` datetime NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  `createtime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT 0,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sex` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `check_email_unique`(`email`) USING BTREE COMMENT 'email da ton tai'
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'Anh Nguyên', 'com@gamil.com', '0213432', NULL, NULL, '2024-12-24 16:20:47', b'1', '2024-12-15 16:55:20', '', 1, '123', 1);
INSERT INTO `users` VALUES (3, 'Trang Trang', 'com1@gamil.com', '0213432', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', NULL, '2024-12-10 16:20:54', b'1', '2024-12-15 17:08:26', '', 0, '123', 1);
INSERT INTO `users` VALUES (4, 'Trương Diếm', 'com3@gamil.com', '0213432', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', NULL, '2024-12-04 16:20:58', b'1', '2024-12-15 17:08:36', '', 0, '123', 1);
INSERT INTO `users` VALUES (5, 'phuc', 'com4@gamil.com', '0213432', NULL, NULL, '2024-12-11 16:21:03', b'1', '2024-12-14 16:21:11', '', 0, '123', 0);
INSERT INTO `users` VALUES (6, 'Ngân cuti', 'ngan@gmail.com', '0376272024', NULL, 'bình định', NULL, b'1', NULL, NULL, 0, 'N123456789', 0);
INSERT INTO `users` VALUES (7, 'Phạm Tài', 'tai@gmail.com', '022222222', NULL, 'bình định', NULL, b'1', NULL, NULL, 0, 'T123456789', 0);

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers`  (
  `ID` int(11) NOT NULL,
  `Code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `DiscountValue` decimal(18, 2) NULL DEFAULT NULL,
  `ExpireDate` datetime NULL DEFAULT NULL,
  `IsActive` bit(1) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vouchers
-- ----------------------------

-- ----------------------------
-- Table structure for voucherusage
-- ----------------------------
DROP TABLE IF EXISTS `voucherusage`;
CREATE TABLE `voucherusage`  (
  `VoucherID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NULL DEFAULT NULL,
  `UsageDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`VoucherID`, `UserID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of voucherusage
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 23/12/2024 18:26:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Status` bit(1) NULL DEFAULT b'1',
  `CreateDate` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Gách lát sàn', b'1', '2024-12-19 14:20:58');
INSERT INTO `category` VALUES (2, 'Gạch ốp tường', b'1', '2024-12-19 14:21:51');

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'Đỏ');
INSERT INTO `colors` VALUES (2, 'Xanh');
INSERT INTO `colors` VALUES (3, 'Vàng');
INSERT INTO `colors` VALUES (4, 'Tím');
INSERT INTO `colors` VALUES (5, 'Trắng');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product_color_img
-- ----------------------------
DROP TABLE IF EXISTS `product_color_img`;
CREATE TABLE `product_color_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ColorId` int(11) NULL DEFAULT NULL,
  `ProductId` int(11) NULL DEFAULT NULL,
  `Url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_colorid`(`ColorId` ASC) USING BTREE,
  INDEX `fk_productid`(`ProductId` ASC) USING BTREE,
  CONSTRAINT `fk_colorid` FOREIGN KEY (`ColorId`) REFERENCES `colors` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_productid` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_color_img
-- ----------------------------
INSERT INTO `product_color_img` VALUES (15, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (16, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$\r\nhttps://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$\r\nhttps://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (17, 3, 1, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (18, 4, 1, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (19, 5, 1, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (20, 1, 2, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (21, 1, 3, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (22, 1, 4, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (23, 1, 5, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (24, 1, 6, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (25, 1, 7, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (26, 1, 8, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (27, 1, 9, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (30, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$\r\nhttps://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$\r\nhttps://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (31, 3, 1, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (32, 4, 1, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (33, 5, 1, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (34, 1, 2, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (35, 1, 3, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (36, 1, 4, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (37, 1, 5, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (38, 1, 6, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (39, 1, 7, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (40, 1, 8, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (41, 1, 9, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (42, 1, 10, 'https://tileshop.scene7.com/is/image/TileShop/681784?$ExtraLarge$');
INSERT INTO `product_color_img` VALUES (43, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484017_instb1?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (44, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484017_Detail_Angle?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (45, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/COSpringsShoot_Harper_Riad_VERTICAL?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (46, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/TimberTrails_CoastalChic_Kitchen_013?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (47, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/TimberTrails_CoastalChic_Bar_003?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (48, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/ISpyDIY_Loft_Kitchen_002?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (49, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/ISpyDIY_Loft_Kitchen006?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (50, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/AlisonVictoria_AtlantaLoft_Bathroom2_006?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (51, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/AlisonVictoria_AtlantaLoft_Bathroom2_005?$PDPThumbnail$&fmt=webp');
INSERT INTO `product_color_img` VALUES (52, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/AlisonVictoria_AtlantaLoft_Bathroom2_005?$PDPThumbnail$&fmt=webp');

-- ----------------------------
-- Table structure for product_spec
-- ----------------------------
DROP TABLE IF EXISTS `product_spec`;
CREATE TABLE `product_spec`  (
  `ProductID` int(11) NOT NULL,
  `SpecID` int(11) NOT NULL,
  `Value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`, `SpecID`) USING BTREE,
  INDEX `fk_specid_sp`(`SpecID` ASC) USING BTREE,
  CONSTRAINT `fk_productid_sp` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_specid_sp` FOREIGN KEY (`SpecID`) REFERENCES `spectype` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `product_spec` VALUES (51, 1, 'Men vi tinh');
INSERT INTO `product_spec` VALUES (51, 2, 'Pocerlain');
INSERT INTO `product_spec` VALUES (51, 3, '600×600 mm');
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

-- ----------------------------
-- Table structure for product_view
-- ----------------------------
DROP TABLE IF EXISTS `product_view`;
CREATE TABLE `product_view`  (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_view
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pricePerBox` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  `rating` int(11) NULL DEFAULT 1,
  `discount` bit(1) NULL DEFAULT b'0',
  `promotionPrice` decimal(18, 2) NULL DEFAULT NULL,
  `quantityPerBox` int(11) NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT current_timestamp(),
  `categoryId` int(11) NULL DEFAULT NULL,
  `sizeId` int(11) NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `manufacturerId` int(11) NULL DEFAULT NULL,
  `imgThumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category`(`categoryId` ASC) USING BTREE,
  INDEX `fk_material`(`materialId` ASC) USING BTREE,
  INDEX `fk_size`(`sizeId` ASC) USING BTREE,
  INDEX `fk_manufacturer`(`manufacturerId` ASC) USING BTREE,
  CONSTRAINT `fk_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_material` FOREIGN KEY (`materialId`) REFERENCES `material` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_size` FOREIGN KEY (`sizeId`) REFERENCES `size` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Gạch lát sân vườn MAXTOT MT5501', 124000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
INSERT INTO `products` VALUES (2, 'Gạch lát sân vườn MAXTOT MT5502', 372000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `products` VALUES (3, 'Gạch lát sân vườn MAXTOT MT5503', 184000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `products` VALUES (4, 'Gạch lát sân vườn MAXTOT MT5505', 714000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `products` VALUES (5, 'Gạch lát sân vườn MAXTOT MT5506', 412000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `products` VALUES (6, 'Gạch lát sân vườn MAXTOT MT5507', 851000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `products` VALUES (7, 'Gạch lát sân vườn MAXTOT MT5508', 384000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `products` VALUES (8, 'Gạch lát sân vườn MAXTOT MT5509', 556000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `products` VALUES (9, 'Gạch ốp tường MAXTOT MT3601', 448000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `products` VALUES (10, 'Gạch ốp tường MAXTOT MT3601D', 994000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/681784?$ExtraLarge$');
INSERT INTO `products` VALUES (11, 'Gạch ốp tường MAXTOT MT3602', 247000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `products` VALUES (12, 'Gạch ốp tường MAXTOT MT3605', 246000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `products` VALUES (13, 'Gạch ốp tường MAXTOT MT3605D', 334000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `products` VALUES (14, 'Gạch ốp tường MAXTOT MT3606', 577000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `products` VALUES (15, 'Gạch ốp tường MAXTOT MT3607', 654000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484274?$ExtraLarge$');
INSERT INTO `products` VALUES (16, 'Gạch ốp tường MAXTOT MT3607D', 266000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/616100?$ExtraLarge$');
INSERT INTO `products` VALUES (17, 'Gạch ốp tường MAXTOT MT3608', 938000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484216?$ExtraLarge$');
INSERT INTO `products` VALUES (18, 'Gạch ốp tường MAXTOT MT3609', 415000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/657613?$ExtraLarge$');
INSERT INTO `products` VALUES (19, 'Gạch ốp tường MAXTOT MT3609D', 776000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484297?$ExtraLarge$');
INSERT INTO `products` VALUES (20, 'Gạch ốp tường MAXTOT MT3610', 161000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/496215?$ExtraLarge$');
INSERT INTO `products` VALUES (21, 'Gạch ốp tường MAXTOT MT3617', 887000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/650782?$ExtraLarge$');
INSERT INTO `products` VALUES (22, 'Gạch ốp tường MAXTOT MT3617D', 360000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/496182?$ExtraLarge$');
INSERT INTO `products` VALUES (23, 'Gạch ốp tường MAXTOT MT3618', 963000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/650852?$ExtraLarge$');
INSERT INTO `products` VALUES (24, 'Gạch ốp tường MAXTOT MT3619', 151000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/494248?$ExtraLarge$');
INSERT INTO `products` VALUES (25, 'Gạch ốp tường MAXTOT MT3619D', 141000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484594?$ExtraLarge$');
INSERT INTO `products` VALUES (26, 'Gạch ốp tường MAXTOT MT3620', 629000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/494434?$ExtraLarge$');
INSERT INTO `products` VALUES (27, 'Gạch ốp tường MAXTOT MT3621', 789000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484078?$ExtraLarge$');
INSERT INTO `products` VALUES (28, 'Gạch ốp tường MAXTOT MT3621D', 491000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484069?$ExtraLarge$');
INSERT INTO `products` VALUES (29, 'Gạch ốp tường MAXTOT MT3621V', 193000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/658656?$ExtraLarge$');
INSERT INTO `products` VALUES (30, 'Gạch ốp tường MAXTOT MT3623', 911000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484288?$ExtraLarge$');
INSERT INTO `products` VALUES (31, 'Gạch ốp tường MAXTOT MT3623D', 335000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484107?$ExtraLarge$');
INSERT INTO `products` VALUES (32, 'Gạch ốp tường MAXTOT MT3624', 299000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/655838?$ExtraLarge$');
INSERT INTO `products` VALUES (33, 'Gạch ốp tường MAXTOT MT4802', 324000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484361?$ExtraLarge$');
INSERT INTO `products` VALUES (34, 'Gạch ốp tường MAXTOT MT4802D', 433000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/681746?$ExtraLarge$');
INSERT INTO `products` VALUES (35, 'Gạch ốp tường MAXTOT MT4803', 734000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/681043?$ExtraLarge$');
INSERT INTO `products` VALUES (36, 'Gạch ốp tường MAXTOT MT4804', 952000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484287?$ExtraLarge$');
INSERT INTO `products` VALUES (37, 'Gạch ốp tường MAXTOT MT4804D', 384000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/650433?$ExtraLarge$');
INSERT INTO `products` VALUES (38, 'Gạch ốp tường MAXTOT MT4805', 457000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 1, 'https://tileshop.scene7.com/is/image/TileShop/484019?$ExtraLarge$');
INSERT INTO `products` VALUES (39, 'Gạch lát sàn BAMBU BB66.1008', 622000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484359?$ExtraLarge$');
INSERT INTO `products` VALUES (40, 'Gạch lát sàn BAMBU BB66.1011', 379000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/658498?$ExtraLarge$');
INSERT INTO `products` VALUES (41, 'Gạch lát sàn BAMBU BB66.1014', 496000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/494440?$ExtraLarge$');
INSERT INTO `products` VALUES (42, 'Gạch lát sàn BAMBU BB66.1015', 972000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/441955?$ExtraLarge$');
INSERT INTO `products` VALUES (43, 'Gạch lát sàn BAMBU BB66.1016', 218000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484431?$ExtraLarge$');
INSERT INTO `products` VALUES (44, 'Gạch lát sàn BAMBU BB66.6003', 360000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/615826?$ExtraLarge$');
INSERT INTO `products` VALUES (45, 'Gạch lát sàn BAMBU BB66.6010', 719000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484038?$ExtraLarge$');
INSERT INTO `products` VALUES (46, 'Gạch lát sàn BAMBU BB66.6011', 197000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484285?$ExtraLarge$');
INSERT INTO `products` VALUES (47, 'Gạch lát sàn BAMBU BB66.6012', 643000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/615817?$ExtraLarge$');
INSERT INTO `products` VALUES (48, 'Gạch lát sàn BAMBU BB66.6013', 689000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484002?$ExtraLarge$');
INSERT INTO `products` VALUES (49, 'Gạch lát sàn BAMBU BB66.6014', 864000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
INSERT INTO `products` VALUES (50, 'Gạch lát sàn BAMBU BB66.6015', 309000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `products` VALUES (51, 'Gạch lát sàn BAMBU BB66.6017VT', 936000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `products` VALUES (52, 'Gạch lát sàn BAMBU BB66.6018VT', 959000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `products` VALUES (53, 'Gạch lát sàn BAMBU BB66.6019VT', 455000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `products` VALUES (54, 'Gạch lát sàn BAMBU BB66.6020VT', 564000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `products` VALUES (55, 'Gạch lát sàn BAMBU BB66.6021VT', 383000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `products` VALUES (56, 'Gạch lát sàn BAMBU BB88.6003', 230000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `products` VALUES (57, 'Gạch lát sàn BAMBU BB88.6006', 938000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `products` VALUES (58, 'Gạch lát sàn BAMBU BB88.6008', 788000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/681784?$ExtraLarge$');
INSERT INTO `products` VALUES (59, 'Gạch lát sàn BAMBU BB88.6012', 274000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `products` VALUES (60, 'Gạch lát sàn BAMBU BB88.6013', 972000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `products` VALUES (61, 'Gạch lát sàn BAMBU BB88.6014', 837000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `products` VALUES (62, 'Gạch lát sàn BAMBU BB88.6015', 383000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `products` VALUES (63, 'Gạch lát sàn BAMBU BB88.6017VT', 529000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484274?$ExtraLarge$');
INSERT INTO `products` VALUES (64, 'Gạch lát sàn BAMBU BB88.6018VT', 481000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/616100?$ExtraLarge$');
INSERT INTO `products` VALUES (65, 'Gạch lát sàn BAMBU BB88.6019VT', 125000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484216?$ExtraLarge$');
INSERT INTO `products` VALUES (66, 'Gạch lát sàn BAMBU BB88.6020VT', 255000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/657613?$ExtraLarge$');
INSERT INTO `products` VALUES (67, 'Gạch lát sàn BAMBU BB88.6021VT', 996000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484297?$ExtraLarge$');
INSERT INTO `products` VALUES (68, 'Gạch ốp tường BAMBU BB36.6001D', 114000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/496215?$ExtraLarge$');
INSERT INTO `products` VALUES (69, 'Gạch ốp tường BAMBU BB36.6001DE', 167000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/650782?$ExtraLarge$');
INSERT INTO `products` VALUES (70, 'Gạch ốp tường BAMBU BB36.6001L', 702000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/496182?$ExtraLarge$');
INSERT INTO `products` VALUES (71, 'Gạch ốp tường BAMBU BB36.6002D', 917000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/650852?$ExtraLarge$');
INSERT INTO `products` VALUES (72, 'Gạch ốp tường BAMBU BB36.6002DE', 104000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/494248?$ExtraLarge$');
INSERT INTO `products` VALUES (73, 'Gạch ốp tường BAMBU BB36.6002L', 529000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484594?$ExtraLarge$');
INSERT INTO `products` VALUES (74, 'Gạch ốp tường BAMBU BB36.6003D', 748000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/494434?$ExtraLarge$');
INSERT INTO `products` VALUES (75, 'Gạch ốp tường BAMBU BB36.6003DE', 723000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484078?$ExtraLarge$');
INSERT INTO `products` VALUES (76, 'Gạch ốp tường BAMBU BB36.6003L', 506000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484069?$ExtraLarge$');
INSERT INTO `products` VALUES (77, 'Gạch ốp tường BAMBU BB36.6004DE', 921000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/658656?$ExtraLarge$');
INSERT INTO `products` VALUES (78, 'Gạch ốp tường BAMBU BB36.6004L', 105000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484288?$ExtraLarge$');
INSERT INTO `products` VALUES (79, 'Gạch ốp tường BAMBU BB36.6004V', 177000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, NULL, NULL, 2, 'https://tileshop.scene7.com/is/image/TileShop/484107?$ExtraLarge$');
INSERT INTO `products` VALUES (80, 'Gạch lát sân vườn FAMITO F503', 379000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 3, 'https://tileshop.scene7.com/is/image/TileShop/655838?$ExtraLarge$');
INSERT INTO `products` VALUES (81, 'Gạch lát sân vườn FAMITO F504', 272000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 3, 'https://tileshop.scene7.com/is/image/TileShop/484361?$ExtraLarge$');
INSERT INTO `products` VALUES (82, 'Gạch lát sân vườn FAMITO F505', 875000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 3, 'https://tileshop.scene7.com/is/image/TileShop/681746?$ExtraLarge$');
INSERT INTO `products` VALUES (83, 'Gạch lát sân vườn FAMITO F506', 692000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 3, 'https://tileshop.scene7.com/is/image/TileShop/681043?$ExtraLarge$');
INSERT INTO `products` VALUES (84, 'Gạch men sân vườn FAMITO F502', 833000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 3, 'https://tileshop.scene7.com/is/image/TileShop/484287?$ExtraLarge$');
INSERT INTO `products` VALUES (85, 'Gạch lát nền granite cao cấp IVICASA GA-P66001 600×600', 113000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 4, 'https://tileshop.scene7.com/is/image/TileShop/650433?$ExtraLarge$');
INSERT INTO `products` VALUES (86, 'Gạch lát nền granite cao cấp IVICASA GA-P66002 600×600', 616000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 4, 'https://tileshop.scene7.com/is/image/TileShop/484019?$ExtraLarge$');
INSERT INTO `products` VALUES (87, 'Gạch lát nền granite cao cấp IVICASA GA-P66003 600×600', 495000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 4, 'https://tileshop.scene7.com/is/image/TileShop/484359?$ExtraLarge$');
INSERT INTO `products` VALUES (88, 'Gạch lát nền granite cao cấp IVICASA GA-P66004 600×600', 355000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 4, 'https://tileshop.scene7.com/is/image/TileShop/658498?$ExtraLarge$');
INSERT INTO `products` VALUES (89, 'Gạch lát nền granite cao cấp IVICASA GA-P66005 600×600', 905000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 4, 'https://tileshop.scene7.com/is/image/TileShop/494440?$ExtraLarge$');
INSERT INTO `products` VALUES (90, 'Gạch lát nền granite cao cấp IVICASA GA-P66006 600×600', 949000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 4, 'https://tileshop.scene7.com/is/image/TileShop/441955?$ExtraLarge$');
INSERT INTO `products` VALUES (91, 'Gạch lát nền granite cao cấp IVICASA GA-P66007 600×600', 651000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, NULL, NULL, 4, 'https://tileshop.scene7.com/is/image/TileShop/484431?$ExtraLarge$');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Rating` int(11) NULL DEFAULT NULL,
  `ReviewText` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ReviewDate` datetime NULL DEFAULT current_timestamp(),
  `OrderID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`, `ProductID`) USING BTREE,
  INDEX `fk_productid_review`(`ProductID` ASC) USING BTREE,
  CONSTRAINT `fk_productid_review` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userid_review` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (8, 2, 0, 'fdsgsdf', '2024-12-23 16:06:19', 1);
INSERT INTO `review` VALUES (8, 3, 0, 'fsdfkjgdf', '2024-12-23 16:00:35', 1);
INSERT INTO `review` VALUES (8, 10, 3, 'fdsgdfsf', '2024-12-23 16:22:28', 1);
INSERT INTO `review` VALUES (8, 14, 0, 'fdsfsd', '2024-12-23 16:26:06', 1);
INSERT INTO `review` VALUES (8, 22, 0, 'fkjdklgjklsjflksad', '2024-12-23 15:57:24', 1);
INSERT INTO `review` VALUES (8, 81, 0, 'Fame tao to', '2024-12-23 15:58:18', 1);
INSERT INTO `review` VALUES (9, 1, 4, 'Dep dzai qua', '2024-12-20 14:25:34', 0);
INSERT INTO `review` VALUES (9, 2, 0, 'cút đi hàng dỏm', '2024-12-23 16:07:10', 1);
INSERT INTO `review` VALUES (9, 3, 0, 'dfgfdgrwer', '2024-12-23 16:07:36', 1);
INSERT INTO `review` VALUES (9, 11, 5, 'quá tuyệt vời', '2024-12-23 16:27:31', 1);
INSERT INTO `review` VALUES (9, 18, 4, 'Ngon', '2024-12-23 17:19:03', 1);
INSERT INTO `review` VALUES (9, 60, 0, '', '2024-12-23 16:09:27', 1);
INSERT INTO `review` VALUES (11, 1, 0, 'fesdfdsf', '2024-12-23 15:20:22', 1);
INSERT INTO `review` VALUES (12, 1, 0, 'tao bom hàng', '2024-12-23 15:28:00', 1);
INSERT INTO `review` VALUES (13, 1, 0, 'Em oi lau dai tinh ai do', '2024-12-23 15:38:55', 1);

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  `createtime` datetime NULL DEFAULT current_timestamp(),
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT 0,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sex` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `check_email_unique`(`email` ASC) USING BTREE COMMENT 'email da ton tai'
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'Anh Nguyên', 'com@gamil.com', '0213432', NULL, NULL, '2024-12-24 16:20:47', b'1', '2024-12-15 16:55:20', '', 1, '123', 1);
INSERT INTO `users` VALUES (3, 'Trang Trang', 'com1@gamil.com', '0213432', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', NULL, '2024-12-10 16:20:54', b'1', '2024-12-15 17:08:26', '', 0, '123', 1);
INSERT INTO `users` VALUES (4, 'Trương Diếm', 'com3@gamil.com', '0213432', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', NULL, '2024-12-04 16:20:58', b'1', '2024-12-15 17:08:36', '', 0, '123', 1);
INSERT INTO `users` VALUES (5, 'phuc', 'com4@gamil.com', '0213432', NULL, NULL, '2024-12-11 16:21:03', b'1', '2024-12-14 16:21:11', '', 0, '123', 0);
INSERT INTO `users` VALUES (6, 'Ngân cuti', 'ngan@gmail.com', '0376272024', NULL, 'bình định', NULL, b'1', NULL, NULL, 0, 'N123456789', 0);
INSERT INTO `users` VALUES (7, 'Phạm Tài', 'tai@gmail.com', '022222222', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', 'bình định', NULL, b'1', NULL, NULL, 0, 'T123456789', 0);
INSERT INTO `users` VALUES (8, 'Ta Phuc', 'taphuc@gmail.com', '0987991500', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', '231241234123', '2024-12-05 00:00:00', b'1', '2024-12-19 13:29:11', '030087edc3869834eccd84e131e363a5', 0, '5eb7fb8425878afce1b965b3e4f8f27f627ac111d8087189a266b6dd15120117', 0);
INSERT INTO `users` VALUES (9, 'Ngân cuti', 'nguyenhaisuper8@gmail.com', '0376272024', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', 'bình định', '2024-12-14 00:00:00', b'1', '2024-12-20 12:19:21', 'ee38298a3ab54677f47c7b689c6dfc1f', 0, '2575028f1907c8395603908a280207c043d751b3275291733360c1e0cc1214bc', 0);
INSERT INTO `users` VALUES (10, 'bgfbfgb', 'a@gmail.com', '0987991500', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', 'cdcsdc', '2024-12-12 00:00:00', b'1', '2024-12-21 02:07:40', 'b46b671d8db9754dbcb140308c35c7a4', 0, '635b4fc85439b34a75b0b7615f27391b11b78e084ab3789ea0e880e3b5212b5b', 0);
INSERT INTO `users` VALUES (11, 'j  b hbhui', 'z@gmail.com', '05151858', NULL, ' m cvxnm cbkvjx', '2024-12-13 00:00:00', b'1', '2024-12-23 15:19:37', '0da9145129e9a98efbbecdbad093bcd1', 0, '16a8ab548b3e5447ae7778102de303f9bf282b5b02bed252a2979e8ba4efa320', 1);
INSERT INTO `users` VALUES (12, ' jhnjhinhjkjgdnnnnnnnnnnnnnnnnnnnnnnnnnnnn', 'com100@gmail.com', '0376272029', NULL, 'bfgbfgfgfg', '2024-12-06 00:00:00', b'1', '2024-12-23 15:26:57', 'e14f42825c897b2935c5417235e57521', 0, 'f0dae3464cc3f20b18c19753542e7bf51dac56073dfd824fadd1eb90d269384f', 1);
INSERT INTO `users` VALUES (13, 'Ta Phuc', 'ta@gmail.com', '4234234', NULL, '324234', '2024-12-19 00:00:00', b'1', '2024-12-23 15:38:09', '67e5e5b13e8f60044d09e4e83782ac48', 0, '20c0a121f2c72afe8198637b67647dfb05da7c5edb94eb27fb528f56768cde6d', 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voucherusage
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

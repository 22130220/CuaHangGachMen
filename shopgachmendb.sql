/*
 Navicat Premium Dump SQL

 Source Server         : DigitalOcean
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41-0ubuntu0.24.04.1)
 Source Host           : 159.223.35.43:3307
 Source Schema         : shopgachmendb

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41-0ubuntu0.24.04.1)
 File Encoding         : 65001

 Date: 24/02/2025 21:38:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Status` bit(1) NULL DEFAULT b'1',
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'GẠCH LÁT SÀN', b'1', '2024-12-24 09:16:14');
INSERT INTO `category` VALUES (2, 'GẠCH ỐP TƯỜNG', b'1', '2024-12-24 09:12:43');

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `ID` int NOT NULL,
  `Fullname` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `SendDate` datetime NULL DEFAULT NULL,
  `IsReply` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, 'Men Sugar mịn');
INSERT INTO `material` VALUES (2, 'Men bóng');
INSERT INTO `material` VALUES (3, 'Glossy');
INSERT INTO `material` VALUES (4, 'Sugar');
INSERT INTO `material` VALUES (5, 'Men vi tinh');
INSERT INTO `material` VALUES (6, 'Mài bóng');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NULL DEFAULT NULL,
  `Price` decimal(18, 2) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `Color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`, `ProductID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (2, 1, 1, 124000.00, '2025-02-24 14:30:11', 'Đỏ');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NULL DEFAULT NULL,
  `OrderDate` datetime NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Status` enum('Delivered','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `TotalPrice` decimal(18, 2) NULL DEFAULT NULL,
  `Des` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `FullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Payment` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 8, '2025-02-24 21:25:30', 'dsfsd', NULL, 0.00, 'sadf', '2025-02-24 14:25:42', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');
INSERT INTO `orders` VALUES (2, 8, '2025-02-24 21:30:05', 'dsfsd', NULL, 0.00, 'sadf', '2025-02-24 14:29:58', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');

-- ----------------------------
-- Table structure for product_color_img
-- ----------------------------
DROP TABLE IF EXISTS `product_color_img`;
CREATE TABLE `product_color_img`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ColorId` int NULL DEFAULT NULL,
  `ProductId` int NULL DEFAULT NULL,
  `Url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_colorid`(`ColorId` ASC) USING BTREE,
  INDEX `fk_productid`(`ProductId` ASC) USING BTREE,
  CONSTRAINT `fk_colorid` FOREIGN KEY (`ColorId`) REFERENCES `colors` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_productid` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_color_img
-- ----------------------------
INSERT INTO `product_color_img` VALUES (15, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
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
  `ProductID` int NOT NULL,
  `SpecID` int NOT NULL,
  `Value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`, `SpecID`) USING BTREE,
  INDEX `fk_specid_sp`(`SpecID` ASC) USING BTREE,
  CONSTRAINT `fk_productid_sp` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_specid_sp` FOREIGN KEY (`SpecID`) REFERENCES `spectype` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_view
-- ----------------------------
INSERT INTO `product_view` VALUES (1, 2, '2025-02-18 14:11:52');
INSERT INTO `product_view` VALUES (2, 3, '2025-02-18 14:13:06');
INSERT INTO `product_view` VALUES (3, 3, '2025-02-18 14:13:42');
INSERT INTO `product_view` VALUES (4, 4, '2025-02-18 14:14:01');
INSERT INTO `product_view` VALUES (5, 3, '2025-02-18 15:09:21');
INSERT INTO `product_view` VALUES (6, 1, '2025-02-18 15:09:34');
INSERT INTO `product_view` VALUES (7, 1, '2025-02-18 15:17:40');
INSERT INTO `product_view` VALUES (8, 39, '2025-02-18 15:21:31');
INSERT INTO `product_view` VALUES (9, 39, '2025-02-18 15:21:31');
INSERT INTO `product_view` VALUES (10, 39, '2025-02-18 15:21:31');
INSERT INTO `product_view` VALUES (11, 39, '2025-02-18 15:22:05');
INSERT INTO `product_view` VALUES (12, 39, '2025-02-18 15:22:05');
INSERT INTO `product_view` VALUES (13, 39, '2025-02-18 15:22:05');
INSERT INTO `product_view` VALUES (14, 39, '2025-02-18 15:44:41');
INSERT INTO `product_view` VALUES (15, 39, '2025-02-18 15:44:41');
INSERT INTO `product_view` VALUES (16, 39, '2025-02-18 15:44:41');
INSERT INTO `product_view` VALUES (17, 1, '2025-02-18 15:45:12');
INSERT INTO `product_view` VALUES (18, 6, '2025-02-18 15:45:20');
INSERT INTO `product_view` VALUES (19, 4, '2025-02-18 15:45:24');
INSERT INTO `product_view` VALUES (20, 5, '2025-02-18 15:45:27');
INSERT INTO `product_view` VALUES (21, 1, '2025-02-18 15:45:42');
INSERT INTO `product_view` VALUES (22, 1, '2025-02-18 15:46:20');
INSERT INTO `product_view` VALUES (23, 3, '2025-02-18 15:46:22');
INSERT INTO `product_view` VALUES (24, 4, '2025-02-18 15:47:19');
INSERT INTO `product_view` VALUES (25, 45, '2025-02-18 15:49:43');
INSERT INTO `product_view` VALUES (26, 45, '2025-02-18 15:49:43');
INSERT INTO `product_view` VALUES (27, 45, '2025-02-18 15:49:43');
INSERT INTO `product_view` VALUES (28, 45, '2025-02-18 15:50:03');
INSERT INTO `product_view` VALUES (29, 45, '2025-02-18 15:50:03');
INSERT INTO `product_view` VALUES (30, 45, '2025-02-18 15:50:04');
INSERT INTO `product_view` VALUES (31, 87, '2025-02-18 15:50:48');
INSERT INTO `product_view` VALUES (32, 87, '2025-02-18 15:50:48');
INSERT INTO `product_view` VALUES (33, 3, '2025-02-20 15:25:36');
INSERT INTO `product_view` VALUES (34, 4, '2025-02-20 15:27:44');
INSERT INTO `product_view` VALUES (35, 2, '2025-02-20 15:27:59');
INSERT INTO `product_view` VALUES (36, 1, '2025-02-20 15:28:16');
INSERT INTO `product_view` VALUES (37, 78, '2025-02-20 15:29:56');
INSERT INTO `product_view` VALUES (38, 78, '2025-02-20 15:30:04');
INSERT INTO `product_view` VALUES (39, 14, '2025-02-20 15:31:33');
INSERT INTO `product_view` VALUES (40, 14, '2025-02-20 15:31:40');
INSERT INTO `product_view` VALUES (41, 1, '2025-02-20 15:34:25');
INSERT INTO `product_view` VALUES (42, 2, '2025-02-20 16:08:47');
INSERT INTO `product_view` VALUES (43, 1, '2025-02-20 16:10:45');
INSERT INTO `product_view` VALUES (44, 9, '2025-02-20 16:13:21');
INSERT INTO `product_view` VALUES (45, 1, '2025-02-20 16:15:05');
INSERT INTO `product_view` VALUES (46, 2, '2025-02-20 16:15:56');
INSERT INTO `product_view` VALUES (47, 1, '2025-02-20 16:28:52');
INSERT INTO `product_view` VALUES (48, 42, '2025-02-20 16:29:12');
INSERT INTO `product_view` VALUES (49, 42, '2025-02-20 16:29:13');
INSERT INTO `product_view` VALUES (50, 9, '2025-02-20 16:37:35');
INSERT INTO `product_view` VALUES (51, 11, '2025-02-20 16:37:50');
INSERT INTO `product_view` VALUES (52, 11, '2025-02-20 16:37:55');
INSERT INTO `product_view` VALUES (53, 9, '2025-02-20 16:38:06');
INSERT INTO `product_view` VALUES (54, 51, '2025-02-20 16:39:22');
INSERT INTO `product_view` VALUES (55, 51, '2025-02-20 16:39:27');
INSERT INTO `product_view` VALUES (56, 1, '2025-02-20 16:39:35');
INSERT INTO `product_view` VALUES (57, 56, '2025-02-20 16:42:00');
INSERT INTO `product_view` VALUES (58, 56, '2025-02-20 16:42:05');
INSERT INTO `product_view` VALUES (59, 40, '2025-02-20 16:53:45');
INSERT INTO `product_view` VALUES (60, 40, '2025-02-20 16:53:52');
INSERT INTO `product_view` VALUES (61, 43, '2025-02-20 16:53:58');
INSERT INTO `product_view` VALUES (62, 43, '2025-02-20 16:53:59');
INSERT INTO `product_view` VALUES (63, 44, '2025-02-20 16:54:04');
INSERT INTO `product_view` VALUES (64, 44, '2025-02-20 16:54:05');
INSERT INTO `product_view` VALUES (65, 47, '2025-02-20 16:54:12');
INSERT INTO `product_view` VALUES (66, 47, '2025-02-20 16:54:13');
INSERT INTO `product_view` VALUES (67, 9, '2025-02-20 16:54:27');
INSERT INTO `product_view` VALUES (68, 13, '2025-02-20 16:55:02');
INSERT INTO `product_view` VALUES (69, 13, '2025-02-20 16:55:04');
INSERT INTO `product_view` VALUES (70, 2, '2025-02-20 17:00:48');
INSERT INTO `product_view` VALUES (71, 5, '2025-02-20 17:01:10');
INSERT INTO `product_view` VALUES (72, 10, '2025-02-20 17:01:21');
INSERT INTO `product_view` VALUES (73, 5, '2025-02-20 17:01:38');
INSERT INTO `product_view` VALUES (74, 43, '2025-02-20 17:01:47');
INSERT INTO `product_view` VALUES (75, 43, '2025-02-20 17:01:52');
INSERT INTO `product_view` VALUES (76, 40, '2025-02-20 17:02:04');
INSERT INTO `product_view` VALUES (77, 40, '2025-02-20 17:02:07');
INSERT INTO `product_view` VALUES (78, 2, '2025-02-20 17:02:24');
INSERT INTO `product_view` VALUES (79, 1, '2025-02-20 17:04:35');
INSERT INTO `product_view` VALUES (80, 4, '2025-02-20 17:05:03');
INSERT INTO `product_view` VALUES (81, 1, '2025-02-20 17:05:26');
INSERT INTO `product_view` VALUES (82, 1, '2025-02-20 17:05:34');
INSERT INTO `product_view` VALUES (83, 44, '2025-02-20 17:05:59');
INSERT INTO `product_view` VALUES (84, 44, '2025-02-20 17:06:04');
INSERT INTO `product_view` VALUES (85, 39, '2025-02-20 17:11:53');
INSERT INTO `product_view` VALUES (86, 39, '2025-02-20 17:12:02');
INSERT INTO `product_view` VALUES (87, 39, '2025-02-20 17:18:48');
INSERT INTO `product_view` VALUES (88, 39, '2025-02-20 17:18:59');
INSERT INTO `product_view` VALUES (89, 44, '2025-02-20 17:19:06');
INSERT INTO `product_view` VALUES (90, 44, '2025-02-20 17:19:08');
INSERT INTO `product_view` VALUES (91, 1, '2025-02-20 17:35:17');
INSERT INTO `product_view` VALUES (92, 1, '2025-02-20 17:35:59');
INSERT INTO `product_view` VALUES (93, 6, '2025-02-20 17:36:05');
INSERT INTO `product_view` VALUES (94, 5, '2025-02-20 17:36:11');
INSERT INTO `product_view` VALUES (95, 6, '2025-02-20 17:44:41');
INSERT INTO `product_view` VALUES (96, 2, '2025-02-20 17:55:56');
INSERT INTO `product_view` VALUES (97, 1, '2025-02-20 18:02:20');
INSERT INTO `product_view` VALUES (98, 43, '2025-02-21 01:46:07');
INSERT INTO `product_view` VALUES (99, 43, '2025-02-21 01:46:10');
INSERT INTO `product_view` VALUES (100, 1, '2025-02-21 01:46:19');
INSERT INTO `product_view` VALUES (101, 40, '2025-02-21 01:46:47');
INSERT INTO `product_view` VALUES (102, 40, '2025-02-21 01:46:49');
INSERT INTO `product_view` VALUES (103, 87, '2025-02-21 01:47:06');
INSERT INTO `product_view` VALUES (104, 87, '2025-02-21 01:47:09');
INSERT INTO `product_view` VALUES (105, 88, '2025-02-21 01:47:19');
INSERT INTO `product_view` VALUES (106, 88, '2025-02-21 01:47:22');
INSERT INTO `product_view` VALUES (107, 40, '2025-02-21 01:47:29');
INSERT INTO `product_view` VALUES (108, 40, '2025-02-21 01:47:32');
INSERT INTO `product_view` VALUES (109, 1, '2025-02-21 02:59:18');
INSERT INTO `product_view` VALUES (110, 2, '2025-02-21 02:59:30');
INSERT INTO `product_view` VALUES (111, 66, '2025-02-21 03:00:11');
INSERT INTO `product_view` VALUES (112, 66, '2025-02-21 03:00:14');
INSERT INTO `product_view` VALUES (113, 40, '2025-02-21 06:49:10');
INSERT INTO `product_view` VALUES (114, 40, '2025-02-21 06:49:13');
INSERT INTO `product_view` VALUES (115, 39, '2025-02-21 06:49:25');
INSERT INTO `product_view` VALUES (116, 39, '2025-02-21 06:49:28');
INSERT INTO `product_view` VALUES (117, 76, '2025-02-21 06:49:32');
INSERT INTO `product_view` VALUES (118, 76, '2025-02-21 06:49:35');
INSERT INTO `product_view` VALUES (119, 1, '2025-02-21 14:12:02');
INSERT INTO `product_view` VALUES (120, 13, '2025-02-21 14:15:55');
INSERT INTO `product_view` VALUES (121, 13, '2025-02-21 14:16:14');
INSERT INTO `product_view` VALUES (122, 1, '2025-02-21 14:20:32');
INSERT INTO `product_view` VALUES (123, 39, '2025-02-21 14:21:00');
INSERT INTO `product_view` VALUES (124, 39, '2025-02-21 14:21:03');
INSERT INTO `product_view` VALUES (125, 39, '2025-02-21 14:21:04');
INSERT INTO `product_view` VALUES (126, 39, '2025-02-21 14:22:38');
INSERT INTO `product_view` VALUES (127, 39, '2025-02-21 14:22:41');
INSERT INTO `product_view` VALUES (128, 39, '2025-02-21 14:22:42');
INSERT INTO `product_view` VALUES (129, 41, '2025-02-21 14:22:48');
INSERT INTO `product_view` VALUES (130, 40, '2025-02-21 14:22:59');
INSERT INTO `product_view` VALUES (131, 40, '2025-02-21 14:23:01');
INSERT INTO `product_view` VALUES (132, 1, '2025-02-21 14:23:24');
INSERT INTO `product_view` VALUES (133, 1, '2025-02-21 14:23:47');
INSERT INTO `product_view` VALUES (134, 40, '2025-02-21 14:26:38');
INSERT INTO `product_view` VALUES (135, 40, '2025-02-21 14:26:40');
INSERT INTO `product_view` VALUES (136, 40, '2025-02-21 14:30:46');
INSERT INTO `product_view` VALUES (137, 40, '2025-02-21 14:30:49');
INSERT INTO `product_view` VALUES (138, 39, '2025-02-21 14:31:14');
INSERT INTO `product_view` VALUES (139, 39, '2025-02-21 14:31:16');
INSERT INTO `product_view` VALUES (140, 11, '2025-02-21 14:39:19');
INSERT INTO `product_view` VALUES (141, 11, '2025-02-21 14:39:21');
INSERT INTO `product_view` VALUES (142, 8, '2025-02-21 14:39:34');
INSERT INTO `product_view` VALUES (143, 9, '2025-02-21 14:39:42');
INSERT INTO `product_view` VALUES (144, 1, '2025-02-21 16:06:23');
INSERT INTO `product_view` VALUES (145, 2, '2025-02-21 16:12:13');
INSERT INTO `product_view` VALUES (146, 2, '2025-02-21 16:18:53');
INSERT INTO `product_view` VALUES (147, 3, '2025-02-21 16:20:43');
INSERT INTO `product_view` VALUES (148, 1, '2025-02-21 16:20:46');
INSERT INTO `product_view` VALUES (149, 6, '2025-02-21 16:20:58');
INSERT INTO `product_view` VALUES (150, 1, '2025-02-22 01:49:54');
INSERT INTO `product_view` VALUES (151, 40, '2025-02-22 02:57:03');
INSERT INTO `product_view` VALUES (152, 40, '2025-02-22 02:57:05');
INSERT INTO `product_view` VALUES (153, 40, '2025-02-22 02:57:06');
INSERT INTO `product_view` VALUES (154, 7, '2025-02-22 02:58:49');
INSERT INTO `product_view` VALUES (155, 19, '2025-02-22 02:59:00');
INSERT INTO `product_view` VALUES (156, 19, '2025-02-22 02:59:00');
INSERT INTO `product_view` VALUES (157, 39, '2025-02-22 15:15:51');
INSERT INTO `product_view` VALUES (158, 1, '2025-02-22 15:16:42');
INSERT INTO `product_view` VALUES (159, 41, '2025-02-22 15:17:38');
INSERT INTO `product_view` VALUES (160, 39, '2025-02-22 15:17:42');
INSERT INTO `product_view` VALUES (161, 39, '2025-02-22 15:17:42');
INSERT INTO `product_view` VALUES (162, 47, '2025-02-22 15:17:46');
INSERT INTO `product_view` VALUES (163, 47, '2025-02-22 15:17:46');
INSERT INTO `product_view` VALUES (164, 39, '2025-02-22 15:17:58');
INSERT INTO `product_view` VALUES (165, 39, '2025-02-22 15:17:58');
INSERT INTO `product_view` VALUES (166, 1, '2025-02-22 15:27:02');
INSERT INTO `product_view` VALUES (167, 2, '2025-02-22 15:27:05');
INSERT INTO `product_view` VALUES (168, 4, '2025-02-22 15:27:07');
INSERT INTO `product_view` VALUES (169, 1, '2025-02-22 15:30:04');
INSERT INTO `product_view` VALUES (170, 3, '2025-02-22 15:30:06');
INSERT INTO `product_view` VALUES (171, 4, '2025-02-22 15:30:08');
INSERT INTO `product_view` VALUES (172, 5, '2025-02-22 15:30:11');
INSERT INTO `product_view` VALUES (173, 10, '2025-02-22 15:30:19');
INSERT INTO `product_view` VALUES (174, 1, '2025-02-22 15:56:04');
INSERT INTO `product_view` VALUES (175, 1, '2025-02-22 16:22:48');
INSERT INTO `product_view` VALUES (176, 39, '2025-02-22 16:22:52');
INSERT INTO `product_view` VALUES (177, 39, '2025-02-22 16:22:52');
INSERT INTO `product_view` VALUES (178, 72, '2025-02-22 16:23:09');
INSERT INTO `product_view` VALUES (179, 72, '2025-02-22 16:23:10');
INSERT INTO `product_view` VALUES (180, 1, '2025-02-23 03:06:12');
INSERT INTO `product_view` VALUES (181, 1, '2025-02-23 03:06:15');
INSERT INTO `product_view` VALUES (182, 3, '2025-02-23 03:06:17');
INSERT INTO `product_view` VALUES (183, 4, '2025-02-23 03:06:21');
INSERT INTO `product_view` VALUES (184, 1, '2025-02-23 03:06:32');
INSERT INTO `product_view` VALUES (185, 56, '2025-02-23 03:07:12');
INSERT INTO `product_view` VALUES (186, 56, '2025-02-23 03:07:12');
INSERT INTO `product_view` VALUES (187, 39, '2025-02-23 05:20:21');
INSERT INTO `product_view` VALUES (188, 39, '2025-02-23 05:20:22');
INSERT INTO `product_view` VALUES (189, 85, '2025-02-23 05:20:32');
INSERT INTO `product_view` VALUES (190, 85, '2025-02-23 05:20:33');
INSERT INTO `product_view` VALUES (191, 43, '2025-02-23 05:20:39');
INSERT INTO `product_view` VALUES (192, 43, '2025-02-23 05:20:40');
INSERT INTO `product_view` VALUES (193, 1, '2025-02-23 05:28:45');
INSERT INTO `product_view` VALUES (194, 2, '2025-02-23 05:28:47');
INSERT INTO `product_view` VALUES (195, 1, '2025-02-23 05:28:50');
INSERT INTO `product_view` VALUES (196, 9, '2025-02-23 05:28:56');
INSERT INTO `product_view` VALUES (197, 2, '2025-02-23 07:55:29');
INSERT INTO `product_view` VALUES (198, 39, '2025-02-23 07:58:30');
INSERT INTO `product_view` VALUES (199, 39, '2025-02-23 07:58:30');
INSERT INTO `product_view` VALUES (200, 1, '2025-02-23 07:59:53');
INSERT INTO `product_view` VALUES (201, 1, '2025-02-23 08:25:39');
INSERT INTO `product_view` VALUES (202, 4, '2025-02-23 08:25:46');
INSERT INTO `product_view` VALUES (203, 2, '2025-02-23 14:17:38');
INSERT INTO `product_view` VALUES (204, 9, '2025-02-23 14:21:28');
INSERT INTO `product_view` VALUES (205, 1, '2025-02-24 01:48:58');
INSERT INTO `product_view` VALUES (206, 1, '2025-02-24 07:26:27');
INSERT INTO `product_view` VALUES (207, 1, '2025-02-24 07:26:48');
INSERT INTO `product_view` VALUES (208, 2, '2025-02-24 13:17:34');
INSERT INTO `product_view` VALUES (209, 1, '2025-02-24 13:24:01');
INSERT INTO `product_view` VALUES (210, 10, '2025-02-24 13:45:32');
INSERT INTO `product_view` VALUES (211, 11, '2025-02-24 13:45:43');
INSERT INTO `product_view` VALUES (212, 11, '2025-02-24 13:45:44');
INSERT INTO `product_view` VALUES (213, 11, '2025-02-24 13:45:55');
INSERT INTO `product_view` VALUES (214, 11, '2025-02-24 13:45:55');
INSERT INTO `product_view` VALUES (215, 1, '2025-02-24 13:46:08');
INSERT INTO `product_view` VALUES (216, 1, '2025-02-24 13:46:26');
INSERT INTO `product_view` VALUES (217, 39, '2025-02-24 13:52:14');
INSERT INTO `product_view` VALUES (218, 39, '2025-02-24 13:52:14');
INSERT INTO `product_view` VALUES (219, 39, '2025-02-24 13:53:49');
INSERT INTO `product_view` VALUES (220, 39, '2025-02-24 13:53:49');
INSERT INTO `product_view` VALUES (221, 1, '2025-02-24 13:58:45');
INSERT INTO `product_view` VALUES (222, 39, '2025-02-24 13:58:47');
INSERT INTO `product_view` VALUES (223, 39, '2025-02-24 13:58:47');
INSERT INTO `product_view` VALUES (224, 40, '2025-02-24 13:58:50');
INSERT INTO `product_view` VALUES (225, 40, '2025-02-24 13:58:50');
INSERT INTO `product_view` VALUES (226, 1, '2025-02-24 14:01:20');
INSERT INTO `product_view` VALUES (227, 1, '2025-02-24 14:04:29');
INSERT INTO `product_view` VALUES (228, 1, '2025-02-24 14:08:43');
INSERT INTO `product_view` VALUES (229, 1, '2025-02-24 14:11:40');
INSERT INTO `product_view` VALUES (230, 1, '2025-02-24 14:15:44');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pricePerBox` int NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  `rating` int NULL DEFAULT 1,
  `discount` bit(1) NULL DEFAULT b'0',
  `promotionPrice` decimal(18, 2) NULL DEFAULT NULL,
  `quantityPerBox` int NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `categoryId` int NULL DEFAULT NULL,
  `sizeId` int NULL DEFAULT NULL,
  `materialId` int NULL DEFAULT NULL,
  `manufacturerId` int NULL DEFAULT NULL,
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Gạch lát sân vườn MAXTOT MT5501', 124000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
INSERT INTO `products` VALUES (2, 'Gạch lát sân vườn MAXTOT MT5502', 372000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `products` VALUES (3, 'Gạch lát sân vườn MAXTOT MT5503', 184000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `products` VALUES (4, 'Gạch lát sân vườn MAXTOT MT5505', 714000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `products` VALUES (5, 'Gạch lát sân vườn MAXTOT MT5506', 412000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `products` VALUES (6, 'Gạch lát sân vườn MAXTOT MT5507', 851000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `products` VALUES (7, 'Gạch lát sân vườn MAXTOT MT5508', 384000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `products` VALUES (8, 'Gạch lát sân vườn MAXTOT MT5509', 556000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `products` VALUES (9, 'Gạch ốp tường MAXTOT MT3601', 448000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `products` VALUES (10, 'Gạch ốp tường MAXTOT MT3601D', 994000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/681784?$ExtraLarge$');
INSERT INTO `products` VALUES (11, 'Gạch ốp tường MAXTOT MT3602', 247000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `products` VALUES (12, 'Gạch ốp tường MAXTOT MT3605', 246000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `products` VALUES (13, 'Gạch ốp tường MAXTOT MT3605D', 334000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `products` VALUES (14, 'Gạch ốp tường MAXTOT MT3606', 577000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `products` VALUES (15, 'Gạch ốp tường MAXTOT MT3607', 654000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484274?$ExtraLarge$');
INSERT INTO `products` VALUES (16, 'Gạch ốp tường MAXTOT MT3607D', 266000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/616100?$ExtraLarge$');
INSERT INTO `products` VALUES (17, 'Gạch ốp tường MAXTOT MT3608', 938000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484216?$ExtraLarge$');
INSERT INTO `products` VALUES (18, 'Gạch ốp tường MAXTOT MT3609', 415000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/657613?$ExtraLarge$');
INSERT INTO `products` VALUES (19, 'Gạch ốp tường MAXTOT MT3609D', 776000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484297?$ExtraLarge$');
INSERT INTO `products` VALUES (20, 'Gạch ốp tường MAXTOT MT3610', 161000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/496215?$ExtraLarge$');
INSERT INTO `products` VALUES (21, 'Gạch ốp tường MAXTOT MT3617', 887000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/650782?$ExtraLarge$');
INSERT INTO `products` VALUES (22, 'Gạch ốp tường MAXTOT MT3617D', 360000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/496182?$ExtraLarge$');
INSERT INTO `products` VALUES (23, 'Gạch ốp tường MAXTOT MT3618', 963000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/650852?$ExtraLarge$');
INSERT INTO `products` VALUES (24, 'Gạch ốp tường MAXTOT MT3619', 151000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/494248?$ExtraLarge$');
INSERT INTO `products` VALUES (25, 'Gạch ốp tường MAXTOT MT3619D', 141000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484594?$ExtraLarge$');
INSERT INTO `products` VALUES (26, 'Gạch ốp tường MAXTOT MT3620', 629000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/494434?$ExtraLarge$');
INSERT INTO `products` VALUES (27, 'Gạch ốp tường MAXTOT MT3621', 789000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484078?$ExtraLarge$');
INSERT INTO `products` VALUES (28, 'Gạch ốp tường MAXTOT MT3621D', 491000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484069?$ExtraLarge$');
INSERT INTO `products` VALUES (29, 'Gạch ốp tường MAXTOT MT3621V', 193000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/658656?$ExtraLarge$');
INSERT INTO `products` VALUES (30, 'Gạch ốp tường MAXTOT MT3623', 911000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484288?$ExtraLarge$');
INSERT INTO `products` VALUES (31, 'Gạch ốp tường MAXTOT MT3623D', 335000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484107?$ExtraLarge$');
INSERT INTO `products` VALUES (32, 'Gạch ốp tường MAXTOT MT3624', 299000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/655838?$ExtraLarge$');
INSERT INTO `products` VALUES (33, 'Gạch ốp tường MAXTOT MT4802', 324000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484361?$ExtraLarge$');
INSERT INTO `products` VALUES (34, 'Gạch ốp tường MAXTOT MT4802D', 433000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/681746?$ExtraLarge$');
INSERT INTO `products` VALUES (35, 'Gạch ốp tường MAXTOT MT4803', 734000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/681043?$ExtraLarge$');
INSERT INTO `products` VALUES (36, 'Gạch ốp tường MAXTOT MT4804', 952000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484287?$ExtraLarge$');
INSERT INTO `products` VALUES (37, 'Gạch ốp tường MAXTOT MT4804D', 384000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/650433?$ExtraLarge$');
INSERT INTO `products` VALUES (38, 'Gạch ốp tường MAXTOT MT4805', 457000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484019?$ExtraLarge$');
INSERT INTO `products` VALUES (39, 'Gạch lát sàn BAMBU BB66.1008', 622000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484359?$ExtraLarge$');
INSERT INTO `products` VALUES (40, 'Gạch lát sàn BAMBU BB66.1011', 379000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/658498?$ExtraLarge$');
INSERT INTO `products` VALUES (41, 'Gạch lát sàn BAMBU BB66.1014', 496000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'0', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/494440?$ExtraLarge$');
INSERT INTO `products` VALUES (42, 'Gạch lát sàn BAMBU BB66.1015', 972000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/441955?$ExtraLarge$');
INSERT INTO `products` VALUES (43, 'Gạch lát sàn BAMBU BB66.1016', 218000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484431?$ExtraLarge$');
INSERT INTO `products` VALUES (44, 'Gạch lát sàn BAMBU BB66.6003', 360000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/615826?$ExtraLarge$');
INSERT INTO `products` VALUES (45, 'Gạch lát sàn BAMBU BB66.6010', 719000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484038?$ExtraLarge$');
INSERT INTO `products` VALUES (46, 'Gạch lát sàn BAMBU BB66.6011', 197000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484285?$ExtraLarge$');
INSERT INTO `products` VALUES (47, 'Gạch lát sàn BAMBU BB66.6012', 643000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/615817?$ExtraLarge$');
INSERT INTO `products` VALUES (48, 'Gạch lát sàn BAMBU BB66.6013', 689000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484002?$ExtraLarge$');
INSERT INTO `products` VALUES (49, 'Gạch lát sàn BAMBU BB66.6014', 864000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
INSERT INTO `products` VALUES (50, 'Gạch lát sàn BAMBU BB66.6015', 309000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `products` VALUES (51, 'Gạch lát sàn BAMBU BB66.6017VT', 936000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `products` VALUES (52, 'Gạch lát sàn BAMBU BB66.6018VT', 959000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `products` VALUES (53, 'Gạch lát sàn BAMBU BB66.6019VT', 455000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `products` VALUES (54, 'Gạch lát sàn BAMBU BB66.6020VT', 564000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `products` VALUES (55, 'Gạch lát sàn BAMBU BB66.6021VT', 383000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `products` VALUES (56, 'Gạch lát sàn BAMBU BB88.6003', 230000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `products` VALUES (57, 'Gạch lát sàn BAMBU BB88.6006', 938000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `products` VALUES (58, 'Gạch lát sàn BAMBU BB88.6008', 788000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/681784?$ExtraLarge$');
INSERT INTO `products` VALUES (59, 'Gạch lát sàn BAMBU BB88.6012', 274000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `products` VALUES (60, 'Gạch lát sàn BAMBU BB88.6013', 972000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `products` VALUES (61, 'Gạch lát sàn BAMBU BB88.6014', 837000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `products` VALUES (62, 'Gạch lát sàn BAMBU BB88.6015', 383000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `products` VALUES (63, 'Gạch lát sàn BAMBU BB88.6017VT', 529000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484274?$ExtraLarge$');
INSERT INTO `products` VALUES (64, 'Gạch lát sàn BAMBU BB88.6018VT', 481000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/616100?$ExtraLarge$');
INSERT INTO `products` VALUES (65, 'Gạch lát sàn BAMBU BB88.6019VT', 125000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484216?$ExtraLarge$');
INSERT INTO `products` VALUES (66, 'Gạch lát sàn BAMBU BB88.6020VT', 255000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/657613?$ExtraLarge$');
INSERT INTO `products` VALUES (67, 'Gạch lát sàn BAMBU BB88.6021VT', 996000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484297?$ExtraLarge$');
INSERT INTO `products` VALUES (68, 'Gạch ốp tường BAMBU BB36.6001D', 114000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/496215?$ExtraLarge$');
INSERT INTO `products` VALUES (69, 'Gạch ốp tường BAMBU BB36.6001DE', 167000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/650782?$ExtraLarge$');
INSERT INTO `products` VALUES (70, 'Gạch ốp tường BAMBU BB36.6001L', 702000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/496182?$ExtraLarge$');
INSERT INTO `products` VALUES (71, 'Gạch ốp tường BAMBU BB36.6002D', 917000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/650852?$ExtraLarge$');
INSERT INTO `products` VALUES (72, 'Gạch ốp tường BAMBU BB36.6002DE', 104000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/494248?$ExtraLarge$');
INSERT INTO `products` VALUES (73, 'Gạch ốp tường BAMBU BB36.6002L', 529000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484594?$ExtraLarge$');
INSERT INTO `products` VALUES (74, 'Gạch ốp tường BAMBU BB36.6003D', 748000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/494434?$ExtraLarge$');
INSERT INTO `products` VALUES (75, 'Gạch ốp tường BAMBU BB36.6003DE', 723000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484078?$ExtraLarge$');
INSERT INTO `products` VALUES (76, 'Gạch ốp tường BAMBU BB36.6003L', 506000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484069?$ExtraLarge$');
INSERT INTO `products` VALUES (77, 'Gạch ốp tường BAMBU BB36.6004DE', 921000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/658656?$ExtraLarge$');
INSERT INTO `products` VALUES (78, 'Gạch ốp tường BAMBU BB36.6004L', 105000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484288?$ExtraLarge$');
INSERT INTO `products` VALUES (79, 'Gạch ốp tường BAMBU BB36.6004V', 177000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484107?$ExtraLarge$');
INSERT INTO `products` VALUES (80, 'Gạch lát sân vườn FAMITO F503', 379000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/655838?$ExtraLarge$');
INSERT INTO `products` VALUES (81, 'Gạch lát sân vườn FAMITO F504', 272000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/484361?$ExtraLarge$');
INSERT INTO `products` VALUES (82, 'Gạch lát sân vườn FAMITO F505', 875000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/681746?$ExtraLarge$');
INSERT INTO `products` VALUES (83, 'Gạch lát sân vườn FAMITO F506', 692000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/681043?$ExtraLarge$');
INSERT INTO `products` VALUES (84, 'Gạch men sân vườn FAMITO F502', 833000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/484287?$ExtraLarge$');
INSERT INTO `products` VALUES (85, 'Gạch lát nền granite cao cấp IVICASA GA-P66001 600×600', 113000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/650433?$ExtraLarge$');
INSERT INTO `products` VALUES (86, 'Gạch lát nền granite cao cấp IVICASA GA-P66002 600×600', 616000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/484019?$ExtraLarge$');
INSERT INTO `products` VALUES (87, 'Gạch lát nền granite cao cấp IVICASA GA-P66003 600×600', 495000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/484359?$ExtraLarge$');
INSERT INTO `products` VALUES (88, 'Gạch lát nền granite cao cấp IVICASA GA-P66004 600×600', 355000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/658498?$ExtraLarge$');
INSERT INTO `products` VALUES (89, 'Gạch lát nền granite cao cấp IVICASA GA-P66005 600×600', 905000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/494440?$ExtraLarge$');
INSERT INTO `products` VALUES (90, 'Gạch lát nền granite cao cấp IVICASA GA-P66006 600×600', 949000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/441955?$ExtraLarge$');
INSERT INTO `products` VALUES (91, 'Gạch lát nền granite cao cấp IVICASA GA-P66007 600×600', 651000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/484431?$ExtraLarge$');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `UserID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Rating` int NULL DEFAULT NULL,
  `ReviewText` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ReviewDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderID` int NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`, `ProductID`) USING BTREE,
  INDEX `fk_productid_review`(`ProductID` ASC) USING BTREE,
  CONSTRAINT `fk_productid_review` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userid_review` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (8, 2, 0, 'fdsgsdf', '2024-12-23 16:06:19', 1);
INSERT INTO `review` VALUES (8, 3, 0, 'fsdfkjgdf', '2024-12-23 16:00:35', 1);
INSERT INTO `review` VALUES (8, 10, 3, 'fdsgdfsf', '2024-12-23 16:22:28', 1);
INSERT INTO `review` VALUES (8, 14, 0, 'fdsfsd', '2024-12-23 16:26:06', 1);
INSERT INTO `review` VALUES (8, 22, 0, 'fkjdklgjklsjflksad', '2024-12-23 15:57:24', 1);
INSERT INTO `review` VALUES (8, 45, 5, 'Hello mấy cưng', '2025-02-18 15:49:57', 1);
INSERT INTO `review` VALUES (8, 47, 4, 'Hom nay an gi', '2024-12-24 09:31:48', 1);
INSERT INTO `review` VALUES (8, 48, 3, 'Hôm nay chơi gi đây', '2024-12-24 09:33:32', 1);
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
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES (1, '500×500 mm');
INSERT INTO `size` VALUES (2, '300×600 mm');
INSERT INTO `size` VALUES (3, '400×800 mm');
INSERT INTO `size` VALUES (4, '600×600 mm');
INSERT INTO `size` VALUES (5, '800×800 mm');

-- ----------------------------
-- Table structure for spectype
-- ----------------------------
DROP TABLE IF EXISTS `spectype`;
CREATE TABLE `spectype`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `ID` int NOT NULL,
  `StoreName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Latitude` decimal(8, 2) NULL DEFAULT NULL,
  `Longitude` decimal(8, 2) NULL DEFAULT NULL,
  `StorePhone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `WorkingTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stores
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birthtime` datetime NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` int NULL DEFAULT 0,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `check_email_unique`(`email` ASC) USING BTREE COMMENT 'email da ton tai'
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'Anh Nguyên', 'com@gamil.com', '0213432', NULL, NULL, '2024-12-24 16:20:47', b'1', '2024-12-15 16:55:20', '', 1, '123', 1);
INSERT INTO `users` VALUES (3, 'Trang Trang', 'com1@gamil.com', '0213432', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', NULL, '2024-12-10 16:20:54', b'1', '2024-12-15 17:08:26', '', 0, '123', 1);
INSERT INTO `users` VALUES (4, 'Trương Diếm', 'com3@gamil.com', '0213432', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', NULL, '2024-12-04 16:20:58', b'1', '2024-12-15 17:08:36', '', 0, '123', 1);
INSERT INTO `users` VALUES (5, 'phuc', 'com4@gamil.com', '0213432', NULL, NULL, '2024-12-11 16:21:03', b'1', '2024-12-14 16:21:11', '', 0, '123', 0);
INSERT INTO `users` VALUES (6, 'Ngân cuti', 'ngan@gmail.com', '0376272024', NULL, 'bình định', '2025-02-06 14:23:42', b'1', '2025-02-12 14:23:30', NULL, 0, 'N123456789', 0);
INSERT INTO `users` VALUES (7, 'Phạm Tài', 'tai@gmail.com', '022222222', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', 'bình định', '2025-02-21 14:23:47', b'1', '2025-02-20 14:23:36', NULL, 0, 'T123456789', 0);
INSERT INTO `users` VALUES (8, 'Ta Phuc', 'taphuc@gmail.com', '0987991500', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', 'hehe', '2004-01-05 00:00:00', b'1', '2024-12-19 13:29:11', '33c0274c7ee944c97cc2c34fc1e87348', 1, '4b279089002036e38b16247faeb2827c54db0fd43497e5f1d3eb3693cbf317a2', 0);
INSERT INTO `users` VALUES (9, 'Ngân cuti', 'nguyenhaisuper8@gmail.com', '0376272024', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', 'bình định', '2024-12-14 00:00:00', b'1', '2024-12-20 12:19:21', 'ee38298a3ab54677f47c7b689c6dfc1f', 1, '2575028f1907c8395603908a280207c043d751b3275291733360c1e0cc1214bc', 0);
INSERT INTO `users` VALUES (10, 'bgfbfgb', 'a@gmail.com', '0987991500', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', 'cdcsdc', '2024-12-12 00:00:00', b'1', '2024-12-21 02:07:40', 'b46b671d8db9754dbcb140308c35c7a4', 0, '635b4fc85439b34a75b0b7615f27391b11b78e084ab3789ea0e880e3b5212b5b', 0);
INSERT INTO `users` VALUES (11, 'j  b hbhui', 'z@gmail.com', '05151858', NULL, ' m cvxnm cbkvjx', '2024-12-13 00:00:00', b'1', '2024-12-23 15:19:37', '0da9145129e9a98efbbecdbad093bcd1', 0, '16a8ab548b3e5447ae7778102de303f9bf282b5b02bed252a2979e8ba4efa320', 1);
INSERT INTO `users` VALUES (12, 'heloo', 'com100@gmail.com', '0376272029', NULL, 'bfgbfgfgfg', '2024-12-06 00:00:00', b'1', '2024-12-23 15:26:57', 'e14f42825c897b2935c5417235e57521', 0, 'f0dae3464cc3f20b18c19753542e7bf51dac56073dfd824fadd1eb90d269384f', 1);
INSERT INTO `users` VALUES (13, 'Ta Phuc', 'ta@gmail.com', '4234234', NULL, '324234', '2024-12-19 00:00:00', b'1', '2024-12-23 15:38:09', '67e5e5b13e8f60044d09e4e83782ac48', 0, '20c0a121f2c72afe8198637b67647dfb05da7c5edb94eb27fb528f56768cde6d', 1);

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `DiscountValue` decimal(18, 2) NULL DEFAULT NULL,
  `ExpireDate` datetime NULL DEFAULT NULL,
  `IsActive` bit(1) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
INSERT INTO `vouchers` VALUES (1, '200K', 200000.00, '2025-02-20 00:00:00', b'1', '2025-02-18 15:40:36');
INSERT INTO `vouchers` VALUES (2, '300K', 300000.00, '2025-02-28 12:00:00', b'1', '2025-02-23 05:24:21');

-- ----------------------------
-- Table structure for voucherusage
-- ----------------------------
DROP TABLE IF EXISTS `voucherusage`;
CREATE TABLE `voucherusage`  (
  `VoucherID` int NOT NULL,
  `UserID` int NOT NULL,
  `OrderID` int NULL DEFAULT NULL,
  `UsageDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`VoucherID`, `UserID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucherusage
-- ----------------------------
INSERT INTO `voucherusage` VALUES (1, 8, 2, '2025-02-24 21:30:26');

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 21/03/2025 16:39:58
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'GẠCH LÁT SÀN', b'1', '2024-12-24 09:16:14');
INSERT INTO `category` VALUES (2, 'GẠCH ỐP TƯỜNG', b'1', '2024-12-24 09:12:43');
INSERT INTO `category` VALUES (4, 'Gạch Hay', b'1', '2025-03-19 08:09:55');

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
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userid` int NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `beforedata` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `afterdata` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 'alert', 17, NULL, 'Đăng nhập', 'Người dùng này đã có trong cơ sở dữ liệu', 'Người dùng này đã có trong cơ sở dữ liệu');

-- ----------------------------
-- Table structure for manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES (1, 'MAXTOT', b'1');
INSERT INTO `manufacturer` VALUES (2, 'BAMBU', b'1');
INSERT INTO `manufacturer` VALUES (3, 'FAMITO', b'1');
INSERT INTO `manufacturer` VALUES (4, 'IVICASA', b'1');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, 'Men Sugar mịn', b'1');
INSERT INTO `material` VALUES (2, 'Men bóng', b'1');
INSERT INTO `material` VALUES (3, 'Glossy', b'1');
INSERT INTO `material` VALUES (4, 'Sugar', b'1');
INSERT INTO `material` VALUES (5, 'Men vi tinh', b'1');
INSERT INTO `material` VALUES (6, 'Mài bóng', b'1');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NULL DEFAULT NULL,
  `Price` decimal(18, 2) NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `Color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_productid_orderdetail`(`ProductID` ASC) USING BTREE,
  INDEX `fk_orderid_orderdetail`(`OrderID` ASC) USING BTREE,
  CONSTRAINT `fk_orderid_orderdetail` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_productid_orderdetail` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (13, 14, 1, 1, 124000.00, '2025-03-12 10:43:20', 'Đỏ');
INSERT INTO `orderdetail` VALUES (14, 14, 2, 1, 372000.00, '2025-03-12 10:43:20', 'Đỏ');
INSERT INTO `orderdetail` VALUES (15, 15, 1, 1, 124000.00, '2025-03-20 09:01:13', 'Đỏ');
INSERT INTO `orderdetail` VALUES (16, 16, 1, 1, 124000.00, '2025-03-21 09:16:53', 'Đỏ');
INSERT INTO `orderdetail` VALUES (17, 17, 2, 1, 372000.00, '2025-03-21 09:21:38', 'Đỏ');
INSERT INTO `orderdetail` VALUES (18, 18, 1, 1, 124000.00, '2025-03-21 09:30:10', 'Đỏ');
INSERT INTO `orderdetail` VALUES (19, 19, 1, 1, 124000.00, '2025-03-21 09:37:34', 'Đỏ');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NULL DEFAULT NULL,
  `OrderDate` datetime NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Status` enum('Delivered','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Delivered',
  `TotalPrice` decimal(18, 2) NULL DEFAULT NULL,
  `Des` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `FullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Payment` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 8, '2025-02-24 21:25:30', 'dsfsd', 'Delivered', 0.00, 'sadf', '2025-02-24 14:25:42', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');
INSERT INTO `orders` VALUES (2, 8, '2025-02-24 21:30:05', 'dsfsd', 'Delivered', 0.00, 'sadf', '2025-02-24 14:29:58', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');
INSERT INTO `orders` VALUES (3, 14, '2025-02-26 10:16:48', 'Ninh hòa', 'Delivered', 172000.00, 'alo', '2025-02-26 03:15:04', 'lê tuấn phát', 'ltphat240103@gmail.com', '123131312213', 'COD');
INSERT INTO `orders` VALUES (4, 15, '2025-02-26 14:42:19', 'Thôn Chánh Tường, Xã Mỹ Thọ, huyện Phù Mỹ, tỉnh Bình Định', 'Delivered', 0.00, 'giao nhanh', '2025-02-26 07:42:18', 'Đặng Anh Nguyên', 'nguyenhaisuper6@gmail.com', '0376272024', 'COD');
INSERT INTO `orders` VALUES (5, 15, '2025-02-26 14:57:08', 'vdvd', 'Delivered', 10000.00, 'dsswdcs', '2025-02-26 07:56:35', 'dfvdvgd', 'nguyenhaisuper6@gmail.com', '0376272024', 'COD');
INSERT INTO `orders` VALUES (9, 9, '2025-02-26 22:20:04', 'Đồng Nai', 'Cancelled', 0.00, 'Đến nhà gọi em', '2025-02-26 15:20:16', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');
INSERT INTO `orders` VALUES (10, 16, '2025-03-07 21:28:51', 'Đồng Nai', NULL, 124000.00, 'Tơi nhớ gọi', '2025-03-07 14:28:47', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');
INSERT INTO `orders` VALUES (11, 16, '2025-03-12 16:09:55', 'Đồng Nai', NULL, 372000.00, 'fds', '2025-03-12 09:07:56', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');
INSERT INTO `orders` VALUES (12, 16, '2025-03-12 16:22:34', 'Đồng Nai', 'Delivered', 372000.00, 'sdf', '2025-03-12 09:20:30', 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'COD');
INSERT INTO `orders` VALUES (13, 9, NULL, NULL, 'Delivered', NULL, NULL, '2025-03-12 09:31:04', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (14, 9, '2025-03-12 17:43:20', 'bình định', 'Delivered', 496000.00, 'kvjhfbdjnvksf', '2025-03-12 10:43:19', 'Ngân cuti', 'nguyenhaisuper8@gmail.com', '0376272024', 'COD');
INSERT INTO `orders` VALUES (15, 19, '2025-03-20 16:03:27', 'Ninh hòa', 'Delivered', 124000.00, 'cmm', '2025-03-20 09:01:13', 'Lê Tuấn Phát', '21129858@st.hcmuaf.edu.vn', '0935822991', 'COD');
INSERT INTO `orders` VALUES (16, 17, '2025-03-21 16:19:08', 'Ninh Hoaf', 'Delivered', 124000.00, '', '2025-03-21 09:16:53', 'lê tuấn phát', 'ltphat240103@gmail.com', '0935822771', 'COD');
INSERT INTO `orders` VALUES (17, 17, '2025-03-21 16:23:53', 'Ninh Hoaf', 'Delivered', 372000.00, '', '2025-03-21 09:21:38', 'lê tuấn phát', 'ltphat240103@gmail.com', '0935822771', 'COD');
INSERT INTO `orders` VALUES (18, 17, '2025-03-21 16:32:26', 'Ninh Hoaf', 'Delivered', 124000.00, '', '2025-03-21 09:30:10', 'lê tuấn phát', 'ltphat240103@gmail.com', '0935822771', 'COD');
INSERT INTO `orders` VALUES (19, 17, '2025-03-21 16:39:35', 'Ninh Hoaf', 'Delivered', 124000.00, '', '2025-03-21 09:37:23', 'lê tuấn phát', 'ltphat240103@gmail.com', '0935822771', 'COD');

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
INSERT INTO `product_spec` VALUES (91, 5, 'ICAVASA');
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
) ENGINE = InnoDB AUTO_INCREMENT = 1999 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `product_view` VALUES (231, 1, '2025-02-24 15:22:44');
INSERT INTO `product_view` VALUES (232, 40, '2025-02-24 15:22:53');
INSERT INTO `product_view` VALUES (233, 40, '2025-02-24 15:22:53');
INSERT INTO `product_view` VALUES (234, 39, '2025-02-24 15:27:39');
INSERT INTO `product_view` VALUES (235, 39, '2025-02-24 15:27:40');
INSERT INTO `product_view` VALUES (236, 39, '2025-02-24 15:30:40');
INSERT INTO `product_view` VALUES (237, 39, '2025-02-24 15:30:40');
INSERT INTO `product_view` VALUES (238, 39, '2025-02-24 15:30:45');
INSERT INTO `product_view` VALUES (239, 39, '2025-02-24 15:30:45');
INSERT INTO `product_view` VALUES (240, 39, '2025-02-24 16:08:28');
INSERT INTO `product_view` VALUES (241, 39, '2025-02-24 16:08:28');
INSERT INTO `product_view` VALUES (242, 1, '2025-02-24 18:53:45');
INSERT INTO `product_view` VALUES (243, 39, '2025-02-25 00:25:56');
INSERT INTO `product_view` VALUES (244, 40, '2025-02-25 00:35:59');
INSERT INTO `product_view` VALUES (245, 42, '2025-02-25 00:43:45');
INSERT INTO `product_view` VALUES (246, 44, '2025-02-25 00:55:45');
INSERT INTO `product_view` VALUES (247, 45, '2025-02-25 01:00:29');
INSERT INTO `product_view` VALUES (248, 46, '2025-02-25 01:09:33');
INSERT INTO `product_view` VALUES (249, 47, '2025-02-25 01:22:47');
INSERT INTO `product_view` VALUES (250, 49, '2025-02-25 01:31:33');
INSERT INTO `product_view` VALUES (251, 53, '2025-02-25 01:44:18');
INSERT INTO `product_view` VALUES (252, 57, '2025-02-25 01:51:22');
INSERT INTO `product_view` VALUES (253, 48, '2025-02-25 01:59:30');
INSERT INTO `product_view` VALUES (254, 51, '2025-02-25 02:09:39');
INSERT INTO `product_view` VALUES (255, 52, '2025-02-25 02:20:19');
INSERT INTO `product_view` VALUES (256, 55, '2025-02-25 02:28:32');
INSERT INTO `product_view` VALUES (257, 56, '2025-02-25 02:42:51');
INSERT INTO `product_view` VALUES (258, 39, '2025-02-25 06:41:59');
INSERT INTO `product_view` VALUES (259, 1, '2025-02-25 08:20:28');
INSERT INTO `product_view` VALUES (260, 40, '2025-02-25 15:55:07');
INSERT INTO `product_view` VALUES (261, 42, '2025-02-25 16:48:34');
INSERT INTO `product_view` VALUES (262, 45, '2025-02-25 16:56:50');
INSERT INTO `product_view` VALUES (263, 39, '2025-02-25 17:23:22');
INSERT INTO `product_view` VALUES (264, 41, '2025-02-25 17:34:29');
INSERT INTO `product_view` VALUES (265, 43, '2025-02-25 17:44:42');
INSERT INTO `product_view` VALUES (266, 1, '2025-02-26 00:27:56');
INSERT INTO `product_view` VALUES (267, 2, '2025-02-26 00:28:02');
INSERT INTO `product_view` VALUES (268, 3, '2025-02-26 00:28:06');
INSERT INTO `product_view` VALUES (269, 4, '2025-02-26 00:28:12');
INSERT INTO `product_view` VALUES (270, 5, '2025-02-26 00:28:15');
INSERT INTO `product_view` VALUES (271, 6, '2025-02-26 00:28:19');
INSERT INTO `product_view` VALUES (272, 7, '2025-02-26 00:28:25');
INSERT INTO `product_view` VALUES (273, 8, '2025-02-26 00:28:27');
INSERT INTO `product_view` VALUES (274, 9, '2025-02-26 00:28:30');
INSERT INTO `product_view` VALUES (275, 10, '2025-02-26 00:28:35');
INSERT INTO `product_view` VALUES (276, 11, '2025-02-26 00:28:40');
INSERT INTO `product_view` VALUES (277, 12, '2025-02-26 00:28:44');
INSERT INTO `product_view` VALUES (278, 13, '2025-02-26 00:28:48');
INSERT INTO `product_view` VALUES (279, 14, '2025-02-26 00:28:50');
INSERT INTO `product_view` VALUES (280, 15, '2025-02-26 00:28:54');
INSERT INTO `product_view` VALUES (281, 16, '2025-02-26 00:29:00');
INSERT INTO `product_view` VALUES (282, 17, '2025-02-26 00:29:04');
INSERT INTO `product_view` VALUES (283, 18, '2025-02-26 00:29:06');
INSERT INTO `product_view` VALUES (284, 20, '2025-02-26 00:29:15');
INSERT INTO `product_view` VALUES (285, 19, '2025-02-26 00:29:18');
INSERT INTO `product_view` VALUES (286, 21, '2025-02-26 00:29:21');
INSERT INTO `product_view` VALUES (287, 22, '2025-02-26 00:29:23');
INSERT INTO `product_view` VALUES (288, 23, '2025-02-26 00:29:28');
INSERT INTO `product_view` VALUES (289, 24, '2025-02-26 00:29:30');
INSERT INTO `product_view` VALUES (290, 25, '2025-02-26 00:29:36');
INSERT INTO `product_view` VALUES (291, 26, '2025-02-26 00:29:39');
INSERT INTO `product_view` VALUES (292, 27, '2025-02-26 00:29:42');
INSERT INTO `product_view` VALUES (293, 28, '2025-02-26 00:29:47');
INSERT INTO `product_view` VALUES (294, 29, '2025-02-26 00:29:51');
INSERT INTO `product_view` VALUES (295, 30, '2025-02-26 00:29:53');
INSERT INTO `product_view` VALUES (296, 31, '2025-02-26 00:30:01');
INSERT INTO `product_view` VALUES (297, 32, '2025-02-26 00:30:03');
INSERT INTO `product_view` VALUES (298, 33, '2025-02-26 00:30:08');
INSERT INTO `product_view` VALUES (299, 34, '2025-02-26 00:30:11');
INSERT INTO `product_view` VALUES (300, 35, '2025-02-26 00:30:14');
INSERT INTO `product_view` VALUES (301, 36, '2025-02-26 00:30:17');
INSERT INTO `product_view` VALUES (302, 37, '2025-02-26 00:30:21');
INSERT INTO `product_view` VALUES (303, 38, '2025-02-26 00:30:26');
INSERT INTO `product_view` VALUES (304, 39, '2025-02-26 00:30:31');
INSERT INTO `product_view` VALUES (305, 40, '2025-02-26 00:30:36');
INSERT INTO `product_view` VALUES (306, 41, '2025-02-26 00:30:44');
INSERT INTO `product_view` VALUES (307, 42, '2025-02-26 00:30:47');
INSERT INTO `product_view` VALUES (308, 43, '2025-02-26 00:30:49');
INSERT INTO `product_view` VALUES (309, 44, '2025-02-26 00:30:53');
INSERT INTO `product_view` VALUES (310, 45, '2025-02-26 00:30:57');
INSERT INTO `product_view` VALUES (311, 46, '2025-02-26 00:31:02');
INSERT INTO `product_view` VALUES (312, 47, '2025-02-26 00:31:05');
INSERT INTO `product_view` VALUES (313, 48, '2025-02-26 00:31:09');
INSERT INTO `product_view` VALUES (314, 49, '2025-02-26 00:31:14');
INSERT INTO `product_view` VALUES (315, 51, '2025-02-26 00:31:20');
INSERT INTO `product_view` VALUES (316, 50, '2025-02-26 00:31:21');
INSERT INTO `product_view` VALUES (317, 52, '2025-02-26 00:31:27');
INSERT INTO `product_view` VALUES (318, 53, '2025-02-26 00:31:29');
INSERT INTO `product_view` VALUES (319, 54, '2025-02-26 00:31:33');
INSERT INTO `product_view` VALUES (320, 55, '2025-02-26 00:31:38');
INSERT INTO `product_view` VALUES (321, 56, '2025-02-26 00:31:41');
INSERT INTO `product_view` VALUES (322, 57, '2025-02-26 00:31:45');
INSERT INTO `product_view` VALUES (323, 58, '2025-02-26 00:31:51');
INSERT INTO `product_view` VALUES (324, 59, '2025-02-26 00:31:53');
INSERT INTO `product_view` VALUES (325, 60, '2025-02-26 00:31:59');
INSERT INTO `product_view` VALUES (326, 61, '2025-02-26 00:32:01');
INSERT INTO `product_view` VALUES (327, 62, '2025-02-26 00:32:05');
INSERT INTO `product_view` VALUES (328, 63, '2025-02-26 00:32:12');
INSERT INTO `product_view` VALUES (329, 64, '2025-02-26 00:32:13');
INSERT INTO `product_view` VALUES (330, 65, '2025-02-26 00:32:17');
INSERT INTO `product_view` VALUES (331, 66, '2025-02-26 00:32:23');
INSERT INTO `product_view` VALUES (332, 67, '2025-02-26 00:32:25');
INSERT INTO `product_view` VALUES (333, 68, '2025-02-26 00:32:29');
INSERT INTO `product_view` VALUES (334, 69, '2025-02-26 00:32:33');
INSERT INTO `product_view` VALUES (335, 70, '2025-02-26 00:32:37');
INSERT INTO `product_view` VALUES (336, 71, '2025-02-26 00:32:41');
INSERT INTO `product_view` VALUES (337, 72, '2025-02-26 00:32:45');
INSERT INTO `product_view` VALUES (338, 73, '2025-02-26 00:32:50');
INSERT INTO `product_view` VALUES (339, 74, '2025-02-26 00:32:52');
INSERT INTO `product_view` VALUES (340, 75, '2025-02-26 00:32:57');
INSERT INTO `product_view` VALUES (341, 76, '2025-02-26 00:33:01');
INSERT INTO `product_view` VALUES (342, 77, '2025-02-26 00:33:06');
INSERT INTO `product_view` VALUES (343, 78, '2025-02-26 00:33:09');
INSERT INTO `product_view` VALUES (344, 79, '2025-02-26 00:33:13');
INSERT INTO `product_view` VALUES (345, 1, '2025-02-26 02:22:46');
INSERT INTO `product_view` VALUES (346, 3, '2025-02-26 03:01:50');
INSERT INTO `product_view` VALUES (347, 39, '2025-02-26 03:09:08');
INSERT INTO `product_view` VALUES (348, 40, '2025-02-26 03:09:18');
INSERT INTO `product_view` VALUES (349, 39, '2025-02-26 03:09:19');
INSERT INTO `product_view` VALUES (350, 1, '2025-02-26 03:09:33');
INSERT INTO `product_view` VALUES (351, 40, '2025-02-26 03:32:11');
INSERT INTO `product_view` VALUES (352, 39, '2025-02-26 03:39:09');
INSERT INTO `product_view` VALUES (353, 2, '2025-02-26 03:42:52');
INSERT INTO `product_view` VALUES (354, 39, '2025-02-26 03:44:19');
INSERT INTO `product_view` VALUES (355, 1, '2025-02-26 03:51:06');
INSERT INTO `product_view` VALUES (356, 2, '2025-02-26 03:52:02');
INSERT INTO `product_view` VALUES (357, 39, '2025-02-26 03:54:05');
INSERT INTO `product_view` VALUES (358, 1, '2025-02-26 03:54:24');
INSERT INTO `product_view` VALUES (359, 13, '2025-02-26 03:57:52');
INSERT INTO `product_view` VALUES (360, 1, '2025-02-26 04:59:20');
INSERT INTO `product_view` VALUES (361, 1, '2025-02-26 04:59:29');
INSERT INTO `product_view` VALUES (362, 1, '2025-02-26 05:10:36');
INSERT INTO `product_view` VALUES (363, 1, '2025-02-26 05:10:47');
INSERT INTO `product_view` VALUES (364, 1, '2025-02-26 05:12:40');
INSERT INTO `product_view` VALUES (365, 1, '2025-02-26 05:13:10');
INSERT INTO `product_view` VALUES (366, 1, '2025-02-26 05:13:41');
INSERT INTO `product_view` VALUES (367, 1, '2025-02-26 05:16:25');
INSERT INTO `product_view` VALUES (368, 1, '2025-02-26 05:16:33');
INSERT INTO `product_view` VALUES (369, 1, '2025-02-26 05:17:19');
INSERT INTO `product_view` VALUES (370, 1, '2025-02-26 05:17:55');
INSERT INTO `product_view` VALUES (371, 1, '2025-02-26 05:18:16');
INSERT INTO `product_view` VALUES (372, 1, '2025-02-26 05:18:22');
INSERT INTO `product_view` VALUES (373, 1, '2025-02-26 05:18:48');
INSERT INTO `product_view` VALUES (374, 1, '2025-02-26 05:18:57');
INSERT INTO `product_view` VALUES (375, 1, '2025-02-26 05:19:35');
INSERT INTO `product_view` VALUES (376, 1, '2025-02-26 05:19:46');
INSERT INTO `product_view` VALUES (377, 1, '2025-02-26 05:20:14');
INSERT INTO `product_view` VALUES (378, 1, '2025-02-26 05:22:20');
INSERT INTO `product_view` VALUES (379, 26, '2025-02-26 05:22:21');
INSERT INTO `product_view` VALUES (380, 17, '2025-02-26 05:22:29');
INSERT INTO `product_view` VALUES (381, 31, '2025-02-26 05:22:37');
INSERT INTO `product_view` VALUES (382, 13, '2025-02-26 05:22:45');
INSERT INTO `product_view` VALUES (383, 23, '2025-02-26 05:22:52');
INSERT INTO `product_view` VALUES (384, 1, '2025-02-26 05:22:59');
INSERT INTO `product_view` VALUES (385, 38, '2025-02-26 05:23:00');
INSERT INTO `product_view` VALUES (386, 25, '2025-02-26 05:23:08');
INSERT INTO `product_view` VALUES (387, 1, '2025-02-26 05:23:28');
INSERT INTO `product_view` VALUES (388, 1, '2025-02-26 05:23:55');
INSERT INTO `product_view` VALUES (389, 1, '2025-02-26 05:24:25');
INSERT INTO `product_view` VALUES (390, 15, '2025-02-26 05:24:41');
INSERT INTO `product_view` VALUES (391, 29, '2025-02-26 05:24:48');
INSERT INTO `product_view` VALUES (392, 35, '2025-02-26 05:24:55');
INSERT INTO `product_view` VALUES (393, 11, '2025-02-26 05:25:02');
INSERT INTO `product_view` VALUES (394, 16, '2025-02-26 05:25:09');
INSERT INTO `product_view` VALUES (395, 28, '2025-02-26 05:25:16');
INSERT INTO `product_view` VALUES (396, 1, '2025-02-26 05:25:21');
INSERT INTO `product_view` VALUES (397, 12, '2025-02-26 05:25:24');
INSERT INTO `product_view` VALUES (398, 1, '2025-02-26 05:26:24');
INSERT INTO `product_view` VALUES (399, 1, '2025-02-26 05:26:47');
INSERT INTO `product_view` VALUES (400, 24, '2025-02-26 05:27:05');
INSERT INTO `product_view` VALUES (401, 37, '2025-02-26 05:27:13');
INSERT INTO `product_view` VALUES (402, 34, '2025-02-26 05:27:20');
INSERT INTO `product_view` VALUES (403, 36, '2025-02-26 05:27:27');
INSERT INTO `product_view` VALUES (404, 20, '2025-02-26 05:27:34');
INSERT INTO `product_view` VALUES (405, 1, '2025-02-26 05:27:35');
INSERT INTO `product_view` VALUES (406, 19, '2025-02-26 05:27:42');
INSERT INTO `product_view` VALUES (407, 30, '2025-02-26 05:27:49');
INSERT INTO `product_view` VALUES (408, 18, '2025-02-26 05:27:56');
INSERT INTO `product_view` VALUES (409, 21, '2025-02-26 05:29:12');
INSERT INTO `product_view` VALUES (410, 33, '2025-02-26 05:29:18');
INSERT INTO `product_view` VALUES (411, 32, '2025-02-26 05:29:25');
INSERT INTO `product_view` VALUES (412, 10, '2025-02-26 05:29:32');
INSERT INTO `product_view` VALUES (413, 27, '2025-02-26 05:29:39');
INSERT INTO `product_view` VALUES (414, 14, '2025-02-26 05:29:46');
INSERT INTO `product_view` VALUES (415, 1, '2025-02-26 05:30:01');
INSERT INTO `product_view` VALUES (416, 1, '2025-02-26 05:30:25');
INSERT INTO `product_view` VALUES (417, 22, '2025-02-26 05:30:58');
INSERT INTO `product_view` VALUES (418, 1, '2025-02-26 05:31:30');
INSERT INTO `product_view` VALUES (419, 1, '2025-02-26 05:31:40');
INSERT INTO `product_view` VALUES (420, 1, '2025-02-26 05:32:09');
INSERT INTO `product_view` VALUES (421, 1, '2025-02-26 05:32:29');
INSERT INTO `product_view` VALUES (422, 1, '2025-02-26 05:33:17');
INSERT INTO `product_view` VALUES (423, 1, '2025-02-26 05:33:29');
INSERT INTO `product_view` VALUES (424, 1, '2025-02-26 05:33:40');
INSERT INTO `product_view` VALUES (425, 6, '2025-02-26 05:37:31');
INSERT INTO `product_view` VALUES (426, 4, '2025-02-26 05:37:37');
INSERT INTO `product_view` VALUES (427, 7, '2025-02-26 05:37:42');
INSERT INTO `product_view` VALUES (428, 3, '2025-02-26 05:37:48');
INSERT INTO `product_view` VALUES (429, 9, '2025-02-26 05:37:55');
INSERT INTO `product_view` VALUES (430, 8, '2025-02-26 05:38:01');
INSERT INTO `product_view` VALUES (431, 2, '2025-02-26 05:38:07');
INSERT INTO `product_view` VALUES (432, 5, '2025-02-26 05:39:53');
INSERT INTO `product_view` VALUES (433, 1, '2025-02-26 06:01:05');
INSERT INTO `product_view` VALUES (434, 3, '2025-02-26 06:01:38');
INSERT INTO `product_view` VALUES (435, 39, '2025-02-26 06:04:25');
INSERT INTO `product_view` VALUES (436, 1, '2025-02-26 06:04:31');
INSERT INTO `product_view` VALUES (437, 1, '2025-02-26 06:05:16');
INSERT INTO `product_view` VALUES (438, 1, '2025-02-26 06:06:41');
INSERT INTO `product_view` VALUES (439, 2, '2025-02-26 06:06:46');
INSERT INTO `product_view` VALUES (440, 2, '2025-02-26 06:07:24');
INSERT INTO `product_view` VALUES (441, 1, '2025-02-26 06:07:31');
INSERT INTO `product_view` VALUES (442, 3, '2025-02-26 06:07:40');
INSERT INTO `product_view` VALUES (443, 1, '2025-02-26 06:07:59');
INSERT INTO `product_view` VALUES (444, 5, '2025-02-26 06:08:04');
INSERT INTO `product_view` VALUES (445, 1, '2025-02-26 06:08:24');
INSERT INTO `product_view` VALUES (446, 1, '2025-02-26 06:11:26');
INSERT INTO `product_view` VALUES (447, 1, '2025-02-26 06:13:10');
INSERT INTO `product_view` VALUES (448, 1, '2025-02-26 06:13:29');
INSERT INTO `product_view` VALUES (449, 1, '2025-02-26 06:13:58');
INSERT INTO `product_view` VALUES (450, 1, '2025-02-26 06:14:27');
INSERT INTO `product_view` VALUES (451, 1, '2025-02-26 06:15:17');
INSERT INTO `product_view` VALUES (452, 1, '2025-02-26 06:17:20');
INSERT INTO `product_view` VALUES (453, 1, '2025-02-26 06:21:56');
INSERT INTO `product_view` VALUES (454, 1, '2025-02-26 06:22:14');
INSERT INTO `product_view` VALUES (455, 1, '2025-02-26 06:22:14');
INSERT INTO `product_view` VALUES (456, 1, '2025-02-26 06:22:14');
INSERT INTO `product_view` VALUES (457, 40, '2025-02-26 06:44:16');
INSERT INTO `product_view` VALUES (458, 2, '2025-02-26 06:44:21');
INSERT INTO `product_view` VALUES (459, 1, '2025-02-26 06:48:41');
INSERT INTO `product_view` VALUES (460, 2, '2025-02-26 07:02:25');
INSERT INTO `product_view` VALUES (461, 4, '2025-02-26 07:02:37');
INSERT INTO `product_view` VALUES (462, 7, '2025-02-26 07:02:52');
INSERT INTO `product_view` VALUES (463, 7, '2025-02-26 07:04:17');
INSERT INTO `product_view` VALUES (464, 7, '2025-02-26 07:05:10');
INSERT INTO `product_view` VALUES (465, 7, '2025-02-26 07:06:30');
INSERT INTO `product_view` VALUES (466, 7, '2025-02-26 07:06:53');
INSERT INTO `product_view` VALUES (467, 7, '2025-02-26 07:06:54');
INSERT INTO `product_view` VALUES (468, 7, '2025-02-26 07:07:18');
INSERT INTO `product_view` VALUES (469, 7, '2025-02-26 07:08:23');
INSERT INTO `product_view` VALUES (470, 7, '2025-02-26 07:08:57');
INSERT INTO `product_view` VALUES (471, 4, '2025-02-26 07:09:00');
INSERT INTO `product_view` VALUES (472, 5, '2025-02-26 07:09:11');
INSERT INTO `product_view` VALUES (473, 4, '2025-02-26 07:09:17');
INSERT INTO `product_view` VALUES (474, 1, '2025-02-26 07:41:21');
INSERT INTO `product_view` VALUES (475, 1, '2025-02-26 07:53:44');
INSERT INTO `product_view` VALUES (476, 1, '2025-02-26 07:59:15');
INSERT INTO `product_view` VALUES (477, 1, '2025-02-26 07:59:35');
INSERT INTO `product_view` VALUES (478, 1, '2025-02-26 08:00:20');
INSERT INTO `product_view` VALUES (479, 1, '2025-02-26 08:00:46');
INSERT INTO `product_view` VALUES (480, 1, '2025-02-26 08:00:50');
INSERT INTO `product_view` VALUES (481, 1, '2025-02-26 08:00:58');
INSERT INTO `product_view` VALUES (482, 1, '2025-02-26 08:01:14');
INSERT INTO `product_view` VALUES (483, 1, '2025-02-26 08:01:32');
INSERT INTO `product_view` VALUES (484, 1, '2025-02-26 08:07:19');
INSERT INTO `product_view` VALUES (485, 1, '2025-02-26 08:07:50');
INSERT INTO `product_view` VALUES (486, 1, '2025-02-26 08:08:22');
INSERT INTO `product_view` VALUES (487, 1, '2025-02-26 08:08:34');
INSERT INTO `product_view` VALUES (488, 1, '2025-02-26 08:10:15');
INSERT INTO `product_view` VALUES (489, 1, '2025-02-26 08:11:12');
INSERT INTO `product_view` VALUES (490, 1, '2025-02-26 08:11:35');
INSERT INTO `product_view` VALUES (491, 1, '2025-02-26 08:11:50');
INSERT INTO `product_view` VALUES (492, 1, '2025-02-26 08:12:26');
INSERT INTO `product_view` VALUES (493, 1, '2025-02-26 08:12:39');
INSERT INTO `product_view` VALUES (494, 1, '2025-02-26 08:15:32');
INSERT INTO `product_view` VALUES (495, 1, '2025-02-26 08:16:00');
INSERT INTO `product_view` VALUES (496, 1, '2025-02-26 08:17:01');
INSERT INTO `product_view` VALUES (497, 1, '2025-02-26 08:27:19');
INSERT INTO `product_view` VALUES (498, 2, '2025-02-26 08:27:28');
INSERT INTO `product_view` VALUES (499, 1, '2025-02-26 08:27:36');
INSERT INTO `product_view` VALUES (500, 3, '2025-02-26 08:28:01');
INSERT INTO `product_view` VALUES (501, 39, '2025-02-26 13:43:44');
INSERT INTO `product_view` VALUES (502, 1, '2025-02-26 13:55:14');
INSERT INTO `product_view` VALUES (503, 3, '2025-02-26 13:55:32');
INSERT INTO `product_view` VALUES (504, 5, '2025-02-26 13:55:37');
INSERT INTO `product_view` VALUES (505, 2, '2025-02-26 13:56:44');
INSERT INTO `product_view` VALUES (506, 1, '2025-02-26 14:05:10');
INSERT INTO `product_view` VALUES (507, 1, '2025-02-26 14:07:23');
INSERT INTO `product_view` VALUES (508, 1, '2025-02-26 14:12:13');
INSERT INTO `product_view` VALUES (509, 1, '2025-02-26 14:54:24');
INSERT INTO `product_view` VALUES (510, 3, '2025-02-26 14:55:08');
INSERT INTO `product_view` VALUES (511, 4, '2025-02-26 14:55:19');
INSERT INTO `product_view` VALUES (512, 5, '2025-02-26 14:55:29');
INSERT INTO `product_view` VALUES (513, 7, '2025-02-26 14:55:38');
INSERT INTO `product_view` VALUES (514, 2, '2025-02-26 14:58:55');
INSERT INTO `product_view` VALUES (515, 1, '2025-02-26 14:59:22');
INSERT INTO `product_view` VALUES (516, 39, '2025-02-26 14:59:23');
INSERT INTO `product_view` VALUES (517, 39, '2025-02-26 14:59:24');
INSERT INTO `product_view` VALUES (518, 40, '2025-02-26 14:59:26');
INSERT INTO `product_view` VALUES (519, 40, '2025-02-26 14:59:26');
INSERT INTO `product_view` VALUES (520, 1, '2025-02-26 14:59:31');
INSERT INTO `product_view` VALUES (521, 2, '2025-02-26 15:00:10');
INSERT INTO `product_view` VALUES (522, 7, '2025-02-26 15:00:25');
INSERT INTO `product_view` VALUES (523, 4, '2025-02-26 15:00:32');
INSERT INTO `product_view` VALUES (524, 13, '2025-02-26 15:12:51');
INSERT INTO `product_view` VALUES (525, 13, '2025-02-26 15:12:51');
INSERT INTO `product_view` VALUES (526, 13, '2025-02-26 15:12:54');
INSERT INTO `product_view` VALUES (527, 13, '2025-02-26 15:12:54');
INSERT INTO `product_view` VALUES (528, 14, '2025-02-26 15:12:56');
INSERT INTO `product_view` VALUES (529, 14, '2025-02-26 15:12:56');
INSERT INTO `product_view` VALUES (530, 15, '2025-02-26 15:12:59');
INSERT INTO `product_view` VALUES (531, 15, '2025-02-26 15:12:59');
INSERT INTO `product_view` VALUES (532, 18, '2025-02-26 15:13:06');
INSERT INTO `product_view` VALUES (533, 18, '2025-02-26 15:13:06');
INSERT INTO `product_view` VALUES (534, 5, '2025-02-26 15:15:28');
INSERT INTO `product_view` VALUES (535, 1, '2025-02-26 15:21:17');
INSERT INTO `product_view` VALUES (536, 2, '2025-02-26 19:01:27');
INSERT INTO `product_view` VALUES (537, 3, '2025-02-27 00:23:46');
INSERT INTO `product_view` VALUES (538, 39, '2025-02-27 00:37:54');
INSERT INTO `product_view` VALUES (539, 40, '2025-02-27 00:50:00');
INSERT INTO `product_view` VALUES (540, 1, '2025-02-27 00:56:56');
INSERT INTO `product_view` VALUES (541, 42, '2025-02-27 01:17:52');
INSERT INTO `product_view` VALUES (542, 44, '2025-02-27 01:28:07');
INSERT INTO `product_view` VALUES (543, 45, '2025-02-27 01:40:42');
INSERT INTO `product_view` VALUES (544, 46, '2025-02-27 01:51:07');
INSERT INTO `product_view` VALUES (545, 47, '2025-02-27 01:56:10');
INSERT INTO `product_view` VALUES (546, 41, '2025-02-27 02:08:36');
INSERT INTO `product_view` VALUES (547, 43, '2025-02-27 02:16:30');
INSERT INTO `product_view` VALUES (548, 50, '2025-02-27 02:25:16');
INSERT INTO `product_view` VALUES (549, 59, '2025-02-27 02:49:15');
INSERT INTO `product_view` VALUES (550, 40, '2025-02-27 02:50:59');
INSERT INTO `product_view` VALUES (551, 40, '2025-02-27 03:33:16');
INSERT INTO `product_view` VALUES (552, 39, '2025-02-27 03:33:17');
INSERT INTO `product_view` VALUES (553, 59, '2025-02-27 03:33:17');
INSERT INTO `product_view` VALUES (554, 50, '2025-02-27 03:33:17');
INSERT INTO `product_view` VALUES (555, 53, '2025-02-27 03:33:18');
INSERT INTO `product_view` VALUES (556, 58, '2025-02-27 03:33:18');
INSERT INTO `product_view` VALUES (557, 68, '2025-02-27 03:33:18');
INSERT INTO `product_view` VALUES (558, 63, '2025-02-27 03:33:19');
INSERT INTO `product_view` VALUES (559, 74, '2025-02-27 03:33:19');
INSERT INTO `product_view` VALUES (560, 42, '2025-02-27 03:33:20');
INSERT INTO `product_view` VALUES (561, 45, '2025-02-27 03:33:20');
INSERT INTO `product_view` VALUES (562, 55, '2025-02-27 03:33:20');
INSERT INTO `product_view` VALUES (563, 51, '2025-02-27 03:33:21');
INSERT INTO `product_view` VALUES (564, 61, '2025-02-27 03:33:21');
INSERT INTO `product_view` VALUES (565, 70, '2025-02-27 03:33:21');
INSERT INTO `product_view` VALUES (566, 56, '2025-02-27 03:33:22');
INSERT INTO `product_view` VALUES (567, 75, '2025-02-27 03:33:22');
INSERT INTO `product_view` VALUES (568, 62, '2025-02-27 03:33:22');
INSERT INTO `product_view` VALUES (569, 60, '2025-02-27 03:33:23');
INSERT INTO `product_view` VALUES (570, 1, '2025-02-27 04:01:09');
INSERT INTO `product_view` VALUES (571, 2, '2025-02-27 04:02:23');
INSERT INTO `product_view` VALUES (572, 1, '2025-02-27 04:03:50');
INSERT INTO `product_view` VALUES (573, 2, '2025-02-27 04:13:56');
INSERT INTO `product_view` VALUES (574, 5, '2025-02-27 04:54:36');
INSERT INTO `product_view` VALUES (575, 1, '2025-02-27 05:05:01');
INSERT INTO `product_view` VALUES (576, 2, '2025-02-27 05:20:21');
INSERT INTO `product_view` VALUES (577, 6, '2025-02-27 05:36:53');
INSERT INTO `product_view` VALUES (578, 7, '2025-02-27 05:41:38');
INSERT INTO `product_view` VALUES (579, 39, '2025-02-27 06:42:11');
INSERT INTO `product_view` VALUES (580, 3, '2025-02-27 06:42:15');
INSERT INTO `product_view` VALUES (581, 28, '2025-02-27 06:46:06');
INSERT INTO `product_view` VALUES (582, 30, '2025-02-27 06:46:14');
INSERT INTO `product_view` VALUES (583, 30, '2025-02-27 06:46:15');
INSERT INTO `product_view` VALUES (584, 39, '2025-02-27 06:47:00');
INSERT INTO `product_view` VALUES (585, 39, '2025-02-27 06:47:00');
INSERT INTO `product_view` VALUES (586, 40, '2025-02-27 06:47:27');
INSERT INTO `product_view` VALUES (587, 40, '2025-02-27 06:47:28');
INSERT INTO `product_view` VALUES (588, 39, '2025-02-27 06:47:34');
INSERT INTO `product_view` VALUES (589, 39, '2025-02-27 06:47:35');
INSERT INTO `product_view` VALUES (590, 44, '2025-02-27 06:47:58');
INSERT INTO `product_view` VALUES (591, 44, '2025-02-27 06:47:59');
INSERT INTO `product_view` VALUES (592, 1, '2025-02-27 07:06:38');
INSERT INTO `product_view` VALUES (593, 40, '2025-02-27 16:01:30');
INSERT INTO `product_view` VALUES (594, 39, '2025-02-27 18:48:04');
INSERT INTO `product_view` VALUES (595, 44, '2025-02-27 19:26:59');
INSERT INTO `product_view` VALUES (596, 45, '2025-02-27 19:38:21');
INSERT INTO `product_view` VALUES (597, 46, '2025-02-27 19:49:20');
INSERT INTO `product_view` VALUES (598, 57, '2025-02-27 20:00:18');
INSERT INTO `product_view` VALUES (599, 61, '2025-02-27 20:06:56');
INSERT INTO `product_view` VALUES (600, 62, '2025-02-27 20:19:50');
INSERT INTO `product_view` VALUES (601, 71, '2025-02-27 20:30:07');
INSERT INTO `product_view` VALUES (602, 78, '2025-02-27 20:39:39');
INSERT INTO `product_view` VALUES (603, 41, '2025-02-27 20:48:27');
INSERT INTO `product_view` VALUES (604, 1, '2025-02-28 00:24:08');
INSERT INTO `product_view` VALUES (605, 2, '2025-02-28 00:48:50');
INSERT INTO `product_view` VALUES (606, 13, '2025-02-28 01:08:12');
INSERT INTO `product_view` VALUES (607, 14, '2025-02-28 01:17:40');
INSERT INTO `product_view` VALUES (608, 21, '2025-02-28 01:30:43');
INSERT INTO `product_view` VALUES (609, 28, '2025-02-28 01:38:59');
INSERT INTO `product_view` VALUES (610, 29, '2025-02-28 01:48:42');
INSERT INTO `product_view` VALUES (611, 30, '2025-02-28 01:55:46');
INSERT INTO `product_view` VALUES (612, 5, '2025-02-28 02:10:06');
INSERT INTO `product_view` VALUES (613, 7, '2025-02-28 02:14:53');
INSERT INTO `product_view` VALUES (614, 10, '2025-02-28 02:25:40');
INSERT INTO `product_view` VALUES (615, 12, '2025-02-28 02:37:33');
INSERT INTO `product_view` VALUES (616, 15, '2025-02-28 02:51:39');
INSERT INTO `product_view` VALUES (617, 1, '2025-02-28 06:44:59');
INSERT INTO `product_view` VALUES (618, 2, '2025-02-28 13:23:19');
INSERT INTO `product_view` VALUES (619, 1, '2025-02-28 15:33:03');
INSERT INTO `product_view` VALUES (620, 39, '2025-02-28 15:38:07');
INSERT INTO `product_view` VALUES (621, 5, '2025-02-28 15:46:38');
INSERT INTO `product_view` VALUES (622, 6, '2025-02-28 16:01:50');
INSERT INTO `product_view` VALUES (623, 15, '2025-02-28 16:06:44');
INSERT INTO `product_view` VALUES (624, 23, '2025-02-28 16:18:17');
INSERT INTO `product_view` VALUES (625, 13, '2025-02-28 16:24:46');
INSERT INTO `product_view` VALUES (626, 31, '2025-02-28 16:30:56');
INSERT INTO `product_view` VALUES (627, 1, '2025-02-28 18:09:24');
INSERT INTO `product_view` VALUES (628, 5, '2025-02-28 18:10:26');
INSERT INTO `product_view` VALUES (629, 40, '2025-02-28 18:21:27');
INSERT INTO `product_view` VALUES (630, 4, '2025-02-28 22:35:11');
INSERT INTO `product_view` VALUES (631, 18, '2025-03-01 00:08:48');
INSERT INTO `product_view` VALUES (632, 14, '2025-03-01 00:14:54');
INSERT INTO `product_view` VALUES (633, 15, '2025-03-01 02:04:47');
INSERT INTO `product_view` VALUES (634, 2, '2025-03-01 02:16:17');
INSERT INTO `product_view` VALUES (635, 3, '2025-03-01 02:36:20');
INSERT INTO `product_view` VALUES (636, 33, '2025-03-01 02:46:40');
INSERT INTO `product_view` VALUES (637, 7, '2025-03-01 02:58:22');
INSERT INTO `product_view` VALUES (638, 3, '2025-03-01 03:14:14');
INSERT INTO `product_view` VALUES (639, 8, '2025-03-01 03:21:24');
INSERT INTO `product_view` VALUES (640, 9, '2025-03-01 03:30:33');
INSERT INTO `product_view` VALUES (641, 10, '2025-03-01 03:40:28');
INSERT INTO `product_view` VALUES (642, 11, '2025-03-01 03:51:46');
INSERT INTO `product_view` VALUES (643, 39, '2025-03-01 04:37:32');
INSERT INTO `product_view` VALUES (644, 40, '2025-03-01 06:41:38');
INSERT INTO `product_view` VALUES (645, 2, '2025-03-01 06:41:43');
INSERT INTO `product_view` VALUES (646, 1, '2025-03-01 06:42:07');
INSERT INTO `product_view` VALUES (647, 45, '2025-03-01 06:42:33');
INSERT INTO `product_view` VALUES (648, 48, '2025-03-01 06:42:40');
INSERT INTO `product_view` VALUES (649, 16, '2025-03-01 06:42:41');
INSERT INTO `product_view` VALUES (650, 66, '2025-03-01 06:42:44');
INSERT INTO `product_view` VALUES (651, 45, '2025-03-01 06:42:45');
INSERT INTO `product_view` VALUES (652, 52, '2025-03-01 06:42:46');
INSERT INTO `product_view` VALUES (653, 33, '2025-03-01 06:42:46');
INSERT INTO `product_view` VALUES (654, 49, '2025-03-01 06:42:47');
INSERT INTO `product_view` VALUES (655, 64, '2025-03-01 06:42:48');
INSERT INTO `product_view` VALUES (656, 20, '2025-03-01 06:42:49');
INSERT INTO `product_view` VALUES (657, 23, '2025-03-01 06:42:50');
INSERT INTO `product_view` VALUES (658, 21, '2025-03-01 06:42:51');
INSERT INTO `product_view` VALUES (659, 56, '2025-03-01 06:42:51');
INSERT INTO `product_view` VALUES (660, 32, '2025-03-01 06:42:52');
INSERT INTO `product_view` VALUES (661, 53, '2025-03-01 06:42:53');
INSERT INTO `product_view` VALUES (662, 34, '2025-03-01 06:42:54');
INSERT INTO `product_view` VALUES (663, 39, '2025-03-02 07:26:55');
INSERT INTO `product_view` VALUES (664, 40, '2025-03-02 19:08:36');
INSERT INTO `product_view` VALUES (665, 49, '2025-03-02 19:47:08');
INSERT INTO `product_view` VALUES (666, 53, '2025-03-02 19:58:46');
INSERT INTO `product_view` VALUES (667, 54, '2025-03-02 20:08:22');
INSERT INTO `product_view` VALUES (668, 64, '2025-03-02 20:18:38');
INSERT INTO `product_view` VALUES (669, 72, '2025-03-02 20:27:42');
INSERT INTO `product_view` VALUES (670, 48, '2025-03-02 20:41:29');
INSERT INTO `product_view` VALUES (671, 55, '2025-03-02 20:47:33');
INSERT INTO `product_view` VALUES (672, 40, '2025-03-03 08:40:12');
INSERT INTO `product_view` VALUES (673, 39, '2025-03-04 07:33:25');
INSERT INTO `product_view` VALUES (674, 2, '2025-03-04 14:35:31');
INSERT INTO `product_view` VALUES (675, 1, '2025-03-04 14:35:33');
INSERT INTO `product_view` VALUES (676, 39, '2025-03-04 14:35:34');
INSERT INTO `product_view` VALUES (677, 40, '2025-03-04 14:35:35');
INSERT INTO `product_view` VALUES (678, 4, '2025-03-04 14:36:07');
INSERT INTO `product_view` VALUES (679, 3, '2025-03-04 14:36:08');
INSERT INTO `product_view` VALUES (680, 5, '2025-03-04 14:36:10');
INSERT INTO `product_view` VALUES (681, 9, '2025-03-04 14:36:11');
INSERT INTO `product_view` VALUES (682, 8, '2025-03-04 14:36:16');
INSERT INTO `product_view` VALUES (683, 7, '2025-03-04 14:36:18');
INSERT INTO `product_view` VALUES (684, 6, '2025-03-04 14:36:23');
INSERT INTO `product_view` VALUES (685, 67, '2025-03-04 14:36:25');
INSERT INTO `product_view` VALUES (686, 11, '2025-03-04 14:36:26');
INSERT INTO `product_view` VALUES (687, 32, '2025-03-04 14:36:27');
INSERT INTO `product_view` VALUES (688, 22, '2025-03-04 14:36:30');
INSERT INTO `product_view` VALUES (689, 72, '2025-03-04 14:36:32');
INSERT INTO `product_view` VALUES (690, 66, '2025-03-04 14:36:34');
INSERT INTO `product_view` VALUES (691, 51, '2025-03-04 14:36:36');
INSERT INTO `product_view` VALUES (692, 75, '2025-03-04 14:36:37');
INSERT INTO `product_view` VALUES (693, 37, '2025-03-04 14:36:38');
INSERT INTO `product_view` VALUES (694, 49, '2025-03-04 14:36:39');
INSERT INTO `product_view` VALUES (695, 76, '2025-03-04 14:36:41');
INSERT INTO `product_view` VALUES (696, 12, '2025-03-04 14:36:42');
INSERT INTO `product_view` VALUES (697, 24, '2025-03-04 14:36:43');
INSERT INTO `product_view` VALUES (698, 38, '2025-03-04 14:36:44');
INSERT INTO `product_view` VALUES (699, 16, '2025-03-04 14:36:45');
INSERT INTO `product_view` VALUES (700, 64, '2025-03-04 14:36:46');
INSERT INTO `product_view` VALUES (701, 61, '2025-03-04 14:36:48');
INSERT INTO `product_view` VALUES (702, 65, '2025-03-04 14:36:49');
INSERT INTO `product_view` VALUES (703, 57, '2025-03-04 14:36:50');
INSERT INTO `product_view` VALUES (704, 15, '2025-03-04 14:36:51');
INSERT INTO `product_view` VALUES (705, 34, '2025-03-04 14:36:52');
INSERT INTO `product_view` VALUES (706, 19, '2025-03-04 14:36:53');
INSERT INTO `product_view` VALUES (707, 78, '2025-03-04 14:36:55');
INSERT INTO `product_view` VALUES (708, 56, '2025-03-04 14:36:56');
INSERT INTO `product_view` VALUES (709, 60, '2025-03-04 14:36:57');
INSERT INTO `product_view` VALUES (710, 69, '2025-03-04 14:36:58');
INSERT INTO `product_view` VALUES (711, 20, '2025-03-04 14:36:59');
INSERT INTO `product_view` VALUES (712, 18, '2025-03-04 14:37:00');
INSERT INTO `product_view` VALUES (713, 31, '2025-03-04 14:37:02');
INSERT INTO `product_view` VALUES (714, 33, '2025-03-04 14:37:03');
INSERT INTO `product_view` VALUES (715, 53, '2025-03-04 14:37:04');
INSERT INTO `product_view` VALUES (716, 77, '2025-03-04 14:37:05');
INSERT INTO `product_view` VALUES (717, 43, '2025-03-04 14:37:06');
INSERT INTO `product_view` VALUES (718, 79, '2025-03-04 14:37:07');
INSERT INTO `product_view` VALUES (719, 71, '2025-03-04 14:37:08');
INSERT INTO `product_view` VALUES (720, 13, '2025-03-04 14:37:10');
INSERT INTO `product_view` VALUES (721, 17, '2025-03-04 14:37:11');
INSERT INTO `product_view` VALUES (722, 47, '2025-03-04 14:37:12');
INSERT INTO `product_view` VALUES (723, 23, '2025-03-04 14:37:13');
INSERT INTO `product_view` VALUES (724, 48, '2025-03-04 14:37:14');
INSERT INTO `product_view` VALUES (725, 29, '2025-03-04 14:37:15');
INSERT INTO `product_view` VALUES (726, 55, '2025-03-04 14:37:17');
INSERT INTO `product_view` VALUES (727, 70, '2025-03-04 14:37:18');
INSERT INTO `product_view` VALUES (728, 28, '2025-03-04 14:37:19');
INSERT INTO `product_view` VALUES (729, 52, '2025-03-04 14:37:20');
INSERT INTO `product_view` VALUES (730, 68, '2025-03-04 14:37:21');
INSERT INTO `product_view` VALUES (731, 45, '2025-03-04 14:37:22');
INSERT INTO `product_view` VALUES (732, 62, '2025-03-04 14:37:24');
INSERT INTO `product_view` VALUES (733, 63, '2025-03-04 14:37:25');
INSERT INTO `product_view` VALUES (734, 59, '2025-03-04 14:37:26');
INSERT INTO `product_view` VALUES (735, 54, '2025-03-04 14:37:27');
INSERT INTO `product_view` VALUES (736, 74, '2025-03-04 14:37:28');
INSERT INTO `product_view` VALUES (737, 21, '2025-03-04 14:37:29');
INSERT INTO `product_view` VALUES (738, 25, '2025-03-04 14:37:30');
INSERT INTO `product_view` VALUES (739, 35, '2025-03-04 14:37:32');
INSERT INTO `product_view` VALUES (740, 26, '2025-03-04 14:37:33');
INSERT INTO `product_view` VALUES (741, 27, '2025-03-04 14:37:34');
INSERT INTO `product_view` VALUES (742, 30, '2025-03-04 14:37:35');
INSERT INTO `product_view` VALUES (743, 36, '2025-03-04 14:37:36');
INSERT INTO `product_view` VALUES (744, 14, '2025-03-04 14:37:37');
INSERT INTO `product_view` VALUES (745, 44, '2025-03-04 14:37:38');
INSERT INTO `product_view` VALUES (746, 41, '2025-03-04 14:37:40');
INSERT INTO `product_view` VALUES (747, 42, '2025-03-04 14:37:41');
INSERT INTO `product_view` VALUES (748, 10, '2025-03-04 14:37:44');
INSERT INTO `product_view` VALUES (749, 58, '2025-03-04 14:37:47');
INSERT INTO `product_view` VALUES (750, 73, '2025-03-04 14:37:50');
INSERT INTO `product_view` VALUES (751, 46, '2025-03-04 14:37:53');
INSERT INTO `product_view` VALUES (752, 50, '2025-03-04 14:37:55');
INSERT INTO `product_view` VALUES (753, 39, '2025-03-04 18:42:47');
INSERT INTO `product_view` VALUES (754, 41, '2025-03-04 19:14:41');
INSERT INTO `product_view` VALUES (755, 43, '2025-03-04 19:22:40');
INSERT INTO `product_view` VALUES (756, 67, '2025-03-04 19:33:24');
INSERT INTO `product_view` VALUES (757, 74, '2025-03-04 19:42:21');
INSERT INTO `product_view` VALUES (758, 77, '2025-03-04 19:51:45');
INSERT INTO `product_view` VALUES (759, 42, '2025-03-04 20:03:36');
INSERT INTO `product_view` VALUES (760, 47, '2025-03-04 20:12:06');
INSERT INTO `product_view` VALUES (761, 60, '2025-03-04 20:22:10');
INSERT INTO `product_view` VALUES (762, 66, '2025-03-04 20:34:23');
INSERT INTO `product_view` VALUES (763, 70, '2025-03-04 20:43:57');
INSERT INTO `product_view` VALUES (764, 2, '2025-03-05 00:39:46');
INSERT INTO `product_view` VALUES (765, 1, '2025-03-05 00:48:15');
INSERT INTO `product_view` VALUES (766, 6, '2025-03-05 01:17:23');
INSERT INTO `product_view` VALUES (767, 9, '2025-03-05 01:26:06');
INSERT INTO `product_view` VALUES (768, 23, '2025-03-05 01:36:07');
INSERT INTO `product_view` VALUES (769, 32, '2025-03-05 01:46:32');
INSERT INTO `product_view` VALUES (770, 36, '2025-03-05 01:56:15');
INSERT INTO `product_view` VALUES (771, 23, '2025-03-05 02:08:08');
INSERT INTO `product_view` VALUES (772, 14, '2025-03-05 02:15:18');
INSERT INTO `product_view` VALUES (773, 21, '2025-03-05 02:25:00');
INSERT INTO `product_view` VALUES (774, 28, '2025-03-05 02:38:04');
INSERT INTO `product_view` VALUES (775, 29, '2025-03-05 02:47:45');
INSERT INTO `product_view` VALUES (776, 39, '2025-03-05 05:35:17');
INSERT INTO `product_view` VALUES (777, 1, '2025-03-05 05:35:52');
INSERT INTO `product_view` VALUES (778, 5, '2025-03-05 05:51:21');
INSERT INTO `product_view` VALUES (779, 9, '2025-03-05 05:51:43');
INSERT INTO `product_view` VALUES (780, 10, '2025-03-05 05:51:59');
INSERT INTO `product_view` VALUES (781, 1, '2025-03-05 05:52:25');
INSERT INTO `product_view` VALUES (782, 1, '2025-03-05 05:52:39');
INSERT INTO `product_view` VALUES (783, 4, '2025-03-05 05:52:40');
INSERT INTO `product_view` VALUES (784, 1, '2025-03-05 05:53:11');
INSERT INTO `product_view` VALUES (785, 1, '2025-03-05 05:56:56');
INSERT INTO `product_view` VALUES (786, 1, '2025-03-05 05:57:42');
INSERT INTO `product_view` VALUES (787, 1, '2025-03-05 06:03:22');
INSERT INTO `product_view` VALUES (788, 1, '2025-03-05 06:03:33');
INSERT INTO `product_view` VALUES (789, 1, '2025-03-05 06:03:39');
INSERT INTO `product_view` VALUES (790, 1, '2025-03-05 06:03:49');
INSERT INTO `product_view` VALUES (791, 1, '2025-03-05 06:05:16');
INSERT INTO `product_view` VALUES (792, 1, '2025-03-05 06:15:09');
INSERT INTO `product_view` VALUES (793, 1, '2025-03-05 06:22:52');
INSERT INTO `product_view` VALUES (794, 1, '2025-03-05 06:26:10');
INSERT INTO `product_view` VALUES (795, 1, '2025-03-05 06:26:42');
INSERT INTO `product_view` VALUES (796, 1, '2025-03-05 06:26:50');
INSERT INTO `product_view` VALUES (797, 1, '2025-03-05 06:26:55');
INSERT INTO `product_view` VALUES (798, 1, '2025-03-05 06:27:17');
INSERT INTO `product_view` VALUES (799, 1, '2025-03-05 06:27:22');
INSERT INTO `product_view` VALUES (800, 1, '2025-03-05 06:28:39');
INSERT INTO `product_view` VALUES (801, 1, '2025-03-05 06:30:02');
INSERT INTO `product_view` VALUES (802, 1, '2025-03-05 06:32:04');
INSERT INTO `product_view` VALUES (803, 1, '2025-03-05 06:33:57');
INSERT INTO `product_view` VALUES (804, 1, '2025-03-05 06:37:31');
INSERT INTO `product_view` VALUES (805, 1, '2025-03-05 06:46:08');
INSERT INTO `product_view` VALUES (806, 40, '2025-03-05 06:46:39');
INSERT INTO `product_view` VALUES (807, 1, '2025-03-05 06:46:41');
INSERT INTO `product_view` VALUES (808, 1, '2025-03-05 06:50:31');
INSERT INTO `product_view` VALUES (809, 1, '2025-03-05 06:51:18');
INSERT INTO `product_view` VALUES (810, 1, '2025-03-05 06:52:14');
INSERT INTO `product_view` VALUES (811, 1, '2025-03-05 06:52:48');
INSERT INTO `product_view` VALUES (812, 1, '2025-03-05 06:55:43');
INSERT INTO `product_view` VALUES (813, 1, '2025-03-05 06:57:07');
INSERT INTO `product_view` VALUES (814, 1, '2025-03-05 06:57:15');
INSERT INTO `product_view` VALUES (815, 1, '2025-03-05 07:01:11');
INSERT INTO `product_view` VALUES (816, 1, '2025-03-05 07:03:00');
INSERT INTO `product_view` VALUES (817, 1, '2025-03-05 07:03:15');
INSERT INTO `product_view` VALUES (818, 1, '2025-03-05 07:03:49');
INSERT INTO `product_view` VALUES (819, 1, '2025-03-05 07:03:54');
INSERT INTO `product_view` VALUES (820, 1, '2025-03-05 07:04:37');
INSERT INTO `product_view` VALUES (821, 1, '2025-03-05 07:08:55');
INSERT INTO `product_view` VALUES (822, 1, '2025-03-05 07:10:12');
INSERT INTO `product_view` VALUES (823, 1, '2025-03-05 07:11:19');
INSERT INTO `product_view` VALUES (824, 1, '2025-03-05 07:12:15');
INSERT INTO `product_view` VALUES (825, 1, '2025-03-05 07:12:31');
INSERT INTO `product_view` VALUES (826, 1, '2025-03-05 07:13:41');
INSERT INTO `product_view` VALUES (827, 1, '2025-03-05 07:14:39');
INSERT INTO `product_view` VALUES (828, 1, '2025-03-05 07:15:15');
INSERT INTO `product_view` VALUES (829, 1, '2025-03-05 07:16:28');
INSERT INTO `product_view` VALUES (830, 1, '2025-03-05 07:16:48');
INSERT INTO `product_view` VALUES (831, 1, '2025-03-05 07:17:08');
INSERT INTO `product_view` VALUES (832, 1, '2025-03-05 07:18:18');
INSERT INTO `product_view` VALUES (833, 1, '2025-03-05 07:20:32');
INSERT INTO `product_view` VALUES (834, 1, '2025-03-05 07:24:52');
INSERT INTO `product_view` VALUES (835, 1, '2025-03-05 07:25:15');
INSERT INTO `product_view` VALUES (836, 1, '2025-03-05 07:25:41');
INSERT INTO `product_view` VALUES (837, 1, '2025-03-05 07:26:10');
INSERT INTO `product_view` VALUES (838, 1, '2025-03-05 07:28:32');
INSERT INTO `product_view` VALUES (839, 1, '2025-03-05 07:29:49');
INSERT INTO `product_view` VALUES (840, 1, '2025-03-05 07:29:50');
INSERT INTO `product_view` VALUES (841, 1, '2025-03-05 07:30:00');
INSERT INTO `product_view` VALUES (842, 1, '2025-03-05 07:30:01');
INSERT INTO `product_view` VALUES (843, 1, '2025-03-05 07:30:01');
INSERT INTO `product_view` VALUES (844, 1, '2025-03-05 07:30:01');
INSERT INTO `product_view` VALUES (845, 1, '2025-03-05 07:30:02');
INSERT INTO `product_view` VALUES (846, 1, '2025-03-05 07:30:13');
INSERT INTO `product_view` VALUES (847, 2, '2025-03-05 07:30:19');
INSERT INTO `product_view` VALUES (848, 1, '2025-03-05 07:30:51');
INSERT INTO `product_view` VALUES (849, 1, '2025-03-05 07:31:55');
INSERT INTO `product_view` VALUES (850, 1, '2025-03-05 07:32:29');
INSERT INTO `product_view` VALUES (851, 1, '2025-03-05 07:32:39');
INSERT INTO `product_view` VALUES (852, 1, '2025-03-05 07:32:55');
INSERT INTO `product_view` VALUES (853, 1, '2025-03-05 07:33:13');
INSERT INTO `product_view` VALUES (854, 1, '2025-03-05 07:37:00');
INSERT INTO `product_view` VALUES (855, 1, '2025-03-05 08:31:45');
INSERT INTO `product_view` VALUES (856, 1, '2025-03-05 08:38:24');
INSERT INTO `product_view` VALUES (857, 1, '2025-03-05 08:43:24');
INSERT INTO `product_view` VALUES (858, 1, '2025-03-05 08:46:40');
INSERT INTO `product_view` VALUES (859, 1, '2025-03-05 08:47:57');
INSERT INTO `product_view` VALUES (860, 1, '2025-03-05 08:48:45');
INSERT INTO `product_view` VALUES (861, 1, '2025-03-05 08:57:44');
INSERT INTO `product_view` VALUES (862, 1, '2025-03-05 09:00:13');
INSERT INTO `product_view` VALUES (863, 1, '2025-03-05 09:01:16');
INSERT INTO `product_view` VALUES (864, 1, '2025-03-05 09:07:12');
INSERT INTO `product_view` VALUES (865, 1, '2025-03-05 09:10:26');
INSERT INTO `product_view` VALUES (866, 1, '2025-03-05 09:10:37');
INSERT INTO `product_view` VALUES (867, 1, '2025-03-05 09:10:48');
INSERT INTO `product_view` VALUES (868, 1, '2025-03-05 09:10:54');
INSERT INTO `product_view` VALUES (869, 1, '2025-03-05 09:11:16');
INSERT INTO `product_view` VALUES (870, 1, '2025-03-05 09:11:33');
INSERT INTO `product_view` VALUES (871, 1, '2025-03-05 09:11:46');
INSERT INTO `product_view` VALUES (872, 1, '2025-03-05 09:12:00');
INSERT INTO `product_view` VALUES (873, 1, '2025-03-05 09:12:11');
INSERT INTO `product_view` VALUES (874, 1, '2025-03-05 09:13:16');
INSERT INTO `product_view` VALUES (875, 1, '2025-03-05 09:13:35');
INSERT INTO `product_view` VALUES (876, 1, '2025-03-05 09:14:39');
INSERT INTO `product_view` VALUES (877, 1, '2025-03-05 09:15:51');
INSERT INTO `product_view` VALUES (878, 1, '2025-03-05 09:16:44');
INSERT INTO `product_view` VALUES (879, 1, '2025-03-05 09:18:23');
INSERT INTO `product_view` VALUES (880, 1, '2025-03-05 09:18:41');
INSERT INTO `product_view` VALUES (881, 1, '2025-03-05 09:19:18');
INSERT INTO `product_view` VALUES (882, 1, '2025-03-05 09:19:27');
INSERT INTO `product_view` VALUES (883, 1, '2025-03-05 09:19:44');
INSERT INTO `product_view` VALUES (884, 1, '2025-03-05 09:19:54');
INSERT INTO `product_view` VALUES (885, 1, '2025-03-05 09:20:09');
INSERT INTO `product_view` VALUES (886, 1, '2025-03-05 09:20:46');
INSERT INTO `product_view` VALUES (887, 1, '2025-03-05 09:21:13');
INSERT INTO `product_view` VALUES (888, 1, '2025-03-05 09:21:33');
INSERT INTO `product_view` VALUES (889, 1, '2025-03-05 09:21:49');
INSERT INTO `product_view` VALUES (890, 1, '2025-03-05 09:21:54');
INSERT INTO `product_view` VALUES (891, 1, '2025-03-05 09:25:40');
INSERT INTO `product_view` VALUES (892, 1, '2025-03-05 09:25:53');
INSERT INTO `product_view` VALUES (893, 1, '2025-03-05 09:26:01');
INSERT INTO `product_view` VALUES (894, 1, '2025-03-05 09:26:15');
INSERT INTO `product_view` VALUES (895, 1, '2025-03-05 09:27:21');
INSERT INTO `product_view` VALUES (896, 1, '2025-03-05 09:27:57');
INSERT INTO `product_view` VALUES (897, 1, '2025-03-05 09:28:42');
INSERT INTO `product_view` VALUES (898, 1, '2025-03-05 09:28:57');
INSERT INTO `product_view` VALUES (899, 1, '2025-03-05 09:29:03');
INSERT INTO `product_view` VALUES (900, 1, '2025-03-05 09:29:42');
INSERT INTO `product_view` VALUES (901, 1, '2025-03-05 09:30:53');
INSERT INTO `product_view` VALUES (902, 1, '2025-03-05 09:31:37');
INSERT INTO `product_view` VALUES (903, 1, '2025-03-05 09:32:22');
INSERT INTO `product_view` VALUES (904, 1, '2025-03-05 09:32:51');
INSERT INTO `product_view` VALUES (905, 1, '2025-03-05 09:33:49');
INSERT INTO `product_view` VALUES (906, 1, '2025-03-05 09:34:10');
INSERT INTO `product_view` VALUES (907, 1, '2025-03-05 09:34:36');
INSERT INTO `product_view` VALUES (908, 1, '2025-03-05 09:35:57');
INSERT INTO `product_view` VALUES (909, 1, '2025-03-05 09:36:11');
INSERT INTO `product_view` VALUES (910, 1, '2025-03-05 09:36:27');
INSERT INTO `product_view` VALUES (911, 1, '2025-03-05 09:37:30');
INSERT INTO `product_view` VALUES (912, 1, '2025-03-05 09:37:47');
INSERT INTO `product_view` VALUES (913, 1, '2025-03-05 09:38:05');
INSERT INTO `product_view` VALUES (914, 1, '2025-03-05 09:38:11');
INSERT INTO `product_view` VALUES (915, 1, '2025-03-05 09:38:21');
INSERT INTO `product_view` VALUES (916, 1, '2025-03-05 09:39:01');
INSERT INTO `product_view` VALUES (917, 1, '2025-03-05 09:39:02');
INSERT INTO `product_view` VALUES (918, 1, '2025-03-05 09:39:09');
INSERT INTO `product_view` VALUES (919, 1, '2025-03-05 09:39:42');
INSERT INTO `product_view` VALUES (920, 1, '2025-03-05 09:39:48');
INSERT INTO `product_view` VALUES (921, 1, '2025-03-05 09:39:52');
INSERT INTO `product_view` VALUES (922, 1, '2025-03-05 09:40:00');
INSERT INTO `product_view` VALUES (923, 1, '2025-03-05 09:42:13');
INSERT INTO `product_view` VALUES (924, 1, '2025-03-05 09:42:52');
INSERT INTO `product_view` VALUES (925, 1, '2025-03-05 09:46:57');
INSERT INTO `product_view` VALUES (926, 1, '2025-03-05 09:47:25');
INSERT INTO `product_view` VALUES (927, 1, '2025-03-05 09:50:55');
INSERT INTO `product_view` VALUES (928, 1, '2025-03-05 09:56:10');
INSERT INTO `product_view` VALUES (929, 1, '2025-03-05 09:57:11');
INSERT INTO `product_view` VALUES (930, 1, '2025-03-05 09:58:58');
INSERT INTO `product_view` VALUES (931, 1, '2025-03-05 10:01:51');
INSERT INTO `product_view` VALUES (932, 1, '2025-03-05 10:06:32');
INSERT INTO `product_view` VALUES (933, 1, '2025-03-05 10:10:42');
INSERT INTO `product_view` VALUES (934, 1, '2025-03-05 10:14:01');
INSERT INTO `product_view` VALUES (935, 1, '2025-03-05 10:15:22');
INSERT INTO `product_view` VALUES (936, 1, '2025-03-05 10:15:30');
INSERT INTO `product_view` VALUES (937, 1, '2025-03-05 10:29:33');
INSERT INTO `product_view` VALUES (938, 1, '2025-03-05 10:31:13');
INSERT INTO `product_view` VALUES (939, 1, '2025-03-05 10:32:01');
INSERT INTO `product_view` VALUES (940, 1, '2025-03-05 10:37:58');
INSERT INTO `product_view` VALUES (941, 1, '2025-03-05 10:38:31');
INSERT INTO `product_view` VALUES (942, 1, '2025-03-05 10:38:39');
INSERT INTO `product_view` VALUES (943, 1, '2025-03-05 10:38:40');
INSERT INTO `product_view` VALUES (944, 1, '2025-03-05 10:38:41');
INSERT INTO `product_view` VALUES (945, 1, '2025-03-05 10:38:43');
INSERT INTO `product_view` VALUES (946, 1, '2025-03-05 10:38:44');
INSERT INTO `product_view` VALUES (947, 1, '2025-03-05 10:44:32');
INSERT INTO `product_view` VALUES (948, 1, '2025-03-05 10:44:49');
INSERT INTO `product_view` VALUES (949, 1, '2025-03-05 10:44:52');
INSERT INTO `product_view` VALUES (950, 1, '2025-03-05 10:45:37');
INSERT INTO `product_view` VALUES (951, 1, '2025-03-05 10:46:40');
INSERT INTO `product_view` VALUES (952, 1, '2025-03-05 10:47:29');
INSERT INTO `product_view` VALUES (953, 1, '2025-03-05 10:48:04');
INSERT INTO `product_view` VALUES (954, 1, '2025-03-05 10:48:09');
INSERT INTO `product_view` VALUES (955, 1, '2025-03-05 10:48:27');
INSERT INTO `product_view` VALUES (956, 1, '2025-03-05 10:48:46');
INSERT INTO `product_view` VALUES (957, 1, '2025-03-05 10:49:36');
INSERT INTO `product_view` VALUES (958, 1, '2025-03-05 10:49:47');
INSERT INTO `product_view` VALUES (959, 1, '2025-03-05 10:49:56');
INSERT INTO `product_view` VALUES (960, 1, '2025-03-05 10:50:01');
INSERT INTO `product_view` VALUES (961, 1, '2025-03-05 10:51:17');
INSERT INTO `product_view` VALUES (962, 1, '2025-03-05 10:51:20');
INSERT INTO `product_view` VALUES (963, 1, '2025-03-05 10:51:24');
INSERT INTO `product_view` VALUES (964, 1, '2025-03-05 10:51:28');
INSERT INTO `product_view` VALUES (965, 1, '2025-03-05 10:51:45');
INSERT INTO `product_view` VALUES (966, 1, '2025-03-05 10:51:56');
INSERT INTO `product_view` VALUES (967, 1, '2025-03-05 10:52:00');
INSERT INTO `product_view` VALUES (968, 1, '2025-03-05 10:52:03');
INSERT INTO `product_view` VALUES (969, 1, '2025-03-05 10:55:39');
INSERT INTO `product_view` VALUES (970, 1, '2025-03-05 10:55:49');
INSERT INTO `product_view` VALUES (971, 1, '2025-03-05 10:55:59');
INSERT INTO `product_view` VALUES (972, 1, '2025-03-05 10:56:05');
INSERT INTO `product_view` VALUES (973, 1, '2025-03-05 10:56:08');
INSERT INTO `product_view` VALUES (974, 1, '2025-03-05 10:56:19');
INSERT INTO `product_view` VALUES (975, 1, '2025-03-05 10:56:52');
INSERT INTO `product_view` VALUES (976, 40, '2025-03-05 15:19:57');
INSERT INTO `product_view` VALUES (977, 39, '2025-03-05 15:41:49');
INSERT INTO `product_view` VALUES (978, 1, '2025-03-05 15:55:37');
INSERT INTO `product_view` VALUES (979, 2, '2025-03-05 15:55:42');
INSERT INTO `product_view` VALUES (980, 3, '2025-03-05 15:55:46');
INSERT INTO `product_view` VALUES (981, 40, '2025-03-05 15:55:56');
INSERT INTO `product_view` VALUES (982, 39, '2025-03-05 15:56:22');
INSERT INTO `product_view` VALUES (983, 51, '2025-03-05 16:09:01');
INSERT INTO `product_view` VALUES (984, 61, '2025-03-05 16:23:54');
INSERT INTO `product_view` VALUES (985, 63, '2025-03-05 16:31:57');
INSERT INTO `product_view` VALUES (986, 69, '2025-03-05 16:42:39');
INSERT INTO `product_view` VALUES (987, 71, '2025-03-05 16:54:08');
INSERT INTO `product_view` VALUES (988, 74, '2025-03-05 17:03:37');
INSERT INTO `product_view` VALUES (989, 79, '2025-03-05 17:12:28');
INSERT INTO `product_view` VALUES (990, 43, '2025-03-05 17:23:58');
INSERT INTO `product_view` VALUES (991, 54, '2025-03-05 17:32:28');
INSERT INTO `product_view` VALUES (992, 58, '2025-03-05 17:41:18');
INSERT INTO `product_view` VALUES (993, 3, '2025-03-05 18:23:18');
INSERT INTO `product_view` VALUES (994, 13, '2025-03-05 18:38:00');
INSERT INTO `product_view` VALUES (995, 18, '2025-03-05 18:45:48');
INSERT INTO `product_view` VALUES (996, 20, '2025-03-05 18:57:12');
INSERT INTO `product_view` VALUES (997, 22, '2025-03-05 19:05:35');
INSERT INTO `product_view` VALUES (998, 5, '2025-03-05 19:13:48');
INSERT INTO `product_view` VALUES (999, 7, '2025-03-05 19:26:26');
INSERT INTO `product_view` VALUES (1000, 10, '2025-03-05 19:37:56');
INSERT INTO `product_view` VALUES (1001, 12, '2025-03-05 19:46:42');
INSERT INTO `product_view` VALUES (1002, 15, '2025-03-05 19:57:41');
INSERT INTO `product_view` VALUES (1003, 10, '2025-03-05 23:10:05');
INSERT INTO `product_view` VALUES (1004, 11, '2025-03-05 23:10:09');
INSERT INTO `product_view` VALUES (1005, 12, '2025-03-05 23:10:16');
INSERT INTO `product_view` VALUES (1006, 13, '2025-03-05 23:10:19');
INSERT INTO `product_view` VALUES (1007, 14, '2025-03-05 23:10:24');
INSERT INTO `product_view` VALUES (1008, 15, '2025-03-05 23:10:27');
INSERT INTO `product_view` VALUES (1009, 16, '2025-03-05 23:10:30');
INSERT INTO `product_view` VALUES (1010, 17, '2025-03-05 23:10:33');
INSERT INTO `product_view` VALUES (1011, 18, '2025-03-05 23:10:35');
INSERT INTO `product_view` VALUES (1012, 19, '2025-03-05 23:10:37');
INSERT INTO `product_view` VALUES (1013, 20, '2025-03-05 23:10:41');
INSERT INTO `product_view` VALUES (1014, 22, '2025-03-05 23:11:29');
INSERT INTO `product_view` VALUES (1015, 23, '2025-03-05 23:11:31');
INSERT INTO `product_view` VALUES (1016, 24, '2025-03-05 23:11:33');
INSERT INTO `product_view` VALUES (1017, 25, '2025-03-05 23:11:35');
INSERT INTO `product_view` VALUES (1018, 26, '2025-03-05 23:11:36');
INSERT INTO `product_view` VALUES (1019, 27, '2025-03-05 23:11:38');
INSERT INTO `product_view` VALUES (1020, 28, '2025-03-05 23:11:40');
INSERT INTO `product_view` VALUES (1021, 29, '2025-03-05 23:11:41');
INSERT INTO `product_view` VALUES (1022, 30, '2025-03-05 23:11:45');
INSERT INTO `product_view` VALUES (1023, 31, '2025-03-05 23:11:46');
INSERT INTO `product_view` VALUES (1024, 32, '2025-03-05 23:11:48');
INSERT INTO `product_view` VALUES (1025, 33, '2025-03-05 23:11:50');
INSERT INTO `product_view` VALUES (1026, 34, '2025-03-05 23:11:51');
INSERT INTO `product_view` VALUES (1027, 35, '2025-03-05 23:11:53');
INSERT INTO `product_view` VALUES (1028, 36, '2025-03-05 23:11:55');
INSERT INTO `product_view` VALUES (1029, 37, '2025-03-05 23:11:56');
INSERT INTO `product_view` VALUES (1030, 38, '2025-03-05 23:11:58');
INSERT INTO `product_view` VALUES (1031, 4, '2025-03-05 23:12:00');
INSERT INTO `product_view` VALUES (1032, 41, '2025-03-05 23:12:02');
INSERT INTO `product_view` VALUES (1033, 42, '2025-03-05 23:12:03');
INSERT INTO `product_view` VALUES (1034, 43, '2025-03-05 23:12:05');
INSERT INTO `product_view` VALUES (1035, 44, '2025-03-05 23:12:07');
INSERT INTO `product_view` VALUES (1036, 45, '2025-03-05 23:12:08');
INSERT INTO `product_view` VALUES (1037, 46, '2025-03-05 23:12:10');
INSERT INTO `product_view` VALUES (1038, 47, '2025-03-05 23:12:12');
INSERT INTO `product_view` VALUES (1039, 48, '2025-03-05 23:12:14');
INSERT INTO `product_view` VALUES (1040, 49, '2025-03-05 23:12:15');
INSERT INTO `product_view` VALUES (1041, 5, '2025-03-05 23:12:17');
INSERT INTO `product_view` VALUES (1042, 50, '2025-03-05 23:12:19');
INSERT INTO `product_view` VALUES (1043, 51, '2025-03-05 23:12:21');
INSERT INTO `product_view` VALUES (1044, 52, '2025-03-05 23:12:22');
INSERT INTO `product_view` VALUES (1045, 53, '2025-03-05 23:12:24');
INSERT INTO `product_view` VALUES (1046, 54, '2025-03-05 23:12:26');
INSERT INTO `product_view` VALUES (1047, 55, '2025-03-05 23:12:27');
INSERT INTO `product_view` VALUES (1048, 56, '2025-03-05 23:12:29');
INSERT INTO `product_view` VALUES (1049, 57, '2025-03-05 23:12:31');
INSERT INTO `product_view` VALUES (1050, 58, '2025-03-05 23:12:32');
INSERT INTO `product_view` VALUES (1051, 59, '2025-03-05 23:12:34');
INSERT INTO `product_view` VALUES (1052, 6, '2025-03-05 23:12:36');
INSERT INTO `product_view` VALUES (1053, 60, '2025-03-05 23:12:38');
INSERT INTO `product_view` VALUES (1054, 61, '2025-03-05 23:12:39');
INSERT INTO `product_view` VALUES (1055, 62, '2025-03-05 23:12:41');
INSERT INTO `product_view` VALUES (1056, 63, '2025-03-05 23:12:43');
INSERT INTO `product_view` VALUES (1057, 64, '2025-03-05 23:12:45');
INSERT INTO `product_view` VALUES (1058, 65, '2025-03-05 23:12:46');
INSERT INTO `product_view` VALUES (1059, 66, '2025-03-05 23:12:48');
INSERT INTO `product_view` VALUES (1060, 67, '2025-03-05 23:12:50');
INSERT INTO `product_view` VALUES (1061, 68, '2025-03-05 23:12:52');
INSERT INTO `product_view` VALUES (1062, 69, '2025-03-05 23:12:53');
INSERT INTO `product_view` VALUES (1063, 7, '2025-03-05 23:12:55');
INSERT INTO `product_view` VALUES (1064, 70, '2025-03-05 23:12:57');
INSERT INTO `product_view` VALUES (1065, 71, '2025-03-05 23:12:58');
INSERT INTO `product_view` VALUES (1066, 72, '2025-03-05 23:13:00');
INSERT INTO `product_view` VALUES (1067, 73, '2025-03-05 23:13:02');
INSERT INTO `product_view` VALUES (1068, 74, '2025-03-05 23:13:04');
INSERT INTO `product_view` VALUES (1069, 75, '2025-03-05 23:13:05');
INSERT INTO `product_view` VALUES (1070, 76, '2025-03-05 23:13:07');
INSERT INTO `product_view` VALUES (1071, 77, '2025-03-05 23:13:09');
INSERT INTO `product_view` VALUES (1072, 78, '2025-03-05 23:13:10');
INSERT INTO `product_view` VALUES (1073, 79, '2025-03-05 23:13:12');
INSERT INTO `product_view` VALUES (1074, 8, '2025-03-05 23:13:14');
INSERT INTO `product_view` VALUES (1075, 9, '2025-03-05 23:13:16');
INSERT INTO `product_view` VALUES (1076, 21, '2025-03-05 23:13:19');
INSERT INTO `product_view` VALUES (1077, 1, '2025-03-06 01:43:20');
INSERT INTO `product_view` VALUES (1078, 1, '2025-03-06 01:44:15');
INSERT INTO `product_view` VALUES (1079, 1, '2025-03-06 01:44:20');
INSERT INTO `product_view` VALUES (1080, 1, '2025-03-06 01:44:25');
INSERT INTO `product_view` VALUES (1081, 1, '2025-03-06 02:05:38');
INSERT INTO `product_view` VALUES (1082, 1, '2025-03-06 02:06:58');
INSERT INTO `product_view` VALUES (1083, 1, '2025-03-06 02:07:00');
INSERT INTO `product_view` VALUES (1084, 1, '2025-03-06 02:07:03');
INSERT INTO `product_view` VALUES (1085, 1, '2025-03-06 02:07:05');
INSERT INTO `product_view` VALUES (1086, 1, '2025-03-06 02:07:07');
INSERT INTO `product_view` VALUES (1087, 1, '2025-03-06 02:07:08');
INSERT INTO `product_view` VALUES (1088, 1, '2025-03-06 02:07:10');
INSERT INTO `product_view` VALUES (1089, 1, '2025-03-06 02:07:14');
INSERT INTO `product_view` VALUES (1090, 1, '2025-03-06 02:20:40');
INSERT INTO `product_view` VALUES (1091, 3, '2025-03-06 02:31:31');
INSERT INTO `product_view` VALUES (1092, 2, '2025-03-06 02:41:35');
INSERT INTO `product_view` VALUES (1093, 1, '2025-03-06 02:59:08');
INSERT INTO `product_view` VALUES (1094, 4, '2025-03-06 03:09:16');
INSERT INTO `product_view` VALUES (1095, 22, '2025-03-06 03:19:12');
INSERT INTO `product_view` VALUES (1096, 1, '2025-03-06 03:29:32');
INSERT INTO `product_view` VALUES (1097, 1, '2025-03-06 03:29:47');
INSERT INTO `product_view` VALUES (1098, 1, '2025-03-06 03:29:54');
INSERT INTO `product_view` VALUES (1099, 7, '2025-03-06 03:32:02');
INSERT INTO `product_view` VALUES (1100, 1, '2025-03-06 03:36:51');
INSERT INTO `product_view` VALUES (1101, 1, '2025-03-06 03:37:02');
INSERT INTO `product_view` VALUES (1102, 1, '2025-03-06 03:37:07');
INSERT INTO `product_view` VALUES (1103, 1, '2025-03-06 03:37:13');
INSERT INTO `product_view` VALUES (1104, 1, '2025-03-06 03:37:18');
INSERT INTO `product_view` VALUES (1105, 1, '2025-03-06 03:37:21');
INSERT INTO `product_view` VALUES (1106, 8, '2025-03-06 03:41:20');
INSERT INTO `product_view` VALUES (1107, 1, '2025-03-06 03:41:20');
INSERT INTO `product_view` VALUES (1108, 1, '2025-03-06 03:41:28');
INSERT INTO `product_view` VALUES (1109, 9, '2025-03-06 03:51:41');
INSERT INTO `product_view` VALUES (1110, 14, '2025-03-06 04:01:18');
INSERT INTO `product_view` VALUES (1111, 1, '2025-03-06 04:07:43');
INSERT INTO `product_view` VALUES (1112, 1, '2025-03-06 04:07:52');
INSERT INTO `product_view` VALUES (1113, 1, '2025-03-06 04:07:55');
INSERT INTO `product_view` VALUES (1114, 1, '2025-03-06 04:07:57');
INSERT INTO `product_view` VALUES (1115, 1, '2025-03-06 04:07:59');
INSERT INTO `product_view` VALUES (1116, 1, '2025-03-06 04:08:01');
INSERT INTO `product_view` VALUES (1117, 2, '2025-03-06 04:08:10');
INSERT INTO `product_view` VALUES (1118, 2, '2025-03-06 04:08:16');
INSERT INTO `product_view` VALUES (1119, 1, '2025-03-06 04:11:49');
INSERT INTO `product_view` VALUES (1120, 1, '2025-03-06 04:11:59');
INSERT INTO `product_view` VALUES (1121, 1, '2025-03-06 04:12:02');
INSERT INTO `product_view` VALUES (1122, 1, '2025-03-06 04:12:06');
INSERT INTO `product_view` VALUES (1123, 1, '2025-03-06 04:13:00');
INSERT INTO `product_view` VALUES (1124, 1, '2025-03-06 04:13:32');
INSERT INTO `product_view` VALUES (1125, 1, '2025-03-06 04:13:41');
INSERT INTO `product_view` VALUES (1126, 1, '2025-03-06 04:13:44');
INSERT INTO `product_view` VALUES (1127, 1, '2025-03-06 04:13:47');
INSERT INTO `product_view` VALUES (1128, 1, '2025-03-06 04:13:51');
INSERT INTO `product_view` VALUES (1129, 1, '2025-03-06 04:13:55');
INSERT INTO `product_view` VALUES (1130, 1, '2025-03-06 04:14:00');
INSERT INTO `product_view` VALUES (1131, 1, '2025-03-06 04:14:15');
INSERT INTO `product_view` VALUES (1132, 1, '2025-03-06 04:14:18');
INSERT INTO `product_view` VALUES (1133, 1, '2025-03-06 04:15:00');
INSERT INTO `product_view` VALUES (1134, 1, '2025-03-06 04:15:03');
INSERT INTO `product_view` VALUES (1135, 1, '2025-03-06 04:15:19');
INSERT INTO `product_view` VALUES (1136, 16, '2025-03-06 04:15:46');
INSERT INTO `product_view` VALUES (1137, 1, '2025-03-06 04:15:58');
INSERT INTO `product_view` VALUES (1138, 1, '2025-03-06 04:16:11');
INSERT INTO `product_view` VALUES (1139, 1, '2025-03-06 04:16:16');
INSERT INTO `product_view` VALUES (1140, 1, '2025-03-06 04:16:22');
INSERT INTO `product_view` VALUES (1141, 1, '2025-03-06 04:16:29');
INSERT INTO `product_view` VALUES (1142, 1, '2025-03-06 04:16:35');
INSERT INTO `product_view` VALUES (1143, 2, '2025-03-06 04:16:43');
INSERT INTO `product_view` VALUES (1144, 2, '2025-03-06 04:16:47');
INSERT INTO `product_view` VALUES (1145, 1, '2025-03-06 04:18:30');
INSERT INTO `product_view` VALUES (1146, 1, '2025-03-06 04:18:39');
INSERT INTO `product_view` VALUES (1147, 1, '2025-03-06 04:18:41');
INSERT INTO `product_view` VALUES (1148, 1, '2025-03-06 04:18:43');
INSERT INTO `product_view` VALUES (1149, 1, '2025-03-06 04:18:46');
INSERT INTO `product_view` VALUES (1150, 1, '2025-03-06 04:18:48');
INSERT INTO `product_view` VALUES (1151, 2, '2025-03-06 04:18:51');
INSERT INTO `product_view` VALUES (1152, 2, '2025-03-06 04:18:56');
INSERT INTO `product_view` VALUES (1153, 1, '2025-03-06 04:22:41');
INSERT INTO `product_view` VALUES (1154, 1, '2025-03-06 04:23:02');
INSERT INTO `product_view` VALUES (1155, 1, '2025-03-06 04:23:05');
INSERT INTO `product_view` VALUES (1156, 1, '2025-03-06 04:23:08');
INSERT INTO `product_view` VALUES (1157, 1, '2025-03-06 04:23:10');
INSERT INTO `product_view` VALUES (1158, 1, '2025-03-06 04:23:13');
INSERT INTO `product_view` VALUES (1159, 1, '2025-03-06 04:23:17');
INSERT INTO `product_view` VALUES (1160, 2, '2025-03-06 04:23:27');
INSERT INTO `product_view` VALUES (1161, 2, '2025-03-06 04:23:30');
INSERT INTO `product_view` VALUES (1162, 20, '2025-03-06 04:48:47');
INSERT INTO `product_view` VALUES (1163, 8, '2025-03-06 04:49:12');
INSERT INTO `product_view` VALUES (1164, 10, '2025-03-06 04:50:02');
INSERT INTO `product_view` VALUES (1165, 1, '2025-03-06 05:14:37');
INSERT INTO `product_view` VALUES (1166, 1, '2025-03-06 05:15:08');
INSERT INTO `product_view` VALUES (1167, 1, '2025-03-06 05:15:20');
INSERT INTO `product_view` VALUES (1168, 1, '2025-03-06 05:15:37');
INSERT INTO `product_view` VALUES (1169, 1, '2025-03-06 05:15:50');
INSERT INTO `product_view` VALUES (1170, 1, '2025-03-06 05:16:10');
INSERT INTO `product_view` VALUES (1171, 1, '2025-03-06 05:16:17');
INSERT INTO `product_view` VALUES (1172, 1, '2025-03-06 05:16:22');
INSERT INTO `product_view` VALUES (1173, 1, '2025-03-06 05:16:29');
INSERT INTO `product_view` VALUES (1174, 1, '2025-03-06 05:16:34');
INSERT INTO `product_view` VALUES (1175, 1, '2025-03-06 05:25:05');
INSERT INTO `product_view` VALUES (1176, 1, '2025-03-06 05:25:18');
INSERT INTO `product_view` VALUES (1177, 2, '2025-03-06 05:25:25');
INSERT INTO `product_view` VALUES (1178, 2, '2025-03-06 05:25:33');
INSERT INTO `product_view` VALUES (1179, 1, '2025-03-06 05:46:35');
INSERT INTO `product_view` VALUES (1180, 1, '2025-03-06 05:47:25');
INSERT INTO `product_view` VALUES (1181, 1, '2025-03-06 05:47:28');
INSERT INTO `product_view` VALUES (1182, 1, '2025-03-06 05:47:33');
INSERT INTO `product_view` VALUES (1183, 1, '2025-03-06 05:47:43');
INSERT INTO `product_view` VALUES (1184, 1, '2025-03-06 05:47:55');
INSERT INTO `product_view` VALUES (1185, 1, '2025-03-06 05:47:59');
INSERT INTO `product_view` VALUES (1186, 1, '2025-03-06 05:48:04');
INSERT INTO `product_view` VALUES (1187, 1, '2025-03-06 05:48:08');
INSERT INTO `product_view` VALUES (1188, 1, '2025-03-06 05:48:13');
INSERT INTO `product_view` VALUES (1189, 1, '2025-03-06 05:48:17');
INSERT INTO `product_view` VALUES (1190, 1, '2025-03-06 05:48:22');
INSERT INTO `product_view` VALUES (1191, 1, '2025-03-06 05:48:27');
INSERT INTO `product_view` VALUES (1192, 2, '2025-03-06 05:48:31');
INSERT INTO `product_view` VALUES (1193, 2, '2025-03-06 05:48:37');
INSERT INTO `product_view` VALUES (1194, 1, '2025-03-06 05:53:58');
INSERT INTO `product_view` VALUES (1195, 1, '2025-03-06 05:54:11');
INSERT INTO `product_view` VALUES (1196, 1, '2025-03-06 05:54:17');
INSERT INTO `product_view` VALUES (1197, 1, '2025-03-06 05:54:26');
INSERT INTO `product_view` VALUES (1198, 1, '2025-03-06 05:54:30');
INSERT INTO `product_view` VALUES (1199, 1, '2025-03-06 05:54:41');
INSERT INTO `product_view` VALUES (1200, 1, '2025-03-06 05:54:48');
INSERT INTO `product_view` VALUES (1201, 2, '2025-03-06 05:54:53');
INSERT INTO `product_view` VALUES (1202, 2, '2025-03-06 05:55:00');
INSERT INTO `product_view` VALUES (1203, 2, '2025-03-06 05:57:54');
INSERT INTO `product_view` VALUES (1204, 2, '2025-03-06 05:58:23');
INSERT INTO `product_view` VALUES (1205, 1, '2025-03-06 05:58:54');
INSERT INTO `product_view` VALUES (1206, 2, '2025-03-06 05:58:55');
INSERT INTO `product_view` VALUES (1207, 1, '2025-03-06 06:04:16');
INSERT INTO `product_view` VALUES (1208, 1, '2025-03-06 06:05:05');
INSERT INTO `product_view` VALUES (1209, 1, '2025-03-06 06:12:47');
INSERT INTO `product_view` VALUES (1210, 1, '2025-03-06 06:13:02');
INSERT INTO `product_view` VALUES (1211, 1, '2025-03-06 06:13:14');
INSERT INTO `product_view` VALUES (1212, 1, '2025-03-06 06:13:27');
INSERT INTO `product_view` VALUES (1213, 1, '2025-03-06 06:13:34');
INSERT INTO `product_view` VALUES (1214, 1, '2025-03-06 06:13:50');
INSERT INTO `product_view` VALUES (1215, 1, '2025-03-06 06:13:56');
INSERT INTO `product_view` VALUES (1216, 2, '2025-03-06 06:14:02');
INSERT INTO `product_view` VALUES (1217, 2, '2025-03-06 06:14:07');
INSERT INTO `product_view` VALUES (1218, 1, '2025-03-06 06:36:17');
INSERT INTO `product_view` VALUES (1219, 1, '2025-03-06 06:42:06');
INSERT INTO `product_view` VALUES (1220, 1, '2025-03-06 06:43:34');
INSERT INTO `product_view` VALUES (1221, 1, '2025-03-06 06:43:43');
INSERT INTO `product_view` VALUES (1222, 1, '2025-03-06 06:43:48');
INSERT INTO `product_view` VALUES (1223, 1, '2025-03-06 06:43:56');
INSERT INTO `product_view` VALUES (1224, 1, '2025-03-06 06:44:02');
INSERT INTO `product_view` VALUES (1225, 3, '2025-03-06 06:44:14');
INSERT INTO `product_view` VALUES (1226, 1, '2025-03-06 06:44:52');
INSERT INTO `product_view` VALUES (1227, 1, '2025-03-06 06:44:52');
INSERT INTO `product_view` VALUES (1228, 1, '2025-03-06 06:45:14');
INSERT INTO `product_view` VALUES (1229, 1, '2025-03-06 06:45:20');
INSERT INTO `product_view` VALUES (1230, 1, '2025-03-06 06:45:21');
INSERT INTO `product_view` VALUES (1231, 1, '2025-03-06 06:46:24');
INSERT INTO `product_view` VALUES (1232, 1, '2025-03-06 06:47:43');
INSERT INTO `product_view` VALUES (1233, 1, '2025-03-06 06:48:15');
INSERT INTO `product_view` VALUES (1234, 1, '2025-03-06 06:48:55');
INSERT INTO `product_view` VALUES (1235, 1, '2025-03-06 06:48:59');
INSERT INTO `product_view` VALUES (1236, 1, '2025-03-06 06:49:38');
INSERT INTO `product_view` VALUES (1237, 1, '2025-03-06 06:50:10');
INSERT INTO `product_view` VALUES (1238, 1, '2025-03-06 06:52:38');
INSERT INTO `product_view` VALUES (1239, 1, '2025-03-06 06:53:00');
INSERT INTO `product_view` VALUES (1240, 1, '2025-03-06 06:53:04');
INSERT INTO `product_view` VALUES (1241, 1, '2025-03-06 06:53:08');
INSERT INTO `product_view` VALUES (1242, 1, '2025-03-06 06:53:14');
INSERT INTO `product_view` VALUES (1243, 1, '2025-03-06 06:56:38');
INSERT INTO `product_view` VALUES (1244, 1, '2025-03-06 06:57:40');
INSERT INTO `product_view` VALUES (1245, 1, '2025-03-06 06:57:44');
INSERT INTO `product_view` VALUES (1246, 1, '2025-03-06 06:57:47');
INSERT INTO `product_view` VALUES (1247, 1, '2025-03-06 06:58:10');
INSERT INTO `product_view` VALUES (1248, 8, '2025-03-06 15:42:59');
INSERT INTO `product_view` VALUES (1249, 1, '2025-03-06 15:43:32');
INSERT INTO `product_view` VALUES (1250, 1, '2025-03-06 15:44:33');
INSERT INTO `product_view` VALUES (1251, 1, '2025-03-06 15:44:58');
INSERT INTO `product_view` VALUES (1252, 1, '2025-03-06 15:45:01');
INSERT INTO `product_view` VALUES (1253, 1, '2025-03-06 15:45:02');
INSERT INTO `product_view` VALUES (1254, 1, '2025-03-06 15:45:03');
INSERT INTO `product_view` VALUES (1255, 1, '2025-03-06 15:45:03');
INSERT INTO `product_view` VALUES (1256, 1, '2025-03-06 15:45:11');
INSERT INTO `product_view` VALUES (1257, 5, '2025-03-06 15:46:47');
INSERT INTO `product_view` VALUES (1258, 5, '2025-03-06 15:46:52');
INSERT INTO `product_view` VALUES (1259, 5, '2025-03-06 15:46:53');
INSERT INTO `product_view` VALUES (1260, 5, '2025-03-06 15:46:53');
INSERT INTO `product_view` VALUES (1261, 5, '2025-03-06 15:46:54');
INSERT INTO `product_view` VALUES (1262, 5, '2025-03-06 15:46:54');
INSERT INTO `product_view` VALUES (1263, 1, '2025-03-06 15:48:31');
INSERT INTO `product_view` VALUES (1264, 1, '2025-03-06 17:54:26');
INSERT INTO `product_view` VALUES (1265, 1, '2025-03-06 17:54:34');
INSERT INTO `product_view` VALUES (1266, 1, '2025-03-06 17:54:36');
INSERT INTO `product_view` VALUES (1267, 1, '2025-03-06 17:54:38');
INSERT INTO `product_view` VALUES (1268, 1, '2025-03-06 17:54:40');
INSERT INTO `product_view` VALUES (1269, 1, '2025-03-06 17:54:55');
INSERT INTO `product_view` VALUES (1270, 1, '2025-03-06 17:54:56');
INSERT INTO `product_view` VALUES (1271, 1, '2025-03-06 17:55:01');
INSERT INTO `product_view` VALUES (1272, 1, '2025-03-06 17:55:06');
INSERT INTO `product_view` VALUES (1273, 2, '2025-03-06 17:55:18');
INSERT INTO `product_view` VALUES (1274, 2, '2025-03-06 17:55:23');
INSERT INTO `product_view` VALUES (1275, 1, '2025-03-07 14:26:48');
INSERT INTO `product_view` VALUES (1276, 3, '2025-03-07 14:27:00');
INSERT INTO `product_view` VALUES (1277, 4, '2025-03-07 14:27:12');
INSERT INTO `product_view` VALUES (1278, 59, '2025-03-07 14:27:26');
INSERT INTO `product_view` VALUES (1279, 59, '2025-03-07 14:27:27');
INSERT INTO `product_view` VALUES (1280, 51, '2025-03-07 14:27:34');
INSERT INTO `product_view` VALUES (1281, 51, '2025-03-07 14:27:34');
INSERT INTO `product_view` VALUES (1282, 1, '2025-03-07 14:27:44');
INSERT INTO `product_view` VALUES (1283, 1, '2025-03-07 14:28:00');
INSERT INTO `product_view` VALUES (1284, 1, '2025-03-07 14:28:03');
INSERT INTO `product_view` VALUES (1285, 1, '2025-03-07 14:28:06');
INSERT INTO `product_view` VALUES (1286, 1, '2025-03-07 14:45:45');
INSERT INTO `product_view` VALUES (1287, 1, '2025-03-07 14:45:49');
INSERT INTO `product_view` VALUES (1288, 1, '2025-03-07 14:45:51');
INSERT INTO `product_view` VALUES (1289, 1, '2025-03-07 14:45:52');
INSERT INTO `product_view` VALUES (1290, 1, '2025-03-07 14:45:56');
INSERT INTO `product_view` VALUES (1291, 1, '2025-03-07 14:46:02');
INSERT INTO `product_view` VALUES (1292, 1, '2025-03-07 14:46:04');
INSERT INTO `product_view` VALUES (1293, 1, '2025-03-07 14:46:18');
INSERT INTO `product_view` VALUES (1294, 1, '2025-03-07 14:46:27');
INSERT INTO `product_view` VALUES (1295, 1, '2025-03-07 14:46:37');
INSERT INTO `product_view` VALUES (1296, 2, '2025-03-07 14:46:45');
INSERT INTO `product_view` VALUES (1297, 2, '2025-03-07 14:46:50');
INSERT INTO `product_view` VALUES (1298, 3, '2025-03-07 14:46:52');
INSERT INTO `product_view` VALUES (1299, 3, '2025-03-07 14:46:55');
INSERT INTO `product_view` VALUES (1300, 2, '2025-03-07 14:50:14');
INSERT INTO `product_view` VALUES (1301, 1, '2025-03-07 14:50:18');
INSERT INTO `product_view` VALUES (1302, 1, '2025-03-07 14:55:09');
INSERT INTO `product_view` VALUES (1303, 1, '2025-03-07 14:56:06');
INSERT INTO `product_view` VALUES (1304, 1, '2025-03-07 14:56:14');
INSERT INTO `product_view` VALUES (1305, 1, '2025-03-07 14:56:20');
INSERT INTO `product_view` VALUES (1306, 1, '2025-03-07 14:56:25');
INSERT INTO `product_view` VALUES (1307, 1, '2025-03-07 14:56:31');
INSERT INTO `product_view` VALUES (1308, 1, '2025-03-07 14:59:32');
INSERT INTO `product_view` VALUES (1309, 1, '2025-03-07 14:59:36');
INSERT INTO `product_view` VALUES (1310, 1, '2025-03-07 15:01:33');
INSERT INTO `product_view` VALUES (1311, 1, '2025-03-07 15:01:38');
INSERT INTO `product_view` VALUES (1312, 1, '2025-03-07 15:01:43');
INSERT INTO `product_view` VALUES (1313, 1, '2025-03-07 15:39:44');
INSERT INTO `product_view` VALUES (1314, 1, '2025-03-07 15:39:52');
INSERT INTO `product_view` VALUES (1315, 1, '2025-03-07 15:48:39');
INSERT INTO `product_view` VALUES (1316, 1, '2025-03-07 15:48:43');
INSERT INTO `product_view` VALUES (1317, 1, '2025-03-08 13:38:33');
INSERT INTO `product_view` VALUES (1318, 1, '2025-03-08 16:54:47');
INSERT INTO `product_view` VALUES (1319, 1, '2025-03-08 16:54:53');
INSERT INTO `product_view` VALUES (1320, 44, '2025-03-08 16:55:05');
INSERT INTO `product_view` VALUES (1321, 44, '2025-03-08 16:55:05');
INSERT INTO `product_view` VALUES (1322, 39, '2025-03-08 16:55:10');
INSERT INTO `product_view` VALUES (1323, 39, '2025-03-08 16:55:11');
INSERT INTO `product_view` VALUES (1324, 40, '2025-03-08 16:55:17');
INSERT INTO `product_view` VALUES (1325, 40, '2025-03-08 16:55:17');
INSERT INTO `product_view` VALUES (1326, 3, '2025-03-08 16:55:32');
INSERT INTO `product_view` VALUES (1327, 81, '2025-03-08 16:55:42');
INSERT INTO `product_view` VALUES (1328, 81, '2025-03-08 16:55:43');
INSERT INTO `product_view` VALUES (1329, 79, '2025-03-08 16:55:46');
INSERT INTO `product_view` VALUES (1330, 79, '2025-03-08 16:55:46');
INSERT INTO `product_view` VALUES (1331, 1, '2025-03-09 02:11:54');
INSERT INTO `product_view` VALUES (1332, 39, '2025-03-09 02:12:48');
INSERT INTO `product_view` VALUES (1333, 3, '2025-03-09 02:12:53');
INSERT INTO `product_view` VALUES (1334, 2, '2025-03-09 02:12:59');
INSERT INTO `product_view` VALUES (1335, 1, '2025-03-09 02:28:41');
INSERT INTO `product_view` VALUES (1336, 1, '2025-03-09 02:28:50');
INSERT INTO `product_view` VALUES (1337, 1, '2025-03-09 02:41:15');
INSERT INTO `product_view` VALUES (1338, 1, '2025-03-09 02:41:21');
INSERT INTO `product_view` VALUES (1339, 25, '2025-03-09 02:45:01');
INSERT INTO `product_view` VALUES (1340, 67, '2025-03-09 02:45:14');
INSERT INTO `product_view` VALUES (1341, 11, '2025-03-09 02:45:23');
INSERT INTO `product_view` VALUES (1342, 12, '2025-03-09 02:45:32');
INSERT INTO `product_view` VALUES (1343, 13, '2025-03-09 02:45:40');
INSERT INTO `product_view` VALUES (1344, 14, '2025-03-09 02:45:50');
INSERT INTO `product_view` VALUES (1345, 15, '2025-03-09 02:45:59');
INSERT INTO `product_view` VALUES (1346, 16, '2025-03-09 02:46:08');
INSERT INTO `product_view` VALUES (1347, 17, '2025-03-09 02:46:18');
INSERT INTO `product_view` VALUES (1348, 1, '2025-03-09 02:46:26');
INSERT INTO `product_view` VALUES (1349, 18, '2025-03-09 02:46:29');
INSERT INTO `product_view` VALUES (1350, 1, '2025-03-09 02:46:32');
INSERT INTO `product_view` VALUES (1351, 19, '2025-03-09 02:46:38');
INSERT INTO `product_view` VALUES (1352, 20, '2025-03-09 02:46:48');
INSERT INTO `product_view` VALUES (1353, 21, '2025-03-09 02:46:59');
INSERT INTO `product_view` VALUES (1354, 22, '2025-03-09 02:47:16');
INSERT INTO `product_view` VALUES (1355, 23, '2025-03-09 02:47:21');
INSERT INTO `product_view` VALUES (1356, 24, '2025-03-09 02:47:27');
INSERT INTO `product_view` VALUES (1357, 26, '2025-03-09 02:47:39');
INSERT INTO `product_view` VALUES (1358, 27, '2025-03-09 02:47:45');
INSERT INTO `product_view` VALUES (1359, 28, '2025-03-09 02:47:52');
INSERT INTO `product_view` VALUES (1360, 10, '2025-03-09 02:47:56');
INSERT INTO `product_view` VALUES (1361, 30, '2025-03-09 02:48:02');
INSERT INTO `product_view` VALUES (1362, 31, '2025-03-09 02:48:08');
INSERT INTO `product_view` VALUES (1363, 32, '2025-03-09 02:48:15');
INSERT INTO `product_view` VALUES (1364, 33, '2025-03-09 02:48:21');
INSERT INTO `product_view` VALUES (1365, 34, '2025-03-09 02:48:27');
INSERT INTO `product_view` VALUES (1366, 35, '2025-03-09 02:48:32');
INSERT INTO `product_view` VALUES (1367, 36, '2025-03-09 02:48:37');
INSERT INTO `product_view` VALUES (1368, 37, '2025-03-09 02:48:42');
INSERT INTO `product_view` VALUES (1369, 38, '2025-03-09 02:48:48');
INSERT INTO `product_view` VALUES (1370, 4, '2025-03-09 02:48:53');
INSERT INTO `product_view` VALUES (1371, 40, '2025-03-09 02:49:07');
INSERT INTO `product_view` VALUES (1372, 41, '2025-03-09 02:49:13');
INSERT INTO `product_view` VALUES (1373, 42, '2025-03-09 02:49:21');
INSERT INTO `product_view` VALUES (1374, 43, '2025-03-09 02:49:29');
INSERT INTO `product_view` VALUES (1375, 44, '2025-03-09 02:49:38');
INSERT INTO `product_view` VALUES (1376, 45, '2025-03-09 02:49:48');
INSERT INTO `product_view` VALUES (1377, 47, '2025-03-09 02:50:12');
INSERT INTO `product_view` VALUES (1378, 48, '2025-03-09 02:50:26');
INSERT INTO `product_view` VALUES (1379, 49, '2025-03-09 02:50:38');
INSERT INTO `product_view` VALUES (1380, 5, '2025-03-09 02:50:50');
INSERT INTO `product_view` VALUES (1381, 50, '2025-03-09 02:51:03');
INSERT INTO `product_view` VALUES (1382, 51, '2025-03-09 02:51:18');
INSERT INTO `product_view` VALUES (1383, 52, '2025-03-09 02:51:30');
INSERT INTO `product_view` VALUES (1384, 53, '2025-03-09 02:51:41');
INSERT INTO `product_view` VALUES (1385, 54, '2025-03-09 02:51:52');
INSERT INTO `product_view` VALUES (1386, 55, '2025-03-09 02:52:03');
INSERT INTO `product_view` VALUES (1387, 56, '2025-03-09 02:52:14');
INSERT INTO `product_view` VALUES (1388, 57, '2025-03-09 02:52:19');
INSERT INTO `product_view` VALUES (1389, 58, '2025-03-09 02:52:23');
INSERT INTO `product_view` VALUES (1390, 59, '2025-03-09 02:52:28');
INSERT INTO `product_view` VALUES (1391, 6, '2025-03-09 02:52:34');
INSERT INTO `product_view` VALUES (1392, 60, '2025-03-09 02:52:39');
INSERT INTO `product_view` VALUES (1393, 61, '2025-03-09 02:52:45');
INSERT INTO `product_view` VALUES (1394, 62, '2025-03-09 02:52:50');
INSERT INTO `product_view` VALUES (1395, 63, '2025-03-09 02:52:55');
INSERT INTO `product_view` VALUES (1396, 64, '2025-03-09 02:53:01');
INSERT INTO `product_view` VALUES (1397, 65, '2025-03-09 02:53:06');
INSERT INTO `product_view` VALUES (1398, 46, '2025-03-09 02:53:12');
INSERT INTO `product_view` VALUES (1399, 66, '2025-03-09 02:53:19');
INSERT INTO `product_view` VALUES (1400, 68, '2025-03-09 02:53:24');
INSERT INTO `product_view` VALUES (1401, 69, '2025-03-09 02:53:31');
INSERT INTO `product_view` VALUES (1402, 7, '2025-03-09 02:53:37');
INSERT INTO `product_view` VALUES (1403, 70, '2025-03-09 02:53:45');
INSERT INTO `product_view` VALUES (1404, 71, '2025-03-09 02:53:54');
INSERT INTO `product_view` VALUES (1405, 72, '2025-03-09 02:54:04');
INSERT INTO `product_view` VALUES (1406, 73, '2025-03-09 02:54:15');
INSERT INTO `product_view` VALUES (1407, 74, '2025-03-09 02:54:26');
INSERT INTO `product_view` VALUES (1408, 75, '2025-03-09 02:54:35');
INSERT INTO `product_view` VALUES (1409, 76, '2025-03-09 02:54:44');
INSERT INTO `product_view` VALUES (1410, 77, '2025-03-09 02:54:54');
INSERT INTO `product_view` VALUES (1411, 78, '2025-03-09 02:55:05');
INSERT INTO `product_view` VALUES (1412, 79, '2025-03-09 02:55:16');
INSERT INTO `product_view` VALUES (1413, 8, '2025-03-09 02:55:26');
INSERT INTO `product_view` VALUES (1414, 9, '2025-03-09 02:55:36');
INSERT INTO `product_view` VALUES (1415, 29, '2025-03-09 02:56:10');
INSERT INTO `product_view` VALUES (1416, 1, '2025-03-09 03:30:31');
INSERT INTO `product_view` VALUES (1417, 1, '2025-03-09 03:30:35');
INSERT INTO `product_view` VALUES (1418, 41, '2025-03-09 03:50:49');
INSERT INTO `product_view` VALUES (1419, 2, '2025-03-09 06:45:02');
INSERT INTO `product_view` VALUES (1420, 1, '2025-03-09 06:45:04');
INSERT INTO `product_view` VALUES (1421, 39, '2025-03-09 12:04:36');
INSERT INTO `product_view` VALUES (1422, 39, '2025-03-09 12:04:37');
INSERT INTO `product_view` VALUES (1423, 39, '2025-03-09 12:04:44');
INSERT INTO `product_view` VALUES (1424, 39, '2025-03-09 12:04:44');
INSERT INTO `product_view` VALUES (1425, 1, '2025-03-09 12:04:51');
INSERT INTO `product_view` VALUES (1426, 1, '2025-03-09 12:04:55');
INSERT INTO `product_view` VALUES (1427, 1, '2025-03-09 12:44:47');
INSERT INTO `product_view` VALUES (1428, 1, '2025-03-09 12:44:52');
INSERT INTO `product_view` VALUES (1429, 1, '2025-03-09 12:47:27');
INSERT INTO `product_view` VALUES (1430, 1, '2025-03-09 12:47:32');
INSERT INTO `product_view` VALUES (1431, 1, '2025-03-09 13:33:06');
INSERT INTO `product_view` VALUES (1432, 1, '2025-03-09 13:33:12');
INSERT INTO `product_view` VALUES (1433, 1, '2025-03-09 13:35:21');
INSERT INTO `product_view` VALUES (1434, 1, '2025-03-09 13:35:22');
INSERT INTO `product_view` VALUES (1435, 1, '2025-03-09 13:37:34');
INSERT INTO `product_view` VALUES (1436, 1, '2025-03-09 13:37:37');
INSERT INTO `product_view` VALUES (1437, 1, '2025-03-09 14:04:30');
INSERT INTO `product_view` VALUES (1438, 1, '2025-03-09 14:04:35');
INSERT INTO `product_view` VALUES (1439, 1, '2025-03-09 14:04:46');
INSERT INTO `product_view` VALUES (1440, 1, '2025-03-09 14:05:02');
INSERT INTO `product_view` VALUES (1441, 1, '2025-03-09 14:07:35');
INSERT INTO `product_view` VALUES (1442, 1, '2025-03-09 14:07:40');
INSERT INTO `product_view` VALUES (1443, 1, '2025-03-09 14:07:44');
INSERT INTO `product_view` VALUES (1444, 1, '2025-03-09 14:25:51');
INSERT INTO `product_view` VALUES (1445, 1, '2025-03-09 14:25:55');
INSERT INTO `product_view` VALUES (1446, 2, '2025-03-09 14:37:04');
INSERT INTO `product_view` VALUES (1447, 2, '2025-03-09 14:37:08');
INSERT INTO `product_view` VALUES (1448, 1, '2025-03-09 14:42:56');
INSERT INTO `product_view` VALUES (1449, 1, '2025-03-09 14:42:59');
INSERT INTO `product_view` VALUES (1450, 1, '2025-03-09 14:43:00');
INSERT INTO `product_view` VALUES (1451, 5, '2025-03-09 16:16:43');
INSERT INTO `product_view` VALUES (1452, 5, '2025-03-09 16:23:14');
INSERT INTO `product_view` VALUES (1453, 5, '2025-03-09 16:31:24');
INSERT INTO `product_view` VALUES (1454, 5, '2025-03-09 16:55:34');
INSERT INTO `product_view` VALUES (1455, 1, '2025-03-09 18:50:51');
INSERT INTO `product_view` VALUES (1456, 2, '2025-03-09 19:19:17');
INSERT INTO `product_view` VALUES (1457, 19, '2025-03-09 19:29:05');
INSERT INTO `product_view` VALUES (1458, 2, '2025-03-09 19:30:09');
INSERT INTO `product_view` VALUES (1459, 24, '2025-03-09 19:40:31');
INSERT INTO `product_view` VALUES (1460, 31, '2025-03-09 19:49:15');
INSERT INTO `product_view` VALUES (1461, 1, '2025-03-09 20:01:13');
INSERT INTO `product_view` VALUES (1462, 34, '2025-03-09 20:03:31');
INSERT INTO `product_view` VALUES (1463, 6, '2025-03-09 20:28:55');
INSERT INTO `product_view` VALUES (1464, 9, '2025-03-09 20:41:03');
INSERT INTO `product_view` VALUES (1465, 23, '2025-03-09 20:49:29');
INSERT INTO `product_view` VALUES (1466, 39, '2025-03-10 00:56:08');
INSERT INTO `product_view` VALUES (1467, 44, '2025-03-10 01:09:10');
INSERT INTO `product_view` VALUES (1468, 45, '2025-03-10 01:26:23');
INSERT INTO `product_view` VALUES (1469, 57, '2025-03-10 01:40:24');
INSERT INTO `product_view` VALUES (1470, 61, '2025-03-10 01:49:26');
INSERT INTO `product_view` VALUES (1471, 48, '2025-03-10 02:03:44');
INSERT INTO `product_view` VALUES (1472, 55, '2025-03-10 02:21:41');
INSERT INTO `product_view` VALUES (1473, 56, '2025-03-10 02:24:25');
INSERT INTO `product_view` VALUES (1474, 58, '2025-03-10 02:40:21');
INSERT INTO `product_view` VALUES (1475, 63, '2025-03-10 02:44:59');
INSERT INTO `product_view` VALUES (1476, 3, '2025-03-10 05:43:52');
INSERT INTO `product_view` VALUES (1477, 39, '2025-03-10 05:43:55');
INSERT INTO `product_view` VALUES (1478, 3, '2025-03-10 12:27:28');
INSERT INTO `product_view` VALUES (1479, 39, '2025-03-10 15:03:51');
INSERT INTO `product_view` VALUES (1480, 39, '2025-03-10 15:45:43');
INSERT INTO `product_view` VALUES (1481, 3, '2025-03-10 18:29:40');
INSERT INTO `product_view` VALUES (1482, 32, '2025-03-10 18:44:30');
INSERT INTO `product_view` VALUES (1483, 36, '2025-03-10 18:54:17');
INSERT INTO `product_view` VALUES (1484, 14, '2025-03-10 19:03:29');
INSERT INTO `product_view` VALUES (1485, 21, '2025-03-10 19:14:06');
INSERT INTO `product_view` VALUES (1486, 4, '2025-03-10 19:23:11');
INSERT INTO `product_view` VALUES (1487, 26, '2025-03-10 19:33:52');
INSERT INTO `product_view` VALUES (1488, 27, '2025-03-10 19:46:13');
INSERT INTO `product_view` VALUES (1489, 37, '2025-03-10 19:54:10');
INSERT INTO `product_view` VALUES (1490, 36, '2025-03-10 20:04:15');
INSERT INTO `product_view` VALUES (1491, 1, '2025-03-10 20:39:54');
INSERT INTO `product_view` VALUES (1492, 2, '2025-03-10 21:04:08');
INSERT INTO `product_view` VALUES (1493, 3, '2025-03-10 21:28:26');
INSERT INTO `product_view` VALUES (1494, 39, '2025-03-10 21:56:27');
INSERT INTO `product_view` VALUES (1495, 79, '2025-03-11 00:32:27');
INSERT INTO `product_view` VALUES (1496, 44, '2025-03-11 02:44:50');
INSERT INTO `product_view` VALUES (1497, 3, '2025-03-11 02:46:00');
INSERT INTO `product_view` VALUES (1498, 2, '2025-03-11 02:55:28');
INSERT INTO `product_view` VALUES (1499, 81, '2025-03-11 03:03:57');
INSERT INTO `product_view` VALUES (1500, 1, '2025-03-11 03:15:38');
INSERT INTO `product_view` VALUES (1501, 13, '2025-03-11 03:26:42');
INSERT INTO `product_view` VALUES (1502, 18, '2025-03-11 03:37:15');
INSERT INTO `product_view` VALUES (1503, 1, '2025-03-11 03:41:22');
INSERT INTO `product_view` VALUES (1504, 21, '2025-03-11 03:47:28');
INSERT INTO `product_view` VALUES (1505, 26, '2025-03-11 03:55:20');
INSERT INTO `product_view` VALUES (1506, 5, '2025-03-11 04:09:25');
INSERT INTO `product_view` VALUES (1507, 6, '2025-03-11 04:20:29');
INSERT INTO `product_view` VALUES (1508, 15, '2025-03-11 04:29:11');
INSERT INTO `product_view` VALUES (1509, 23, '2025-03-11 04:38:22');
INSERT INTO `product_view` VALUES (1510, 31, '2025-03-11 04:49:30');
INSERT INTO `product_view` VALUES (1511, 1, '2025-03-11 05:45:01');
INSERT INTO `product_view` VALUES (1512, 40, '2025-03-11 05:58:27');
INSERT INTO `product_view` VALUES (1513, 5, '2025-03-11 06:29:54');
INSERT INTO `product_view` VALUES (1514, 2, '2025-03-11 23:42:00');
INSERT INTO `product_view` VALUES (1515, 39, '2025-03-11 23:42:01');
INSERT INTO `product_view` VALUES (1516, 1, '2025-03-11 23:42:02');
INSERT INTO `product_view` VALUES (1517, 3, '2025-03-11 23:42:04');
INSERT INTO `product_view` VALUES (1518, 1, '2025-03-12 02:10:00');
INSERT INTO `product_view` VALUES (1519, 39, '2025-03-12 05:43:26');
INSERT INTO `product_view` VALUES (1520, 2, '2025-03-12 05:43:28');
INSERT INTO `product_view` VALUES (1521, 1, '2025-03-12 07:50:20');
INSERT INTO `product_view` VALUES (1522, 1, '2025-03-12 07:51:12');
INSERT INTO `product_view` VALUES (1523, 1, '2025-03-12 08:07:10');
INSERT INTO `product_view` VALUES (1524, 1, '2025-03-12 08:17:01');
INSERT INTO `product_view` VALUES (1525, 1, '2025-03-12 08:21:34');
INSERT INTO `product_view` VALUES (1526, 1, '2025-03-12 08:23:26');
INSERT INTO `product_view` VALUES (1527, 4, '2025-03-12 08:23:59');
INSERT INTO `product_view` VALUES (1528, 1, '2025-03-12 08:27:26');
INSERT INTO `product_view` VALUES (1529, 1, '2025-03-12 08:27:28');
INSERT INTO `product_view` VALUES (1530, 1, '2025-03-12 08:30:06');
INSERT INTO `product_view` VALUES (1531, 1, '2025-03-12 08:32:23');
INSERT INTO `product_view` VALUES (1532, 1, '2025-03-12 08:34:52');
INSERT INTO `product_view` VALUES (1533, 1, '2025-03-12 08:36:46');
INSERT INTO `product_view` VALUES (1534, 1, '2025-03-12 08:41:57');
INSERT INTO `product_view` VALUES (1535, 1, '2025-03-12 08:48:52');
INSERT INTO `product_view` VALUES (1536, 1, '2025-03-12 08:49:15');
INSERT INTO `product_view` VALUES (1537, 1, '2025-03-12 08:50:59');
INSERT INTO `product_view` VALUES (1538, 1, '2025-03-12 08:51:22');
INSERT INTO `product_view` VALUES (1539, 1, '2025-03-12 08:52:01');
INSERT INTO `product_view` VALUES (1540, 1, '2025-03-12 08:52:24');
INSERT INTO `product_view` VALUES (1541, 1, '2025-03-12 08:53:26');
INSERT INTO `product_view` VALUES (1542, 1, '2025-03-12 08:54:26');
INSERT INTO `product_view` VALUES (1543, 1, '2025-03-12 08:56:46');
INSERT INTO `product_view` VALUES (1544, 1, '2025-03-12 09:04:10');
INSERT INTO `product_view` VALUES (1545, 1, '2025-03-12 09:04:38');
INSERT INTO `product_view` VALUES (1546, 1, '2025-03-12 09:05:07');
INSERT INTO `product_view` VALUES (1547, 1, '2025-03-12 09:05:22');
INSERT INTO `product_view` VALUES (1548, 1, '2025-03-12 09:06:05');
INSERT INTO `product_view` VALUES (1549, 1, '2025-03-12 09:06:19');
INSERT INTO `product_view` VALUES (1550, 1, '2025-03-12 09:15:12');
INSERT INTO `product_view` VALUES (1551, 1, '2025-03-12 09:15:39');
INSERT INTO `product_view` VALUES (1552, 2, '2025-03-12 09:15:59');
INSERT INTO `product_view` VALUES (1553, 39, '2025-03-12 09:16:11');
INSERT INTO `product_view` VALUES (1554, 1, '2025-03-12 09:19:14');
INSERT INTO `product_view` VALUES (1555, 39, '2025-03-12 09:21:05');
INSERT INTO `product_view` VALUES (1556, 39, '2025-03-12 09:22:30');
INSERT INTO `product_view` VALUES (1557, 1, '2025-03-12 09:22:40');
INSERT INTO `product_view` VALUES (1558, 1, '2025-03-12 09:23:04');
INSERT INTO `product_view` VALUES (1559, 1, '2025-03-12 09:27:21');
INSERT INTO `product_view` VALUES (1560, 1, '2025-03-12 09:27:48');
INSERT INTO `product_view` VALUES (1561, 1, '2025-03-12 09:37:46');
INSERT INTO `product_view` VALUES (1562, 1, '2025-03-12 09:38:09');
INSERT INTO `product_view` VALUES (1563, 2, '2025-03-12 09:38:54');
INSERT INTO `product_view` VALUES (1564, 3, '2025-03-12 09:39:00');
INSERT INTO `product_view` VALUES (1565, 39, '2025-03-12 09:39:10');
INSERT INTO `product_view` VALUES (1566, 2, '2025-03-12 09:40:20');
INSERT INTO `product_view` VALUES (1567, 1, '2025-03-12 09:51:23');
INSERT INTO `product_view` VALUES (1568, 1, '2025-03-12 09:51:41');
INSERT INTO `product_view` VALUES (1569, 39, '2025-03-12 09:51:58');
INSERT INTO `product_view` VALUES (1570, 1, '2025-03-12 09:55:15');
INSERT INTO `product_view` VALUES (1571, 1, '2025-03-12 09:55:40');
INSERT INTO `product_view` VALUES (1572, 1, '2025-03-12 09:59:52');
INSERT INTO `product_view` VALUES (1573, 1, '2025-03-12 10:00:15');
INSERT INTO `product_view` VALUES (1574, 1, '2025-03-12 10:12:32');
INSERT INTO `product_view` VALUES (1575, 1, '2025-03-12 10:12:51');
INSERT INTO `product_view` VALUES (1576, 2, '2025-03-12 10:13:04');
INSERT INTO `product_view` VALUES (1577, 3, '2025-03-12 10:13:10');
INSERT INTO `product_view` VALUES (1578, 39, '2025-03-12 10:13:16');
INSERT INTO `product_view` VALUES (1579, 1, '2025-03-12 10:25:58');
INSERT INTO `product_view` VALUES (1580, 1, '2025-03-12 10:26:16');
INSERT INTO `product_view` VALUES (1581, 39, '2025-03-12 10:26:33');
INSERT INTO `product_view` VALUES (1582, 2, '2025-03-12 10:26:47');
INSERT INTO `product_view` VALUES (1583, 5, '2025-03-12 10:26:57');
INSERT INTO `product_view` VALUES (1584, 1, '2025-03-12 10:29:59');
INSERT INTO `product_view` VALUES (1585, 1, '2025-03-12 10:30:18');
INSERT INTO `product_view` VALUES (1586, 1, '2025-03-12 10:30:42');
INSERT INTO `product_view` VALUES (1587, 1, '2025-03-12 10:33:35');
INSERT INTO `product_view` VALUES (1588, 1, '2025-03-12 10:33:55');
INSERT INTO `product_view` VALUES (1589, 1, '2025-03-12 10:38:27');
INSERT INTO `product_view` VALUES (1590, 1, '2025-03-12 10:41:31');
INSERT INTO `product_view` VALUES (1591, 2, '2025-03-12 10:42:32');
INSERT INTO `product_view` VALUES (1592, 1, '2025-03-12 10:42:44');
INSERT INTO `product_view` VALUES (1593, 1, '2025-03-12 10:43:52');
INSERT INTO `product_view` VALUES (1594, 3, '2025-03-12 10:44:06');
INSERT INTO `product_view` VALUES (1595, 3, '2025-03-12 10:44:41');
INSERT INTO `product_view` VALUES (1596, 3, '2025-03-12 10:45:36');
INSERT INTO `product_view` VALUES (1597, 1, '2025-03-12 10:45:47');
INSERT INTO `product_view` VALUES (1598, 1, '2025-03-12 10:46:12');
INSERT INTO `product_view` VALUES (1599, 2, '2025-03-12 10:46:46');
INSERT INTO `product_view` VALUES (1600, 1, '2025-03-12 10:47:00');
INSERT INTO `product_view` VALUES (1601, 39, '2025-03-12 10:47:09');
INSERT INTO `product_view` VALUES (1602, 1, '2025-03-12 10:47:30');
INSERT INTO `product_view` VALUES (1603, 1, '2025-03-12 10:48:06');
INSERT INTO `product_view` VALUES (1604, 1, '2025-03-12 10:50:06');
INSERT INTO `product_view` VALUES (1605, 39, '2025-03-12 10:50:39');
INSERT INTO `product_view` VALUES (1606, 1, '2025-03-12 10:50:54');
INSERT INTO `product_view` VALUES (1607, 1, '2025-03-12 10:51:19');
INSERT INTO `product_view` VALUES (1608, 39, '2025-03-12 10:52:24');
INSERT INTO `product_view` VALUES (1609, 1, '2025-03-12 17:09:25');
INSERT INTO `product_view` VALUES (1610, 1, '2025-03-12 17:09:58');
INSERT INTO `product_view` VALUES (1611, 39, '2025-03-12 17:10:18');
INSERT INTO `product_view` VALUES (1612, 1, '2025-03-13 02:34:00');
INSERT INTO `product_view` VALUES (1613, 1, '2025-03-13 02:49:22');
INSERT INTO `product_view` VALUES (1614, 1, '2025-03-13 03:05:18');
INSERT INTO `product_view` VALUES (1615, 1, '2025-03-13 03:45:18');
INSERT INTO `product_view` VALUES (1616, 1, '2025-03-13 03:45:59');
INSERT INTO `product_view` VALUES (1617, 3, '2025-03-13 05:43:23');
INSERT INTO `product_view` VALUES (1618, 1, '2025-03-13 06:54:21');
INSERT INTO `product_view` VALUES (1619, 1, '2025-03-13 07:10:56');
INSERT INTO `product_view` VALUES (1620, 1, '2025-03-13 07:11:51');
INSERT INTO `product_view` VALUES (1621, 1, '2025-03-13 07:38:11');
INSERT INTO `product_view` VALUES (1622, 5, '2025-03-13 07:38:19');
INSERT INTO `product_view` VALUES (1623, 1, '2025-03-13 07:42:15');
INSERT INTO `product_view` VALUES (1624, 1, '2025-03-13 07:45:25');
INSERT INTO `product_view` VALUES (1625, 1, '2025-03-13 07:46:14');
INSERT INTO `product_view` VALUES (1626, 1, '2025-03-13 07:48:55');
INSERT INTO `product_view` VALUES (1627, 1, '2025-03-13 07:52:30');
INSERT INTO `product_view` VALUES (1628, 1, '2025-03-13 07:54:39');
INSERT INTO `product_view` VALUES (1629, 1, '2025-03-13 07:56:38');
INSERT INTO `product_view` VALUES (1630, 1, '2025-03-13 08:00:32');
INSERT INTO `product_view` VALUES (1631, 10, '2025-03-13 19:36:24');
INSERT INTO `product_view` VALUES (1632, 11, '2025-03-13 19:59:42');
INSERT INTO `product_view` VALUES (1633, 12, '2025-03-13 20:21:56');
INSERT INTO `product_view` VALUES (1634, 13, '2025-03-13 20:43:19');
INSERT INTO `product_view` VALUES (1635, 13, '2025-03-13 20:58:13');
INSERT INTO `product_view` VALUES (1636, 14, '2025-03-13 21:03:39');
INSERT INTO `product_view` VALUES (1637, 15, '2025-03-13 21:23:38');
INSERT INTO `product_view` VALUES (1638, 16, '2025-03-13 21:44:36');
INSERT INTO `product_view` VALUES (1639, 17, '2025-03-13 22:29:44');
INSERT INTO `product_view` VALUES (1640, 18, '2025-03-13 22:52:32');
INSERT INTO `product_view` VALUES (1641, 1, '2025-03-13 23:26:08');
INSERT INTO `product_view` VALUES (1642, 2, '2025-03-13 23:26:11');
INSERT INTO `product_view` VALUES (1643, 3, '2025-03-13 23:26:13');
INSERT INTO `product_view` VALUES (1644, 39, '2025-03-13 23:26:15');
INSERT INTO `product_view` VALUES (1645, 4, '2025-03-13 23:26:24');
INSERT INTO `product_view` VALUES (1646, 5, '2025-03-13 23:26:27');
INSERT INTO `product_view` VALUES (1647, 6, '2025-03-13 23:26:29');
INSERT INTO `product_view` VALUES (1648, 7, '2025-03-13 23:26:31');
INSERT INTO `product_view` VALUES (1649, 8, '2025-03-13 23:26:33');
INSERT INTO `product_view` VALUES (1650, 19, '2025-03-14 00:04:00');
INSERT INTO `product_view` VALUES (1651, 20, '2025-03-14 00:50:40');
INSERT INTO `product_view` VALUES (1652, 21, '2025-03-14 01:36:16');
INSERT INTO `product_view` VALUES (1653, 22, '2025-03-14 03:02:55');
INSERT INTO `product_view` VALUES (1654, 24, '2025-03-14 03:46:43');
INSERT INTO `product_view` VALUES (1655, 23, '2025-03-14 04:33:11');
INSERT INTO `product_view` VALUES (1656, 25, '2025-03-14 05:15:04');
INSERT INTO `product_view` VALUES (1657, 2, '2025-03-14 05:43:11');
INSERT INTO `product_view` VALUES (1658, 26, '2025-03-14 05:55:41');
INSERT INTO `product_view` VALUES (1659, 27, '2025-03-14 06:33:52');
INSERT INTO `product_view` VALUES (1660, 28, '2025-03-14 07:09:42');
INSERT INTO `product_view` VALUES (1661, 29, '2025-03-14 07:43:38');
INSERT INTO `product_view` VALUES (1662, 30, '2025-03-14 07:59:52');
INSERT INTO `product_view` VALUES (1663, 32, '2025-03-14 08:35:02');
INSERT INTO `product_view` VALUES (1664, 31, '2025-03-14 08:55:06');
INSERT INTO `product_view` VALUES (1665, 33, '2025-03-14 09:14:18');
INSERT INTO `product_view` VALUES (1666, 34, '2025-03-14 09:33:37');
INSERT INTO `product_view` VALUES (1667, 35, '2025-03-14 09:53:40');
INSERT INTO `product_view` VALUES (1668, 37, '2025-03-14 10:33:41');
INSERT INTO `product_view` VALUES (1669, 38, '2025-03-14 10:56:33');
INSERT INTO `product_view` VALUES (1670, 4, '2025-03-14 11:16:07');
INSERT INTO `product_view` VALUES (1671, 5, '2025-03-14 11:35:02');
INSERT INTO `product_view` VALUES (1672, 6, '2025-03-14 11:53:48');
INSERT INTO `product_view` VALUES (1673, 7, '2025-03-14 12:12:41');
INSERT INTO `product_view` VALUES (1674, 3, '2025-03-14 12:26:10');
INSERT INTO `product_view` VALUES (1675, 2, '2025-03-14 12:28:04');
INSERT INTO `product_view` VALUES (1676, 1, '2025-03-14 12:28:04');
INSERT INTO `product_view` VALUES (1677, 39, '2025-03-14 12:29:33');
INSERT INTO `product_view` VALUES (1678, 36, '2025-03-14 12:31:17');
INSERT INTO `product_view` VALUES (1679, 8, '2025-03-14 12:49:10');
INSERT INTO `product_view` VALUES (1680, 9, '2025-03-14 13:08:20');
INSERT INTO `product_view` VALUES (1681, 40, '2025-03-14 14:02:36');
INSERT INTO `product_view` VALUES (1682, 43, '2025-03-14 14:20:57');
INSERT INTO `product_view` VALUES (1683, 44, '2025-03-14 14:39:27');
INSERT INTO `product_view` VALUES (1684, 46, '2025-03-14 14:57:04');
INSERT INTO `product_view` VALUES (1685, 6, '2025-03-14 14:58:47');
INSERT INTO `product_view` VALUES (1686, 4, '2025-03-14 15:01:54');
INSERT INTO `product_view` VALUES (1687, 9, '2025-03-14 15:01:54');
INSERT INTO `product_view` VALUES (1688, 5, '2025-03-14 15:04:42');
INSERT INTO `product_view` VALUES (1689, 8, '2025-03-14 15:04:43');
INSERT INTO `product_view` VALUES (1690, 37, '2025-03-14 15:07:33');
INSERT INTO `product_view` VALUES (1691, 7, '2025-03-14 15:07:33');
INSERT INTO `product_view` VALUES (1692, 36, '2025-03-14 15:10:31');
INSERT INTO `product_view` VALUES (1693, 38, '2025-03-14 15:10:31');
INSERT INTO `product_view` VALUES (1694, 19, '2025-03-14 15:13:08');
INSERT INTO `product_view` VALUES (1695, 35, '2025-03-14 15:13:08');
INSERT INTO `product_view` VALUES (1696, 48, '2025-03-14 15:15:04');
INSERT INTO `product_view` VALUES (1697, 24, '2025-03-14 15:15:54');
INSERT INTO `product_view` VALUES (1698, 13, '2025-03-14 15:15:54');
INSERT INTO `product_view` VALUES (1699, 22, '2025-03-14 15:18:39');
INSERT INTO `product_view` VALUES (1700, 20, '2025-03-14 15:18:39');
INSERT INTO `product_view` VALUES (1701, 31, '2025-03-14 15:21:26');
INSERT INTO `product_view` VALUES (1702, 12, '2025-03-14 15:21:26');
INSERT INTO `product_view` VALUES (1703, 10, '2025-03-14 15:24:07');
INSERT INTO `product_view` VALUES (1704, 16, '2025-03-14 15:24:07');
INSERT INTO `product_view` VALUES (1705, 29, '2025-03-14 15:26:53');
INSERT INTO `product_view` VALUES (1706, 33, '2025-03-14 15:26:53');
INSERT INTO `product_view` VALUES (1707, 15, '2025-03-14 15:29:48');
INSERT INTO `product_view` VALUES (1708, 30, '2025-03-14 15:29:48');
INSERT INTO `product_view` VALUES (1709, 21, '2025-03-14 15:32:29');
INSERT INTO `product_view` VALUES (1710, 27, '2025-03-14 15:32:29');
INSERT INTO `product_view` VALUES (1711, 28, '2025-03-14 15:35:20');
INSERT INTO `product_view` VALUES (1712, 34, '2025-03-14 15:35:20');
INSERT INTO `product_view` VALUES (1713, 23, '2025-03-14 15:38:00');
INSERT INTO `product_view` VALUES (1714, 25, '2025-03-14 15:38:00');
INSERT INTO `product_view` VALUES (1715, 18, '2025-03-14 15:40:37');
INSERT INTO `product_view` VALUES (1716, 32, '2025-03-14 15:40:37');
INSERT INTO `product_view` VALUES (1717, 26, '2025-03-14 15:43:23');
INSERT INTO `product_view` VALUES (1718, 17, '2025-03-14 15:43:23');
INSERT INTO `product_view` VALUES (1719, 14, '2025-03-14 15:46:00');
INSERT INTO `product_view` VALUES (1720, 50, '2025-03-14 15:47:48');
INSERT INTO `product_view` VALUES (1721, 52, '2025-03-14 16:04:42');
INSERT INTO `product_view` VALUES (1722, 67, '2025-03-14 16:22:52');
INSERT INTO `product_view` VALUES (1723, 68, '2025-03-14 16:22:52');
INSERT INTO `product_view` VALUES (1724, 72, '2025-03-14 16:25:35');
INSERT INTO `product_view` VALUES (1725, 46, '2025-03-14 16:25:35');
INSERT INTO `product_view` VALUES (1726, 41, '2025-03-14 16:25:52');
INSERT INTO `product_view` VALUES (1727, 53, '2025-03-14 16:28:07');
INSERT INTO `product_view` VALUES (1728, 49, '2025-03-14 16:28:07');
INSERT INTO `product_view` VALUES (1729, 55, '2025-03-14 16:30:41');
INSERT INTO `product_view` VALUES (1730, 47, '2025-03-14 16:30:41');
INSERT INTO `product_view` VALUES (1731, 73, '2025-03-14 16:33:32');
INSERT INTO `product_view` VALUES (1732, 79, '2025-03-14 16:33:32');
INSERT INTO `product_view` VALUES (1733, 70, '2025-03-14 16:35:27');
INSERT INTO `product_view` VALUES (1734, 65, '2025-03-14 16:35:27');
INSERT INTO `product_view` VALUES (1735, 57, '2025-03-14 16:36:45');
INSERT INTO `product_view` VALUES (1736, 76, '2025-03-14 16:36:45');
INSERT INTO `product_view` VALUES (1737, 60, '2025-03-14 16:39:33');
INSERT INTO `product_view` VALUES (1738, 66, '2025-03-14 16:39:33');
INSERT INTO `product_view` VALUES (1739, 52, '2025-03-14 16:41:09');
INSERT INTO `product_view` VALUES (1740, 75, '2025-03-14 16:41:09');
INSERT INTO `product_view` VALUES (1741, 45, '2025-03-14 16:42:26');
INSERT INTO `product_view` VALUES (1742, 42, '2025-03-14 16:43:13');
INSERT INTO `product_view` VALUES (1743, 59, '2025-03-14 16:43:13');
INSERT INTO `product_view` VALUES (1744, 45, '2025-03-14 16:45:22');
INSERT INTO `product_view` VALUES (1745, 43, '2025-03-14 16:45:22');
INSERT INTO `product_view` VALUES (1746, 51, '2025-03-14 16:46:59');
INSERT INTO `product_view` VALUES (1747, 69, '2025-03-14 16:46:59');
INSERT INTO `product_view` VALUES (1748, 61, '2025-03-14 16:49:21');
INSERT INTO `product_view` VALUES (1749, 58, '2025-03-14 16:49:21');
INSERT INTO `product_view` VALUES (1750, 50, '2025-03-14 16:51:30');
INSERT INTO `product_view` VALUES (1751, 41, '2025-03-14 16:51:30');
INSERT INTO `product_view` VALUES (1752, 63, '2025-03-14 16:53:02');
INSERT INTO `product_view` VALUES (1753, 71, '2025-03-14 16:53:02');
INSERT INTO `product_view` VALUES (1754, 74, '2025-03-14 16:54:37');
INSERT INTO `product_view` VALUES (1755, 44, '2025-03-14 16:54:37');
INSERT INTO `product_view` VALUES (1756, 40, '2025-03-14 16:57:13');
INSERT INTO `product_view` VALUES (1757, 48, '2025-03-14 17:00:42');
INSERT INTO `product_view` VALUES (1758, 64, '2025-03-14 17:02:11');
INSERT INTO `product_view` VALUES (1759, 54, '2025-03-14 17:03:34');
INSERT INTO `product_view` VALUES (1760, 77, '2025-03-14 17:05:29');
INSERT INTO `product_view` VALUES (1761, 62, '2025-03-14 17:07:04');
INSERT INTO `product_view` VALUES (1762, 78, '2025-03-14 17:08:46');
INSERT INTO `product_view` VALUES (1763, 47, '2025-03-14 17:12:12');
INSERT INTO `product_view` VALUES (1764, 68, '2025-03-14 17:21:26');
INSERT INTO `product_view` VALUES (1765, 67, '2025-03-14 17:21:26');
INSERT INTO `product_view` VALUES (1766, 72, '2025-03-14 17:23:14');
INSERT INTO `product_view` VALUES (1767, 46, '2025-03-14 17:23:14');
INSERT INTO `product_view` VALUES (1768, 53, '2025-03-14 17:25:45');
INSERT INTO `product_view` VALUES (1769, 49, '2025-03-14 17:25:45');
INSERT INTO `product_view` VALUES (1770, 55, '2025-03-14 17:28:36');
INSERT INTO `product_view` VALUES (1771, 47, '2025-03-14 17:28:36');
INSERT INTO `product_view` VALUES (1772, 73, '2025-03-14 17:31:19');
INSERT INTO `product_view` VALUES (1773, 79, '2025-03-14 17:31:20');
INSERT INTO `product_view` VALUES (1774, 70, '2025-03-14 17:33:03');
INSERT INTO `product_view` VALUES (1775, 65, '2025-03-14 17:33:03');
INSERT INTO `product_view` VALUES (1776, 76, '2025-03-14 17:34:20');
INSERT INTO `product_view` VALUES (1777, 57, '2025-03-14 17:34:21');
INSERT INTO `product_view` VALUES (1778, 60, '2025-03-14 17:37:01');
INSERT INTO `product_view` VALUES (1779, 66, '2025-03-14 17:37:01');
INSERT INTO `product_view` VALUES (1780, 52, '2025-03-14 17:39:06');
INSERT INTO `product_view` VALUES (1781, 75, '2025-03-14 17:39:06');
INSERT INTO `product_view` VALUES (1782, 59, '2025-03-14 17:41:03');
INSERT INTO `product_view` VALUES (1783, 42, '2025-03-14 17:41:03');
INSERT INTO `product_view` VALUES (1784, 45, '2025-03-14 17:42:52');
INSERT INTO `product_view` VALUES (1785, 43, '2025-03-14 17:42:52');
INSERT INTO `product_view` VALUES (1786, 49, '2025-03-14 17:42:59');
INSERT INTO `product_view` VALUES (1787, 51, '2025-03-14 17:44:34');
INSERT INTO `product_view` VALUES (1788, 69, '2025-03-14 17:44:34');
INSERT INTO `product_view` VALUES (1789, 61, '2025-03-14 17:47:20');
INSERT INTO `product_view` VALUES (1790, 58, '2025-03-14 17:47:21');
INSERT INTO `product_view` VALUES (1791, 50, '2025-03-14 17:49:54');
INSERT INTO `product_view` VALUES (1792, 41, '2025-03-14 17:49:54');
INSERT INTO `product_view` VALUES (1793, 63, '2025-03-14 17:51:30');
INSERT INTO `product_view` VALUES (1794, 71, '2025-03-14 17:51:30');
INSERT INTO `product_view` VALUES (1795, 74, '2025-03-14 17:53:06');
INSERT INTO `product_view` VALUES (1796, 44, '2025-03-14 17:53:06');
INSERT INTO `product_view` VALUES (1797, 40, '2025-03-14 17:54:53');
INSERT INTO `product_view` VALUES (1798, 48, '2025-03-14 17:58:58');
INSERT INTO `product_view` VALUES (1799, 64, '2025-03-14 18:00:28');
INSERT INTO `product_view` VALUES (1800, 54, '2025-03-14 18:03:12');
INSERT INTO `product_view` VALUES (1801, 77, '2025-03-14 18:05:17');
INSERT INTO `product_view` VALUES (1802, 62, '2025-03-14 18:08:02');
INSERT INTO `product_view` VALUES (1803, 78, '2025-03-14 18:09:32');
INSERT INTO `product_view` VALUES (1804, 51, '2025-03-14 18:13:43');
INSERT INTO `product_view` VALUES (1805, 53, '2025-03-14 18:40:30');
INSERT INTO `product_view` VALUES (1806, 54, '2025-03-14 19:09:38');
INSERT INTO `product_view` VALUES (1807, 55, '2025-03-14 19:37:02');
INSERT INTO `product_view` VALUES (1808, 39, '2025-03-14 19:53:10');
INSERT INTO `product_view` VALUES (1809, 42, '2025-03-14 20:05:22');
INSERT INTO `product_view` VALUES (1810, 44, '2025-03-14 20:12:03');
INSERT INTO `product_view` VALUES (1811, 46, '2025-03-14 20:17:19');
INSERT INTO `product_view` VALUES (1812, 65, '2025-03-14 20:30:36');
INSERT INTO `product_view` VALUES (1813, 56, '2025-03-14 20:33:31');
INSERT INTO `product_view` VALUES (1814, 76, '2025-03-14 20:38:42');
INSERT INTO `product_view` VALUES (1815, 78, '2025-03-14 20:50:13');
INSERT INTO `product_view` VALUES (1816, 57, '2025-03-14 21:02:39');
INSERT INTO `product_view` VALUES (1817, 40, '2025-03-14 21:05:56');
INSERT INTO `product_view` VALUES (1818, 47, '2025-03-14 21:13:29');
INSERT INTO `product_view` VALUES (1819, 48, '2025-03-14 21:25:24');
INSERT INTO `product_view` VALUES (1820, 58, '2025-03-14 21:33:00');
INSERT INTO `product_view` VALUES (1821, 52, '2025-03-14 21:37:56');
INSERT INTO `product_view` VALUES (1822, 70, '2025-03-14 21:43:57');
INSERT INTO `product_view` VALUES (1823, 59, '2025-03-14 21:48:14');
INSERT INTO `product_view` VALUES (1824, 60, '2025-03-14 22:03:15');
INSERT INTO `product_view` VALUES (1825, 61, '2025-03-14 22:19:18');
INSERT INTO `product_view` VALUES (1826, 62, '2025-03-14 22:33:56');
INSERT INTO `product_view` VALUES (1827, 63, '2025-03-14 22:48:11');
INSERT INTO `product_view` VALUES (1828, 64, '2025-03-14 23:02:50');
INSERT INTO `product_view` VALUES (1829, 65, '2025-03-14 23:18:08');
INSERT INTO `product_view` VALUES (1830, 66, '2025-03-14 23:32:07');
INSERT INTO `product_view` VALUES (1831, 67, '2025-03-14 23:46:47');
INSERT INTO `product_view` VALUES (1832, 68, '2025-03-15 00:02:33');
INSERT INTO `product_view` VALUES (1833, 2, '2025-03-15 00:18:28');
INSERT INTO `product_view` VALUES (1834, 69, '2025-03-15 00:24:57');
INSERT INTO `product_view` VALUES (1835, 39, '2025-03-15 00:48:49');
INSERT INTO `product_view` VALUES (1836, 70, '2025-03-15 00:48:50');
INSERT INTO `product_view` VALUES (1837, 72, '2025-03-15 01:33:00');
INSERT INTO `product_view` VALUES (1838, 73, '2025-03-15 01:54:09');
INSERT INTO `product_view` VALUES (1839, 71, '2025-03-15 02:16:44');
INSERT INTO `product_view` VALUES (1840, 11, '2025-03-15 02:26:44');
INSERT INTO `product_view` VALUES (1841, 74, '2025-03-15 02:48:44');
INSERT INTO `product_view` VALUES (1842, 56, '2025-03-15 02:57:20');
INSERT INTO `product_view` VALUES (1843, 75, '2025-03-15 03:18:40');
INSERT INTO `product_view` VALUES (1844, 76, '2025-03-15 03:50:41');
INSERT INTO `product_view` VALUES (1845, 76, '2025-03-15 03:58:14');
INSERT INTO `product_view` VALUES (1846, 77, '2025-03-15 04:38:19');
INSERT INTO `product_view` VALUES (1847, 78, '2025-03-15 05:24:33');
INSERT INTO `product_view` VALUES (1848, 39, '2025-03-15 05:42:32');
INSERT INTO `product_view` VALUES (1849, 3, '2025-03-15 05:42:39');
INSERT INTO `product_view` VALUES (1850, 79, '2025-03-15 06:12:08');
INSERT INTO `product_view` VALUES (1851, 1, '2025-03-15 10:30:52');
INSERT INTO `product_view` VALUES (1852, 2, '2025-03-15 13:32:28');
INSERT INTO `product_view` VALUES (1853, 39, '2025-03-15 13:32:30');
INSERT INTO `product_view` VALUES (1854, 1, '2025-03-15 13:32:31');
INSERT INTO `product_view` VALUES (1855, 3, '2025-03-15 13:32:32');
INSERT INTO `product_view` VALUES (1856, 3, '2025-03-15 20:24:02');
INSERT INTO `product_view` VALUES (1857, 2, '2025-03-15 20:31:32');
INSERT INTO `product_view` VALUES (1858, 39, '2025-03-15 20:31:36');
INSERT INTO `product_view` VALUES (1859, 1, '2025-03-15 20:31:47');
INSERT INTO `product_view` VALUES (1860, 3, '2025-03-15 20:31:59');
INSERT INTO `product_view` VALUES (1861, 13, '2025-03-15 20:39:25');
INSERT INTO `product_view` VALUES (1862, 2, '2025-03-15 20:47:24');
INSERT INTO `product_view` VALUES (1863, 39, '2025-03-15 20:47:25');
INSERT INTO `product_view` VALUES (1864, 1, '2025-03-15 20:47:26');
INSERT INTO `product_view` VALUES (1865, 3, '2025-03-15 20:47:27');
INSERT INTO `product_view` VALUES (1866, 18, '2025-03-15 20:48:26');
INSERT INTO `product_view` VALUES (1867, 20, '2025-03-15 20:58:43');
INSERT INTO `product_view` VALUES (1868, 22, '2025-03-15 21:06:55');
INSERT INTO `product_view` VALUES (1869, 4, '2025-03-15 21:17:29');
INSERT INTO `product_view` VALUES (1870, 1, '2025-03-15 21:26:14');
INSERT INTO `product_view` VALUES (1871, 26, '2025-03-15 21:30:43');
INSERT INTO `product_view` VALUES (1872, 27, '2025-03-15 21:38:14');
INSERT INTO `product_view` VALUES (1873, 37, '2025-03-15 21:49:20');
INSERT INTO `product_view` VALUES (1874, 8, '2025-03-15 21:56:48');
INSERT INTO `product_view` VALUES (1875, 2, '2025-03-16 00:01:04');
INSERT INTO `product_view` VALUES (1876, 3, '2025-03-16 01:28:09');
INSERT INTO `product_view` VALUES (1877, 2, '2025-03-16 01:37:25');
INSERT INTO `product_view` VALUES (1878, 1, '2025-03-16 01:57:37');
INSERT INTO `product_view` VALUES (1879, 13, '2025-03-16 02:12:58');
INSERT INTO `product_view` VALUES (1880, 3, '2025-03-16 02:13:27');
INSERT INTO `product_view` VALUES (1881, 18, '2025-03-16 02:21:27');
INSERT INTO `product_view` VALUES (1882, 21, '2025-03-16 02:31:16');
INSERT INTO `product_view` VALUES (1883, 26, '2025-03-16 02:38:53');
INSERT INTO `product_view` VALUES (1884, 7, '2025-03-16 02:50:52');
INSERT INTO `product_view` VALUES (1885, 4, '2025-03-16 03:15:27');
INSERT INTO `product_view` VALUES (1886, 22, '2025-03-16 03:26:21');
INSERT INTO `product_view` VALUES (1887, 7, '2025-03-16 03:36:06');
INSERT INTO `product_view` VALUES (1888, 14, '2025-03-16 03:47:49');
INSERT INTO `product_view` VALUES (1889, 39, '2025-03-16 05:14:28');
INSERT INTO `product_view` VALUES (1890, 2, '2025-03-16 05:42:40');
INSERT INTO `product_view` VALUES (1891, 11, '2025-03-17 04:39:20');
INSERT INTO `product_view` VALUES (1892, 56, '2025-03-17 04:55:47');
INSERT INTO `product_view` VALUES (1893, 39, '2025-03-17 05:43:52');
INSERT INTO `product_view` VALUES (1894, 1, '2025-03-17 05:44:00');
INSERT INTO `product_view` VALUES (1895, 2, '2025-03-18 05:43:58');
INSERT INTO `product_view` VALUES (1896, 1, '2025-03-18 10:29:58');
INSERT INTO `product_view` VALUES (1897, 10, '2025-03-18 17:49:12');
INSERT INTO `product_view` VALUES (1898, 11, '2025-03-18 18:19:24');
INSERT INTO `product_view` VALUES (1899, 12, '2025-03-18 18:47:08');
INSERT INTO `product_view` VALUES (1900, 13, '2025-03-18 19:15:34');
INSERT INTO `product_view` VALUES (1901, 14, '2025-03-18 19:44:43');
INSERT INTO `product_view` VALUES (1902, 15, '2025-03-18 20:16:03');
INSERT INTO `product_view` VALUES (1903, 16, '2025-03-18 20:44:23');
INSERT INTO `product_view` VALUES (1904, 17, '2025-03-18 21:13:27');
INSERT INTO `product_view` VALUES (1905, 18, '2025-03-18 21:42:52');
INSERT INTO `product_view` VALUES (1906, 19, '2025-03-18 22:13:22');
INSERT INTO `product_view` VALUES (1907, 20, '2025-03-18 22:40:16');
INSERT INTO `product_view` VALUES (1908, 21, '2025-03-18 23:08:24');
INSERT INTO `product_view` VALUES (1909, 22, '2025-03-18 23:36:53');
INSERT INTO `product_view` VALUES (1910, 24, '2025-03-19 00:04:55');
INSERT INTO `product_view` VALUES (1911, 23, '2025-03-19 00:32:19');
INSERT INTO `product_view` VALUES (1912, 25, '2025-03-19 00:57:39');
INSERT INTO `product_view` VALUES (1913, 26, '2025-03-19 01:24:13');
INSERT INTO `product_view` VALUES (1914, 27, '2025-03-19 01:47:08');
INSERT INTO `product_view` VALUES (1915, 28, '2025-03-19 02:10:02');
INSERT INTO `product_view` VALUES (1916, 29, '2025-03-19 02:31:00');
INSERT INTO `product_view` VALUES (1917, 30, '2025-03-19 02:53:16');
INSERT INTO `product_view` VALUES (1918, 32, '2025-03-19 03:09:36');
INSERT INTO `product_view` VALUES (1919, 31, '2025-03-19 03:26:12');
INSERT INTO `product_view` VALUES (1920, 33, '2025-03-19 03:42:08');
INSERT INTO `product_view` VALUES (1921, 34, '2025-03-19 03:59:14');
INSERT INTO `product_view` VALUES (1922, 35, '2025-03-19 04:16:23');
INSERT INTO `product_view` VALUES (1923, 38, '2025-03-19 04:49:23');
INSERT INTO `product_view` VALUES (1924, 4, '2025-03-19 05:05:03');
INSERT INTO `product_view` VALUES (1925, 5, '2025-03-19 05:18:43');
INSERT INTO `product_view` VALUES (1926, 6, '2025-03-19 05:32:41');
INSERT INTO `product_view` VALUES (1927, 3, '2025-03-19 05:45:21');
INSERT INTO `product_view` VALUES (1928, 1, '2025-03-19 05:45:32');
INSERT INTO `product_view` VALUES (1929, 7, '2025-03-19 05:47:22');
INSERT INTO `product_view` VALUES (1930, 36, '2025-03-19 06:02:03');
INSERT INTO `product_view` VALUES (1931, 8, '2025-03-19 06:17:31');
INSERT INTO `product_view` VALUES (1932, 37, '2025-03-19 06:35:30');
INSERT INTO `product_view` VALUES (1933, 9, '2025-03-19 07:39:04');
INSERT INTO `product_view` VALUES (1934, 86, '2025-03-19 10:42:26');
INSERT INTO `product_view` VALUES (1935, 86, '2025-03-19 10:42:42');
INSERT INTO `product_view` VALUES (1936, 41, '2025-03-19 10:48:56');
INSERT INTO `product_view` VALUES (1937, 39, '2025-03-19 10:49:10');
INSERT INTO `product_view` VALUES (1938, 39, '2025-03-19 10:49:43');
INSERT INTO `product_view` VALUES (1939, 9, '2025-03-19 10:50:00');
INSERT INTO `product_view` VALUES (1940, 9, '2025-03-19 10:51:51');
INSERT INTO `product_view` VALUES (1941, 1, '2025-03-19 10:52:05');
INSERT INTO `product_view` VALUES (1942, 1, '2025-03-19 10:55:37');
INSERT INTO `product_view` VALUES (1943, 51, '2025-03-19 10:58:54');
INSERT INTO `product_view` VALUES (1944, 51, '2025-03-19 10:59:04');
INSERT INTO `product_view` VALUES (1945, 2, '2025-03-19 11:07:28');
INSERT INTO `product_view` VALUES (1946, 40, '2025-03-19 11:08:28');
INSERT INTO `product_view` VALUES (1947, 43, '2025-03-19 12:23:01');
INSERT INTO `product_view` VALUES (1948, 44, '2025-03-19 12:56:59');
INSERT INTO `product_view` VALUES (1949, 46, '2025-03-19 13:30:33');
INSERT INTO `product_view` VALUES (1950, 48, '2025-03-19 14:01:50');
INSERT INTO `product_view` VALUES (1951, 50, '2025-03-19 14:33:22');
INSERT INTO `product_view` VALUES (1952, 52, '2025-03-19 15:05:54');
INSERT INTO `product_view` VALUES (1953, 45, '2025-03-19 15:24:47');
INSERT INTO `product_view` VALUES (1954, 47, '2025-03-19 15:44:35');
INSERT INTO `product_view` VALUES (1955, 1, '2025-03-19 15:53:10');
INSERT INTO `product_view` VALUES (1956, 1, '2025-03-19 15:55:09');
INSERT INTO `product_view` VALUES (1957, 49, '2025-03-19 16:04:37');
INSERT INTO `product_view` VALUES (1958, 56, '2025-03-19 16:13:07');
INSERT INTO `product_view` VALUES (1959, 51, '2025-03-19 16:25:14');
INSERT INTO `product_view` VALUES (1960, 53, '2025-03-19 16:48:06');
INSERT INTO `product_view` VALUES (1961, 54, '2025-03-19 17:00:47');
INSERT INTO `product_view` VALUES (1962, 55, '2025-03-19 17:12:41');
INSERT INTO `product_view` VALUES (1963, 42, '2025-03-19 17:24:16');
INSERT INTO `product_view` VALUES (1964, 56, '2025-03-19 17:35:33');
INSERT INTO `product_view` VALUES (1965, 57, '2025-03-19 17:47:23');
INSERT INTO `product_view` VALUES (1966, 58, '2025-03-19 17:59:12');
INSERT INTO `product_view` VALUES (1967, 59, '2025-03-19 18:10:59');
INSERT INTO `product_view` VALUES (1968, 60, '2025-03-19 18:22:08');
INSERT INTO `product_view` VALUES (1969, 61, '2025-03-19 18:32:09');
INSERT INTO `product_view` VALUES (1970, 62, '2025-03-19 18:41:04');
INSERT INTO `product_view` VALUES (1971, 63, '2025-03-19 18:50:52');
INSERT INTO `product_view` VALUES (1972, 65, '2025-03-19 19:11:27');
INSERT INTO `product_view` VALUES (1973, 66, '2025-03-19 19:20:49');
INSERT INTO `product_view` VALUES (1974, 67, '2025-03-19 19:30:20');
INSERT INTO `product_view` VALUES (1975, 68, '2025-03-19 19:39:59');
INSERT INTO `product_view` VALUES (1976, 69, '2025-03-19 19:50:03');
INSERT INTO `product_view` VALUES (1977, 64, '2025-03-19 20:00:46');
INSERT INTO `product_view` VALUES (1978, 70, '2025-03-19 20:12:12');
INSERT INTO `product_view` VALUES (1979, 72, '2025-03-19 20:23:33');
INSERT INTO `product_view` VALUES (1980, 73, '2025-03-19 20:34:59');
INSERT INTO `product_view` VALUES (1981, 71, '2025-03-19 20:45:42');
INSERT INTO `product_view` VALUES (1982, 74, '2025-03-19 20:56:37');
INSERT INTO `product_view` VALUES (1983, 75, '2025-03-19 21:18:46');
INSERT INTO `product_view` VALUES (1984, 76, '2025-03-19 21:40:05');
INSERT INTO `product_view` VALUES (1985, 77, '2025-03-19 22:03:57');
INSERT INTO `product_view` VALUES (1986, 78, '2025-03-19 22:23:52');
INSERT INTO `product_view` VALUES (1987, 79, '2025-03-19 23:03:52');
INSERT INTO `product_view` VALUES (1988, 2, '2025-03-20 05:44:00');
INSERT INTO `product_view` VALUES (1989, 1, '2025-03-20 06:23:36');
INSERT INTO `product_view` VALUES (1990, 1, '2025-03-20 06:25:21');
INSERT INTO `product_view` VALUES (1991, 1, '2025-03-20 08:49:31');
INSERT INTO `product_view` VALUES (1992, 1, '2025-03-20 10:14:47');
INSERT INTO `product_view` VALUES (1993, 1, '2025-03-20 12:34:20');
INSERT INTO `product_view` VALUES (1994, 2, '2025-03-20 19:54:51');
INSERT INTO `product_view` VALUES (1995, 3, '2025-03-20 20:34:40');
INSERT INTO `product_view` VALUES (1996, 39, '2025-03-20 21:54:42');
INSERT INTO `product_view` VALUES (1997, 1, '2025-03-21 02:07:53');
INSERT INTO `product_view` VALUES (1998, 39, '2025-03-21 06:13:07');

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
INSERT INTO `products` VALUES (1, 'Gạch lát sân vườn MAXTOT MT5501', 124000, 0, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 11, '2025-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
INSERT INTO `products` VALUES (2, 'Gạch lát sân vườn MAXTOT MT5502', 372000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 4, b'0', NULL, 10, '2025-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `products` VALUES (3, 'Gạch lát sân vườn MAXTOT MT5503', 184000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2025-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `products` VALUES (4, 'Gạch lát sân vườn MAXTOT MT5505', 714000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2025-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `products` VALUES (5, 'Gạch lát sân vườn MAXTOT MT5506', 412000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2025-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `products` VALUES (6, 'Gạch lát sân vườn MAXTOT MT5507', 851000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2025-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `products` VALUES (7, 'Gạch lát sân vườn MAXTOT MT5508', 384000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2025-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `products` VALUES (8, 'Gạch lát sân vườn MAXTOT MT5509', 556000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-03-19 18:28:28', 1, 1, 1, 1, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `products` VALUES (9, 'Gạch ốp tường MAXTOT MT3601', 448000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-03-19 18:28:25', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `products` VALUES (10, 'Gạch ốp tường MAXTOT MT3601D', 994000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/681784?$ExtraLarge$');
INSERT INTO `products` VALUES (11, 'Gạch ốp tường MAXTOT MT3602', 247000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `products` VALUES (12, 'Gạch ốp tường MAXTOT MT3605', 246000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `products` VALUES (13, 'Gạch ốp tường MAXTOT MT3605D', 334000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `products` VALUES (14, 'Gạch ốp tường MAXTOT MT3606', 577000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `products` VALUES (15, 'Gạch ốp tường MAXTOT MT3607', 654000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484274?$ExtraLarge$');
INSERT INTO `products` VALUES (16, 'Gạch ốp tường MAXTOT MT3607D', 266000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/616100?$ExtraLarge$');
INSERT INTO `products` VALUES (17, 'Gạch ốp tường MAXTOT MT3608', 938000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484216?$ExtraLarge$');
INSERT INTO `products` VALUES (18, 'Gạch ốp tường MAXTOT MT3609', 415000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/657613?$ExtraLarge$');
INSERT INTO `products` VALUES (19, 'Gạch ốp tường MAXTOT MT3609D', 776000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484297?$ExtraLarge$');
INSERT INTO `products` VALUES (20, 'Gạch ốp tường MAXTOT MT3610', 161000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/496215?$ExtraLarge$');
INSERT INTO `products` VALUES (21, 'Gạch ốp tường MAXTOT MT3617', 887000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/650782?$ExtraLarge$');
INSERT INTO `products` VALUES (22, 'Gạch ốp tường MAXTOT MT3617D', 360000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/496182?$ExtraLarge$');
INSERT INTO `products` VALUES (23, 'Gạch ốp tường MAXTOT MT3618', 963000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/650852?$ExtraLarge$');
INSERT INTO `products` VALUES (24, 'Gạch ốp tường MAXTOT MT3619', 151000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/494248?$ExtraLarge$');
INSERT INTO `products` VALUES (25, 'Gạch ốp tường MAXTOT MT3619D', 141000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484594?$ExtraLarge$');
INSERT INTO `products` VALUES (26, 'Gạch ốp tường MAXTOT MT3620', 629000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/494434?$ExtraLarge$');
INSERT INTO `products` VALUES (27, 'Gạch ốp tường MAXTOT MT3621', 789000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484078?$ExtraLarge$');
INSERT INTO `products` VALUES (28, 'Gạch ốp tường MAXTOT MT3621D', 491000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484069?$ExtraLarge$');
INSERT INTO `products` VALUES (29, 'Gạch ốp tường MAXTOT MT3621V', 193000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/658656?$ExtraLarge$');
INSERT INTO `products` VALUES (30, 'Gạch ốp tường MAXTOT MT3623', 911000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484288?$ExtraLarge$');
INSERT INTO `products` VALUES (31, 'Gạch ốp tường MAXTOT MT3623D', 335000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484107?$ExtraLarge$');
INSERT INTO `products` VALUES (32, 'Gạch ốp tường MAXTOT MT3624', 299000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/655838?$ExtraLarge$');
INSERT INTO `products` VALUES (33, 'Gạch ốp tường MAXTOT MT4802', 324000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484361?$ExtraLarge$');
INSERT INTO `products` VALUES (34, 'Gạch ốp tường MAXTOT MT4802D', 433000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/681746?$ExtraLarge$');
INSERT INTO `products` VALUES (35, 'Gạch ốp tường MAXTOT MT4803', 734000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/681043?$ExtraLarge$');
INSERT INTO `products` VALUES (36, 'Gạch ốp tường MAXTOT MT4804', 952000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484287?$ExtraLarge$');
INSERT INTO `products` VALUES (37, 'Gạch ốp tường MAXTOT MT4804D', 384000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/650433?$ExtraLarge$');
INSERT INTO `products` VALUES (38, 'Gạch ốp tường MAXTOT MT4805', 457000, NULL, 'view_shared/product_des/maxtot/maxtot.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 3, 2, 1, 'https://tileshop.scene7.com/is/image/TileShop/484019?$ExtraLarge$');
INSERT INTO `products` VALUES (39, 'Gạch lát sàn BAMBU BB66.1008', 622000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 1, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484359?$ExtraLarge$');
INSERT INTO `products` VALUES (40, 'Gạch lát sàn BAMBU BB66.1011', 379000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/658498?$ExtraLarge$');
INSERT INTO `products` VALUES (41, 'Gạch lát sàn BAMBU BB66.1014', 496000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'0', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/494440?$ExtraLarge$');
INSERT INTO `products` VALUES (42, 'Gạch lát sàn BAMBU BB66.1015', 972000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/441955?$ExtraLarge$');
INSERT INTO `products` VALUES (43, 'Gạch lát sàn BAMBU BB66.1016', 218000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484431?$ExtraLarge$');
INSERT INTO `products` VALUES (44, 'Gạch lát sàn BAMBU BB66.6003', 360000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/615826?$ExtraLarge$');
INSERT INTO `products` VALUES (45, 'Gạch lát sàn BAMBU BB66.6010', 719000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484038?$ExtraLarge$');
INSERT INTO `products` VALUES (46, 'Gạch lát sàn BAMBU BB66.6011', 197000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484285?$ExtraLarge$');
INSERT INTO `products` VALUES (47, 'Gạch lát sàn BAMBU BB66.6012', 643000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/615817?$ExtraLarge$');
INSERT INTO `products` VALUES (48, 'Gạch lát sàn BAMBU BB66.6013', 689000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484002?$ExtraLarge$');
INSERT INTO `products` VALUES (49, 'Gạch lát sàn BAMBU BB66.6014', 864000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/484017?$ExtraLarge$');
INSERT INTO `products` VALUES (50, 'Gạch lát sàn BAMBU BB66.6015', 309000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 2, 2, 'https://tileshop.scene7.com/is/image/TileShop/667725?$ExtraLarge$');
INSERT INTO `products` VALUES (51, 'Gạch lát sàn BAMBU BB66.6017VT', 936000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484213?$ExtraLarge$');
INSERT INTO `products` VALUES (52, 'Gạch lát sàn BAMBU BB66.6018VT', 959000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484212?$ExtraLarge$');
INSERT INTO `products` VALUES (53, 'Gạch lát sàn BAMBU BB66.6019VT', 455000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484258?$ExtraLarge$');
INSERT INTO `products` VALUES (54, 'Gạch lát sàn BAMBU BB66.6020VT', 564000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484053?$ExtraLarge$');
INSERT INTO `products` VALUES (55, 'Gạch lát sàn BAMBU BB66.6021VT', 383000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 4, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/667753?$ExtraLarge$');
INSERT INTO `products` VALUES (56, 'Gạch lát sàn BAMBU BB88.6003', 230000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484054?$ExtraLarge$');
INSERT INTO `products` VALUES (57, 'Gạch lát sàn BAMBU BB88.6006', 938000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484214?$ExtraLarge$');
INSERT INTO `products` VALUES (58, 'Gạch lát sàn BAMBU BB88.6008', 788000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/681784?$ExtraLarge$');
INSERT INTO `products` VALUES (59, 'Gạch lát sàn BAMBU BB88.6012', 274000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484436?$ExtraLarge$');
INSERT INTO `products` VALUES (60, 'Gạch lát sàn BAMBU BB88.6013', 972000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484272?$ExtraLarge$');
INSERT INTO `products` VALUES (61, 'Gạch lát sàn BAMBU BB88.6014', 837000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/484286?$ExtraLarge$');
INSERT INTO `products` VALUES (62, 'Gạch lát sàn BAMBU BB88.6015', 383000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 6, 2, 'https://tileshop.scene7.com/is/image/TileShop/667724?$ExtraLarge$');
INSERT INTO `products` VALUES (63, 'Gạch lát sàn BAMBU BB88.6017VT', 529000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484274?$ExtraLarge$');
INSERT INTO `products` VALUES (64, 'Gạch lát sàn BAMBU BB88.6018VT', 481000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/616100?$ExtraLarge$');
INSERT INTO `products` VALUES (65, 'Gạch lát sàn BAMBU BB88.6019VT', 125000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484216?$ExtraLarge$');
INSERT INTO `products` VALUES (66, 'Gạch lát sàn BAMBU BB88.6020VT', 255000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/657613?$ExtraLarge$');
INSERT INTO `products` VALUES (67, 'Gạch lát sàn BAMBU BB88.6021VT', 996000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 5, 5, 2, 'https://tileshop.scene7.com/is/image/TileShop/484297?$ExtraLarge$');
INSERT INTO `products` VALUES (68, 'Gạch ốp tường BAMBU BB36.6001D', 114000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/496215?$ExtraLarge$');
INSERT INTO `products` VALUES (69, 'Gạch ốp tường BAMBU BB36.6001DE', 167000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/650782?$ExtraLarge$');
INSERT INTO `products` VALUES (70, 'Gạch ốp tường BAMBU BB36.6001L', 702000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/496182?$ExtraLarge$');
INSERT INTO `products` VALUES (71, 'Gạch ốp tường BAMBU BB36.6002D', 917000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/650852?$ExtraLarge$');
INSERT INTO `products` VALUES (72, 'Gạch ốp tường BAMBU BB36.6002DE', 104000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/494248?$ExtraLarge$');
INSERT INTO `products` VALUES (73, 'Gạch ốp tường BAMBU BB36.6002L', 529000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484594?$ExtraLarge$');
INSERT INTO `products` VALUES (74, 'Gạch ốp tường BAMBU BB36.6003D', 748000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/494434?$ExtraLarge$');
INSERT INTO `products` VALUES (75, 'Gạch ốp tường BAMBU BB36.6003DE', 723000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484078?$ExtraLarge$');
INSERT INTO `products` VALUES (76, 'Gạch ốp tường BAMBU BB36.6003L', 506000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484069?$ExtraLarge$');
INSERT INTO `products` VALUES (77, 'Gạch ốp tường BAMBU BB36.6004DE', 921000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/658656?$ExtraLarge$');
INSERT INTO `products` VALUES (78, 'Gạch ốp tường BAMBU BB36.6004L', 105000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484288?$ExtraLarge$');
INSERT INTO `products` VALUES (79, 'Gạch ốp tường BAMBU BB36.6004V', 177000, NULL, 'view_shared/product_des/bambu/bambu.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 2, 2, 3, 2, 'https://tileshop.scene7.com/is/image/TileShop/484107?$ExtraLarge$');
INSERT INTO `products` VALUES (80, 'Gạch lát sân vườn FAMITO F503', 379000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/655838?$ExtraLarge$');
INSERT INTO `products` VALUES (81, 'Gạch lát sân vườn FAMITO F504', 272000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/484361?$ExtraLarge$');
INSERT INTO `products` VALUES (82, 'Gạch lát sân vườn FAMITO F505', 875000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/681746?$ExtraLarge$');
INSERT INTO `products` VALUES (83, 'Gạch lát sân vườn FAMITO F506', 692000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/681043?$ExtraLarge$');
INSERT INTO `products` VALUES (84, 'Gạch men sân vườn FAMITO F502', 833000, NULL, 'view_shared/product_des/famito/famito.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 1, 4, 3, 'https://tileshop.scene7.com/is/image/TileShop/484287?$ExtraLarge$');
INSERT INTO `products` VALUES (85, 'Gạch lát nền granite cao cấp IVICASA GA-P66001 600×600', 113000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/650433?$ExtraLarge$');
INSERT INTO `products` VALUES (86, 'Gạch lát nền granite cao cấp IVICASA GA-P66002 600×600', 616000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/484019?$ExtraLarge$');
INSERT INTO `products` VALUES (87, 'Gạch lát nền granite cao cấp IVICASA GA-P66003 600×600', 495000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/484359?$ExtraLarge$');
INSERT INTO `products` VALUES (88, 'Gạch lát nền granite cao cấp IVICASA GA-P66004 600×600', 355000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/658498?$ExtraLarge$');
INSERT INTO `products` VALUES (89, 'Gạch lát nền granite cao cấp IVICASA GA-P66005 600×600', 905000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/494440?$ExtraLarge$');
INSERT INTO `products` VALUES (90, 'Gạch lát nền granite cao cấp IVICASA GA-P66006 600×600', 949000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/441955?$ExtraLarge$');
INSERT INTO `products` VALUES (91, 'Gạch lát nền granite cao cấp IVICASA GA-P66007 600×600', 651000, NULL, 'view_shared/product_des/ivicasa/ivicasa.jsp', b'1', 5, b'0', NULL, 10, '2024-12-19 18:28:28', 1, 2, 3, 4, 'https://tileshop.scene7.com/is/image/TileShop/484431?$ExtraLarge$');

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
INSERT INTO `review` VALUES (9, 1, 5, 'ok đó', '2025-03-12 17:46:23', 1);
INSERT INTO `review` VALUES (9, 2, 4, 'ok', '2025-03-12 17:46:54', 1);

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES (1, '500×500 mm', b'1');
INSERT INTO `size` VALUES (2, '300×600 mm', b'1');
INSERT INTO `size` VALUES (3, '400×800 mm', b'1');
INSERT INTO `size` VALUES (4, '600×600 mm', NULL);
INSERT INTO `size` VALUES (5, '800×800 mm', b'1');

-- ----------------------------
-- Table structure for spectype
-- ----------------------------
DROP TABLE IF EXISTS `spectype`;
CREATE TABLE `spectype`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spectype
-- ----------------------------
INSERT INTO `spectype` VALUES (1, 'Kích thước', b'1');
INSERT INTO `spectype` VALUES (2, 'Khung xương', b'1');
INSERT INTO `spectype` VALUES (3, 'Loại men', b'1');
INSERT INTO `spectype` VALUES (4, 'Bề mặt', b'1');
INSERT INTO `spectype` VALUES (5, 'Thương hiệu', b'1');
INSERT INTO `spectype` VALUES (6, 'Xuất xứ', b'1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'Anh Nguyên', 'com@gamil.com', '0213432', NULL, NULL, '2024-12-24 16:20:47', b'1', '2024-12-15 16:55:20', '', 1, '123', 1);
INSERT INTO `users` VALUES (3, 'Trang Trang', 'com1@gamil.com', '0213432', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', NULL, '2024-12-10 16:20:54', b'1', '2024-12-15 17:08:26', '', 0, '123', 1);
INSERT INTO `users` VALUES (4, 'Trương Diếm', 'com3@gamil.com', '0213432', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', NULL, '2024-12-04 16:20:58', b'1', '2024-12-15 17:08:36', '', 0, '123', 1);
INSERT INTO `users` VALUES (5, 'phuc', 'com4@gamil.com', '0213432', NULL, NULL, '2024-12-11 16:21:03', b'1', '2024-12-14 16:21:11', '', 0, '123', 0);
INSERT INTO `users` VALUES (6, 'Ngân cuti', 'ngan@gmail.com', '0376272024', NULL, 'bình định', '2025-02-06 14:23:42', b'1', '2025-02-12 14:23:30', NULL, 0, 'N123456789', 0);
INSERT INTO `users` VALUES (7, 'Phạm Tài', 'tai@gmail.com', '022222222', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', 'bình định', '2025-02-21 14:23:47', b'1', '2025-02-20 14:23:36', NULL, 0, 'T123456789', 0);
INSERT INTO `users` VALUES (8, 'Ta Phuc', 'taphuc@gmail.com', '0987991500', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', 'hehe', '2004-01-05 00:00:00', b'1', '2024-12-19 13:29:11', '5b7dfe7c7e97b3f6c7bca96847bf0428', 1, '62e11758af9c1fd8da95abd57a330123f9e80f89c3a6452f1fab3c71e8539d5d', 0);
INSERT INTO `users` VALUES (9, 'Ngân cuti', 'nguyenhaisuper8@gmail.com', '0376272024', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-con-gai-24.jpg', 'bình định', '2024-12-14 00:00:00', b'1', '2024-12-20 12:19:21', 'ee38298a3ab54677f47c7b689c6dfc1f', 1, '2575028f1907c8395603908a280207c043d751b3275291733360c1e0cc1214bc', 0);
INSERT INTO `users` VALUES (10, 'bgfbfgb', 'a@gmail.com', '0987991500', 'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp', 'cdcsdc', '2024-12-12 00:00:00', b'1', '2024-12-21 02:07:40', 'b46b671d8db9754dbcb140308c35c7a4', 0, '635b4fc85439b34a75b0b7615f27391b11b78e084ab3789ea0e880e3b5212b5b', 0);
INSERT INTO `users` VALUES (11, 'j  b hbhui', 'z@gmail.com', '05151858', NULL, ' m cvxnm cbkvjx', '2024-12-13 00:00:00', b'1', '2024-12-23 15:19:37', '0da9145129e9a98efbbecdbad093bcd1', 0, '16a8ab548b3e5447ae7778102de303f9bf282b5b02bed252a2979e8ba4efa320', 1);
INSERT INTO `users` VALUES (12, 'heloo', 'com100@gmail.com', '0376272029', NULL, 'bfgbfgfgfg', '2024-12-06 00:00:00', b'1', '2024-12-23 15:26:57', 'e14f42825c897b2935c5417235e57521', 0, 'f0dae3464cc3f20b18c19753542e7bf51dac56073dfd824fadd1eb90d269384f', 1);
INSERT INTO `users` VALUES (13, 'Ta Phuc', 'ta@gmail.com', '4234234', NULL, '324234', '2024-12-19 00:00:00', b'1', '2024-12-23 15:38:09', '67e5e5b13e8f60044d09e4e83782ac48', 0, '20c0a121f2c72afe8198637b67647dfb05da7c5edb94eb27fb528f56768cde6d', 1);
INSERT INTO `users` VALUES (15, 'Đặng Nguyên', 'nguyenhaisuper6@gmail.com', '0376272024', 'assets/img/1740551542825_ishan-seefromthesky-6U-sSfBV-gM-unsplash.jpg', 'Thôn Chánh Tường, Xã Mỹ Thọ, huyện Phù Mỹ, tỉnh Bình Định', '2025-02-20 00:00:00', b'1', '2025-02-26 05:52:42', '9a0c97508bf52bd020ef3ee516af4c03', 1, '3978840d5ea42521c74dd244c12199cc5a58181c85b3fc05966ad7b6c86622de', 0);
INSERT INTO `users` VALUES (16, 'Tạ Hoàng Phúc', '22130220@st.hcmuaf.edu.vn', '0985326700', 'assets/img/1740578682796_final.png', 'Đồng Nai', '2004-01-19 00:00:00', b'1', '2025-02-26 14:03:22', '0f2e4d62f9e8df11e57e3fbc1b10d6f2', 1, '188a6439e0d32ae17ef73d40eca8788604a16951b57a9e87f3a160e228482029', 0);
INSERT INTO `users` VALUES (17, 'lê tuấn phát', 'ltphat240103@gmail.com', '0935822771', NULL, 'Ninh Hoaf', '2014-06-19 00:00:00', b'1', '2025-03-19 07:40:12', '3b8303ab9f0120cc7c091e15e2770d4a', 0, 'e1e5f64178bcec095531117e5bde38c846f48a4597a2c8fe3a6069e84fbbc40d', 0);
INSERT INTO `users` VALUES (19, 'Lê Tuấn Phát', '21129858@st.hcmuaf.edu.vn', '0935822991', NULL, 'Ninh hòa', '2025-03-05 00:00:00', b'1', '2025-03-20 08:41:31', NULL, 0, NULL, 0);

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
INSERT INTO `voucherusage` VALUES (1, 14, 3, '2025-02-26 10:16:49');

SET FOREIGN_KEY_CHECKS = 1;

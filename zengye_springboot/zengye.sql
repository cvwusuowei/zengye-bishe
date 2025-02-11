/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : qingge

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 11/02/2025 14:44:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `link_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `link_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系地址',
  `link_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `user_id` bigint NULL DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收货地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (9, '刘增烨', 'hebeisheng', '13068799196', 43);

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小，kb',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'url',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (61, 'jpg', 112, 'http://localhost:8888/avatar/cb478df3ff644e629ec79603c712fa40.jpg', 'f66bf7286f302f32838cd410b0769ffe');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `good_id` bigint NOT NULL COMMENT '对应的商品',
  `show_order` int NOT NULL COMMENT '轮播顺序',
  PRIMARY KEY (`id`, `good_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (7, 11, 1);
INSERT INTO `carousel` VALUES (8, 21, 1);
INSERT INTO `carousel` VALUES (9, 41, 1);
INSERT INTO `carousel` VALUES (10, 43, 1);
INSERT INTO `carousel` VALUES (11, 44, 2);
INSERT INTO `carousel` VALUES (12, 45, 1);
INSERT INTO `carousel` VALUES (13, 46, 2);
INSERT INTO `carousel` VALUES (14, 50, 5);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `good_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL COMMENT '商品数量',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `goods_user`(`good_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (41, 43, 43, '黄色基础款', 1, '2025-02-11 05:12:09');
INSERT INTO `cart` VALUES (44, 43, 45, '60kg【健身达人/教练适用】', 1, '2025-02-11 14:27:20');
INSERT INTO `cart` VALUES (45, 43, 44, '秒杀款 限100件【185*61cm】黑色 赠 绑带', 1, '2025-02-11 14:27:26');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, ' 力量训练器材');
INSERT INTO `category` VALUES (2, '功能性训练器材');
INSERT INTO `category` VALUES (3, '康复及辅助训练器材');
INSERT INTO `category` VALUES (4, '家庭智能健身器材');
INSERT INTO `category` VALUES (5, '有氧健身器材');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品描述',
  `discount` double(10, 2) NULL DEFAULT 1.00 COMMENT '折扣',
  `sales` int NULL DEFAULT 0 COMMENT '销量',
  `sale_money` decimal(10, 0) NULL DEFAULT 0 COMMENT '销售额',
  `category_id` bigint NULL DEFAULT NULL COMMENT '分类id',
  `imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品图片',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `recommend` tinyint(1) NULL DEFAULT NULL COMMENT '是否推荐：0不推荐，1推荐',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (43, '回弹健腹轮', '升级四轮六肘撑回弹健腹轮男女收腹卷腹居家运动锻练腹肌健身器材', 4.00, 1, 47, 4, 'http://localhost:8888/file/34ac10bf14de4af98d7a05992d7e9c2c.jpg', '2025-02-11 03:28:38', 1, 0);
INSERT INTO `good` VALUES (44, '健身垫初学者瑜伽垫子', '中欧男士健身垫初学者瑜伽垫子加厚加宽加长防滑运动瑜珈地垫家用', 8.00, 0, 0, 5, 'http://localhost:8888/file/da81c8a8be2747ce8a321664cddc77e4.jpg', '2025-02-11 03:34:09', 1, 0);
INSERT INTO `good` VALUES (45, '臂力棒握力器', '臂力棒握力器臂力器家用健身器材男扩胸器锻炼身体器材运动训练', 10.00, 10, 582, 1, 'http://localhost:8888/file/73da531ecfac42e280180b62a250e200.jpg', '2025-02-11 03:36:27', 1, 0);
INSERT INTO `good` VALUES (46, '龙门架健身器材', ' 商用史密斯机综合训练器小飞鸟龙门架健身器材家用深蹲卧推一体架', 10.00, 0, 0, 4, 'http://localhost:8888/file/f1237f97c4c94d28b8b45ca1ee832187.jpg', '2025-02-11 03:38:18', 1, 0);
INSERT INTO `good` VALUES (47, '静脉训练器五指手指拉力器', '静脉训练器五指手指拉力器握力器男手臂麒麟臂力器筋脉练手劲器材', 8.00, 1, 9, 3, 'http://localhost:8888/file/cb2cf2d146bf4458a52ce913d58f52e1.avif', '2025-02-11 03:40:17', 1, 0);
INSERT INTO `good` VALUES (48, '羽毛球单人训练器自动回弹', '羽毛球单人训练器自动回弹自打室内一个人打家用练习神器在家儿童', 10.00, 0, 0, 2, 'http://localhost:8888/file/4545e88f4f2d4ae8af066e9599b82335.avif', '2025-02-11 03:41:48', 1, 0);
INSERT INTO `good` VALUES (49, '小飞鸟健身凳卧推凳健身房', 'REP FORCE重型商用多功能调节哑铃凳小飞鸟健身凳卧推凳健身房', 10.00, 0, 0, 1, 'http://localhost:8888/file/a8aba000ebb044aebdcdba3adb81122b.avif', '2025-02-11 03:43:11', 1, 0);
INSERT INTO `good` VALUES (50, ' 指压板', '指压板超慢跑足底按摩垫脚踏健身器室内原地跑步垫减肥运动垫家用', 10.00, 0, 0, 3, 'http://localhost:8888/file/551501c981e4445e858cd15563ec062c.avif', '2025-02-11 03:44:24', 1, 0);
INSERT INTO `good` VALUES (51, '握力器', '电子计数握力器专业练手力量男士家用健身器材臂力腕力器可调节', 9.00, 5, 477, 2, 'http://localhost:8888/file/d7d3cf8f26ea42cca68e82f2349bad61.avif', '2025-02-11 03:45:45', 1, 0);

-- ----------------------------
-- Table structure for good_standard
-- ----------------------------
DROP TABLE IF EXISTS `good_standard`;
CREATE TABLE `good_standard`  (
  `good_id` int NOT NULL COMMENT '商品id',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品规格',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '该规格的价格',
  `store` int NULL DEFAULT NULL COMMENT '该规格的库存',
  PRIMARY KEY (`good_id`, `value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of good_standard
-- ----------------------------
INSERT INTO `good_standard` VALUES (43, '黄色基础款', 49.00, 100);
INSERT INTO `good_standard` VALUES (43, '黑色基础款', 56.00, 1000);
INSERT INTO `good_standard` VALUES (44, '【185*61cm】黑色 赠 绑带', 15.90, 100);
INSERT INTO `good_standard` VALUES (44, '秒杀款 限100件【185*61cm】黑色 赠 绑带', 14.90, 100);
INSERT INTO `good_standard` VALUES (45, '30kg【适合初中生/初学者】', 6.37, 93);
INSERT INTO `good_standard` VALUES (45, '60kg【健身达人/教练适用】', 6.37, 97);
INSERT INTO `good_standard` VALUES (46, '奶香色/夹胸推胸训练器/轻商级 40*80方管', 3419.00, 1000);
INSERT INTO `good_standard` VALUES (46, '沉稳黑/夹胸训练器/商用级 50*100方管', 3839.00, 1000);
INSERT INTO `good_standard` VALUES (47, '升级款⭐【1个装】✅三挡磅数调节', 4.90, 1000);
INSERT INTO `good_standard` VALUES (47, '升级款⭐【2个装】✅三挡磅数调节', 8.90, 999);
INSERT INTO `good_standard` VALUES (48, '【无痕粘贴款】3耐打球无拍套装（燃脂暴汗 锻炼全身）', 14.80, 1000);
INSERT INTO `good_standard` VALUES (48, '【粉色单拍】3耐打球套装（燃脂暴汗 锻炼全身）', 15.90, 1000);
INSERT INTO `good_standard` VALUES (49, '白细纹*1套', 890.00, 1000);
INSERT INTO `good_standard` VALUES (49, '黑磨砂*1套', 1090.00, 1000);
INSERT INTO `good_standard` VALUES (50, '磁石理疗三代【踩出健康/舒经活络】标准38cm款/天蓝色', 11.99, 1000);
INSERT INTO `good_standard` VALUES (51, '基础款-曼巴黑【5-60kg可调节】', 8.21, 1000);
INSERT INTO `good_standard` VALUES (51, '机械款-高级黑【10-100kg调节/防滑手柄】加强握力', 12.90, 995);

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图标icon',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标的标识码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of icon
-- ----------------------------
INSERT INTO `icon` VALUES (1, '&#xe603;');
INSERT INTO `icon` VALUES (2, '&#xe604;');

-- ----------------------------
-- Table structure for icon_category
-- ----------------------------
DROP TABLE IF EXISTS `icon_category`;
CREATE TABLE `icon_category`  (
  `icon_id` int NOT NULL COMMENT 'icon(大类）id',
  `category_id` int NOT NULL COMMENT '小分类id',
  PRIMARY KEY (`icon_id`, `category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of icon_category
-- ----------------------------
INSERT INTO `icon_category` VALUES (1, 1);
INSERT INTO `icon_category` VALUES (1, 2);
INSERT INTO `icon_category` VALUES (2, 3);
INSERT INTO `icon_category` VALUES (2, 4);
INSERT INTO `icon_category` VALUES (2, 5);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单id',
  `good_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品规格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单商品关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (43, 59, 51, 1, '机械款-高级黑【10-100kg调节/防滑手柄】加强握力');
INSERT INTO `order_goods` VALUES (44, 60, 45, 1, '60kg【健身达人/教练适用】');
INSERT INTO `order_goods` VALUES (45, 61, 51, 1, '机械款-高级黑【10-100kg调节/防滑手柄】加强握力');
INSERT INTO `order_goods` VALUES (46, 62, 43, 1, '黑色六轮八肘撑【2025新款 更稳 适合新手】');
INSERT INTO `order_goods` VALUES (47, 63, 51, 1, '机械款-高级黑【10-100kg调节/防滑手柄】加强握力');
INSERT INTO `order_goods` VALUES (48, 64, 51, 1, '机械款-高级黑【10-100kg调节/防滑手柄】加强握力');
INSERT INTO `order_goods` VALUES (49, 65, 51, 1, '机械款-高级黑【10-100kg调节/防滑手柄】加强握力');
INSERT INTO `order_goods` VALUES (50, 66, 45, 1, '60kg【健身达人/教练适用】');
INSERT INTO `order_goods` VALUES (51, 67, 45, 1, '60kg【健身达人/教练适用】');
INSERT INTO `order_goods` VALUES (52, 68, 45, 1, '30kg【适合初中生/初学者】');
INSERT INTO `order_goods` VALUES (53, 69, 45, 1, '30kg【适合初中生/初学者】');
INSERT INTO `order_goods` VALUES (54, 70, 45, 1, '30kg【适合初中生/初学者】');
INSERT INTO `order_goods` VALUES (55, 71, 45, 1, '30kg【适合初中生/初学者】');
INSERT INTO `order_goods` VALUES (56, 72, 45, 1, '30kg【适合初中生/初学者】');
INSERT INTO `order_goods` VALUES (57, 73, 45, 1, '30kg【适合初中生/初学者】');
INSERT INTO `order_goods` VALUES (58, 74, 47, 1, '升级款⭐【2个装】✅三挡磅数调节');
INSERT INTO `order_goods` VALUES (59, 75, 45, 1, '30kg【适合初中生/初学者】');
INSERT INTO `order_goods` VALUES (60, 76, 50, 10, '磁石理疗三代【踩出健康/舒经活络】标准38cm款/天蓝色');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小，kb',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'url',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (170, 'O1CN01PtofPe1gIYDkgfN1T_!!973514119-0-cib.jpg', 'jpg', 199, 'http://localhost:8888/file/34ac10bf14de4af98d7a05992d7e9c2c.jpg', 0, 0, 'b25731dbedc83341b54728578c907530', '2025-02-11 03:28:38');
INSERT INTO `sys_file` VALUES (171, 'O1CN01vXYYpp2G0z9CJz9hq_!!976008954-0-cib.jpg', 'jpg', 158, 'http://localhost:8888/file/da81c8a8be2747ce8a321664cddc77e4.jpg', 0, 0, '5e3adaecc6cb012dc44ebe4a0287df8f', '2025-02-11 03:34:09');
INSERT INTO `sys_file` VALUES (172, '4030822658_1859571519.jpg', 'jpg', 69, 'http://localhost:8888/file/73da531ecfac42e280180b62a250e200.jpg', 0, 0, '74917c67696b81afc25a98156e65b45a', '2025-02-11 03:36:27');
INSERT INTO `sys_file` VALUES (173, '20938795292_258339961.jpg', 'jpg', 323, 'http://localhost:8888/file/f1237f97c4c94d28b8b45ca1ee832187.jpg', 0, 0, 'cf015595fa3ee5496a1176b4065e994c', '2025-02-11 03:38:18');
INSERT INTO `sys_file` VALUES (174, 'O1CN01yjtHAN1nxxUX9YGRJ_!!405325157.avif', 'avif', 49, 'http://localhost:8888/file/cb2cf2d146bf4458a52ce913d58f52e1.avif', 0, 0, '93034eb45efa0f17631930462062ebb2', '2025-02-11 03:40:17');
INSERT INTO `sys_file` VALUES (175, 'O1CN01etTAaz1IapRwAYZ4p_!!1065620910.avif', 'avif', 42, 'http://localhost:8888/file/4545e88f4f2d4ae8af066e9599b82335.avif', 0, 0, '99d8d4c29f5ff1dd9c521c99d5f9a8d6', '2025-02-11 03:41:48');
INSERT INTO `sys_file` VALUES (176, 'O1CN01PJSYQl2IPNhY9v2ys_!!1757959278.avif', 'avif', 112, 'http://localhost:8888/file/a8aba000ebb044aebdcdba3adb81122b.avif', 0, 0, 'baae16fb5d370a197ab9fde90809ec20', '2025-02-11 03:43:11');
INSERT INTO `sys_file` VALUES (177, 'O1CN01We8GKB24ETe5Trk3R_!!2895597359.avif', 'avif', 124, 'http://localhost:8888/file/551501c981e4445e858cd15563ec062c.avif', 0, 0, '63c5df9d22561d5cc1e88d697b2592cf', '2025-02-11 03:44:24');
INSERT INTO `sys_file` VALUES (178, 'O1CN01YdTrbX1i6J212Yr1H_!!2215512644363-2-scmitem176000.avif', 'avif', 56, 'http://localhost:8888/file/d7d3cf8f26ea42cca68e82f2349bad61.avif', 0, 0, 'a177fa666886962d76cc275e2d4760de', '2025-02-11 03:45:45');
INSERT INTO `sys_file` VALUES (179, 'O1CN01YdTrbX1i6J212Yr1H_!!2215512644363-2-scmitem176000.avif', 'avif', 56, 'http://localhost:8888/file/d7d3cf8f26ea42cca68e82f2349bad61.avif', 0, 0, 'a177fa666886962d76cc275e2d4760de', '2025-02-11 05:20:32');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (43, 'wusuowei', 'ef60dd434e023889259cf70e464d25d0', 'wusuowei', 'wusuowei@outlook.com', '13068799196', 'hebeisheng', '2025-02-10 17:30:02', 'http://localhost:8888/avatar/cb478df3ff644e629ec79603c712fa40.jpg', 'admin');
INSERT INTO `sys_user` VALUES (46, 'shameless', 'ef60dd434e023889259cf70e464d25d0', '旧用户', NULL, NULL, NULL, '2025-02-11 01:49:03', NULL, 'user');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `user_id` int NOT NULL COMMENT '下单人id',
  `link_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `link_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '送货地址',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '待付款' COMMENT '状态',
  `create_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (59, '20250211034659046131', 12.90, 43, '刘增烨', '13068799196', 'hebeisheng', '已收货', '2025-02-11 03:46:59');
INSERT INTO `t_order` VALUES (60, '20250211040409848094', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:04:09');
INSERT INTO `t_order` VALUES (61, '20250211040425621232', 116.10, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:04:25');
INSERT INTO `t_order` VALUES (62, '20250211040435174531', 46.90, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:04:35');
INSERT INTO `t_order` VALUES (63, '20250211040516190547', 116.10, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:05:16');
INSERT INTO `t_order` VALUES (64, '20250211040524957954', 116.10, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:05:24');
INSERT INTO `t_order` VALUES (65, '20250211040533881934', 116.10, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:05:33');
INSERT INTO `t_order` VALUES (66, '20250211040549021991', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:05:49');
INSERT INTO `t_order` VALUES (67, '20250211040605726652', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:06:05');
INSERT INTO `t_order` VALUES (68, '20250211040627709551', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:06:27');
INSERT INTO `t_order` VALUES (69, '20250211040739447364', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:07:39');
INSERT INTO `t_order` VALUES (70, '20250211041057632006', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:10:57');
INSERT INTO `t_order` VALUES (71, '20250211041118621216', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 04:11:18');
INSERT INTO `t_order` VALUES (72, '20250211041447429594', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已发货', '2025-02-11 04:14:47');
INSERT INTO `t_order` VALUES (73, '20250211041545684472', 63.70, 43, '刘增烨', '13068799196', 'hebeisheng', '已发货', '2025-02-11 04:15:45');
INSERT INTO `t_order` VALUES (74, '20250211043343588861', 8.90, 43, '刘增烨', '13068799196', 'hebeisheng', '已发货', '2025-02-11 04:33:43');
INSERT INTO `t_order` VALUES (75, '20250211142015401483', 6.37, 43, '刘增烨', '13068799196', 'hebeisheng', '已支付', '2025-02-11 14:20:15');
INSERT INTO `t_order` VALUES (76, '20250211142645106679', 119.90, 43, '刘增烨', '13068799196', 'hebeisheng', '待付款', '2025-02-11 14:26:45');

SET FOREIGN_KEY_CHECKS = 1;

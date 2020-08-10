-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-08-02 17:59:44
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kml`
--
DROP DATABASE  IF EXISTS `kml`;

CREATE DATABASE IF  NOT EXISTS  `kml` DEFAULT  CHARACTER SET 'utf8';

USE `kml`;
-- --------------------------------------------------------

--
-- 表的结构 `kml_cake_detail`
--
DROP TABLE IF EXISTS `kml_cake_detail`;
CREATE TABLE `kml_cake_detail` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `subtitle` varchar(128) DEFAULT NULL,
  `remind` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `brand` varchar(32) DEFAULT NULL,
  `taste` varchar(32) DEFAULT NULL,
  `sweetness` varchar(32) DEFAULT NULL,
  `suitable_day` varchar(32) DEFAULT NULL,
  `suitable_person` varchar(32) DEFAULT NULL,
  `raw_material` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_cake_detail`
--

INSERT INTO `kml_cake_detail` (`cid`, `family_id`, `title`, `subtitle`, `remind`, `price`, `spec`, `brand`, `taste`, `sweetness`, `suitable_day`, `suitable_person`, `raw_material`) VALUES
(1, 1, 'Vanilla Gelato 香草冰淇淋蛋糕', '香草杰拉朵，用100%牛乳，自然搅拌，均匀降温，全程手工制作。杰拉朵之上覆盖的乳脂奶油，经过处理之后冷冻，是普通蛋糕不可品尝之口感体验。', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '158.00', '1磅:直径约13cm', 'Kissmilan', '冰淇淋类', '3', '0', '0', '杏仁(美国)、乳脂奶油(新西兰)、香草荚(马达加斯加)、幼砂糖'),
(2, 1, 'Vanilla Gelato 香草冰淇淋蛋糕', '香草杰拉朵，用100%牛乳，自然搅拌，均匀降温，全程手工制作。杰拉朵之上覆盖的乳脂奶油，经过处理之后冷冻，是普通蛋糕不可品尝之口感体验。', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '298.00', '2磅：直径约17cm', 'Kissmilan', '冰淇淋类', '3', '0', '0', '杏仁(美国)、乳脂奶油(新西兰)、香草荚(马达加斯加)、幼砂糖'),
(3, 2, 'Strawberry Gelato 草莓冰淇淋蛋糕', '保持一丝不苟的Gelato品质，融合了最受欢迎的草莓元素。装饰几颗草莓与蓝莓鲜果，和少许玫瑰碎瓣，冰冷的口感却不失浪漫情怀。', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '198.00', '1.5磅：直径约13cm', 'Kissmilan', '冰淇淋类', '3', '0', '0', '草莓（中国）、乳脂奶油(新西兰)、蓝莓(瑞士)、幼砂糖(韩国');



-- --------------------------------------------------------

--
-- 表的结构 `kml_city`
--
DROP TABLE IF EXISTS `kml_city`;
CREATE TABLE `kml_city` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_city`
--

INSERT INTO `kml_city` (`cid`, `cname`) VALUES
(1, '重庆'),
(2, '成都');

-- --------------------------------------------------------

--
-- 表的结构 `kml_cake_family`
--
DROP TABLE IF EXISTS `kml_cake_family`;
CREATE TABLE `kml_cake_family` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(32) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_cake_family`
--

INSERT INTO `kml_cake_family` (`fid`, `fname`, `href`) VALUES
(1, '冰淇淋蛋糕', '/goods/1'),
(2, '卡通系列', '/goods/2'),
(3, '礼盒系列', '/goods/3'),
(4, '慕斯蛋糕', '/goods/4'),
(5, '乳脂奶油蛋糕', '/goods/5'),
(6, '芝士蛋糕', '/goods/6'),
(7, '巧克力蛋糕', '/goods/7');

-- --------------------------------------------------------

--
-- 表的结构 `kml_cake_pic`
--
DROP TABLE IF EXISTS `kml_cake_pic`;
CREATE TABLE `kml_cake_pic` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `cake_id` int(11) DEFAULT NULL,
  `sm` varchar(128) DEFAULT NULL,
  `md` varchar(128) DEFAULT NULL,
  `lg` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_cake_pic`
--

INSERT INTO `kml_cake_pic` (`pid`, `cake_id`, `sm`, `md`, `lg`) VALUES
(1, 1, 'http://localhost:3000/img/details/sm/01-sm-01.jpg', 'http://localhost:3000/img/details/md/01-md-01.jpg', 'http://localhost:3000/img/details/lg/01-lg-01.jpg'),
(2, 1, 'http://localhost:3000/img/details/sm/01-sm-02.jpg', 'http://localhost:3000/img/details/md/01-md-02.jpg', 'http://localhost:3000/img/details/lg/01-lg-02.jpg'),
(3, 1, 'http://localhost:3000/img/details/sm/01-sm-03.jpg', 'http://localhost:3000/img/details/md/01-md-03.jpg', 'http://localhost:3000/img/details/lg/01-lg-03.jpg'),
(4, 2, 'http://localhost:3000/img/details/sm/02-sm-01.jpg', 'http://localhost:3000/img/details/md/02-md-01.jpg', 'http://localhost:3000/img/details/lg/02-lg-01.jpg'),
(5, 2, 'http://localhost:3000/img/details/sm/02-sm-02.jpg', 'http://localhost:3000/img/details/md/02-md-02.jpg', 'http://localhost:3000/img/details/lg/02-lg-02.jpg'),
(6, 2, 'http://localhost:3000/img/details/sm/02-sm-03.jpg', 'http://localhost:3000/img/details/md/02-md-03.jpg', 'http://localhost:3000/img/details/lg/02-lg-03.jpg');






-- --------------------------------------------------------

--
-- 表的结构 `kml_goods_bg`
--
DROP TABLE IF EXISTS `kml_goods_bg`;
CREATE TABLE `kml_goods_bg` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
   PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_goods_bg`
--

INSERT INTO `kml_goods_bg` (`gid`, `img`) VALUES
(1, 'http://localhost:3000/img/goods/bg.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `kml_goods_product`
--
DROP TABLE IF EXISTS `kml_goods_product`;
CREATE TABLE `kml_goods_product` (
  `pid` int(16) NOT NULL AUTO_INCREMENT,
  `family_id` int(16) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` varchar(268) DEFAULT NULL,
  `remind` varchar(268) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `seq_recommended` tinyint(4) DEFAULT NULL,
  `seq_new_arrival` tinyint(4) DEFAULT NULL,
  `seq_top_sale` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_goods_product`
--

INSERT INTO `kml_goods_product` (`pid`, `family_id`, `title`, `details`, `remind`, `spec`, `price`, `href`, `pic`, `seq_recommended`, `seq_new_arrival`, `seq_top_sale`) VALUES
(1, 1, 'Vanilla Gelato 香草冰淇淋蛋糕', '香草杰拉朵，用100%牛乳，自然搅拌，均匀降温，全程手工制作。杰拉朵之上覆盖的乳脂奶油，经过处理之后冷冻，是普通蛋糕不可品尝之口感体验', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解', '1磅：直径约13cm', '198.00', 'product_details.html?lid=1', 'http://localhost:3000/img/goods/cake01.jpg', 1, 1, 1),
(2, 1, 'Strawberry Gelato 草莓冰淇淋蛋糕', '保持一丝不苟的Gelato品质，融合了最受欢迎的草莓元素。装饰几颗草莓与蓝莓鲜果，和少许玫瑰碎瓣，冰冷的口感却不失浪漫情怀。', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解', '1磅：直径约13cm', '198.00', 'product_details.html?lid=2', 'http://localhost:3000/img/goods/cake02.jpg', 2, 2, 2),
(3, 1, 'Durian Gelato 榴莲冰淇淋蛋糕', '自然成熟的泰国金枕头榴莲，果肉品质上乘。与新鲜牛乳混合搅拌，冷却至-15℃，依然保持榴莲的原始浓郁味道。', '由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解', '1磅：直径约13cm', '198.00', 'product_details.html?lid=3', 'http://localhost:3000/img/goods/cake03.jpg', 3, 3, 3),
(4, 1, 'Matcha Gelato 抹茶冰淇淋蛋糕', '在用新鲜牛乳制作Gelato的时候，加入精细抹茶一并搅拌，均匀降温，凝固，至-15℃，与Gelato完美融入', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解', '1磅：直径约13cm', '198.00', 'product_details.html?lid=13', 'http://localhost:3000/img/goods/cake04.jpg', 4, 4, 4),
(5, 2, 'Elephant 小象', '来自新西兰天然牧场的乳脂奶油，搭配比利时浓郁巧克力坯底，与最底层的巧克力谷物脆。仔细品尝，还会找到蔓越莓干的惊喜。那些技艺精湛的研发师告诉我们的，蛋糕是带给人们幸福和甜蜜的食物。', '由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解', '1磅：直径约13cm', '218.00', 'product_details.html?lid=13', 'http://localhost:3000/img/goods/cake17.jpg', 5, 5, 5),
(6, 2, 'Dog 小狗', '用新西兰天然牧场的乳脂奶油，搭配比利时浓郁巧克力坯底，加入可可粒与葡萄干，满足孩子对蛋糕的应有期望。', '此类区域/小区我们将采用无接触配送，感谢您的理解。', '1磅：直径约13cm', '198.00', '/goods/detalis/8', 'http://localhost:3000/img/goods/cake18.jpg', 6, 6, 6),
(7, 3, '玫瑰蛋糕礼盒-Dream', '每一款使用马斯卡彭乳酪的蛋糕，觉非平凡。纯粹手工雕花，搭配 R.Gallica玫瑰。装饰不足以诠释爱的定义，却真正用心。特别提示：花盒中所含鲜花仅为装饰，不可食用。', '由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解', '1磅：直径约13cm', '198.00', 'product_details.html?lid=13', 'http://localhost:3000/img/goods/cake06.jpg', 6, 6, 6),
(8, 3, '\r\n玫瑰蛋糕礼盒-爱尔兰玫瑰 Irish Rose', '一款从艺术角度精心雕琢的，「爱尔兰玫瑰」搭配法国R.Gallica玫瑰，真正用心。特别提示：花盒中所含鲜花仅为装饰，不可食用。', '由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '1磅：13x13cm', '218.00', 'product_details.html?lid=13', 'http://localhost:3000/img/goods/cake07.jpg', 8, 8, 8),
(9, 4, 'Mojito 莫吉托（ Only For Summer夏日限定）\r\n', '青柠果茸与柠檬汁，与意式蛋白霜搅拌，混入半打发乳脂奶油，经速冻工艺制成慕斯。薄荷与金桔夹心，清新爽口。', '由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '1磅：约13x13cm', '198.00', '/goods/detalis/16', 'http://localhost:3000/img/goods/cake16.jpg', 9, 9, 9);

-- --------------------------------------------------------

--
-- 表的结构 `kml_index_carousel`
--
DROP TABLE IF EXISTS `kml_index_pic`;
CREATE TABLE `kml_index_carousel` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_index_carousel`
--

INSERT INTO `kml_index_carousel` (`cid`, `img`, `href`) VALUES
(1, 'http://localhost:3000/img/index/banner1.jpg', '/goods/detail/100'),
(2, 'http://localhost:3000/img/index/banner2.jpg', '/goods/detail/101'),
(3, 'http://localhost:3000/img/index/banner3.jpg', '/details/'),
(4, 'http://localhost:3000/img/index/banner4.jpg', 'lookforward.html');

-- --------------------------------------------------------

--
-- 表的结构 `kml_index_pic`
--
DROP TABLE IF EXISTS `kml_index_pic`;
CREATE TABLE `kml_index_pic` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_index_pic`
--

INSERT INTO `kml_index_pic` (`tid`, `img`) VALUES
(1, 'http://localhost:3000/img/index/car01.jpg'),
(2, 'http://localhost:3000/img/index/car02.jpg'),
(3, 'http://localhost:3000/img/index/car03.jpg'),
(4, 'http://localhost:3000/img/index/car04.jpg'),
(5, 'http://localhost:3000/img/index/car05.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `kml_order`
--
DROP TABLE IF EXISTS `kml_order`;
CREATE TABLE `kml_order` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_time` bigint(20) DEFAULT NULL,
  `pay_time` bigint(20) DEFAULT NULL,
  `deliver_time` bigint(20) DEFAULT NULL,
  `received_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_order_detail`
--
DROP TABLE IF EXISTS `kml_order_detail`;
CREATE TABLE `kml_order_detail` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_receiver_address`
--
DROP TABLE IF EXISTS `kml_receiver_address`;
CREATE TABLE `kml_receiver_address` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver` varchar(16) DEFAULT NULL,
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `county` varchar(16) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `cellphone` varchar(16) DEFAULT NULL,
  `fixedphone` varchar(16) DEFAULT NULL,
  `postcode` char(6) DEFAULT NULL,
  `tag` varchar(16) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_shoppingcart_item`
--
DROP TABLE IF EXISTS `kml_shoppingcart_item`;
CREATE TABLE `kml_shoppingcart_item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_shoppingcart_pic`
--
DROP TABLE IF EXISTS `kml_shoppingcart_pic`;
CREATE TABLE `kml_shoppingcart_pic` (
  `hid` int(10) NOT NULL AUTO_INCREMENT,
  `cake_id` int(11) DEFAULT NULL,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_shoppingcart_pic`
--

INSERT INTO `kml_shoppingcart_pic` (`hid`,`cake_id`,`img`) VALUES
(1,1,'http://localhost:3000/img/details/sm/01-sm-01.jpg'),
(2,2,'http://localhost:3000/img/details/sm/01-sm-01.jpg'),
(3,3,'http://localhost:3000/img/details/sm/02-sm-01.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `kml_user`
--
DROP TABLE IF EXISTS `kml_user`;
CREATE TABLE `kml_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_user`
--

INSERT INTO `kml_user` (`uid`, `uname`, `upwd`, `email`, `phone`, `gender`, `birthday`) VALUES
(1, 'admin', 'admin123', 'admin@qq.com', '13501234567', 0, '1993-6-21'),
(2, 'test', '123456', 'test@qq.com', '13501234568', 1, '1998-6-1');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

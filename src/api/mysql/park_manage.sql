-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2022-06-23 15:44:24
-- 服务器版本： 5.6.50-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `park_manage`
--

-- --------------------------------------------------------

--
-- 表的结构 `countdata`
--

CREATE TABLE IF NOT EXISTS `countdata` (
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `countdata`
--

INSERT INTO `countdata` (`name`, `value`, `icon`, `color`, `backgroundColor`) VALUES
('本站总访问量', 123058, 's-grid', '#5ab1ef', '#B2DFEE'),
('今日注册用户', 422, 'user', '#FFA07A', '#FFE4B5'),
('本站总注册用户', 100886, 'user', 'rgb(155, 233, 124)', 'rgba(115, 206, 87, 0.4)'),
('今日总售票', 683, 'shopping-bag-2', '#AB82FF', 'rgba(70, 141, 223, 0.4)'),
('本月总售票', 3654, 'shopping-bag-1', 'lightpink', 'mistyrose'),
('今日总退票', 38, 'sold-out', 'rgb(250, 123, 123)', '	#EEB4B4');

-- --------------------------------------------------------

--
-- 表的结构 `linechart`
--

CREATE TABLE IF NOT EXISTS `linechart` (
  `date` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `january` int(11) DEFAULT NULL COMMENT '一月',
  `february` int(11) DEFAULT NULL COMMENT '二月',
  `march` int(11) DEFAULT NULL COMMENT '三月',
  `april` int(11) DEFAULT NULL COMMENT '四月',
  `may` int(11) DEFAULT NULL COMMENT '五月',
  `june` int(11) DEFAULT NULL COMMENT '六月·',
  `july` int(11) DEFAULT NULL COMMENT '七月'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='折线图';

--
-- 转存表中的数据 `linechart`
--

INSERT INTO `linechart` (`date`, `name`, `january`, `february`, `march`, `april`, `may`, `june`, `july`) VALUES
('2022-01', '儿童票', 211, 365, 452, 234, 411, 369, 289),
('2022-02', '成人票', 560, 412, 487, 862, 452, 665, 388),
('2022-03', '老人票', 445, 236, 556, 745, 854, 635, 569),
('2022-04', '军人票', 102, 242, 265, 189, 79, 465, 301),
('2022-05', '团票', 235, 422, 325, 125, 178, 258, 369),
('2022-06', '年票', 89, 156, 99, 103, 158, 77, 199),
('2022-07', '活动票', 569, 870, 762, 446, 669, 589, 999);

-- --------------------------------------------------------

--
-- 表的结构 `tabledata`
--

CREATE TABLE IF NOT EXISTS `tabledata` (
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `todayBuy` int(11) DEFAULT NULL,
  `monthBuy` int(11) DEFAULT NULL,
  `totalBuy` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tabledata`
--

INSERT INTO `tabledata` (`name`, `todayBuy`, `monthBuy`, `totalBuy`) VALUES
('儿童票', 60, 652, 9660),
('成人票', 184, 854, 10025),
('老人票', 233, 963, 15203),
('军人票', 53, 369, 7663),
('团票', 42, 458, 8560),
('年票', 51, 198, 5647),
('活动票', 98, 187, 7443);

-- --------------------------------------------------------

--
-- 表的结构 `tb_class_ticket`
--

CREATE TABLE IF NOT EXISTS `tb_class_ticket` (
  `id` int(11) NOT NULL,
  `value` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '值',
  `price` int(11) NOT NULL COMMENT '原始价格',
  `h_price` int(11) DEFAULT NULL COMMENT '优惠价格',
  `s_time` date DEFAULT NULL COMMENT '开始时间',
  `d_time` date DEFAULT NULL COMMENT '结束时间'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='门票类型';

--
-- 转存表中的数据 `tb_class_ticket`
--

INSERT INTO `tb_class_ticket` (`id`, `value`, `price`, `h_price`, `s_time`, `d_time`) VALUES
(1, '儿童票', 380, 40, '2022-06-18', '2022-06-28'),
(2, '成人票', 550, 50, '2022-06-18', '2022-06-28'),
(3, '老人票', 520, 50, '2022-06-18', '2022-07-28'),
(4, '军人票\r\n', 480, 60, '2022-06-18', '2022-06-18'),
(5, '团票', 3888, 200, '2022-06-18', '2022-06-28'),
(6, '年票', 3999, 150, '2022-06-18', '2022-06-28'),
(12, '端午节活动', 3000, 20, '2022-06-01', '2022-06-03');

-- --------------------------------------------------------

--
-- 表的结构 `tb_ticket`
--

CREATE TABLE IF NOT EXISTS `tb_ticket` (
  `ticket_id` int(11) NOT NULL COMMENT '票号',
  `ticket_type` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '门票类型',
  `ticket_price` int(11) NOT NULL COMMENT '门票价格',
  `ticket_discount` int(11) NOT NULL COMMENT '优惠价格',
  `ticket_state` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `ticket_name` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '游客名称',
  `ticket_ip` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `ticket_year` int(11) NOT NULL COMMENT '游客年龄',
  `ticket_date` date NOT NULL COMMENT '日期'
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='售票';

--
-- 转存表中的数据 `tb_ticket`
--

INSERT INTO `tb_ticket` (`ticket_id`, `ticket_type`, `ticket_price`, `ticket_discount`, `ticket_state`, `ticket_name`, `ticket_ip`, `ticket_year`, `ticket_date`) VALUES
(1, '年票', 3999, 150, '预订票', '李平', '182999999', 12, '2022-06-16'),
(22, '军人票', 280, 30, '已购票', '胡德', '13256569632', 42, '2022-06-17'),
(9, '端午节活动', 300, 20, '预订票', '李海峰', '19956568479', 34, '2022-06-17'),
(10, '活动票', 300, 100, '预订票', '李海峰', '19956568479', 34, '2022-06-17'),
(11, '儿童票', 380, 40, '已购票', '李海峰', '19956568479', 34, '2022-06-17'),
(12, '成人票', 550, 50, '已退票', '李海峰', '19956568479', 34, '2022-06-17'),
(13, '成人票', 550, 50, '已退票', '李海峰', '19956568479', 34, '2022-06-17'),
(14, '成人票', 550, 50, '已退票', '李海峰', '19956568479', 34, '2022-06-17'),
(15, '成人票', 480, 40, '已购票', '李海峰', '19956568479', 34, '2022-06-17'),
(16, '团票', 1200, 100, '已购票', '李海峰', '19956568479', 34, '2022-06-17'),
(17, '成人票', 480, 40, '已购票', '李海峰', '19956568479', 34, '2022-06-17'),
(18, '成人票', 480, 40, '已购票', '李海峰', '19956568479', 34, '2022-06-17'),
(19, '成人票', 480, 40, '已购票', '李海峰', '19956568479', 34, '2022-06-17'),
(20, '成人票', 480, 40, '已购票', '李海峰', '19956568479', 34, '2022-06-17'),
(25, '年票', 3999, 150, '已购票', '哈哈', '124545', 18, '2022-06-18'),
(26, '成人票', 550, 50, '已购票', '协调机构', '11111111111', 42, '2022-06-22');

-- --------------------------------------------------------

--
-- 表的结构 `tb_userlist`
--

CREATE TABLE IF NOT EXISTS `tb_userlist` (
  `id` int(11) NOT NULL,
  `user_name` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `image` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `user_account` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户账号',
  `user_password` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `addr` char(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户地址',
  `user_time` datetime NOT NULL COMMENT '注册时间',
  `permissions` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户权限',
  `state` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户状态'
) ENGINE=MyISAM AUTO_INCREMENT=643 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户列表';

--
-- 转存表中的数据 `tb_userlist`
--

INSERT INTO `tb_userlist` (`id`, `user_name`, `image`, `user_account`, `user_password`, `email`, `addr`, `user_time`, `permissions`, `state`) VALUES
(1, '风见一姬', 'images/16553609092569.jpeg', 'adminx', '123456', '3046251309@qq.com', '台南市安平区建平十六街', '2022-04-11 15:24:21', '站长', '正常'),
(2, '风舰一机', 'images/16553610689831.jpeg', 'admind', '123456', '3356571039@qq.com', '宜兰县罗东镇尚武街', '2022-05-22 18:18:23', '超级管理员', '正常'),
(3, '风剑一击', 'images/16553611169038.jpg', 'admins', '123456', '2605013165@qq.com', '桃园市龟山区海萍路', '2022-05-22 18:18:24', '管理员', '正常'),
(4, '王也', 'images/16553611292614.jpeg', 'adm123', '123456', '3621353596@qq.com', '高雄市仁武区澄德路', '2022-05-22 19:47:12', '管理员', '禁用'),
(621, '老干妈', 'images/16553611385707.jpg', 'adm456', '123456', '56415641@qq.com', '中国大陆地址', '2022-06-07 21:25:58', '管理员', '正常'),
(627, '普朗克', 'images/16553611463287.jpg', 'adm789', '123456', '48484@qq.com', '中国大陆地址', '2022-06-08 23:09:46', '管理员', '正常'),
(628, '可可粉', 'images/16553611579902.jpeg', 'ulits_out', '123456', '5555555555@qq.com', '中国大陆地址', '2022-06-09 16:28:18', '管理员', '正常'),
(630, '林妙', 'images/16553611841237.jpeg', 'account', '123456', '3045521412@qq.com', '中国大陆地址', '2022-06-16 14:35:36', '管理员', '正常'),
(631, '供货商', 'images/16553613705234.jpeg', 'docuent', '123456', '65241889@qq.com', '中国大陆地址', '2022-06-16 14:36:35', '管理员', '正常'),
(632, '高端市场', 'images/16553615992712.jpeg', 'use_account', '123456', '5455169@qq.com', '中国大陆地址', '2022-06-16 14:40:24', '管理员', '正常'),
(633, '梵高', 'images/16553618814949.jpg', 'oodleny', '123456', '7795663@qq.com', '中国大陆地址', '2022-06-16 14:43:03', '管理员', '正常'),
(634, '卡夫卡', 'images/16554564872828.jpeg', 'font_lew', '123456', '233654897@qq.com', '中国大陆地址', '2022-06-16 14:47:08', '管理员', '正常'),
(635, '由于西', 'images/16554558958226.jpeg', 'you_ke', '123456', '233456741@qq.com', '香港沿海地区', '2022-06-17 15:45:07', '游客', '正常'),
(636, '开发阶段', 'images/16554544745555.jpeg', 'you_ket', '123456', '3654541245@qq.com', '中国大陆地址', '2022-06-17 16:28:44', '游客', '正常'),
(637, '爷不玩了', 'images/16554560354090.jpeg', 'tianqi', '123456', '54130096@qq.com', '中国大陆地址', '2022-06-17 16:54:43', '游客', '正常'),
(638, '玛卡巴卡', 'images/16554565394281.jpeg', 'jiaruni', '123456', '44562132@qq.com', '中国大陆地址', '2022-06-17 17:02:47', '游客', '正常'),
(639, '杨琳玲', 'images/16555648357457.jpg', 'hogalle', '123456', 'hmbx@iubridge.com', '陕西省渭南市大荔县阿里路六六一号', '2022-06-18 23:07:34', '游客', '正常'),
(640, '缪雪', 'images/16555649063169.jpg', 'thickness', '123456', 'knirr@iubridge.com', '广东省清远市阳山县旅游路四四三号', '2022-06-18 23:08:54', '游客', '正常'),
(641, '曾勉', 'images/16558694641019.jpeg', 'suspici', '123456', 'zidw@iubridge.com', '湖南省益阳市安化县盐城路四一号', '2022-06-18 23:10:14', '游客', '正常');

-- --------------------------------------------------------

--
-- 表的结构 `userchart`
--

CREATE TABLE IF NOT EXISTS `userchart` (
  `date` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户图';

--
-- 转存表中的数据 `userchart`
--

INSERT INTO `userchart` (`date`, `new`, `active`) VALUES
('周二', 12, 212),
('周一', 25, 235),
('周三', 36, 369),
('周四', 28, 288),
('周五', 59, 296),
('周六', 78, 598),
('周日', 46, 546);

-- --------------------------------------------------------

--
-- 表的结构 `videodata`
--

CREATE TABLE IF NOT EXISTS `videodata` (
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='饼图';

--
-- 转存表中的数据 `videodata`
--

INSERT INTO `videodata` (`name`, `value`) VALUES
('儿童票', 9660),
('成人票', 10025),
('老人票', 15203),
('军人票', 7663),
('团票', 8560),
('年票', 5647),
('活动票', 7443);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_class_ticket`
--
ALTER TABLE `tb_class_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_ticket`
--
ALTER TABLE `tb_ticket`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `tb_userlist`
--
ALTER TABLE `tb_userlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_class_ticket`
--
ALTER TABLE `tb_class_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tb_ticket`
--
ALTER TABLE `tb_ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '票号',AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tb_userlist`
--
ALTER TABLE `tb_userlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=643;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

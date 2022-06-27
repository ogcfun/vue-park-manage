-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 park_manage 的数据库结构
CREATE DATABASE IF NOT EXISTS `park_manage` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `park_manage`;

-- 导出  表 park_manage.countdata 结构
CREATE TABLE IF NOT EXISTS `countdata` (
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  park_manage.countdata 的数据：6 rows
/*!40000 ALTER TABLE `countdata` DISABLE KEYS */;
REPLACE INTO `countdata` (`name`, `value`, `icon`, `color`, `backgroundColor`) VALUES
	('本站总访问量', 923058, 's-grid', '#5ab1ef', '#B2DFEE'),
	('今日注册用户', 422, 'user', '#FFA07A', '#FFE4B5'),
	('本站总注册用户', 420486, 'user', 'rgb(155, 233, 124)', 'rgba(115, 206, 87, 0.4)'),
	('今日总售票', 683, 'shopping-bag-2', '#AB82FF', 'rgba(70, 141, 223, 0.4)'),
	('本月总售票', 3654, 'shopping-bag-1', 'lightpink', 'mistyrose'),
	('今日总退票', 38, 'sold-out', 'rgb(250, 123, 123)', '	#EEB4B4');
/*!40000 ALTER TABLE `countdata` ENABLE KEYS */;

-- 导出  表 park_manage.linechart 结构
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

-- 正在导出表  park_manage.linechart 的数据：7 rows
/*!40000 ALTER TABLE `linechart` DISABLE KEYS */;
REPLACE INTO `linechart` (`date`, `name`, `january`, `february`, `march`, `april`, `may`, `june`, `july`) VALUES
	('2022-01', '儿童票', 211, 365, 452, 234, 411, 369, 289),
	('2022-02', '成人票', 560, 412, 487, 862, 452, 665, 388),
	('2022-03', '老人票', 445, 236, 556, 745, 854, 635, 569),
	('2022-04', '军人票', 102, 242, 265, 189, 79, 465, 301),
	('2022-05', '团票', 235, 422, 325, 125, 178, 258, 369),
	('2022-06', '年票', 89, 156, 99, 103, 158, 77, 199),
	('2022-07', '活动票', 569, 870, 762, 446, 669, 589, 999);
/*!40000 ALTER TABLE `linechart` ENABLE KEYS */;

-- 导出  表 park_manage.tabledata 结构
CREATE TABLE IF NOT EXISTS `tabledata` (
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `todayBuy` int(11) DEFAULT NULL,
  `monthBuy` int(11) DEFAULT NULL,
  `totalBuy` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  park_manage.tabledata 的数据：7 rows
/*!40000 ALTER TABLE `tabledata` DISABLE KEYS */;
REPLACE INTO `tabledata` (`name`, `todayBuy`, `monthBuy`, `totalBuy`) VALUES
	('儿童票', 60, 652, 9660),
	('成人票', 184, 854, 10025),
	('老人票', 233, 963, 15203),
	('军人票', 53, 369, 7663),
	('团票', 42, 458, 8560),
	('年票', 51, 198, 5647),
	('活动票', 98, 187, 7443);
/*!40000 ALTER TABLE `tabledata` ENABLE KEYS */;

-- 导出  表 park_manage.tb_addsign 结构
CREATE TABLE IF NOT EXISTS `tb_addsign` (
  `sign_id` int(11) NOT NULL AUTO_INCREMENT,
  `sign_name` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `sign_image` char(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `sign_account` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '账号',
  `sign_password` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `sign_email` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '邮箱',
  `sign_addr` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `sign_time` datetime NOT NULL COMMENT '注册时间·',
  `sign_permissions` char(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限',
  `sign_state` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态',
  `sign_pace` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '未审核',
  PRIMARY KEY (`sign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='新增管理员';

-- 正在导出表  park_manage.tb_addsign 的数据：10 rows
/*!40000 ALTER TABLE `tb_addsign` DISABLE KEYS */;
REPLACE INTO `tb_addsign` (`sign_id`, `sign_name`, `sign_image`, `sign_account`, `sign_password`, `sign_email`, `sign_addr`, `sign_time`, `sign_permissions`, `sign_state`, `sign_pace`) VALUES
	(10, '李贺', 'images/default.png', 'test002', '123456', '123456@qq.com', '河北省石家庄市市辖区', '2022-06-27 16:45:17', '管理员', '正常', '未通过'),
	(9, '河里', 'images/default.png', 'test001', '123456', '123456@qq.com', '天津市市辖区和平区', '2022-06-27 16:44:44', '管理员', '正常', '未通过'),
	(8, '李杰', 'images/default.png', 'abc111', '123456', '123456@qq.com', '北京市市辖区东城区', '2022-06-27 16:43:57', '管理员', '正常', '已通过'),
	(11, '张观博', 'images/default.png', 'test003', '123456', '123456@qq.com', '山西省大同市新荣区', '2022-06-27 16:54:58', '管理员', '正常', '未通过'),
	(12, '刘润生', 'images/default.png', 'test004', '123456', '123456@qq.com', '河北省唐山市路南区', '2022-06-27 16:55:39', '管理员', '正常', '未通过'),
	(13, '韩刚龙', 'images/default.png', 'test005', '123456', '123456@qq.com', '河北省唐山市路南区', '2022-06-27 16:55:59', '管理员', '正常', '未通过'),
	(14, '孙丽萍', 'images/default.png', 'test006', '123456', '123456@qq.com', '天津市市辖区河西区', '2022-06-27 16:56:27', '管理员', '正常', '未通过'),
	(15, '陈桂平', 'images/default.png', 'test007', '123456', '123456@qq.com', '河北省唐山市路南区', '2022-06-27 16:56:49', '管理员', '正常', '未通过'),
	(16, '李熙平', 'images/default.png', 'test008', '123456', '123456@qq.com', '云南省曲靖市麒麟区', '2022-06-27 16:57:07', '管理员', '正常', '未审核'),
	(17, '董三女', 'images/default.png', 'test009', '123456', '123456@qq.com', '海南省三沙市南沙群岛', '2022-06-27 16:57:34', '管理员', '正常', '未审核');
/*!40000 ALTER TABLE `tb_addsign` ENABLE KEYS */;

-- 导出  表 park_manage.tb_class_ticket 结构
CREATE TABLE IF NOT EXISTS `tb_class_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '值',
  `price` int(11) NOT NULL COMMENT '原始价格',
  `h_price` int(11) DEFAULT NULL COMMENT '优惠价格',
  `s_time` date DEFAULT NULL COMMENT '开始时间',
  `d_time` date DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='门票类型';

-- 正在导出表  park_manage.tb_class_ticket 的数据：7 rows
/*!40000 ALTER TABLE `tb_class_ticket` DISABLE KEYS */;
REPLACE INTO `tb_class_ticket` (`id`, `value`, `price`, `h_price`, `s_time`, `d_time`) VALUES
	(1, '儿童票', 380, 40, '2022-06-18', '2022-06-28'),
	(2, '成人票', 550, 50, '2022-06-18', '2022-06-28'),
	(3, '老人票', 520, 50, '2022-06-18', '2022-07-28'),
	(4, '军人票\r\n', 480, 60, '2022-06-18', '2022-06-18'),
	(5, '团票', 3888, 200, '2022-06-18', '2022-06-28'),
	(6, '年票', 3999, 150, '2022-06-18', '2022-06-28'),
	(12, '端午节活动', 3000, 20, '2022-06-01', '2022-06-03');
/*!40000 ALTER TABLE `tb_class_ticket` ENABLE KEYS */;

-- 导出  表 park_manage.tb_ticket 结构
CREATE TABLE IF NOT EXISTS `tb_ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '票号',
  `ticket_type` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '门票类型',
  `ticket_price` int(11) NOT NULL COMMENT '门票价格',
  `ticket_discount` int(11) NOT NULL COMMENT '优惠价格',
  `ticket_state` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `ticket_name` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '游客名称',
  `ticket_ip` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `ticket_year` int(11) NOT NULL COMMENT '游客年龄',
  `ticket_date` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='售票';

-- 正在导出表  park_manage.tb_ticket 的数据：16 rows
/*!40000 ALTER TABLE `tb_ticket` DISABLE KEYS */;
REPLACE INTO `tb_ticket` (`ticket_id`, `ticket_type`, `ticket_price`, `ticket_discount`, `ticket_state`, `ticket_name`, `ticket_ip`, `ticket_year`, `ticket_date`) VALUES
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
/*!40000 ALTER TABLE `tb_ticket` ENABLE KEYS */;

-- 导出  表 park_manage.tb_userlist 结构
CREATE TABLE IF NOT EXISTS `tb_userlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `image` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `user_account` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户账号',
  `user_password` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `addr` char(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户地址',
  `user_time` datetime NOT NULL COMMENT '注册时间',
  `permissions` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户权限',
  `state` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=649 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户列表';

-- 正在导出表  park_manage.tb_userlist 的数据：20 rows
/*!40000 ALTER TABLE `tb_userlist` DISABLE KEYS */;
REPLACE INTO `tb_userlist` (`id`, `user_name`, `image`, `user_account`, `user_password`, `email`, `addr`, `user_time`, `permissions`, `state`) VALUES
	(1, '风见一姬', 'images/16553609092569.jpeg', 'adminx', 'deng2001', '3446251399@qq.com', '台南市安平区建平十六街', '2022-04-11 15:24:21', '站长', '正常'),
	(2, '风舰一机', 'images/16553610689831.jpeg', 'admind', 'deng2001', '3356571339@qq.com', '宜兰县罗东镇尚武街', '2022-05-22 18:18:23', '超级管理员', '正常'),
	(3, '风剑一击', 'images/16553611169038.jpg', 'admins', '123456', '2605013165@qq.com', '桃园市龟山区海萍路', '2022-05-22 18:18:24', '管理员', '正常'),
	(4, '风健一鸡', 'images/16553611292614.jpeg', 'adminm', '123456', '3621355596@qq.com', '高雄市仁武区澄德路', '2022-05-22 19:47:12', '管理员', '禁用'),
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
	(641, '曾勉', 'images/default.jpeg', 'suspici', '123456', 'zidw@iubridge.com', '湖南省益阳市安化县盐城路四一号', '2022-06-18 23:10:14', '游客', '正常'),
	(648, '李杰', 'images/default.png', 'abc111', '123456', '123456@qq.com', '北京市市辖区东城区', '2022-06-27 17:00:31', '管理员', '正常');
/*!40000 ALTER TABLE `tb_userlist` ENABLE KEYS */;

-- 导出  表 park_manage.userchart 结构
CREATE TABLE IF NOT EXISTS `userchart` (
  `date` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户图';

-- 正在导出表  park_manage.userchart 的数据：7 rows
/*!40000 ALTER TABLE `userchart` DISABLE KEYS */;
REPLACE INTO `userchart` (`date`, `new`, `active`) VALUES
	('周二', 12, 212),
	('周一', 25, 235),
	('周三', 36, 369),
	('周四', 28, 288),
	('周五', 59, 296),
	('周六', 78, 598),
	('周日', 46, 546);
/*!40000 ALTER TABLE `userchart` ENABLE KEYS */;

-- 导出  表 park_manage.videodata 结构
CREATE TABLE IF NOT EXISTS `videodata` (
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='饼图';

-- 正在导出表  park_manage.videodata 的数据：7 rows
/*!40000 ALTER TABLE `videodata` DISABLE KEYS */;
REPLACE INTO `videodata` (`name`, `value`) VALUES
	('儿童票', 9660),
	('成人票', 10025),
	('老人票', 15203),
	('军人票', 7663),
	('团票', 8560),
	('年票', 5647),
	('活动票', 7443);
/*!40000 ALTER TABLE `videodata` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*
MySQL Backup
Database: mybaits
Backup Time: 2020-03-20 16:51:43
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `mybaits`.`appointment`;
DROP TABLE IF EXISTS `mybaits`.`book`;
DROP TABLE IF EXISTS `mybaits`.`country`;
DROP TABLE IF EXISTS `mybaits`.`sys_privilege`;
DROP TABLE IF EXISTS `mybaits`.`sys_role`;
DROP TABLE IF EXISTS `mybaits`.`sys_role_privilege`;
DROP TABLE IF EXISTS `mybaits`.`sys_user`;
DROP TABLE IF EXISTS `mybaits`.`sys_user_role`;
CREATE TABLE `appointment` (
  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
  `student_id` bigint(20) NOT NULL COMMENT '学号',
  `appoint_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  PRIMARY KEY (`book_id`,`student_id`),
  KEY `idx_appoint_time` (`appoint_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约图书表';
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `name` varchar(100) NOT NULL COMMENT '图书名称',
  `number` int(11) NOT NULL COMMENT '馆藏数量',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='图书表';
CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `countryname` varchar(255) DEFAULT NULL,
  `countrycode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `sys_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `privilege_name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `privilege_url` varchar(200) DEFAULT NULL COMMENT '权限URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限表';
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(500) DEFAULT NULL COMMENT '角色名',
  `enabled` int(11) NOT NULL COMMENT '有效标志',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';
CREATE TABLE `sys_role_privilege` (
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pribilege_id` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `user_password` varchar(50) DEFAULT NULL COMMENT '用户密码',
  `user_email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `user_info` text COMMENT '用户简介',
  `head_img` blob COMMENT '用户头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COMMENT='用户表';
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色关联';
BEGIN;
LOCK TABLES `mybaits`.`appointment` WRITE;
DELETE FROM `mybaits`.`appointment`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mybaits`.`book` WRITE;
DELETE FROM `mybaits`.`book`;
INSERT INTO `mybaits`.`book` (`book_id`,`name`,`number`) VALUES (1000, 'Java程序设计', 7),(1001, '数据结构', 10),(1002, '设计模式', 10),(1003, '编译原理', 10);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mybaits`.`country` WRITE;
DELETE FROM `mybaits`.`country`;
INSERT INTO `mybaits`.`country` (`id`,`countryname`,`countrycode`) VALUES (1, '中国', 'CN'),(2, '美国', 'US'),(3, '俄罗斯', 'RU'),(4, '英国', 'GB'),(5, '法国', 'FR');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mybaits`.`sys_privilege` WRITE;
DELETE FROM `mybaits`.`sys_privilege`;
INSERT INTO `mybaits`.`sys_privilege` (`id`,`privilege_name`,`privilege_url`) VALUES (1, '用户管理', '/users'),(2, '角色管理', '/roles'),(3, '系统日志', '/logs'),(4, '人员维护', '/persons'),(5, '单位维护', '/companies');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mybaits`.`sys_role` WRITE;
DELETE FROM `mybaits`.`sys_role`;
INSERT INTO `mybaits`.`sys_role` (`id`,`role_name`,`enabled`,`create_by`,`create_time`) VALUES (1, '管理员', 1, 1, '2020-03-16 11:21:27'),(2, '普通用户', 1, 1, '2020-03-16 11:21:44');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mybaits`.`sys_role_privilege` WRITE;
DELETE FROM `mybaits`.`sys_role_privilege`;
INSERT INTO `mybaits`.`sys_role_privilege` (`role_id`,`pribilege_id`) VALUES (1, 1),(1, 3),(1, 2),(2, 4),(2, 5);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mybaits`.`sys_user` WRITE;
DELETE FROM `mybaits`.`sys_user`;
INSERT INTO `mybaits`.`sys_user` (`id`,`user_name`,`user_password`,`user_email`,`user_info`,`head_img`,`create_time`) VALUES (1, 'admin', '123456', 'admin@mybatis.com', '管理员', NULL, '2020-03-16 11:20:16'),(1001, 'test', '123456', 'test@mybatis.com', '测试用户', NULL, '2020-03-16 11:20:59');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mybaits`.`sys_user_role` WRITE;
DELETE FROM `mybaits`.`sys_user_role`;
INSERT INTO `mybaits`.`sys_user_role` (`user_id`,`role_id`) VALUES (1, 1),(1, 2),(1001, 2);
UNLOCK TABLES;
COMMIT;

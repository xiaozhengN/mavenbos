/*==============================================================*/
/* DBMS name:      MySQL  5.7.20                                */
/* Created on:     2021年5月2日18:06:38                          */
/*==============================================================*/

drop database if exists bos;
create database if not exists bos character set = 'utf8mb4' collate = 'utf8mb4_general_ci';

use bos;

drop table if exists qp_noticebill;
drop table if exists qp_workbill;
drop table if exists qp_workordermanage;

/*==============================================================*/
/* Table: qp_noticebill                                         */
/*==============================================================*/
create table qp_noticebill
(
   id                   varchar(32) not null,
   customer_id          varchar(32),
   customer_name        varchar(20),
   delegater            varchar(20),
   telephone            varchar(20),
   pickaddress          varchar(200),
   arrivecity           varchar(20),
   product              varchar(20),
   pickdate             date,
   num                  int,
   weight               double,
   volume               varchar(20),
   remark               varchar(255),
   ordertype            varchar(20),
   user_id              varchar(32),
   staff_id             varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: qp_workbill                                           */
/*==============================================================*/
create table qp_workbill
(
   id                   varchar(32) not null,
   noticebill_id        varchar(32),
   type                 varchar(20),
   pickstate            varchar(20),
   buildtime            timestamp,
   attachbilltimes      int,
   remark               varchar(255),
   staff_id             varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: qp_workordermanage                                    */
/*==============================================================*/
create table qp_workordermanage
(
   id                   varchar(32) not null,
   arrivecity           varchar(20),
   product              varchar(20),
   num                  int,
   weight               double,
   floadreqr            varchar(255),
   prodtimelimit        varchar(40),
   prodtype             varchar(40),
   sendername           varchar(20),
   senderphone          varchar(20),
   senderaddr           varchar(200),
   receivername         varchar(20),
   receiverphone        varchar(20),
   receiveraddr         varchar(200),
   feeitemnum           int,
   actlweit             double,
   vol                  varchar(20),
   managerCheck         varchar(1),
   updatetime           date,
   primary key (id)
);

/* 创建user数据表 */
create table user (
	id varchar(32) primary key,
	username varchar(20),
	password varchar(32), /* md5加密密码 */
	salary double ,
	birthday date ,
	gender varchar(10),
	station varchar(40),
	telephone varchar(11),
	remark varchar(255)
);

/* 初始化一条记录  */
insert into user(id,username,password) values('abcdefghijklmn','admin',md5('admin'));
insert into user(id,username,password) values('1','test1',md5('test1'));


alter table qp_noticebill add constraint FK_Reference_2 foreign key (user_id)
      references user (id) on delete restrict on update restrict;

alter table qp_noticebill add constraint FK_Reference_3 foreign key (staff_id)
      references bc_staff (id) on delete restrict on update restrict;

alter table qp_workbill add constraint FK_Reference_4 foreign key (staff_id)
      references bc_staff (id) on delete restrict on update restrict;

alter table qp_workbill add constraint FK_workbill_noticebill_fk foreign key (noticebill_id)
      references qp_noticebill (id) on delete restrict on update restrict;

/*
Navicat MySQL Data Transfer

Source Server         : xxx
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : bos

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-05-26 07:52:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_function`
-- ----------------------------
DROP TABLE IF EXISTS `auth_function`;
CREATE TABLE `auth_function` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `generateMenu` varchar(255) DEFAULT NULL,
  `zindex` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF101A48F383D56EC` (`pid`),
  CONSTRAINT `FKF101A48F383D56EC` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_function
-- ----------------------------
INSERT INTO `auth_function` VALUES ('11', '基础档案', '基础档案功能', null, '1', '0', null);
INSERT INTO `auth_function` VALUES ('112', '收派标准', null, 'page_base_standard.action', '1', '1', '11');
INSERT INTO `auth_function` VALUES ('113', '取派员设置', null, 'page_base_staff.action', '1', '2', '11');
INSERT INTO `auth_function` VALUES ('114', '区域设置', null, 'page_base_region.action', '1', '3', '11');
INSERT INTO `auth_function` VALUES ('115', '管理分区', null, 'page_base_subarea.action', '1', '4', '11');
INSERT INTO `auth_function` VALUES ('116', '管理定区/调度排版', null, 'page_base_decidedzone.action', '1', '5', '11');
INSERT INTO `auth_function` VALUES ('12', '受理', null, null, '1', '1', null);
INSERT INTO `auth_function` VALUES ('121', '业务受理', null, 'page_qupai_noticebill_add.action', '1', '0', '12');
INSERT INTO `auth_function` VALUES ('122', '工作单快速录入', null, 'page_qupai_quickworkorder.action', '1', '1', '12');
INSERT INTO `auth_function` VALUES ('124', '工作单导入', null, 'page_qupai_workorderimport.action', '1', '3', '12');
INSERT INTO `auth_function` VALUES ('13', '调度', null, null, '1', '2', null);
INSERT INTO `auth_function` VALUES ('131', '查台转单', null, null, '1', '0', '13');
INSERT INTO `auth_function` VALUES ('132', '人工调度', null, 'page":"page_qupai_diaodu.action', '1', '1', '13');
INSERT INTO `auth_function` VALUES ('14', '中转配送流程管理', null, null, '1', '3', null);
INSERT INTO `auth_function` VALUES ('141', '工作单审核', null, 'workordermanage_list.action', '1', '0', '14');
INSERT INTO `auth_function` VALUES ('142', '查看个人任务', null, 'page_workflow_personaltask.action', '1', '1', '14');
INSERT INTO `auth_function` VALUES ('143', '查看我的组任务', null, null, '1', '2', '14');



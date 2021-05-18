/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : wk

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 27/04/2021 16:49:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_work_order
-- ----------------------------
DROP TABLE IF EXISTS `biz_work_order`;
CREATE TABLE `biz_work_order`  (
  `aid` bigint(5) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consumer` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消费者账户ID',
  `worker` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工账户ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `state` int(2) NOT NULL DEFAULT 0 COMMENT '申请状态，0待分配，1正在处理，2已结束',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'A' COMMENT '数据状态，A正常D删除S停用T其他',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_work_order
-- ----------------------------
INSERT INTO `biz_work_order` VALUES (3, 'xiaofei', 'yg1', '新增一个工单 消费者1', '多少豆有点问题', 2, '2021-04-27 16:34:20', '2021-04-27 16:40:39', 'A');

-- ----------------------------
-- Table structure for biz_work_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `biz_work_order_detail`;
CREATE TABLE `biz_work_order_detail`  (
  `aid` bigint(5) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` bigint(5) NOT NULL COMMENT '自增主键',
  `operator` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消费者账户ID',
  `deal_answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理进度明细',
  `deal_type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'U' COMMENT '处理进度类型，D指派 C确认 A回复 C完成 ',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'A' COMMENT '数据状态，A正常D删除S停用T其他',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_work_order_detail
-- ----------------------------
INSERT INTO `biz_work_order_detail` VALUES (10, 3, 'admin', '将工单分配到【yg1】,请等待员工确认!', 'D', '2021-04-27 16:35:15', 'A');
INSERT INTO `biz_work_order_detail` VALUES (31, 3, 'yg1', '已经确认工单,稍微会与您联系,若长时间未与您联系,烦请主动联系,联系方式为：请联系我，11111或者22222', 'C', '2021-04-27 16:38:11', 'A');
INSERT INTO `biz_work_order_detail` VALUES (32, 3, 'yg1', '您好，您的问题已经处理完毕', 'A', '2021-04-27 16:38:30', 'A');
INSERT INTO `biz_work_order_detail` VALUES (33, 3, 'xiaofei', '好的大宝贝', 'A', '2021-04-27 16:39:06', 'A');
INSERT INTO `biz_work_order_detail` VALUES (34, 3, 'yg1', '谢谢您的反馈，拜拜了您类', 'F', '2021-04-27 16:40:39', 'A');

-- ----------------------------
-- Table structure for manage_config
-- ----------------------------
DROP TABLE IF EXISTS `manage_config`;
CREATE TABLE `manage_config`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数组',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数值',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manage_config
-- ----------------------------
INSERT INTO `manage_config` VALUES ('417b11eb44be47bd9814e12f428ebfd2', 'sex', '保密', '0', '性别保密', '0');
INSERT INTO `manage_config` VALUES ('8b1cd597be9d44df8bb3bad427a6a4e6', 'sex', '男', '1', '性别男', '0');
INSERT INTO `manage_config` VALUES ('dd3fae3d4f664336902216e599770412', 'sex', '女', '2', '性别女', '0');

-- ----------------------------
-- Table structure for manage_gen_attr
-- ----------------------------
DROP TABLE IF EXISTS `manage_gen_attr`;
CREATE TABLE `manage_gen_attr`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jdbc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `java_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `java_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `code_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manage_gen_attr
-- ----------------------------
INSERT INTO `manage_gen_attr` VALUES ('02d7f03b53e048f4a3df14f25170e790', 'group_name', 'groupName', '参数组', 'String', '1', '1', '1', '1', 1, '24b0b996847942528f5a78c806ad2db9');
INSERT INTO `manage_gen_attr` VALUES ('08b9492cf1f4494893af5496455b0c23', 'consumer', 'consumer', '消费者账户ID', 'String', '1', '1', '1', '0', 0, '5b4e19768aa744edac7eb6f7a794df4e');
INSERT INTO `manage_gen_attr` VALUES ('0efec278d4c34b00bd609ed6709e6405', 'status', 'status', '状态', 'String', '0', '1', '1', '0', 5, '24b0b996847942528f5a78c806ad2db9');
INSERT INTO `manage_gen_attr` VALUES ('12c0b878c37e40518a73ed442a3f2fed', 'state', 'state', '申请状态，0待分配，1正在处理，2已结束', 'Integer', '1', '1', '1', '0', 0, '5b4e19768aa744edac7eb6f7a794df4e');
INSERT INTO `manage_gen_attr` VALUES ('12d484ad84df4a7c96f34a5d02defc97', 'des', 'des', '描述', 'String', '1', '1', '1', '0', 4, '24b0b996847942528f5a78c806ad2db9');
INSERT INTO `manage_gen_attr` VALUES ('1e1f9deed8cc49eb8ce76ccbb783139c', 'worker', 'worker', '员工账户ID', 'String', '1', '1', '1', '0', 0, '5b4e19768aa744edac7eb6f7a794df4e');
INSERT INTO `manage_gen_attr` VALUES ('25df590b4731407890620b874dd97dc0', 'operator', 'operator', '消费者账户ID', 'String', '1', '1', '1', '0', 0, 'c79b93e1b5264121b0a78c1d203b362e');
INSERT INTO `manage_gen_attr` VALUES ('54930f368f2948b48b5ec36301d2c6db', 'order_id', 'orderId', '自增主键', 'Long', '1', '1', '1', '0', 0, 'c79b93e1b5264121b0a78c1d203b362e');
INSERT INTO `manage_gen_attr` VALUES ('63a53ba570c84d789c5ae7a841ab0fb0', 'name', 'name', '参数名称', 'String', '1', '1', '1', '1', 2, '24b0b996847942528f5a78c806ad2db9');
INSERT INTO `manage_gen_attr` VALUES ('6ec626a5dd8243d3bca076e54d1c16a5', 'status', 'status', '数据状态，A正常D删除S停用T其他', 'String', '1', '1', '1', '0', 0, 'c79b93e1b5264121b0a78c1d203b362e');
INSERT INTO `manage_gen_attr` VALUES ('7a3350e1b6004f51b7cc691fab5da25d', 'value', 'value', '参数值', 'String', '1', '1', '1', '0', 3, '24b0b996847942528f5a78c806ad2db9');
INSERT INTO `manage_gen_attr` VALUES ('8f9d6fa6022b467085bb72f651aaeefc', 'id', 'id', 'ID', 'String', '1', '0', '0', '0', 0, '24b0b996847942528f5a78c806ad2db9');
INSERT INTO `manage_gen_attr` VALUES ('98edfe4ecfa24e1cbc1bc42d4f2d7522', 'aid', 'aid', '自增主键', 'Long', '1', '1', '1', '0', 0, 'c79b93e1b5264121b0a78c1d203b362e');
INSERT INTO `manage_gen_attr` VALUES ('ae627e5f5073425190c574f1f7b6808f', 'deal_answer', 'dealAnswer', '处理进度明细', 'String', '1', '1', '1', '0', 0, 'c79b93e1b5264121b0a78c1d203b362e');
INSERT INTO `manage_gen_attr` VALUES ('b6b49b3ae8da4c3a94f01de15d6f215c', 'status', 'status', '数据状态，A正常D删除S停用T其他', 'String', '1', '1', '1', '0', 0, '5b4e19768aa744edac7eb6f7a794df4e');
INSERT INTO `manage_gen_attr` VALUES ('c468a64e3d6b4fde9a7b7b7e4af2869c', 'updateTime', 'updateTime', '更新时间', 'java.util.Date', '1', '1', '1', '0', 0, '5b4e19768aa744edac7eb6f7a794df4e');
INSERT INTO `manage_gen_attr` VALUES ('d03292eee03f4921a34b9a5d5f4a02a3', 'createTime', 'createTime', '创建时间', 'java.util.Date', '1', '1', '1', '0', 0, 'c79b93e1b5264121b0a78c1d203b362e');
INSERT INTO `manage_gen_attr` VALUES ('e11511ab07c149099fa25e72ca297d19', 'deal_type', 'dealType', '处理进度类型，U更新 A回复 C完成 ', 'String', '1', '1', '1', '0', 0, 'c79b93e1b5264121b0a78c1d203b362e');
INSERT INTO `manage_gen_attr` VALUES ('e616592654384e0a96b7748e704bcff0', 'createTime', 'createTime', '创建时间', 'java.util.Date', '1', '1', '1', '0', 0, '5b4e19768aa744edac7eb6f7a794df4e');
INSERT INTO `manage_gen_attr` VALUES ('f13e2eb84010461c9eecf06633faa6a2', 'aid', 'aid', '自增主键', 'Long', '1', '1', '1', '0', 0, '5b4e19768aa744edac7eb6f7a794df4e');

-- ----------------------------
-- Table structure for manage_gen_code
-- ----------------------------
DROP TABLE IF EXISTS `manage_gen_code`;
CREATE TABLE `manage_gen_code`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manage_gen_code
-- ----------------------------
INSERT INTO `manage_gen_code` VALUES ('24b0b996847942528f5a78c806ad2db9', 'com.ucsmy.ucas.manage', 'ManageConfig', 'sys/config', 'manage_config');
INSERT INTO `manage_gen_code` VALUES ('5b4e19768aa744edac7eb6f7a794df4e', 'manage', 'WorkOrder', 'sys/work', 'biz_work_order');
INSERT INTO `manage_gen_code` VALUES ('c79b93e1b5264121b0a78c1d203b362e', 'com.ucsmy.eaccount.manage', 'WorkOrderDetail', 'sys/work/detail', 'biz_work_order_detail');

-- ----------------------------
-- Table structure for manage_ip_schedule_task
-- ----------------------------
DROP TABLE IF EXISTS `manage_ip_schedule_task`;
CREATE TABLE `manage_ip_schedule_task`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `task_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称编码',
  `task_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名',
  `task_conf` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务执行表达式',
  `task_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务执行类',
  `task_server_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务执行的服务器',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '任务状态0:启用;1：禁用',
  `remark` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统运行调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_ip_schedule_task
-- ----------------------------
INSERT INTO `manage_ip_schedule_task` VALUES ('DEFAULT', 'DEFAULT', 'DEFAULT', '0/5 * * * * ?', 'com.ucsmy.ucas.config.quartz.scan.DefaultScanJob', '127.0.0.1', '1', 'DEFAULT');

-- ----------------------------
-- Table structure for manage_log_info
-- ----------------------------
DROP TABLE IF EXISTS `manage_log_info`;
CREATE TABLE `manage_log_info`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ip_address` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `log_level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志级别',
  `message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `user_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员名称',
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_log_info
-- ----------------------------

-- ----------------------------
-- Table structure for manage_menu
-- ----------------------------
DROP TABLE IF EXISTS `manage_menu`;
CREATE TABLE `manage_menu`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_menu
-- ----------------------------
INSERT INTO `manage_menu` VALUES ('00ca804b344e422a8b13ed29b6aa38d6', '密码修改', 'unlock', '/personal/updatePasswordPage', 'c6bf4fb3577c4a8b8603bf0840b98d95', 10, NULL);
INSERT INTO `manage_menu` VALUES ('062e011b73764d84b680072e8ceef059', '修改', NULL, NULL, '32c4a686c1984b7a99875e38a30d15c6', 3, 'sys_schedule_update');
INSERT INTO `manage_menu` VALUES ('169ec0dbb25a4226be60c1d9f2607c03', '删除', NULL, NULL, '32c4a686c1984b7a99875e38a30d15c6', 4, 'sys_schedule_delete');
INSERT INTO `manage_menu` VALUES ('1b16caa00b564127be74100b414e4b66', '菜单管理', 'appstore-o', '/sys/menu', '3cebad1606944d29b137fdb97b032bd5', 9, NULL);
INSERT INTO `manage_menu` VALUES ('1ed3e6e440b943aeb2abb60a3918ac38', '角色管理', 'team', '/sys/role', '3cebad1606944d29b137fdb97b032bd5', 8, NULL);
INSERT INTO `manage_menu` VALUES ('2490d124b960432eab79ebaef6b388b8', '用户下线', NULL, NULL, '39f61e75b9844f108b1b88bc8342c60c', 6, 'sys_user_shotOff');
INSERT INTO `manage_menu` VALUES ('24a7eadfcaf44529888068cb8c2c9b10', '主页', 'home', '/index', 'c6bf4fb3577c4a8b8603bf0840b98d95', 1, NULL);
INSERT INTO `manage_menu` VALUES ('2b9da713c9744fa2a3bdc892ce49291e', '新增', NULL, NULL, '4a1869a6b6e74303a28cbafe075a742a', 2, 'sys_res_save');
INSERT INTO `manage_menu` VALUES ('2df12ccf0e9849b6bfa914a87ef0dc89', '明细', NULL, NULL, '707bdf899f0345b69e4288c8c4f20b81', 6, 'sys_work_order_detail');
INSERT INTO `manage_menu` VALUES ('2fb6bf25c7e943e49dee3698ce5543e4', '修改', NULL, NULL, '39f61e75b9844f108b1b88bc8342c60c', 3, 'sys_user_update');
INSERT INTO `manage_menu` VALUES ('32c4a686c1984b7a99875e38a30d15c6', '定时任务', 'tool', '/sys/schedule', '3cebad1606944d29b137fdb97b032bd5', 25, NULL);
INSERT INTO `manage_menu` VALUES ('3764729b9d5c408fb8099836ab208a09', '新增', NULL, NULL, '707bdf899f0345b69e4288c8c4f20b81', 2, 'sys_work_order_add');
INSERT INTO `manage_menu` VALUES ('39f61e75b9844f108b1b88bc8342c60c', '用户管理', 'user', '/sys/user', '3cebad1606944d29b137fdb97b032bd5', 7, NULL);
INSERT INTO `manage_menu` VALUES ('3cebad1606944d29b137fdb97b032bd5', '系统管理', 'setting', '/sys', NULL, 100, NULL);
INSERT INTO `manage_menu` VALUES ('418c0c56bfb6407a963ffcdb7bfb1301', '代码生成', 'printer', '/sys/gen', '3cebad1606944d29b137fdb97b032bd5', 999, 'sys_gen');
INSERT INTO `manage_menu` VALUES ('4794b2418fe84f4b892e131352315352', '列表', NULL, NULL, '39f61e75b9844f108b1b88bc8342c60c', 1, 'sys_user_list');
INSERT INTO `manage_menu` VALUES ('47c592d4e5cb4819b9a5947f923b183b', '列表', NULL, NULL, '4a1869a6b6e74303a28cbafe075a742a', 1, 'sys_res_list');
INSERT INTO `manage_menu` VALUES ('4a1869a6b6e74303a28cbafe075a742a', '资源管理', 'file', '/sys/resources', '3cebad1606944d29b137fdb97b032bd5', 10, NULL);
INSERT INTO `manage_menu` VALUES ('5a617ea94d274340878551487c8181b9', '查看资源', NULL, NULL, '1b16caa00b564127be74100b414e4b66', 6, 'sys_menu_queryRes');
INSERT INTO `manage_menu` VALUES ('5b590cb7206b4929acef947495431623', '新增', NULL, NULL, '1ed3e6e440b943aeb2abb60a3918ac38', 2, 'sys_role_save');
INSERT INTO `manage_menu` VALUES ('5e0e1e92ae2c4197ae18df6dd3853fde', '删除', NULL, NULL, '8044eaa825d24476815967de374269a6', 4, 'sys_config_delete');
INSERT INTO `manage_menu` VALUES ('5e96b0977aab426899f71abce4646d1b', '修改资源', NULL, NULL, '1b16caa00b564127be74100b414e4b66', 5, 'sys_menu_updateRes');
INSERT INTO `manage_menu` VALUES ('62f73b469b124d048235951c226c586d', '修改权限', NULL, NULL, '1ed3e6e440b943aeb2abb60a3918ac38', 5, 'sys_role_updateMenu');
INSERT INTO `manage_menu` VALUES ('64017011fcd64bf0930344ce43bb036c', '列表', NULL, NULL, '1ed3e6e440b943aeb2abb60a3918ac38', 1, 'sys_role_list');
INSERT INTO `manage_menu` VALUES ('648947b7ff41476d986e0fe9fb16f44b', '删除', NULL, NULL, '1ed3e6e440b943aeb2abb60a3918ac38', 4, 'sys_role_delete');
INSERT INTO `manage_menu` VALUES ('68c560db66f8490e98a99411af9a66eb', '修改', NULL, NULL, '1b16caa00b564127be74100b414e4b66', 3, 'sys_menu_update');
INSERT INTO `manage_menu` VALUES ('707bdf899f0345b69e4288c8c4f20b81', '工单管理', 'TagOutlined', '/sys/work', '3cebad1606944d29b137fdb97b032bd5', 30, NULL);
INSERT INTO `manage_menu` VALUES ('71bcf9713a9e4c67b4b136816db5be48', '新增', NULL, NULL, '39f61e75b9844f108b1b88bc8342c60c', 2, 'sys_user_save');
INSERT INTO `manage_menu` VALUES ('73798cee46784a8a82b54c196f5eb671', '删除', NULL, NULL, '4a1869a6b6e74303a28cbafe075a742a', 4, 'sys_res_delete');
INSERT INTO `manage_menu` VALUES ('743fe1b276e84dbda943ec8f6bf1f246', '修改密码', NULL, NULL, '39f61e75b9844f108b1b88bc8342c60c', 5, 'sys_user_updatePwd');
INSERT INTO `manage_menu` VALUES ('7d3e170d207c4039a4f6e750d6769685', '新增', NULL, NULL, '1b16caa00b564127be74100b414e4b66', 2, 'sys_menu_save');
INSERT INTO `manage_menu` VALUES ('8044eaa825d24476815967de374269a6', '参数管理', 'file-ppt', '/sys/config', '3cebad1606944d29b137fdb97b032bd5', 15, NULL);
INSERT INTO `manage_menu` VALUES ('840005766a744ff4baf90bb3cbb1acb5', '修改', NULL, NULL, '8044eaa825d24476815967de374269a6', 3, 'sys_config_update');
INSERT INTO `manage_menu` VALUES ('86f30bac074145b2acb56e4c3d25f072', '列表', NULL, NULL, '1b16caa00b564127be74100b414e4b66', 1, 'sys_menu_list');
INSERT INTO `manage_menu` VALUES ('96fb9f435f5645f28a316e58e07de13b', '删除', NULL, NULL, 'd84b71f21b724d639b39852962f02b14', 4, 'sys_org_delete');
INSERT INTO `manage_menu` VALUES ('980f633e7d9c47dda327f04859cbf7eb', '修改', NULL, NULL, '1ed3e6e440b943aeb2abb60a3918ac38', 3, 'sys_role_update');
INSERT INTO `manage_menu` VALUES ('9a5738d19a73476fb6d398ede9d2615b', '新增', NULL, NULL, '32c4a686c1984b7a99875e38a30d15c6', 2, 'sys_schedule_save');
INSERT INTO `manage_menu` VALUES ('9b0fbeb5382e4b6eb5b90d57e2d4dec3', '删除', NULL, NULL, '39f61e75b9844f108b1b88bc8342c60c', 4, 'sys_user_delete');
INSERT INTO `manage_menu` VALUES ('9b754ad3dec74f528187272736edb970', '确认', NULL, NULL, '707bdf899f0345b69e4288c8c4f20b81', 7, 'sys_work_order_confirm');
INSERT INTO `manage_menu` VALUES ('9ba4f09559a2481fac041bfd2d741092', '查看权限', NULL, NULL, '1ed3e6e440b943aeb2abb60a3918ac38', 6, 'sys_role_queryMenu');
INSERT INTO `manage_menu` VALUES ('a734d9fc485649b588ae24a34fe269ff', '个人信息', 'user', '/personal/userInfo', 'c6bf4fb3577c4a8b8603bf0840b98d95', 5, NULL);
INSERT INTO `manage_menu` VALUES ('af845523f100469cae8fc9c8383b19fe', '新增', NULL, NULL, '8044eaa825d24476815967de374269a6', 2, 'sys_config_save');
INSERT INTO `manage_menu` VALUES ('afb1154d42964745a08e37bac16b5571', '新增', NULL, NULL, 'd84b71f21b724d639b39852962f02b14', 2, 'sys_org_save');
INSERT INTO `manage_menu` VALUES ('b530ecb6d5df4df7a3f890f21254f755', '列表', NULL, NULL, '707bdf899f0345b69e4288c8c4f20b81', 1, 'sys_work_order_list');
INSERT INTO `manage_menu` VALUES ('b69a9ad0c839433d8a36bb42a5f3fdd5', '列表', NULL, NULL, 'd84b71f21b724d639b39852962f02b14', 1, 'sys_org_list');
INSERT INTO `manage_menu` VALUES ('c6bf4fb3577c4a8b8603bf0840b98d95', '个人中心', 'home', '/personal', NULL, 1, NULL);
INSERT INTO `manage_menu` VALUES ('c7f08cfe9bed459997b5aed159dddda7', '列表', NULL, NULL, '32c4a686c1984b7a99875e38a30d15c6', 1, 'sys_schedule_list');
INSERT INTO `manage_menu` VALUES ('c877b95f385942d28b65ecab4f587dd8', '修改', NULL, NULL, '707bdf899f0345b69e4288c8c4f20b81', 3, 'sys_work_order_modify');
INSERT INTO `manage_menu` VALUES ('d84b71f21b724d639b39852962f02b14', '组织管理', 'flag', '/sys/organization', '3cebad1606944d29b137fdb97b032bd5', 20, NULL);
INSERT INTO `manage_menu` VALUES ('de45d34fb96c498da20376f02880b7df', '修改', NULL, NULL, 'd84b71f21b724d639b39852962f02b14', 3, 'sys_org_update');
INSERT INTO `manage_menu` VALUES ('dfe12ec3405f4b318aa251634ab8287d', '删除', NULL, NULL, '707bdf899f0345b69e4288c8c4f20b81', 4, 'sys_work_order_delete');
INSERT INTO `manage_menu` VALUES ('e1582ee102bb4ae99dae430ae1e47ec5', '删除', NULL, NULL, '1b16caa00b564127be74100b414e4b66', 4, 'sys_menu_delete');
INSERT INTO `manage_menu` VALUES ('f1085e3c7f41406e987049d2e55ac0a2', '分配', NULL, NULL, '707bdf899f0345b69e4288c8c4f20b81', 5, 'sys_work_order_distribution');
INSERT INTO `manage_menu` VALUES ('fb12b6d9454b42e293d726ef5c1aa5c9', '列表', NULL, NULL, '8044eaa825d24476815967de374269a6', 1, 'sys_config_list');
INSERT INTO `manage_menu` VALUES ('fd237a7d03aa46b09ff8728638b2215a', '修改', NULL, NULL, '4a1869a6b6e74303a28cbafe075a742a', 3, 'sys_res_update');

-- ----------------------------
-- Table structure for manage_menu_resources
-- ----------------------------
DROP TABLE IF EXISTS `manage_menu_resources`;
CREATE TABLE `manage_menu_resources`  (
  `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resources_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_menu_resources
-- ----------------------------
INSERT INTO `manage_menu_resources` VALUES ('a734d9fc485649b588ae24a34fe269ff', 'd1996765d70d40aab5721b70aa817fb3');
INSERT INTO `manage_menu_resources` VALUES ('a734d9fc485649b588ae24a34fe269ff', 'a1d2206781aa469e9bba12e2b1e5edb2');
INSERT INTO `manage_menu_resources` VALUES ('00ca804b344e422a8b13ed29b6aa38d6', '4b47f11dddc7411a9c700bf0353f9ea6');
INSERT INTO `manage_menu_resources` VALUES ('4794b2418fe84f4b892e131352315352', 'ced191f189464b86b1e877591dfcc884');
INSERT INTO `manage_menu_resources` VALUES ('71bcf9713a9e4c67b4b136816db5be48', 'aa7d6ee5e3634a9f97864b53d2f653d5');
INSERT INTO `manage_menu_resources` VALUES ('71bcf9713a9e4c67b4b136816db5be48', '7215b5ef172f41ccb4616a38e8b6f555');
INSERT INTO `manage_menu_resources` VALUES ('71bcf9713a9e4c67b4b136816db5be48', '1fe3b9a250a249988b491fa396c21ca2');
INSERT INTO `manage_menu_resources` VALUES ('2fb6bf25c7e943e49dee3698ce5543e4', '421abd7bc9764546893d59e329e8307d');
INSERT INTO `manage_menu_resources` VALUES ('2fb6bf25c7e943e49dee3698ce5543e4', '04045a7f3bda445d96cee628bfd1acbb');
INSERT INTO `manage_menu_resources` VALUES ('2fb6bf25c7e943e49dee3698ce5543e4', '1fe3b9a250a249988b491fa396c21ca2');
INSERT INTO `manage_menu_resources` VALUES ('2fb6bf25c7e943e49dee3698ce5543e4', 'aa7d6ee5e3634a9f97864b53d2f653d5');
INSERT INTO `manage_menu_resources` VALUES ('9b0fbeb5382e4b6eb5b90d57e2d4dec3', 'da5d2f19d5f44d3c8a393ec632e15e9a');
INSERT INTO `manage_menu_resources` VALUES ('743fe1b276e84dbda943ec8f6bf1f246', 'b956b8699fae4489a6d896be7be876e3');
INSERT INTO `manage_menu_resources` VALUES ('2490d124b960432eab79ebaef6b388b8', '187bbc928e2945b9a4d3e5315c4efc66');
INSERT INTO `manage_menu_resources` VALUES ('64017011fcd64bf0930344ce43bb036c', '707c5d0eed604e3a9b1ce595a30b41d6');
INSERT INTO `manage_menu_resources` VALUES ('5b590cb7206b4929acef947495431623', '0cf035f3d5ba4307b4652a5c8d3b9b03');
INSERT INTO `manage_menu_resources` VALUES ('980f633e7d9c47dda327f04859cbf7eb', 'e330a4cace8d4385886ee37a21be20de');
INSERT INTO `manage_menu_resources` VALUES ('648947b7ff41476d986e0fe9fb16f44b', '84c8fc4b849c447ab05b3e07ce8b9cf3');
INSERT INTO `manage_menu_resources` VALUES ('62f73b469b124d048235951c226c586d', '68ad0b1c0215452895f5649349161c37');
INSERT INTO `manage_menu_resources` VALUES ('62f73b469b124d048235951c226c586d', '3da6ce52af6445c1b74a7192fbbf518a');
INSERT INTO `manage_menu_resources` VALUES ('7d3e170d207c4039a4f6e750d6769685', '7006f50540884c959b12cad18353f5fd');
INSERT INTO `manage_menu_resources` VALUES ('86f30bac074145b2acb56e4c3d25f072', 'deb7cdede8a648cf9a865623af94a1bb');
INSERT INTO `manage_menu_resources` VALUES ('68c560db66f8490e98a99411af9a66eb', '8b79ec538bd64b8fb11e33c83e0bc65e');
INSERT INTO `manage_menu_resources` VALUES ('e1582ee102bb4ae99dae430ae1e47ec5', '45b71973ae8e4cea855ef8f0ca2e3fe8');
INSERT INTO `manage_menu_resources` VALUES ('5e96b0977aab426899f71abce4646d1b', 'cdd1a6ddb3094fa4901f534bd15f87b7');
INSERT INTO `manage_menu_resources` VALUES ('5e96b0977aab426899f71abce4646d1b', 'ba295376f7af45c2a0a4d75cbb813652');
INSERT INTO `manage_menu_resources` VALUES ('47c592d4e5cb4819b9a5947f923b183b', '46c17a8ee5b941e78218b4136b192e5d');
INSERT INTO `manage_menu_resources` VALUES ('2b9da713c9744fa2a3bdc892ce49291e', '46c17a8ee5b941e78218b4136b192e5b');
INSERT INTO `manage_menu_resources` VALUES ('fd237a7d03aa46b09ff8728638b2215a', '8d8f5b6e18894c4c90159094e8570cc4');
INSERT INTO `manage_menu_resources` VALUES ('73798cee46784a8a82b54c196f5eb671', '3605f26e41ea47168c3c063760e4a260');
INSERT INTO `manage_menu_resources` VALUES ('fb12b6d9454b42e293d726ef5c1aa5c9', 'ccb711d3a3464542bacc87ee56114d7c');
INSERT INTO `manage_menu_resources` VALUES ('af845523f100469cae8fc9c8383b19fe', '35e32578e657482dbe42de8a9d949e3d');
INSERT INTO `manage_menu_resources` VALUES ('840005766a744ff4baf90bb3cbb1acb5', '0cde9972a1c34247b56937862554207b');
INSERT INTO `manage_menu_resources` VALUES ('840005766a744ff4baf90bb3cbb1acb5', '8a42f16212414738b68d2e0bfc5f3110');
INSERT INTO `manage_menu_resources` VALUES ('5e0e1e92ae2c4197ae18df6dd3853fde', 'df65550795284fd3a5337d33dd12e613');
INSERT INTO `manage_menu_resources` VALUES ('b69a9ad0c839433d8a36bb42a5f3fdd5', '51bae97db8ff4290b6fec898364d2602');
INSERT INTO `manage_menu_resources` VALUES ('afb1154d42964745a08e37bac16b5571', 'e5e4a8496be34d2eb21c522f85e69572');
INSERT INTO `manage_menu_resources` VALUES ('de45d34fb96c498da20376f02880b7df', 'de6d2aa000c34c18a64caad082c8318f');
INSERT INTO `manage_menu_resources` VALUES ('96fb9f435f5645f28a316e58e07de13b', '937b5ef92cde4fc4a8a958bda62a7f05');
INSERT INTO `manage_menu_resources` VALUES ('062e011b73764d84b680072e8ceef059', '664e2a649448485ea6467ab6178e5ea5');
INSERT INTO `manage_menu_resources` VALUES ('062e011b73764d84b680072e8ceef059', '86418436c6e845a98c1e304b4d309a66');
INSERT INTO `manage_menu_resources` VALUES ('c7f08cfe9bed459997b5aed159dddda7', '89300ad86be146aeb4993d0e8299f2ce');
INSERT INTO `manage_menu_resources` VALUES ('9a5738d19a73476fb6d398ede9d2615b', '32b5320a52fc40cb943ea748dd4cd447');
INSERT INTO `manage_menu_resources` VALUES ('169ec0dbb25a4226be60c1d9f2607c03', 'ff3d53b8273a40f188dd59b918cfbe8a');
INSERT INTO `manage_menu_resources` VALUES ('9ba4f09559a2481fac041bfd2d741092', '3da6ce52af6445c1b74a7192fbbf518a');
INSERT INTO `manage_menu_resources` VALUES ('5a617ea94d274340878551487c8181b9', 'ba295376f7af45c2a0a4d75cbb813652');
INSERT INTO `manage_menu_resources` VALUES ('418c0c56bfb6407a963ffcdb7bfb1301', 'ee006228f02b4b968123e2afc1a61b0a');
INSERT INTO `manage_menu_resources` VALUES ('418c0c56bfb6407a963ffcdb7bfb1301', 'c23965bdbbe44ccba80fe9afd2580fd8');
INSERT INTO `manage_menu_resources` VALUES ('418c0c56bfb6407a963ffcdb7bfb1301', 'd17e4eda02ae4081983639fe9a816423');
INSERT INTO `manage_menu_resources` VALUES ('418c0c56bfb6407a963ffcdb7bfb1301', '3b99ab6679344c9fb92c2e7e3799278d');
INSERT INTO `manage_menu_resources` VALUES ('418c0c56bfb6407a963ffcdb7bfb1301', '44784a81d33b4dd3aa126113d815d1d5');

-- ----------------------------
-- Table structure for manage_organization
-- ----------------------------
DROP TABLE IF EXISTS `manage_organization`;
CREATE TABLE `manage_organization`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '机构唯一标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `weight` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `pid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父机构id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_organization
-- ----------------------------

-- ----------------------------
-- Table structure for manage_resources
-- ----------------------------
DROP TABLE IF EXISTS `manage_resources`;
CREATE TABLE `manage_resources`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_resources
-- ----------------------------
INSERT INTO `manage_resources` VALUES ('04045a7f3bda445d96cee628bfd1acbb', '系统用户', '修改状态', '/sys/user/updateStatus/*');
INSERT INTO `manage_resources` VALUES ('0cde9972a1c34247b56937862554207b', '系统参数', '修改', '/sys/config/update*');
INSERT INTO `manage_resources` VALUES ('0cf035f3d5ba4307b4652a5c8d3b9b03', '系统角色', '新增', '/sys/role/save*');
INSERT INTO `manage_resources` VALUES ('187bbc928e2945b9a4d3e5315c4efc66', '系统用户', '用户下线', '/sys/user/shotOff*');
INSERT INTO `manage_resources` VALUES ('1fe3b9a250a249988b491fa396c21ca2', '系统组织', '查询所有', '/sys/organization/listAll*');
INSERT INTO `manage_resources` VALUES ('32b5320a52fc40cb943ea748dd4cd447', '系统定时任务', '新增', '/sys/schedule/save*');
INSERT INTO `manage_resources` VALUES ('35e32578e657482dbe42de8a9d949e3d', '系统参数', '新增', '/sys/config/save*');
INSERT INTO `manage_resources` VALUES ('3605f26e41ea47168c3c063760e4a260', '系统资源', '删除', '/sys/resources/delete*');
INSERT INTO `manage_resources` VALUES ('3b99ab6679344c9fb92c2e7e3799278d', '系统代码生成', '新增', '/sys/gen/save*');
INSERT INTO `manage_resources` VALUES ('3da6ce52af6445c1b74a7192fbbf518a', '系统菜单', '根据角色ID获取菜单', '/sys/menu/getRoleMenu/*');
INSERT INTO `manage_resources` VALUES ('421abd7bc9764546893d59e329e8307d', '系统用户', '修改', '/sys/user/update*');
INSERT INTO `manage_resources` VALUES ('44784a81d33b4dd3aa126113d815d1d5', '系统代码生成', '获取所有数据库表', '/sys/gen/getAllTables*');
INSERT INTO `manage_resources` VALUES ('45b71973ae8e4cea855ef8f0ca2e3fe8', '系统菜单', '删除', '/sys/menu/delete*');
INSERT INTO `manage_resources` VALUES ('46c17a8ee5b941e78218b4136b192e5b', '系统资源', '新增', '/sys/resources/save*');
INSERT INTO `manage_resources` VALUES ('46c17a8ee5b941e78218b4136b192e5d', '系统资源', '列表', '/sys/resources/list*');
INSERT INTO `manage_resources` VALUES ('4b47f11dddc7411a9c700bf0353f9ea6', '个人中心', '修改密码', '/personal/updatePassword*');
INSERT INTO `manage_resources` VALUES ('51bae97db8ff4290b6fec898364d2602', '系统组织', '列表', '/sys/organization/list*');
INSERT INTO `manage_resources` VALUES ('664e2a649448485ea6467ab6178e5ea5', '系统定时任务', '修改', '/sys/schedule/update*');
INSERT INTO `manage_resources` VALUES ('68ad0b1c0215452895f5649349161c37', '系统角色', '修改角色权限', '/sys/role/updateMenu*');
INSERT INTO `manage_resources` VALUES ('7006f50540884c959b12cad18353f5fd', '系统菜单', '新增', '/sys/menu/save*');
INSERT INTO `manage_resources` VALUES ('707c5d0eed604e3a9b1ce595a30b41d6', '系统角色', '列表', '/sys/role/list*');
INSERT INTO `manage_resources` VALUES ('7215b5ef172f41ccb4616a38e8b6f555', '系统用户', '新增', '/sys/user/save*');
INSERT INTO `manage_resources` VALUES ('84c8fc4b849c447ab05b3e07ce8b9cf3', '系统角色', '删除', '/sys/role/delete*');
INSERT INTO `manage_resources` VALUES ('86418436c6e845a98c1e304b4d309a66', '系统定时任务', '修改状态', '/sys/schedule/updateStatus/*');
INSERT INTO `manage_resources` VALUES ('89300ad86be146aeb4993d0e8299f2ce', '系统定时任务', '列表', '/sys/schedule/list*');
INSERT INTO `manage_resources` VALUES ('8a42f16212414738b68d2e0bfc5f3110', '系统参数', '修改状态', '/sys/config/updateStatus/*');
INSERT INTO `manage_resources` VALUES ('8b79ec538bd64b8fb11e33c83e0bc65e', '系统菜单', '修改', '/sys/menu/update*');
INSERT INTO `manage_resources` VALUES ('8d8f5b6e18894c4c90159094e8570cc4', '系统资源', '修改', '/sys/resources/update*');
INSERT INTO `manage_resources` VALUES ('937b5ef92cde4fc4a8a958bda62a7f05', '系统组织', '删除', '/sys/organization/delete*');
INSERT INTO `manage_resources` VALUES ('a1d2206781aa469e9bba12e2b1e5edb2', '个人中心', '修改个人信息', '/personal/updateUserInfo*');
INSERT INTO `manage_resources` VALUES ('aa7d6ee5e3634a9f97864b53d2f653d5', '系统角色', '查询所有角色', '/sys/role/listAll*');
INSERT INTO `manage_resources` VALUES ('b956b8699fae4489a6d896be7be876e3', '系统用户', '修改密码', '/sys/user/updatePassword*');
INSERT INTO `manage_resources` VALUES ('ba295376f7af45c2a0a4d75cbb813652', '系统资源', '根据菜单ID获取资源', '/sys/resources/list/getByMenuId/*');
INSERT INTO `manage_resources` VALUES ('c23965bdbbe44ccba80fe9afd2580fd8', '系统代码生成', '列表', '/sys/gen/list*');
INSERT INTO `manage_resources` VALUES ('ccb711d3a3464542bacc87ee56114d7c', '系统参数', '列表', '/sys/config/list*');
INSERT INTO `manage_resources` VALUES ('cdd1a6ddb3094fa4901f534bd15f87b7', '系统菜单', '修改菜单资源', '/sys/menu/updateResources*');
INSERT INTO `manage_resources` VALUES ('ced191f189464b86b1e877591dfcc884', '系统用户', '列表', '/sys/user/list*');
INSERT INTO `manage_resources` VALUES ('d17e4eda02ae4081983639fe9a816423', '系统代码生成', '删除', '/sys/gen/delete*');
INSERT INTO `manage_resources` VALUES ('d1996765d70d40aab5721b70aa817fb3', '个人中心', '个人信息查询', '/personal/getUserInfo*');
INSERT INTO `manage_resources` VALUES ('da5d2f19d5f44d3c8a393ec632e15e9a', '系统用户', '删除', '/sys/user/delete*');
INSERT INTO `manage_resources` VALUES ('de6d2aa000c34c18a64caad082c8318f', '系统组织', '修改', '/sys/organization/update*');
INSERT INTO `manage_resources` VALUES ('deb7cdede8a648cf9a865623af94a1bb', '系统菜单', '列表', '/sys/menu/list*');
INSERT INTO `manage_resources` VALUES ('df65550795284fd3a5337d33dd12e613', '系统参数', '删除', '/sys/config/delete*');
INSERT INTO `manage_resources` VALUES ('e330a4cace8d4385886ee37a21be20de', '系统角色', '修改', '/sys/role/update*');
INSERT INTO `manage_resources` VALUES ('e5e4a8496be34d2eb21c522f85e69572', '系统组织', '新增', '/sys/organization/save*');
INSERT INTO `manage_resources` VALUES ('ee006228f02b4b968123e2afc1a61b0a', '系统代码生成', '修改', '/sys/gen/update*');
INSERT INTO `manage_resources` VALUES ('ff3d53b8273a40f188dd59b918cfbe8a', '系统定时任务', '删除', '/sys/schedule/delete*');

-- ----------------------------
-- Table structure for manage_role
-- ----------------------------
DROP TABLE IF EXISTS `manage_role`;
CREATE TABLE `manage_role`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色唯一标识',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `level` int(1) NOT NULL COMMENT '等级，0超管1员工2消费者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_role
-- ----------------------------
INSERT INTO `manage_role` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '超级管理', '超级管理员', 0);
INSERT INTO `manage_role` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', '员工', '员工', 1);
INSERT INTO `manage_role` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', '消费者', '消费者', 2);

-- ----------------------------
-- Table structure for manage_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `manage_role_menu`;
CREATE TABLE `manage_role_menu`  (
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_role_menu
-- ----------------------------
INSERT INTO `manage_role_menu` VALUES ('2c9182fd5aa690f1015aa6c251840001', '4a1869a6b6e74303a28cbafe075a742a');
INSERT INTO `manage_role_menu` VALUES ('2c9182fd5aa690f1015aa6c251840001', '3cebad1606944d29b137fdb97b032bd5');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', 'c6bf4fb3577c4a8b8603bf0840b98d95');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', 'a734d9fc485649b588ae24a34fe269ff');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', '00ca804b344e422a8b13ed29b6aa38d6');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', '3cebad1606944d29b137fdb97b032bd5');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', '707bdf899f0345b69e4288c8c4f20b81');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', 'b530ecb6d5df4df7a3f890f21254f755');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', '2df12ccf0e9849b6bfa914a87ef0dc89');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f0', '9b754ad3dec74f528187272736edb970');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', 'c6bf4fb3577c4a8b8603bf0840b98d95');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', 'a734d9fc485649b588ae24a34fe269ff');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', '00ca804b344e422a8b13ed29b6aa38d6');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', '3cebad1606944d29b137fdb97b032bd5');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', '707bdf899f0345b69e4288c8c4f20b81');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', 'b530ecb6d5df4df7a3f890f21254f755');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', '3764729b9d5c408fb8099836ab208a09');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', 'dfe12ec3405f4b318aa251634ab8287d');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', '2df12ccf0e9849b6bfa914a87ef0dc89');
INSERT INTO `manage_role_menu` VALUES ('35f7ff6a9f604c878de16f9cc22799f1', 'c877b95f385942d28b65ecab4f587dd8');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', 'c6bf4fb3577c4a8b8603bf0840b98d95');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '24a7eadfcaf44529888068cb8c2c9b10');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', 'a734d9fc485649b588ae24a34fe269ff');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '00ca804b344e422a8b13ed29b6aa38d6');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '3cebad1606944d29b137fdb97b032bd5');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '39f61e75b9844f108b1b88bc8342c60c');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '4794b2418fe84f4b892e131352315352');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '71bcf9713a9e4c67b4b136816db5be48');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '2fb6bf25c7e943e49dee3698ce5543e4');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '9b0fbeb5382e4b6eb5b90d57e2d4dec3');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '743fe1b276e84dbda943ec8f6bf1f246');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '2490d124b960432eab79ebaef6b388b8');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '1ed3e6e440b943aeb2abb60a3918ac38');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '64017011fcd64bf0930344ce43bb036c');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '5b590cb7206b4929acef947495431623');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '980f633e7d9c47dda327f04859cbf7eb');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '648947b7ff41476d986e0fe9fb16f44b');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '62f73b469b124d048235951c226c586d');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '9ba4f09559a2481fac041bfd2d741092');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '1b16caa00b564127be74100b414e4b66');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '86f30bac074145b2acb56e4c3d25f072');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '7d3e170d207c4039a4f6e750d6769685');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '68c560db66f8490e98a99411af9a66eb');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', 'e1582ee102bb4ae99dae430ae1e47ec5');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '5e96b0977aab426899f71abce4646d1b');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '5a617ea94d274340878551487c8181b9');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', '707bdf899f0345b69e4288c8c4f20b81');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', 'b530ecb6d5df4df7a3f890f21254f755');
INSERT INTO `manage_role_menu` VALUES ('2c9182d45a1c3f70015a1c3f70890000', 'f1085e3c7f41406e987049d2e55ac0a2');

-- ----------------------------
-- Table structure for manage_user_account
-- ----------------------------
DROP TABLE IF EXISTS `manage_user_account`;
CREATE TABLE `manage_user_account`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密盐值',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '0:正常;  1：停用',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobilephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `mobilephone`(`mobilephone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_user_account
-- ----------------------------
INSERT INTO `manage_user_account` VALUES ('4028abb3-79126e0b-0179-1275f4f2-0001', '2021-04-27 16:33:10', '8013869140b9d521cbfb043fbf2fb6c0', 'I5ykI1', 0, 'xiaofei', NULL, NULL, '35f7ff6a9f604c878de16f9cc22799f1');
INSERT INTO `manage_user_account` VALUES ('7ebbb432-fbf8-44d2-8fad-e9faddae970c', '2017-03-09 11:28:06', '4f7a7701e9665e2b3fd2f3d30a90caa0', 'zXZCKn', 0, 'admin', '13763340378@qq.com', '13763340378', '2c9182d45a1c3f70015a1c3f70890000');
INSERT INTO `manage_user_account` VALUES ('8ae9a4f8ed3c4340b189443717535f9c', '2021-04-27 16:35:00', 'a3ae3bae74c8bc5203df60bf7a8b7354', 'WNZL05', 0, 'yg1', NULL, NULL, '35f7ff6a9f604c878de16f9cc22799f0');

-- ----------------------------
-- Table structure for manage_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `manage_user_profile`;
CREATE TABLE `manage_user_profile`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人介绍',
  `telephone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作电话',
  `mobilephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `gender` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '性别',
  `starff_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工号',
  `position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'import' COMMENT '用户类型，import,ldap，register',
  `org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户资料表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manage_user_profile
-- ----------------------------
INSERT INTO `manage_user_profile` VALUES ('4028abb3-79126e0b-0179-1275f4f2-0001', '消费者一', NULL, NULL, NULL, '2021-04-27 16:33:10', '2021-04-27 16:33:33', NULL, NULL, '1', NULL, NULL, 'import', NULL);
INSERT INTO `manage_user_profile` VALUES ('7ebbb432-fbf8-44d2-8fad-e9faddae970c', '姓名', NULL, NULL, NULL, '2021-04-27 15:59:25', '2021-04-27 16:21:28', NULL, NULL, '1', NULL, NULL, 'import', NULL);
INSERT INTO `manage_user_profile` VALUES ('8ae9a4f8ed3c4340b189443717535f9c', '员工一号', NULL, NULL, NULL, '2021-04-27 16:35:00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

use vuln_demo;

-- CNNVD漏洞表
drop table IF exists `vu_cnnvd`;
CREATE TABLE `vu_cnnvd` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `code` varchar(64) NOT NULL DEFAULT '' COMMENT '编号',
    `name` varchar(512) NOT NULL DEFAULT '' COMMENT '名称',
    `type` varchar(512) NOT NULL DEFAULT '' COMMENT '类型',
    `remark` longtext DEFAULT NULL COMMENT '描述',
    `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '级别 1-低危 2-中危 3-高危 4-超危',
    `repair_methods` longtext DEFAULT NULL COMMENT '修复方式',
    `affect_product` longtext DEFAULT NULL COMMENT '影响产品',
    `cve_code` varchar(64) NOT NULL DEFAULT '' COMMENT 'CVE编号',
    `publish_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '发布时间',
    `modify_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
    `created_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
    `updated_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
    `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
    `updater_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人ID',
    `creator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
    `updater_name` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人名称',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_code` (`code`),
    KEY `idx_name`(`name`),
    KEY `idx_updated_time`(`updated_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='CNNVD漏洞表';


-- CVE漏洞表
drop table IF exists `vu_cve`;
CREATE TABLE `vu_cve` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `code` varchar(64) NOT NULL DEFAULT '' COMMENT '编号',
    `name` varchar(512) NOT NULL DEFAULT '' COMMENT '名称',
    `remark` json DEFAULT NULL COMMENT '描述,json字符数组',
    `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '级别 1-低危 2-中危 3-高危 4-超危',
    `score` varchar(32) NOT NULL DEFAULT '' COMMENT '评分',
    `repair_methods` json DEFAULT NULL COMMENT '修复方式,json字符数组',
    `affect_range` json DEFAULT NULL COMMENT '影响范围,包含产品、平台、版本,json对象数组',
    `state` varchar(64) NOT NULL DEFAULT '' COMMENT '状态',
    `publish_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '发布时间',
    `modify_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
    `created_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
    `updated_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
    `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
    `updater_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人ID',
    `creator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
    `updater_name` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人名称',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_code` (`code`),
    KEY `idx_name`(`name`),
    KEY `idx_updated_time`(`updated_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='CVE漏洞表';


-- 自定义表
drop table IF exists `vu_custom`;
CREATE TABLE `vu_custom` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '编号',
  `name` varchar(512) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` longtext DEFAULT NULL COMMENT '描述',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '级别 1-低危 2-中危 3-高危 4-超危',
  `score` varchar(32) NOT NULL DEFAULT '' COMMENT '评分',
  `type` varchar(512) NOT NULL DEFAULT '' COMMENT '类型',
  `affect_platform` longtext DEFAULT NULL COMMENT '影响平台',
  `affect_product` longtext DEFAULT NULL COMMENT '影响产品',
  `affect_version` longtext DEFAULT NULL COMMENT '影响版本',
  `repair_methods` longtext DEFAULT NULL COMMENT '修复方式',
  `other_code` varchar(64) NOT NULL DEFAULT '' COMMENT '其他编号',
  `publish_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `modify_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `updater_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人ID',
  `creator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `updater_name` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_code` (`code`),
  KEY `idx_name`(`name`),
  KEY `idx_updated_time`(`updated_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自定义表';



-- 用户表
drop table IF exists `sys_user`;
CREATE TABLE `sys_user` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户姓名',
    `account` varchar(64) NOT NULL DEFAULT '' COMMENT '登录账号',
    `password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码',
    `role_code` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编码',
    `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态  0:禁用  1:正常',
    `need_update_pwd` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要修改密码  0:不需要  1:需要',
    `created_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
    `updated_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
    `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
    `updater_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人ID',
    `creator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
    `updater_name` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人名称',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=900 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

INSERT INTO sys_user (id,name,account,password,role_code,status,need_update_pwd,created_time,updated_time,creator_id,updater_id,creator_name,updater_name)
VALUES
    (1, '系统管理员','admin','1adbb3178591fd5bb0c248518f39bf6d','admin',1,0,1729423150000,1729423150000,1,1,'admin','admin'),
    (900, '普通用户','user','1adbb3178591fd5bb0c248518f39bf6d','user',1,0,1733545070000,1733545070000,1,1,'admin','admin');


drop table IF exists `sys_role`;
CREATE TABLE `sys_role` (
        `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
        `code` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编码',
        `name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
        `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0:禁用 1:正常',
        `created_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
        `updated_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
        `creator_id` bigint NOT NULL DEFAULT '0' COMMENT '创建人ID',
        `updater_id` bigint NOT NULL DEFAULT '0' COMMENT '更新人ID',
        `creator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
        `updater_name` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人名称',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uniq_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=900 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

INSERT INTO `sys_role` (`id`, `code`, `name`, `status`, `created_time`, `updated_time`, `creator_id`, `updater_id`, `creator_name`, `updater_name`)
VALUES
    (1, 'admin', '系统管理员',  1, 1729916943000, 1729916943000, 1, 1, 'admin', 'admin'),
    (2, 'user', '普通用户', 1, 1729916943000, 1729916943000, 1, 1, 'admin', 'admin');


-- 资源表
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-目录 1-菜单 2-接口',
    `code` varchar(256) NOT NULL DEFAULT '' COMMENT '编码',
    `uri` varchar(256) NOT NULL DEFAULT '' COMMENT '链接',
    `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
    `parent_code` varchar(256) DEFAULT NULL COMMENT '父级编码',
    `weight` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
    `extra` text DEFAULT NULL COMMENT '扩展配置',
    `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0:禁用 1:正常',
    `created_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
    `updated_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
    `creator_id` bigint NOT NULL DEFAULT '0' COMMENT '创建人ID',
    `updater_id` bigint NOT NULL DEFAULT '0' COMMENT '更新人ID',
    `creator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
    `updater_name` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人名称',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_type_code` ( `type`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

INSERT INTO `sys_resource` (`id`, `type`, `code`, `uri`, `name`, `parent_code`, `weight`, `extra`, `status`, `created_time`, `updated_time`, `creator_id`, `updater_id`, `creator_name`, `updater_name`)
VALUES
    ('1', '1', 'user-man', '/user-management', '用户管理', NULL, '1', '{ \"icon\": \"kehuguanli\", \"router\": \"/user-management\", \"isShow\": 1, \"viewPath\": \"userManagement/index.vue\", \"openMode\": 1 }', '1', '1729946254000', '1729946254000', '1', '1', 'admin', 'admin'),
    ('2', '2', 'user:all', '/admin/user/**', '用户管理完整操作权限', 'user-man', '1', '{}', '1', '1729946254000', '1729946254000', '1', '1', 'admin', 'admin'),
    ('3', '1', 'vu-man', '/vulnerability-management', '漏洞信息管理', NULL, '1', '{ \"icon\": \"kehuguanli\", \"router\": \"/vulnerability-management\", \"isShow\": 1, \"viewPath\": \"vulManagement/index.vue\", \"openMode\": 1 }', '1', '1733544850000', '1733544850000', '1', '1', 'admin', 'admin'),
    ('4', '2', 'vu:all', '/admin/vulnerability/**', '漏洞信息管理完整操作权限', 'vu-man', '1', '{}', '1', '1733544917000', '1733544917000', '1', '1', 'admin', 'admin'),
    ('5', '1', 'log-man', '/operation-log', '操作日志模块', NULL, '1', '{ \"icon\": \"kehuguanli\", \"router\": \"/vulnerability-management\", \"isShow\": 1, \"viewPath\": \"vulManagement/index.vue\", \"openMode\": 1 }', '1', '1733544850000', '1733544850000', '1', '1', 'admin', 'admin'),
    ('6', '2', 'log:all', '/admin/log/**', '操作日志管理完整操作权限', 'vu-man', '1', '{}', '1', '1733544917000', '1733544917000', '1', '1', 'admin', 'admin');



-- 角色资源关系表
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
     `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
     `role_code` varchar(64) NOT NULL DEFAULT '' COMMENT '角色code',
     `resource_code` varchar(256) NOT NULL DEFAULT '' COMMENT '资源code',
     `created_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
     PRIMARY KEY (`id`),
     UNIQUE KEY `uniq_role_resource` ( `role_code`,`resource_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色资源表';

INSERT INTO `sys_role_resource` (`id`, `role_code`, `resource_code`, `created_time`)
VALUES
    ('1', 'admin', 'user-man', '1729946879000'),
    ('2', 'admin', 'user:all', '1729946898000'),
    ('3', 'user', 'vu-man', '1733544962000'),
    ('4', 'user', 'vu:all', '1733544962000'),
    ('5', 'admin', 'log-man', '1733544962000'),
    ('6', 'admin', 'log:all', '1733544962000');


CREATE TABLE `sys_operation_log` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `module` tinyint(2) NOT NULL DEFAULT '0' COMMENT '模块',
 `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型',
 `target_id` varchar(64) NOT NULL DEFAULT '' COMMENT '目标ID',
 `param` json DEFAULT NULL COMMENT '请求参数',
 `uri` varchar(255) NOT NULL DEFAULT '' COMMENT 'URI',
 `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP地址',
 `success` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否成功',
 `err_msg` longtext DEFAULT NULL COMMENT '错误信息',
 `creator_id` bigint NOT NULL DEFAULT '0' COMMENT '创建人ID',
 `creator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
 `created_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
 PRIMARY KEY(`id`),
 KEY `idx_module_type` (`module`, `type`),
 KEY `idx_target` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';
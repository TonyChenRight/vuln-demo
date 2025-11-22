use vulnerability_library;

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

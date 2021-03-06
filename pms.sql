-- MySQL Script generated by MySQL Workbench
-- Wed 09 Mar 2016 05:36:16 PM UTC
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pms
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pms` DEFAULT CHARACTER SET utf8 ;
USE `pms` ;

-- -----------------------------------------------------
-- Table `pms`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`department` ;

CREATE TABLE IF NOT EXISTS `pms`.`department` (
  `department_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '部门名',
  `department_desc` TINYTEXT CHARACTER SET 'utf8' NULL COMMENT '部门描述',
  `department_creator` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '创建者',
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`department_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '部门表';


-- -----------------------------------------------------
-- Table `pms`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`role` ;

CREATE TABLE IF NOT EXISTS `pms`.`role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '角色名',
  `role_code` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '角色编号',
  `role_desc` TINYTEXT CHARACTER SET 'utf8' NULL COMMENT '角色描述',
  `department` INT NOT NULL COMMENT '所属部门',
  `role_creator` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '角色创建人',
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`role_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '部门-角色';


-- -----------------------------------------------------
-- Table `pms`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`users` ;

CREATE TABLE IF NOT EXISTS `pms`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL COMMENT '用户名',
  `email` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL COMMENT '邮箱',
  `remember_token` VARCHAR(100) CHARACTER SET 'utf8' NULL,
  `created_at` TIMESTAMP(6) NULL,
  `update_at` TIMESTAMP(6) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '成员表';


-- -----------------------------------------------------
-- Table `pms`.`department_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`department_member` ;

CREATE TABLE IF NOT EXISTS `pms`.`department_member` (
  `dm_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` INT(10) NOT NULL COMMENT '部门成员',
  `department` INT NOT NULL COMMENT '部门',
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`dm_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '部门成员';


-- -----------------------------------------------------
-- Table `pms`.`member_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`member_role` ;

CREATE TABLE IF NOT EXISTS `pms`.`member_role` (
  `mr_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` INT(10) NOT NULL,
  `role` INT NULL,
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`mr_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '成员角色';


-- -----------------------------------------------------
-- Table `pms`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`project` ;

CREATE TABLE IF NOT EXISTS `pms`.`project` (
  `project_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '项目名',
  `project_type` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '项目类型',
  `project_range` VARCHAR(45) CHARACTER SET 'utf8' NULL COMMENT '项目级别',
  `project_desc` TINYTEXT CHARACTER SET 'utf8' NULL COMMENT '项目描述',
  `project_applicant` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '项目申请人',
  `project_manager` INT NOT NULL,
  `product_manager` INT NOT NULL,
  `approve_status` TINYINT NOT NULL DEFAULT 0 COMMENT '审批状态',
  `progress_status` TINYINT NOT NULL DEFAULT 0 COMMENT '进展状态',
  `etimated_time` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '项目估时',
  `actual_time` VARCHAR(45) CHARACTER SET 'utf8' NULL COMMENT '实际用时',
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`project_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '项目彪';


-- -----------------------------------------------------
-- Table `pms`.`project_goal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`project_goal` ;

CREATE TABLE IF NOT EXISTS `pms`.`project_goal` (
  `pg_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `goal_name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `goal_weight` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '目标权重',
  `etimated_time` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '目标估时',
  `actual_time` VARCHAR(45) CHARACTER SET 'utf8' NULL COMMENT '实际用时',
  `progress_status` TINYINT NOT NULL DEFAULT 0,
  `project` INT NOT NULL,
  `goal_unit` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '目标单位',
  `upper_goal` INT NOT NULL DEFAULT 0,
  `goal_order` INT NOT NULL DEFAULT 1,
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`pg_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = ' 项目目标';


-- -----------------------------------------------------
-- Table `pms`.`project_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`project_member` ;

CREATE TABLE IF NOT EXISTS `pms`.`project_member` (
  `pm_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member` INT(10) NOT NULL,
  `project` INT NOT NULL,
  `project_role` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '项目角色',
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`pm_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '项目人员';


-- -----------------------------------------------------
-- Table `pms`.`project_task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`project_task` ;

CREATE TABLE IF NOT EXISTS `pms`.`project_task` (
  `pt_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '任务名',
  `goal` INT NOT NULL,
  `executor` INT NOT NULL,
  `progress_status` TINYINT NOT NULL DEFAULT 0,
  `task_sign` VARCHAR(255) CHARACTER SET 'utf8' NULL COMMENT '任务标签',
  `etimated_time` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '预计完成时间',
  `actual_time` VARCHAR(45) NULL,
  `score` VARCHAR(45) CHARACTER SET 'utf8' NULL COMMENT '得分',
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`pt_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '项目任务';


-- -----------------------------------------------------
-- Table `pms`.`member_goal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`member_goal` ;

CREATE TABLE IF NOT EXISTS `pms`.`member_goal` (
  `mg_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member` INT(10) NOT NULL,
  `goal` INT NOT NULL,
  `score` VARCHAR(45) CHARACTER SET 'utf8' NULL COMMENT '评分',
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`mg_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '成员目标';


-- -----------------------------------------------------
-- Table `pms`.`demand_doc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`demand_doc` ;

CREATE TABLE IF NOT EXISTS `pms`.`demand_doc` (
  `dd_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project` INT NOT NULL,
  `doc_name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '文档名',
  `upper` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `create_time` TIMESTAMP(6) NULL,
  `update_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`dd_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '需求文档';


-- -----------------------------------------------------
-- Table `pms`.`demand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pms`.`demand` ;

CREATE TABLE IF NOT EXISTS `pms`.`demand` (
  `demand_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `demand_title` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '需求描述',
  `demand_desc` TINYTEXT CHARACTER SET 'utf8' NULL COMMENT '需求描述',
  `demand_type` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '需求类型',
  `demand_range` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '需求等级',
  `project` INT NOT NULL,
  `demand_status` TINYINT NOT NULL DEFAULT 0 COMMENT '需求状态',
  `progress_status` TINYINT NOT NULL DEFAULT 0 COMMENT '进展状态',
  `etimated_time` VARCHAR(45) NULL COMMENT '期望完成时间',
  `committer` INT(10) NOT NULL COMMENT '提交者',
  `recipient` VARCHAR(45) CHARACTER SET 'utf8' NULL COMMENT '受理者',
  PRIMARY KEY (`demand_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '需求中心';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

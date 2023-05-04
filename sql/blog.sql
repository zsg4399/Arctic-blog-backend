/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2023-05-04 17:10:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片存储路径',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `articleLikes` int unsigned NOT NULL DEFAULT '0' COMMENT '文章点赞量',
  `articleViews` int unsigned NOT NULL DEFAULT '0' COMMENT '文章浏览量',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `authorId` int unsigned NOT NULL COMMENT '作者账号id',
  `summary` varchar(255) NOT NULL,
  `articleStars` int unsigned NOT NULL DEFAULT '0',
  `deleteUrl` varchar(255) NOT NULL COMMENT '图片的删除路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `articleId` int unsigned NOT NULL,
  `categoryId` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for article_like_star
-- ----------------------------
DROP TABLE IF EXISTS `article_like_star`;
CREATE TABLE `article_like_star` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `articleId` int unsigned NOT NULL COMMENT '文章主键',
  `userId` int unsigned NOT NULL COMMENT '用户主键',
  `isLike` tinyint NOT NULL DEFAULT '0' COMMENT '用户是否点赞，0代表无操作，1代表点赞',
  `isStar` tinyint unsigned DEFAULT '0' COMMENT '0代表未收藏，1代表已收藏',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `categoryImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'https://s2.loli.net/2023/03/21/EYg85sFPRtIW7Z9.png' COMMENT '分类图片',
  `userId` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `articleId` int NOT NULL,
  `userId` int unsigned NOT NULL,
  `createTime` datetime NOT NULL COMMENT '评论日期',
  `commentLikes` int NOT NULL DEFAULT '0' COMMENT '点赞数',
  `commentContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '评论审核状态，1表示通过，0表示暂时仍在审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `commentId` int unsigned NOT NULL COMMENT '评论id',
  `userId` int unsigned NOT NULL COMMENT '用户id',
  `likes` tinyint NOT NULL DEFAULT '0' COMMENT '0代表未操作，1代表点赞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `articleId` int unsigned NOT NULL,
  `tagName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `username` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱地址，最大32位',
  `enabled` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '0代表账号不可用，1代表账号已通过邮箱注册激活',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所在地区',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '性别',
  `phone` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `createTime` datetime NOT NULL COMMENT '账号创建时间',
  `updateTime` datetime NOT NULL COMMENT '账号修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userId` int unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

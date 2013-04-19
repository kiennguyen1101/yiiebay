-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2011 at 09:53 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

DROP DATABASE IF EXISTS yiiblog;

CREATE DATABASE yiiblog;

USE yiiblog;

--
-- Database: `yiiblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `yii_commentmeta`
--

CREATE TABLE  `yii_commentmeta` (
  `commentmeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`commentmeta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `yii_commentmeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `yii_comments`
--

CREATE TABLE  `yii_comments` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_ip` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_id`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `yii_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `yii_options`
--

CREATE TABLE  `yii_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `yii_options`
--


-- --------------------------------------------------------

--
-- Table structure for table `yii_postmeta`
--

CREATE TABLE  `yii_postmeta` (
  `postmeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`postmeta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `yii_postmeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `yii_posts`
--

CREATE TABLE  `yii_posts` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', 
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `yii_posts`
--

INSERT INTO `yii_posts` (`post_id`, `post_author`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `post_name`, `post_modified`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2011-12-08 16:19:00', 'Hello world, this is a test post', 'Garage Floor', '', 'publish', 'garage-floor', '0000-00-00 00:00:00', 0, 'post', '', 0),
(2, 1, '2011-12-06 12:22:00', 'We want our patients and their families to have the opportunity to get help for their health problems without resorting to drugs or surgery through Chiropractic.The human body is a wonderful thing that was given the ability to heal itself.', 'Driveways', '', 'publish', 'driveways', '0000-00-00 00:00:00', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `yii_profiles`
--

CREATE TABLE  `yii_profiles` (
  `profile_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT ' ',
  `firstname` varchar(50) NOT NULL DEFAULT ' ',
  `date_of_birth` date NOT NULL,
  `about` text,
  PRIMARY KEY (`profile_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `yii_profiles`
--


-- --------------------------------------------------------

--
-- Table structure for table `yii_usermeta`
--

CREATE TABLE  `yii_usermeta` (
  `usermeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`usermeta_id`),
  KEY `meta_key` (`meta_key`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `yii_usermeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `yii_users`
--

CREATE TABLE  `yii_users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `user_registered_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(256) DEFAULT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0',
  `user_displayname` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `yii_users`
--

INSERT INTO `yii_users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_registered_date`, `user_activation_key`, `user_status`, `user_displayname`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'menoking@gmail.com', '2011-10-17 00:00:00', NULL, 1, 'admin'),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '2011-10-17 00:00:00', NULL, 1, 'demo'),
(3, 'kiennguyen', 'e10adc3949ba59abbe56e057f20f883e', 'sdf@sf.dfd', '0000-00-00 00:00:00', NULL, 0, ''),
(4, 'nguyenkien', 'e10adc3949ba59abbe56e057f20f883e', 'holy@gmail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(5, 'helloworld', 'e10adc3949ba59abbe56e057f20f883e', 'thangh9@gmail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(6, 'helloworld1', 'e10adc3949ba59abbe56e057f20f883e', 'thangh9@gm1ail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(7, 'blackant', 'e10adc3949ba59abbe56e057f20f883e', 'asdf@sdf.sdf', '0000-00-00 00:00:00', NULL, 0, '');


-- --------------------------------------------------------

--
-- Table structure for table `yii_role`
--

CREATE TABLE  `yii_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role id',
  `role_name` varchar(32) NOT NULL COMMENT 'Unique role name',
  `role_weight` int(11) NOT NULL COMMENT 'The weight of role: heavier ones are listed and accessed later', 
  PRIMARY KEY (`role_id`),
  UNIQUE  (`role_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `yii_role`
--

INSERT INTO `yii_role` (`role_id`, `role_name`, `role_weight`) VALUES
(1, 'anonymous user', '0'),
(2, 'authenticated user', '1'),
(3, 'administrator', '2');


--
-- Table structure for table `yii_role_permission`
--

CREATE TABLE  `yii_role_permission` (
  `role_id` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT 'The permission group.',
  PRIMARY KEY (`role_id`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';

-- --------------------------------------------------------

--
-- Table structure for table `yii_taxonomy_vocabulary`
--

CREATE TABLE IF NOT EXISTS `yii_taxonomy_vocabulary` (
  `vocabulary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',  
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY (`vocabulary_id`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `taxonomy_vocabulary`
--

INSERT INTO `yii_taxonomy_vocabulary` (`vocabulary_id`, `name`, `machine_name`, `description`, `hierarchy`, `weight`) VALUES
(1, 'Tags', 'tags', 'Use tags to group articles on similar topics into categories.', 0, 'taxonomy', 0),
(2, 'Catalog', 'catalog', '', 0, 0),
(3, 'Location', 'location', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yii_taxonomy_term_data`
--

CREATE TABLE IF NOT EXISTS `yii_taxonomy_term_data` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.',
  `vocabulary_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vocabulary_id of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Term ID of term parent. 0 indicates no parent.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The format of the description: plain_text, filtered_html or full_html.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  PRIMARY KEY (`term_id`),
  KEY `taxonomy_tree` (`vocabulary_id`,`weight`,`name`),
  KEY `vid_name` (`vocabulary_id`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores term information.' AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

CREATE TABLE IF NOT EXISTS `taxonomy_index` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `term_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`term_id`,`sticky`,`created`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `yii_commentmeta`
--
ALTER TABLE `yii_commentmeta`
  ADD CONSTRAINT `yii_commentmeta_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `yii_comments` (`comment_id`);

--
-- Constraints for table `yii_comments`
--
ALTER TABLE `yii_comments`
  ADD CONSTRAINT `yii_comments_ibfk_1` FOREIGN KEY (`comment_post_id`) REFERENCES `yii_posts` (`post_id`);

--
-- Constraints for table `yii_postmeta`
--
ALTER TABLE `yii_postmeta`
  ADD CONSTRAINT `yii_postmeta_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `yii_posts` (`post_id`);

--
-- Constraints for table `yii_profiles`
--
ALTER TABLE `yii_profiles`
  ADD CONSTRAINT `yii_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `yii_users` (`user_id`);

--
-- Constraints for table `yii_usermeta`
--
ALTER TABLE `yii_usermeta`
  ADD CONSTRAINT `yii_usermeta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `yii_users` (`user_id`);

--
-- Constraints for table `role_permission`
--
ALTER TABLE `yii_role_permission`
  ADD CONSTRAINT `yii_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `yii_role` (`role_id`);
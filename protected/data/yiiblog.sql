-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 30, 2013 at 05:40 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

SET foreign_key_checks = 0;

-- --------------------------------------------------------

--
-- Table structure for table `commentmeta`
--

DROP TABLE IF EXISTS `commentmeta`;
CREATE TABLE IF NOT EXISTS `commentmeta` (
  `commentmeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`commentmeta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_nid` bigint(20) unsigned NOT NULL DEFAULT '0',
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
  KEY `commentn_nid` (`comment_nid`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
CREATE TABLE IF NOT EXISTS `node` (
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `type` int(11) NOT NULL COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'The user.uid that owns this node; initially, this is the user that created it.',
  `status` varchar(20) NOT NULL DEFAULT 'published' COMMENT 'The status of the node: published, preview, waiting approval or trashed',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The Unix timestamp when the node was created.',
  `changed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` smallint(3) NOT NULL DEFAULT '2' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  PRIMARY KEY (`nid`),
   KEY `node_changed` (`changed`),
   KEY `node_created` (`created`),
   KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
   KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`),
   KEY `node_type` (`type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
CREATE TABLE IF NOT EXISTS `node_type` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary key for a node type.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  PRIMARY KEY (`id`),
  UNIQUE (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT ' ',
  `firstname` varchar(50) NOT NULL DEFAULT ' ',
  `date_of_birth` date NOT NULL,
  `about` text,
  PRIMARY KEY (`profile_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role id',
  `role_name` varchar(32) NOT NULL COMMENT 'Unique role name',
  `role_weight` int(11) NOT NULL COMMENT 'The weight of role: heavier ones are listed and accessed later',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `role_weight`) VALUES
(1, 'anonymous user', 0),
(2, 'authenticated user', 1),
(3, 'administrator', 2);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `role_id` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT 'The permission group.',
  PRIMARY KEY (`role_id`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

DROP TABLE IF EXISTS `taxonomy_index`;
CREATE TABLE IF NOT EXISTS `taxonomy_index` (
  `nid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `term_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  KEY `term_node` (`term_id`),
  KEY `node_id` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_data`
--

DROP TABLE IF EXISTS `taxonomy_term_data`;
CREATE TABLE IF NOT EXISTS `taxonomy_term_data` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores term information.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_vocabulary`
--

DROP TABLE IF EXISTS `taxonomy_vocabulary`;
CREATE TABLE IF NOT EXISTS `taxonomy_vocabulary` (
  `vocabulary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY (`vocabulary_id`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `taxonomy_vocabulary`
--

INSERT INTO `taxonomy_vocabulary` (`vocabulary_id`, `name`, `machine_name`, `description`, `hierarchy`, `weight`) VALUES
(1, 'Tags', 'tags', 'Use tags to group articles on similar topics into categories.', 0, 0),
(2, 'Category', 'category', '', 0, 0),
(3, 'Location', 'location', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usermeta`
--

DROP TABLE IF EXISTS `usermeta`;
CREATE TABLE IF NOT EXISTS `usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `meta_key` (`meta_key`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_email`, `user_registered_date`, `user_activation_key`, `user_status`, `user_displayname`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'menoking@gmail.com', '2011-10-17 00:00:00', NULL, 1, 'admin'),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '2011-10-17 00:00:00', NULL, 1, 'demo'),
(3, 'kiennguyen', 'e10adc3949ba59abbe56e057f20f883e', 'sdf@sf.dfd', '0000-00-00 00:00:00', NULL, 0, ''),
(4, 'nguyenkien', 'e10adc3949ba59abbe56e057f20f883e', 'holy@gmail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(5, 'helloworld', 'e10adc3949ba59abbe56e057f20f883e', 'thangh9@gmail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(6, 'helloworld1', 'e10adc3949ba59abbe56e057f20f883e', 'thangh9@gm1ail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(7, 'blackant', 'e10adc3949ba59abbe56e057f20f883e', 'asdf@sdf.sdf', '0000-00-00 00:00:00', NULL, 0, '');


SET foreign_key_checks = 1;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentmeta`
--
ALTER TABLE `commentmeta`
ADD CONSTRAINT `commentmeta_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_nid`) REFERENCES `node` (`nid`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `usermeta`
--
ALTER TABLE `usermeta`
ADD CONSTRAINT `usermeta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);


ALTER TABLE `taxonomy_index`
ADD CONSTRAINT `taxonomy_index_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `node` (`nid`),
ADD CONSTRAINT `taxonomy_index_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `taxonomy_term_data` (`term_id`);

ALTER TABLE `taxonomy_term_data`
ADD CONSTRAINT `taxonomy_term_data_ibfk_1` FOREIGN KEY (`vocabulary_id`) REFERENCES `taxonomy_vocabulary` (`vocabulary_id`);

ALTER TABLE `node` ADD CONSTRAINT `node_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
ALTER TABLE `node` ADD CONSTRAINT `node_ibfk_2` FOREIGN KEY (`type`) REFERENCES `node_type` (`id`);


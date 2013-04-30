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
-- Table structure for table `cms_commentmeta`
--

DROP TABLE IF EXISTS `cms_commentmeta`;
CREATE TABLE IF NOT EXISTS `cms_commentmeta` (
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
-- Table structure for table `cms_comments`
--

DROP TABLE IF EXISTS `cms_comments`;
CREATE TABLE IF NOT EXISTS `cms_comments` (
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
-- Table structure for table `cms_node`
--

DROP TABLE IF EXISTS `cms_node`;
CREATE TABLE IF NOT EXISTS `cms_node` (
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `vid` bigint(20) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` varchar(20) NOT NULL DEFAULT 'published' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The Unix timestamp when the node was created.',
  `changed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` smallint(3) NOT NULL DEFAULT '2' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cms_node_revision`
--

DROP TABLE IF EXISTS `cms_node_revision`;
CREATE TABLE IF NOT EXISTS `cms_node_revision` (
  `nid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',
  `uid` bigint(20) NOT NULL DEFAULT '1' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` text NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` varchar(20) NOT NULL DEFAULT 'published' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cms_node_type`
--

DROP TABLE IF EXISTS `cms_node_type`;
CREATE TABLE IF NOT EXISTS `cms_node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';

-- --------------------------------------------------------

--
-- Table structure for table `cms_options`
--

DROP TABLE IF EXISTS `cms_options`;
CREATE TABLE IF NOT EXISTS `cms_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cms_profiles`
--

DROP TABLE IF EXISTS `cms_profiles`;
CREATE TABLE IF NOT EXISTS `cms_profiles` (
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
-- Table structure for table `cms_role`
--

DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE IF NOT EXISTS `cms_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role id',
  `role_name` varchar(32) NOT NULL COMMENT 'Unique role name',
  `role_weight` int(11) NOT NULL COMMENT 'The weight of role: heavier ones are listed and accessed later',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cms_role`
--

INSERT INTO `cms_role` (`role_id`, `role_name`, `role_weight`) VALUES
(1, 'anonymous user', 0),
(2, 'authenticated user', 1),
(3, 'administrator', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cms_role_permission`
--

DROP TABLE IF EXISTS `cms_role_permission`;
CREATE TABLE IF NOT EXISTS `cms_role_permission` (
  `role_id` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT 'The permission group.',
  PRIMARY KEY (`role_id`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';

-- --------------------------------------------------------

--
-- Table structure for table `cms_taxonomy_index`
--

DROP TABLE IF EXISTS `cms_taxonomy_index`;
CREATE TABLE IF NOT EXISTS `cms_taxonomy_index` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `term_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`term_id`,`sticky`,`created`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

-- --------------------------------------------------------

--
-- Table structure for table `cms_taxonomy_term_data`
--

DROP TABLE IF EXISTS `cms_taxonomy_term_data`;
CREATE TABLE IF NOT EXISTS `cms_taxonomy_term_data` (
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
-- Table structure for table `cms_taxonomy_vocabulary`
--

DROP TABLE IF EXISTS `cms_taxonomy_vocabulary`;
CREATE TABLE IF NOT EXISTS `cms_taxonomy_vocabulary` (
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
-- Dumping data for table `cms_taxonomy_vocabulary`
--

INSERT INTO `cms_taxonomy_vocabulary` (`vocabulary_id`, `name`, `machine_name`, `description`, `hierarchy`, `weight`) VALUES
(1, 'Tags', 'tags', 'Use tags to group articles on similar topics into categories.', 0, 0),
(2, 'Category', 'category', '', 0, 0),
(3, 'Location', 'location', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_usermeta`
--

DROP TABLE IF EXISTS `cms_usermeta`;
CREATE TABLE IF NOT EXISTS `cms_usermeta` (
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
-- Table structure for table `cms_users`
--

DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE IF NOT EXISTS `cms_users` (
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
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_registered_date`, `user_activation_key`, `user_status`, `user_displayname`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'menoking@gmail.com', '2011-10-17 00:00:00', NULL, 1, 'admin'),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '2011-10-17 00:00:00', NULL, 1, 'demo'),
(3, 'kiennguyen', 'e10adc3949ba59abbe56e057f20f883e', 'sdf@sf.dfd', '0000-00-00 00:00:00', NULL, 0, ''),
(4, 'nguyenkien', 'e10adc3949ba59abbe56e057f20f883e', 'holy@gmail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(5, 'helloworld', 'e10adc3949ba59abbe56e057f20f883e', 'thangh9@gmail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(6, 'helloworld1', 'e10adc3949ba59abbe56e057f20f883e', 'thangh9@gm1ail.com', '0000-00-00 00:00:00', NULL, 0, ''),
(7, 'blackant', 'e10adc3949ba59abbe56e057f20f883e', 'asdf@sdf.sdf', '0000-00-00 00:00:00', NULL, 0, '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cms_commentmeta`
--
ALTER TABLE `cms_commentmeta`
ADD CONSTRAINT `cms_commentmeta_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `cms_comments` (`comment_id`);

--
-- Constraints for table `cms_comments`
--
ALTER TABLE `cms_comments`
ADD CONSTRAINT `cms_comments_ibfk_1` FOREIGN KEY (`comment_nid`) REFERENCES `cms_node` (`nid`);

--
-- Constraints for table `cms_profiles`
--
ALTER TABLE `cms_profiles`
ADD CONSTRAINT `cms_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `cms_users` (`user_id`);

--
-- Constraints for table `cms_role_permission`
--
ALTER TABLE `cms_role_permission`
ADD CONSTRAINT `cms_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `cms_role` (`role_id`);

--
-- Constraints for table `cms_usermeta`
--
ALTER TABLE `cms_usermeta`
ADD CONSTRAINT `cms_usermeta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `cms_users` (`user_id`);


SET foreign_key_checks = 1;
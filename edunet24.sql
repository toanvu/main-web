-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2013 at 08:48 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `edunet24`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `isNeededByRegister` tinyint(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `valueType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attributevalue`
--

CREATE TABLE IF NOT EXISTS `attributevalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ED70455192A1E68` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `user1_id` int(11) DEFAULT NULL,
  `user2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BEFBC00EF218B11` (`user1_id`),
  KEY `FK9BEFBC00EF21FF70` (`user2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crequest`
--

CREATE TABLE IF NOT EXISTS `crequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `response_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD47648CC14A05A8` (`request_id`),
  KEY `FKD47648CC6D332EB6` (`response_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `egroup`
--

CREATE TABLE IF NOT EXISTS `egroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `egroup`
--

INSERT INTO `egroup` (`id`, `createdDate`, `deleted`, `updatedDate`) VALUES
(4, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `egroup_user`
--

CREATE TABLE IF NOT EXISTS `egroup_user` (
  `group_Id` int(11) NOT NULL,
  `messenger_Id` int(11) NOT NULL,
  KEY `FKAAC6BB0C7F93EA4` (`messenger_Id`),
  KEY `FKAAC6BB0F5F145E2` (`group_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `egroup_user`
--

INSERT INTO `egroup_user` (`group_Id`, `messenger_Id`) VALUES
(4, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `group_messenger`
--

CREATE TABLE IF NOT EXISTS `group_messenger` (
  `group_Id` int(11) NOT NULL,
  `messenger_Id` int(11) NOT NULL,
  KEY `FK5CC6B113C7F93EA4` (`messenger_Id`),
  KEY `FK5CC6B113F5F145E2` (`group_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9C2397E7F5F145E2` (`group_id`),
  KEY `FK9C2397E762356304` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `createdDate`, `deleted`, `updatedDate`, `text`, `group_id`, `owner_id`) VALUES
(1, NULL, 0, NULL, 'fgsdfgsdf', 4, 1),
(2, NULL, 0, NULL, 'fgsdfgsdf', 4, 1),
(3, NULL, 0, NULL, 'hello', 4, 1),
(4, NULL, 0, NULL, 'hahahahaha', 4, 2),
(5, NULL, 0, NULL, 'asdfasdfasd', 4, 1),
(6, NULL, 0, NULL, 'show something', 4, 1),
(7, NULL, 0, NULL, 'hallo', 4, 2),
(8, NULL, 0, NULL, 'Hallo Herr Son Tran,\r\nwie geht es Ihnen', 4, 2),
(9, NULL, 0, NULL, 'Hallo Herr Son tran,\r\nhiermit informiere ich ....\r\n', 4, 2),
(10, NULL, 0, NULL, 'dassdöla', 4, 2),
(11, NULL, 0, NULL, 'hello toan day', 4, 1),
(12, NULL, 0, NULL, 'toan day', 4, 1),
(13, NULL, 0, NULL, 'hello toan day', 4, 1),
(14, NULL, 0, NULL, 'adsfasdf', 4, 1),
(15, NULL, 0, NULL, 'anh son day', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `message_user`
--

CREATE TABLE IF NOT EXISTS `message_user` (
  `Message_id` int(11) NOT NULL,
  `watchers_id` int(11) NOT NULL,
  KEY `FKBD15594350AB1900` (`watchers_id`),
  KEY `FKBD15594396438C0D` (`Message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_user`
--

INSERT INTO `message_user` (`Message_id`, `watchers_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `createdDate`, `deleted`, `updatedDate`, `name`) VALUES
(1, NULL, 0, NULL, 'read'),
(2, NULL, 0, NULL, 'write'),
(3, NULL, 0, NULL, 'execute'),
(4, NULL, 0, NULL, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `createdDate`, `deleted`, `updatedDate`, `name`) VALUES
(1, NULL, 0, NULL, 'teacher'),
(2, NULL, 0, NULL, 'parent'),
(3, NULL, 0, NULL, 'common member');

-- --------------------------------------------------------

--
-- Table structure for table `role_servicepermission`
--

CREATE TABLE IF NOT EXISTS `role_servicepermission` (
  `Role_Id` int(11) NOT NULL,
  `ServicePermission_Id` int(11) NOT NULL,
  KEY `FK84FCAEDB1B976B88` (`ServicePermission_Id`),
  KEY `FK84FCAEDB5123EF0C` (`Role_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_servicepermission`
--

INSERT INTO `role_servicepermission` (`Role_Id`, `ServicePermission_Id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `createdDate`, `deleted`, `updatedDate`, `name`) VALUES
(1, NULL, 0, NULL, 'message');

-- --------------------------------------------------------

--
-- Table structure for table `servicepermission`
--

CREATE TABLE IF NOT EXISTS `servicepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK29328A44D613AEEC` (`permission_id`),
  KEY `FK29328A44B5C6AF48` (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `servicepermission`
--

INSERT INTO `servicepermission` (`id`, `createdDate`, `deleted`, `updatedDate`, `permission_id`, `service_id`) VALUES
(1, NULL, 0, NULL, 1, 1),
(2, NULL, 0, NULL, 2, 1),
(3, NULL, 0, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updatedDate` date DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `newstype` varchar(255) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK285FEB5123EF0C` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `createdDate`, `deleted`, `updatedDate`, `dob`, `email`, `firstname`, `gender`, `lastname`, `password`, `username`, `newstype`, `school_id`, `usertype`, `role_id`) VALUES
(1, '2013-08-25', 0, NULL, NULL, 'toan.vu@snc-design.de', 'Toan', 'Herr', 'Vu', 'e10adc3949ba59abbe56e057f20f883e', 'noface', 'both', NULL, 'teacher', NULL),
(2, '2013-08-25', 0, NULL, NULL, 'son-tran@gmx.de', 'Son', 'Herr', 'Tran', 'e10adc3949ba59abbe56e057f20f883e', 'sontran', 'both', NULL, 'teacher', NULL),
(3, '2013-09-01', 0, NULL, '1987-04-01', 'parent@gmx.de', 'Toan', 'male', 'Vu', 'e10adc3949ba59abbe56e057f20f883e', 'parent1', 'email,sms', NULL, 'parent', NULL),
(6, '2013-09-01', 0, NULL, '1980-08-23', 'outSide@gmx.de', 'Son', 'male', 'Tran', 'e10adc3949ba59abbe56e057f20f883e', 'outsider', 'email,sms', NULL, 'other', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_attributevalue`
--

CREATE TABLE IF NOT EXISTS `user_attributevalue` (
  `User_id` int(11) NOT NULL,
  `optAttributes_id` int(11) NOT NULL,
  KEY `FK8457DF291A7223F7` (`optAttributes_id`),
  KEY `FK8457DF29F64EB2EC` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FK143BF46A5123EF0C` (`role_id`),
  KEY `FK143BF46AF64EB2EC` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(6, 3),
(1, 1),
(2, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attributevalue`
--
ALTER TABLE `attributevalue`
  ADD CONSTRAINT `FK4ED70455192A1E68` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK9BEFBC00EF218B11` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK9BEFBC00EF21FF70` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `crequest`
--
ALTER TABLE `crequest`
  ADD CONSTRAINT `FKD47648CC14A05A8` FOREIGN KEY (`request_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKD47648CC6D332EB6` FOREIGN KEY (`response_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `egroup_user`
--
ALTER TABLE `egroup_user`
  ADD CONSTRAINT `FKAAC6BB0C7F93EA4` FOREIGN KEY (`messenger_Id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKAAC6BB0F5F145E2` FOREIGN KEY (`group_Id`) REFERENCES `egroup` (`id`);

--
-- Constraints for table `group_messenger`
--
ALTER TABLE `group_messenger`
  ADD CONSTRAINT `FK5CC6B113C7F93EA4` FOREIGN KEY (`messenger_Id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK5CC6B113F5F145E2` FOREIGN KEY (`group_Id`) REFERENCES `egroup` (`id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK9C2397E762356304` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK9C2397E7F5F145E2` FOREIGN KEY (`group_id`) REFERENCES `egroup` (`id`);

--
-- Constraints for table `message_user`
--
ALTER TABLE `message_user`
  ADD CONSTRAINT `FKBD15594350AB1900` FOREIGN KEY (`watchers_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKBD15594396438C0D` FOREIGN KEY (`Message_id`) REFERENCES `message` (`id`);

--
-- Constraints for table `role_servicepermission`
--
ALTER TABLE `role_servicepermission`
  ADD CONSTRAINT `FK84FCAEDB1B976B88` FOREIGN KEY (`ServicePermission_Id`) REFERENCES `servicepermission` (`id`),
  ADD CONSTRAINT `FK84FCAEDB5123EF0C` FOREIGN KEY (`Role_Id`) REFERENCES `role` (`id`);

--
-- Constraints for table `servicepermission`
--
ALTER TABLE `servicepermission`
  ADD CONSTRAINT `FK29328A44B5C6AF48` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  ADD CONSTRAINT `FK29328A44D613AEEC` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK285FEB5123EF0C` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_attributevalue`
--
ALTER TABLE `user_attributevalue`
  ADD CONSTRAINT `FK8457DF291A7223F7` FOREIGN KEY (`optAttributes_id`) REFERENCES `attributevalue` (`id`),
  ADD CONSTRAINT `FK8457DF29F64EB2EC` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK143BF46A5123EF0C` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FK143BF46AF64EB2EC` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

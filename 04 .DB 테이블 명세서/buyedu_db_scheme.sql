-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.45-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema buyedu
--

CREATE DATABASE IF NOT EXISTS buyedu;
USE buyedu;

--
-- Definition of table `academy`
--

DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `academy_code` varchar(10) NOT NULL,
  `user_no` int(10) unsigned NOT NULL,
  `academy_name` varchar(30) NOT NULL,
  `academy_addr` varchar(30) DEFAULT NULL,
  `academy_lat` varchar(30) DEFAULT NULL,
  `academy_lng` varchar(30) DEFAULT NULL,
  `academy_phone` varchar(30) DEFAULT NULL,
  `academy_history` varchar(500) DEFAULT NULL,
  `academy_intro` varchar(500) DEFAULT NULL,
  `academy_area` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`academy_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academy`
--

/*!40000 ALTER TABLE `academy` DISABLE KEYS */;
/*!40000 ALTER TABLE `academy` ENABLE KEYS */;


--
-- Definition of table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `board_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_code` varchar(1) NOT NULL,
  `board_title` varchar(60) NOT NULL,
  `board_date` date NOT NULL,
  `board_writer` int(10) unsigned NOT NULL,
  `board_content` varchar(1000) NOT NULL,
  `board_state` varchar(1) NOT NULL,
  `board_count` int(10) unsigned NOT NULL,
  `aca_writer` varchar(10) NOT NULL,
  PRIMARY KEY (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `board`
--

/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;


--
-- Definition of table `board_file`
--

DROP TABLE IF EXISTS `board_file`;
CREATE TABLE `board_file` (
  `board_file_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_no` int(10) unsigned NOT NULL,
  `board_image` varchar(100) NOT NULL,
  PRIMARY KEY (`board_file_no`),
  KEY `FK_board_file_1` (`board_no`),
  CONSTRAINT `FK_board_file_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `board_file`
--

/*!40000 ALTER TABLE `board_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_file` ENABLE KEYS */;


--
-- Definition of table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_no` int(10) unsigned NOT NULL,
  `comment_content` varchar(500) NOT NULL,
  `comment_date` date NOT NULL,
  `comment_writer` int(10) unsigned NOT NULL,
  `comment_state` varchar(1) NOT NULL,
  PRIMARY KEY (`comment_no`),
  KEY `FK_Comment_1` (`board_no`),
  CONSTRAINT `FK_Comment_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


--
-- Definition of table `complain`
--

DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain` (
  `complain_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_no` int(10) unsigned NOT NULL,
  `comment_no` int(10) unsigned NOT NULL,
  `review_no` int(10) unsigned NOT NULL,
  `complain_user_no` int(10) unsigned NOT NULL,
  `complain_reason_code` varchar(1) NOT NULL,
  `complain_sort` varchar(1) NOT NULL,
  `complain_date` date NOT NULL,
  `complain_state` varchar(1) NOT NULL,
  PRIMARY KEY (`complain_no`),
  KEY `FK_Complain_1` (`board_no`),
  KEY `FK_Complain_2` (`review_no`),
  KEY `FK_Complain_3` (`complain_reason_code`),
  CONSTRAINT `FK_Complain_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`),
  CONSTRAINT `FK_Complain_2` FOREIGN KEY (`review_no`) REFERENCES `review` (`review_no`),
  CONSTRAINT `FK_Complain_3` FOREIGN KEY (`complain_reason_code`) REFERENCES `complain_reason` (`complain_reason_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complain`
--

/*!40000 ALTER TABLE `complain` DISABLE KEYS */;
/*!40000 ALTER TABLE `complain` ENABLE KEYS */;


--
-- Definition of table `complain_reason`
--

DROP TABLE IF EXISTS `complain_reason`;
CREATE TABLE `complain_reason` (
  `complain_reason_code` varchar(1) NOT NULL,
  `complain_reason_name` varchar(20) NOT NULL,
  PRIMARY KEY (`complain_reason_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complain_reason`
--

/*!40000 ALTER TABLE `complain_reason` DISABLE KEYS */;
/*!40000 ALTER TABLE `complain_reason` ENABLE KEYS */;


--
-- Definition of table `connect`
--

DROP TABLE IF EXISTS `connect`;
CREATE TABLE `connect` (
  `connect_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academy_code` varchar(10) NOT NULL,
  `user_no` int(10) unsigned NOT NULL,
  `connect_state` varchar(1) NOT NULL,
  PRIMARY KEY (`connect_no`),
  KEY `FK_Connect_1` (`academy_code`),
  KEY `FK_connect_2` (`user_no`),
  CONSTRAINT `FK_connect_2` FOREIGN KEY (`user_no`) REFERENCES `users` (`user_no`),
  CONSTRAINT `FK_Connect_1` FOREIGN KEY (`academy_code`) REFERENCES `academy` (`academy_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connect`
--

/*!40000 ALTER TABLE `connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect` ENABLE KEYS */;


--
-- Definition of table `edu`
--

DROP TABLE IF EXISTS `edu`;
CREATE TABLE `edu` (
  `edu_code` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edu_academy_code` varchar(10) NOT NULL,
  `edu_user_no` int(10) unsigned NOT NULL,
  `edu_day` varchar(20) NOT NULL,
  `edu_name` varchar(50) NOT NULL,
  `edu_price` int(10) unsigned NOT NULL,
  `edu_teacher` varchar(20) NOT NULL,
  `edu_member` int(10) unsigned NOT NULL,
  `edu_intro` varchar(100) NOT NULL,
  `edu_start_date` date NOT NULL,
  `edu_end_date` date NOT NULL,
  `edu_state` varchar(1) NOT NULL,
  `edu_subject` varchar(45) NOT NULL,
  PRIMARY KEY (`edu_code`),
  KEY `FK_edu_1` (`edu_academy_code`),
  KEY `FK_edu_2` (`edu_user_no`),
  CONSTRAINT `FK_edu_2` FOREIGN KEY (`edu_user_no`) REFERENCES `users` (`user_no`),
  CONSTRAINT `FK_edu_1` FOREIGN KEY (`edu_academy_code`) REFERENCES `academy` (`academy_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='수업';

--
-- Dumping data for table `edu`
--

/*!40000 ALTER TABLE `edu` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu` ENABLE KEYS */;


--
-- Definition of table `pick_edu`
--

DROP TABLE IF EXISTS `pick_edu`;
CREATE TABLE `pick_edu` (
  `pick_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pick_user_no` int(10) unsigned NOT NULL,
  `pick_edu_code` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pick_no`),
  KEY `FK_Pick_Edu_1` (`pick_user_no`),
  KEY `FK_pick_edu_2` (`pick_edu_code`),
  CONSTRAINT `FK_pick_edu_2` FOREIGN KEY (`pick_edu_code`) REFERENCES `edu` (`edu_code`),
  CONSTRAINT `FK_Pick_Edu_1` FOREIGN KEY (`pick_user_no`) REFERENCES `users` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pick_edu`
--

/*!40000 ALTER TABLE `pick_edu` DISABLE KEYS */;
/*!40000 ALTER TABLE `pick_edu` ENABLE KEYS */;


--
-- Definition of table `purchase_edu`
--

DROP TABLE IF EXISTS `purchase_edu`;
CREATE TABLE `purchase_edu` (
  `purchase_uid` varchar(100) NOT NULL,
  `user_no` int(10) unsigned NOT NULL,
  `edu_code` int(10) unsigned NOT NULL,
  `pay_date` date NOT NULL,
  `pay_state` varchar(1) NOT NULL,
  `pay_no` int(10) unsigned NOT NULL,
  PRIMARY KEY (`purchase_uid`),
  KEY `FK_Purchase_Edu_1` (`user_no`),
  CONSTRAINT `FK_Purchase_Edu_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_edu`
--

/*!40000 ALTER TABLE `purchase_edu` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_edu` ENABLE KEYS */;


--
-- Definition of table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `recommend_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_no` int(10) unsigned NOT NULL,
  `recommender` int(10) unsigned NOT NULL,
  PRIMARY KEY (`recommend_no`),
  KEY `FK_recommend_1` (`board_no`),
  CONSTRAINT `FK_recommend_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recommend`
--

/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;


--
-- Definition of table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academy_code` varchar(10) NOT NULL,
  `review_state` varchar(1) NOT NULL,
  `review_writer` int(10) unsigned NOT NULL,
  `review_title` varchar(150) NOT NULL,
  `review_date` date NOT NULL,
  `review_content` varchar(500) NOT NULL,
  PRIMARY KEY (`review_no`),
  KEY `FK_review_1` (`academy_code`),
  CONSTRAINT `FK_review_1` FOREIGN KEY (`academy_code`) REFERENCES `academy` (`academy_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `account_state` varchar(1) NOT NULL,
  `in_date` date NOT NULL,
  `out_date` date NOT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

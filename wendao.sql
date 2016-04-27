-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: wendao
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wd_comment`
--

DROP TABLE IF EXISTS `wd_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `parent_id` int(11) DEFAULT NULL COMMENT '评论的父id',
  `author_id` int(11) DEFAULT NULL COMMENT '评论者id',
  `video_id` int(11) NOT NULL COMMENT '评论的视频id',
  `comment_likes` int(10) unsigned DEFAULT NULL COMMENT '点赞数',
  `comment_content` varchar(1024) DEFAULT NULL COMMENT '评论内容',
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_comment`
--

LOCK TABLES `wd_comment` WRITE;
/*!40000 ALTER TABLE `wd_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_interest`
--

DROP TABLE IF EXISTS `wd_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_interest` (
  `interest_id` tinyint(4) NOT NULL,
  `interest_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`interest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_interest`
--

LOCK TABLES `wd_interest` WRITE;
/*!40000 ALTER TABLE `wd_interest` DISABLE KEYS */;
INSERT INTO `wd_interest` VALUES (0,'计算机'),(1,'科学'),(2,'文学'),(3,'经济'),(4,'艺术'),(5,'心理');
/*!40000 ALTER TABLE `wd_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_note`
--

DROP TABLE IF EXISTS `wd_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `note_time` datetime DEFAULT NULL,
  `note_content` longtext,
  `note_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_note`
--

LOCK TABLES `wd_note` WRITE;
/*!40000 ALTER TABLE `wd_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_user`
--

DROP TABLE IF EXISTS `wd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_sex` char(2) DEFAULT NULL,
  `user_picture` varchar(100) DEFAULT NULL,
  `user_home_page` varchar(100) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_times` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_home_page` (`user_home_page`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user`
--

LOCK TABLES `wd_user` WRITE;
/*!40000 ALTER TABLE `wd_user` DISABLE KEYS */;
INSERT INTO `wd_user` VALUES (1,'test1','女',NULL,NULL,'2016-04-12 23:36:46',NULL),(2,'test2','女',NULL,NULL,'2016-04-26 14:42:29',NULL),(3,'test3',NULL,NULL,NULL,NULL,NULL),(4,'test4',NULL,NULL,NULL,NULL,0),(5,'test5',NULL,NULL,NULL,NULL,0),(6,'test7',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `wd_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_user_auths`
--

DROP TABLE IF EXISTS `wd_user_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_user_auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_type` int(11) DEFAULT NULL,
  `login_name` varchar(20) DEFAULT NULL,
  `login_password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auths` (`user_id`),
  CONSTRAINT `wd_user_auths_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`user_id`),
  CONSTRAINT `wd_user_auths_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user_auths`
--

LOCK TABLES `wd_user_auths` WRITE;
/*!40000 ALTER TABLE `wd_user_auths` DISABLE KEYS */;
INSERT INTO `wd_user_auths` VALUES (1,1,0,'用户昵称','123456'),(2,1,0,'test','123456'),(3,1,0,'test1','123456'),(4,2,0,'test2','$2a$10$aZcd.yqCDnC4LEteVnYI4.zVwSo6SYQMQFlut674WlA0cbY0Z.FN6'),(5,2,1,'353216134@qq.com','$2a$10$z5qHRulr5LYq98lnfRo3yuiolxJthlpU1.fs6ESuIFd0SzILwxO4a'),(6,3,0,'test3','$2a$10$O8LTnxGdlyoyMP2rEcf90O.U/Eck7Sq9yJ6Sr0HE6hdqLW9897bp6'),(7,3,1,'njtangqy@163.com','$2a$10$O8LTnxGdlyoyMP2rEcf90O.U/Eck7Sq9yJ6Sr0HE6hdqLW9897bp6'),(8,4,0,'test4','$2a$10$SQ49B50nGA73mMgeurv0H.fToAeoPLMcsn9m4qbFAPdVYkHzOej/a'),(9,4,1,'1234@qq.com','$2a$10$SQ49B50nGA73mMgeurv0H.fToAeoPLMcsn9m4qbFAPdVYkHzOej/a'),(10,5,0,'test5','$2a$10$kv6JBBiu546npSf4md7f0.tLwGRXieUOjX4qllvdGaHDEpIhcSlt.'),(11,5,1,'34567@qq.com','$2a$10$kv6JBBiu546npSf4md7f0.tLwGRXieUOjX4qllvdGaHDEpIhcSlt.'),(12,6,0,'test7','$2a$10$7EoHe0VmzCZl9AY/cwt.SeiOCBBw5Lj9nWfoZlfglLqlrNJysTLfW'),(13,6,1,'456789@qq.com','$2a$10$7EoHe0VmzCZl9AY/cwt.SeiOCBBw5Lj9nWfoZlfglLqlrNJysTLfW');
/*!40000 ALTER TABLE `wd_user_auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_user_interest`
--

DROP TABLE IF EXISTS `wd_user_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_user_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `interest_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user_interest`
--

LOCK TABLES `wd_user_interest` WRITE;
/*!40000 ALTER TABLE `wd_user_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_user_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_user_video`
--

DROP TABLE IF EXISTS `wd_user_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_user_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user_video`
--

LOCK TABLES `wd_user_video` WRITE;
/*!40000 ALTER TABLE `wd_user_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_user_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_video`
--

DROP TABLE IF EXISTS `wd_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(20) NOT NULL,
  `video_describe` varchar(1024) DEFAULT NULL,
  `video_time` datetime DEFAULT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  `video_comment` int(10) unsigned DEFAULT NULL,
  `video_like` int(10) unsigned DEFAULT NULL,
  `video_play` int(10) unsigned DEFAULT NULL,
  `interest_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE KEY `video_name` (`video_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_video`
--

LOCK TABLES `wd_video` WRITE;
/*!40000 ALTER TABLE `wd_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-27 10:31:06

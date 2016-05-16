-- MySQL dump 10.14  Distrib 5.5.43-MariaDB, for Linux (i686)
--
-- Host: localhost    Database: wendao
-- ------------------------------------------------------
-- Server version	5.5.43-MariaDB

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
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `video_id` int(11) NOT NULL,
  `comment_likes` int(10) unsigned DEFAULT NULL,
  `comment_content` varchar(1024) NOT NULL,
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_reply` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
  `interest_id` int(11) NOT NULL auto_increment,
  `interest_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`interest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_interest`
--

LOCK TABLES `wd_interest` WRITE;
INSERT INTO `wd_interest` VALUES (1,'计算机');
INSERT INTO `wd_interest` VALUES (2,'文学');
INSERT INTO `wd_interest` VALUES (3,'科学');
INSERT INTO `wd_interest` VALUES (4,'经济');
INSERT INTO `wd_interest` VALUES (5,'艺术');
INSERT INTO `wd_interest` VALUES (6,'心理');
/*!40000 ALTER TABLE `wd_interest` DISABLE KEYS */;
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
  `note_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `user_picture` varchar(100) DEFAULT 'default.png',
  `user_home_page` varchar(100) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_times` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_home_page` (`user_home_page`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user`
--

LOCK TABLES `wd_user` WRITE;
/*!40000 ALTER TABLE `wd_user` DISABLE KEYS */;
INSERT INTO `wd_user` VALUES (1,'test1','女',NULL,NULL,'2016-04-12 23:36:46',NULL),(2,'test2','0','2-3.jpg',NULL,'2016-05-11 16:19:54',NULL),(3,'test3',NULL,NULL,NULL,NULL,NULL),(4,'test4',NULL,NULL,NULL,NULL,0),(5,'test5',NULL,NULL,NULL,NULL,0),(6,'test7','0','6-2.png',NULL,NULL,0),(7,'test8',NULL,NULL,NULL,NULL,0),(8,'hahhah',NULL,NULL,NULL,NULL,0),(9,'hello',NULL,NULL,NULL,'2016-05-11 16:48:49',1),(10,'world',NULL,NULL,NULL,NULL,0),(11,'songry',NULL,NULL,NULL,NULL,0),(12,'tangqy',NULL,'default.png',NULL,NULL,0);
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
  `check_code` int(11) DEFAULT NULL,
  `isvalid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `auths` (`user_id`),
  CONSTRAINT `wd_user_auths_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`user_id`),
  CONSTRAINT `wd_user_auths_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user_auths`
--

LOCK TABLES `wd_user_auths` WRITE;
/*!40000 ALTER TABLE `wd_user_auths` DISABLE KEYS */;
INSERT INTO `wd_user_auths` VALUES (1,1,0,'用户昵称','123456',NULL,0),(2,1,0,'test','123456',NULL,0),(3,1,0,'test1','123456',NULL,0),(4,2,0,'test2','$2a$10$RqjBl.cJxeybK4/mPXJ9lOsTGnUZLtlOeUZXIIzE.T62qw8lyoPIi',NULL,0),(5,2,1,'353216134@qq.com','$2a$10$RqjBl.cJxeybK4/mPXJ9lOsTGnUZLtlOeUZXIIzE.T62qw8lyoPIi',NULL,0),(6,3,0,'test3','$2a$10$O8LTnxGdlyoyMP2rEcf90O.U/Eck7Sq9yJ6Sr0HE6hdqLW9897bp6',NULL,0),(7,3,1,'njtangqy@163.com','$2a$10$O8LTnxGdlyoyMP2rEcf90O.U/Eck7Sq9yJ6Sr0HE6hdqLW9897bp6',NULL,0),(8,4,0,'test4','$2a$10$SQ49B50nGA73mMgeurv0H.fToAeoPLMcsn9m4qbFAPdVYkHzOej/a',NULL,0),(9,4,1,'1234@qq.com','$2a$10$SQ49B50nGA73mMgeurv0H.fToAeoPLMcsn9m4qbFAPdVYkHzOej/a',NULL,0),(10,5,0,'test5','$2a$10$kv6JBBiu546npSf4md7f0.tLwGRXieUOjX4qllvdGaHDEpIhcSlt.',NULL,0),(11,5,1,'34567@qq.com','$2a$10$kv6JBBiu546npSf4md7f0.tLwGRXieUOjX4qllvdGaHDEpIhcSlt.',NULL,0),(12,6,0,'test7','$2a$10$7EoHe0VmzCZl9AY/cwt.SeiOCBBw5Lj9nWfoZlfglLqlrNJysTLfW',NULL,0),(13,6,1,'456789@qq.com','$2a$10$7EoHe0VmzCZl9AY/cwt.SeiOCBBw5Lj9nWfoZlfglLqlrNJysTLfW',NULL,0),(14,7,0,'test8','$2a$10$X3zJyLIGkAmCb6xtGmMhTe3JB/yQybdMdYeuaYWO3d01GMLBm5Uve',NULL,0),(15,7,1,'123456789@qq.com','$2a$10$X3zJyLIGkAmCb6xtGmMhTe3JB/yQybdMdYeuaYWO3d01GMLBm5Uve',NULL,0),(16,8,0,'hahhah','$2a$10$vfEUn8G9kM5BhgsADUkH4.K./SH3INzp7cCkOLYnjYFWa1Yy2MKSW',NULL,0),(17,8,1,'qqqqqqq@qq.com','$2a$10$vfEUn8G9kM5BhgsADUkH4.K./SH3INzp7cCkOLYnjYFWa1Yy2MKSW',NULL,0),(18,9,0,'hello','$2a$10$qEHuQyoEGF6SMCuSoSeKUux./eORFJITAk1trQcC6xLbb9Cg9XhzW',NULL,0),(19,9,1,'hello@qq.com','$2a$10$qEHuQyoEGF6SMCuSoSeKUux./eORFJITAk1trQcC6xLbb9Cg9XhzW',NULL,0),(20,10,0,'world','$2a$10$5Jc8Ph3qzM3DZFxwOzG9q.1J0G.Pfn8tfwO77tj1I9a9TdpZ104.m',NULL,0),(21,10,1,'world@qq.com','$2a$10$5Jc8Ph3qzM3DZFxwOzG9q.1J0G.Pfn8tfwO77tj1I9a9TdpZ104.m',NULL,0),(22,11,0,'songry','$2a$10$WELcGwqipJwGDmx.VMleHuplDggNyBfSUWkeUWyGOP9QWFRsimmha',NULL,0),(23,11,1,'songry@163.com','$2a$10$WELcGwqipJwGDmx.VMleHuplDggNyBfSUWkeUWyGOP9QWFRsimmha',NULL,0),(24,12,0,'tangqy','$2a$10$qzaVXc9bYqRYwEudZJGPb.jWOUgrT6i5G.UjYYVGep0sTpnS0zDhe',NULL,0),(25,12,1,'njtangq@163.com','$2a$10$qzaVXc9bYqRYwEudZJGPb.jWOUgrT6i5G.UjYYVGep0sTpnS0zDhe',NULL,0);
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
  `interest_id` int(11) DEFAULT NULL,
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
  `video_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_url` varchar(100) DEFAULT NULL,
  `video_like` int(10) unsigned DEFAULT NULL,
  `video_play` int(10) unsigned DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE KEY `video_name` (`video_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table wd_video add column video_picture varchar(100);

insert into wd_video(video_name, video_describe, video_picture, video_url,video_like, video_play, interest_id)values("oceans2", "海洋", "oceans.jsp", "oceans.mp4",4,5,1);
insert into wd_video(video_name, video_describe, video_picture, video_url,video_like, video_play, interest_id)values("oceans3", "海洋", "oceans.jsp", "oceans.mp4",4,5,1);
insert into wd_video(video_name, video_describe, video_picture, video_url,video_like, video_play, interest_id)values("oceans4", "海洋", "oceans.jsp", "oceans.mp4",4,5,1);
insert into wd_video(video_name, video_describe, video_picture, video_url,video_like, video_play, interest_id)values("oceans5", "海洋", "oceans.jsp", "oceans.mp4",4,5,1);
alter table wd_video change video_play video_play int(10) unsigned DEFAULT 0;
alter table wd_video change video_like video_like int(10) unsigned DEFAULT 0;

update wd_video set video_picture='oceans.jpg' where video_id=1;
update wd_video set video_picture='oceans.jpg' where video_id=2;
update wd_video set video_picture='oceans.jpg' where video_id=3;
update wd_video set video_picture='oceans.jpg' where video_id=4;
update wd_video set video_picture='oceans.jpg' where video_id=5;
update wd_video set video_picture='oceans.jpg' where video_id=6;
update wd_video set video_picture='oceans.jpg' where video_id=7;
update wd_video set video_picture='oceans.jpg' where video_id=8;
update wd_video set video_picture='oceans.jpg' where video_id=9;

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

-- Dump completed on 2016-05-11 17:35:45
alter table wd_user_video add column is_like int default '0';
alter table wd_user drop column user_home_page; 
alter table wd_user_auths drop column check_code; 
alter table wd_comment change comment_likes comment_likes int(11) default 0; 
alter table wd_user change user_sex user_sex int(1) default 0; 
alter table wd_comment change comment_content comment_content longtext; 
alter table wd_user_video change is_delete is_delete int default 0; 



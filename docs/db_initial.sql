-- MySQL dump 10.14  Distrib 5.5.59-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: get_better
-- ------------------------------------------------------
-- Server version	5.5.59-MariaDB-1ubuntu0.14.04.1

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
-- Table structure for table `tm_comment`
--

DROP TABLE IF EXISTS `tm_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `report_user_designation_weight_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled =1, disabled =0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'deleted = 1, not deleted = 0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_comment`
--

LOCK TABLES `tm_comment` WRITE;
/*!40000 ALTER TABLE `tm_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_master_performance_parameter`
--

DROP TABLE IF EXISTS `tm_master_performance_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_master_performance_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_master_performance_parameter`
--

LOCK TABLES `tm_master_performance_parameter` WRITE;
/*!40000 ALTER TABLE `tm_master_performance_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_master_performance_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_report`
--

DROP TABLE IF EXISTS `tm_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewer_user_id` int(11) NOT NULL,
  `reviewed_for_user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `review_status` enum('INPROGRESS','SUBMITTED') NOT NULL,
  `review_type` enum('OTHER','SELF') NOT NULL,
  `complete_score` int(11) NOT NULL,
  `aggregate_score` float(2,2) NOT NULL,
  `team_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled =1, disabled =0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'deleted = 1, not deleted = 0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_report`
--

LOCK TABLES `tm_report` WRITE;
/*!40000 ALTER TABLE `tm_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_report_user_designation_weight`
--

DROP TABLE IF EXISTS `tm_report_user_designation_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_report_user_designation_weight` (
  `report_id` int(11) NOT NULL,
  `score` float NOT NULL,
  `user_designation_weight_id` int(11) NOT NULL,
  `user_designation_actual_weight` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled =1, disabled =0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'deleted = 1, not deleted = 0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_report_user_designation_weight`
--

LOCK TABLES `tm_report_user_designation_weight` WRITE;
/*!40000 ALTER TABLE `tm_report_user_designation_weight` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_report_user_designation_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_team`
--

DROP TABLE IF EXISTS `tm_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `lead_user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled =1, disabled =0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'deleted = 1, not deleted = 0',
  `created_by` int(11) NOT NULL,
  ` created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_team`
--

LOCK TABLES `tm_team` WRITE;
/*!40000 ALTER TABLE `tm_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_user`
--

DROP TABLE IF EXISTS `tm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `mobile` varchar(32) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `employee_id` varchar(32) NOT NULL,
  `role_id` int(11) NOT NULL COMMENT 'Application Level Privileges',
  `user_designation_id` int(11) NOT NULL COMMENT 'Actual Designation Id',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`user_name`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_user`
--

LOCK TABLES `tm_user` WRITE;
/*!40000 ALTER TABLE `tm_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_user_designation`
--

DROP TABLE IF EXISTS `tm_user_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_user_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled =1, disabled =0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'deleted = 1, not deleted = 0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_user_designation`
--

LOCK TABLES `tm_user_designation` WRITE;
/*!40000 ALTER TABLE `tm_user_designation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_user_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_user_designation_weight`
--

DROP TABLE IF EXISTS `tm_user_designation_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_user_designation_weight` (
  `id` int(11) NOT NULL,
  `user_designation_id` int(11) NOT NULL,
  `master_performance_parameter_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled =1, disabled =0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'deleted = 1, not deleted = 0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_user_designation_weight`
--

LOCK TABLES `tm_user_designation_weight` WRITE;
/*!40000 ALTER TABLE `tm_user_designation_weight` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_user_designation_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_user_role`
--

DROP TABLE IF EXISTS `tm_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `privileges` blob NOT NULL COMMENT 'Privileges or permissions on application features for users',
  `status` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_user_role`
--

LOCK TABLES `tm_user_role` WRITE;
/*!40000 ALTER TABLE `tm_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_user_teams`
--

DROP TABLE IF EXISTS `tm_user_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_user_teams` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `user_team_designation_id` int(11) NOT NULL,
  `reports_to_user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled =1, disabled =0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'deleted = 1, not deleted = 0',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_user_teams`
--

LOCK TABLES `tm_user_teams` WRITE;
/*!40000 ALTER TABLE `tm_user_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_user_teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-28 16:35:49

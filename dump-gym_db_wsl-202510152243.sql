-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_db_wsl
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (1,'2025-09-16',1),(2,'2025-12-16',2),(3,'2025-08-29',3),(4,'2025-06-05',4),(5,'2025-02-26',5),(6,'2025-06-28',6),(7,'2025-12-25',7),(8,'2025-06-14',8),(9,'2025-04-21',9),(10,'2025-03-02',10),(11,'2025-12-02',11),(12,'2025-02-05',12),(13,'2025-09-22',13),(14,'2025-05-02',14),(15,'2025-07-01',15),(16,'2025-06-24',16),(17,'2025-11-27',17),(18,'2025-02-05',18),(19,'2025-10-06',19),(20,'2025-07-11',20),(21,'2025-05-04',21),(22,'2025-02-11',22),(23,'2025-07-23',23),(24,'2025-06-12',24),(25,'2025-07-22',25),(26,'2025-06-10',26),(27,'2025-07-12',27),(28,'2025-04-28',28),(29,'2025-01-11',29),(30,'2025-03-06',30),(31,'2025-10-20',31),(32,'2025-06-21',32),(33,'2025-12-13',33),(34,'2025-05-05',34),(35,'2025-11-07',35),(36,'2025-03-25',36),(37,'2025-08-03',37),(38,'2025-04-06',38),(39,'2025-07-17',39),(40,'2025-12-03',40),(41,'2025-12-24',41),(42,'2025-02-20',42),(43,'2025-10-01',43),(44,'2025-04-30',44),(45,'2025-05-24',45),(46,'2025-12-26',46),(47,'2025-09-30',47),(48,'2025-10-09',48),(49,'2025-08-17',49),(50,'2025-10-22',50),(51,'2025-02-28',51),(52,'2025-05-19',52),(53,'2025-06-01',53),(54,'2025-12-08',54),(55,'2025-06-10',55),(56,'2025-05-20',56),(57,'2025-08-08',57),(58,'2025-11-08',58),(59,'2025-06-20',59),(60,'2025-10-09',60),(61,'2025-06-14',1),(62,'2025-12-12',2),(63,'2025-05-18',3),(64,'2025-01-19',4),(65,'2025-02-12',5),(66,'2025-06-08',6),(67,'2025-10-29',7),(68,'2025-10-26',8),(69,'2025-08-13',9),(70,'2025-08-16',10),(71,'2025-04-08',11),(72,'2025-06-20',12),(73,'2025-07-14',13),(74,'2025-04-05',14),(75,'2025-09-14',15),(76,'2025-09-27',16),(77,'2025-08-02',17),(78,'2025-09-16',18),(79,'2025-10-14',19),(80,'2025-10-19',20),(81,'2025-08-22',21),(82,'2025-10-21',22),(83,'2025-02-07',23),(84,'2025-02-07',24),(85,'2025-03-16',25),(86,'2025-09-19',26),(87,'2025-12-19',27),(88,'2025-09-04',28),(89,'2025-06-26',29),(90,'2025-05-23',30),(91,'2025-07-03',31),(92,'2025-05-05',32),(93,'2025-03-13',33),(94,'2025-12-16',34),(95,'2025-03-16',35),(96,'2025-02-21',36),(97,'2025-02-04',37),(98,'2025-01-18',38),(99,'2025-12-14',39),(100,'2025-08-17',40),(101,'2025-04-08',41),(102,'2025-06-17',42),(103,'2025-06-28',43),(104,'2025-01-28',44),(105,'2025-11-29',45),(106,'2025-04-29',46),(107,'2025-11-23',47),(108,'2025-06-29',48),(109,'2025-10-11',49),(110,'2025-05-29',50),(111,'2025-09-17',51),(112,'2025-05-01',52),(113,'2025-07-10',53),(114,'2025-08-14',54),(115,'2025-07-10',55),(116,'2025-10-06',56),(117,'2025-03-29',57),(118,'2025-12-01',58),(119,'2025-11-11',59),(120,'2025-07-22',60);
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `muscle_group` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,'Push Up','Push up exercise','Chest'),(2,'Squat','Squat exercise','Legs'),(3,'Plank','Plank exercise','Core'),(4,'Lunge','Lunge exercise','Legs'),(5,'Bicep Curl','Bicep exercise','Arms'),(6,'Jumping Jacks','Cardio warmup','Full Body'),(7,'Push Up','Push up exercise','Chest'),(8,'Squat','Squat exercise','Legs'),(9,'Plank','Plank exercise','Core'),(10,'Lunge','Lunge exercise','Legs'),(11,'Bicep Curl','Bicep exercise','Arms'),(12,'Jumping Jacks','Cardio warmup','Full Body'),(13,'Burpees','Full body exercise','Full Body'),(14,'Sit Up','Abdominal exercise','Core'),(15,'Bench Press','Chest exercise','Chest'),(16,'Deadlift','Back and legs','Back'),(17,'Overhead Press','Shoulder exercise','Shoulders'),(18,'Tricep Dips','Tricep exercise','Arms'),(19,'Mountain Climbers','Cardio and core','Full Body'),(20,'Pull Up','Back and arms','Back'),(21,'Russian Twist','Oblique exercise','Core'),(22,'Leg Press','Legs exercise','Legs'),(23,'Calf Raise','Calf exercise','Legs'),(24,'Chest Fly','Chest isolation exercise','Chest'),(25,'Incline Bench Press','Chest exercise','Chest'),(26,'Front Raise','Shoulders exercise','Shoulders'),(27,'Hammer Curl','Bicep exercise','Arms'),(28,'Lat Pulldown','Back exercise','Back'),(29,'Seated Row','Back exercise','Back'),(30,'Glute Bridge','Glutes exercise','Legs'),(31,'Side Plank','Core and oblique','Core'),(32,'Cable Tricep Pushdown','Tricep exercise','Arms'),(33,'Dumbbell Shoulder Press','Shoulder exercise','Shoulders'),(34,'High Knees','Cardio exercise','Full Body'),(35,'Side Lunge','Legs exercise','Legs'),(36,'Reverse Crunch','Core exercise','Core'),(37,'Face Pull','Back and shoulders','Back'),(38,'Romanian Deadlift','Legs and back','Back'),(39,'Step Up','Legs exercise','Legs'),(40,'Dumbbell Fly','Chest exercise','Chest'),(41,'Concentration Curl','Bicep isolation','Arms'),(42,'Skater Jumps','Cardio exercise','Full Body'),(43,'Incline Dumbbell Press','Chest exercise','Chest'),(44,'Decline Bench Press','Chest exercise','Chest'),(45,'Arnold Press','Shoulders exercise','Shoulders'),(46,'Cable Row','Back exercise','Back'),(47,'Side Lateral Raise','Shoulders exercise','Shoulders'),(48,'Hip Thrust','Glutes exercise','Legs'),(49,'Donkey Kick','Glutes exercise','Legs'),(50,'Leg Curl','Legs exercise','Legs'),(51,'Leg Extension','Legs exercise','Legs'),(52,'Diamond Push Up','Chest and triceps','Chest'),(53,'Incline Push Up','Chest exercise','Chest'),(54,'Pull Over','Chest and back','Chest'),(55,'Decline Push Up','Chest exercise','Chest'),(56,'Good Morning','Back and hamstrings','Back'),(57,'Jump Squat','Legs and cardio','Legs'),(58,'Wall Sit','Legs endurance','Legs'),(59,'Forearm Plank','Core exercise','Core'),(60,'Medicine Ball Slam','Full body exercise','Full Body'),(61,'Battle Ropes','Full body cardio','Full Body'),(62,'TRX Row','Back and arms','Back'),(63,'TRX Push Up','Chest and arms','Chest'),(64,'Single Leg Deadlift','Legs and glutes','Legs'),(65,'Goblet Squat','Legs exercise','Legs'),(66,'Bulgarian Split Squat','Legs and glutes','Legs'),(67,'Chest Press Machine','Chest exercise','Chest'),(68,'Seated Shoulder Press','Shoulders exercise','Shoulders'),(69,'Incline Dumbbell Fly','Chest exercise','Chest'),(70,'Reverse Fly','Back and shoulders','Back'),(71,'Barbell Curl','Bicep exercise','Arms'),(72,'Dumbbell Kickback','Tricep exercise','Arms'),(73,'Lateral Lunge','Legs exercise','Legs'),(74,'Jump Rope','Cardio exercise','Full Body'),(75,'Step Mill','Cardio exercise','Full Body'),(76,'Mountain Climber Twist','Core exercise','Core'),(77,'Plank Shoulder Tap','Core and shoulders','Core'),(78,'Side Plank Hip Lift','Core exercise','Core'),(79,'Cable Chest Press','Chest exercise','Chest'),(80,'Cable Lateral Raise','Shoulders exercise','Shoulders'),(81,'Chest Dip','Chest and triceps','Chest'),(82,'Front Squat','Legs exercise','Legs'),(83,'Sumo Deadlift','Back and legs','Back'),(84,'Incline Cable Fly','Chest exercise','Chest'),(85,'Dumbbell Shrug','Shoulders exercise','Shoulders'),(86,'Kettlebell Swing','Full body exercise','Full Body'),(87,'Medicine Ball Throw','Full body exercise','Full Body'),(88,'Box Jump','Legs and cardio','Legs'),(89,'Reverse Lunge','Legs exercise','Legs'),(90,'Hip Abduction','Glutes exercise','Legs'),(91,'Hip Adduction','Glutes exercise','Legs'),(92,'Cable Crunch','Core exercise','Core'),(93,'Oblique Twist','Core exercise','Core'),(94,'Standing Calf Raise','Legs exercise','Legs'),(95,'Incline Hammer Curl','Bicep exercise','Arms'),(96,'Decline Tricep Extension','Tricep exercise','Arms'),(97,'Pull Up Assist','Back exercise','Back'),(98,'Chin Up','Back and arms','Back'),(99,'Farmer\'s Walk','Full body strength','Full Body'),(100,'Turkish Get Up','Full body exercise','Full Body'),(101,'Medicine Ball Russian Twist','Core exercise','Core'),(102,'Plank with Leg Lift','Core and glutes','Core'),(103,'Dumbbell Deadlift','Legs and back','Back'),(104,'Barbell Row','Back exercise','Back'),(105,'Front Raise Dumbbell','Shoulders exercise','Shoulders'),(106,'Incline Push Up with Clap','Chest exercise','Chest'),(107,'Weighted Step Up','Legs exercise','Legs'),(108,'Overhead Tricep Extension','Tricep exercise','Arms'),(109,'Reverse Grip Curl','Bicep exercise','Arms'),(110,'Lateral Band Walk','Glutes exercise','Legs'),(111,'Glute Kickback','Glutes exercise','Legs'),(112,'Diamond Sit Up','Core exercise','Core'),(113,'Medicine Ball Slam Twist','Full body exercise','Full Body'),(114,'Incline Dumbbell Curl','Bicep exercise','Arms'),(115,'Arnold Dumbbell Press','Shoulders exercise','Shoulders'),(116,'Cable Rope Hammer Curl','Bicep exercise','Arms'),(117,'Single Arm Row','Back exercise','Back'),(118,'Side Step Up','Legs exercise','Legs'),(119,'Kettlebell Goblet Squat','Legs exercise','Legs'),(120,'TRX Chest Press','Chest exercise','Chest');
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Jose Fernandez','jose1@gmail.com','3009998888','Calle 1'),(2,'Maria Lopez','maria2@gmail.com','3001000002','Calle 2'),(3,'Andres Gomez','andres3@gmail.com','3001000003','Calle 3'),(4,'Luisa Martinez','luisa4@gmail.com','3001000004','Calle 4'),(5,'Carlos Torres','carlos5@gmail.com','3001000005','Calle 5'),(6,'Ana Ramirez','ana6@gmail.com','3001000006','Calle 6'),(7,'Miguel Sanchez','miguel7@gmail.com','3001000007','Calle 7'),(8,'Sofia Diaz','sofia8@gmail.com','3001000008','Calle 8'),(9,'Luis Herrera','luis9@gmail.com','3001000009','Calle 9'),(10,'Camila Morales','camila10@gmail.com','3001000010','Calle 10'),(11,'Jorge Rojas','jorge11@gmail.com','3001000011','Calle 11'),(12,'Paula Castillo','paula12@gmail.com','3001000012','Calle 12'),(13,'Daniel Alvarez','daniel13@gmail.com','3001000013','Calle 13'),(14,'Valeria Sanchez','valeria14@gmail.com','3001000014','Calle 14'),(15,'Andres Molina','andres15@gmail.com','3001000015','Calle 15'),(16,'Carolina Herrera','carolina16@gmail.com','3001000016','Calle 16'),(17,'Diego Gomez','diego17@gmail.com','3001000017','Calle 17'),(18,'Laura Perez','laura18@gmail.com','3001000018','Calle 18'),(19,'Ricardo Diaz','ricardo19@gmail.com','3001000019','Calle 19'),(20,'Andrea Morales','andrea20@gmail.com','3001000020','Calle 20'),(21,'Felipe Torres','felipe21@gmail.com','3001000021','Calle 21'),(22,'Natalia Martinez','natalia22@gmail.com','3001000022','Calle 22'),(23,'Javier Ramirez','javier23@gmail.com','3001000023','Calle 23'),(24,'Karen Castillo','karen24@gmail.com','3001000024','Calle 24'),(25,'Esteban Alvarez','esteban25@gmail.com','3001000025','Calle 25'),(26,'Daniela Sanchez','daniela26@gmail.com','3001000026','Calle 26'),(27,'Mario Molina','mario27@gmail.com','3001000027','Calle 27'),(28,'Monica Herrera','monica28@gmail.com','3001000028','Calle 28'),(29,'Andres Diaz','andres29@gmail.com','3001000029','Calle 29'),(30,'Sofia Morales','sofia30@gmail.com','3001000030','Calle 30'),(31,'Juan Perez','juan31@gmail.com','3001000031','Calle 31'),(32,'Paula Lopez','paula32@gmail.com','3001000032','Calle 32'),(33,'Carlos Gomez','carlos33@gmail.com','3001000033','Calle 33'),(34,'Ana Martinez','ana34@gmail.com','3001000034','Calle 34'),(35,'Miguel Torres','miguel35@gmail.com','3001000035','Calle 35'),(36,'Sofia Ramirez','sofia36@gmail.com','3001000036','Calle 36'),(37,'Luis Fernandez','luis37@gmail.com','3001000037','Calle 37'),(38,'Camila Diaz','camila38@gmail.com','3001000038','Calle 38'),(39,'Jorge Morales','jorge39@gmail.com','3001000039','Calle 39'),(40,'Paula Perez','paula40@gmail.com','3001000040','Calle 40'),(41,'Daniel Gomez','daniel41@gmail.com','3001000041','Calle 41'),(42,'Valeria Martinez','valeria42@gmail.com','3001000042','Calle 42'),(43,'Andres Ramirez','andres43@gmail.com','3001000043','Calle 43'),(44,'Carolina Sanchez','carolina44@gmail.com','3001000044','Calle 44'),(45,'Diego Herrera','diego45@gmail.com','3001000045','Calle 45'),(46,'Laura Diaz','laura46@gmail.com','3001000046','Calle 46'),(47,'Ricardo Morales','ricardo47@gmail.com','3001000047','Calle 47'),(48,'Andrea Perez','andrea48@gmail.com','3001000048','Calle 48'),(49,'Felipe Lopez','felipe49@gmail.com','3001000049','Calle 49'),(50,'Natalia Gomez','natalia50@gmail.com','3001000050','Calle 50'),(51,'Javier Martinez','javier51@gmail.com','3001000051','Calle 51'),(52,'Karen Torres','karen52@gmail.com','3001000052','Calle 52'),(53,'Esteban Ramirez','esteban53@gmail.com','3001000053','Calle 53'),(54,'Daniela Herrera','daniela54@gmail.com','3001000054','Calle 54'),(55,'Mario Diaz','mario55@gmail.com','3001000055','Calle 55'),(56,'Monica Morales','monica56@gmail.com','3001000056','Calle 56'),(57,'Andres Perez','andres57@gmail.com','3001000057','Calle 57'),(58,'Sofia Lopez','sofia58@gmail.com','3001000058','Calle 58'),(59,'Juan Gomez','juan59@gmail.com','3001000059','Calle 59'),(60,'Paula Martinez','paula60@gmail.com','3001000060','Calle 60'),(61,'Ana Torres','ana.torres60@mail.com','3001000060','Calle 60'),(62,'Luis López','luis.lopez61@mail.com','3001000061','Calle 61'),(63,'Sofía Herrera','sofia.herrera62@mail.com','3001000062','Calle 62'),(64,'Andrés Rojas','andres.rojas63@mail.com','3001000063','Calle 63'),(65,'Valeria Castillo','valeria.castillo64@mail.com','3001000064','Calle 64'),(66,'Jorge Navarro','jorge.navarro65@mail.com','3001000065','Calle 65'),(67,'Camila Rivera','camila.rivera66@mail.com','3001000066','Calle 66'),(68,'Daniel Pineda','daniel.pineda67@mail.com','3001000067','Calle 67'),(69,'Laura Silva','laura.silva68@mail.com','3001000068','Calle 68'),(70,'Felipe Rojas','felipe.rojas69@mail.com','3001000069','Calle 69'),(71,'Paula Vargas','paula.vargas70@mail.com','3001000070','Calle 70'),(72,'Miguel Torres','miguel.torres71@mail.com','3001000071','Calle 71'),(73,'Natalia Herrera','natalia.herrera72@mail.com','3001000072','Calle 72'),(74,'Ricardo López','ricardo.lopez73@mail.com','3001000073','Calle 73'),(75,'Andrea Díaz','andrea.diaz74@mail.com','3001000074','Calle 74'),(76,'Esteban Gutiérrez','esteban.gutierrez75@mail.com','3001000075','Calle 75'),(77,'Carolina Sánchez','carolina.sanchez76@mail.com','3001000076','Calle 76'),(78,'Javier Ramírez','javier.ramirez77@mail.com','3001000077','Calle 77'),(79,'Daniela Torres','daniela.torres78@mail.com','3001000078','Calle 78'),(80,'Mario Rojas','mario.rojas79@mail.com','3001000079','Calle 79'),(81,'Lucía Morales','lucia.morales80@mail.com','3001000080','Calle 80'),(82,'Andrés Pérez','andres.perez81@mail.com','3001000081','Calle 81'),(83,'Camila Gómez','camila.gomez82@mail.com','3001000082','Calle 82'),(84,'Felipe Rodríguez','felipe.rodriguez83@mail.com','3001000083','Calle 83'),(85,'Valentina Jiménez','valentina.jimenez84@mail.com','3001000084','Calle 84'),(86,'Juan Vargas','juan.vargas85@mail.com','3001000085','Calle 85'),(87,'María Cárdenas','maria.cardenas86@mail.com','3001000086','Calle 86'),(88,'Carlos Morales','carlos.morales87@mail.com','3001000087','Calle 87'),(89,'Ana Fernández','ana.fernandez88@mail.com','3001000088','Calle 88'),(90,'Luis Rojas','luis.rojas89@mail.com','3001000089','Calle 89'),(91,'Sofía Gutiérrez','sofia.gutierrez90@mail.com','3001000090','Calle 90'),(92,'Andrés Torres','andres.torres91@mail.com','3001000091','Calle 91'),(93,'Valeria López','valeria.lopez92@mail.com','3001000092','Calle 92'),(94,'Jorge Díaz','jorge.diaz93@mail.com','3001000093','Calle 93'),(95,'Camila Sánchez','camila.sanchez94@mail.com','3001000094','Calle 94'),(96,'Daniel Rojas','daniel.rojas95@mail.com','3001000095','Calle 95'),(97,'Laura Herrera','laura.herrera96@mail.com','3001000096','Calle 96'),(98,'Felipe Álvarez','felipe.alvarez97@mail.com','3001000097','Calle 97'),(99,'Paula Morales','paula.morales98@mail.com','3001000098','Calle 98'),(100,'Miguel Jiménez','miguel.jimenez99@mail.com','3001000099','Calle 99'),(101,'Natalia Vargas','natalia.vargas100@mail.com','3001000100','Calle 102'),(102,'Carlos Ruiz','carlos@gym.com','3001002001','Calle 1');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `ai_members_audit` AFTER INSERT ON `members` FOR EACH ROW BEGIN
  SET @from_members_trigger = 1;

  INSERT INTO members_audit (member_id, actionMember, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'name', NEW.name,
      'email', NEW.email,
      'phone', NEW.phone,
      'address', NEW.address
    )
  );

  SET @from_members_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `au_members_audit` AFTER UPDATE ON `members` FOR EACH ROW BEGIN
  SET @from_members_trigger = 1;

  INSERT INTO members_audit (member_id, actionMember, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'name', OLD.name,
      'email', OLD.email,
      'phone', OLD.phone,
      'address', OLD.address
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'name', NEW.name,
      'email', NEW.email,
      'phone', NEW.phone,
      'address', NEW.address
    )
  );

  SET @from_members_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `ad_members_audit` AFTER DELETE ON `members` FOR EACH ROW BEGIN
  SET @from_members_trigger = 1;

  INSERT INTO members_audit (member_id, actionMember, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'name', OLD.name,
      'email', OLD.email,
      'phone', OLD.phone,
      'address', OLD.address
    ),
    NULL
  );

  SET @from_members_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `members_audit`
--

DROP TABLE IF EXISTS `members_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  `actionMember` enum('UPDATE','DELETE','INSERT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_audit`
--

LOCK TABLES `members_audit` WRITE;
/*!40000 ALTER TABLE `members_audit` DISABLE KEYS */;
INSERT INTO `members_audit` VALUES (1,101,'UPDATE','2025-10-16 03:17:38','Admin','{\"id\": 101, \"name\": \"Natalia Vargas\", \"email\": \"natalia.vargas100@mail.com\", \"phone\": \"3001000100\", \"address\": \"Calle 100\"}','{\"id\": 101, \"name\": \"Natalia Vargas\", \"email\": \"natalia.vargas100@mail.com\", \"phone\": \"3001000100\", \"address\": \"Calle 102\"}'),(2,102,'INSERT','2025-10-16 03:20:43','Admin',NULL,'{\"id\": 102, \"name\": \"Carlos Ruiz\", \"email\": \"carlos@gym.com\", \"phone\": \"3001002001\", \"address\": \"Calle 1\"}'),(3,103,'INSERT','2025-10-16 03:20:43','Admin',NULL,'{\"id\": 103, \"name\": \"Ana Torres\", \"email\": \"ana@gym.com\", \"phone\": \"3001002002\", \"address\": \"Calle 2\"}'),(4,103,'DELETE','2025-10-16 03:22:54','Admin','{\"id\": 103, \"name\": \"Ana Torres\", \"email\": \"ana@gym.com\", \"phone\": \"3001002002\", \"address\": \"Calle 2\"}',NULL),(5,1,'UPDATE','2025-10-16 03:31:49','Admin','{\"id\": 1, \"name\": \"Jose Fernandez\", \"email\": \"jose1@gmail.com\", \"phone\": \"3001000001\", \"address\": \"Calle 1\"}','{\"id\": 1, \"name\": \"Jose Fernandez\", \"email\": \"jose1@gmail.com\", \"phone\": \"3009998888\", \"address\": \"Calle 1\"}');
/*!40000 ALTER TABLE `members_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `bii_members_audit_guard_insert` BEFORE INSERT ON `members_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_members_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'INSERT en members_audit solo permitido desde triggers de members.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `biu_members_audit_block_update` BEFORE UPDATE ON `members_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'members_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `bid_members_audit_block_delete` BEFORE DELETE ON `members_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'members_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `member_id` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `plan_id` (`plan_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `memberships_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `memberships_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `memberships_ibfk_3` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (61,'2025-06-16','2025-07-16',1,3,1),(62,'2025-03-08','2025-06-11',2,1,2),(63,'2025-04-14','2025-11-10',3,1,5),(64,'2025-03-06','2025-05-23',4,1,1),(65,'2025-09-22','2025-03-28',5,2,3),(66,'2025-12-05','2026-01-30',6,1,1),(67,'2025-08-19','2025-02-02',7,1,4),(68,'2025-10-27','2025-04-05',8,2,3),(69,'2025-09-01','2025-08-26',9,3,3),(70,'2025-01-26','2025-11-12',10,3,1),(71,'2025-10-14','2025-06-21',11,2,4),(72,'2025-12-10','2025-07-30',12,2,4),(73,'2025-10-22','2025-11-16',13,2,2),(74,'2025-12-23','2026-01-06',14,3,5),(75,'2025-12-22','2025-06-17',15,3,4),(76,'2025-06-22','2025-06-07',16,1,3),(77,'2025-12-29','2025-04-06',17,3,1),(78,'2025-06-06','2025-02-13',18,3,2),(79,'2025-03-26','2026-01-29',19,1,3),(80,'2025-04-25','2025-05-08',20,2,2),(81,'2025-10-19','2025-06-24',21,2,4),(82,'2025-10-10','2025-11-06',22,2,2),(83,'2025-10-05','2025-02-09',23,3,1),(84,'2025-04-14','2026-01-02',24,3,1),(85,'2025-11-21','2025-06-06',25,1,2),(86,'2025-02-04','2025-10-19',26,1,2),(87,'2025-10-04','2025-11-18',27,3,2),(88,'2025-12-09','2025-02-09',28,1,3),(89,'2025-07-02','2025-02-14',29,3,2),(90,'2025-10-20','2025-12-14',30,3,1),(91,'2025-08-29','2025-01-31',31,1,1),(92,'2025-08-20','2025-10-25',32,3,4),(93,'2025-12-09','2025-10-28',33,3,2),(94,'2025-07-25','2025-02-26',34,2,1),(95,'2025-07-24','2025-07-21',35,2,5),(96,'2025-07-23','2025-02-23',36,2,1),(97,'2025-02-27','2025-10-29',37,1,5),(98,'2025-02-13','2025-10-10',38,1,3),(99,'2025-11-28','2025-04-17',39,1,5),(100,'2025-01-04','2025-02-22',40,1,1),(101,'2025-02-01','2025-12-19',41,1,1),(102,'2025-05-17','2025-06-07',42,2,1),(103,'2025-06-13','2025-02-18',43,3,3),(104,'2025-04-15','2025-04-19',44,1,3),(105,'2025-07-17','2025-06-23',45,2,3),(106,'2025-08-29','2025-10-06',46,2,1),(107,'2025-02-28','2025-08-16',47,1,3),(108,'2025-10-16','2025-07-23',48,1,4),(109,'2025-01-14','2025-06-06',49,2,1),(110,'2025-07-03','2025-05-17',50,3,5),(111,'2025-07-31','2025-04-25',51,2,3),(112,'2025-10-20','2025-11-05',52,2,4),(113,'2025-07-27','2025-08-27',53,1,1),(114,'2025-08-07','2026-01-23',54,1,3),(115,'2025-05-25','2025-06-17',55,3,2),(116,'2025-07-25','2025-12-02',56,2,5),(117,'2025-05-11','2025-12-19',57,2,1),(118,'2025-05-12','2025-08-21',58,3,5),(119,'2025-01-20','2025-11-08',59,3,2),(120,'2025-12-07','2025-02-10',60,2,4),(121,'2025-05-05','2025-09-30',61,1,3),(122,'2025-08-27','2025-10-27',62,3,3),(123,'2025-12-06','2025-06-20',63,1,3),(124,'2025-03-22','2025-08-09',64,3,1),(125,'2025-02-08','2026-01-13',65,2,2),(126,'2025-07-10','2025-07-29',66,3,5),(127,'2025-04-03','2025-05-25',67,3,1),(128,'2025-01-13','2025-12-25',68,2,2),(129,'2025-03-12','2025-03-21',69,1,1),(130,'2025-02-18','2025-06-30',70,2,1),(131,'2025-05-20','2025-10-11',71,1,3),(132,'2025-08-30','2025-10-25',72,3,1),(133,'2025-12-11','2025-03-19',73,3,4),(134,'2025-01-25','2025-04-20',74,3,5),(135,'2025-05-25','2025-08-14',75,2,5),(136,'2025-08-09','2025-08-31',76,1,4),(137,'2025-08-24','2025-12-06',77,1,5),(138,'2025-11-18','2025-08-13',78,1,3),(139,'2025-06-17','2025-11-11',79,2,2),(140,'2025-09-28','2026-01-04',80,2,2),(141,'2025-02-16','2025-11-28',81,3,2),(142,'2025-12-16','2025-03-01',82,2,2),(143,'2025-05-09','2025-09-08',83,3,1),(144,'2025-04-02','2025-03-29',84,1,4),(145,'2025-07-11','2025-07-06',85,2,3),(146,'2025-03-18','2025-05-16',86,3,2),(147,'2025-08-02','2025-05-24',87,3,1),(148,'2025-12-07','2025-07-18',88,2,1),(149,'2025-04-22','2025-02-08',89,1,5),(150,'2025-02-07','2025-10-09',90,1,4),(151,'2025-08-24','2025-06-22',91,1,5),(152,'2025-07-20','2026-01-24',92,1,2),(153,'2025-02-10','2025-06-30',93,3,2),(154,'2025-09-13','2025-06-20',94,3,5),(155,'2025-04-15','2025-09-01',95,1,3),(156,'2025-09-01','2025-09-15',96,1,4),(157,'2025-01-16','2025-04-12',97,3,4),(158,'2025-09-10','2025-08-09',98,2,1),(159,'2025-12-13','2025-07-01',99,1,5),(160,'2025-09-21','2026-01-22',100,3,4),(161,'2025-02-04','2025-08-12',101,2,2);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `membership_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `membership_id` (`membership_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,50.00,'2025-02-20',62),(3,50.00,'2025-04-25',64),(4,50.00,'2025-09-23',66),(5,50.00,'2025-09-10',67),(6,50.00,'2025-04-15',76),(7,50.00,'2025-05-08',79),(8,50.00,'2025-11-23',85),(9,50.00,'2025-06-05',86),(10,50.00,'2025-06-12',88),(11,50.00,'2025-12-11',91),(12,50.00,'2025-05-21',97),(13,50.00,'2025-02-05',98),(14,50.00,'2025-05-02',99),(15,50.00,'2025-05-17',100),(16,50.00,'2025-11-14',101),(17,50.00,'2025-03-26',104),(18,50.00,'2025-07-19',107),(19,50.00,'2025-01-12',108),(20,50.00,'2025-07-09',113),(21,50.00,'2025-07-05',114),(22,50.00,'2025-12-25',121),(23,50.00,'2025-05-19',123),(24,50.00,'2025-12-16',129),(25,50.00,'2025-08-24',131),(26,50.00,'2025-05-10',136),(27,50.00,'2025-11-05',137),(28,50.00,'2025-02-25',138),(29,50.00,'2025-03-24',144),(30,50.00,'2025-09-06',149),(31,50.00,'2025-09-20',150),(32,50.00,'2025-07-22',151),(33,50.00,'2025-08-14',152),(34,50.00,'2025-06-04',155),(35,50.00,'2025-04-07',156),(36,50.00,'2025-01-19',159),(37,80.00,'2025-06-19',65),(38,80.00,'2025-03-03',68),(39,80.00,'2025-06-15',71),(40,80.00,'2025-10-05',72),(41,80.00,'2025-06-11',73),(42,80.00,'2025-12-08',80),(43,80.00,'2025-05-06',81),(44,80.00,'2025-11-30',82),(45,80.00,'2025-07-17',94),(46,80.00,'2025-12-16',95),(47,80.00,'2025-03-03',96),(48,80.00,'2025-12-19',102),(49,80.00,'2025-04-28',105),(50,50.00,'2025-09-17',106),(51,80.00,'2025-08-03',109),(52,80.00,'2025-10-23',111),(53,80.00,'2025-04-15',112),(54,80.00,'2025-12-31',116),(55,80.00,'2025-02-18',117),(56,80.00,'2025-09-03',120),(57,80.00,'2025-12-19',125),(58,80.00,'2025-10-22',128),(59,80.00,'2025-02-22',130),(60,80.00,'2025-04-18',135),(61,80.00,'2025-01-15',139),(62,80.00,'2025-04-25',140),(63,80.00,'2025-06-15',142),(64,80.00,'2025-04-27',145),(65,80.00,'2025-03-29',148),(66,80.00,'2025-03-31',158),(67,80.00,'2025-07-03',161),(68,120.00,'2025-10-11',61),(69,120.00,'2025-05-17',69),(70,120.00,'2025-07-17',70),(71,120.00,'2025-08-01',74),(72,120.00,'2025-04-16',75),(73,120.00,'2025-09-12',77),(74,120.00,'2025-08-13',78),(75,120.00,'2025-12-27',83),(76,120.00,'2025-02-01',84),(77,120.00,'2025-06-24',87),(78,120.00,'2025-02-15',89),(79,120.00,'2025-03-11',90),(80,120.00,'2025-07-31',92),(81,120.00,'2025-05-01',93),(82,120.00,'2025-11-29',103),(83,120.00,'2025-07-27',110),(84,120.00,'2025-02-08',115),(85,120.00,'2025-10-30',118),(86,120.00,'2025-10-26',119),(87,120.00,'2025-08-09',122),(88,120.00,'2025-07-31',124),(89,120.00,'2025-01-31',126),(90,120.00,'2025-09-03',127),(91,120.00,'2025-02-10',132),(92,120.00,'2025-07-14',133),(93,120.00,'2025-05-05',134),(94,120.00,'2025-02-06',141),(95,120.00,'2025-06-24',143),(96,120.00,'2025-02-04',146),(97,120.00,'2025-01-14',147),(98,120.00,'2025-11-26',153),(99,120.00,'2025-05-29',154),(100,120.00,'2025-04-27',157),(101,120.00,'2025-05-17',160);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `ai_payments_audit` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;

  INSERT INTO payments_audit (payment_id, actionPay, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'amount', NEW.amount,
      'payment_date', NEW.payment_date,
      'membership_id', NEW.membership_id
    )
  );

  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `au_payments_audit` AFTER UPDATE ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;

  INSERT INTO payments_audit (payment_id, actionPay, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'amount', OLD.amount,
      'payment_date', OLD.payment_date,
      'membership_id', OLD.membership_id
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'amount', NEW.amount,
      'payment_date', NEW.payment_date,
      'membership_id', NEW.membership_id
    )
  );

  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `ad_payments_audit` AFTER DELETE ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;

  INSERT INTO payments_audit (payment_id, actionPay, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'amount', OLD.amount,
      'payment_date', OLD.payment_date,
      'membership_id', OLD.membership_id
    ),
    NULL
  );

  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments_audit`
--

DROP TABLE IF EXISTS `payments_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int DEFAULT NULL,
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actionPay` enum('INSERT','UPDATE','DELETE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INSERT',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_audit`
--

LOCK TABLES `payments_audit` WRITE;
/*!40000 ALTER TABLE `payments_audit` DISABLE KEYS */;
INSERT INTO `payments_audit` VALUES (1,50,'{\"id\": 50, \"amount\": 80.00, \"payment_date\": \"2025-09-17\", \"membership_id\": 106}','{\"id\": 50, \"amount\": 50.00, \"payment_date\": \"2025-09-17\", \"membership_id\": 106}','2025-10-16 03:31:02','UPDATE'),(2,2,'{\"id\": 2, \"amount\": 50.00, \"payment_date\": \"2025-12-12\", \"membership_id\": 63}','{\"id\": 2, \"amount\": 50.00, \"payment_date\": \"2025-10-20\", \"membership_id\": 63}','2025-10-16 03:36:20','UPDATE'),(3,87,'{\"id\": 87, \"amount\": 120.00, \"payment_date\": \"2025-08-10\", \"membership_id\": 122}','{\"id\": 87, \"amount\": 120.00, \"payment_date\": \"2025-08-09\", \"membership_id\": 122}','2025-10-16 03:38:02','UPDATE'),(4,2,'{\"id\": 2, \"amount\": 50.00, \"payment_date\": \"2025-10-20\", \"membership_id\": 63}',NULL,'2025-10-16 03:39:39','DELETE');
/*!40000 ALTER TABLE `payments_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `bii_payments_audit_guard_insert` BEFORE INSERT ON `payments_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_payments_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'INSERT en payments_audit solo permitido desde triggers de payments.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `biu_payments_audit_block_update` BEFORE UPDATE ON `payments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'payments_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jose`@`%`*/ /*!50003 TRIGGER `bid_payments_audit_block_delete` BEFORE DELETE ON `payments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'payments_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Basic','Acceso al gimnasio 3 veces por semana',50.00),(2,'Standard','Acceso ilimitado al gimnasio',80.00),(3,'Premium','Acceso ilimitado + clases grupales',120.00);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine_exercises`
--

DROP TABLE IF EXISTS `routine_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routine_exercises` (
  `routine_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  PRIMARY KEY (`routine_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `routine_exercises_ibfk_1` FOREIGN KEY (`routine_id`) REFERENCES `routines` (`id`),
  CONSTRAINT `routine_exercises_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_exercises`
--

LOCK TABLES `routine_exercises` WRITE;
/*!40000 ALTER TABLE `routine_exercises` DISABLE KEYS */;
INSERT INTO `routine_exercises` VALUES (2,1),(6,1),(9,1),(10,1),(12,1),(13,1),(15,1),(17,1),(18,1),(20,1),(22,1),(25,1),(29,1),(30,1),(31,1),(35,1),(36,1),(37,1),(38,1),(2,2),(4,2),(7,2),(11,2),(12,2),(13,2),(16,2),(18,2),(19,2),(20,2),(21,2),(23,2),(24,2),(25,2),(26,2),(27,2),(30,2),(31,2),(33,2),(39,2),(40,2),(7,3),(10,3),(13,3),(17,3),(21,3),(23,3),(24,3),(25,3),(26,3),(30,3),(32,3),(33,3),(35,3),(39,3),(1,4),(3,4),(5,4),(7,4),(8,4),(10,4),(13,4),(14,4),(16,4),(18,4),(19,4),(20,4),(21,4),(23,4),(32,4),(33,4),(34,4),(35,4),(39,4),(1,5),(4,5),(5,5),(6,5),(8,5),(10,5),(11,5),(14,5),(15,5),(16,5),(19,5),(25,5),(27,5),(29,5),(30,5),(31,5),(33,5),(34,5),(37,5),(38,5),(40,5),(2,6),(3,6),(4,6),(6,6),(8,6),(10,6),(12,6),(13,6),(14,6),(15,6),(20,6),(21,6),(24,6),(25,6),(26,6),(27,6),(30,6),(33,6),(35,6),(37,6),(38,6),(40,6),(2,7),(4,7),(5,7),(6,7),(9,7),(11,7),(14,7),(18,7),(20,7),(23,7),(24,7),(27,7),(28,7),(34,7),(35,7),(41,7),(2,8),(3,8),(8,8),(9,8),(11,8),(12,8),(14,8),(15,8),(17,8),(21,8),(23,8),(24,8),(26,8),(27,8),(32,8),(33,8),(34,8),(36,8),(37,8),(38,8),(40,8),(41,8),(1,9),(4,9),(5,9),(6,9),(7,9),(9,9),(11,9),(13,9),(15,9),(16,9),(17,9),(19,9),(20,9),(21,9),(22,9),(23,9),(26,9),(27,9),(32,9),(33,9),(35,9),(36,9),(38,9),(40,9),(41,9),(1,10),(3,10),(6,10),(9,10),(11,10),(12,10),(13,10),(16,10),(17,10),(24,10),(27,10),(28,10),(29,10),(30,10),(34,10),(35,10),(36,10),(37,10),(38,10),(40,10),(41,10);
/*!40000 ALTER TABLE `routine_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routines`
--

DROP TABLE IF EXISTS `routines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `routines_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `routines_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routines`
--

LOCK TABLES `routines` WRITE;
/*!40000 ALTER TABLE `routines` DISABLE KEYS */;
INSERT INTO `routines` VALUES (1,'Routine 102','Strength focus',1,1),(2,'Routine 103','Cardio focus',2,2),(3,'Routine 104','Full body',3,3),(4,'Routine 1','Custom routine',1,5),(5,'Routine 2','Custom routine',2,3),(6,'Routine 3','Custom routine',3,3),(7,'Routine 4','Custom routine',4,1),(8,'Routine 5','Custom routine',5,5),(9,'Routine 6','Custom routine',6,1),(10,'Routine 7','Custom routine',7,2),(11,'Routine 8','Custom routine',8,1),(12,'Routine 9','Custom routine',9,4),(13,'Routine 10','Custom routine',10,4),(14,'Routine 11','Custom routine',11,2),(15,'Routine 12','Custom routine',12,1),(16,'Routine 13','Custom routine',13,5),(17,'Routine 14','Custom routine',14,3),(18,'Routine 15','Custom routine',15,1),(19,'Routine 16','Custom routine',16,2),(20,'Routine 17','Custom routine',17,5),(21,'Routine 18','Custom routine',18,1),(22,'Routine 19','Custom routine',19,2),(23,'Routine 20','Custom routine',20,1),(24,'Routine 21','Custom routine',21,4),(25,'Routine 22','Custom routine',22,3),(26,'Routine 23','Custom routine',23,5),(27,'Routine 24','Custom routine',24,1),(28,'Routine 25','Custom routine',25,1),(29,'Routine 26','Custom routine',26,3),(30,'Routine 27','Custom routine',27,5),(31,'Routine 28','Custom routine',28,5),(32,'Routine 29','Custom routine',29,5),(33,'Routine 30','Custom routine',30,1),(34,'Routine 31','Custom routine',31,2),(35,'Routine 32','Custom routine',32,1),(36,'Routine 33','Custom routine',33,5),(37,'Routine 34','Custom routine',34,5),(38,'Routine 35','Custom routine',35,2),(39,'Routine 36','Custom routine',36,5),(40,'Routine 37','Custom routine',37,1),(41,'Routine 38','Custom routine',38,1),(42,'Routine 39','Custom routine',39,2),(43,'Routine 40','Custom routine',40,1),(44,'Routine 41','Custom routine',41,4),(45,'Routine 42','Custom routine',42,2),(46,'Routine 43','Custom routine',43,3),(47,'Routine 44','Custom routine',44,4),(48,'Routine 45','Custom routine',45,2),(49,'Routine 46','Custom routine',46,5),(50,'Routine 47','Custom routine',47,2),(51,'Routine 48','Custom routine',48,1),(52,'Routine 49','Custom routine',49,5),(53,'Routine 50','Custom routine',50,2),(54,'Routine 51','Custom routine',51,5),(55,'Routine 52','Custom routine',52,2),(56,'Routine 53','Custom routine',53,5),(57,'Routine 54','Custom routine',54,3),(58,'Routine 55','Custom routine',55,5),(59,'Routine 56','Custom routine',56,2),(60,'Routine 57','Custom routine',57,3),(61,'Routine 58','Custom routine',58,5),(62,'Routine 59','Custom routine',59,3),(63,'Routine 60','Custom routine',60,2),(64,'Routine 61','Custom routine',61,1),(65,'Routine 62','Custom routine',62,2),(66,'Routine 63','Custom routine',63,5),(67,'Routine 64','Custom routine',64,5),(68,'Routine 65','Custom routine',65,3),(69,'Routine 66','Custom routine',66,2),(70,'Routine 67','Custom routine',67,2),(71,'Routine 68','Custom routine',68,2),(72,'Routine 69','Custom routine',69,1),(73,'Routine 70','Custom routine',70,3),(74,'Routine 71','Custom routine',71,2),(75,'Routine 72','Custom routine',72,1),(76,'Routine 73','Custom routine',73,4),(77,'Routine 74','Custom routine',74,2),(78,'Routine 75','Custom routine',75,2),(79,'Routine 76','Custom routine',76,3),(80,'Routine 77','Custom routine',77,5),(81,'Routine 78','Custom routine',78,1),(82,'Routine 79','Custom routine',79,2),(83,'Routine 80','Custom routine',80,3),(84,'Routine 81','Custom routine',81,3),(85,'Routine 82','Custom routine',82,4),(86,'Routine 83','Custom routine',83,3),(87,'Routine 84','Custom routine',84,1),(88,'Routine 85','Custom routine',85,1),(89,'Routine 86','Custom routine',86,1),(90,'Routine 87','Custom routine',87,4),(91,'Routine 88','Custom routine',88,4),(92,'Routine 89','Custom routine',89,2),(93,'Routine 90','Custom routine',90,4),(94,'Routine 91','Custom routine',91,4),(95,'Routine 92','Custom routine',92,3),(96,'Routine 93','Custom routine',93,1),(97,'Routine 94','Custom routine',94,1),(98,'Routine 95','Custom routine',95,1),(99,'Routine 96','Custom routine',96,1),(100,'Routine 97','Custom routine',97,1),(101,'Routine 98','Custom routine',98,5),(102,'Routine 99','Custom routine',99,5),(103,'Routine 100','Custom routine',100,3),(104,'Routine 101','Custom routine',101,1);
/*!40000 ALTER TABLE `routines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialty` char(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Carlos Perez','Strength Training'),(2,'Ana Gomez','Cardio'),(3,'Luis Martinez','Yoga'),(4,'Sofia Ramirez','Pilates'),(5,'Juan Torres','Crossfit'),(6,'Carlos Perez','Strength Training'),(7,'Ana Gomez','Cardio'),(8,'Luis Martinez','Yoga'),(9,'Sofia Ramirez','Pilates'),(10,'Juan Torres','Crossfit'),(11,'Mariana Lopez','HIIT'),(12,'Daniel Ramirez','Functional Training'),(13,'Laura Fernandez','Zumba'),(14,'Andres Morales','Calisthenics'),(15,'Valeria Herrera','Aerobics'),(16,'Jorge Sanchez','Strength Training'),(17,'Camila Diaz','Cardio'),(18,'Felipe Rojas','Yoga'),(19,'Carolina Torres','Pilates'),(20,'Miguel Alvarez','Crossfit'),(21,'Natalia Gutierrez','HIIT'),(22,'Ricardo Mendoza','Functional Training'),(23,'Paula Ruiz','Zumba'),(24,'Esteban Morales','Calisthenics'),(25,'Andrea Castillo','Aerobics'),(26,'Juan Gomez','Strength Training'),(27,'Sofia Vargas','Cardio'),(28,'Andres Perez','Yoga'),(29,'Maria Morales','Pilates'),(30,'Carlos Rojas','Crossfit'),(31,'Daniela Sanchez','HIIT'),(32,'Luis Torres','Functional Training'),(33,'Camila Ramirez','Zumba'),(34,'Felipe Herrera','Calisthenics'),(35,'Laura Alvarez','Aerobics'),(36,'Ricardo Lopez','Strength Training'),(37,'Valeria Gomez','Cardio'),(38,'Miguel Torres','Yoga'),(39,'Carolina Rojas','Pilates'),(40,'Andres Martinez','Crossfit'),(41,'Paula Gutierrez','HIIT'),(42,'Jorge Ramirez','Functional Training'),(43,'Natalia Ruiz','Zumba'),(44,'Daniel Morales','Calisthenics'),(45,'Andrea Vargas','Aerobics'),(46,'Juan Herrera','Strength Training'),(47,'Sofia Perez','Cardio'),(48,'Luis Morales','Yoga'),(49,'Camila Torres','Pilates'),(50,'Felipe Ramirez','Crossfit'),(51,'Laura Sanchez','HIIT'),(52,'Carlos Gutierrez','Functional Training'),(53,'Valeria Rojas','Zumba'),(54,'Miguel Morales','Calisthenics'),(55,'Daniela Alvarez','Aerobics'),(56,'Ricardo Torres','Strength Training'),(57,'Carolina Gomez','Cardio'),(58,'Andres Herrera','Yoga'),(59,'Paula Lopez','Pilates'),(60,'Jorge Torres','Crossfit'),(61,'Natalia Alvarez','HIIT'),(62,'Luis Gutierrez','Functional Training'),(63,'Camila Morales','Zumba'),(64,'Felipe Perez','Calisthenics'),(65,'Laura Gomez','Aerobics'),(66,'Ricardo Martinez','Strength Training'),(67,'Valeria Morales','Cardio'),(68,'Miguel Herrera','Yoga'),(69,'Carolina Perez','Pilates'),(70,'Andres Gomez','Crossfit'),(71,'Paula Torres','HIIT'),(72,'Jorge Martinez','Functional Training'),(73,'Natalia Lopez','Zumba'),(74,'Daniel Morales','Calisthenics'),(75,'Andrea Gomez','Aerobics'),(76,'Juan Torres','Strength Training'),(77,'Sofia Morales','Cardio'),(78,'Luis Gomez','Yoga'),(79,'Camila Herrera','Pilates'),(80,'Felipe Morales','Crossfit'),(81,'Laura Torres','HIIT'),(82,'Carlos Morales','Functional Training'),(83,'Valeria Torres','Zumba'),(84,'Miguel Gomez','Calisthenics'),(85,'Daniela Torres','Aerobics'),(86,'Ricardo Morales','Strength Training'),(87,'Carolina Torres','Cardio'),(88,'Andres Morales','Yoga'),(89,'Paula Morales','Pilates'),(90,'Jorge Morales','Crossfit'),(91,'Natalia Morales','HIIT'),(92,'Luis Morales','Functional Training'),(93,'Camila Morales','Zumba'),(94,'Felipe Morales','Calisthenics'),(95,'Laura Morales','Aerobics'),(96,'Ricardo Morales','Strength Training'),(97,'Valeria Morales','Cardio'),(98,'Miguel Morales','Yoga'),(99,'Carolina Morales','Pilates'),(100,'Andres Morales','Crossfit'),(101,'Paula Morales','HIIT'),(102,'Jorge Morales','Functional Training'),(103,'Natalia Morales','Zumba'),(104,'Daniel Morales','Calisthenics'),(105,'Andrea Morales','Aerobics');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gym_db_wsl'
--
/*!50003 DROP PROCEDURE IF EXISTS `range_pay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `range_pay`(
    IN fechaI DATE,
    IN fechaF DATE
)
BEGIN
    SELECT 
        m.id AS member_id,
        m.name AS member_name,
        m.email,
        pay.id AS payment_id,
        pay.amount,
        pay.payment_date
    FROM payments AS pay
    JOIN memberships AS ms ON pay.membership_id = ms.id
    JOIN members AS m ON ms.member_id = m.id
    WHERE pay.payment_date BETWEEN fechaI AND fechaF
    ORDER BY pay.payment_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 22:43:18

CREATE DATABASE  IF NOT EXISTS `CarSparePartsModel` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `CarSparePartsModel`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: CarSparePartsModel
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address_types`
--

DROP TABLE IF EXISTS `address_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_types` (
  `address_type_id` int NOT NULL AUTO_INCREMENT,
  `address_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`address_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_types`
--

LOCK TABLES `address_types` WRITE;
/*!40000 ALTER TABLE `address_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_type_id` int NOT NULL,
  `company_id` int NOT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `zipcode` varchar(15) NOT NULL,
  `city_name` varchar(60) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_addresses_address_types1_idx` (`address_type_id`),
  KEY `fk_addresses_companies1_idx` (`company_id`),
  CONSTRAINT `fk_addresses_address_types1` FOREIGN KEY (`address_type_id`) REFERENCES `address_types` (`address_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_orders`
--

DROP TABLE IF EXISTS `auto_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `product_number` int NOT NULL,
  `store_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `ordered_quantity` int NOT NULL,
  `price_each` decimal(10,0) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_auto_orders_spare_parts_in_stores1_idx` (`product_number`,`store_id`),
  KEY `fk_auto_orders_suppliers1_idx` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_orders`
--

LOCK TABLES `auto_orders` WRITE;
/*!40000 ALTER TABLE `auto_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_models`
--

DROP TABLE IF EXISTS `car_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_models` (
  `car_model_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `year` varchar(4) NOT NULL,
  PRIMARY KEY (`car_model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_models`
--

LOCK TABLES `car_models` WRITE;
/*!40000 ALTER TABLE `car_models` DISABLE KEYS */;
INSERT INTO `car_models` VALUES (1,'Fisker','Avancier','2006'),(2,'Jeep','Vue','2003'),(3,'Ferrari','Laviolette','1977'),(4,'Maserati','Vue','1984'),(5,'Abarth','Lagonda','2015'),(6,'Smart','Berlinetta','1996'),(7,'McLaren','Prefect','2003'),(8,'Rover','Rondo','1996'),(9,'Lada','Jetta','1978'),(10,'Mitsubishi','Silver Spirit','2009'),(11,'Abarth','Colorado','1987'),(12,'Daewoo','Regal','1975'),(13,'Mercedes-Benz','Esprit','1989'),(14,'Seat','Fiero','2017'),(15,'Lexus','Montero','1970'),(16,'Chevrolet','Talon','2016'),(17,'Nissan','Avenger','1988'),(18,'Volkswagen','Caravelle','1985'),(19,'Ferrari','Spirit','1981'),(20,'Kia','Altima','2005'),(21,'Saab','Rocky','1984'),(22,'Chrysler','Zephyr','1972'),(23,'Mitsubishi','Reatta','2001'),(24,'Peugeot','Avenger','1988'),(25,'Lada','Murano','1983'),(26,'Renault','Contour','2017'),(27,'Skoda','Airstream','2011'),(28,'Jaguar','Ninety-Eight','1991'),(29,'Kia','Aventador','1993'),(30,'Bentley','Concord','2014'),(31,'Jeep','Ecosport','2000'),(32,'McLaren','Mangusta','2020'),(33,'Seat','Fifth Avenue','2009'),(34,'Rover','Mirai','2002'),(35,'Donkervoort','Tuareg','1982'),(36,'Renault','Somerset','1994'),(37,'Honda','California','2013'),(38,'Bugatti','Silver Spur','1996'),(39,'Hyundai','Vigor','1992'),(40,'Honda','Bronco','2016'),(41,'Nissan','Pacifica','2013'),(42,'Fiat','Pulsar','1974'),(43,'Subaru','Veyron','1986'),(44,'Rolls-Royce','Pathfinder','1976'),(45,'BMW','Aztek','2011'),(46,'Saab','Fuego','1981'),(47,'Mercedes-Benz','Alliance','2019'),(48,'Ferrari','Trooper','1973'),(49,'Kia','Miata','2016'),(50,'Alfa Romeo','Excursion','1997'),(51,'Audi','Senior','1990'),(52,'Lotus','Matador','1980'),(53,'Maybach','Millenia','2004'),(54,'Chevrolet','Landau','1972'),(55,'Citroën','Eos','1974'),(56,'Saab','Imperial','1992'),(57,'Bentley','Vanquish','1993'),(58,'Chevrolet','Talon','2010'),(59,'Volkswagen','Arya','1992'),(60,'Lancia','Dasher','2017'),(61,'Honda','Cabriolet','2003'),(62,'Skoda','Montana','1979'),(63,'BMW','Pampa','1970'),(64,'Daihatsu','Precis','1976'),(65,'Bentley','Camargue','2015'),(66,'Bentley','Tiburon','1986'),(67,'Kia','Samuri','2004'),(68,'Dodge','Silver Spirit','1970'),(69,'Ford','Caprice','1978'),(70,'Toyota','Rainier','2021'),(71,'Morgan','Murcielago','2014'),(72,'Jeep','Eight','1990'),(73,'Morgan','ElCamino','1974'),(74,'MG','Luv','2012'),(75,'BMW','Silver Spur','1994'),(76,'Jeep','Raider','2001'),(77,'Ferrari','LeMans','1973'),(78,'DS','Arnage','1977'),(79,'Abarth','Cherokee','2003'),(80,'Maserati','Freelander','2003'),(81,'Suzuki','Phantom','2005'),(82,'Bentley','Pruis','2000'),(83,'Landwind','Nubira','1993'),(84,'Skoda','Stanza','2016'),(85,'Saab','Town & Country','1983'),(86,'Rover','Express','1971'),(87,'Jaguar','Concord','1979'),(88,'Ferrari','Ridgeline','1987'),(89,'Honda','Samuri','2019'),(90,'Dacia','Blazer','1982'),(91,'Renault','Fox','2020'),(92,'MG','Freed Spike','2010'),(93,'Maybach','Vogue','2014'),(94,'Daihatsu','Roadster','2008'),(95,'Bentley','Drifter','2019'),(96,'Iveco','Rebel','1983'),(97,'Hyundai','Liberty','2010'),(98,'Lancia','Electra','2001'),(99,'Ford','Cabriolet','1995'),(100,'Fiat','Accent','1993'),(101,'Mercedes-Benz','Scamp','1970'),(102,'Lotus','Gran Fury','1998'),(103,'Maserati','TrailBlazer','1993'),(104,'Dodge','Touareg','2004'),(105,'Alfa Romeo','Freed','2018'),(106,'Mitsubishi','Routan','1972'),(107,'Hyundai','Spectra','2003'),(108,'Lexus','Torino','2000'),(109,'Mazda','LeSabre','1986'),(110,'Honda','Tiburon','1987'),(111,'Lotus','Sprinter','1998'),(112,'Lamborghini','Park Avenue','1976'),(113,'Bugatti','Hornet','2009'),(114,'Mercedes-Benz','Taurus','1990'),(115,'DS','Silver Spirit','2000'),(116,'Volvo','Ascent','2007'),(117,'Bentley','Milan','2021'),(118,'Saab','Grace','1996'),(119,'KTM','Ninety-Eight','1986'),(120,'McLaren','Bonneville','1986'),(121,'Volkswagen','Anglia','2018'),(122,'DS','Imperial','1995'),(123,'BMW','Phoenix','2020'),(124,'KTM','Yaris','2008'),(125,'Lada','Starliner','1985'),(126,'Lada','Axxess','2017'),(127,'MG','Scamp','2004'),(128,'SsangYong','Cortina','1997'),(129,'Dodge','Vantage','1979'),(130,'Audi','Leaf','1974'),(131,'Volkswagen','Sportage','2005'),(132,'Seat','Excursion','2001'),(133,'Dacia','Reliant','2002'),(134,'Mazda','Scamp','1971'),(135,'Jaguar','Veyron','2012'),(136,'Seat','Storm','2007'),(137,'Mercedes-Benz','Cirrus','2016'),(138,'Fisker','Evora','2012'),(139,'Donkervoort','Focus','1995'),(140,'Rolls-Royce','Avancier','2020'),(141,'Lotus','Boxter','1972'),(142,'Toyota','Coronet','2005'),(143,'Audi','Chevelle','1974'),(144,'Jeep','Nova','1998'),(145,'Mitsubishi','Lumina','1982'),(146,'DS','Frontier','2004'),(147,'Rover','PT Cruiser','1980'),(148,'Jaguar','Demon','2015'),(149,'Fisker','Montana','1989'),(150,'Peugeot','Galaxy','1974'),(151,'Daewoo','Entourage','2010'),(152,'Rolls-Royce','Caravan','2009'),(153,'Mazda','Liberty','2016'),(154,'Lexus','Venza','1977'),(155,'Seat','Yaris','1995'),(156,'Seat','Leganza','2013'),(157,'Morgan','Executive','1978'),(158,'Rolls-Royce','Brava','2020'),(159,'Volkswagen','Malibu','1982'),(160,'Daewoo','Paseo','1987'),(161,'Daewoo','Aspen','2011'),(162,'MG','Ridgeline','1978'),(163,'Seat','Starion','1974'),(164,'Abarth','Mythos','1992'),(165,'Skoda','Miata','1981'),(166,'Honda','Fox','1976'),(167,'Donkervoort','Frontier','1971'),(168,'Mini','Tundra','2021'),(169,'Lancia','Grand Voyager','2020'),(170,'Ferrari','Mondial','2011'),(171,'Lexus','Champ','1993'),(172,'Chrysler','Topaz','2015'),(173,'Aston Martin','Fuego','1995'),(174,'Alfa Romeo','Cordia','1976'),(175,'Maserati','Pampa','1987'),(176,'Mitsubishi','Levante','2015'),(177,'Ferrari','Diamante','2013'),(178,'Cadillac','Edge','1986'),(179,'Toyota','Milan','2011'),(180,'Chrysler','4Runner','2001'),(181,'Aston Martin','Mustang','2006'),(182,'Ford','Rainier','2018'),(183,'Hummer','Precis','2016'),(184,'Infiniti','Mondeo','2021'),(185,'Ford','Macan','1990'),(186,'Suzuki','Sunliner','2013'),(187,'Citroën','Graduate','1989'),(188,'MG','Eight','1972'),(189,'Maserati','Pronto','1970'),(190,'Daihatsu','Diamante','1982'),(191,'Maserati','Blazer','2015'),(192,'Dacia','Cadenza','2009'),(193,'Renault','Spyder','1978'),(194,'DS','Vue','1985'),(195,'Rolls-Royce','Soul','1970'),(196,'MG','DeVille','1978'),(197,'Maybach','Baja','2000'),(198,'Alfa Romeo','Quattro','2004'),(199,'Mercedes-Benz','Verano','2004'),(200,'BMW','Aspire','1987'),(201,'Bentley','Solara','1971'),(202,'Saab','Citation','2006'),(203,'Renault','Eclipse','2016'),(204,'Ferrari','Pacifica','1985'),(205,'Honda','Territory','2009'),(206,'Daihatsu','Fox','2014'),(207,'Porsche','Tribute','1991'),(208,'Land Rover','Evora','2017'),(209,'Jaguar','Lanos','2000'),(210,'Land Rover','Spark','1983');
/*!40000 ALTER TABLE `car_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_models_have_spare_parts`
--

DROP TABLE IF EXISTS `car_models_have_spare_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_models_have_spare_parts` (
  `car_model_id` int NOT NULL,
  `product_number` int NOT NULL,
  PRIMARY KEY (`car_model_id`,`product_number`),
  KEY `fk_car_models_has_spare_parts_spare_parts1_idx` (`product_number`),
  KEY `fk_car_models_has_spare_parts_car_models1_idx` (`car_model_id`),
  CONSTRAINT `fk_car_models_has_spare_parts_car_models1` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`car_model_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_car_models_has_spare_parts_spare_parts1` FOREIGN KEY (`product_number`) REFERENCES `spare_parts` (`product_number`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_models_have_spare_parts`
--

LOCK TABLES `car_models_have_spare_parts` WRITE;
/*!40000 ALTER TABLE `car_models_have_spare_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_models_have_spare_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `contact_phonenumber` varchar(20) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Primary Car Spare Parts','Sjögren','+46 76 791 42 84','delshad.sjögren@outlook.com'),(2,'Unhealthy Wheels Replacement Parts','Borg','+46 72 552 12 74','emmerick.borg@gmail.com'),(3,'Sparse Wheels Replacement Parts','Ålund','+46 70 289 28 76','qahraman.ålund@yahoo.com'),(4,'Outstanding Motorcar Replacement Parts','Fagerberg','+46 73 879 72 01','göstasson.fagerberg@yahoo.com'),(5,'Scholarly Automobile Spare Parts','Stark','+46 73 920 42 77','kardo.stark@hotmail.com'),(6,'Shy Car Spare Parts','Sjöqvist','+46 73 249 35 00','mahmed.sjöqvist@yahoo.com'),(7,'Notable Car Parts','Hammarlund','+46 73 186 16 45','camilo.hammarlund@hotmail.com'),(8,'Supportive Motorcar Spare Parts','Nykvist','+46 70 339 84 92','nikander.nykvist@yahoo.com'),(9,'Voluminous Car Parts','Leijon','+46 73 557 85 23','lokman.leijon@hotmail.com'),(10,'Gracious Car Parts','Klasson','+46 79 615 97 79','shakir.klasson@hotmail.com'),(11,'Ashamed Automobile Spare Parts','Backström','+46 79 861 50 03','momin.backström@hotmail.com'),(12,'Waterlogged Wheels Spare Parts','Holmquist','+46 73 152 30 74','serop.holmquist@live.se'),(13,'New Automobile Spare Parts','Hedin','+46 76 584 32 12','irvin.hedin@outlook.com'),(14,'Smug Car Replacement Parts','Backman','+46 70 884 77 45','reddy.backman@hotmail.com'),(15,'Well-documented Automobile Spare Parts','Ekberg','+46 72 236 14 47','pixie.ekberg@gmail.com'),(16,'Thirsty Car Replacement Parts','Mattsson','+46 72 964 20 24','gert ove.mattsson@live.se'),(17,'Lost Motorcar Replacement Parts','Carlson','+46 73 355 96 72','eino.carlson@hotmail.com'),(18,'Extraneous Automobile Spare Parts','Södergren','+46 79 534 89 54','lars-axel.södergren@outlook.com'),(19,'Descriptive Car Replacement Parts','Sköld','+46 72 017 42 34','emilian.sköld@hotmail.com'),(20,'Critical Car Replacement Parts','Kjellman','+46 72 465 73 38','hemn.kjellman@yahoo.com'),(21,'Monumental Auto Spare Parts','Ragnarsson','+46 72 389 93 46','seman.ragnarsson@hotmail.com'),(22,'Separate Auto Replacement Parts','Säfström','+46 70 362 33 26','michele.säfström@gmail.com'),(23,'Corny Auto Replacement Parts','Gradin','+46 79 773 73 25','islam.gradin@gmail.com'),(24,'Studious Car Spare Parts','Joelsson','+46 73 872 21 60','mohammad.joelsson@live.se'),(25,'Squiggly Automobile Replacement Parts','Hagström','+46 79 831 12 41','jesper.hagström@yahoo.com'),(26,'Growling Auto Replacement Parts','Henning','+46 76 267 56 12','zarko.henning@gmail.com'),(27,'Dependent Wheels Spare Parts','Forsgren','+46 76 884 67 53','hodder.forsgren@outlook.com'),(28,'Spirited Wheels Replacement Parts','Broström','+46 72 279 68 34','pasha.broström@hotmail.com'),(29,'Slim Motorcar Spare Parts','Berger','+46 72 690 65 23','ai.berger@gmail.com'),(30,'Gruesome Car Spare Parts','Glad','+46 72 932 54 55','jindrich.glad@hotmail.com'),(31,'Little Car Parts','Schmidt','+46 79 807 11 26','bakhtyar.schmidt@hotmail.com'),(32,'Stunning Automobile Replacement Parts','Storm','+46 72 616 25 24','khai.storm@live.se'),(33,'Expert Wheels Replacement Parts','Vikberg','+46 79 582 71 83','sébastian.vikberg@yahoo.com'),(34,'Corrupt Car Replacement Parts','Sörensen','+46 73 149 81 19','riccard.sörensen@hotmail.com'),(35,'Muted Automobile Replacement Parts','Gabrielsson','+46 76 912 83 85','cedric.gabrielsson@yahoo.com'),(36,'Failing Auto Replacement Parts','Hugosson','+46 73 868 68 50','finjan.hugosson@outlook.com'),(37,'Darling Car Parts','Zachrisson','+46 70 557 30 57','urho.zachrisson@hotmail.com'),(38,'Emotional Wheels Spare Parts','Leijon','+46 70 149 15 70','harish.leijon@gmail.com'),(39,'Shameful Car Spare Parts','Henning','+46 70 585 82 72','olov.henning@gmail.com'),(40,'Carefree Car Parts','Melander','+46 76 712 65 92','markus.melander@live.se'),(41,'Filthy Motorcar Spare Parts','Schmidt','+46 70 063 81 89','eitel.schmidt@gmail.com'),(42,'Failing Car Parts','Norlin','+46 72 566 17 65','humle.norlin@hotmail.com'),(43,'Cooked Automobile Replacement Parts','Fagerlund','+46 72 431 52 15','abdulai.fagerlund@live.se'),(44,'Flawless Wheels Replacement Parts','Helgesson','+46 72 387 23 85','minna.helgesson@live.se'),(45,'Grand Automobile Replacement Parts','Bergmark','+46 76 397 52 84','nojus.bergmark@yahoo.com'),(46,'Idle Motorcar Spare Parts','Back','+46 76 463 90 21','ibro.back@hotmail.com'),(47,'Prize Auto Replacement Parts','Källberg','+46 73 217 23 55','hardy.källberg@live.se'),(48,'Handmade Wheels Replacement Parts','Hjalmarsson','+46 73 724 81 47','shaheer.hjalmarsson@live.se'),(49,'Conventional Car Replacement Parts','Helmersson','+46 73 048 86 08','abdiwahid.helmersson@yahoo.com'),(50,'Sweltering Motorcar Spare Parts','Martinsson','+46 72 461 66 97','avelino.martinsson@yahoo.com'),(51,'Steep Car Spare Parts','Engstrand','+46 70 950 06 17','sven-oskar.engstrand@outlook.com'),(52,'Stark Automobile Spare Parts','Linde','+46 73 732 55 32','ather.linde@yahoo.com'),(53,'Far-off Auto Replacement Parts','Löfgren','+46 72 331 19 11','ezequiel.löfgren@outlook.com'),(54,'Dull Automobile Replacement Parts','Andersson','+46 73 984 82 85','abdurahim.andersson@gmail.com'),(55,'Bad Automobile Spare Parts','Trulsson','+46 79 236 43 85','effe.trulsson@hotmail.com'),(56,'Prickly Automobile Replacement Parts','Åstrand','+46 76 113 36 81','hans-olof.åstrand@gmail.com'),(57,'Arid Automobile Spare Parts','Lans','+46 72 126 02 89','jános.lans@hotmail.com'),(58,'Considerate Wheels Replacement Parts','Rosengren','+46 70 385 86 87','serafim.rosengren@outlook.com'),(59,'Webbed Wheels Spare Parts','Van','+46 73 896 51 96','hilmer.van@live.se'),(60,'Loyal Wheels Replacement Parts','Lundborg','+46 79 616 76 01','ilir.lundborg@outlook.com'),(61,'Dimpled Car Parts','Högberg','+46 76 860 39 51','rizvan.högberg@outlook.com'),(62,'Punctual Car Parts','Trygg','+46 73 159 05 47','artak.trygg@yahoo.com'),(63,'Curly Auto Spare Parts','Sundell','+46 79 341 17 53','esther.sundell@gmail.com'),(64,'Shameless Car Replacement Parts','Alexandersson','+46 73 397 19 11','dick.alexandersson@yahoo.com'),(65,'Bare Automobile Spare Parts','Johnsson','+46 79 407 81 85','efosa.johnsson@gmail.com'),(66,'Exhausted Auto Spare Parts','Blomquist','+46 72 813 24 31','omid.blomquist@gmail.com'),(67,'Remote Auto Spare Parts','Ersson','+46 73 106 51 09','pär olof.ersson@live.se'),(68,'Bustling Motorcar Spare Parts','Hellstrand','+46 79 291 34 06','alland.hellstrand@outlook.com'),(69,'Golden Wheels Replacement Parts','Sjöstrand','+46 76 260 07 84','mebrahtu.sjöstrand@gmail.com'),(70,'Distant Wheels Spare Parts','Öhlund','+46 72 637 52 99','gottne.öhlund@live.se'),(71,'Rosy Automobile Spare Parts','Strandberg','+46 70 638 41 92','mahbub.strandberg@hotmail.com'),(72,'Rosy Auto Spare Parts','Erlandsson','+46 79 890 49 41','mete.erlandsson@live.se'),(73,'Droopy Car Parts','Wikman','+46 72 567 74 49','zuher.wikman@gmail.com'),(74,'Real Auto Spare Parts','Ferm','+46 73 239 70 36','neyo.ferm@live.se'),(75,'Flamboyant Auto Replacement Parts','Olsén','+46 76 488 11 03','zanis.olsén@yahoo.com'),(76,'Perfect Motorcar Replacement Parts','Lundvall','+46 73 789 07 11','radojica.lundvall@yahoo.com'),(77,'Athletic Motorcar Spare Parts','Öhrn','+46 73 921 67 89','nikolai.öhrn@outlook.com'),(78,'Clever Car Parts','Sjögren','+46 76 823 46 72','andre.sjögren@yahoo.com'),(79,'Hard Automobile Spare Parts','Lindblad','+46 70 368 18 92','fang.lindblad@outlook.com'),(80,'Attractive Wheels Replacement Parts','Hagström','+46 72 708 32 27','diether.hagström@gmail.com'),(81,'Reflecting Motorcar Replacement Parts','Löfberg','+46 70 898 11 87','kemo.löfberg@live.se'),(82,'Unhealthy Motorcar Spare Parts','Blomberg','+46 72 578 76 97','maria.blomberg@hotmail.com'),(83,'Innocent Motorcar Replacement Parts','Thelin','+46 72 503 11 60','grimur.thelin@outlook.com'),(84,'Obedient Car Replacement Parts','André','+46 72 907 55 96','mats erik.andré@live.se'),(85,'Humble Auto Replacement Parts','Källman','+46 72 414 40 81','vicente.källman@outlook.com'),(86,'Gorgeous Motorcar Spare Parts','Gillberg','+46 73 404 70 89','lars-olow.gillberg@yahoo.com'),(87,'Clever Wheels Spare Parts','Hedvall','+46 73 010 86 82','milko.hedvall@live.se'),(88,'Euphoric Motorcar Replacement Parts','Hellberg','+46 73 403 53 57','vitor.hellberg@yahoo.com'),(89,'Deafening Car Replacement Parts','Gullberg','+46 72 006 40 23','alisa.gullberg@gmail.com'),(90,'Unwitting Auto Replacement Parts','Haag','+46 72 430 46 95','aurora.haag@hotmail.com'),(91,'Quick-witted Wheels Replacement Parts','Rosberg','+46 73 110 11 85','fawad.rosberg@yahoo.com'),(92,'Mild Wheels Replacement Parts','Hallén','+46 76 625 25 61','aske.hallén@gmail.com'),(93,'Frizzy Motorcar Spare Parts','Lund','+46 72 018 01 09','dalton.lund@hotmail.com'),(94,'Elegant Car Replacement Parts','Wessman','+46 73 576 77 21','isaac.wessman@yahoo.com'),(95,'Flamboyant Wheels Replacement Parts','Bergström','+46 70 695 88 01','gia.bergström@hotmail.com'),(96,'Fake Wheels Spare Parts','Selander','+46 73 224 82 78','vilford.selander@live.se'),(97,'Dreary Automobile Replacement Parts','Kihlberg','+46 79 069 47 57','hans-göran.kihlberg@hotmail.com'),(98,'Clear-cut Auto Spare Parts','Petersen','+46 76 786 61 41','bengt.petersen@hotmail.com'),(99,'Strident Car Parts','Skog','+46 79 636 37 14','milon.skog@outlook.com'),(100,'Fast Auto Replacement Parts','Ferm','+46 72 218 41 50','subash.ferm@live.se');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies_has_addresses`
--

DROP TABLE IF EXISTS `companies_has_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies_has_addresses` (
  `company_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`company_id`,`address_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `companies_has_addresses_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `companies_has_addresses_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies_has_addresses`
--

LOCK TABLES `companies_has_addresses` WRITE;
/*!40000 ALTER TABLE `companies_has_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies_has_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_cars`
--

DROP TABLE IF EXISTS `customer_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_cars` (
  `license_number` varchar(6) NOT NULL,
  `customer_id` int NOT NULL,
  `car_model_id` int NOT NULL,
  `color` varchar(20) NOT NULL,
  PRIMARY KEY (`license_number`),
  UNIQUE KEY `license_number_UNIQUE` (`license_number`),
  KEY `fk_customers_has_car_models_car_models1_idx` (`car_model_id`),
  KEY `fk_customers_has_car_models_customers1_idx` (`customer_id`),
  CONSTRAINT `fk_customers_has_car_models_car_models1` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`car_model_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_has_car_models_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_cars`
--

LOCK TABLES `customer_cars` WRITE;
/*!40000 ALTER TABLE `customer_cars` DISABLE KEYS */;
INSERT INTO `customer_cars` VALUES ('AAH461',70,168,'Purple'),('AAY253',108,173,'Silver'),('ADX250',39,208,'Red'),('AGV450',70,177,'Black'),('AJM995',95,13,'Orange'),('ALM530',128,160,'White'),('AMQ708',165,52,'Silver'),('ANK284',112,89,'Red'),('AOS114',48,24,'Black'),('AQN240',102,195,'Blue'),('AST773',101,156,'Red'),('AXH918',170,44,'Silver'),('AZK126',110,40,'Yellow'),('BCQ686',153,189,'Black'),('BHD871',126,19,'Orange'),('BIQ435',180,187,'Blue'),('BKL091',76,53,'Gold'),('BKS689',130,206,'Red'),('BLH918',41,38,'Silver'),('BQK651',200,179,'Yellow'),('BVN462',139,66,'Gold'),('BXU346',32,181,'White'),('CEM899',139,71,'Orange'),('CLN179',12,46,'Gold'),('CMB173',72,122,'Silver'),('CPF275',136,119,'Black'),('CUV805',187,164,'Gold'),('CYL966',98,28,'Purple'),('CYS739',45,25,'Silver'),('CYW547',78,129,'Orange'),('DBC446',4,153,'Silver'),('DCE121',191,206,'Black'),('DCZ769',196,166,'Yellow'),('DDB874',190,109,'Blue'),('DHQ590',176,30,'Silver'),('DIS317',136,62,'Red'),('DMX149',8,202,'White'),('DPJ459',105,17,'Blue'),('DRE626',152,90,'Gold'),('DSM905',17,77,'Yellow'),('DTD997',112,24,'Blue'),('EFM267',67,135,'Blue'),('EIS854',111,78,'Black'),('EKN983',42,90,'Yellow'),('EMK324',32,61,'Black'),('EMZ572',82,48,'Purple'),('ENA359',37,102,'Black'),('ESC551',181,109,'White'),('ETT304',52,194,'Blue'),('EYY788',187,60,'Silver'),('FAE595',22,171,'Orange'),('FCO367',199,16,'Black'),('FDQ798',86,90,'Silver'),('FDR835',195,177,'Silver'),('FFW726',144,137,'Blue'),('FGE676',159,29,'Red'),('FMW208',97,129,'White'),('FPM869',172,8,'Purple'),('FRW643',169,133,'Orange'),('FSF331',105,198,'Blue'),('FVL655',171,29,'Blue'),('FZB028',34,138,'Black'),('GAL990',159,51,'White'),('GEI781',165,190,'Green'),('GEJ389',18,134,'Green'),('GFP123',35,15,'Blue'),('GFS731',142,98,'Green'),('GHX272',20,205,'Black'),('GIK707',9,127,'Black'),('GKS634',74,14,'Blue'),('GMT039',107,39,'Blue'),('GUI277',111,19,'Orange'),('GUM278',152,97,'Orange'),('GXR879',182,16,'Silver'),('GYI186',79,188,'Blue'),('HBQ440',42,173,'Purple'),('HBZ426',60,40,'Purple'),('HFC123',90,208,'Yellow'),('HIH833',158,163,'Blue'),('HLV929',128,96,'Green'),('HOQ211',196,48,'Yellow'),('HPA102',184,165,'Gold'),('HQS557',32,132,'Purple'),('HTN715',50,107,'White'),('HXV678',89,130,'Purple'),('IAZ057',164,135,'Green'),('IBO061',99,26,'Silver'),('IEG462',124,197,'Green'),('IEQ857',70,73,'Silver'),('IES935',92,29,'Orange'),('IFV551',140,27,'Blue'),('IJB397',119,77,'White'),('ILK262',26,84,'Green'),('INI987',128,89,'Black'),('IOI062',111,151,'White'),('ISW955',59,87,'Black'),('ITK987',159,129,'Black'),('IWO251',133,171,'Orange'),('JAE744',183,91,'White'),('JIG408',170,185,'Orange'),('JIL511',62,78,'Gold'),('JIO949',143,13,'Silver'),('JJO464',150,141,'Blue'),('JJP023',163,105,'Red'),('JLB116',35,38,'Yellow'),('JNB982',104,93,'White'),('JSB184',120,187,'Green'),('JTK696',179,78,'Yellow'),('JVA444',88,126,'Green'),('JVB744',43,50,'Orange'),('KAU742',127,146,'Black'),('KCU000',162,71,'Purple'),('KDN667',9,10,'Purple'),('KEL047',9,148,'Green'),('KGA424',88,98,'Yellow'),('KHN940',31,123,'Black'),('KMF355',89,187,'Orange'),('KMX843',155,35,'Black'),('KQY671',143,29,'White'),('KVG856',101,22,'Green'),('KYP517',59,177,'Yellow'),('KZG260',190,68,'Gold'),('LBB259',146,151,'Blue'),('LCI292',61,8,'Orange'),('LIA158',14,73,'Red'),('LIF192',40,114,'Black'),('LII811',198,64,'Orange'),('LJQ273',47,102,'Gold'),('LLA167',38,162,'Red'),('LMR978',158,122,'Yellow'),('LRE754',150,43,'Blue'),('LVD427',44,2,'Purple'),('LZP482',141,38,'Purple'),('MBR412',150,180,'Silver'),('MCQ697',49,24,'Gold'),('MEG658',127,21,'Green'),('MEN637',65,10,'White'),('MIK796',103,59,'Blue'),('MJL036',135,164,'Blue'),('MOZ219',44,27,'Gold'),('MPH044',187,6,'Black'),('MPY370',65,196,'Silver'),('MRZ216',43,137,'Silver'),('MWS316',74,87,'Silver'),('NCU406',100,2,'Orange'),('NDG791',180,159,'Yellow'),('NJS422',77,32,'Silver'),('NNJ489',21,67,'White'),('NNO543',106,22,'Black'),('NQS771',96,205,'Silver'),('NWC760',70,88,'Red'),('NXR632',96,183,'Silver'),('NYG068',188,131,'Black'),('NZQ299',172,91,'Black'),('OCC165',23,183,'Blue'),('OFJ113',129,7,'White'),('OKQ793',109,117,'Silver'),('OKV140',60,45,'White'),('OMD951',33,187,'Red'),('ONU331',84,147,'Green'),('OOT436',120,49,'Blue'),('OPS496',168,46,'Red'),('OQQ145',95,184,'Blue'),('ORS118',7,146,'Silver'),('ORT904',44,3,'Gold'),('OUJ873',113,136,'White'),('OVB681',122,31,'Silver'),('OZJ574',84,72,'Blue'),('PIH213',119,74,'Purple'),('PKD616',157,121,'Yellow'),('PLP177',175,93,'Red'),('PSK644',120,3,'Silver'),('PTR878',39,192,'Silver'),('PUU677',185,93,'Green'),('PXO331',21,45,'Orange'),('QHJ755',25,43,'Blue'),('QIE764',134,123,'Red'),('QMR529',4,9,'Silver'),('QNV442',112,30,'Purple'),('QPG760',63,7,'Green'),('QPV082',105,179,'Purple'),('QQL697',144,70,'Purple'),('RAR172',174,37,'White'),('RDR772',194,120,'Purple'),('RFC987',135,19,'Gold'),('RGJ443',158,204,'Orange'),('RJI340',70,9,'Black'),('RJL761',75,2,'Blue'),('RML195',60,37,'Gold'),('RMP492',107,168,'Black'),('RSK510',196,194,'White'),('RXA455',44,72,'Silver'),('RXC987',139,45,'Orange'),('RYQ809',118,114,'Yellow'),('SAM536',166,172,'Black'),('SDS284',136,4,'Black'),('SLQ461',178,117,'Orange'),('SNJ314',176,93,'Yellow'),('SPO206',51,19,'Purple'),('SPW256',195,83,'Yellow'),('SSF044',127,125,'Gold'),('STJ911',79,181,'Orange'),('STW590',170,149,'Gold'),('SUV419',165,64,'Blue'),('SWR430',4,112,'Gold'),('SYS318',140,189,'Black'),('TBS035',190,76,'Black'),('TGX045',65,47,'White'),('TJP710',113,185,'Gold'),('TKW078',150,148,'Black'),('TKZ716',70,72,'Orange'),('TPH211',36,178,'Green'),('TRH231',13,184,'White'),('TSL947',56,188,'Gold'),('TTB417',61,35,'Red'),('TVC249',55,44,'White'),('TWJ963',182,135,'Silver'),('TXH457',78,37,'Black'),('TYW833',171,30,'Silver'),('UBN648',93,191,'Green'),('UBZ621',127,138,'Silver'),('UCI890',116,140,'Green'),('UCQ396',18,46,'Yellow'),('UDK788',84,152,'Green'),('UDW598',140,10,'Yellow'),('UEK588',110,207,'Green'),('UGP326',5,201,'Purple'),('UHN301',50,162,'Gold'),('URZ446',57,125,'Blue'),('UWD821',184,13,'Purple'),('UZI185',179,203,'Green'),('VBK701',171,119,'Gold'),('VBU977',65,16,'Red'),('VEX060',112,55,'White'),('VGD265',155,96,'Purple'),('VKE886',184,56,'Purple'),('VKN494',152,101,'Red'),('VNX611',78,36,'Silver'),('VQA166',2,146,'Black'),('VUM551',69,121,'Black'),('VVG047',48,61,'Blue'),('VXH096',121,48,'White'),('VZZ509',84,117,'Green'),('WGC411',126,65,'Blue'),('WGI239',177,7,'Yellow'),('WJU136',46,88,'Gold'),('WNY430',127,134,'Blue'),('WQZ569',152,130,'Red'),('WSS124',91,2,'Black'),('WSS524',95,167,'Orange'),('WTS378',159,58,'Green'),('WTT329',154,176,'Silver'),('WXN252',26,57,'Yellow'),('WYY361',98,205,'Orange'),('XAV648',65,31,'Orange'),('XCU312',11,190,'Black'),('XHR378',12,168,'Silver'),('XJY233',66,13,'White'),('XKZ183',100,128,'Red'),('XLS461',152,194,'Red'),('XMW733',82,63,'Red'),('XNG237',164,61,'Purple'),('XUX664',51,25,'Red'),('XXA764',153,80,'Silver'),('XXJ598',108,198,'White'),('XZV227',39,95,'Red'),('YBT938',180,63,'Purple'),('YEP474',198,160,'Green'),('YFB591',134,86,'Red'),('YJP906',173,64,'Gold'),('YMV914',153,203,'Yellow'),('YOR833',158,203,'Blue'),('YOZ739',127,32,'Orange'),('YPE226',172,196,'White'),('YSL803',33,164,'Purple'),('YUO049',53,148,'Silver'),('YWE112',129,121,'White'),('YWF620',190,205,'Blue'),('YYJ124',196,129,'Silver'),('ZAW734',6,38,'Orange'),('ZBO288',196,86,'Gold'),('ZEZ576',171,65,'Silver'),('ZFJ678',103,165,'Black'),('ZFR463',83,94,'Blue'),('ZFV948',126,110,'Gold'),('ZGS835',147,209,'Blue'),('ZHN120',94,71,'Yellow'),('ZJG546',43,173,'Red'),('ZNK072',122,168,'Purple'),('ZQM142',125,184,'Orange'),('ZQO593',127,61,'Green'),('ZQP849',101,172,'Orange'),('ZRC131',172,146,'Purple'),('ZSC270',104,54,'Gold'),('ZUA543',37,169,'Purple'),('ZVC798',164,36,'Black'),('ZVY420',75,151,'White'),('ZWN541',110,100,'Green'),('ZXT194',57,33,'Gold'),('ZYG446',25,200,'Yellow');
/*!40000 ALTER TABLE `customer_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_orders` (
  `customer_order_number` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `shipped_date` date DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `comments` text,
  PRIMARY KEY (`customer_order_number`),
  KEY `fk_customer_orders_customers1_idx` (`customer_id`),
  KEY `employee_id_idx` (`employee_id`),
  KEY `fk_customer_orders_stores1_idx` (`store_id`),
  CONSTRAINT `fk_customer_orders_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_orders_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_customer_orders_stores1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_orders`
--

LOCK TABLES `customer_orders` WRITE;
/*!40000 ALTER TABLE `customer_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) DEFAULT NULL,
  `contact_last_name` varchar(60) NOT NULL,
  `contact_first_name` varchar(60) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `is_company` tinyint NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Impish Auto Shop','Vik','Sung','+46 70 163 89 46',1),(2,'Needy Automobile Service Station','Thelin','Liebert','+46 73 415 62 32',1),(3,NULL,'Nordberg','Theo','+46 72 307 30 39',0),(4,NULL,'De','Kimmie','+46 72 461 25 09',0),(5,NULL,'Åkesson','Abgar','+46 79 289 60 78',0),(6,'Roasted Auto Shop','Bodén','Mushir','+46 72 498 76 82',1),(7,'Misguided Car Shop','Börjesson','Madelene','+46 72 690 08 13',1),(8,'Writhing Auto Works','Långström','Tea','+46 73 038 06 24',1),(9,NULL,'Sigfridsson','Gyula','+46 73 529 83 05',0),(10,NULL,'Westerberg','Pavlovich','+46 76 744 52 03',0),(11,NULL,'Brändström','Norris','+46 76 459 06 40',0),(12,'Envious Car Service Station','Gidlund','Guuleed','+46 79 408 02 49',1),(13,'Yellowish Car Garage','Östman','Lefteris','+46 72 915 65 08',1),(14,NULL,'Törnkvist','Feridun','+46 79 438 61 15',0),(15,NULL,'Åström','Ersen','+46 79 723 83 93',0),(16,NULL,'Öström','Davi','+46 73 119 60 40',0),(17,NULL,'Hedström','Tigran','+46 73 359 23 40',0),(18,NULL,'Ekvall','Nikolaus','+46 72 592 77 40',0),(19,NULL,'Wihlborg','Mickael','+46 76 048 50 01',0),(20,'Delectable Workshop','Malmqvist','Ehard','+46 73 364 07 61',1),(21,NULL,'Östling','Naief','+46 72 798 90 91',0),(22,'Peaceful Car Shop','Jönsson','Abdulatif','+46 72 569 01 99',1),(23,NULL,'Nelson','Hailemichael','+46 73 538 41 89',0),(24,'High-level Motorcar Workshop','Tufvesson','Estuardo','+46 70 915 00 81',1),(25,'Ill-informed Automobile Garage','Bodin','Johnn','+46 70 939 62 47',1),(26,NULL,'Öst','Nikolaev','+46 79 884 48 33',0),(27,NULL,'Åhs','Darek','+46 72 975 60 57',0),(28,'Giving Automobile Shop','Andreasson','Gandi','+46 76 436 26 62',1),(29,NULL,'Wessman','Louay','+46 70 816 52 17',0),(30,NULL,'Nylén','Cong','+46 79 187 39 32',0),(31,'Descriptive Car Works','Högman','Lewend','+46 76 986 13 35',1),(32,NULL,'Granat','Vanessa','+46 76 786 49 31',0),(33,'Defensive Automobile Works','Gabrielsson','Daris','+46 79 342 47 23',1),(34,'Disgusting Automobile Service Station','Löfström','Carl-Alfred','+46 76 691 63 27',1),(35,'Nimble Motorcar Garage','Svedberg','Yako','+46 79 922 45 19',1),(36,'Ethical Service Station','Lönnqvist','Marc','+46 76 335 91 68',1),(37,NULL,'Damberg','Artur','+46 72 813 78 09',0),(38,'Superficial Works','Nordén','Barbaros','+46 76 545 44 45',1),(39,'Live Auto Workshop','Ahlstrand','Tobil','+46 73 200 23 12',1),(40,NULL,'Lindstedt','Randolf','+46 73 566 83 13',0),(41,'Valid Auto Workshop','Petersson','Jugas','+46 79 603 27 11',1),(42,'Loyal Automobile Service Station','Liljedahl','Geng','+46 76 590 74 80',1),(43,'Buzzing Works','Ingvarsson','Khurram','+46 73 391 41 62',1),(44,'Slight Automobile Workshop','Viktorsson','Abanob','+46 76 482 79 90',1),(45,NULL,'Ekström','Daban','+46 73 642 28 40',0),(46,'Majestic Works','Bäcklund','Abdelouahed','+46 73 866 36 30',1),(47,'Deep Auto Service Station','Östergren','Veide','+46 79 243 13 20',1),(48,'Annual Car Works','Stålnacke','Levi','+46 72 086 20 93',1),(49,'Big Auto Garage','Spångberg','Robbin','+46 70 700 79 67',1),(50,NULL,'Sundström','Börjesson','+46 79 871 89 43',0),(51,'Trim Auto Works','Svensson','Haileab','+46 79 551 18 32',1),(52,'Confused Automobile Workshop','Wickman','Davin','+46 72 086 87 94',1),(53,NULL,'Wedin','Getoar','+46 70 873 30 56',0),(54,NULL,'Dahlgren','Taif','+46 79 059 37 32',0),(55,'Sturdy Car Shop','Sahlén','Jabril','+46 73 142 78 51',1),(56,NULL,'Almén','Tess','+46 79 675 74 97',0),(57,'Impish Workshop','Berg','Gzim','+46 79 227 60 59',1),(58,NULL,'Rosenqvist','Kwai','+46 73 753 25 89',0),(59,'Valid Auto Service Station','Granat','Aimé','+46 70 457 24 55',1),(60,'Same Motorcar Service Station','Anderberg','Laroy','+46 73 456 29 26',1),(61,'Delicious Car Works','Landberg','Naguib','+46 76 397 59 75',1),(62,NULL,'Storm','Niilas','+46 76 478 40 47',0),(63,'Worst Auto Shop','Forsström','Haddock','+46 76 067 98 78',1),(64,NULL,'Vigren','Abdulkerim','+46 76 742 20 60',0),(65,'Judicious Works','Hedblom','Besmir','+46 73 736 76 12',1),(66,'Minor Auto Works','Rosell','Clyde','+46 73 973 38 65',1),(67,'Ill-informed Motorcar Workshop','Backman','Charalambos','+46 70 491 21 59',1),(68,'Angry Auto Garage','Hedvall','Knut','+46 72 037 80 18',1),(69,NULL,'Hammarström','Carl-Arne','+46 72 675 56 77',0),(70,'Descriptive Car Garage','Norlin','Rejdar','+46 76 895 38 82',1),(71,NULL,'Isberg','Hartmut','+46 70 450 75 98',0),(72,'Costly Motorcar Garage','Lundkvist','Uladzimir','+46 72 498 24 56',1),(73,'Chubby Automobile Garage','Lundström','Juha-Pekka','+46 76 485 64 66',1),(74,NULL,'Fahlgren','Mariam','+46 79 502 24 49',0),(75,NULL,'Källgren','Esbjörn','+46 79 724 93 26',0),(76,'Prickly Works','Folkesson','Gunne','+46 76 595 12 67',1),(77,NULL,'Hällgren','Everton','+46 73 815 57 96',0),(78,NULL,'Rundgren','Betim','+46 79 983 89 40',0),(79,'Entire Car Garage','Åhman','Momir','+46 70 442 12 15',1),(80,NULL,'Modin','Per-Ola','+46 79 190 24 43',0),(81,NULL,'Näslund','Bahrudin','+46 79 485 71 86',0),(82,NULL,'Sjöström','Zydrunas','+46 73 455 94 34',0),(83,NULL,'Helmersson','Hagbert','+46 73 295 66 13',0),(84,'Luxurious Garage','Hedén','Ejlert','+46 70 242 48 28',1),(85,NULL,'Renberg','Tuomas','+46 70 971 56 28',0),(86,NULL,'Antonsson','Bawar','+46 72 658 04 96',0),(87,'Insistent Auto Garage','Blad','Massoud','+46 72 145 27 91',1),(88,'Ordinary Auto Garage','Nordling','Joudah','+46 73 422 49 12',1),(89,NULL,'Bergendahl','Rihards','+46 73 527 66 51',0),(90,NULL,'Strandberg','Rama','+46 72 546 81 61',0),(91,'Remote Automobile Workshop','Stenmark','Roiny','+46 79 582 84 52',1),(92,NULL,'Rask','Bård','+46 70 977 30 52',0),(93,NULL,'Lundell','Mexhit','+46 79 970 56 11',0),(94,'Recent Service Station','Hedström','Cazim','+46 76 487 02 75',1),(95,NULL,'Hörberg','Karl Vilhelm','+46 73 394 81 72',0),(96,'Watery Auto Garage','Sten','Eroll','+46 79 142 23 23',1),(97,'Repulsive Motorcar Service Station','Wedin','Siverth','+46 76 568 00 13',1),(98,'Downright Car Shop','Höglund','Erkko','+46 72 684 21 81',1),(99,'Roasted Auto Garage','Lundgren','Edolf','+46 76 602 56 18',1),(100,NULL,'Stålnacke','Torolf','+46 73 626 28 52',0),(101,'Cautious Auto Workshop','Björnsson','Jure','+46 76 761 49 19',1),(102,'Spry Automobile Workshop','Holmberg','Mohammadreza','+46 79 791 13 76',1),(103,'Voluminous Car Workshop','Nelson','Saam','+46 79 797 47 19',1),(104,NULL,'Tell','Awais','+46 73 760 68 46',0),(105,NULL,'Gren','Tunahan','+46 76 144 40 51',0),(106,'Profitable Car Garage','Wiklund','Marouane','+46 73 704 76 21',1),(107,NULL,'Antonsson','Garp','+46 70 755 98 32',0),(108,'Gaseous Car Shop','Lind','Pierre','+46 70 564 53 15',1),(109,'Soft Auto Service Station','Sahlén','Albi','+46 79 853 51 25',1),(110,NULL,'Bengtsson','Edmund','+46 73 388 57 88',0),(111,'Liquid Shop','Åkerlind','Alfred','+46 76 065 33 79',1),(112,NULL,'Widén','Gert Inge','+46 79 895 64 94',0),(113,'Repulsive Automobile Shop','Meijer','Hakon','+46 70 761 69 96',1),(114,NULL,'Öhrn','Avdullah','+46 73 053 17 70',0),(115,NULL,'Petersen','Arshad','+46 73 939 23 42',0),(116,'Unfit Automobile Works','Östlund','Olan','+46 70 673 59 26',1),(117,'Heavy Motorcar Shop','Ludvigsson','Edmunds','+46 72 294 32 01',1),(118,'Buoyant Automobile Workshop','Frank','Lafta','+46 79 108 81 94',1),(119,NULL,'Hammar','Uma','+46 70 070 92 36',0),(120,NULL,'Stridh','Elle','+46 73 858 35 69',0),(121,NULL,'Edholm','Serdal','+46 73 950 89 27',0),(122,NULL,'Öberg','Hocine','+46 72 373 44 74',0),(123,'Illiterate Car Works','Lundh','Delman','+46 70 074 38 40',1),(124,'Colorful Auto Workshop','Ling','Zaki','+46 72 529 84 42',1),(125,NULL,'Von','Ezequiel','+46 70 679 24 41',0),(126,'Educated Automobile Workshop','Sundqvist','Tristian','+46 72 892 54 27',1),(127,'Next Automobile Workshop','Westlund','Khalis','+46 73 113 49 81',1),(128,NULL,'Ljungkvist','Sabin','+46 76 422 33 40',0),(129,NULL,'Wickman','Gzim','+46 73 986 87 18',0),(130,NULL,'Nyqvist','Jun','+46 76 529 03 78',0),(131,NULL,'Öhrn','Sarvar','+46 70 969 87 40',0),(132,'Monumental Automobile Workshop','Göransson','Samuel','+46 73 749 93 10',1),(133,'Automatic Car Works','Norin','Hans-Inge','+46 76 002 46 47',1),(134,NULL,'Hallén','Börge','+46 73 045 05 66',0),(135,'Adorable Garage','Vall','Ignacy','+46 70 937 79 22',1),(136,NULL,'Halvarsson','Sadik','+46 73 583 38 02',0),(137,NULL,'Hagberg','Nicklas','+46 72 721 57 35',0),(138,NULL,'Haraldsson','Stigsson','+46 70 922 41 63',0),(139,'Lonely Shop','Kihlberg','Tewolde','+46 73 566 00 91',1),(140,'Feisty Automobile Service Station','Törnqvist','Caesar','+46 72 931 91 95',1),(141,'Attractive Auto Shop','Lundell','Sherwan','+46 79 678 91 62',1),(142,NULL,'Vahlberg','Lars-Folke','+46 79 231 54 16',0),(143,'Filthy Automobile Workshop','Thelin','Vendel','+46 79 135 18 38',1),(144,'Deadly Shop','Gerdin','Betty','+46 79 647 36 65',1),(145,NULL,'Lindkvist','Kam','+46 72 804 78 03',0),(146,NULL,'Hällström','Vitaliy','+46 76 744 51 47',0),(147,NULL,'Vikström','Cajsa','+46 76 821 51 78',0),(148,'Odd Motorcar Service Station','Wennström','Yngwie','+46 70 438 33 47',1),(149,'Nimble Automobile Service Station','Sandell','Gerrit','+46 79 695 84 16',1),(150,NULL,'Vidén','Hotan','+46 72 303 36 30',0),(151,NULL,'Olsson','Morgan','+46 70 461 71 83',0),(152,'Upset Car Service Station','Dahlin','Örjan','+46 73 304 24 85',1),(153,NULL,'Vestberg','Torbjörnsson','+46 72 633 65 88',0),(154,'Chilly Automobile Service Station','Harrysson','Kjel','+46 72 674 94 94',1),(155,NULL,'Lidén','Pieter','+46 76 046 39 82',0),(156,NULL,'Vahlberg','Arunkumar','+46 73 822 28 05',0),(157,'Roasted Auto Shop','Östman','Mun','+46 73 376 77 42',1),(158,NULL,'Stålberg','Stelios','+46 76 903 06 19',0),(159,'Upbeat Car Works','Byström','Per-Olov','+46 76 179 01 10',1),(160,'Lumbering Motorcar Workshop','Olsén','Abdulqadir','+46 79 963 83 88',1),(161,NULL,'Karlberg','Aleksa','+46 73 704 31 97',0),(162,'Best Garage','Karlberg','Hadis','+46 76 517 07 74',1),(163,NULL,'Arnesson','Qasim','+46 79 191 60 04',0),(164,NULL,'Lönnqvist','Svebilius','+46 70 295 89 24',0),(165,'Cool Car Service Station','Svedin','Woodrow','+46 73 400 56 27',1),(166,NULL,'Lundin','Mohammed','+46 73 934 39 39',0),(167,NULL,'Cederlund','Phuc','+46 70 515 15 43',0),(168,'Wry Garage','Hellsten','Malek','+46 72 592 47 70',1),(169,'Pink Car Shop','Åhlin','Abdiasis','+46 72 096 59 34',1),(170,NULL,'Vestlund','Diamond','+46 72 320 50 18',0),(171,'Vain Auto Garage','Johnson','Abubakr','+46 79 215 48 08',1),(172,'Hateful Auto Shop','Lindén','Dietmar','+46 76 403 42 85',1),(173,'Flowery Auto Workshop','Jörgensen','Erlend','+46 79 566 69 12',1),(174,NULL,'Levin','Varma','+46 76 645 18 60',0),(175,'Constant Motorcar Works','Karlén','Singh','+46 76 841 97 98',1),(176,NULL,'Molin','Russom','+46 79 499 45 48',0),(177,'Juvenile Automobile Works','Norling','Arjen','+46 72 614 17 57',1),(178,NULL,'Nordberg','Ingemarsson','+46 79 720 61 42',0),(179,NULL,'Hjalmarsson','Kilian','+46 70 768 83 27',0),(180,NULL,'Vigren','Bo','+46 72 287 56 91',0),(181,NULL,'Holmquist','Bojne','+46 70 970 77 05',0),(182,'Virtuous Works','Hedberg','Dionisios','+46 73 836 59 06',1),(183,NULL,'Öhman','Devad','+46 79 159 71 99',0),(184,'Paltry Service Station','Roth','Svante','+46 70 127 27 82',1),(185,'Salty Workshop','Sahlström','Behailu','+46 76 043 79 37',1),(186,'Concerned Automobile Service Station','Mellgren','Stevie','+46 72 694 55 92',1),(187,NULL,'Leander','Isse','+46 73 914 07 31',0),(188,NULL,'Bäckström','Read','+46 72 088 89 68',0),(189,NULL,'Bernhardsson','Gotthard','+46 72 510 14 67',0),(190,NULL,'Grönvall','Kullervo','+46 79 273 99 14',0),(191,NULL,'Sander','Zinar','+46 76 689 11 94',0),(192,NULL,'Holmlund','Michiel','+46 72 513 91 65',0),(193,NULL,'Ahlström','Mashal','+46 70 509 81 15',0),(194,NULL,'Vik','Berne','+46 79 824 63 18',0),(195,'Defensive Car Shop','Lindroth','Behrang','+46 72 416 49 09',1),(196,NULL,'Malmsten','Esmail','+46 76 445 93 96',0),(197,'Sniveling Motorcar Service Station','Lagergren','Oli','+46 79 192 84 03',1),(198,'Robust Car Garage','Staaf','Hongwei','+46 73 266 77 40',1),(199,NULL,'Dahl','Mikey','+46 73 086 60 51',0),(200,'Tender Automobile Works','Vesterlund','Aliro','+46 70 870 88 44',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_have_addresses`
--

DROP TABLE IF EXISTS `customers_have_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_have_addresses` (
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `fk_customers_has_addresses_addresses1_idx` (`address_id`),
  KEY `fk_customers_has_addresses_customers1_idx` (`customer_id`),
  CONSTRAINT `fk_customers_has_addresses_addresses1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_has_addresses_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_have_addresses`
--

LOCK TABLES `customers_have_addresses` WRITE;
/*!40000 ALTER TABLE `customers_have_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_have_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employees_stores1_idx` (`store_id`),
  CONSTRAINT `fk_employees_stores1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `manufacturer_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  PRIMARY KEY (`manufacturer_id`),
  KEY `fk_manufacturers_companies1_idx` (`company_id`),
  CONSTRAINT `fk_manufacturers_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `customer_order_number` int NOT NULL,
  `product_number` int NOT NULL,
  `price_each` decimal(10,0) NOT NULL,
  `quantity_ordered` int NOT NULL,
  PRIMARY KEY (`customer_order_number`,`product_number`),
  KEY `fk_order_details_customer_orders1_idx` (`customer_order_number`),
  KEY `fk_order_details_spare_parts1_idx` (`product_number`),
  CONSTRAINT `fk_order_details_customer_orders1` FOREIGN KEY (`customer_order_number`) REFERENCES `customer_orders` (`customer_order_number`),
  CONSTRAINT `fk_order_details_spare_parts1` FOREIGN KEY (`product_number`) REFERENCES `spare_parts` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_parts`
--

DROP TABLE IF EXISTS `spare_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spare_parts` (
  `product_number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(45) NOT NULL,
  `sell_price` float NOT NULL,
  PRIMARY KEY (`product_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_parts`
--

LOCK TABLES `spare_parts` WRITE;
/*!40000 ALTER TABLE `spare_parts` DISABLE KEYS */;
INSERT INTO `spare_parts` VALUES (1,'Sticker, Flames','Awesome Flames',20),(2,'Sticker, Hearts','BFF',20),(3,'Sticker, Moose','King of the forest',20),(4,'Wunderbaum, Green','Pine',2),(5,'Wunderbaum, Pink','Rose',2),(6,'Wunderbaum, Yellow','Citrus',2),(7,'Wunderbaum, Brown','Wet Border Collie',2),(8,'Sleeves, Pink','Wool fur',15),(9,'Sleeves, Leopard','Leather',15),(10,'Sleeves, Fire','Oak',15),(11,'Bumper, Steel','Stainless steel',80),(12,'Bumper, Chrome','With molding hole',80),(13,'Bumper, Integrated lamps','LED',80),(14,'Subwoofer, B&O','200 W',250),(15,'Subwoofer, Sony','160 W',250),(16,'Subwoofer, JBL','120 W',250);
/*!40000 ALTER TABLE `spare_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_parts_have_manufacturers`
--

DROP TABLE IF EXISTS `spare_parts_have_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spare_parts_have_manufacturers` (
  `product_number` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  PRIMARY KEY (`product_number`,`manufacturer_id`),
  KEY `fk_spare_parts_has_manufacturers_spare_parts1_idx` (`product_number`),
  KEY `fk_spare_parts_have_manufacturers_manufacturers1_idx` (`manufacturer_id`),
  CONSTRAINT `fk_spare_parts_has_manufacturers_spare_parts1` FOREIGN KEY (`product_number`) REFERENCES `spare_parts` (`product_number`) ON UPDATE CASCADE,
  CONSTRAINT `fk_spare_parts_have_manufacturers_manufacturers1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_parts_have_manufacturers`
--

LOCK TABLES `spare_parts_have_manufacturers` WRITE;
/*!40000 ALTER TABLE `spare_parts_have_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `spare_parts_have_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_parts_have_suppliers`
--

DROP TABLE IF EXISTS `spare_parts_have_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spare_parts_have_suppliers` (
  `product_number` int NOT NULL,
  `supplier_id` int NOT NULL,
  `buy_price` decimal(10,0) NOT NULL,
  `delivery_time` int NOT NULL,
  PRIMARY KEY (`product_number`,`supplier_id`),
  KEY `fk_spare_parts_have_suppliers_spare_parts1_idx` (`product_number`),
  KEY `fk_spare_parts_have_suppliers_suppliers1_idx` (`supplier_id`),
  CONSTRAINT `fk_spare_parts_have_suppliers_spare_parts1` FOREIGN KEY (`product_number`) REFERENCES `spare_parts` (`product_number`) ON UPDATE CASCADE,
  CONSTRAINT `fk_spare_parts_have_suppliers_suppliers1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_parts_have_suppliers`
--

LOCK TABLES `spare_parts_have_suppliers` WRITE;
/*!40000 ALTER TABLE `spare_parts_have_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `spare_parts_have_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_parts_in_stores`
--

DROP TABLE IF EXISTS `spare_parts_in_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spare_parts_in_stores` (
  `product_number` int NOT NULL,
  `store_id` int NOT NULL,
  `shelf_number` varchar(4) NOT NULL,
  `quantity_in_stock` int NOT NULL,
  `lowest_index` int NOT NULL,
  `quantity_to_order` int NOT NULL,
  PRIMARY KEY (`product_number`,`store_id`),
  KEY `fk_spare_parts_has_stores_stores1_idx` (`store_id`),
  KEY `fk_spare_parts_has_stores_spare_parts1_idx` (`product_number`),
  CONSTRAINT `fk_spare_parts_has_stores_spare_parts1` FOREIGN KEY (`product_number`) REFERENCES `spare_parts` (`product_number`) ON UPDATE CASCADE,
  CONSTRAINT `fk_spare_parts_has_stores_stores1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_parts_in_stores`
--

LOCK TABLES `spare_parts_in_stores` WRITE;
/*!40000 ALTER TABLE `spare_parts_in_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `spare_parts_in_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `address_id` int NOT NULL,
  PRIMARY KEY (`store_id`),
  KEY `fk_stores_addresses1_idx` (`address_id`),
  CONSTRAINT `fk_stores_addresses1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `fk_suppliers_companies1_idx` (`company_id`),
  CONSTRAINT `fk_suppliers_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02 12:53:30

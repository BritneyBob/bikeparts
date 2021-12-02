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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_types`
--

LOCK TABLES `address_types` WRITE;
/*!40000 ALTER TABLE `address_types` DISABLE KEYS */;
INSERT INTO `address_types` VALUES (1,'delivery address'),(2,'billing address'),(3,'visiting address');
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
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `zipcode` varchar(15) NOT NULL,
  `city_name` varchar(60) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_addresses_address_types1_idx` (`address_type_id`),
  CONSTRAINT `fk_addresses_address_types1` FOREIGN KEY (`address_type_id`) REFERENCES `address_types` (`address_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (2,3,NULL,'Strömvägen 8','269 42','Helsingborg','Sweden'),(3,1,NULL,'Gamla Dalarövägen 35','294 35','Svolvær','Norway'),(4,3,NULL,'Viktor Rydbergsgatan 10','546 92','Herning','Denmark'),(5,2,NULL,'Gulsippestigen 17','333 31','Frederikssund','Denmark'),(6,1,NULL,'Råsegelgatan 13','433 76','Borlänge','Sweden'),(7,2,NULL,'Blomsholm Nordskogen ','842 93','Norrköping','Sweden'),(8,1,NULL,'Södra Esplanaden 35','696 92','Albertslund','Denmark'),(9,3,NULL,'Gödeberg Torsgård 2','276 35','Kalundborg','Denmark'),(10,3,NULL,'Forsnästorp 301','563 93','Trollhättan','Sweden'),(11,2,NULL,'Hästhagsvägen 46','663 32','Västerås','Sweden'),(12,1,NULL,'Vrenninge Solliden 901','171 64','Rønne','Denmark'),(13,3,NULL,'Kyrkoköpinge 22','771 35','Farum','Denmark'),(14,3,NULL,'Yrvädersvägen 6','641 39','Linköping','Sweden'),(15,3,NULL,'Bokvägen 23','458 91','Holstebro','Denmark'),(16,1,NULL,'Norrbrynge 340','793 41','Arendal','Norway'),(17,3,NULL,'Bofinksvägen 2','212 39','Oslo','Norway'),(18,2,NULL,'Ararp 4','275 63','Linköping','Sweden'),(19,2,NULL,'Kvarnkullevägen 5','575 93','Halmstad','Sweden'),(20,3,NULL,'Lovene Ekedalsslätten 2','465 98','Iisalmi','Finland'),(21,1,NULL,'Planvägen 2','274 93','Helsingborg','Sweden'),(22,1,NULL,'Fröslunda Taxnäs Gård 3','224 58','Hämeenlinna','Finland'),(23,1,NULL,'Storvretsvägen 149','471 93','Karlskrona','Sweden'),(24,3,NULL,'Tågmästaregatan 9','449 44','Helsingør','Denmark'),(25,3,NULL,'Sandåsvägen 8','216 18','Jönköping','Sweden'),(26,3,NULL,'Kung Oscars Väg 7','191 43','Visby','Sweden'),(27,2,NULL,'Margretelundsgatan 18','574 34','Vallensbæk Strand','Denmark'),(28,1,NULL,'Forshem Trankärr 1','577 94','Lahti','Finland'),(29,3,NULL,'Bygdevägen 10','571 95','Borås','Sweden'),(30,3,NULL,'Kabbetorp 278','521 56','Borås','Sweden'),(31,3,NULL,'Stensgård 5','842 33','Borås','Sweden'),(32,1,NULL,'Härjevad Skattegården 2','724 64','Esbjerg','Denmark'),(33,1,NULL,'Ellagårdsvägen 77','593 74','Linköping','Sweden'),(34,1,NULL,'Ramsåsa Svampastugan ','274 53','Stockholm','Sweden'),(35,1,NULL,'Helgebergsvägen 33','585 93','København','Denmark'),(36,1,NULL,'Lilla Åvägen 3','749 52','Norrköping','Sweden'),(37,2,NULL,'Fredriksdal Hulthagen 1','816 94','Kolding','Denmark'),(38,3,NULL,'Birger Jarls Väg 9','749 62','Luleå','Sweden'),(39,1,NULL,'Torrhem 1','274 62','Luleå','Sweden'),(40,3,NULL,'Draknäs 22','919 31','Linköping','Sweden'),(41,2,NULL,'Aspvägen 4','342 52','Helsingborg','Sweden'),(42,2,NULL,'Carl Johans Väg 27','575 93','Jyväskylä','Finland'),(43,1,NULL,'Syllavägen 4','245 32','Helsingborg','Sweden'),(44,2,NULL,'Granvägen 2','745 95','Jönköping','Sweden'),(45,2,NULL,'Fältgatan 3','418 71','Luleå','Sweden'),(46,2,NULL,'Villagatan 4','611 72','Malmö','Sweden'),(47,1,NULL,'Backsippsvägen 6','553 12','Vänersborg','Sweden'),(48,1,NULL,'Lindvägen 18','243 71','Falun','Sweden'),(49,1,NULL,'Stockbyvägen 13','426 76','Jönköping','Sweden'),(50,2,NULL,'Eneboda Gård ','791 75','Tornio','Finland'),(51,1,NULL,'Flasbjörke Gruvbacken 15','444 41','Vänersborg','Sweden'),(52,1,NULL,'Rågstigen 7','732 95','Søborg','Denmark'),(53,1,NULL,'Odonvidegatan 2','471 44','Vaasa','Finland'),(54,2,NULL,'Långvik 496','241 34','Harstad','Norway'),(55,1,NULL,'Iduns Backe 2','856 41','Mäntsälä','Finland'),(56,1,NULL,'Linköpingsvägen 7','432 38','Hamar','Norway'),(57,1,NULL,'Östra Vitåfors 270','771 92','Ishøj','Denmark'),(58,1,NULL,'Odlarvägen 10','395 91','Borlänge','Sweden'),(59,1,NULL,'Skalvägen 5','523 92','Taastrup','Denmark'),(60,1,NULL,'Villa Brännhult ','252 24','Charlottenlund','Denmark'),(61,1,NULL,'Byvägen 9','231 97','Herning','Denmark'),(62,1,NULL,'Bäckegruvan Nytorp 149','813 36','Vänersborg','Sweden'),(63,2,NULL,'Såningsvägen 4','263 33','Holbæk','Denmark'),(64,3,NULL,'Nordbäcksbodarna 14','239 35','Uppsala','Sweden'),(65,2,NULL,'Mistavägen 8','214 36','Nyköping','Sweden'),(66,3,NULL,'Bäve Mållsjö 226','681 51','Stockholm','Sweden'),(67,2,NULL,'Landgrensgatan 8','761 12','Imatra','Finland'),(68,3,NULL,'Fredsdalsgatan 5','458 96','Raahe','Finland'),(69,2,NULL,'Flottuvan 5','914 31','Hvidovre','Denmark'),(70,3,NULL,'Wolfsgatan 9','825 32','Svolvær','Norway'),(71,3,NULL,'Solviksvägen 15','135 61','Næstved','Denmark'),(72,3,NULL,'Spejarestigen 2','388 93','Ålesund','Norway'),(73,3,NULL,'Karlskärs Trädgårdsväg 6','713 34','Lohja','Finland'),(74,1,NULL,'Almbodabacken 8','791 37','Hvidovre','Denmark'),(75,1,NULL,'Gräshult Björksätra ','343 36','Halmstad','Sweden'),(76,2,NULL,'Svalvägen 26','462 96','Steinkjer','Norway'),(77,3,NULL,'Bredsele 3','621 56','Linköping','Sweden'),(78,2,NULL,'Högalidsgatan 18','384 91','Mikkeli','Finland'),(79,3,NULL,'Ledvägen 5','816 92','Kiruna','Sweden'),(80,2,NULL,'Beatrice Lesslies Gata 9','141 91','Norrköping','Sweden'),(81,3,NULL,'Eggerdvägen 10','432 68','Linköping','Sweden'),(82,3,NULL,'Skålbergsvägen 11','725 94','Halmstad','Sweden'),(83,2,NULL,'Båtsmansvägen 9','267 75','Karlstad','Sweden'),(84,3,NULL,'Ekorrestigen 5','692 91','Kaarina','Finland'),(85,1,NULL,'Hässlet 101','731 15','Vänersborg','Sweden'),(86,3,NULL,'Borgunda Munkabo 3','254 75','Stockholm','Sweden'),(87,2,NULL,'Brömsgatan 2','713 32','Hammerfest','Norway'),(88,3,NULL,'Dunderängen 27','856 34','Tønsberg','Norway'),(89,1,NULL,'Vargvägen 6','275 38','Örebro','Sweden'),(90,1,NULL,'Klippgrunden 1','566 91','Haugesund','Norway'),(91,2,NULL,'Humlevägen 5','262 65','Halmstad','Sweden'),(92,1,NULL,'Granvägen 29','148 95','Örebro','Sweden'),(93,1,NULL,'Persgatan 13','153 96','Umeå','Sweden'),(94,1,NULL,'Igelkottsvägen 6','181 41','Ylöjärvi','Finland'),(95,1,NULL,'Östra Löa Källhagen 528','531 92','Vihti','Finland'),(96,3,NULL,'Azaleagatan 14','622 65','Uppsala','Sweden'),(97,1,NULL,'Blackstad Gåsdalen ','776 34','Luleå','Sweden'),(98,1,NULL,'Alvik Nisshagsvägen 10','745 99','Varkaus','Finland'),(99,2,NULL,'Kulturvägen 6','571 91','Västerås','Sweden'),(100,1,NULL,'Eneby 112','372 39','Göteborg','Sweden'),(101,3,NULL,'Box 312','282 92','Kangasala','Finland'),(102,1,NULL,'Östra Vinkelgatan 3','731 51','Örnsköldsvik','Sweden'),(103,3,NULL,'Ramsö Sanane 1','511 74','Siilinjärvi','Finland'),(104,3,NULL,'Eternellvägen 1','432 38','Aarhus','Denmark'),(105,3,NULL,'Rävsnäsvägen 28','595 95','Karlskrona','Sweden'),(106,1,NULL,'Prästkragevägen 7','572 95','Lillehammer','Norway'),(107,2,NULL,'Lagmansered Hälltorps Kvarn ','273 94','Malmö','Sweden'),(108,2,NULL,'Uddstigen 3','124 32','Växjö','Sweden'),(109,1,NULL,'Kopparslagargränd 26','721 31','Kaupanger','Norway'),(110,2,NULL,'Hemmingstorp Sjöbo ','416 53','Jyväskylän Maalaiskunta','Finland'),(111,1,NULL,'Huvboda Gård 1','252 48','Linköping','Sweden'),(112,2,NULL,'Arentorp Bärneboda 2','187 69','Kiruna','Sweden'),(113,2,NULL,'Gessie Byaväg 54','591 96','Kolding','Denmark'),(114,2,NULL,'Gamla Vägen 10','271 78','Härnösand','Sweden'),(115,1,NULL,'Karlarp Kyrkvägen 30','931 35','Tromsø','Norway'),(116,2,NULL,'Glänningeleden 16','294 76','Taastrup','Denmark'),(117,2,NULL,'Hultvägen 27','516 95','Trollhättan','Sweden'),(118,2,NULL,'Bortan Skansen ','632 33','Vossevangen','Norway'),(119,1,NULL,'Hallonstigen 5','572 63','Örebro','Sweden'),(120,3,NULL,'Gäddvägen 8','755 92','Kerteminde','Denmark'),(121,1,NULL,'Juravägen 4','153 32','Jyväskylän Maalaiskunta','Finland'),(122,3,NULL,'Skotvägen 7','641 91','Östersund','Sweden'),(123,2,NULL,'Skogsduvevägen 13','334 91','Molde','Norway'),(124,2,NULL,'Gersilla 102','733 91','Steinkjer','Norway'),(125,3,NULL,'Slottsgatan 24','287 92','Umeå','Sweden'),(126,1,NULL,'Lådämnesgatan 48','343 71','Næstved','Denmark'),(127,1,NULL,'Postiljonsvägen 28','241 72','Hjørring','Denmark'),(128,1,NULL,'Körsbärsgatan 3','234 35','Hjørring','Denmark'),(129,2,NULL,'Stora Rönnholmen 1','547 92','Västerås','Sweden'),(130,1,NULL,'Fridhem 116','826 94','Arendal','Norway'),(131,3,NULL,'Ekvägen 16','372 52','Gävle','Sweden'),(132,1,NULL,'Frisörgatan 2','442 32','Jönköping','Sweden'),(133,3,NULL,'Bocksjö Baggebol 2','518 33','Växjö','Sweden'),(134,1,NULL,'Rammsjön Karlsro 130','935 92','Gjøvik','Norway'),(135,1,NULL,'Brusen 1','135 48','Sarpsborg','Norway'),(136,3,NULL,'Hjalmar Lundbohmsvägen 190','455 97','Vantaa','Finland'),(137,1,NULL,'Norra Lundby Fredrikslid 1','431 46','Örnsköldsvik','Sweden'),(138,2,NULL,'Hunnebovägen 28','416 53','Norrköping','Sweden'),(139,3,NULL,'Trydelund 1737','519 91','Gjøvik','Norway'),(140,3,NULL,'Liljemovägen 41','862 95','Nyköping','Sweden'),(141,2,NULL,'Ridhusgatan 7','649 91','Mäntsälä','Finland'),(142,2,NULL,'Brovägen 1','592 42','Vantaa','Finland'),(143,3,NULL,'Sadelmakaregatan 6','514 44','Ballerup','Denmark'),(144,3,NULL,'Landgången 25','643 97','Linköping','Sweden'),(145,1,NULL,'Vallvägen 2','343 74','Malmö','Sweden'),(146,1,NULL,'Djupedalsvägen 2','455 35','Östersund','Sweden'),(147,1,NULL,'Sundstad 19','761 72','Tromsø','Norway'),(148,1,NULL,'Landågatan 18','443 32','Vossevangen','Norway'),(149,1,NULL,'Dalvägen 3','611 74','Härnösand','Sweden'),(150,3,NULL,'Yrvädersvägen 5','514 34','Harstad','Norway'),(151,3,NULL,'Lönåsen 3','792 77','Sørum','Norway'),(152,2,NULL,'Oxegårdsvägen 8','761 63','Kongens Lyngby','Denmark'),(153,2,NULL,'Slöta Solliden ','891 34','Karlstad','Sweden'),(154,3,NULL,'Boet Uppsala 4','532 93','Trollhättan','Sweden'),(155,3,NULL,'Guldsmedsvägen 9','423 42','Halmstad','Sweden'),(156,3,NULL,'Holmgatan 12','793 41','Hamar','Norway'),(157,1,NULL,'Båberg 406','141 71','Borlänge','Sweden'),(158,1,NULL,'Professorsgatan 3','443 92','Visby','Sweden'),(159,3,NULL,'Pärup 7410','518 33','Oulu','Finland'),(160,1,NULL,'Ljustervägen 3','141 91','Vaasa','Finland'),(161,1,NULL,'Sofiehemsvägen 1','735 31','Kirkenes','Norway'),(162,1,NULL,'Hertig Karlsgatan 7','747 91','Savonlinna','Finland'),(163,3,NULL,'Mallbacken 88','571 65','Göteborg','Sweden'),(164,2,NULL,'Rudagatan 57','456 33','Søborg','Denmark'),(165,3,NULL,'Karlshill ','618 32','Albertslund','Denmark'),(166,3,NULL,'Oljobergsvägen 32','832 93','Helsingborg','Sweden'),(167,1,NULL,'Akaren Solvända 2','122 48','Kurikka','Finland'),(168,3,NULL,'Grytehöge Lid 16','512 65','Malmö','Sweden'),(169,3,NULL,'Södra Kallmyr 18','516 34','Hamar','Norway'),(170,2,NULL,'Holmagatan 19','463 91','Lohja','Finland'),(171,2,NULL,'Fjäll 201','764 92','Västerås','Sweden'),(172,1,NULL,'Göberga Björkhaga 1','453 33','Östersund','Sweden'),(173,1,NULL,'Flisavägen 36','372 95','Kalmar','Sweden'),(174,1,NULL,'Falkgatan 4','335 32','Trondheim','Norway'),(175,2,NULL,'Slimminge 723','434 31','Kangasala','Finland'),(176,3,NULL,'Norra Öbyvägen 21','281 92','Skellefteå','Sweden'),(177,3,NULL,'Huddungeby 181','311 99','Hyvinkää','Finland'),(178,3,NULL,'Naddebo 5','418 71','Malmö','Sweden'),(179,2,NULL,'Kullhult Kringelhult 390','152 95','Rødovre','Denmark'),(180,2,NULL,'Blåmesvägen 6','791 96','Kristianstad','Sweden'),(181,2,NULL,'Västerhejde Gamla Kyrkvägen 3','623 53','Rønne','Denmark'),(182,2,NULL,'Galtö Gård 121','544 31','Vejle','Denmark'),(183,1,NULL,'Klåbacksvägen 11','543 94','Jyväskylä','Finland'),(184,2,NULL,'Tillbergsgatan 4','241 64','Helsingborg','Sweden'),(185,2,NULL,'Kyrkogårdsvägen 108','571 37','Sundsvall','Sweden'),(186,2,NULL,'Kristinelund 255','565 92','Örebro','Sweden'),(187,2,NULL,'Broängen 2','881 92','Glostrup','Denmark'),(188,2,NULL,'Ilingetorp 195','945 33','Hørsholm','Denmark'),(189,2,NULL,'Brissund Brissunds Strandkviar 2','457 43','Borlänge','Sweden'),(190,2,NULL,'Ekeslunda 179','623 37','Farum','Denmark'),(191,1,NULL,'Tämta Näs Östergården 12','595 21','Næstved','Denmark'),(192,1,NULL,'Charlottendalsvägen 11','715 72','Tampere','Finland'),(193,2,NULL,'Falerum Bergsätter ','135 49','Östersund','Sweden'),(194,3,NULL,'Bjurstigen 17','936 91','Umeå','Sweden'),(195,1,NULL,'Bäckegruvan Östra Skogstorp 171','913 41','Växjö','Sweden'),(196,1,NULL,'Billinge 1116','685 92','Skellefteå','Sweden'),(197,1,NULL,'Vattentornsvägen 10','343 31','Kaupanger','Norway'),(198,2,NULL,'Tennisgränd 12','633 52','Göteborg','Sweden'),(199,1,NULL,'Västergatan 9','163 43','Helsingborg','Sweden'),(200,1,NULL,'Vallby Norrmark 267','184 94','Kurikka','Finland'),(201,3,NULL,'Lutmansgatan 18','624 67','Härnösand','Sweden'),(202,3,NULL,'Sommarvägen 6','196 91','Roskilde','Denmark'),(203,2,NULL,'Persiljevägen 11','911 36','Malmö','Sweden'),(204,1,NULL,'Romfartuna Klockartorp 1','743 72','Nyköping','Sweden'),(205,1,NULL,'Annetorpsvägen 53','633 59','Savonlinna','Finland'),(206,3,NULL,'Svampvägen 31','668 95','Växjö','Sweden'),(207,1,NULL,'Hällstigen 16','944 72','Nyköping','Sweden'),(208,2,NULL,'Enköpingsvägen 4','447 91','Linköping','Sweden'),(209,3,NULL,'Ekebyvägen 10','561 46','Charlottenlund','Denmark'),(210,3,NULL,'Granitvägen 14','826 35','Kiruna','Sweden'),(211,3,NULL,'Einars Väg 4','655 92','Västerås','Sweden'),(212,2,NULL,'Brukstorget 2','623 46','Seinäjoki','Finland'),(213,1,NULL,'Viktoriagatan 15','212 91','Nyköping','Sweden'),(214,3,NULL,'Mästergränd 2','132 49','Kristiansand','Norway'),(215,1,NULL,'Sven Brocks Gata 9','935 91','Ishøj','Denmark'),(216,2,NULL,'Tingstuvägen 3','824 33','Borlänge','Sweden'),(217,1,NULL,'Bentylgatan 10','242 71','Hammerfest','Norway'),(218,2,NULL,'Finnerödja-Fallet 6','682 92','Vallensbæk Strand','Denmark'),(219,1,NULL,'Odensjö Odenslund 9','756 53','Örnsköldsvik','Sweden'),(220,1,NULL,'Pumpstigen 3','436 54','Umeå','Sweden'),(221,1,NULL,'Brunshult Petersburg 1','152 51','Västerås','Sweden'),(222,2,NULL,'Lötenvägen 111','732 93','Kerava','Finland'),(223,1,NULL,'Stångåvägen 29','614 93','Kalmar','Sweden'),(224,2,NULL,'Samegatan 10','836 93','Lempäälä','Finland'),(225,3,NULL,'Göstad Nyborg 1','623 44','Vossevangen','Norway'),(226,1,NULL,'Elleböke 3299','273 96','Vänersborg','Sweden'),(227,1,NULL,'Flädervägen 21','295 74','Sandnes','Norway'),(228,3,NULL,'Grenvägen 5','212 31','Växjö','Sweden'),(229,1,NULL,'Färnviken 45','827 31','Uppsala','Sweden'),(230,3,NULL,'Vågen 110','268 76','Borlänge','Sweden'),(231,2,NULL,'Ponténvägen 11','523 95','Ringkøbing','Denmark'),(232,3,NULL,'Folkabo Bosgården 3','212 36','Lohja','Finland'),(233,2,NULL,'Porsgränd 14','598 97','Östersund','Sweden'),(234,2,NULL,'Sjöholmsgatan 6','567 32','Esbjerg','Denmark'),(235,3,NULL,'Flögfors Storådamm 111','938 94','Drammen','Norway'),(236,3,NULL,'Sjögärde Bränna 2','673 91','Kemi','Finland'),(237,2,NULL,'Fettsta 6','295 32','Mariestad','Sweden'),(238,2,NULL,'Daggrosvägen 9','741 94','Gävle','Sweden'),(239,3,NULL,'Alsta 177','314 33','Växjö','Sweden'),(240,3,NULL,'Krickvägen 5','269 73','Trollhättan','Sweden'),(241,1,NULL,'Doktor Fries Torg 10','781 98','Kuopio','Finland'),(242,2,NULL,'Blåbärsstigen 9','262 53','Uppsala','Sweden'),(243,2,NULL,'Tampvägen 4','945 91','Haugesund','Norway'),(244,2,NULL,'Södra Ängsliden 4','511 96','Uppsala','Sweden'),(245,1,NULL,'Brobacken Hagalund ','434 91','Karlstad','Sweden'),(246,2,NULL,'Börshult 1','213 74','Härnösand','Sweden'),(247,2,NULL,'Orrspelsvägen 22','182 33','Fredericia','Denmark'),(248,1,NULL,'Hagbacksvägen 15','582 75','Östersund','Sweden'),(249,3,NULL,'Dalsta 5','352 49','Vadsø','Norway'),(250,3,NULL,'Tallgårdsvägen 11','713 33','Hjørring','Denmark'),(251,3,NULL,'Elsaborg 5','192 54','Borlänge','Sweden'),(252,3,NULL,'Selsforsen 54','914 31','Helsingborg','Sweden'),(253,3,NULL,'Ekeby Myre Lillgård 628','452 93','Stockholm','Sweden'),(254,3,NULL,'Fintavägen 6','932 35','Kerteminde','Denmark'),(255,1,NULL,'Långviks Glasbruksväg 47','914 92','Sundsvall','Sweden'),(256,2,NULL,'Box 344','623 54','Skellefteå','Sweden'),(257,2,NULL,'Betaniabacken 5','524 32','Malmö','Sweden'),(258,2,NULL,'Box 1430','915 97','Gävle','Sweden'),(259,3,NULL,'Deltavägen 11','784 77','Vossevangen','Norway'),(260,3,NULL,'Småstuguvägen 4','934 91','Raseborg','Finland'),(261,1,NULL,'Vemmenkärr 15','543 93','Stockholm','Sweden'),(262,3,NULL,'Kornettvägen 5','135 49','Stockholm','Sweden'),(263,3,NULL,'Blåbärsstigen 4','532 35','Kotka','Finland'),(264,1,NULL,'Strömbergsgatan 11','577 92','Borlänge','Sweden'),(265,1,NULL,'Södra Dalbergavägen 2','826 92','Örebro','Sweden'),(266,1,NULL,'Bergslagsvägen 48','331 97','Trondheim','Norway'),(267,2,NULL,'Mossle Bonkegård 4','231 91','Tønsberg','Norway'),(268,1,NULL,'Falan Hylta 490','414 51','Kajaani','Finland'),(269,3,NULL,'Krusbärsvägen 10','931 94','Sorø','Denmark'),(270,2,NULL,'Box 26','136 65','Göteborg','Sweden'),(271,3,NULL,'Bladgränd 4','289 73','Hermansverk','Norway'),(272,2,NULL,'Gorm Den Gamles Gränd 2','662 36','Borlänge','Sweden'),(273,1,NULL,'Eds-Bodane 576','267 75','Umeå','Sweden'),(274,3,NULL,'Gröna Gatan 9','267 77','Valkeakoski','Finland'),(275,1,NULL,'Lerviksvägen 4','241 72','Uppsala','Sweden'),(276,1,NULL,'Lilla Rätö Ängalag Tre Tomt 96','732 96','Karlstad','Sweden'),(277,2,NULL,'Skirö Prästgård 1','641 95','Växjö','Sweden'),(278,1,NULL,'Sallabacken 5','933 91','Örebro','Sweden'),(279,3,NULL,'Fjärestadsbacken 10','953 36','Viborg','Denmark'),(280,3,NULL,'Kogsäng 2','139 74','Sandnes','Norway'),(281,2,NULL,'Fiskesgatan 9','761 75','Göteborg','Sweden'),(282,2,NULL,'Galtö 202','163 54','Pori','Finland'),(283,1,NULL,'Djurahagsvägen 10','565 33','Esbjerg','Denmark'),(284,3,NULL,'Olbergavägen 120','268 77','Helsinki','Finland'),(285,2,NULL,'Hedekullen 3','747 91','Charlottenlund','Denmark'),(286,3,NULL,'Enebackevägen 4','546 31','Borlänge','Sweden'),(287,3,NULL,'Edshult Sjöbron 1','561 46','Västerås','Sweden'),(288,3,NULL,'Häreryd 1','421 47','Gävle','Sweden'),(289,3,NULL,'Pågavägen 15','823 92','Norrköping','Sweden'),(290,1,NULL,'Borggatan 3','194 91','Sarpsborg','Norway'),(291,3,NULL,'Nysätra Värnbo 2','793 91','Västerås','Sweden'),(292,1,NULL,'Bodudden 730','618 33','Oslo','Norway'),(293,2,NULL,'Södra Annekärrsvägen 20','167 71','Östersund','Sweden'),(294,1,NULL,'Myrstigen 7','518 42','Härnösand','Sweden'),(295,1,NULL,'Hagvägen 6','571 94','Visby','Sweden'),(296,2,NULL,'Hamnbacken 3','385 51','Moss','Norway'),(297,1,NULL,'Solhaga 2','178 52','Jönköping','Sweden'),(298,2,NULL,'Bygatan 1','434 35','Mariestad','Sweden'),(299,3,NULL,'Flakaholmsvägen 9','394 77','Tønsberg','Norway'),(300,1,NULL,'Barkvägen 6','734 93','Alta','Norway'),(301,3,NULL,'De Geers Väg 2','184 43','Haderslev','Denmark'),(302,1,NULL,'Hemra Tvärsen Vägen 45','126 42','Borlänge','Sweden'),(303,1,NULL,'Nils Jens Väg 4','731 96','Oulu','Finland'),(304,1,NULL,'Box 71','693 92','Luleå','Sweden'),(305,1,NULL,'Ymergatan 5','423 72','Moss','Norway'),(306,1,NULL,'Hjärsåsvägen 11','764 57','Seinäjoki','Finland'),(307,1,NULL,'Fjärdsgrundet 4','272 38','Ålesund','Norway'),(308,3,NULL,'Levide Burgebacke 176','196 93','Gävle','Sweden'),(309,2,NULL,'Bjursvägen 42','856 53','Nurmijärvi','Finland'),(310,2,NULL,'Tjälen 23','446 96','Jönköping','Sweden'),(311,3,NULL,'Orrgränd 21','598 96','Växjö','Sweden'),(312,1,NULL,'Verkstadsvägen 11','264 38','Vänersborg','Sweden'),(313,2,NULL,'Skomakaregatan 4','244 36','Fredericia','Denmark'),(314,2,NULL,'Dalsebo Holmen 1','734 91','Haugesund','Norway'),(315,1,NULL,'Bergsviksvägen 6','134 62','Trollhättan','Sweden'),(316,1,NULL,'Hamnbergsvägen 7','771 92','Salo','Finland'),(317,3,NULL,'Almvägen 3','458 92','Halmstad','Sweden'),(318,1,NULL,'Rönnstigen 4','533 74','Frederiksværk','Denmark'),(319,2,NULL,'Kobacka 2','742 42','Kaarina','Finland'),(320,2,NULL,'Näktergalsvägen 51','194 39','Örnsköldsvik','Sweden'),(321,2,NULL,'Solbackens Stig 8','517 93','Svendborg','Denmark'),(322,1,NULL,'Stora Trädgårdsgatan 57','741 45','Kristianstad','Sweden'),(323,3,NULL,'Paradisgatan 28','413 21','Umeå','Sweden'),(324,2,NULL,'Tommarp Eddhill 1','811 62','Trollhättan','Sweden'),(325,3,NULL,'Slagsta Backe 102','613 41','Mariestad','Sweden'),(326,2,NULL,'Saxabäcksvägen 11','571 62','Stockholm','Sweden'),(327,2,NULL,'Fältspatvägen 5','664 34','Luleå','Sweden'),(328,1,NULL,'Promenaden 6','831 72','Stockholm','Sweden'),(329,3,NULL,'Enrisvägen 3','811 92','Örebro','Sweden'),(330,1,NULL,'Danska Vägen 9','682 33','Namsos','Norway'),(331,2,NULL,'Box 53','149 34','Örnsköldsvik','Sweden'),(332,3,NULL,'Kölaboda Gölsön 1','611 39','Sundsvall','Sweden'),(333,1,NULL,'Skogsvägen 1','233 61','Siilinjärvi','Finland'),(334,1,NULL,'Kvarnbacksvägen 3','935 91','Slagelse','Denmark'),(335,1,NULL,'Lyckevägen 8','564 36','Tornio','Finland'),(336,2,NULL,'Bo Lindbrohult 333','577 51','Norrköping','Sweden'),(337,2,NULL,'Betaniavägen 3','227 31','Sundsvall','Sweden'),(338,3,NULL,'Hammarvägen 15','623 64','Örebro','Sweden'),(339,2,NULL,'Boglösa Hemsta 23','664 95','Kristianstad','Sweden'),(340,2,NULL,'Wij 6','881 95','Allerød','Denmark'),(341,3,NULL,'Målaregatan 6','748 94','Hamar','Norway'),(342,3,NULL,'Gallåsen Hagen 2','749 52','Borås','Sweden'),(343,1,NULL,'Engatan 6','241 94','Hillerød','Denmark'),(344,1,NULL,'Toröd Ängsvägen 1','862 32','Norrköping','Sweden'),(345,3,NULL,'Kåhult Kåsjödal 150','127 41','Ringkøbing','Denmark'),(346,1,NULL,'Herrgårdsvägen 14','281 43','Kalmar','Sweden'),(347,2,NULL,'Eggvena Lilla Skottstorp 1','271 34','Örebro','Sweden'),(348,2,NULL,'Box 27','281 43','Halmstad','Sweden'),(349,2,NULL,'Björkkullaåsen 4','139 51','Hollola','Finland'),(350,2,NULL,'Benskedsvägen 7','121 55','Trondheim','Norway'),(351,3,NULL,'Smörkullevägen 17','511 93','Valkeakoski','Finland'),(352,1,NULL,'Kyrkåsgatan 15','672 95','Dragør','Denmark'),(353,2,NULL,'Örmatoftavägen 17','182 74','Gjøvik','Norway'),(354,2,NULL,'Fältvägen 14','533 94','Linköping','Sweden'),(355,2,NULL,'Kattviksvägen 174','417 28','Finnsnes','Norway'),(356,2,NULL,'Olvonstigen 6','294 71','Malmö','Sweden'),(357,1,NULL,'Viktoriagatan 13','914 93','Lillehammer','Norway'),(358,2,NULL,'Ateljégatan 4','518 41','Kristianstad','Sweden'),(359,3,NULL,'Avla Lugnets Gård 3','372 91','Alta','Norway'),(360,2,NULL,'Ekhagen Tistedalen ','297 94','Rudkøbing','Denmark'),(361,2,NULL,'Gamla Norrsundsvägen 14','686 31','Dragør','Denmark'),(362,2,NULL,'Museigatan 4','541 38','Lappeenranta','Finland'),(363,3,NULL,'Nygrannes Gata 4','785 43','Bollnäs','Sweden'),(364,3,NULL,'Planterhagen 1','579 92','Mariestad','Sweden'),(365,2,NULL,'Killingegången 17','582 78','Nyköping','Sweden'),(366,1,NULL,'Stationsvägen 6','587 37','Karlstad','Sweden'),(367,1,NULL,'Hantverksgatan 6','933 91','Umeå','Sweden'),(368,3,NULL,'Brotorpsvägen 6','791 31','Sundsvall','Sweden'),(369,3,NULL,'Heden 140','645 94','Farum','Denmark'),(370,3,NULL,'Välagatan 13','296 32','Skellefteå','Sweden'),(371,1,NULL,'Dala Sandtorpa 2','455 31','Gjøvik','Norway'),(372,3,NULL,'Hållsta ','455 91','Vänersborg','Sweden'),(373,1,NULL,'Polhemsgatan 11','364 33','Växjö','Sweden'),(374,2,NULL,'Vassbottengatan 13','669 31','Kiruna','Sweden'),(375,1,NULL,'Herrgårdsgatan 3','921 93','Halmstad','Sweden'),(376,2,NULL,'Sommarvägen 4','812 92','Kokkola','Finland'),(377,2,NULL,'Smultronslingan 9','814 92','Halmstad','Sweden'),(378,3,NULL,'Rottne Arvatorp ','623 41','Göteborg','Sweden'),(379,1,NULL,'Filaregatan 2','891 31','Drammen','Norway'),(380,1,NULL,'Björköstigen 2','429 43','Östersund','Sweden'),(381,3,NULL,'Hyllie Kyrkoväg 79','146 37','Kokkola','Finland'),(382,2,NULL,'Lännockvägen 4','269 78','Mikkeli','Finland'),(383,1,NULL,'Robertsforsvägen 7','582 17','Jämsä','Finland'),(384,1,NULL,'Box 66','467 92','Rovaniemi','Finland'),(385,1,NULL,'Mandolinvägen 7','741 94','Kristianstad','Sweden'),(386,2,NULL,'Staketkroken 12','575 93','Ishøj','Denmark'),(387,1,NULL,'Krokenvägen 3','456 47','Kiruna','Sweden'),(388,1,NULL,'Dajkanberg Vinbacken 101','546 94','Sandnes','Norway'),(389,3,NULL,'Svetsarvägen 3','611 95','Lohja','Finland'),(390,1,NULL,'Lyftinge 5','577 92','Lappeenranta','Finland'),(391,3,NULL,'Gräntorp 10','181 61','Tønsberg','Norway'),(392,3,NULL,'Trollbergsvägen 4','434 93','Karlskrona','Sweden'),(393,1,NULL,'Byträskvägen 5','136 75','Hämeenlinna','Finland'),(394,2,NULL,'Sjöcronas Gata 10','139 75','Alta','Norway'),(395,3,NULL,'Rensmur Backvägen 4','269 77','Malmö','Sweden'),(396,1,NULL,'Saxebäcksvägen 78','141 46','Härnösand','Sweden'),(397,3,NULL,'Ragnebergsvägen 45','147 92','Viborg','Denmark'),(398,1,NULL,'Petter Jönssons Väg 1','691 92','Haugesund','Norway'),(399,3,NULL,'Jälla Oxkällan 292','623 51','Jönköping','Sweden'),(400,3,NULL,'Frillesås Kullaväg 3','284 32','Malmö','Sweden'),(401,3,NULL,'Stationsgatan 2','936 95','Gjøvik','Norway'),(402,1,NULL,'Dalskogen Dalvik 110','331 94','Ringkøbing','Denmark'),(403,1,NULL,'Edeby Allé 29','244 31','Bollnäs','Sweden'),(404,2,NULL,'Heidenstamsgatan 6','749 48','Gävle','Sweden'),(405,2,NULL,'Bollstad Skogen 1','374 92','Herlev','Denmark'),(406,2,NULL,'Lillgränd 8','732 96','Molde','Norway'),(407,3,NULL,'Mossens Väg 7','673 31','Linköping','Sweden'),(408,1,NULL,'Bergsäng Mörfolk 1','682 91','Östersund','Sweden'),(409,3,NULL,'Fösingstorp Nyhem 1','266 97','Falun','Sweden'),(410,3,NULL,'Baldersbrågatan 11','421 57','Kerava','Finland'),(411,1,NULL,'Smältarevägen 15','745 93','Helsingborg','Sweden'),(412,3,NULL,'Skolgränd 4','733 61','Aalborg','Denmark'),(413,2,NULL,'Klintebostigen 33','668 95','Hamar','Norway'),(414,1,NULL,'Tegelvägen 9','332 31','Vantaa','Finland'),(415,1,NULL,'Tallåsvägen 9','611 57','Frederikssund','Denmark'),(416,1,NULL,'Aftongränd 9','738 91','Växjö','Sweden'),(417,3,NULL,'Bresätter Brestorp 1','748 95','Kirkkonummi','Finland'),(418,3,NULL,'Jörlö 4','612 34','Steinkjer','Norway'),(419,1,NULL,'Spjutstorp Nydala ','393 65','Skellefteå','Sweden'),(420,1,NULL,'Hornugglan 37','263 77','Vadsø','Norway'),(421,1,NULL,'Berg 2','388 94','Frederiksberg','Denmark'),(422,1,NULL,'Häggum Skomakarehemmet ','738 32','Tampere','Finland'),(423,1,NULL,'Mariedamm Karlsdal 241','633 69','Porvoo','Finland'),(424,3,NULL,'Härbrevägen 46','541 98','Mikkeli','Finland'),(425,1,NULL,'Lärkvägen 4','823 93','Kaarina','Finland'),(426,1,NULL,'Annedal 103','423 54','Nyköping','Sweden'),(427,2,NULL,'Berga Norrgården 309','523 96','Gävle','Sweden'),(428,1,NULL,'Dumstorp Karlstorp 1','475 42','Kalmar','Sweden'),(429,3,NULL,'Bryggevägen 2','725 93','Randers','Denmark'),(430,3,NULL,'Norrlandsgatan 19','387 75','Härnösand','Sweden'),(431,3,NULL,'Erikslundsvägen 14','182 56','Kristianstad','Sweden'),(432,2,NULL,'Tärnstigen 6','827 95','Kotka','Finland'),(433,1,NULL,'Ytternora Nyänget 251','382 94','Kajaani','Finland'),(434,3,NULL,'Kronobergsvägen 3','694 72','Växjö','Sweden'),(435,1,NULL,'Vallsjön 103','312 34','Farum','Denmark'),(436,1,NULL,'Grännavägen 9','453 34','Oulu','Finland'),(437,2,NULL,'Ölmevägen 15','261 31','Kurikka','Finland'),(438,2,NULL,'Olof Bältares Gränd 6','516 96','Kokkola','Finland'),(439,1,NULL,'Dimbo Aggetomten ','141 92','Uppsala','Sweden'),(440,3,NULL,'Björkhagen 1210','577 92','Linköping','Sweden'),(441,1,NULL,'Rovuddsstigen 7','342 63','Mariestad','Sweden'),(442,1,NULL,'Lindövägen 2','387 75','Hørsholm','Denmark'),(443,3,NULL,'Njurskullen Bergshamravägen 226','434 98','Dragør','Denmark'),(444,3,NULL,'Snickarvägen 15','524 91','Kolding','Denmark'),(445,1,NULL,'Edenhjelms Väg 16','582 73','Stockholm','Sweden'),(446,2,NULL,'Andersbo 173','956 91','Växjö','Sweden'),(447,2,NULL,'Öresundsvägen 11','573 31','Albertslund','Denmark'),(448,1,NULL,'Mysvägen 10','762 93','Trollhättan','Sweden'),(449,3,NULL,'Jägaregatan 4','331 42','Borlänge','Sweden'),(450,1,NULL,'Skörsbo 106','371 65','Kajaani','Finland'),(451,3,NULL,'Lambergsgatan 15','194 47','Borås','Sweden');
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
  PRIMARY KEY (`order_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,2,'Adeeb','Hansson','adeeb.hansson@hotmail.com'),(2,26,'Ruwan','Arvidsson','ruwan.arvidsson@hotmail.com'),(3,27,'Janus','Österberg','janus.österberg@outlook.com'),(4,41,'Spike','Backström','spike.backström@yahoo.com'),(5,32,'Mersudin','Elofsson','mersudin.elofsson@live.se'),(6,17,'Galo','Sköld','galo.sköld@outlook.com'),(7,33,'Florian','Wendel','florian.wendel@live.se'),(8,40,'Kalaf','Lindstrand','kalaf.lindstrand@outlook.com'),(9,21,'Chuong','Jansson','chuong.jansson@outlook.com'),(10,34,'Suman','Ingemarsson','suman.ingemarsson@outlook.com'),(11,31,'Grzegorz','Fors','grzegorz.fors@hotmail.com'),(12,49,'Kayed','Hagström','kayed.hagström@outlook.com'),(13,43,'Siegfrid','Nordvall','siegfrid.nordvall@outlook.com'),(14,18,'Delawar','Roth','delawar.roth@outlook.com'),(15,28,'Jonsson','Sjölander','jonsson.sjölander@yahoo.com'),(16,2,'Talat','Olausson','talat.olausson@outlook.com'),(17,48,'Péter','Henriksson','péter.henriksson@hotmail.com'),(18,1,'Ganem','Ryd','ganem.ryd@gmail.com'),(19,24,'Maid','Källberg','maid.källberg@live.se'),(20,45,'Antranik','Vikberg','antranik.vikberg@yahoo.com'),(21,11,'Antranik','Backström','antranik.backström@gmail.com'),(22,18,'Tekie','Backman','tekie.backman@outlook.com'),(23,49,'Mowlid','Blomdahl','mowlid.blomdahl@live.se'),(24,8,'Kane','Paulsson','kane.paulsson@hotmail.com'),(25,38,'Orwar','Almgren','orwar.almgren@live.se'),(26,30,'Vaughan','Selin','vaughan.selin@live.se'),(27,49,'Stian','Hjelm','stian.hjelm@outlook.com'),(28,19,'Taylor','Vestberg','taylor.vestberg@hotmail.com'),(29,17,'Sejdi','Källgren','sejdi.källgren@yahoo.com'),(30,47,'Aste','Strömbäck','aste.strömbäck@live.se'),(31,5,'Dionisios','Isberg','dionisios.isberg@gmail.com'),(32,38,'Felipe','Kihlström','felipe.kihlström@hotmail.com'),(33,41,'Sunny','Johansen','sunny.johansen@outlook.com'),(34,23,'Carel','Olausson','carel.olausson@outlook.com'),(35,36,'Gully','Isaksson','gully.isaksson@outlook.com'),(36,10,'Nicola','Törnberg','nicola.törnberg@outlook.com'),(37,31,'Wadee','Fransson','wadee.fransson@gmail.com'),(38,26,'Keijo','Ottosson','keijo.ottosson@live.se'),(39,12,'Imer','Mårtensson','imer.mårtensson@gmail.com'),(40,17,'Mattie','Nordlander','mattie.nordlander@live.se'),(41,48,'Weijne','Blomberg','weijne.blomberg@live.se'),(42,3,'Carl Otto','Sörensen','carl otto.sörensen@live.se'),(43,47,'Tapani','Sahlberg','tapani.sahlberg@hotmail.com'),(44,5,'Ciarán','Stridh','ciarán.stridh@yahoo.com'),(45,27,'Karl-Jan','Jonsson','karl-jan.jonsson@hotmail.com'),(46,22,'Ireneusz','Edman','ireneusz.edman@yahoo.com'),(47,28,'Igge','Folkesson','igge.folkesson@hotmail.com'),(48,39,'Phillip','Hellgren','phillip.hellgren@yahoo.com'),(49,29,'Hammood','Lindroth','hammood.lindroth@live.se'),(50,43,'Robertino','Rickardsson','robertino.rickardsson@live.se'),(51,48,'Niman','Thorsell','niman.thorsell@live.se'),(52,42,'Karl-Jonas','Velander','karl-jonas.velander@yahoo.com'),(53,34,'Atilio','Almén','atilio.almén@outlook.com'),(54,18,'Wilde','Thuresson','wilde.thuresson@hotmail.com'),(55,6,'Moo','Sundin','moo.sundin@live.se'),(56,33,'Eivar','Nord','eivar.nord@gmail.com'),(57,14,'Tom','Söderberg','tom.söderberg@outlook.com'),(58,31,'Bolin','Malmros','bolin.malmros@gmail.com'),(59,14,'Ganim','Vedin','ganim.vedin@outlook.com'),(60,41,'Finjan','Hammarberg','finjan.hammarberg@gmail.com'),(61,14,'Armstrong','Brundin','armstrong.brundin@outlook.com'),(62,3,'Gijsbert','Ottosson','gijsbert.ottosson@yahoo.com'),(63,43,'Arnold','Klint','arnold.klint@hotmail.com'),(64,4,'Matiss','Hallström','matiss.hallström@gmail.com'),(65,23,'Zekeriya','Wahlgren','zekeriya.wahlgren@yahoo.com'),(66,7,'Samatar','Leijon','samatar.leijon@yahoo.com'),(67,12,'Mahmod','Häll','mahmod.häll@hotmail.com'),(68,29,'Okan','Fredlund','okan.fredlund@hotmail.com'),(69,50,'Feras','Wilhelmsson','feras.wilhelmsson@gmail.com'),(70,34,'Lai','Granqvist','lai.granqvist@outlook.com'),(71,21,'Aleksi','Öman','aleksi.öman@gmail.com'),(72,45,'Heydar','Ekblad','heydar.ekblad@gmail.com'),(73,32,'Bengt-Roland','Svedlund','bengt-roland.svedlund@gmail.com'),(74,1,'Nedeljko','Sjöström','nedeljko.sjöström@yahoo.com'),(75,20,'Peiman','Vikman','peiman.vikman@yahoo.com'),(76,1,'Ibrahiim','Backström','ibrahiim.backström@yahoo.com'),(77,41,'Gay','Öberg','gay.öberg@outlook.com'),(78,18,'Lars-Christian','Lundblad','lars-christian.lundblad@yahoo.com'),(79,27,'Suan','Söder','suan.söder@outlook.com'),(80,28,'Fredrich','Roth','fredrich.roth@gmail.com'),(81,27,'Xu','Hilmersson','xu.hilmersson@live.se'),(82,46,'Essa','Granath','essa.granath@live.se'),(83,14,'Helga','Söderman','helga.söderman@hotmail.com'),(84,42,'Vasilis','Blad','vasilis.blad@live.se'),(85,6,'Per-Yngve','Hellström','per-yngve.hellström@hotmail.com'),(86,44,'Fredrik','Åslund','fredrik.åslund@outlook.com'),(87,45,'Karin','Hallberg','karin.hallberg@yahoo.com'),(88,7,'Abdihamid','Lorentzon','abdihamid.lorentzon@outlook.com'),(89,25,'Fevzi','Wahlgren','fevzi.wahlgren@yahoo.com'),(90,26,'Fahad','Vigren','fahad.vigren@yahoo.com'),(91,11,'Filip','Olsson','filip.olsson@live.se'),(92,32,'Zsolt','Carlson','zsolt.carlson@outlook.com'),(93,39,'Ta','Lejon','ta.lejon@outlook.com'),(94,15,'Bjelke','Bengtsson','bjelke.bengtsson@live.se'),(95,43,'Qadar','Emanuelsson','qadar.emanuelsson@gmail.com'),(96,27,'Giampiero','Holmström','giampiero.holmström@live.se'),(97,15,'Alfons','Fahlström','alfons.fahlström@gmail.com'),(98,38,'Göras','Helin','göras.helin@yahoo.com'),(99,40,'Madan','Lidström','madan.lidström@yahoo.com'),(100,5,'Edur','Ersson','edur.ersson@yahoo.com'),(101,6,'Orestis','Rydberg','orestis.rydberg@gmail.com'),(102,14,'Troels','Thuresson','troels.thuresson@yahoo.com'),(103,28,'Enzo','Vestin','enzo.vestin@live.se'),(104,16,'Zeen','Kjell','zeen.kjell@outlook.com'),(105,30,'Younes','Sjöberg','younes.sjöberg@gmail.com'),(106,34,'Ronni','Stoltz','ronni.stoltz@hotmail.com'),(107,22,'Dundas','Blomquist','dundas.blomquist@gmail.com'),(108,30,'Amado','Wiklund','amado.wiklund@gmail.com'),(109,50,'Poe','Widlund','poe.widlund@gmail.com'),(110,6,'Göransson','Hjalmarsson','göransson.hjalmarsson@outlook.com'),(111,11,'Carl Åke','Hjalmarsson','carl åke.hjalmarsson@live.se'),(112,11,'Noubar','Granqvist','noubar.granqvist@live.se'),(113,40,'Babul','Lindqvist','babul.lindqvist@gmail.com'),(114,7,'Mozafar','Wallman','mozafar.wallman@yahoo.com'),(115,30,'Arto','Brorsson','arto.brorsson@outlook.com'),(116,24,'Ravin','Sörensson','ravin.sörensson@outlook.com'),(117,41,'Kostadin','Enqvist','kostadin.enqvist@yahoo.com'),(118,22,'Qvintus','Wennerberg','qvintus.wennerberg@hotmail.com'),(119,1,'Sefik','Sjögren','sefik.sjögren@outlook.com'),(120,39,'Kjell Göran','Svantesson','kjell göran.svantesson@gmail.com'),(121,13,'Zabihullah','Sundgren','zabihullah.sundgren@yahoo.com'),(122,19,'Jan-Hugo','Hellström','jan-hugo.hellström@live.se'),(123,23,'Öyvind','Ehn','öyvind.ehn@hotmail.com'),(124,10,'Martti','Bergstrand','martti.bergstrand@live.se'),(125,44,'Abdulali','Hemmingsson','abdulali.hemmingsson@outlook.com'),(126,12,'Jaako','Mellgren','jaako.mellgren@gmail.com'),(127,39,'Elo','Hellman','elo.hellman@live.se'),(128,28,'Laban','Nordstrand','laban.nordstrand@gmail.com'),(129,7,'Théodor','Jernberg','théodor.jernberg@gmail.com'),(130,42,'Bako','Öqvist','bako.öqvist@live.se'),(131,40,'Tariku','Ask','tariku.ask@gmail.com'),(132,17,'Aslan','Rundqvist','aslan.rundqvist@outlook.com'),(133,6,'Sorena','Kjellin','sorena.kjellin@hotmail.com'),(134,16,'Eine','Roos','eine.roos@gmail.com'),(135,25,'Upul','Nordin','upul.nordin@live.se'),(136,44,'Gavin','Sahlberg','gavin.sahlberg@live.se'),(137,3,'Shamo','Norén','shamo.norén@live.se'),(138,24,'Alper','Rickardsson','alper.rickardsson@yahoo.com'),(139,5,'Ossian','Borg','ossian.borg@yahoo.com'),(140,48,'Idrissa','Östergren','idrissa.östergren@outlook.com'),(141,10,'Taulant','Östberg','taulant.östberg@gmail.com'),(142,25,'Melis','Fagerberg','melis.fagerberg@gmail.com'),(143,35,'Sorin','Hellsten','sorin.hellsten@gmail.com'),(144,24,'Fritjof','Olausson','fritjof.olausson@outlook.com'),(145,24,'Wenzel','Van','wenzel.van@outlook.com'),(146,22,'Bo-Bertil','Welin','bo-bertil.welin@live.se'),(147,16,'Lucky','Thulin','lucky.thulin@yahoo.com'),(148,26,'Chalak','Widlund','chalak.widlund@yahoo.com'),(149,14,'Nielsen','Viklund','nielsen.viklund@outlook.com'),(150,16,'Alpaslan','Nordell','alpaslan.nordell@hotmail.com'),(151,2,'Carl-Åke','Helin','carl-åke.helin@yahoo.com'),(152,39,'Matthis','Wahlström','matthis.wahlström@yahoo.com'),(153,20,'Musa','Jörgensen','musa.jörgensen@yahoo.com'),(154,39,'Hans Gunnar','Hallman','hans gunnar.hallman@outlook.com'),(155,7,'Nesim','Norberg','nesim.norberg@live.se'),(156,43,'Dannevid','Kjellberg','dannevid.kjellberg@live.se'),(157,25,'Per-Elof','Wikman','per-elof.wikman@hotmail.com'),(158,38,'Rubert','Ohlsson','rubert.ohlsson@yahoo.com'),(159,22,'Daniil','Classon','daniil.classon@hotmail.com'),(160,49,'Elna','Vall','elna.vall@live.se'),(161,28,'Teofik','Rundqvist','teofik.rundqvist@hotmail.com'),(162,16,'Romanus','Tillman','romanus.tillman@hotmail.com'),(163,25,'Bo-Håkan','Holmkvist','bo-håkan.holmkvist@yahoo.com'),(164,49,'Fridrik','Sandström','fridrik.sandström@yahoo.com'),(165,48,'Roderic','Kristoffersson','roderic.kristoffersson@yahoo.com'),(166,7,'Ove','Björkqvist','ove.björkqvist@live.se'),(167,22,'Corrado','Gummesson','corrado.gummesson@gmail.com'),(168,18,'Louie','Kjellberg','louie.kjellberg@outlook.com'),(169,7,'Astrit','Oscarsson','astrit.oscarsson@hotmail.com'),(170,43,'Remi','Karlsson','remi.karlsson@hotmail.com'),(171,50,'Debesay','Rodin','debesay.rodin@live.se'),(172,28,'Avdija','Zetterlund','avdija.zetterlund@yahoo.com'),(173,30,'Per-Arne','Hägglund','per-arne.hägglund@outlook.com'),(174,47,'Jan-Gustav','Bolin','jan-gustav.bolin@hotmail.com'),(175,24,'Johnn','Granlund','johnn.granlund@live.se'),(176,35,'Srboljub','Gudmundsson','srboljub.gudmundsson@outlook.com'),(177,39,'Jirjees','Berglund','jirjees.berglund@yahoo.com'),(178,31,'Yacin','Tillman','yacin.tillman@gmail.com'),(179,13,'Mohand','Wennberg','mohand.wennberg@yahoo.com'),(180,18,'Napoleon','Vesterlund','napoleon.vesterlund@hotmail.com'),(181,17,'Carl-Owe','Kristoffersson','carl-owe.kristoffersson@live.se'),(182,49,'Kassahun','Forslund','kassahun.forslund@outlook.com'),(183,1,'Hilal','Wendel','hilal.wendel@live.se'),(184,46,'Pavel','Jörgensen','pavel.jörgensen@gmail.com'),(185,40,'Miio','Sörensson','miio.sörensson@outlook.com'),(186,11,'Nicolo','Tuvesson','nicolo.tuvesson@hotmail.com'),(187,21,'Ludvik','Hellberg','ludvik.hellberg@outlook.com'),(188,3,'Dmitriy','Nyberg','dmitriy.nyberg@outlook.com'),(189,48,'Nore','Zackrisson','nore.zackrisson@outlook.com'),(190,25,'Waldo','Fridén','waldo.fridén@gmail.com'),(191,30,'Houcine','Edberg','houcine.edberg@yahoo.com'),(192,11,'Hård','Söderström','hård.söderström@yahoo.com'),(193,35,'Pär-Ove','Bengtsson','pär-ove.bengtsson@yahoo.com'),(194,12,'Kasimir','Olander','kasimir.olander@hotmail.com'),(195,41,'Arijan','Lindvall','arijan.lindvall@live.se'),(196,36,'Mogos','Hällgren','mogos.hällgren@gmail.com'),(197,24,'Mack','Lilja','mack.lilja@outlook.com'),(198,29,'Mana','Fröberg','mana.fröberg@outlook.com'),(199,39,'Qahraman','Söderberg','qahraman.söderberg@live.se'),(200,35,'Barna','Nordlund','barna.nordlund@yahoo.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39);
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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_parts`
--

LOCK TABLES `spare_parts` WRITE;
/*!40000 ALTER TABLE `spare_parts` DISABLE KEYS */;
INSERT INTO `spare_parts` VALUES (1,'Sticker, Flames','Awesome Flames',20),(2,'Sticker, Hearts','BFF',20),(3,'Sticker, Moose','King of the forest',20),(4,'Wunderbaum, Green','Pine',2),(5,'Wunderbaum, Pink','Rose',2),(6,'Wunderbaum, Yellow','Citrus',2),(7,'Wunderbaum, Brown','Wet Border Collie',2),(8,'Sleeves, Pink','Wool fur',15),(9,'Sleeves, Leopard','Leather',15),(10,'Sleeves, Fire','Oak',15),(11,'Bumper, Steel','Stainless steel',80),(12,'Bumper, Chrome','With molding hole',80),(13,'Bumper, Integrated lamps','LED',80),(14,'Subwoofer, B&O','200 W',250),(15,'Subwoofer, Sony','160 W',250),(16,'Subwoofer, JBL','120 W',250),(17,'Back door, Brown','Able',500),(18,'Subwoofer, Zebra','Querulous',250),(19,'Bumper, Pink','That',80),(20,'Front door, Flames','Whimsical',500),(21,'Seat cover, Yellow','Old-fashioned',200),(22,'Mug holder, Flames','Youthful',10),(23,'Mug holder, Leopard','Slim',10),(24,'Subwoofer, Pink','Self-reliant',250),(25,'Back door, Moose','Idle',500),(26,'Front door, Flames','Some',500),(27,'Sleeves, Moose','Disloyal',15),(28,'Head rest, Brown','Sure-footed',75),(29,'Head rest, Green','Scrawny',75),(30,'Front door, Yellow','Courageous',500),(31,'Sun cover, Yellow','Velvety',12),(32,'Back door, Green','Lucky',500),(33,'Mug holder, Green','Corny',10),(34,'Head rest, Brown','Mellow',75),(35,'Front door, Zebra','Bewitched',500),(36,'Sticker, Yellow','Big',20),(37,'Wheel cover, Zebra','Ornate',50),(38,'Head rest, Flames','Ample',75),(39,'Mug holder, Flames','Obese',10),(40,'Front door, Pink','Coordinated',500),(41,'Mug holder, Pink','Fatal',10),(42,'Back door, Flames','Silent',500),(43,'Sleeves, Zebra','Babyish',15),(44,'Sun cover, Yellow','Sparkling',12),(45,'Wunderbaum, Flames','Grateful',2),(46,'Sun cover, Flames','Right',12),(47,'Wheel cover, Moose','Forceful',50),(48,'Front door, Yellow','Nifty',500),(49,'Sleeves, Leopard','Gummy',15),(50,'Bumper, Pink','Sardonic',80),(51,'Mug holder, Pink','Decimal',10),(52,'Front door, Yellow','Skinny',500),(53,'Wheel cover, Tiger','Each',50),(54,'Subwoofer, Pink','Alive',250),(55,'Back door, Green','Proper',500),(56,'Bumper, Zebra','Stormy',80),(57,'Bumper, Flames','Favorable',80),(58,'Head rest, Leopard','Dopey',75),(59,'Seat cover, Pink','Plaintive',200),(60,'Wheel cover, Moose','Forthright',50),(61,'Front door, Flames','Wry',500),(62,'Wunderbaum, Zebra','Incredible',2),(63,'Mug holder, Zebra','Innocent',10),(64,'Seat cover, Zebra','Diligent',200),(65,'Wunderbaum, Tiger','Utilized',2),(66,'Sun cover, Moose','Poised',12),(67,'Sun cover, Leopard','Awkward',12),(68,'Back door, Green','Perfumed',500),(69,'Sun cover, Zebra','Outlandish',12),(70,'Subwoofer, Zebra','Single',250),(71,'Back door, Green','Spiffy',500),(72,'Back door, Zebra','Diligent',500),(73,'Back door, Leopard','Right',500),(74,'Sticker, Zebra','Quick',20),(75,'Wunderbaum, Moose','Hollow',2),(76,'Subwoofer, Flames','Trusty',250),(77,'Sticker, Green','Imaginary',20),(78,'Head rest, Green','Quarrelsome',75),(79,'Sticker, Brown','Serene',20),(80,'Sticker, Pink','Unwitting',20),(81,'Sun cover, Brown','Artistic',12),(82,'Sun cover, Yellow','Lumbering',12),(83,'Wheel cover, Brown','Luxurious',50),(84,'Subwoofer, Leopard','Back',250),(85,'Bumper, Pink','Young',80),(86,'Sleeves, Flames','Rowdy',15),(87,'Seat cover, Tiger','Witty',200),(88,'Seat cover, Flames','Posh',200),(89,'Back door, Green','Caring',500),(90,'Front door, Flames','Victorious',500),(91,'Sleeves, Moose','Delightful',15),(92,'Sun cover, Green','Stimulating',12),(93,'Sleeves, Moose','Cheerful',15),(94,'Head rest, Green','Charming',75),(95,'Sticker, Flames','Pessimistic',20),(96,'Head rest, Zebra','Funny',75),(97,'Bumper, Zebra','Profuse',80),(98,'Mug holder, Flames','Whimsical',10),(99,'Sleeves, Flames','Hard-to-find',15),(100,'Wunderbaum, Yellow','Striking',2),(101,'Head rest, Green','Dull',75),(102,'Bumper, Leopard','Visible',80),(103,'Back door, Moose','Worldly',500),(104,'Front door, Pink','Forked',500),(105,'Seat cover, Tiger','Open',200),(106,'Subwoofer, Yellow','Ripe',250),(107,'Mug holder, Leopard','Dear',10),(108,'Back door, Pink','Nonstop',500),(109,'Head rest, Leopard','Dimpled',75),(110,'Sleeves, Zebra','Lawful',15),(111,'Wunderbaum, Zebra','Delayed',2),(112,'Subwoofer, Tiger','Tangible',250),(113,'Sleeves, Flames','Heavenly',15),(114,'Subwoofer, Brown','Winding',250),(115,'Front door, Moose','Free',500),(116,'Back door, Tiger','Kindhearted',500),(117,'Wunderbaum, Yellow','Bright',2),(118,'Sticker, Yellow','Active',20),(119,'Bumper, Brown','Kindhearted',80),(120,'Sticker, Tiger','Normal',20),(121,'Seat cover, Brown','Vivid',200),(122,'Mug holder, Zebra','Content',10),(123,'Front door, Flames','Stylish',500),(124,'Bumper, Yellow','Live',80),(125,'Back door, Yellow','Sorrowful',500),(126,'Sleeves, Brown','Wooden',15),(127,'Head rest, Flames','Snarling',75),(128,'Bumper, Zebra','Classic',80),(129,'Sticker, Leopard','Plump',20),(130,'Sleeves, Moose','Grandiose',15),(131,'Subwoofer, Zebra','Educated',250),(132,'Wunderbaum, Pink','Hospitable',2),(133,'Sun cover, Pink','Affectionate',12),(134,'Wunderbaum, Green','Intent',2),(135,'Back door, Green','Hoarse',500),(136,'Back door, Zebra','Starry',500),(137,'Sleeves, Leopard','Creative',15),(138,'Wheel cover, Yellow','Impolite',50),(139,'Wheel cover, Green','Masculine',50),(140,'Sleeves, Green','Smart',15),(141,'Sticker, Pink','Total',20),(142,'Wunderbaum, Yellow','Terrific',2),(143,'Sleeves, Pink','Miniature',15),(144,'Sticker, Green','Elliptical',20),(145,'Back door, Pink','Strident',500),(146,'Wheel cover, Tiger','Damaged',50),(147,'Subwoofer, Moose','Limited',250),(148,'Back door, Moose','Quiet',500),(149,'Sticker, Flames','Acceptable',20),(150,'Bumper, Pink','Self-assured',80),(151,'Wunderbaum, Flames','Unknown',2),(152,'Wheel cover, Tiger','Knobby',50),(153,'Seat cover, Zebra','Attractive',200),(154,'Front door, Leopard','Stable',500),(155,'Back door, Green','Writhing',500),(156,'Seat cover, Flames','Proper',200),(157,'Bumper, Tiger','Tight',80),(158,'Seat cover, Pink','Talkative',200),(159,'Back door, Flames','Proper',500),(160,'Bumper, Brown','Abandoned',80),(161,'Sticker, Yellow','Bountiful',20),(162,'Wheel cover, Flames','Hearty',50),(163,'Wheel cover, Green','Unfinished',50),(164,'Subwoofer, Yellow','Wealthy',250),(165,'Wunderbaum, Pink','Variable',2),(166,'Seat cover, Yellow','Knowing',200);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (29,3),(9,6),(8,10),(7,11),(33,24),(22,35),(3,49),(20,51),(45,59),(2,68),(15,77),(17,82),(50,85),(28,89),(6,95),(4,97),(21,105),(16,116),(12,118),(36,130),(49,132),(30,144),(41,148),(40,149),(38,159),(48,165),(5,173),(25,185),(35,194),(24,205),(37,218),(11,224),(44,228),(46,230),(13,236),(23,288),(42,296),(27,306),(14,309),(19,318),(18,350),(26,353),(39,386),(10,391),(32,406),(1,410),(31,413),(34,418),(43,422),(47,431);
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,20),(2,21),(3,22),(4,23),(5,24),(6,25),(7,26),(8,27),(9,28),(10,29),(11,30),(12,31),(13,32),(14,33),(15,34),(16,35),(17,36),(18,37),(19,38),(20,39),(21,40),(22,41),(23,42),(24,43),(25,44),(26,45),(27,46),(28,47),(29,48),(30,49),(31,50),(32,51),(33,52),(34,53),(35,54),(36,55),(37,56),(38,57),(39,58),(40,59),(41,60),(42,61),(43,62),(44,63),(45,64),(46,65),(47,66),(48,67),(49,68),(50,69),(51,70),(52,71),(53,72),(54,73),(55,74),(56,75),(57,76),(58,77),(59,78),(60,79),(61,80),(62,81),(63,82),(64,83),(65,84),(66,85),(67,86),(68,87),(69,88),(70,89),(71,90),(72,91),(73,92),(74,93),(75,94),(76,95),(77,96),(78,97),(79,98),(80,99),(81,100);
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

-- Dump completed on 2021-12-02 18:41:13

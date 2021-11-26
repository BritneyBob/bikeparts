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
  CONSTRAINT `fk_addresses_address_types1` FOREIGN KEY (`address_type_id`) REFERENCES `address_types` (`address_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_addresses_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
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
  KEY `fk_auto_orders_suppliers1_idx` (`supplier_id`),
  CONSTRAINT `fk_auto_orders_spare_parts_in_stores1` FOREIGN KEY (`product_number`, `store_id`) REFERENCES `spare_parts_in_stores` (`product_number`, `store_id`),
  CONSTRAINT `fk_auto_orders_suppliers1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_models`
--

LOCK TABLES `car_models` WRITE;
/*!40000 ALTER TABLE `car_models` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_cars`
--

DROP TABLE IF EXISTS `customer_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_cars` (
  `license_number` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
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
  `manufacturer_id` int NOT NULL,
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
  `product_number` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `sell_price` float NOT NULL,
  PRIMARY KEY (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_parts`
--

LOCK TABLES `spare_parts` WRITE;
/*!40000 ALTER TABLE `spare_parts` DISABLE KEYS */;
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
  `supplier_id` int NOT NULL,
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

-- Dump completed on 2021-11-26 13:04:12

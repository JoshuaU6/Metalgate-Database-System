-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.35-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for metalgate_solutions
CREATE DATABASE IF NOT EXISTS `metalgate_solutions` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `metalgate_solutions`;

-- Dumping structure for table metalgate_solutions.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.customer: ~5 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`, `name`, `email`, `telephone`, `address`, `date`) VALUES
	(1, 'damilare', 'dami@ymail.com', '09099008877', 'shomolu, fola agoro', '2020-05-19 12:54:38'),
	(2, 'shola agoro', 'shola23@gmail.com', '07034564322', 'anthony village, Lagos', '2020-05-19 20:09:32'),
	(3, 'emmanuel samon', 'emmasam@gmail.com', '072904564322', 'oshodi, Lagos', '2020-05-19 20:09:32'),
	(4, 'lizzy owamzy', 'lizzfree@gmail.com', '00987654433', 'ikorodu, Lagos', '2020-05-19 20:09:32'),
	(5, 'ileri babz', 'ileri233@gmail.com', '07034564322', 'ikeja, Lagos', '2020-05-19 20:09:32');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.department
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.department: ~2 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id`, `name`, `description`, `date`) VALUES
	(1, 'engineering', 'repair and installation', '2020-05-19 20:41:48'),
	(2, 'sales', 'salling products and services', '2020-05-19 20:41:48');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  KEY `department` (`department`),
  KEY `FK_employee_status` (`status`),
  CONSTRAINT `FK_department` FOREIGN KEY (`department`) REFERENCES `department` (`name`) ON UPDATE CASCADE,
  CONSTRAINT `FK_employee_status` FOREIGN KEY (`status`) REFERENCES `status` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.employee: ~6 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`, `firstname`, `lastname`, `department`, `status`, `email`, `sex`, `telephone`, `image`, `address`, `date`) VALUES
	(6, 'damola', 'chisom', 'engineering', 'approved', 'dam33@yahoo.com', 'male', '0768654356', '', 'isolo, lagos', '2020-05-19 22:22:17'),
	(7, 'lola', 'ibrahim', 'sales', 'approved', 'dam33@yahoo.com', 'female', '0768654356', '', 'isolo, lagos', '2020-05-19 22:22:17'),
	(8, 'chinedu', 'kozehina', 'engineering', NULL, 'chiza3@yahoo.com', 'male', '0876543246', '', 'aja, lagos', '2020-05-19 22:22:17'),
	(9, 'sola', 'emmanuel', 'engineering', NULL, 'shozzy@yahoo.com', 'male', '0768654356', '', 'isolo, lagos', '2020-05-19 22:22:17'),
	(10, 'amaka', 'williams', 'sales', NULL, 'amzy@yahoo.com', 'female', '01253364356', '', 'iikoyi, lagos', '2020-05-19 22:22:17');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `amount` double NOT NULL,
  `issued_date` date NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_customer_invoice` (`customer_id`),
  KEY `FK_created_by` (`employee_id`),
  KEY `FK_invoice_status` (`status`),
  CONSTRAINT `FK_created_by` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_customer_invoice` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_invoice_status` FOREIGN KEY (`status`) REFERENCES `status` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.invoice: ~2 rows (approximately)
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`id`, `invoice_id`, `customer_id`, `employee_id`, `status`, `amount`, `issued_date`, `date`) VALUES
	(4, '23337659', 1, 7, 'approved', 50000, '2019-05-19', '2020-05-20 23:46:53'),
	(3, '23339999', 2, 7, 'approved', 30000, '2019-05-19', '2020-05-20 23:46:53');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(100) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_invoice_item` (`item_id`),
  KEY `FK_invoice_id` (`invoice_id`),
  CONSTRAINT `FK_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_invoice_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.invoice_item: ~2 rows (approximately)
/*!40000 ALTER TABLE `invoice_item` DISABLE KEYS */;
INSERT INTO `invoice_item` (`id`, `item_id`, `invoice_id`, `quantity`) VALUES
	(4, 'cctv camera', '23337659', 1),
	(5, 'wireless-mouse', '23339999', 1);
/*!40000 ALTER TABLE `invoice_item` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.items
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `specification` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `item_id` (`item_id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_category` (`category_id`),
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `item_category` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.items: ~4 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`, `name`, `category_id`, `price`, `description`, `specification`) VALUES
	(5, 'cctv camera', 'accessory', 50000, 'a cctv camera', 'cctv camera'),
	(3, 'hp-celeron', 'computer', 80000, 'a laptop', 'a computer system'),
	(4, 'hp-pentium', 'computer', 90000, 'a hp laptop', 'a computer system'),
	(1, 'wireless-mouse', 'accessory', 30000, 'a wireless mouse', 'wireless');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.item_category
CREATE TABLE IF NOT EXISTS `item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.item_category: ~3 rows (approximately)
/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
INSERT INTO `item_category` (`id`, `name`, `description`, `date`) VALUES
	(10, 'accessory', 'computer accessory', '2020-05-20 20:30:10'),
	(9, 'camera', 'cameras', '2020-05-20 20:30:10'),
	(8, 'computer', 'computer systems', '2020-05-20 20:30:10');
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.item_update
CREATE TABLE IF NOT EXISTS `item_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_item` (`item_id`),
  KEY `FK_item_status` (`status`),
  CONSTRAINT `FK_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`name`) ON UPDATE CASCADE,
  CONSTRAINT `FK_item_status` FOREIGN KEY (`status`) REFERENCES `status` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.item_update: ~2 rows (approximately)
/*!40000 ALTER TABLE `item_update` DISABLE KEYS */;
INSERT INTO `item_update` (`id`, `quantity`, `item_id`, `status`, `last_updated`) VALUES
	(3, 2, 'wireless-mouse', NULL, '2020-05-20 23:06:42'),
	(4, 1, 'cctv camera', NULL, '2020-05-20 23:06:42');
/*!40000 ALTER TABLE `item_update` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.purchase
CREATE TABLE IF NOT EXISTS `purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_purchased` date NOT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `FK_supplied_by` (`supplier_id`),
  KEY `FK_purchased_by` (`employee_id`),
  KEY `FK_purchse_status` (`status`),
  CONSTRAINT `FK_purchased_by` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchse_status` FOREIGN KEY (`status`) REFERENCES `status` (`name`) ON UPDATE CASCADE,
  CONSTRAINT `FK_supplied_by` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.purchase: ~3 rows (approximately)
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`purchase_id`, `supplier_id`, `employee_id`, `amount`, `status`, `note`, `date`, `date_purchased`) VALUES
	(1, 2, 10, 30000, NULL, 'wireless mouse.', '2020-05-20 00:00:00', '2020-03-12'),
	(2, 2, 10, 30000, NULL, '1 optical mouse.', '2020-05-20 22:22:15', '2020-03-05'),
	(3, 3, 10, 60000, NULL, '2 wiremless mouse.', '2020-05-20 22:22:15', '2020-03-07');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.purchase_list
CREATE TABLE IF NOT EXISTS `purchase_list` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `FK_purchase_id` (`purchase_id`),
  KEY `FK_purchased_item` (`item_id`),
  CONSTRAINT `FK_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchased_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.purchase_list: ~3 rows (approximately)
/*!40000 ALTER TABLE `purchase_list` DISABLE KEYS */;
INSERT INTO `purchase_list` (`list_id`, `purchase_id`, `item_id`, `quantity`) VALUES
	(5, 1, 'wireless-mouse', 2),
	(6, 2, 'wireless-mouse', 2),
	(7, 3, 'cctv camera', 1);
/*!40000 ALTER TABLE `purchase_list` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.quotation
CREATE TABLE IF NOT EXISTS `quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` varchar(50) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `amount` double NOT NULL,
  `date_issued` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`quotation_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `quotation_id` (`quotation_id`),
  KEY `FK_customer` (`customer_id`),
  KEY `FK_quotation_status` (`status`),
  KEY `FK_service_type` (`service_type`),
  CONSTRAINT `FK_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_quotation_status` FOREIGN KEY (`status`) REFERENCES `status` (`name`) ON UPDATE CASCADE,
  CONSTRAINT `FK_service_type` FOREIGN KEY (`service_type`) REFERENCES `service_type` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.quotation: ~2 rows (approximately)
/*!40000 ALTER TABLE `quotation` DISABLE KEYS */;
INSERT INTO `quotation` (`id`, `quotation_id`, `customer_id`, `status`, `service_type`, `note`, `amount`, `date_issued`, `date`) VALUES
	(3, '43r5567', 5, 'approved', 'repair', NULL, 20000, '2020-04-10 16:00:34', '2020-05-21 01:07:52'),
	(4, '6ty5433', 5, 'approved', 'cctv installation', NULL, 79000, '2020-05-20 11:00:34', '2020-05-21 01:07:52');
/*!40000 ALTER TABLE `quotation` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.receipt
CREATE TABLE IF NOT EXISTS `receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` varchar(50) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `quotation_id` varchar(100) DEFAULT NULL,
  `invoice_id` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `issued_date` datetime NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`receipt_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `receipt_id` (`receipt_id`),
  KEY `FK_issued_by` (`employee_id`),
  KEY `FK_receipt_status` (`status`),
  KEY `FK_receipt_type` (`type`),
  KEY `FK_quotation_receipt` (`quotation_id`),
  KEY `FK_invoice_receipt` (`invoice_id`),
  CONSTRAINT `FK_invoice_receipt` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_issued_by` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_quotation_receipt` FOREIGN KEY (`quotation_id`) REFERENCES `quotation` (`quotation_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_receipt_status` FOREIGN KEY (`status`) REFERENCES `status` (`name`) ON UPDATE CASCADE,
  CONSTRAINT `FK_receipt_type` FOREIGN KEY (`type`) REFERENCES `receipt_type` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.receipt: ~4 rows (approximately)
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` (`id`, `receipt_id`, `employee_id`, `quotation_id`, `invoice_id`, `status`, `issued_date`, `type`, `date`) VALUES
	(6, '2111yr3', 8, '43r5567', NULL, 'approved', '2020-05-21 01:36:11', 'service', '2020-05-21 01:44:07'),
	(7, '2156yr3', 8, '6ty5433', NULL, 'approved', '2020-05-21 01:36:11', 'service', '2020-05-21 01:44:07'),
	(9, '2333rewqq', 9, NULL, '23339999', 'approved', '2020-05-21 11:40:48', 'product', '2020-05-21 01:44:07'),
	(8, '34re22', 9, NULL, '23337659', 'approved', '2020-05-21 01:40:48', 'product', '2020-05-21 01:44:07');
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.receipt_type
CREATE TABLE IF NOT EXISTS `receipt_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.receipt_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `receipt_type` DISABLE KEYS */;
INSERT INTO `receipt_type` (`id`, `name`, `description`, `date`) VALUES
	(1, 'product', 'sales of goods receipt', '2020-05-21 01:18:53'),
	(2, 'service', 'service receipt', '2020-05-21 01:18:54');
/*!40000 ALTER TABLE `receipt_type` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.service
CREATE TABLE IF NOT EXISTS `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `receipt_id` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `FK_rendered_by` (`employee_id`),
  KEY `FK_service_receipt` (`receipt_id`),
  CONSTRAINT `FK_rendered_by` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_service_receipt` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`receipt_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.service: ~2 rows (approximately)
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` (`service_id`, `employee_id`, `receipt_id`, `date`, `start_date`, `end_date`) VALUES
	(4, 8, '2156yr3', '2020-05-21 02:11:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 8, '2111yr3', '2020-05-21 02:09:51', '2020-04-21 02:09:55', '2020-05-20 12:10:10');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.service_type
CREATE TABLE IF NOT EXISTS `service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.service_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
INSERT INTO `service_type` (`id`, `name`, `description`, `date`) VALUES
	(4, 'cctv installation', 'cctv install', '2020-05-21 01:51:11'),
	(5, 'repair', 'repair', '2020-05-21 01:51:11');
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.status: ~2 rows (approximately)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`, `name`, `description`, `date`) VALUES
	(1, 'approved', 'data has been approved and finalzed', '2020-05-19 22:00:16'),
	(2, 'pending', 'data is pending', '2020-05-19 22:00:16');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Dumping structure for table metalgate_solutions.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `bank_details` varchar(255) NOT NULL,
  `website` varchar(100) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table metalgate_solutions.supplier: ~2 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`supplier_id`, `name`, `email`, `address`, `telephone`, `bank_details`, `website`, `note`, `date`) VALUES
	(2, 'dotech', 'sales@dotech.com.ng', 'isolo, lagos', '089765446', '', 'dotech.com.ng', 'computer and computer asseccoeries', '2020-05-20 22:06:51'),
	(3, 'noraktech', 'sales@noraktech.com.ng', 'anthony, lagos', '07654465786', '', 'noraktech.com.ng', 'camera and computer asseccoeries', '2020-05-20 22:06:52');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 26, 2020 at 04:57 PM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_booking`
--

CREATE TABLE IF NOT EXISTS `tb_booking` (
  `book_id` int(20) NOT NULL AUTO_INCREMENT,
  `cust_id` int(20) NOT NULL,
  `cat_id` int(20) NOT NULL,
  `pack_id` int(20) NOT NULL,
  `schedule_id` int(20) NOT NULL,
  `doj` varchar(25) NOT NULL,
  `book_date` varchar(25) NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `pack_id` (`pack_id`),
  KEY `schedule_id` (`schedule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `tb_booking`
--

INSERT INTO `tb_booking` (`book_id`, `cust_id`, `cat_id`, `pack_id`, `schedule_id`, `doj`, `book_date`) VALUES
(39, 14, 19, 18, 18, '2020-12-01', '2020-11-26'),
(40, 11, 5, 17, 15, '2020-12-02', '2020-11-26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_card`
--

CREATE TABLE IF NOT EXISTS `tb_card` (
  `card_no` varchar(100) NOT NULL,
  `cust_id` int(20) NOT NULL,
  `card_name` varchar(20) NOT NULL,
  `exp_date` varchar(100) NOT NULL,
  `card_typ` varchar(10) NOT NULL,
  PRIMARY KEY (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_card`
--

INSERT INTO `tb_card` (`card_no`, `cust_id`, `card_name`, `exp_date`, `card_typ`) VALUES
('4562 7899 4566 1236', 11, 'G BRISTOW', '12/2025', 'debit'),
('7894 5612 3336 1235', 14, 'Nithesh S Menon', '12/2020', 'debit'),
('7894 5621 1230 5777', 11, 'George Bristow', '01/2022', 'debit'),
('7896 4566 3214 5698', 11, 'George Bristow', '12/2022', 'debit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE IF NOT EXISTS `tb_category` (
  `cat_id` int(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`cat_id`, `cat_name`) VALUES
(5, 'Male 20-25'),
(19, 'Male30-40'),
(20, 'Male 40-50'),
(21, 'Male 50+'),
(22, 'Male 41');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE IF NOT EXISTS `tb_customer` (
  `cust_id` int(20) NOT NULL AUTO_INCREMENT,
  `cust_username` varchar(20) NOT NULL,
  `cust_firstname` varchar(20) NOT NULL,
  `cust_lastname` varchar(20) NOT NULL,
  `cust_age` int(2) NOT NULL,
  `cust_gen` char(1) NOT NULL,
  `cust_hname` varchar(20) NOT NULL,
  `cust_city` varchar(20) NOT NULL,
  `cust_pin` varchar(10) NOT NULL,
  `cust_phno` bigint(10) NOT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_username` (`cust_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`cust_id`, `cust_username`, `cust_firstname`, `cust_lastname`, `cust_age`, `cust_gen`, `cust_hname`, `cust_city`, `cust_pin`, `cust_phno`) VALUES
(11, 'gbristow@gmail.com', 'George', 'Bristow', 23, 'M', 'Palarivattom', 'Ernakulam', '682025', 9895412325),
(13, 'john@gmail.com', 'John', 'S', 23, 'M', 'Vinci Homes', 'Ernakulam', '682024', 9874567894),
(14, 'jeffery@gmail.com', 'Jeffery', 'Archer', 45, 'M', 'Dan Home', 'Ernakulam', '682025', 9895464125),
(16, 'dan@gmail.com', 'Dan', 'Brown', 23, 'M', 'Mmm', 'Eee', '789456', 9895456654);

-- --------------------------------------------------------

--
-- Table structure for table `tb_log`
--

CREATE TABLE IF NOT EXISTS `tb_log` (
  `username` varchar(20) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_log`
--

INSERT INTO `tb_log` (`username`, `usertype`, `password`) VALUES
('admin@gmail.com', 'admin', 'admin@123'),
('aks@gmail.com', 'staff', 'Akshai123'),
('amal@gmail.com', 'staff', 'Amal12345'),
('dan@gmail.com', 'customer', 'Dan12345678'),
('gav@gmail.com', 'staff', 'Gavin1234'),
('gbristow@gmail.com', 'customer', 'Gbristow@123'),
('jeffery@gmail.com', 'customer', 'Jarcher123'),
('john@gmail.com', 'customer', 'John1234'),
('nithesh@gmail.com', 'staff', 'Nithesh123'),
('nitheshsmenon13@gmai', 'customer', 'Qwerty123'),
('qws@gmail.com', 'staff', 'Qws123456'),
('sureshmenon.b@gmail.', 'customer', 'Suresh123');

-- --------------------------------------------------------

--
-- Table structure for table `tb_package`
--

CREATE TABLE IF NOT EXISTS `tb_package` (
  `pack_id` int(20) NOT NULL AUTO_INCREMENT,
  `pack_name` char(20) NOT NULL,
  `pack_rate` int(5) NOT NULL,
  PRIMARY KEY (`pack_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tb_package`
--

INSERT INTO `tb_package` (`pack_id`, `pack_name`, `pack_rate`) VALUES
(1, 'Weight Training', 800),
(17, 'Aerobic', 800),
(18, 'Posture correction', 1000),
(19, 'Weight Loss', 800),
(20, 'Wiegth gain', 900);

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE IF NOT EXISTS `tb_payment` (
  `pay_id` int(20) NOT NULL AUTO_INCREMENT,
  `book_id` int(20) NOT NULL,
  `card_no` varchar(255) NOT NULL,
  `payment_mode` varchar(20) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `payment_date` varchar(100) NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tb_payment`
--

INSERT INTO `tb_payment` (`pay_id`, `book_id`, `card_no`, `payment_mode`, `payment_status`, `payment_date`) VALUES
(12, 39, '7894 5612 3336 1235', 'Online', 'successful', '2020/11/26'),
(13, 38, '4562 7899 4566 1236', 'Online', 'successful', '2020/11/26'),
(14, 40, '7896 4566 3214 5698', 'Online', 'successful', '2020/11/26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_schedule`
--

CREATE TABLE IF NOT EXISTS `tb_schedule` (
  `schedule_id` int(20) NOT NULL AUTO_INCREMENT,
  `trainer_id` int(20) NOT NULL,
  `schedule_stime` time NOT NULL,
  `schedule_etime` time NOT NULL,
  `alloc_num` varchar(25) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `trainer_id` (`trainer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tb_schedule`
--

INSERT INTO `tb_schedule` (`schedule_id`, `trainer_id`, `schedule_stime`, `schedule_etime`, `alloc_num`) VALUES
(14, 40, '05:00:00', '08:00:00', '15'),
(15, 34, '06:00:00', '09:00:00', '15'),
(18, 41, '17:00:00', '20:00:00', '15'),
(20, 34, '04:00:00', '09:00:00', '10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_trainer`
--

CREATE TABLE IF NOT EXISTS `tb_trainer` (
  `trainer_id` int(20) NOT NULL AUTO_INCREMENT,
  `trainer_username` varchar(20) NOT NULL,
  `trainer_firstname` varchar(20) NOT NULL,
  `trainer_lastname` varchar(20) NOT NULL,
  `trainer_age` int(2) NOT NULL,
  `trainer_gen` varchar(1) NOT NULL,
  `trainer_hname` varchar(20) NOT NULL,
  `trainer_city` varchar(20) NOT NULL,
  `trainer_pin` varchar(10) NOT NULL,
  `trainer_phno` bigint(25) NOT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `trainer_username` (`trainer_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `tb_trainer`
--

INSERT INTO `tb_trainer` (`trainer_id`, `trainer_username`, `trainer_firstname`, `trainer_lastname`, `trainer_age`, `trainer_gen`, `trainer_hname`, `trainer_city`, `trainer_pin`, `trainer_phno`) VALUES
(34, 'nithesh@gmail.com', 'Nithesh', 'Menon', 29, 'M', 'Manimala Cross Road', 'Ernakulam', '682024', 9895123301),
(40, 'aks@gmail.com', 'Akshai', 'M', 26, 'M', 'Rose Villa', 'Ernakulam', '682024', 7894561231),
(41, 'gav@gmail.com', 'Gavin', 'CW', 25, 'M', 'Home', 'Ernakulam', '682024', 9874568521),
(43, 'amal@gmail.com', 'Amal', 'R', 26, 'M', 'VILAA', 'Ernakulam', '682024', 9895123369);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_booking`
--
ALTER TABLE `tb_booking`
  ADD CONSTRAINT `tb_booking_ibfk_1` FOREIGN KEY (`pack_id`) REFERENCES `tb_package` (`pack_id`),
  ADD CONSTRAINT `tb_booking_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `tb_schedule` (`schedule_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

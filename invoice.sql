-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:41 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_id_master`
--

CREATE TABLE `customer_id_master` (
  `identifier` varchar(50) NOT NULL,
  `current_number` int(11) DEFAULT NULL,
  `end_range` varchar(255) DEFAULT NULL,
  `increment` int(11) DEFAULT NULL,
  `prefix` varchar(45) DEFAULT NULL,
  `start_range` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer_id_master`
--

INSERT INTO `customer_id_master` (`identifier`, `current_number`, `end_range`, `increment`, `prefix`, `start_range`) VALUES
('PCS', 1002, '99999', 1, 'PCS', '00000');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_admin_table`
--

CREATE TABLE `invoice_admin_table` (
  `hr_id` varchar(15) NOT NULL,
  `hr_name` varchar(100) NOT NULL,
  `hr_pass` varchar(200) NOT NULL,
  `hr_email` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_admin_table`
--

INSERT INTO `invoice_admin_table` (`hr_id`, `hr_name`, `hr_pass`, `hr_email`, `date`) VALUES
('8086', 'Shinjan Sardar', 'f3bbb6f57e917f58474a9bb3dc303d9a', 'shinjan.pcsglobal@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_bank_name`
--

CREATE TABLE `invoice_bank_name` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(45) NOT NULL,
  `bank_full_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_bank_name`
--

INSERT INTO `invoice_bank_name` (`bank_id`, `bank_name`, `bank_full_name`) VALUES
(1, 'AXIS', 'Axis Bank'),
(2, 'BOB', 'BANK OF BARODA'),
(3, 'BOI', 'BANK OF INDIA'),
(4, 'BOM', 'BANK OF MAHARASHTRA'),
(5, 'CANARA', 'CANARA BANK'),
(6, 'CBI', 'CENTRAL BANK OF INDIA'),
(7, 'FB', 'Federal Bank'),
(8, 'HDFC', 'HDFC Bank'),
(9, 'IB', 'INDIAN BANK'),
(10, 'IBH', 'IND BANK HOUSING LTD.'),
(11, 'ICICI', 'ICICI Bank'),
(12, 'IDBI', 'IDBI Bank'),
(13, 'IDFCF', 'IDFC First Bank'),
(14, 'IMBS', 'INDBANK  BANKING SERVICES '),
(15, 'INDB', 'IndusInd Bank'),
(16, 'ISB', 'INDIAN OVERSEAS BANK'),
(17, 'JKB', 'Jammu and Kashmir Bank'),
(18, 'KMB', 'Kotak Mahindra Bank'),
(19, 'PNB', 'PUNJAB NATIONAL BANK'),
(20, 'PNBG', 'PNB GILTS LTD.'),
(21, 'PSB', 'PUNJAB & SIND BANK'),
(22, 'SBI', 'STATE BANK OF INDIA'),
(23, 'UBI', 'UNION BANK OF INDIA'),
(24, 'UCO', 'UCO BANK'),
(25, 'YES', 'Yes Bank'),
(26, 'NA', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_branch_details`
--

CREATE TABLE `invoice_branch_details` (
  `branch_id` varchar(15) NOT NULL,
  `branch_address` text NOT NULL,
  `branch_location` varchar(45) NOT NULL,
  `branch_mail_id` varchar(150) NOT NULL,
  `branch_contact_no1` varchar(40) NOT NULL,
  `branch_contact_no2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_branch_details`
--

INSERT INTO `invoice_branch_details` (`branch_id`, `branch_address`, `branch_location`, `branch_mail_id`, `branch_contact_no1`, `branch_contact_no2`) VALUES
('PCS01', 'Suite - 914, DN-51, Merlin Infinite, Sector-V, Salt Lake, Kolkata - 700091', 'Kolkata', 'careers@pcsglobal.in ', '(033) 40012426', '+91 8910666268 '),
('PCS02', 'DN-36, Primarc Tower, 8th Floor, Unit-801, Sec-V, Saltlake, Kol-91. West Bengal.', 'Kolkata', 'careers@pcsglobal.in', '(033) 40012426', '+91 8910666268 '),
('PCS03', '196/A, 1st floor, 4th Cross Road, KHB Colony, 5th Block, Koramangala, Bengaluru, Karnataka - 560095', 'Bangaluru', 'careers.bengaluru@pcsglobal.in', '6289345920', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_collection_history`
--

CREATE TABLE `invoice_collection_history` (
  `sl_no` int(11) NOT NULL,
  `hr_id` varchar(45) NOT NULL,
  `month` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_customer_registration`
--

CREATE TABLE `invoice_customer_registration` (
  `customer_id` varchar(20) NOT NULL,
  `hr_id` varchar(15) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(105) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `customer_location` varchar(45) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_altphone` varchar(45) NOT NULL,
  `customer_training` varchar(15) NOT NULL,
  `customer_subject` varchar(45) NOT NULL,
  `customer_join` varchar(25) NOT NULL,
  `customer_duration` varchar(45) NOT NULL,
  `regs_date` varchar(25) NOT NULL,
  `regs_fees` varchar(15) NOT NULL,
  `installment` varchar(45) NOT NULL,
  `branch_id` varchar(45) NOT NULL,
  `invoice_status` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_email`
--

CREATE TABLE `invoice_email` (
  `sl_no` int(11) NOT NULL,
  `ccname` varchar(50) DEFAULT NULL,
  `ccemail` varchar(50) DEFAULT NULL,
  `bccname` varchar(45) DEFAULT NULL,
  `bccemail` varchar(45) DEFAULT NULL,
  `reg_date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_email`
--

INSERT INTO `invoice_email` (`sl_no`, `ccname`, `ccemail`, `bccname`, `bccemail`, `reg_date`) VALUES
(2, 'Alok Saha', 'alok.pcsglobal@gmail.com', 'Sunit Chaudhuri', 'sunitchaudhuri@pcsglobal.in', '06/07/2020');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_excel`
--

CREATE TABLE `invoice_excel` (
  `sl_no` int(11) NOT NULL,
  `hr_id` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_excel_sup`
--

CREATE TABLE `invoice_excel_sup` (
  `sl_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_file`
--

CREATE TABLE `invoice_file` (
  `invoice_id` varchar(45) NOT NULL,
  `invoice_path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_id`
--

CREATE TABLE `invoice_id` (
  `identifier` varchar(10) NOT NULL,
  `current_no` int(11) DEFAULT NULL,
  `end_range` varchar(45) DEFAULT NULL,
  `increment` varchar(45) DEFAULT NULL,
  `start_range` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_id`
--

INSERT INTO `invoice_id` (`identifier`, `current_no`, `end_range`, `increment`, `start_range`) VALUES
('PCS', 369, '9999', '1', '0000');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_superviser_table`
--

CREATE TABLE `invoice_superviser_table` (
  `superviser_id` varchar(45) NOT NULL,
  `superviser_name` varchar(45) NOT NULL,
  `superviser_pass` varchar(200) NOT NULL,
  `superviser_email` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_superviser_table`
--

INSERT INTO `invoice_superviser_table` (`superviser_id`, `superviser_name`, `superviser_pass`, `superviser_email`, `date`) VALUES
('1269', 'Soumyak Konar', '81dc1929f6b74b546452d637b2b9f9ab', 'hrm.pcsglobal@gmail.com', '07/05/2021 20:49:03'),
('3456', 'Mr. Aloke Haldar', '5cb67a7546a1c4fa44849b91e88279f1', 'aloke@gmail.com', '31/07/2020 20:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_table`
--

CREATE TABLE `invoice_table` (
  `invoice_no` varchar(15) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `invoice_date` varchar(15) NOT NULL,
  `amount_payable` int(11) NOT NULL,
  `gst_amount` int(11) NOT NULL,
  `total_amount_payable` int(11) NOT NULL,
  `hr_id` varchar(45) NOT NULL,
  `due` int(11) NOT NULL,
  `branch_id` varchar(300) DEFAULT NULL,
  `payment_mode` varchar(45) NOT NULL,
  `bank` varchar(45) NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `installment` varchar(45) NOT NULL,
  `installment_no` int(11) NOT NULL,
  `invoice_status` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `otp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_id_master`
--
ALTER TABLE `customer_id_master`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `invoice_admin_table`
--
ALTER TABLE `invoice_admin_table`
  ADD PRIMARY KEY (`hr_id`);

--
-- Indexes for table `invoice_bank_name`
--
ALTER TABLE `invoice_bank_name`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `invoice_branch_details`
--
ALTER TABLE `invoice_branch_details`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `invoice_collection_history`
--
ALTER TABLE `invoice_collection_history`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `invoice_customer_registration`
--
ALTER TABLE `invoice_customer_registration`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `invoice_email`
--
ALTER TABLE `invoice_email`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `invoice_excel`
--
ALTER TABLE `invoice_excel`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `invoice_excel_sup`
--
ALTER TABLE `invoice_excel_sup`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `invoice_file`
--
ALTER TABLE `invoice_file`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `invoice_id`
--
ALTER TABLE `invoice_id`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `invoice_superviser_table`
--
ALTER TABLE `invoice_superviser_table`
  ADD PRIMARY KEY (`superviser_id`);

--
-- Indexes for table `invoice_table`
--
ALTER TABLE `invoice_table`
  ADD PRIMARY KEY (`invoice_no`),
  ADD KEY `fk2_idx` (`customer_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_bank_name`
--
ALTER TABLE `invoice_bank_name`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `invoice_collection_history`
--
ALTER TABLE `invoice_collection_history`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_email`
--
ALTER TABLE `invoice_email`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_excel`
--
ALTER TABLE `invoice_excel`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_excel_sup`
--
ALTER TABLE `invoice_excel_sup`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

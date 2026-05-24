-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:42 PM
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
-- Database: `pcs_calender`
--

-- --------------------------------------------------------

--
-- Table structure for table `calender_info_details`
--

CREATE TABLE `calender_info_details` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `meeting_category` varchar(255) DEFAULT NULL,
  `meeting_id` varchar(220) DEFAULT NULL,
  `meeting_occurance_type` char(1) DEFAULT NULL,
  `meeting_short_description` varchar(255) DEFAULT NULL,
  `meeting_start_date` date DEFAULT NULL,
  `meeting_end_date` date DEFAULT NULL,
  `meeting_start_time` varchar(10) DEFAULT NULL,
  `meeting_title` varchar(255) DEFAULT NULL,
  `meeting_end_time` varchar(10) DEFAULT NULL,
  `meeting_passcode` varchar(100) DEFAULT NULL,
  `zoom_url` varchar(255) DEFAULT NULL,
  `meeting_start_meridiem` varchar(3) DEFAULT NULL,
  `meeting_end_meridiem` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `calender_info_details`
--

INSERT INTO `calender_info_details` (`id`, `branch_name`, `meeting_category`, `meeting_id`, `meeting_occurance_type`, `meeting_short_description`, `meeting_start_date`, `meeting_end_date`, `meeting_start_time`, `meeting_title`, `meeting_end_time`, `meeting_passcode`, `zoom_url`, `meeting_start_meridiem`, `meeting_end_meridiem`) VALUES
(83, 'BBS', 'Bhubaneswar', 'Test456', 'S', 'Java', '2023-05-26', '2023-04-27', '7:00', 'Java', '9:30', 'Test5', 'www.zoom7', 'AM', 'AM'),
(84, 'GLOBAL', 'GLOBAL', 'Test789', 'S', 'AZURE BIG DATA', '2023-08-25', '2023-04-30', '9:00', ' AZURE', '5:00', 'Test7', 'www.zoom8', 'AM', 'PM'),
(86, 'BBS', 'Bhubaneswar', 'Test7890', 'S', 'GCP AI', '2023-05-11', '2023-04-19', '9:00', ' GCP-4', '5:00', 'Test10', 'www.zoom9', 'AM', 'PM'),
(93, 'BBS', 'Bhubaneswar', '9089', 'S', 'Terraform Advanced', '2023-05-22', '2023-05-22', '9:00', ' DevOps', '5:00', 'PetroBtyu', 'www.ytur.com', 'AM', 'PM'),
(96, 'BBS', 'Bhubaneswar', '345', 'S', 'salesforce', '2023-05-19', '2023-05-25', '12:30', ' salesforce', '1:00', '345', 'www.rediff', 'PM', 'PM'),
(99, 'MAH', 'MAH', '87034876320', 'S', 'salesforce', '2023-05-28', '2023-05-28', '2:00', ' salesforce', '3:00', '980817', 'https://us06web.zoom.us/j/87034876320?pwd=ckltVGZTZmxWRXdPVmV2eS82bWdRQT09', 'PM', 'PM'),
(100, 'GLOBAL', 'Global', '868 4022 7776', 'M', 'SESSION 8 - JAVA FSD TRAINING', '2023-05-30', '2023-05-30', '5:00', 'JAVA FSD TRAINING', '7:00', '232124', 'https://us06web.zoom.us/j/86840227776?pwd=WFYrblNiMDBnODE1UkltbmNtVUVIUT09', 'PM', 'PM'),
(104, 'KOL', 'GLOBAL', '4845611691	', 'M', '', '2023-06-29', '2023-06-29', '6:30', ' Data Science (Advance Python ) by Emdadul Haque', '8:00', '#12345', 'https://us02web.zoom.us/j/4845611691?pwd=c216cnZBUzlndmp0WmdURExQVFQ3QT09', 'PM', 'PM'),
(110, 'KOL', 'KOL', '4845611691', 'S', '', '2023-06-27', '2023-06-27', '6:30', ' Data Science(Advance Python) by Emdadul Haque', '8:00', '#12345', 'https://us02web.zoom.us/j/4845611691?pwd=c216cnZBUzlndmp0WmdURExQVFQ3QT09', 'PM', 'PM');

-- --------------------------------------------------------

--
-- Table structure for table `employee_user_profile`
--

CREATE TABLE `employee_user_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_call_name` varchar(45) DEFAULT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `user_role` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_user_profile`
--

INSERT INTO `employee_user_profile` (`id`, `user_id`, `user_name`, `user_password`, `user_call_name`, `user_role_id`, `user_role`) VALUES
(3, 983, 'Haimanti', 'pcsglobal@123', 'Haimanti', 1, 'Admin'),
(4, 1491, 'Nishi', 'pcsglobal@1233', 'Nishi', 2, 'Trainee Software Developer'),
(6, 1470, 'Lokesh', 'pcsglobal@47', 'Lokesh', 3, 'HR');

-- --------------------------------------------------------

--
-- Table structure for table `office_locations`
--

CREATE TABLE `office_locations` (
  `branch_code` varchar(45) DEFAULT NULL,
  `branch_name` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `office_locations`
--

INSERT INTO `office_locations` (`branch_code`, `branch_name`, `id`) VALUES
('BBS', 'Bhubaneswar', 1),
('BTM', 'BTM Layout', 2),
('GLOBAL', 'Global', 3),
('KOL', 'Kolkata', 4),
('MAH', 'Mahadevpura', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_role` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `user_call_name` varchar(255) DEFAULT NULL,
  `user_role_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_name`, `user_password`, `user_role`, `user_id`, `id`, `user_call_name`, `user_role_id`) VALUES
('trainee', 'pcs@123', 'trainee', 100, 6, 'trainee', 'trainee'),
('Lokesh', 'admin@432', 'Admin', 1254, 3, NULL, NULL),
('Murali', 'Murali@4321', 'Trainer', 1618, 5, 'Murali', '4'),
('Guest', 'PasswordNeverChange@987', 'Guest', 9876, 5, NULL, NULL),
('Haimanti', 'Test@123', 'Developer', 12345, 1, NULL, NULL),
('Nishi', 'Demo@123', 'Tester', 54321, 2, NULL, NULL),
('Trainer', 'Trainer@123', 'Trainer', 54322, 4, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calender_info_details`
--
ALTER TABLE `calender_info_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_id_UNIQUE` (`meeting_id`);

--
-- Indexes for table `employee_user_profile`
--
ALTER TABLE `employee_user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_locations`
--
ALTER TABLE `office_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `branch_code_UNIQUE` (`branch_code`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calender_info_details`
--
ALTER TABLE `calender_info_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `employee_user_profile`
--
ALTER TABLE `employee_user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:43 PM
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
-- Database: `pcsrentalsystem_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `admin_username` varchar(45) NOT NULL,
  `admin_password` varchar(45) NOT NULL,
  `admin_email_id` varchar(45) NOT NULL,
  `admin_role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int(11) NOT NULL,
  `notice_title` varchar(100) NOT NULL,
  `notice_message` text NOT NULL,
  `notice_date` date NOT NULL,
  `target` varchar(20) NOT NULL,
  `tanent_id` int(11) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`notice_id`, `notice_title`, `notice_message`, `notice_date`, `target`, `tanent_id`, `created_by`) VALUES
(1, 'Maintenance Alert', 'Water supply will be unavailable tomorrow from 10 AM to 1 PM', '2026-01-05', 'ALL', NULL, 'ADMIN'),
(2, 'Rent Reminder', 'Please pay rent before 10th of this month', '2026-01-05', 'TENANT', NULL, 'OWNER'),
(3, 'Agreement Pending', 'Please accept agreement to access office details', '2026-01-05', 'TENANT', 25, 'SYSTEM');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_type`, `user_id`, `message`, `is_read`, `created_at`) VALUES
(1, 'ADMIN', 1, 'New office added by owner: kavya s. Approval required.', 0, '2026-01-13 07:21:14'),
(2, 'TENANT', 1, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(3, 'TENANT', 24, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(4, 'TENANT', 25, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(5, 'TENANT', 26, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(6, 'TENANT', 27, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(7, 'TENANT', 37, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(8, 'TENANT', 38, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(9, 'TENANT', 39, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(10, 'TENANT', 40, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(11, 'TENANT', 42, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(12, 'TENANT', 43, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(13, 'TENANT', 44, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(14, 'TENANT', 45, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(15, 'TENANT', 46, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(16, 'TENANT', 47, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(17, 'TENANT', 48, 'New office space available in bangalore', 0, '2026-01-13 07:23:06'),
(18, 'ADMIN', 1, 'New office added by owner: kavya s. Approval required.', 0, '2026-01-13 11:10:20'),
(19, 'ADMIN', 1, 'New office added by owner: kavya s. Approval required.', 0, '2026-01-13 11:22:59'),
(20, 'ADMIN', 1, 'New office added by owner: sunitha. Approval required.', 0, '2026-01-13 11:24:18'),
(21, 'OWNER', 55, 'Your office \"hk482004 pvt\" has been approved.', 0, '2026-01-13 11:24:47'),
(22, 'TENANT', 1, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(23, 'TENANT', 24, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(24, 'TENANT', 25, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(25, 'TENANT', 26, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(26, 'TENANT', 27, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(27, 'TENANT', 37, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(28, 'TENANT', 38, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(29, 'TENANT', 39, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(30, 'TENANT', 40, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(31, 'TENANT', 42, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(32, 'TENANT', 43, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(33, 'TENANT', 44, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(34, 'TENANT', 45, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(35, 'TENANT', 46, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(36, 'TENANT', 47, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(37, 'TENANT', 48, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(38, 'TENANT', 49, 'Office \"hk482004 pvt\" by owner \"sunitha\" is now available. Check it out.', 0, '2026-01-13 11:24:47'),
(39, 'ADMIN', 1, 'New office added by owner: basamma. Approval required.', 0, '2026-01-14 08:25:26'),
(40, 'OWNER', 57, 'Your office \"basamma pvt\" has been approved.', 0, '2026-01-14 08:26:41'),
(41, 'TENANT', 1, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(42, 'TENANT', 24, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(43, 'TENANT', 25, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(44, 'TENANT', 26, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(45, 'TENANT', 27, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(46, 'TENANT', 37, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(47, 'TENANT', 38, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(48, 'TENANT', 39, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(49, 'TENANT', 40, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(50, 'TENANT', 42, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:41'),
(51, 'TENANT', 43, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(52, 'TENANT', 44, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(53, 'TENANT', 45, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(54, 'TENANT', 46, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(55, 'TENANT', 47, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(56, 'TENANT', 48, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(57, 'TENANT', 49, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(58, 'TENANT', 50, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(59, 'TENANT', 51, 'Office \"basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:26:42'),
(60, 'ADMIN', 1, 'New office added by owner: basamma. Approval required.', 0, '2026-01-14 08:32:55'),
(61, 'OWNER', 57, 'Your office \"Basamma pvt\" has been approved.', 0, '2026-01-14 08:34:26'),
(62, 'TENANT', 1, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(63, 'TENANT', 24, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(64, 'TENANT', 25, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(65, 'TENANT', 26, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(66, 'TENANT', 27, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(67, 'TENANT', 37, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(68, 'TENANT', 38, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(69, 'TENANT', 39, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(70, 'TENANT', 40, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:26'),
(71, 'TENANT', 42, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(72, 'TENANT', 43, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(73, 'TENANT', 44, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(74, 'TENANT', 45, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(75, 'TENANT', 46, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(76, 'TENANT', 47, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(77, 'TENANT', 48, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(78, 'TENANT', 49, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(79, 'TENANT', 50, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(80, 'TENANT', 51, 'Office \"Basamma pvt\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 08:34:27'),
(81, 'ADMIN', 1, 'New office added by owner: basamma. Approval required.', 0, '2026-01-14 13:29:54'),
(82, 'OWNER', 57, 'Your office \"Orion Business Suite – 502\" has been approved.', 0, '2026-01-14 13:30:25'),
(83, 'TENANT', 1, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(84, 'TENANT', 24, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(85, 'TENANT', 25, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(86, 'TENANT', 26, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(87, 'TENANT', 27, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(88, 'TENANT', 37, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(89, 'TENANT', 38, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(90, 'TENANT', 39, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(91, 'TENANT', 40, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:25'),
(92, 'TENANT', 42, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(93, 'TENANT', 43, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(94, 'TENANT', 44, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(95, 'TENANT', 45, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(96, 'TENANT', 46, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(97, 'TENANT', 47, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(98, 'TENANT', 48, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(99, 'TENANT', 49, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(100, 'TENANT', 50, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(101, 'TENANT', 51, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(102, 'TENANT', 52, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(103, 'TENANT', 53, 'Office \"Orion Business Suite – 502\" by owner \"basamma\" is now available. Check it out.', 0, '2026-01-14 13:30:26'),
(104, 'ADMIN', 1, 'Owner siddappa added office \"kv pvt\" – waiting for approval.', 0, '2026-03-14 21:51:12'),
(105, 'ADMIN', 1, 'Owner kavya s added office \"balaji enterprices\" – waiting for approval.', 0, '2026-03-15 09:26:26'),
(106, 'OWNER', 25, 'Your office \"balaji enterprices\" has been approved.', 0, '2026-03-15 09:28:29'),
(107, 'TENANT', 1, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:33'),
(108, 'TENANT', 24, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:36'),
(109, 'TENANT', 25, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:38'),
(110, 'TENANT', 26, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:41'),
(111, 'TENANT', 27, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:44'),
(112, 'TENANT', 37, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:46'),
(113, 'TENANT', 38, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:49'),
(114, 'TENANT', 39, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:51'),
(115, 'TENANT', 40, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:54'),
(116, 'TENANT', 42, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:56'),
(117, 'TENANT', 43, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:28:59'),
(118, 'TENANT', 44, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:02'),
(119, 'TENANT', 45, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:05'),
(120, 'TENANT', 46, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:07'),
(121, 'TENANT', 47, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:10'),
(122, 'TENANT', 48, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:12'),
(123, 'TENANT', 49, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:15'),
(124, 'TENANT', 50, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:18'),
(125, 'TENANT', 51, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:20'),
(126, 'TENANT', 52, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:22'),
(127, 'TENANT', 53, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:25'),
(128, 'TENANT', 54, 'Office \"balaji enterprices\" by owner \"kavya s\" is now available. Check it out.', 0, '2026-03-15 09:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `office_premises`
--

CREATE TABLE `office_premises` (
  `office_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `office_name` varchar(100) NOT NULL,
  `office_type` varchar(50) DEFAULT NULL,
  `area_sqft` int(11) DEFAULT NULL,
  `floor_no` int(11) DEFAULT NULL,
  `cabins` int(11) DEFAULT NULL,
  `workstations` int(11) DEFAULT NULL,
  `building_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `locality` varchar(50) DEFAULT NULL,
  `pincode` bigint(20) DEFAULT NULL,
  `rent` decimal(10,2) DEFAULT NULL,
  `deposit` decimal(10,2) DEFAULT NULL,
  `maintenance` decimal(10,2) DEFAULT NULL,
  `lease_duration` int(11) DEFAULT NULL,
  `lock_in` int(11) DEFAULT NULL,
  `parking` tinyint(1) DEFAULT NULL,
  `power_backup` tinyint(1) DEFAULT NULL,
  `internet` tinyint(1) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Available',
  `approval_status` varchar(20) DEFAULT 'PENDING',
  `tanent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `office_premises`
--

INSERT INTO `office_premises` (`office_id`, `owner_id`, `office_name`, `office_type`, `area_sqft`, `floor_no`, `cabins`, `workstations`, `building_name`, `city`, `locality`, `pincode`, `rent`, `deposit`, `maintenance`, `lease_duration`, `lock_in`, `parking`, `power_backup`, `internet`, `status`, `approval_status`, `tanent_id`) VALUES
(27, 25, 'kv pvt22', 'Corporate Office', 900, 3, 2, 1, 'sk ornate', 'Bangalore', 'gavipuram', 56601, 30000.00, 200000.00, 3200.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', 1),
(30, 25, 'Startup Hub', 'IT Park', 2356, 36, 2, 6, 'manyata teck park', 'Pune', 'Skyline Workspace, Pune', 69873, 55000.00, 1000000.00, 15000.00, 64, 22, 1, 1, 1, 'occupied', 'APPROVED', 26),
(31, 25, 'Skyline Workspace', 'Business Center', 3698, 8, 3, 5, 'svbuilding', 'Pune', 'Skyline Workspace, Pune', 6956, 55000.00, 1000000.00, 15000.00, 64, 22, 1, 1, 1, 'Occupied', 'APPROVED', 1),
(32, 25, 'Skyline Workspace', 'Business Center', 3698, 8, 3, 5, 'svbuilding', 'Pune', 'Skyline Workspace, Pune', 6956, 55000.00, 1000000.00, 15000.00, 64, 22, 1, 1, 1, 'Occupied', 'APPROVED', 1),
(33, 25, 'Skyline Workspace2', 'Corporate Office', 3698, 8, 3, 5, 'svbuilding', 'kolkatta', 'Skyline Workspace, Pune', 6956, 55000.00, 1000000.00, 15000.00, 64, 22, 1, 1, 1, 'occupied', 'APPROVED', 26),
(36, 25, 'sneha pvt', 'IT Park', 900, 3, 4, 2, 'sneha building', 'bangalore', 'jp nagar', 56001, 25000.00, 100000.00, 2500.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', 25),
(37, 27, 'sneha pvt', 'IT Park', 900, 3, 4, 2, 'sneha building', 'bangalore', 'jp nagar', 56001, 25000.00, 100000.00, 2500.00, 24, 8, 1, 1, 1, 'occupied', 'APPROVED', 37),
(38, 27, 'sneha pvt', 'Corporate Office', 900, 3, 4, 2, 'sneha building', 'bangalore', 'jp nagar', 56001, 25000.00, 100000.00, 2500.00, 24, 8, 1, 1, 1, 'Occupied', 'REJECTED', 26),
(39, 25, 'sv allied', 'Corporate Office', 235, 0, 0, 0, NULL, 'bangalore', NULL, NULL, 25000.00, 0.00, 0.00, 0, 0, 0, 0, 0, 'occupied', 'APPROVED', 26),
(40, 25, 'sneha pvt', 'Business Center', 900, 3, 4, 2, 'sneha building', 'bangalore', 'jp nagar', 56001, 25000.00, 100000.00, 2500.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', 25),
(41, 25, 'sneha pvt', 'Co-working Space', 900, 3, 4, 2, 'sneha building', 'bangalore', 'jp nagar', 56001, 25000.00, 100000.00, 2500.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', 25),
(43, 25, 'sv allied12', 'Corporate Office', 2563, 3, 5, 4, 'btm layout', 'kolkatta', 'gavipuram', 56001, 25000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'occupied', 'APPROVED', 24),
(47, 25, 'kavyashivaram pvt lmt', 'Corporate Office', 2563, 3, 5, 4, 'btm layout', 'kolkatta', 'gavipuram', 56001, 25000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'REJECTED', 1),
(48, 25, 'kavyashivaram pvt lmt2', 'Corporate Office', 2563, 3, 5, 4, 'btm layout', 'kolkatta', 'gavipuram', 56001, 25000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'REJECTED', NULL),
(49, 25, 'vinayaka pvt', 'Corporate Office', 3542, 3, 5, 3, 'vin building', 'bangalore', 'jp nagar', 56001, 25000.00, 100000.00, 2500.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(50, 25, 'kavyashivaram pvt lmt23', 'Corporate Office', 2563, 3, 5, 4, 'btm layout', 'kolkatta', 'gavipuram', 56001, 25000.00, 200000.00, 2000.00, 24, 8, 1, 1, 0, 'occupied', 'APPROVED', NULL),
(51, 25, 'kavyavinayaka pvt', 'Corporate Office', 2563, 3, 5, 4, 'btm layout', 'kolkatta', 'gavipuram', 56001, 25000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(54, 25, 'veena pvt1', 'Corporate Office', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 25000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'occupied', 'APPROVED', NULL),
(55, 25, 'avanthi pvt1', 'Co-working Space', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 0, 1, 1, 'occupied', 'APPROVED', 24),
(56, 31, 'hk pvt limited', 'Corporate Office', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'occupied', 'APPROVED', 37),
(57, 31, 'hk pvt limited1', 'Corporate Office', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'occupied', 'APPROVED', 37),
(58, 31, 'kv pvt', 'IT Park', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(59, 41, 'sridhar', 'IT Park', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(60, 50, 'sridhar569', 'Corporate Office', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(61, 50, 'sridhar c1', 'Co-working Space', 2345, 12, 2, 2, 'btm layout', 'kolkatta', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(62, 25, 'basavaraj pvt', 'Corporate Office', 2563, 21, 4, 2, 'basava building', 'mumbai', 'gilgumaxz', 63955, 63000.00, 1200000.00, 7200.00, 26, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(63, 25, 'basavaraj pvt1', 'IT Park', 2563, 21, 4, 2, 'basava building', 'mumbai', 'gilgumaxz', 63955, 63000.00, 1200000.00, 7200.00, 26, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(64, 25, 'yellappa pvt', 'Corporate Office', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(65, 25, 'yellappa pvt1', 'Corporate Office', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(66, 25, 'sunitha pvt', 'Corporate Office', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(67, 25, 'sunitha pvt123', 'Corporate Office', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(68, 25, 'anju pvt', 'IT Park', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(69, 25, 'harshitha pvt1', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(70, 25, 'harshitha  bhuvan pvt1', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(71, 25, 'gayatri pvt', 'Corporate Office', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(72, 25, 'basam pvt', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(73, 25, 'basam pvt23', 'Corporate Office', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(74, 25, 'basam 236pvt23', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(75, 25, 'CHINNI PVT', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(76, 25, 'mahakal pvt', 'Corporate Office', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(77, 25, 'maha pvt', 'IT Park', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(78, 25, 'swami pvt', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'APPROVED', NULL),
(79, 25, 'kavya pvt', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(80, 25, 'hkq11 pvt', 'IT Park', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Available', 'REJECTED', NULL),
(82, 55, 'hk482004 pvt', 'Co-working Space', 5986, 3, 8, 4, 'btm layout', 'bangalore', 'gavipuram', 56001, 60000.00, 200000.00, 2000.00, 24, 8, 1, 1, 1, 'Occupied', 'APPROVED', NULL),
(84, 57, 'Basamma pvt', 'Co-working Space', 1300, 13, 8, 2, 'Kallappa nivasa', 'Bangalore', 'Vvpuram', 560004, 33000.00, 500000.00, 3200.00, 22, 8, 1, 0, 0, 'Occupied', 'APPROVED', NULL),
(85, 57, 'Orion Business Suite – 502', 'IT Park', 1800, 5, 6, 24, 'Orion Tech Park', 'Bengaluru', 'Whitefield', 560066, 135000.00, 405000.00, 12000.00, 36, 12, 1, 1, 0, 'Available', 'APPROVED', NULL),
(86, 56, 'kv pvt', 'Corporate Office', 2345, 34, 4, 4, 'sk ornate', 'banglore', 'jp nagar', 56601, 3456543.00, 3432.00, 4321.00, 3, 3, 1, 1, 1, 'Available', 'PENDING', NULL),
(87, 25, 'balaji enterprices', 'Corporate Office', 2345, 34, 4, 4, 'sk ornate', 'banglore', 'jp nagar', 56601, 3456543.00, 3432.00, 4321.00, 3, 3, 1, 1, 1, 'Available', 'APPROVED', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `office_requests`
--

CREATE TABLE `office_requests` (
  `request_id` int(11) NOT NULL,
  `tanent_id` int(11) NOT NULL,
  `office_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `request_status` varchar(30) NOT NULL DEFAULT 'PENDING',
  `request_date` timestamp NULL DEFAULT current_timestamp(),
  `owner_action_date` timestamp NULL DEFAULT NULL,
  `admin_action_date` timestamp NULL DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `agreement_status` varchar(20) DEFAULT 'PENDING',
  `agreement_file` varchar(255) DEFAULT NULL,
  `signed_agreement_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `office_requests`
--

INSERT INTO `office_requests` (`request_id`, `tanent_id`, `office_id`, `owner_id`, `request_status`, `request_date`, `owner_action_date`, `admin_action_date`, `remarks`, `agreement_status`, `agreement_file`, `signed_agreement_file`) VALUES
(17, 24, 30, 25, 'APPROVED', '2026-01-03 19:06:45', '2026-01-04 17:23:58', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(18, 24, 33, 25, 'APPROVED', '2026-01-03 19:06:48', '2026-01-04 17:23:40', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(21, 26, 30, 25, 'SIGNED_RECEIVED', '2026-01-03 20:08:34', '2026-01-04 11:52:07', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(22, 26, 50, 25, 'SIGNED_RECEIVED', '2026-01-03 20:14:08', '2026-01-04 17:12:55', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(23, 26, 30, 25, 'AGREEMENT_SENT', '2026-01-04 07:54:38', '2026-01-08 13:39:16', NULL, NULL, 'REQUESTED', 'agreement_23.pdf', NULL),
(25, 26, 41, 25, 'APPROVED', '2026-01-04 08:19:43', '2026-01-13 07:54:15', NULL, 'Owner APPROVED', 'PENDING', 'agreement_25.pdf', NULL),
(26, 26, 50, 25, 'PENDING', '2026-01-04 08:19:56', '2026-01-13 08:00:28', NULL, NULL, 'PENDING', 'agreement_26.pdf', NULL),
(27, 26, 41, 25, 'PENDING', '2026-01-04 09:33:11', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(28, 24, 54, 25, 'APPROVED', '2026-01-04 17:24:36', '2026-01-04 17:24:46', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(29, 24, 43, 25, 'APPROVED', '2026-01-04 19:08:10', '2026-01-04 19:08:51', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(30, 24, 37, 27, 'REQUESTED', '2026-01-04 20:04:37', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(31, 26, 39, 25, 'APPROVED', '2026-01-05 07:52:08', '2026-01-05 07:52:54', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(33, 24, 55, 25, 'APPROVED', '2026-01-05 08:30:10', '2026-01-05 08:30:49', NULL, 'Owner APPROVED', 'UPLOADED', '1767756566255_VINAYAKA_S_Hcacbs.pdf', NULL),
(34, 37, 37, 27, 'REQUESTED', '2026-01-05 10:57:50', NULL, NULL, NULL, 'ACCEPTED', NULL, NULL),
(37, 37, 56, 31, 'APPROVED', '2026-01-05 11:08:58', '2026-01-05 11:09:39', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(38, 37, 57, 31, 'APPROVED', '2026-01-05 17:43:13', '2026-01-05 17:44:19', NULL, 'Owner APPROVED', 'ACCEPTED', NULL, NULL),
(39, 37, 58, 31, 'APPROVED', '2026-01-06 06:43:22', '2026-01-06 06:43:41', NULL, 'Owner APPROVED', 'UPLOADED', '1767687887036_VINAYAKA_S_Hcacbs.pdf', NULL),
(40, 24, 63, 25, 'APPROVED', '2026-01-07 04:55:36', '2026-01-07 04:56:09', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(42, 24, 63, 25, 'APPROVED', '2026-01-07 08:08:30', '2026-01-07 08:10:22', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(43, 24, 62, 25, 'APPROVED', '2026-01-07 08:25:28', '2026-01-07 08:25:44', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(45, 24, 64, 25, 'APPROVED', '2026-01-07 16:05:10', '2026-01-07 16:05:38', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(46, 24, 65, 25, 'APPROVED', '2026-01-07 16:31:32', '2026-01-07 17:06:23', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(47, 24, 66, 25, 'APPROVED', '2026-01-08 03:52:01', '2026-01-08 03:53:32', NULL, 'Owner APPROVED', 'PENDING', 'agreement_47.pdf', NULL),
(48, 27, 59, 41, 'REQUESTED', '2026-01-08 04:15:10', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(49, 24, 67, 25, 'APPROVED', '2026-01-08 04:17:41', '2026-01-08 04:18:38', NULL, 'Owner APPROVED', 'PENDING', 'agreement_49.pdf', NULL),
(51, 24, 68, 25, 'APPROVED', '2026-01-08 11:48:06', '2026-01-08 11:49:21', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(52, 24, 69, 25, 'APPROVED', '2026-01-08 12:03:47', '2026-01-08 12:04:31', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(53, 24, 70, 25, 'APPROVED', '2026-01-08 12:06:37', '2026-01-08 12:07:27', NULL, 'Owner APPROVED', 'PENDING', 'agreement_53.pdf', NULL),
(54, 24, 71, 25, 'APPROVED', '2026-01-08 13:22:23', '2026-01-08 18:01:48', NULL, 'Owner APPROVED', 'VERIFIED', 'agreement_54.pdf', 'signed_agreement_54.pdf'),
(55, 24, 72, 25, 'APPROVED', '2026-01-08 14:52:37', '2026-01-08 17:59:57', NULL, NULL, 'VERIFIED', 'agreement_55.pdf', 'signed_agreement_55.pdf'),
(56, 24, 72, 25, 'AGREEMENT_SENT', '2026-01-08 14:53:43', '2026-01-08 17:29:21', NULL, NULL, 'PENDING', 'agreement_56.pdf', NULL),
(57, 24, 73, 25, 'AGREEMENT_SENT', '2026-01-08 15:33:35', '2026-01-08 17:13:08', NULL, NULL, 'PENDING', 'agreement_57.pdf', NULL),
(58, 24, 74, 25, 'AGREEMENT_SENT', '2026-01-08 16:08:54', '2026-01-08 16:19:35', NULL, NULL, 'PENDING', 'agreement_58.pdf', NULL),
(59, 24, 75, 25, 'SIGNED_RECEIVED', '2026-01-08 16:57:06', '2026-01-08 16:57:36', NULL, NULL, 'SIGNED_UPLOADED', 'agreement_59.pdf', 'signed_agreement_59.pdf'),
(60, 24, 76, 25, 'AGREEMENT_SENT', '2026-01-08 18:34:02', '2026-01-08 18:35:47', NULL, NULL, 'PENDING', 'agreement_60.pdf', NULL),
(61, 24, 77, 25, 'SIGNED_RECEIVED', '2026-01-08 19:51:30', '2026-01-08 19:52:21', NULL, NULL, 'SIGNED_UPLOADED', 'agreement_61.pdf', 'signed_agreement_61.pdf'),
(62, 24, 78, 25, 'REQUESTED', '2026-01-08 20:35:56', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(63, 24, 79, 25, 'APPROVED', '2026-01-13 07:23:57', '2026-01-13 07:25:35', NULL, 'Owner APPROVED', 'PENDING', 'agreement_63.pdf', NULL),
(64, 24, 61, 50, 'PENDING', '2026-01-13 08:45:16', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(66, 42, 82, 55, 'APPROVED', '2026-01-13 11:26:27', '2026-01-13 11:26:49', NULL, 'Owner APPROVED', 'PENDING', 'agreement_66.pdf', NULL),
(68, 51, 84, 57, 'APPROVED', '2026-01-14 08:37:54', '2026-01-14 08:39:52', NULL, 'Owner APPROVED', 'PENDING', NULL, NULL),
(69, 53, 73, 25, 'PENDING', '2026-01-14 09:42:12', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(70, 53, 77, 25, 'PENDING', '2026-01-14 09:42:17', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(71, 47, 49, 25, 'REQUESTED', '2026-03-14 23:15:37', NULL, NULL, NULL, 'PENDING', NULL, NULL),
(72, 24, 87, 25, 'APPROVED', '2026-03-15 09:30:14', '2026-03-15 09:31:16', NULL, NULL, 'PENDING', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `owner_info`
--

CREATE TABLE `owner_info` (
  `owner_id` int(11) NOT NULL,
  `owner_name` varchar(45) NOT NULL,
  `owner_email_id` varchar(45) NOT NULL,
  `owner_country` varchar(45) NOT NULL,
  `owner_state` varchar(45) NOT NULL,
  `owner_city` varchar(45) NOT NULL,
  `owner_location` varchar(45) NOT NULL,
  `owner_full_address` varchar(45) NOT NULL,
  `owner_pincode` bigint(20) NOT NULL,
  `owner_gst_num` varchar(45) NOT NULL,
  `owner_pan_card_num` varchar(45) NOT NULL,
  `owner_company_cin` varchar(45) NOT NULL,
  `owner_mobile_no` bigint(20) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `owner_aadhaar_num` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `owner_info`
--

INSERT INTO `owner_info` (`owner_id`, `owner_name`, `owner_email_id`, `owner_country`, `owner_state`, `owner_city`, `owner_location`, `owner_full_address`, `owner_pincode`, `owner_gst_num`, `owner_pan_card_num`, `owner_company_cin`, `owner_mobile_no`, `password`, `owner_aadhaar_num`) VALUES
(25, 'kavya s', 'kavya@gmail.com', 'India', 'Karnataka', 'Bangalore', 'gavipuram', '60,sajjanrao circle', 56601, '96587161', 'ikav43', 'kavu1', 7760260901, 'kavya', '123456789123'),
(27, 'sneha', 'sneha@gmail.com', 'India', 'Karnataka', 'Bangalore', 'gavipuram', '60,sajjanrao circle', 56601, '96580146', 'isneha33', 'sneha1', 7720160901, 'sneha', NULL),
(29, 'bhuvan', 'bhuvan@gmail.com', 'India', 'Karnataka', 'Bangalore', 'gavipuram', '60,sajjanrao circle', 566019, '965801467', 'isneha333', 'sneha33', 7720160900, '123456', NULL),
(31, 'harshitha', 'harshitha@gmail.com', 'India', 'Karnataka', 'Bangalore', 'whitefield', '2nd floor, whitefiled main road', 560019, '29ABCDE1234F1Z5', 'ABCDE1234F', 'U72200KA2021PTC145678', 6364354908, 'hk1234', NULL),
(41, 'sridhar c', 'sridhar@gmail.com', 'India', 'Karnataka', 'Bangalore', 'jpnagar', '2nd Floor, Prestige Tech Park', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'SRI123', 9108139492, '123', '123545878565'),
(47, 'sridhar c', 'gayatri@gmail.com', 'India', 'Karnataka', 'bijapur', 'gandhi chowka', 'golgumz near m', 659866, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', 5632859461, '123', '859621478523'),
(50, 'sridhar c', 'sridhar12@gmail.com', 'India', 'Karnataka', 'bijapur', 'gandhi chowka', 'jpnagar', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', 5632859460, 'sridhar12', '859621478523'),
(51, 'veena s', 'veena@gmail.com', 'India', 'Karnataka', 'hydrabad', 'gandhi chowka', '', 566001, '29ABCDE1234F1Z6', 'OLJPS2081I', 'U72200KA2020PTC123455', 9963587741, 'veena', '874596321485'),
(52, 'veena s h ', 'veena1@gmail.com', 'India', 'Karnataka', 'hydrabad', 'gandhi chowka', '', 566001, '29ABCDE1234F1Z6', 'OLJPS2081I', 'U72200KA2020PTC123455', 9963587456, '123', '874596321485'),
(53, 'veena s', 'veena56@gmail.com', 'India', 'Karnataka', 'kolkatta', 'gandhi chowka', 'hgj', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', 9963354875, '123', '859621478511'),
(54, 'sunitha', 'sunitha@gmail.com', 'India', 'Karnataka', 'mumbai', 'gandhi chowka', 'parvathipuram', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', 8794561233, 'sunitha', '859621478523'),
(55, 'sunitha', 'sunitha89@gmail.com', 'India', 'Karnataka', 'mumbai', 'gandhi chowka', 'jpn', 566001, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', 8794561111, '123', '859621478523'),
(56, 'siddappa', 'siddappa@gmail.com', 'India', 'Karnataka', 'banglore', 'v.v puram', '60,sajjanrao circle', 566004, '29ABCDE1234F1Z7', 'OLJPS2087I', 'U72200KA2020PTC123457', 9956874474, 'Siddappa@12', '874596321487'),
(57, 'basamma', 'basamma@gmail.com', 'India', 'Karnataka', 'banglore', 'v.v puram', '60,sajjanrao circle', 566004, '29ABCDE1234F1Z7', 'OLJPS2087I', 'U72200KA2020PTC123457', 9731878567, 'Basamma@123', '859621478523'),
(58, 'Vishwa', 'vish@appteknow.com', 'india', 'karnataka', 'bangalore', 'BTM', 'No. 15', 560076, '22AAAAA0000A1Z5', 'ABCDE1234F', 'U12345MH2020PLC123456', 9964364882, 'Vish@123', '123456789101'),
(59, 'vikaas', 'vikaaslaksita@gmail.com', 'India', 'karnatka', 'bangalore', 'btm', 'jayanagar', 560011, '22AAAAA0000A1Z5', 'ATAPP7500M', 'L12345AB1234XYZ123456', 8618415354, 'Vikaas@2010', '123456789012');

-- --------------------------------------------------------

--
-- Table structure for table `tanent_info`
--

CREATE TABLE `tanent_info` (
  `tanent_id` int(11) NOT NULL,
  `tanent_name` varchar(45) NOT NULL,
  `tanent_email_id` varchar(45) NOT NULL,
  `tanent_country` varchar(45) NOT NULL,
  `tanent_state` varchar(45) NOT NULL,
  `tanent_city` varchar(45) NOT NULL,
  `tanent_location` varchar(45) NOT NULL,
  `tanent_fulladress` varchar(45) NOT NULL,
  `tanent_pincode` bigint(20) NOT NULL,
  `tanent_gst_num` varchar(45) NOT NULL,
  `tanent_pan_card_num` varchar(45) NOT NULL,
  `tanent_company_cin` varchar(45) NOT NULL,
  `tanent_mobile_no` varchar(15) NOT NULL,
  `tanent_dob` date NOT NULL,
  `tanent_gender` enum('Male','Female','Other') NOT NULL,
  `tanent_adharno` varchar(12) NOT NULL,
  `tanent_password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tanent_info`
--

INSERT INTO `tanent_info` (`tanent_id`, `tanent_name`, `tanent_email_id`, `tanent_country`, `tanent_state`, `tanent_city`, `tanent_location`, `tanent_fulladress`, `tanent_pincode`, `tanent_gst_num`, `tanent_pan_card_num`, `tanent_company_cin`, `tanent_mobile_no`, `tanent_dob`, `tanent_gender`, `tanent_adharno`, `tanent_password`) VALUES
(1, 'vinayaka s h', 'vinayaka21@gmail.com', 'India', 'Karnataka', 'banglore', 'v.v puram', '60,sajjanrao circle', 560004, '96587161', 'BHAM2004', 'VIN1235', '9731877490', '2003-06-04', 'Male', '440432991461', 'vinayaka21'),
(24, 'Balaji', 'balaji@gmail.com', 'India', 'Karnataka', 'banglore', 'v.v puram', 'yeskay apartments,sajjanrao circle', 560004, '96587162', 'BHAM1005', 'BAL1235', '1234567893', '2005-12-09', 'Male', '440432956825', 'balaji'),
(25, 'vinayka', 'vinayaka112@gmail.com', 'India', 'Karnataka', 'banglore', 'v.v Puram', '60,sajjanrao circle', 560001, '967451784578', 'BHAan1004', 'VIN11562', '9784877491', '2003-12-02', 'Male', '330222856812', '1203'),
(26, 'sneha', 'sneha1@gmail.com', 'India', 'Karnataka', 'banglore', 'v.v Puram', '60,sajjanrao circle', 560001, '967451784568', '2587946', 'sne11562', '2354877654', '2005-12-01', 'Female', '254789461324', 'sneha1'),
(27, 'sneha12', 'sneha12@gmail.com', 'India', 'Karnataka', 'banglore', 'v.v Puram', '60,sajjanrao circle', 560001, '967451784568', '256979132', 'sne11562', '2355852542', '2005-12-01', 'Female', '258963147895', 'sneha12'),
(37, 'bhuvan', 'bhuvan@gmail.com', 'India', 'Karnataka', 'Bengaluru', 'Whitefield', '2nd Floor, Prestige Tech Park', 560066, '29ABCDE1234F1Z5', 'ABCDE1234F', 'U72200KA2020PTC123456', '9876543210', '2022-06-07', 'Male', '123456789012', 'bhuvan123'),
(38, 'vinayaka s h', 'vinayaka22@gmail.com', 'India', 'Karnataka', 'bangalore', 'v.v puram', '2nd Floor, Prestige Tech Park', 560066, '29ABCDE1234F1Z5', 'ABCDE1234F', 'U72200KA2020PTC123456', '7845962135', '2003-02-03', 'Male', '238745158741', 'vinayaka22'),
(39, 'gayatri', 'gayatri@gmail.com', 'India', 'Karnataka', 'bijapur', 'gandhi chowka', 'golgumz near m', 659866, '29ABCDE1234F1Z5', 'ABCDE1234A', 'U72200KA2020PTC123456', '5632859461', '2026-01-06', 'Female', '859621478523', 'gayatri'),
(40, 'anju', 'anju@gmail.com', 'India', 'Karnataka', 'bijapur', 'gandhi chowka', 'golgumz near m', 659866, '29ABCDE1234F1Z5', '54587956988559', 'U72200KA2020PTC123456', '5632824558', '2026-01-06', 'Male', '859621478523', 'anju'),
(42, 'anju1', 'anju234@gmail.com', 'India', 'Karnataka', 'bijapur', 'gandhi chowka', 'golgumz near m', 659866, '29ABCDE1234F1Z5', '54587956988559', 'U72200KA2020PTC123456', '5456898563', '2026-01-06', 'Male', '859621473666', '123'),
(43, 'vinayaka s h', 'veena96@gmail.com', 'India', 'Karnataka', 'kolkatta', 'gandhi chowka', 'hgj', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', '9963456789', '2026-01-08', 'Male', '859621478785', '123'),
(44, 'vinayaka s h', 'veena856@gmail.com', 'India', 'Karnataka', 'kolkatta', 'gandhi chowka', 'hgj', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', '9665587155', '2026-01-08', 'Male', '859632587412', '123'),
(45, 'vinayaka s h', 'vinayaka12345@gmail.com', 'India', 'Karnataka', 'kolkatta', 'gandhi chowka', 'jpnagar', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', '7785623415', '2026-01-08', 'Male', '859621478523', 'vinayaka25'),
(46, 'vinayaka s h', 'sunitha@gmail.com', 'India', 'Karnataka', 'mumbai', 'gandhi chowka', 'jpn', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', '9963587332', '2026-01-08', 'Male', '859621478523', 'vinayaka12'),
(47, 'vinayaka s h', 'sunitha123@gmail.com', 'India', 'Karnataka', 'mumbai', 'gandhi chowka', 'jpn', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', '9963587389', '2026-01-08', 'Female', '859621478521', 'sunitha23'),
(48, 'vinayaka s h', 'sunitha1@gmail.com', 'India', 'Karnataka', 'mumbai', 'gandhi chowka', 'jpn', 56601, '29ABCDE1234F1Z5', 'OLJPS2081H', 'U72200KA2020PTC123456', '9963587387', '2026-01-08', 'Male', '859621478520', 'sunitha12'),
(49, 'jeevan', 'jeevan@gmail.com', 'India', 'Karnataka', 'banglore', 'gandhi chowka', '60,sajjanrao circle', 566004, '29ABCDE1234F1Z6', 'OLJPS2081I', 'U72200KA2020PTC123454', '9876543219', '2026-01-13', 'Male', '874596321483', 'Jeevan@2003'),
(50, 'Mouliya', 'mouliya2418@gmail.com', 'India', 'Karnataka', 'Bangalore', 'Adugodi ', 'Adugodi', 560030, '', '987654', '', '123456789', '2026-01-13', 'Female', '1234567890', 'Mouli@123'),
(51, 'Krishna', 'krishna@gmail.com', 'india', 'karnataka', 'bengaluru', 'btm layout', 'jayadeva', 560019, '22AAABA0000A1Z5', 'ABCEE1234F', 'U12345MH2020PLC123450', '6983298446', '2026-01-09', 'Male', '543432637642', 'Krishna@1234'),
(52, 'ravikumar', 'vikaaslaksita@gmail.com', 'India', 'karnatka', 'bangalore', 'btm', 'jayanagar', 560011, '22AAAAA0000A1Z5', 'ATAPP7500M', 'L12345AB1234XYZ123456', '8618415354', '2026-10-14', 'Male', '123456789012', 'Ravi*2010'),
(53, 'Lingaraju', 'lingarajuv2005@gmail.com', 'india', 'karnataka', 'bangalore', 'bommasandra', '#21 nagesh building bommasndra ', 560099, '23AABCN8237C1ZT', 'BNPPK5882B', 'U72200MP2003PTC015766', '8105358641', '2005-08-24', 'Male', '396969189823', 'Lingu@12345'),
(54, 'Sunny', 'sunny9113423652@gmail.com', 'India', 'West Bengal', 'Kalyani', 'kolkata', 'A-5/11', 741235, '27AAACB1234B1Z5', 'KLRPK7645L', 'U12345MH2020PLC123456', '9113423652', '2008-02-26', 'Male', '213465768976', 'Sunny@123');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email_id` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email_id`, `user_password`, `user_role`) VALUES
(20, 'kavya@gmail.com', 'kavya', 'Owner'),
(21, 'balaji@gmail.com', 'balaji', 'Tenant'),
(22, 'vinayaka112@gmail.com', '1203', 'Tenant'),
(23, 'sneha@gmail.com', 'sneha', 'Owner'),
(24, 'sneha1@gmail.com', 'sneha1', 'Tenant'),
(25, 'admin@gmail.com', 'admin', 'Admin'),
(26, 'sneha12@gmail.com', 'sneha12', 'Tenant'),
(33, 'bhuvan@gmail.com', '123456', 'Owner'),
(37, 'bhuvan@gmail.com', 'bhuvan123', 'Tenant'),
(38, 'harshitha@gmail.com', 'hk1234', 'Owner'),
(39, 'vinayaka22@gmail.com', 'vinayaka22', 'Tenant'),
(40, 'gayatri@gmail.com', 'gayatri', 'Tenant'),
(41, 'sridhar@gmail.com', '123', 'Owner'),
(42, 'gayatri@gmail.com', '123', 'Owner'),
(43, 'sridhar12@gmail.com', 'sridhar12', 'Owner'),
(44, 'anju@gmail.com', 'anju', 'Tenant'),
(45, 'anju@gmail.com', 'anju', 'Tenant'),
(46, 'veena@gmail.com', 'veena', 'Owner'),
(47, 'veena1@gmail.com', '123', 'Owner'),
(48, 'veena56@gmail.com', '123', 'Owner'),
(49, 'sunitha@gmail.com', 'sunitha', 'Owner'),
(50, 'sunitha89@gmail.com', '123', 'Owner'),
(51, 'anju234@gmail.com', '123', 'Tenant'),
(52, 'veena96@gmail.com', '123', 'Tenant'),
(53, 'veena856@gmail.com', '123', 'Tenant'),
(54, 'vinayaka12345@gmail.com', 'vinayaka25', 'Tenant'),
(55, 'sunitha@gmail.com', 'vinayaka12', 'Tenant'),
(56, 'sunitha123@gmail.com', 'sunitha23', 'Tenant'),
(57, 'sunitha1@gmail.com', 'sunitha12', 'Tenant'),
(58, 'jeevan@gmail.com', 'Jeevan@2003', 'Tenant'),
(59, 'siddappa@gmail.com', 'Siddappa@12', 'Owner'),
(60, 'adminn@gmail.com', 'admin', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`admin_email_id`),
  ADD UNIQUE KEY `admin_password_UNIQUE` (`admin_password`),
  ADD UNIQUE KEY `admin_email_id_UNIQUE` (`admin_email_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `office_premises`
--
ALTER TABLE `office_premises`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `office_premises_ownerFK` (`owner_id`),
  ADD KEY `office_tenant_FK_idx` (`tanent_id`);

--
-- Indexes for table `office_requests`
--
ALTER TABLE `office_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_or_owner` (`owner_id`),
  ADD KEY `idx_tenant_status` (`tanent_id`,`request_status`),
  ADD KEY `fk_office` (`office_id`);

--
-- Indexes for table `owner_info`
--
ALTER TABLE `owner_info`
  ADD PRIMARY KEY (`owner_id`),
  ADD UNIQUE KEY `owner_mobile_no_UNIQUE` (`owner_mobile_no`);

--
-- Indexes for table `tanent_info`
--
ALTER TABLE `tanent_info`
  ADD PRIMARY KEY (`tanent_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `office_premises`
--
ALTER TABLE `office_premises`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `office_requests`
--
ALTER TABLE `office_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `owner_info`
--
ALTER TABLE `owner_info`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tanent_info`
--
ALTER TABLE `tanent_info`
  MODIFY `tanent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `office_premises`
--
ALTER TABLE `office_premises`
  ADD CONSTRAINT `office_premises_ownerFK` FOREIGN KEY (`owner_id`) REFERENCES `owner_info` (`owner_id`),
  ADD CONSTRAINT `office_tenant_FK` FOREIGN KEY (`tanent_id`) REFERENCES `tanent_info` (`tanent_id`);

--
-- Constraints for table `office_requests`
--
ALTER TABLE `office_requests`
  ADD CONSTRAINT `fk_office` FOREIGN KEY (`office_id`) REFERENCES `office_premises` (`office_id`),
  ADD CONSTRAINT `fk_or_office` FOREIGN KEY (`office_id`) REFERENCES `office_premises` (`office_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_or_owner` FOREIGN KEY (`owner_id`) REFERENCES `owner_info` (`owner_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_or_tanent` FOREIGN KEY (`tanent_id`) REFERENCES `tanent_info` (`tanent_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tenant` FOREIGN KEY (`tanent_id`) REFERENCES `tanent_info` (`tanent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

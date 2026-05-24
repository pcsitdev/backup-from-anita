-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:37 PM
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
-- Database: `apptek_analytics_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add contactus', 8, 'add_contactus'),
(30, 'Can change contactus', 8, 'change_contactus'),
(31, 'Can delete contactus', 8, 'delete_contactus'),
(32, 'Can view contactus', 8, 'view_contactus'),
(33, 'Can add booking', 9, 'add_booking'),
(34, 'Can change booking', 9, 'change_booking'),
(35, 'Can delete booking', 9, 'delete_booking'),
(36, 'Can view booking', 9, 'view_booking'),
(37, 'Can add payment', 10, 'add_payment'),
(38, 'Can change payment', 10, 'change_payment'),
(39, 'Can delete payment', 10, 'delete_payment'),
(40, 'Can view payment', 10, 'view_payment'),
(41, 'Can add signin', 11, 'add_signin'),
(42, 'Can change signin', 11, 'change_signin'),
(43, 'Can delete signin', 11, 'delete_signin'),
(44, 'Can view signin', 11, 'view_signin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1200000$rtbxFi70hW9BZVoHMh0kJT$B0sLulZJiPa/0C/r1KbejQidBnNUkD+SjRu09AvuQBM=', NULL, 1, 'admin', '', '', '', 1, 1, '2026-03-20 09:40:26.673092');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `course_id`, `name`, `start_time`, `end_time`) VALUES
(1, 1, 'Morning Batch', '09:00:00', '11:00:00'),
(2, 1, 'Evening Batch', '18:00:00', '20:00:00'),
(3, 2, 'Weekday Batch', '10:00:00', '12:00:00'),
(4, 2, 'Weekend Batch', '09:00:00', '13:00:00'),
(5, 3, 'Morning Batch', '08:30:00', '10:30:00'),
(6, 3, 'Evening Batch', '17:30:00', '19:30:00'),
(7, 4, 'Morning Batch', '09:30:00', '11:30:00'),
(8, 5, 'Evening Batch', '18:30:00', '20:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`) VALUES
(5, 1, 'Visakhapatnam'),
(6, 1, 'Vijayawada'),
(7, 1, 'Guntur'),
(8, 1, 'Tirupati'),
(9, 3, 'Guwahati'),
(10, 3, 'Dibrugarh'),
(11, 3, 'Silchar'),
(12, 3, 'Tezpur'),
(13, 4, 'Patna'),
(14, 4, 'Gaya'),
(15, 4, 'Bhagalpur'),
(16, 4, 'Muzaffarpur'),
(17, 1, 'Visakhapatnam'),
(18, 1, 'Vijayawada'),
(19, 1, 'Guntur'),
(20, 1, 'Tirupati'),
(21, 3, 'Guwahati'),
(22, 3, 'Dibrugarh'),
(23, 3, 'Silchar'),
(24, 3, 'Tezpur'),
(25, 4, 'Patna'),
(26, 4, 'Gaya'),
(27, 4, 'Bhagalpur'),
(28, 4, 'Muzaffarpur'),
(29, 5, 'Raipur'),
(30, 5, 'Bhilai'),
(31, 5, 'Bilaspur'),
(32, 32, 'New Delhi'),
(33, 32, 'Dwarka'),
(34, 32, 'Rohini'),
(35, 32, 'Saket'),
(36, 6, 'Panaji'),
(37, 6, 'Margao'),
(38, 6, 'Vasco da Gama'),
(39, 7, 'Ahmedabad'),
(40, 7, 'Vadodara'),
(41, 7, 'Surat'),
(42, 7, 'Rajkot'),
(43, 8, 'Gurugram'),
(44, 8, 'Faridabad'),
(45, 8, 'Panipat'),
(46, 8, 'Hisar'),
(47, 11, 'Bengaluru'),
(48, 11, 'Mysuru'),
(49, 11, 'Hubli'),
(50, 11, 'Mangaluru'),
(51, 12, 'Kochi'),
(52, 12, 'Thiruvananthapuram'),
(53, 12, 'Kozhikode'),
(54, 12, 'Alappuzha'),
(55, 14, 'Mumbai'),
(56, 14, 'Pune'),
(57, 14, 'Nagpur'),
(58, 14, 'Nashik'),
(59, 19, 'Bhubaneswar'),
(60, 19, 'Cuttack'),
(61, 19, 'Rourkela'),
(62, 19, 'Sambalpur'),
(63, 20, 'Ludhiana'),
(64, 20, 'Amritsar'),
(65, 20, 'Jalandhar'),
(66, 20, 'Patiala'),
(67, 21, 'Jaipur'),
(68, 21, 'Udaipur'),
(69, 21, 'Jodhpur'),
(70, 21, 'Kota'),
(71, 23, 'Chennai'),
(72, 23, 'Coimbatore'),
(73, 23, 'Madurai'),
(74, 23, 'Tiruchirappalli'),
(75, 24, 'Hyderabad'),
(76, 24, 'Warangal'),
(77, 24, 'Nizamabad'),
(78, 24, 'Karimnagar'),
(79, 26, 'Lucknow'),
(80, 26, 'Kanpur'),
(81, 26, 'Agra'),
(82, 26, 'Varanasi'),
(83, 27, 'Dehradun'),
(84, 27, 'Haridwar'),
(85, 27, 'Nainital'),
(86, 27, 'Rishikesh'),
(87, 28, 'Kolkata'),
(88, 28, 'Howrah'),
(89, 28, 'Siliguri'),
(90, 28, 'Durgapur');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `duration`) VALUES
(1, 'Full Stack Web Development', '6 Months'),
(2, 'Python Programming', '3 Months'),
(3, 'Data Science', '6 Months'),
(4, 'UI / UX Design', '3 Months'),
(5, 'Digital Marketing', '3 Months'),
(6, 'Data analytics', '6 Months'),
(7, 'Full stack java', '3 Months');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'result', 'booking'),
(8, 'result', 'contactus'),
(7, 'result', 'login'),
(10, 'result', 'payment'),
(11, 'result', 'signin'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'SampleApp', '0001_initial', '2026-03-20 09:37:52.106366');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `dept` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`id`, `name`, `salary`, `city`, `dept`) VALUES
(1, 'anil', 2000, 'bangalore', 'manager'),
(2, 'vijay', 5000, 'mysore', 'hr'),
(3, 'kumar', 4000, 'chennai', 'exe'),
(4, 'mohan', 67000, 'mandya', 'accountant'),
(5, 'anand', 45000, 'bangalore', 'manager'),
(6, 'laksita', 23000, 'mysore', 'hr'),
(7, 'vikaas', 1200, 'chennai', 'exe'),
(8, 'mani', 500, 'mandya', 'accountant'),
(9, 'mahesh', 600, 'bangalore', 'manager'),
(10, 'madesh', 8900, 'chennai', 'hr'),
(11, 'manimegalai', 67000, 'bangalore', 'cse'),
(11, 'manimegalai', 67000, 'bangalore', 'cse'),
(11, 'manimegalai', 67000, 'bangalore', 'cse'),
(11, 'manimegalai', 67000, 'bangalore', 'cse'),
(11, 'manimegalai', 67000, 'bangalore', 'cse'),
(12, 'sai', 67000, 'bangalore', 'cse'),
(12, 'dhanya', 67000, 'bangalore', 'cse');

-- --------------------------------------------------------

--
-- Table structure for table `empemo`
--

CREATE TABLE `empemo` (
  `id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `dept` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `empemo`
--

INSERT INTO `empemo` (`id`, `name`, `salary`, `city`, `dept`) VALUES
(1, 'anil', 2000, 'bangalore', 'manager'),
(2, 'vijay', 5000, 'mysore', 'hr'),
(3, 'kumar', 4000, 'chennai', 'exe'),
(4, 'mohan', 67000, 'mandya', 'accountant'),
(5, 'anand', 45000, 'bangalore', 'manager'),
(6, 'laksita', 23000, 'mysore', 'hr'),
(7, 'vikaas', 1200, 'chennai', 'exe'),
(8, 'mani', 500, 'mandya', 'accountant'),
(9, 'mahesh', 600, 'bangalore', 'manager'),
(10, 'madesh', 8900, 'chennai', 'hr'),
(21, 'demo', 67000, 'mysore', 'cse');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ï»¿employeeid` int(11) DEFAULT NULL,
  `fullname` text DEFAULT NULL,
  `annual salary` int(11) DEFAULT NULL,
  `city` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ï»¿employeeid`, `fullname`, `annual salary`, `city`) VALUES
(1, 'A', 4745, 'chennai'),
(2, 'B', 2806, 'bangalore'),
(3, 'C', 4174, 'mangalore'),
(4, 'D', 3592, 'mandya'),
(5, 'E', 4922, 'chennai'),
(6, 'F', 4985, 'bangalore'),
(7, 'G', 2479, 'mangalore'),
(8, 'H', 3018, 'mandya'),
(9, 'I', 2212, 'chennai'),
(10, 'J', 3664, 'bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `login_audit`
--

CREATE TABLE `login_audit` (
  `audit_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login_audit`
--

INSERT INTO `login_audit` (`audit_id`, `user_id`, `login_time`, `logout_time`, `ip_address`) VALUES
(1, 2, '2024-01-01 09:00:00', '2024-01-01 09:30:00', '192.168.1.10'),
(2, 8, '2024-01-02 10:00:00', '2024-01-02 10:45:00', '192.168.1.20'),
(3, 9, '2024-01-03 11:00:00', '2024-01-03 11:15:00', '192.168.1.30');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `maintenance_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `issue_description` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `request_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`maintenance_id`, `unit_id`, `staff_id`, `issue_description`, `status`, `request_date`) VALUES
(1, 1, 1, 'Water leakage in bathroom', 'Completed', '2024-01-10'),
(2, 3, 1, 'AC not working', 'In Progress', '2024-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `newemp`
--

CREATE TABLE `newemp` (
  `id` int(11) DEFAULT NULL,
  `empname` text DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `mobileno` int(11) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `doj` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `newemp`
--

INSERT INTO `newemp` (`id`, `empname`, `salary`, `mobileno`, `city`, `doj`) VALUES
(1, 'vijay', 2000, 12345678, 'bangalore', '15-04-2026'),
(2, 'ram', 8000, 12345678, 'mysore', '16-04-2026'),
(3, 'mohan', 9000, 12345678, 'bangalore', '17-04-2026'),
(4, 'viji', 8600, 12345678, 'mandya', '18-04-2026'),
(5, 'laksita', 2345, 12345678, 'mysore', '19-04-2026'),
(6, 'shiva', 90000, 12345678, 'delhi', '20-04-2026'),
(7, 'mani', 45000, 12345678, 'chennai', '21-04-2026'),
(8, 'mohan', 1000, 12345678, 'bangalore', '22-04-2026'),
(9, 'radha', 700, 12345678, 'mandya', '23-04-2026'),
(10, 'laxmi', 500, 12345678, 'chennai', '24-04-2026');

-- --------------------------------------------------------

--
-- Table structure for table `office_locations`
--

CREATE TABLE `office_locations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `office_locations`
--

INSERT INTO `office_locations` (`id`, `name`, `lat`, `lng`, `radius`, `status`) VALUES
(1, 'Bangalore Office', 12.91466853, 77.60153600, 200, 1),
(2, 'Training Center', 12.92011234, 77.60599876, 150, 1),
(3, 'Apptek Office', 12.92621200, 77.58463800, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`owner_id`, `user_id`, `name`, `phone`, `email`) VALUES
(1, 8, 'Ramesh Kumar', '9876501234', 'ramesh@gmail.com'),
(2, 10, 'Priya Sharma', '9123409876', 'priya@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `rental_id`, `payment_date`, `amount`, `payment_mode`) VALUES
(1, 1, '2024-01-05', 12000.00, 'UPI'),
(2, 2, '2024-02-05', 15000.00, 'Cash'),
(3, 3, '2024-03-05', 25000.00, 'Bank Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `property_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `property_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`property_id`, `owner_id`, `property_name`, `location`, `property_type`) VALUES
(1, 1, 'Green View Apartments', 'Bangalore', 'Residential'),
(2, 1, 'Lake Side Villas', 'Mysore', 'Residential'),
(3, 2, 'City Center Plaza', 'Chennai', 'Commercial');

-- --------------------------------------------------------

--
-- Table structure for table `qrusers`
--

CREATE TABLE `qrusers` (
  `id` int(11) NOT NULL,
  `role` enum('admin','student') NOT NULL,
  `registration_no` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `qrusers`
--

INSERT INTO `qrusers` (`id`, `role`, `registration_no`, `username`, `name`, `email`, `mobile`, `password`, `is_verified`, `created_at`) VALUES
(1, 'admin', '1', 'mahesh', 'Jadhav', 'maheshj290@gmail.com', '8892444597', '$2y$10$KfQkhKdnqoim9JdI0Mcz2O30avq66udXyPEXERX5umiwZuIc6j4AW', 0, '2026-01-08 03:33:29'),
(2, 'admin', '2', 'vishwanath', 'vishwanath', 'vishwanath@gmail.com', '7022928198', '$2y$10$KfQkhKdnqoim9JdI0Mcz2O30avq66udXyPEXERX5umiwZuIc6j4AW', 0, '2026-01-08 03:33:29'),
(3, 'admin', '3', 'ravi', 'ravi', 'ravi@gmail.com', '8618415354', '$2y$10$KfQkhKdnqoim9JdI0Mcz2O30avq66udXyPEXERX5umiwZuIc6j4AW', 0, '2026-01-08 03:33:29'),
(11, 'student', 'APPTEKC01B01000011', NULL, 'Rahul', 'rahul@gmail.com', '9878908767', '$2y$10$TVd7f9NQbDohJM8c6FTICuYD16w7QWpAF2FVUALy/AFOO2DUi7P32', 1, '2026-01-07 01:42:43'),
(12, 'student', 'APPTEKC02B03000012', NULL, 'linga', 'linga@gmail.com', '8618415354', '$2y$10$/wniRy3OgFYH3K5niK7bjedPhSiBNcAj.PPF7fVoC.M1RzbNdD5Ze', 1, '2026-01-07 03:47:57'),
(13, 'student', 'APPTEKC02B03000013', NULL, 'Yamnesh', 'Yamesh@gmail.com', '8978978987', '$2y$10$s1sCkvfaems7dGCx/JdmB.Q5tuUW/qu.hpl7joFwDkOu9ac6bgXf.', 1, '2026-01-08 01:44:32'),
(14, 'student', 'APPTEKC01B01000014', NULL, 'Ramesh', 'ramesh@gmail.com', '9878909878', '$2y$10$smzTXwUNqOtIuz5EUdA2UOp/Q0.TTurs79jZQmqLPg4XQKn.oe2dm', 1, '2026-01-08 01:50:15'),
(15, 'student', 'APPTEKC02B03000015', NULL, 'apt', 'linga@gmail.com', '8618415354', '$2y$10$83cztu2I2padmFuxUUKiC.gKyVwmG7ri4RmG05l6AMVxRj9orizYa', 1, '2026-01-08 02:01:12'),
(16, 'student', 'APPTEKC02B03000016', NULL, 'apt', 'linga@gmail.com', '8618415354', '$2y$10$EoWzI0b6fE/W8YO5vESRp.8kyHrISB7m8BgBIJedCRL5FE4wYHTju', 1, '2026-01-08 02:02:08'),
(17, 'student', 'APPTEKC05B08000017', NULL, 'Vikaas', 'vikaaslaksita@gmail.com', '8618415354', '$2y$10$z31zSuFJo36KXJJqIIMZQeTuaxMo2Mop3kI.XPhgrf4LwM69jWhFy', 1, '2026-01-08 02:04:43'),
(18, 'student', 'APPTEKC02B03000018', NULL, 'kiransir', 'linga@gmail.com', '8618415354', '$2y$10$hR7PIBw0LHvAiQodfKeHBu7XZxOEWR0kdQ7kRL8dQ9.dyJdMvXhMS', 1, '2026-01-08 02:17:36'),
(19, 'student', 'APPTEKC01B01000019', NULL, 'laksita', 'vikaaslaksita@gmail.com', '8618415354', '$2y$10$bSYS186rSdlIA5x8961P7uEYIZsehL09oye7FB2eK54ifR.glb/1W', 1, '2026-01-08 02:24:47'),
(20, 'student', 'APPTEKC01B01000020', NULL, 'Mani', 'mani@gmail.com', '8618415354', '$2y$10$ItrMJtw6O95UBU1pAKjoSODMLlujLuMLo.0kTQL/njzIzkPhTtDMK', 0, '2026-01-08 02:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `rental_id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`rental_id`, `tenant_id`, `unit_id`, `start_date`, `end_date`) VALUES
(1, 1, 1, '2024-01-01', '2024-12-31'),
(2, 2, 3, '2024-02-01', '2025-01-31'),
(3, 3, 4, '2024-03-01', '2024-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `salesdepartment`
--

CREATE TABLE `salesdepartment` (
  `ITEM` varchar(40) DEFAULT NULL,
  `SALE` int(11) DEFAULT NULL,
  `BILLING_ADDRESS` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `salesdepartment`
--

INSERT INTO `salesdepartment` (`ITEM`, `SALE`, `BILLING_ADDRESS`) VALUES
('SHOE', 2000, 'DELHI'),
('BELT', 3000, 'AGRA'),
('SHOE', 3000, 'DELHI'),
('SARI', 2000, 'BANGALORE'),
('SARI', 8000, 'KOLKATA');

-- --------------------------------------------------------

--
-- Table structure for table `SampleApp_loginpage`
--

CREATE TABLE `SampleApp_loginpage` (
  `id` bigint(20) NOT NULL,
  `user` varchar(15) NOT NULL,
  `pwd` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SampleApp_registerpage`
--

CREATE TABLE `SampleApp_registerpage` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `mail` varchar(25) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `pwd` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `SampleApp_registerpage`
--

INSERT INTO `SampleApp_registerpage` (`id`, `fname`, `lname`, `mail`, `phone`, `user`, `pwd`) VALUES
(1, 'Ramesh', 'Kumar', 'ramesh@gmail.com', '9878547857', 'ramesh', 'ramesh'),
(2, 'Somu', 'Yadav', 'somu@gmail.com', '8578574857', 'Somu', 'somu'),
(3, 'Kalyani', 'kumar', 'kalyani@gmail.com', '7857858965', 'kalyani', 'kalyani');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `user_id`, `name`, `role`, `phone`) VALUES
(1, 9, 'Suresh Naik', 'Maintenance Staff', '9988776655');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(29, 'Andaman and Nicobar Islands'),
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(30, 'Chandigarh'),
(5, 'Chhattisgarh'),
(31, 'Dadra and Nagar Haveli and Daman and Diu'),
(32, 'Delhi'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(33, 'Jammu and Kashmir'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(34, 'Ladakh'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
(35, 'Puducherry'),
(20, 'Punjab'),
(21, 'Rajasthan'),
(22, 'Sikkim'),
(23, 'Tamil Nadu'),
(24, 'Telangana'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `student_profiles`
--

CREATE TABLE `student_profiles` (
  `user_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `tenant_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`tenant_id`, `user_id`, `name`, `phone`, `email`) VALUES
(1, 1, 'Arun Kumar', '9876543210', 'arun.kumar@gmail.com'),
(2, 2, 'Anita Sharma', '9123456789', 'anita.sharma@gmail.com'),
(3, 3, 'Akash Verma', '9988776655', 'akash.verma@gmail.com'),
(4, 4, 'Amit Patel', '9012345678', 'amit.patel@gmail.com'),
(5, 5, 'Ravi Kumar', '8899776655', 'ravi.kumar@gmail.com'),
(6, 6, 'Kiran Rao', '9345678901', 'kiran.rao@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `unit_number` varchar(20) DEFAULT NULL,
  `rent_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Available','Occupied') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `property_id`, `unit_number`, `rent_amount`, `status`) VALUES
(1, 1, 'A101', 12000.00, 'Occupied'),
(2, 1, 'A102', 11000.00, 'Available'),
(3, 2, 'V201', 15000.00, 'Occupied'),
(4, 3, 'C301', 25000.00, 'Occupied');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('tenant','owner','staff','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'admin1', 'admin@123', 'admin'),
(2, 'arun_tenant', 'tenant@123', 'tenant'),
(3, 'anita_tenant', 'tenant@123', 'tenant'),
(4, 'akash_tenant', 'tenant@123', 'tenant'),
(5, 'amit_tenant', 'tenant@123', 'tenant'),
(6, 'ravi_tenant', 'tenant@123', 'tenant'),
(7, 'kiran_tenant', 'tenant@123', 'tenant'),
(8, 'ramesh_owner', 'owner@123', 'owner'),
(9, 'suresh_staff', 'staff@123', 'staff'),
(10, 'priya_owner', 'owner@123', 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE `users1` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users10`
--

CREATE TABLE `users10` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attendance` (`user_id`,`date`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_audit`
--
ALTER TABLE `login_audit`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `office_locations`
--
ALTER TABLE `office_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`owner_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `rental_id` (`rental_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `qrusers`
--
ALTER TABLE `qrusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_no` (`registration_no`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `tenant_id` (`tenant_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `SampleApp_loginpage`
--
ALTER TABLE `SampleApp_loginpage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SampleApp_registerpage`
--
ALTER TABLE `SampleApp_registerpage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_profile_state` (`state_id`),
  ADD KEY `fk_profile_city` (`city_id`),
  ADD KEY `fk_profile_course` (`course_id`),
  ADD KEY `fk_profile_batch` (`batch_id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`tenant_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users1`
--
ALTER TABLE `users1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users10`
--
ALTER TABLE `users10`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_audit`
--
ALTER TABLE `login_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `office_locations`
--
ALTER TABLE `office_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qrusers`
--
ALTER TABLE `qrusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `SampleApp_loginpage`
--
ALTER TABLE `SampleApp_loginpage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SampleApp_registerpage`
--
ALTER TABLE `SampleApp_registerpage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `tenant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users1`
--
ALTER TABLE `users1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users10`
--
ALTER TABLE `users10`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_user` FOREIGN KEY (`user_id`) REFERENCES `qrusers` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `fk_batches_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_cities_state` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `login_audit`
--
ALTER TABLE `login_audit`
  ADD CONSTRAINT `login_audit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`),
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rentals` (`rental_id`);

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`);

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`tenant_id`),
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD CONSTRAINT `fk_profile_batch` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`),
  ADD CONSTRAINT `fk_profile_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `fk_profile_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `fk_profile_state` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `qrusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tenants`
--
ALTER TABLE `tenants`
  ADD CONSTRAINT `tenants_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

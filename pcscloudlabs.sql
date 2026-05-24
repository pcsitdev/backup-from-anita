-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 06, 2026 at 11:54 AM
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
-- Database: `pcscloudlabs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_Id` int(10) UNSIGNED NOT NULL,
  `name` varchar(350) DEFAULT NULL,
  `email` varchar(350) DEFAULT NULL,
  `password` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `demoId` int(10) UNSIGNED NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `Email` varchar(500) DEFAULT NULL,
  `mobile` varchar(500) DEFAULT NULL,
  `Course` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `date` varchar(250) DEFAULT NULL,
  `isSchedule` tinyint(1) DEFAULT 0,
  `ScheduleDate` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`demoId`, `name`, `Email`, `mobile`, `Course`, `address`, `date`, `isSchedule`, `ScheduleDate`) VALUES
(1, 'Anita Acharjya', 'anitaacharjya9539@gmail.com', '7602171906', 'JFS', 'Electroni city phase 1', '2025-08-16', 0, NULL),
(2, 'Aritra Dey', 'Aritraisrock@gmail.com', '9477702821', 'Select', 'Kolkata ', '2025-08-26', 0, NULL),
(3, '                   ', 'sayak01@gmail.com', '1111111111', 'JFS', 'aaaaaaaa', '2025-08-28', 0, NULL),
(4, '      ', 'sayak01@gmail.com', '111111', 'MFS', 'aaaaaaa', '2025-08-28', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_Id` int(10) UNSIGNED NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `phone_number` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `gender` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_Id`, `name`, `email`, `phone_number`, `address`, `password`, `gender`) VALUES
(1, '                   ', 'sayak01@gmail.com', '1111111111', 'aaaaaaaa', '     ', 'other');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_Id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`demoId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `demoId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:47 PM
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
-- Database: `j2c_staging`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_categories`
--

CREATE TABLE `assessment_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `assessment_categories`
--

INSERT INTO `assessment_categories` (`id`, `name`, `description`, `icon_image`, `created_at`) VALUES
(1, 'java ', 'jhugyfg', 'images/default-assessment.png', '2026-04-11 17:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_questions`
--

CREATE TABLE `assessment_questions` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` char(1) DEFAULT NULL,
  `points` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_results`
--

CREATE TABLE `assessment_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `total_questions` int(11) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `test_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_info`
--

CREATE TABLE `basic_info` (
  `userid` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address1` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `alternate` varchar(50) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `basic_info`
--

INSERT INTO `basic_info` (`userid`, `fname`, `lname`, `email`, `address1`, `address2`, `country`, `state`, `location`, `pincode`, `dob`, `gender`, `password`, `mobile`, `alternate`, `qualification`, `resume`) VALUES
(1, 'sdasd', NULL, 'aaa@gmail.com', 'Tallygunge', 'Kolkata', 'India', 'West Bengal', 'Kolkata', '700091', NULL, 'male', '123456', '9874523698', '565656565', NULL, NULL),
(2, 'dsad', NULL, 'aa@gmail.com', '2/1B, Ritchie Road', 'Ballygunge', 'India', 'West Bengal', 'Kharagpur', '700019', '1992-05-01T18:30:00.000Z', 'male', '123', '7864833014', '03365133818', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `benefits`
--

CREATE TABLE `benefits` (
  `id` int(11) NOT NULL,
  `benefit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `benefits`
--

INSERT INTO `benefits` (`id`, `benefit`) VALUES
(1, 'PF'),
(2, 'CAB'),
(3, 'Food'),
(4, 'Health Insurance'),
(5, 'Bonus'),
(6, 'Gym Membership'),
(7, 'Work From Home');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `campaign_id` int(11) NOT NULL,
  `campaign_name` varchar(200) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `send_limit` int(11) DEFAULT NULL,
  `schedule_day` varchar(20) DEFAULT NULL,
  `subject` varchar(300) DEFAULT NULL,
  `from_email` varchar(200) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'ACTIVE',
  `sent_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`campaign_id`, `campaign_name`, `category`, `send_limit`, `schedule_day`, `subject`, `from_email`, `email_body`, `created_on`, `status`, `sent_count`) VALUES
(1, 'Collage Placement', NULL, 100, 'Monday', 'PLACEMENT OPPORTUNITY', 'contact@j2c.in', 'HIII', '2025-11-20 10:25:24', 'ACTIVE', 0),
(2, 'Collage Placement', 'College Bulk Email', 100, 'Monday', 'PLACEMENT OPPORTUNITY', 'contact@j2c.in', 'HIII', '2025-11-20 10:36:00', 'COMPLETED', 8),
(3, 'Collage Placement', 'College Bulk Email', 100, 'Monday', 'PLACEMENT OPPORTUNITY', 'contact@j2c.in', 'hiiii ', '2025-11-20 12:52:39', 'COMPLETED', 8),
(4, 'Collage Placement', 'College Bulk Email', 100, 'Monday', 'PLACEMENT OPPORTUNITY', 'contact@j2c.in', 'Hiii', '2025-11-20 13:39:50', 'COMPLETED', 8),
(5, 'Collage Placement', 'College Bulk Email', 100, 'Monday', 'PLACEMENT OPPORTUNITY', 'contact@j2c.in', 'sdhhhkkplnmm', '2025-12-20 18:51:51', 'COMPLETED', 8);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_logs`
--

CREATE TABLE `campaign_logs` (
  `log_id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `sent_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campus_ambassador_registration`
--

CREATE TABLE `campus_ambassador_registration` (
  `id` int(11) NOT NULL,
  `ambassador_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `college` varchar(150) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `stream` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `campus_ambassador_registration`
--

INSERT INTO `campus_ambassador_registration` (`id`, `ambassador_id`, `name`, `phone`, `email`, `college`, `year`, `stream`, `reason`, `created_at`) VALUES
(1, 1, 'saibal jana', '9999999999', 'saibaljana76@gmail.com', 'TIU', '2', 'engineering', 'ggod', '2026-04-28 10:42:21'),
(2, 1, 'Kankan kander', '9888755558', 'kankan@gamil.com', 'SNU', '3', 'arts', 'ggod', '2026-04-28 10:49:00'),
(3, 3, 'Soumen J', '8641808139', 'soumenj303@gmail.com', 'bafac', '3', 'arts', 'good', '2026-04-29 11:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `campus_hiring_registration`
--

CREATE TABLE `campus_hiring_registration` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `college_name` varchar(150) NOT NULL,
  `graduation_year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `campus_hiring_registration`
--

INSERT INTO `campus_hiring_registration` (`id`, `full_name`, `email`, `mobile`, `college_name`, `graduation_year`, `created_at`) VALUES
(1, 'Saibal Jana', 'saibaljana76@gmail.com', '7894561230', 'NSEC', 2025, '2026-04-27 11:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `career_gap_candidates`
--

CREATE TABLE `career_gap_candidates` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `gap_duration` decimal(5,2) DEFAULT NULL,
  `gap_reason` varchar(255) DEFAULT NULL,
  `gap_description` text DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `experience` decimal(5,2) DEFAULT NULL,
  `last_company` varchar(150) DEFAULT NULL,
  `last_designation` varchar(150) DEFAULT NULL,
  `resume` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `career_gap_candidates`
--

INSERT INTO `career_gap_candidates` (`id`, `fullname`, `email`, `mobile`, `gender`, `gap_duration`, `gap_reason`, `gap_description`, `skills`, `experience`, `last_company`, `last_designation`, `resume`, `created_at`) VALUES
(1, 'Anita Acharjya', 'anitaacharjya9539@gmail.com', '7602171906', 'Female', 6.00, 'Higher Studies', ' vmbbnn', 'Accounts Executive, Accounts Services Executive, Administrative', 2.00, 'pcs', 'sofrtware Engineer', 'https://drive.google.com/file/d/1KP7BjPgFGAYE1DmOGGvuvnYSKImbmKlY/view?usp=drivesdk', '2025-11-11 10:49:09'),
(2, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', 'Male', 5.00, 'Career Break', 'lhkldhjfsifp\'akpf[pkg', 'Java, Oops, Computer Networks, SQL', 0.00, 'na', 'na', 'https://drive.google.com/file/d/1loT4wdhV09wW7guFUJvXcHS8kOyx_Ly3/view?usp=drivesdk', '2026-02-10 14:33:44'),
(3, 's', 'sfdfs1@gmail.com', '7575757575', 'Other', 1.00, 'Health Issues', 'dredsfdfgfygu', 'java', 0.00, '', '', 'https://drive.google.com/file/d/1YLpC4cLgANlW6tjOtPTZKnZ3LV9rIRGd/view?usp=drivesdk', '2026-02-11 06:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `career_restart_programs`
--

CREATE TABLE `career_restart_programs` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `prev_domain` varchar(100) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `gap_duration` int(11) DEFAULT NULL,
  `gap_reason` varchar(100) DEFAULT NULL,
  `programs_chosen` varchar(300) DEFAULT NULL,
  `schedule_pref` varchar(50) DEFAULT NULL,
  `mode_pref` varchar(50) DEFAULT NULL,
  `resume_path` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Reviewed','Enrolled','Rejected') DEFAULT 'Pending',
  `registered_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_webinar`
--

CREATE TABLE `career_webinar` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `speaker` varchar(255) NOT NULL,
  `speaker_image` varchar(500) DEFAULT NULL,
  `webinar_date` datetime NOT NULL,
  `zoom_link` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `career_webinar`
--

INSERT INTO `career_webinar` (`id`, `title`, `speaker`, `speaker_image`, `webinar_date`, `zoom_link`, `created_at`, `status`) VALUES
(1, 'Career Restart Programe', 'Alok Halder', 'alok.jpg', '2026-05-01 15:03:00', 'https://meet.google.com/irc-cxao-ysz', '2026-04-29 09:33:58', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `career_webinar_registrations`
--

CREATE TABLE `career_webinar_registrations` (
  `id` int(11) NOT NULL,
  `webinar_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `interest` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `career_webinar_registrations`
--

INSERT INTO `career_webinar_registrations` (`id`, `webinar_id`, `name`, `email`, `mobile`, `interest`, `created_at`) VALUES
(1, 1, 'Pabitra Dey', 'pabitra@gmail.com', '8975456875', 'Data Science', '2026-04-29 09:36:39'),
(2, 1, 'Saibal Jana789', 'saibaljana76@gmail.com', '7878899999', 'Full Stack Development', '2026-04-29 09:37:02'),
(3, 1, 'Soumen Jana', 'soumean@gmail.com', '8975456487', 'Data Science', '2026-04-29 09:37:32');

-- --------------------------------------------------------

--
-- Table structure for table `college_emails`
--

CREATE TABLE `college_emails` (
  `id` int(11) NOT NULL,
  `college_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `college_emails`
--

INSERT INTO `college_emails` (`id`, `college_name`, `email`, `state`) VALUES
(1, 'Test College 1', 'anitaacharjya9539@gmail.com', 'West Bengal'),
(2, 'Test College 2', 'anitaacharjya2016@gmail.com', 'West Bengal'),
(3, 'Kolkata Tech Institute', 'demo1@testmail.com', 'West Bengal'),
(4, 'Kolkata Business School', 'demo2@testmail.com', 'West Bengal'),
(5, 'Howrah Management College', 'demo3@testmail.com', 'West Bengal'),
(6, 'Delhi Science College', 'delhi1@testmail.com', 'Delhi'),
(7, 'Delhi Commerce Academy', 'delhi2@testmail.com', 'Delhi'),
(8, 'Delhi IT Hub', 'delhi3@testmail.com', 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `course_registrations`
--

CREATE TABLE `course_registrations` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `college` varchar(150) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `mode_of_learning` varchar(50) DEFAULT NULL,
  `resume` varchar(200) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_registrations`
--

INSERT INTO `course_registrations` (`id`, `full_name`, `email`, `mobile`, `gender`, `college`, `course`, `branch`, `graduation_year`, `category`, `course_name`, `duration`, `mode_of_learning`, `resume`, `registration_date`, `status`) VALUES
(1, 's', 'sfdfs1@gmail.com', '7575757575', 'Other', 's', 's', 's', 2030, 'IT', 'Cloud Computing (AWS/Azure)', '6 Months', 'Offline', 'https://drive.google.com/file/d/19iRzaS195QognqNt2qJ4k6jpkhsl0d7K/view?usp=drivesdk', '2025-12-11 11:58:18', 'Approved'),
(2, 'saibal jana', 'saibaljana76@gmail.com', '8436350842', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 11:41:45', NULL),
(3, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'B.Sc', 2024, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 11:45:38', NULL),
(4, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Data Science', NULL, NULL, NULL, '2026-02-10 11:46:35', NULL),
(5, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'Digital Marketing', NULL, NULL, NULL, '2026-02-10 11:56:10', NULL),
(6, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2027, NULL, 'Human Resource Management', NULL, NULL, NULL, '2026-02-10 11:57:09', NULL),
(7, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'UX/UI Design', NULL, NULL, NULL, '2026-02-10 11:58:25', NULL),
(8, 'saibal jana', 'saibaljana76@gmail.com', '8436350842', NULL, NULL, NULL, 'BCA', 2024, NULL, 'Product Management', NULL, NULL, NULL, '2026-02-10 11:59:27', 'Approved'),
(9, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'Financial Modeling', NULL, NULL, NULL, '2026-02-10 12:01:05', NULL),
(10, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'MCA', 2028, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 12:02:09', NULL),
(11, 'saibal jana', 'saibaljana76@gmail.com', '8436350842', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Software Testing', NULL, NULL, NULL, '2026-02-10 12:02:33', NULL),
(12, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'B.Tech', 2027, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 12:03:57', NULL),
(13, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2027, NULL, 'Data Science With AI', NULL, NULL, NULL, '2026-02-10 12:09:38', NULL),
(14, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'AutoCad', NULL, NULL, NULL, '2026-02-10 12:10:44', NULL),
(15, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'B.Tech', 2028, NULL, 'Advance Excel', NULL, NULL, NULL, '2026-02-10 12:12:13', NULL),
(16, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'MCA', 2028, NULL, 'ML with AI', NULL, NULL, NULL, '2026-02-10 12:13:06', NULL),
(17, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'DigitalAI', NULL, NULL, NULL, '2026-02-10 12:14:28', NULL),
(18, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'Programming With Python', NULL, NULL, NULL, '2026-02-10 12:15:26', NULL),
(19, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'B.Tech', 2027, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 12:16:56', NULL),
(20, 'saibal jana', 'saibaljana76@gmail.com', '6296991106', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 12:19:01', NULL),
(21, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:00:57', NULL),
(22, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:03:23', NULL),
(23, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2027, NULL, 'Programming With Python', NULL, NULL, NULL, '2026-02-10 14:04:20', NULL),
(24, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2024, NULL, 'DigitalAI', NULL, NULL, NULL, '2026-02-10 14:05:16', NULL),
(25, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'BCA', 2027, NULL, 'ML with AI', NULL, NULL, NULL, '2026-02-10 14:06:16', NULL),
(26, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'MCA', 2026, NULL, 'AutoCad', NULL, NULL, NULL, '2026-02-10 14:07:12', NULL),
(27, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'Data Science With AI', NULL, NULL, NULL, '2026-02-10 14:09:31', NULL),
(28, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Sc', 2025, NULL, 'Data Science', NULL, NULL, NULL, '2026-02-10 14:11:02', NULL),
(29, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'M.Tech', 2027, NULL, 'Human Resource Management', NULL, NULL, NULL, '2026-02-10 14:11:49', NULL),
(30, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'M.Tech', 2027, NULL, 'Digital Marketing', NULL, NULL, NULL, '2026-02-10 14:13:05', NULL),
(31, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:13:36', NULL),
(32, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'UX/UI Design', NULL, NULL, NULL, '2026-02-10 14:15:14', NULL),
(33, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '9775227339', NULL, NULL, NULL, 'MCA', 2027, NULL, 'UX/UI Design', NULL, NULL, NULL, '2026-02-10 14:15:48', NULL),
(34, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Product Management', NULL, NULL, NULL, '2026-02-10 14:16:09', NULL),
(35, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Financial Modeling', NULL, NULL, NULL, '2026-02-10 14:16:44', NULL),
(36, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:17:34', NULL),
(37, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Software Testing', NULL, NULL, NULL, '2026-02-10 14:18:40', NULL),
(38, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:19:00', NULL),
(39, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '09775227339', NULL, NULL, NULL, 'B.Tech', 2024, NULL, 'Advance Excel', NULL, NULL, NULL, '2026-02-12 06:57:41', NULL),
(40, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:15', NULL),
(41, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:15', NULL),
(42, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:15', NULL),
(43, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:15', NULL),
(44, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:15', NULL),
(45, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:15', NULL),
(46, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:15', NULL),
(47, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:16', NULL),
(48, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:16', NULL),
(49, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:17', NULL),
(50, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:17', NULL),
(51, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:17', NULL),
(52, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:18', NULL),
(53, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:18', NULL),
(54, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:18', NULL),
(55, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:18', NULL),
(56, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:18', NULL),
(57, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:19', NULL),
(58, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:19', NULL),
(59, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:19', NULL),
(60, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:19', NULL),
(61, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:20', NULL),
(62, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:20', NULL),
(63, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:20', NULL),
(64, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:20', NULL),
(65, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:20', NULL),
(66, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:20', NULL),
(67, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:20', NULL),
(68, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:21', NULL),
(69, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:21', NULL),
(70, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:21', NULL),
(71, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:22', NULL),
(72, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:22', NULL),
(73, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:22', NULL),
(74, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:22', NULL),
(75, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:22', NULL),
(76, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:22', NULL),
(77, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:22', NULL),
(78, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:23', NULL),
(79, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:23', NULL),
(80, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:23', NULL),
(81, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:23', NULL),
(82, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:23', NULL),
(83, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:24', NULL),
(84, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:25', NULL),
(85, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:25', NULL),
(86, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:26', NULL),
(87, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:26', NULL),
(88, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:26', NULL),
(89, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:26', NULL),
(90, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:27', NULL),
(91, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:27', NULL),
(92, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:27', NULL),
(93, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:27', NULL),
(94, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:27', NULL),
(95, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:27', NULL),
(96, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:27', NULL),
(97, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:28', NULL),
(98, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:28', NULL),
(99, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:28', NULL),
(100, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:29', NULL),
(101, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:29', NULL),
(102, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:30', NULL),
(103, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:30', NULL),
(104, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:31', NULL),
(105, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:31', NULL),
(106, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:31', NULL),
(107, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:32', NULL),
(108, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:32', NULL),
(109, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:32', NULL),
(110, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:32', NULL),
(111, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:16:33', NULL),
(112, 'imtiaz ali', 'imtiaz@gmail.com', '9775227339', NULL, NULL, NULL, 'B.Tech', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 04:17:18', NULL),
(113, 'imtiaz ali', 'imtiaz@gmail.com', '09775227339', NULL, NULL, NULL, 'MCA', 2024, NULL, 'Web Development With AI', NULL, NULL, NULL, '2026-02-13 04:18:11', NULL),
(114, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '09775227339', NULL, NULL, NULL, 'MCA', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 05:41:02', NULL),
(115, 'Suman Jana', 'suman@gmail.com', '07867564323', NULL, NULL, NULL, 'BCA', 2026, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 05:42:45', NULL),
(116, 'Sayan Bhaumik', 'sayanbhaumik65@gmail.com', '09775227339', NULL, NULL, NULL, 'B.Sc', 2028, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 05:46:57', NULL),
(117, 'Saibal Jana', 'saibaljana76@gmail.com', '98456566', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-13 10:25:44', NULL),
(118, 'Soumen Jana', 'soumean@gmail.com', '8975456', NULL, NULL, NULL, 'M.Tech', 2028, NULL, 'Data Science', NULL, NULL, NULL, '2026-02-13 10:26:19', NULL),
(119, 'Suman Jana', 'suman@gmail.com', '07867564323', NULL, NULL, NULL, 'M.Tech', 2024, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-24 16:40:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deleted_internships`
--

CREATE TABLE `deleted_internships` (
  `archive_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `employer_email` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `internship_type` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `openings` int(11) DEFAULT NULL,
  `stipend_type` varchar(50) DEFAULT NULL,
  `stipend_amount` int(11) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `responsibilities` text DEFAULT NULL,
  `perks` text DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `applicant_ids` text DEFAULT NULL,
  `posted_on` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp(),
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_jobs`
--

CREATE TABLE `deleted_jobs` (
  `archive_id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `employer_email` varchar(45) DEFAULT NULL,
  `post_as` varchar(200) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `company_email` varchar(45) DEFAULT NULL,
  `job_title` varchar(200) DEFAULT NULL,
  `job_location` varchar(200) DEFAULT NULL,
  `min_exp` int(11) DEFAULT NULL,
  `max_exp` int(11) DEFAULT NULL,
  `min_salary` int(11) DEFAULT NULL,
  `max_salary` int(11) DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `skills_required` text DEFAULT NULL,
  `qualifications` text DEFAULT NULL,
  `contact_email` varchar(200) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `prefer_call_times` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `posted_date` timestamp NULL DEFAULT NULL,
  `applicant_ids` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deleted_jobs`
--

INSERT INTO `deleted_jobs` (`archive_id`, `job_id`, `employer_email`, `post_as`, `company_name`, `company_email`, `job_title`, `job_location`, `min_exp`, `max_exp`, `min_salary`, `max_salary`, `benefits`, `job_description`, `skills_required`, `qualifications`, `contact_email`, `contact_phone`, `prefer_call_times`, `status`, `posted_date`, `applicant_ids`, `deleted_at`) VALUES
(4, 1, 'contact@j2c.in', 'Company/Business', 'pcs global pvt ltd', NULL, 'java devloper', 'kolkata', 2, 4, 3, 6, 'fghjjjk', 'sdfrtyuio', 'Java,Servlet,SpringBoot', 'szdxcfgvbhnjm,.', 'anitaacharjya9539@gmail.com', '9876543210', '10-6', 'Active', '2026-02-24 11:34:17', '', '2026-03-02 09:58:52'),
(5, 23, 'contact@j2c.in', 'Company/Business', 'Pcs global', 'contact@j2c.in', 'AI Engineer', 'Agra', 2, 3, 20000, 25000, 'Gym Membership', 'djfijsjdp', 'null,Accessibility (a11y)', 'B.Tech', 'saibaljana76@gmail.com', '7899998999', '9:00 AM - 6:00 PM', 'Active', '2026-02-24 11:34:17', '', '2026-03-05 05:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `education_history`
--

CREATE TABLE `education_history` (
  `userid` int(11) NOT NULL,
  `qualification` varchar(50) NOT NULL DEFAULT '0',
  `specialization` varchar(50) NOT NULL DEFAULT '0',
  `passingyear` varchar(50) NOT NULL DEFAULT '0',
  `institute` varchar(50) NOT NULL DEFAULT '0',
  `course` varchar(50) NOT NULL DEFAULT '0',
  `issue` varchar(50) NOT NULL DEFAULT '0',
  `validity` varchar(50) NOT NULL DEFAULT '0',
  `ptitle` varchar(50) NOT NULL DEFAULT '0',
  `startdate` varchar(50) NOT NULL DEFAULT '0',
  `enddate` varchar(50) NOT NULL DEFAULT '0',
  `pdescription` varchar(500) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `education_history`
--

INSERT INTO `education_history` (`userid`, `qualification`, `specialization`, `passingyear`, `institute`, `course`, `issue`, `validity`, `ptitle`, `startdate`, `enddate`, `pdescription`) VALUES
(1, 'B.Tech', 'ECE', '2015', 'IST', 'J2EE', 'ORACLE', '2028', 'Online Examination System', '2017-03-09T18:30:00.000Z', '2017-03-24T18:30:00.000Z', 'Project implementation using jsp and servlet'),
(2, 'B.Tech', 'ECE', '2015', 'NITMAS', 'mar java JAVA', 'NIESBUD', '2019', 'Online Examination system', '', '', 'implemented using jsp and servlet');

-- --------------------------------------------------------

--
-- Table structure for table `employer_personal_details`
--

CREATE TABLE `employer_personal_details` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `mobileNumber` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employer_personal_details`
--

INSERT INTO `employer_personal_details` (`id`, `name`, `emailId`, `password`, `mobileNumber`, `status`) VALUES
(1, 'Subhadip', 'subhadippradhansubha@gmail.com', 'bjbjb', '9647350232', NULL),
(3, 'Anita Acharjya', 'contact@j2c.in', NULL, '7602171906', 'Approved'),
(4, 'Saibal Jana', 'saibal@gmail.com', 'Saibal123', '8436350842', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employer_plans`
--

CREATE TABLE `employer_plans` (
  `id` int(11) NOT NULL,
  `employer_email` varchar(100) DEFAULT NULL,
  `plan_type` varchar(20) DEFAULT NULL,
  `plan_category` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `post_limit` int(11) DEFAULT NULL,
  `applicant_limit` int(11) DEFAULT NULL,
  `used_posts` int(11) DEFAULT 0,
  `expiry_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internship_applications`
--

CREATE TABLE `internship_applications` (
  `id` int(11) NOT NULL,
  `internship_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `applied_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `internship_applications`
--

INSERT INTO `internship_applications` (`id`, `internship_id`, `jobseeker_id`, `applied_at`) VALUES
(2, 31, 1, '2026-03-30 09:11:01'),
(3, 38, 1, '2026-03-31 05:18:17'),
(6, 36, 1, '2026-03-31 06:39:01'),
(7, 40, 1, '2026-03-31 06:46:06'),
(8, 41, 1, '2026-03-31 07:49:59'),
(9, 42, 117, '2026-03-31 08:30:40'),
(10, 42, 118, '2026-03-31 08:30:41'),
(11, 42, 1, '2026-04-08 12:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `internship_drive_registration`
--

CREATE TABLE `internship_drive_registration` (
  `id` int(11) NOT NULL,
  `internship_drive_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `college_university` varchar(150) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `passing_year` year(4) NOT NULL,
  `preferred_domains` varchar(255) DEFAULT NULL,
  `terms_accepted` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `internship_drive_registration`
--

INSERT INTO `internship_drive_registration` (`id`, `internship_drive_id`, `full_name`, `mobile`, `email`, `college_university`, `state`, `city`, `course`, `passing_year`, `preferred_domains`, `terms_accepted`, `created_at`) VALUES
(1, 1, 'Saibal Jana', '9845656687', 'saibaljana76@gmail.com', 'Heritage institute of Technology', 'West Bengal', 'Kolkata', 'B.Tech / B.E.', '2025', 'Backend Developer', 1, '2026-04-27 06:25:36'),
(3, 2, 'Saibal Jana', '7788997745', 'saibaljana76@gmail.com', 'Heritage institute of Technology', 'West Bengal', 'Kolkata', 'Other', '2026', 'Brand Manager', 0, '2026-04-27 07:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `internship_postings`
--

CREATE TABLE `internship_postings` (
  `id` int(11) NOT NULL,
  `employer_email` varchar(150) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `internship_type` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `openings` int(11) DEFAULT NULL,
  `stipend_type` varchar(50) DEFAULT NULL,
  `stipend_amount` int(11) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `responsibilities` text DEFAULT NULL,
  `perks` text DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `posted_on` timestamp NULL DEFAULT current_timestamp(),
  `location` varchar(45) DEFAULT NULL,
  `end_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `internship_postings`
--

INSERT INTO `internship_postings` (`id`, `employer_email`, `title`, `internship_type`, `duration`, `start_date`, `openings`, `stipend_type`, `stipend_amount`, `skills`, `responsibilities`, `perks`, `additional_info`, `posted_on`, `location`, `end_date`) VALUES
(1, 'contact@j2c.in', 'cvbnbvcvbn', 'In-office', '3 months', '2025-12-10', 70, 'Fixed', 0, 'dfghjhgfds', 'cdfghjkjhgfd', 'Certificate, LOR, Certificate, LOR', 'vbnmnbvc', '2025-12-10 12:41:39', 'Bangalore', '0000-00-00 00:00:00'),
(2, 'vinayaka@gmail.com', 'web devlopmntbintern', 'In-office', '3 months', '2026-01-28', 100, 'Fixed', 10000, 'rtyufgkoko', 'v bnmnbv ', 'Certificate, LOR, 5 Days, Certificate, LOR, 5 Days', 'cvbnm,mnb', '2026-01-28 06:01:08', 'kolkata', '0000-00-00 00:00:00'),
(3, 'contact@j2c.in', 'web devlopmntbintern', 'In-office', '3 months', '2026-01-28', 100, 'Fixed', 10000, 'rtyufgkoko', 'v bnmnbv ', 'Certificate, LOR, 5 Days, Certificate, LOR, 5 Days', 'cvbnm,mnb', '2026-01-28 06:01:59', 'kolkata', '0000-00-00 00:00:00'),
(4, 'vinayaka@gmail.com', 'AI Engineer', 'In-office', '1 Month', '2026-02-28', 1, 'Performance Based', 0, 'JavaScript', 'njhg', 'Certificate, Certificate', 'jnb', '2026-02-09 11:56:33', 'Bangalore', '0000-00-00 00:00:00'),
(5, 'vinayaka@gmail.com', 'Backend Developer', 'Hybrid', '1 Month', '2026-02-27', 5, 'Performance Based', 3000, 'Java, Django, Python', 'bring lapi', 'Certificate, LOR, Flexible Hours, 5 Days, Certificate, LOR, Flexible Hours, 5 Days', 'do documentation of your work', '2026-02-09 16:35:28', 'Bangalore', '0000-00-00 00:00:00'),
(7, 'vinayaka@gmail.com', 'DevOps Engineer', 'Remote', '12 Months', '2026-02-15', 19, 'Unpaid', 0, 'Java, HTML, Python', 'dghh', 'Certificate, Certificate', 'gsgg', '2026-02-09 16:47:31', 'Ahmedabad,Baroda (Vadodara),Bangalore', '0000-00-00 00:00:00'),
(9, 'vinayaka@gmail.com', 'Backend Developer', 'In-office', '1 Month', '2026-02-14', 1, 'Unpaid', 0, 'JavaScript', 'kodsk', '5 Days, 5 Days', 'h', '2026-02-09 18:45:59', 'Bangalore', '0000-00-00 00:00:00'),
(10, 'contact@j2c.in', 'Accountant', 'Remote', '1 Month', '2026-02-12', 5, 'Fixed', 8000, 'Accessibility (a11y)', 'suifhsoifjspjsdpiksdpou', 'Certificate, LOR, 5 Days, Certificate, LOR, 5 Days', 'hsfsofpsfpsd', '2026-02-12 08:09:23', 'Kolkata', '0000-00-00 00:00:00'),
(11, 'vinayaka@gmail.com', 'AI Engineer', 'In-office', '1 Month', '1999-10-12', 1, 'Fixed', 2000, 'Java', 'difjfp', 'Certificate, Certificate', 'fuodpd', '2026-02-13 05:42:19', 'Agra', '0000-00-00 00:00:00'),
(12, 'vinayaka@gmail.com', 'Backend Developer', 'Remote', '3 Months', '2026-02-25', 50, 'Performance Based', 8000, 'HTML, CSS, Java, JavaScript, Python, Data Structures', 'kjhgcvdbsajdik', 'Certificate, Certificate', 'scc', '2026-02-25 09:30:45', 'Ahmedabad', '0000-00-00 00:00:00'),
(14, 'vinayaka@gmail.com', 'Business Analyst', 'In-office', '1 Month', '2026-02-27', 65, 'Performance Based', 10000, 'Java, JavaScript', 'scccc', 'Certificate', 'sccc', '2026-02-25 20:54:48', 'Bangalore', '0000-00-00 00:00:00'),
(15, 'contact@pcsglobal.com', 'Backend Developer', 'In-office', '1 Month', '2026-02-28', 58, 'Unpaid', 0, 'JavaScript', 'zcvvvvvvvvvvvvvv', 'Certificate, Letter of Recommendation, 5 Days a Week', 'avbfg', '2026-02-25 21:30:48', 'Bangalore,Kolkata', '0000-00-00 00:00:00'),
(16, 'contact@pcsglobal.com', 'Backend Developer', 'In-office', '1 Month', '2026-02-28', 6, 'Unpaid', 0, 'Java, JavaScript, Python', 'sddfghjk', 'Certificate', 'adsfghbnm,', '2026-02-25 21:34:02', 'Bangalore,Ahmedabad', '0000-00-00 00:00:00'),
(18, 'contact@pcsglobal.com', 'Backend Developer', 'In-office', '1 Month', '2026-02-28', 66, 'Unpaid', 0, 'Java, HTML, CSS, Python', 'aaa', 'Certificate, Letter of Recommendation, Flexible Work Hours, 5 Days a Week, Pre-Placement Offer (PPO), Informal Dress Code', 'qffffffffffffffffff', '2026-02-27 05:52:36', 'Bangalore', '0000-00-00 00:00:00'),
(20, 'vinayaka@gmail.com', 'Backend Developer', 'Remote', '6 Months', '2026-03-04', 3, 'Performance Based', 15000, 'CSS, Adaptability', 'jhgkfgfkgh6666', 'Certificate, Letter of Recommendation, Flexible Work Hours, 5 Days a Week, Pre-Placement Offer (PPO), Informal Dress Code', 'bring laptop ', '2026-02-26 05:16:17', 'Bangalore', '0000-00-00 00:00:00'),
(21, 'contact@pcsglobal.com', 'Sales Manager', 'In-office', '3 Months', '2026-02-26', 2, 'Fixed', 0, 'Environmental Management, Brand Management', 'lllllllllllllllllllllll', 'Certificate, Letter of Recommendation, Informal Dress Code', 'ooooooooooooooooooooo', '2026-02-27 09:55:23', 'Pune', '0000-00-00 00:00:00'),
(25, 'vinayaka@gmail.com', 'AI Engineer', 'Remote', '3 Months', '2026-02-28', 2, 'Unpaid', 0, 'Accountability, Adaptability', 'fsdv', 'Certificate, Pre-Placement Offer (PPO)', 'bring lapi54', '2026-02-27 11:59:18', 'Kolkata', '0000-00-00 00:00:00'),
(27, 'vinayaka@gmail.com', 'AI Engineer', 'Remote', '3', '2026-03-24', 8, 'Fixed', 5000, 'Java', 'cvb', 'Certificate', 'dsd', '2026-03-24 12:23:55', '', '2026-03-24 12:23:55'),
(28, 'vinayaka@gmail.com', 'Frontend Developer', 'Remote', '3', '2026-03-24', 9, 'Performance Based', 0, 'HTML, CSS, JavaScript, Java, Node.js, MySQL, Performance Optimisation', 'sdfg', 'Certificate', 'ds', '2026-03-24 13:30:02', '', '2026-03-24 13:30:02'),
(29, 'vinayaka@gmail.com', 'java developer intern', 'Hybrid', '1 Month', '2026-03-25', 19, 'Performance Based', 0, 'HTML, CSS, JavaScript, React, Spring Boot, Java, MySQL', '-Assist in developing web applications using Java, JSP, and Servlets\r\n-Write clean, efficient, and well-documented code\r\nWork with databases like MySQL to perform CRUD operations\r\n-Support debugging and troubleshooting of applications\r\n-Collaborate with team members to design and implement new features\r\n-Participate in code reviews and team meetings', 'Certificate, Informal Dress Code', '-Knowledge of Spring Boot (optional but good to have)\r\n-Familiarity with MVC architecture\r\n-Strong problem-solving skills\r\n-Good communication and teamwork abilities', '2026-03-25 04:29:46', 'Bangalore,Kolkata', '2026-03-25 04:31:19'),
(30, 'vinayaka@gmail.com', 'java developer intern', 'Hybrid', '3', '2026-03-25', 6, 'Performance Based', 0, 'HTML, CSS, JavaScript', 'lksas', 'Certificate', 'yutre', '2026-03-25 05:15:58', 'Bangalore,Kolkata', '2026-03-25 05:15:58'),
(31, 'vinayaka@gmail.com', 'java developer intern', 'Hybrid', '1 Month', '2026-03-25', 2, 'Performance Based', 0, 'Java, CSS, Express.js, JavaScript', 'sadafbdgf', 'Certificate, Pre-Placement Offer (PPO), Informal Dress Code', 'asdfsgd', '2026-03-25 17:50:59', 'Bangalore,Kolkata', '2026-03-25 17:53:11'),
(32, 'vinayaka@gmail.com', 'Cloud Architect', 'In-office', '3', '2026-03-25', 4, 'Unpaid', 0, 'HTML', 'sdfddfsvbjnm\r\njfgjhjdkjl\r\nhvgjshghjssjk\r\njkkgfhj\r\nkghfh', 'Certificate, Pre-Placement Offer (PPO)', 'kjgdfsdfghjk;l\r\ntrtsdgfhj\r\nddfghkl\r\nfdghjkjl\r\ndfghhkk', '2026-03-25 18:05:04', 'Agra', '2026-03-25 18:05:04'),
(33, 'vinayaka@gmail.com', 'Content Writer', 'Remote', '2', '2026-03-25', 1, 'Performance Based', 0, 'Content Writing', 'radfh', 'Certificate, Informal Dress Code', 'zfxchvb', '2026-03-25 18:21:02', '', '2026-03-25 18:21:02'),
(34, 'vinayaka@gmail.com', 'Content Writer', 'Remote', '2', '2026-03-25', 1, 'Performance Based', 0, 'Content Writing', 'radfh', 'Certificate, Informal Dress Code', 'zfxchvb', '2026-03-25 18:22:07', '', '2026-03-25 18:22:07'),
(35, 'vinayaka@gmail.com', 'Data Analyst', 'In-office', '3', '2026-03-25', 48, 'Unpaid', 0, 'Administrative Support', 'cvbcb', 'Certificate, Informal Dress Code', 'zxcxcv', '2026-03-25 18:28:48', 'Alappuzha', '2026-03-25 18:28:48'),
(36, 'vinayaka@gmail.com', 'Brand Manager', 'In-office', '1 Month', '2026-03-26', 6, 'Fixed', 12120, 'Brand Ambassador Skills, Organisation, HTML, CSS', 'aadsfgh\r\nfasdghjkl\r\ndfghjkl;\r\nfdsdfghjkl\r\nhjgfdsfghjk\r\nzxcgvhjkl;', 'Certificate, 5 Days a Week, Pre-Placement Offer (PPO), Informal Dress Code', 'uytreaw\r\nljkhgfdsa\r\n4kghfds\r\nkljhgfd', '2026-03-26 05:42:50', 'Bangalore', '2026-03-25 18:30:00'),
(38, 'vinayaka@gmail.com', 'Nurse', 'Hybrid', '3', '2026-03-28', 12, 'Performance Based', 0, 'CSS, HTML, JavaScript, Python, Java, Django', 'jkgffkjhgc\r\nxcvhbjkl\r\nkhjgfdxcvbn\r\nxdfcgvhbjnkml,\r\nghfxffcvbn\r\nkjhgg', 'Certificate, Informal Dress Code', 'ljkhjdfsfg\r\nhjdsfassdfghjkl\r\nkljdsf\r\nlk;jhgfdsfgh\r\nkjgfdsfv', '2026-03-28 18:04:04', 'Bangalore', '2026-03-27 18:30:00'),
(40, 'vinayaka@gmail.com', 'Backend Developer', 'In-office', '3', '2026-03-31', 10, 'Performance Based', 0, 'Django, Java, React, HTML, CSS', 'Develop and maintain RESTful APIs using Java / Node.js / Spring Boot\r\nWork with databases like MySQL or MongoDB\r\nWrite clean, efficient, and reusable code\r\nDebug and fix backend issues\r\nCollaborate with frontend team for API integration\r\nOptimize application performance and scalability\r\nParticipate in code reviews and testing', 'Certificate, Letter of Recommendation, Informal Dress Code', 'Basic knowledge of Java / Node.js required\r\nFamiliarity with SQL and database concepts\r\nUnderstanding of REST APIs is a plus\r\nInternship Duration: 3 to 6 Months\r\nWork Mode: Onsite / Hybrid\r\nSelection Process:\r\nAptitude Test\r\nTechnical Interview\r\nHR Round\r\nCandidates must bring their own laptop\r\nImmediate joiners preferred', '2026-03-31 06:42:55', 'Bangalore', '2026-06-30 18:30:00'),
(41, 'vinayaka@gmail.com', 'Content Writer', 'In-office', '3', '2026-03-31', 12, 'Performance Based', 0, 'Content Writing', 'Write and edit blogs, articles, website content, and social media posts\r\nResearch industry-related topics to create informative ', 'Certificate, Informal Dress Code', 'Internship Duration: 3–6 Months\r\n', '2026-03-31 07:43:19', 'Kolkata,Bangalore', '2026-06-30 18:30:00'),
(42, 'vinayaka@gmail.com', 'Education Counselor', 'In-office', '1 Month', '2026-02-28', 6, 'Performance Based', 0, 'CSS, Customer Experience Design, HTML', 'ttttttttttttttt', 'Certificate, Letter of Recommendation, Informal Dress Code', 'mmmmmmmmmmmmmmmmmm', '2026-02-27 10:03:58', 'Bangalore', '2026-02-27 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `internship_registrations`
--

CREATE TABLE `internship_registrations` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `college` varchar(150) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `graduation_year` varchar(10) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `internship_type` varchar(50) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `google_drive_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `location` varchar(45) DEFAULT NULL,
  `skills` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `internship_registrations`
--

INSERT INTO `internship_registrations` (`id`, `full_name`, `email`, `mobile`, `gender`, `college`, `course`, `branch`, `graduation_year`, `domain`, `duration`, `internship_type`, `resume`, `google_drive_link`, `created_at`, `location`, `skills`) VALUES
(1, 'Saibal Jana', 'saibal@gmail.com', '9875555895', 'Male', 'Netaji Subhas Engineering college', 'B.TECH', 'IT', '2025', 'JAVA', '4', NULL, NULL, NULL, '2026-02-09 08:26:24', 'Kolkata', 'JSP,Servlet,Spring Boot,React,Bootstap,Html'),
(2, 'Sayan Bhoumik', 'sayan@gmail.com', '9874561236', 'Male', 'SNU', 'B.TECH', 'CSE', '2025', 'Paython', '4', NULL, NULL, NULL, '2026-02-09 08:41:16', 'Bangalore', 'Paython,React'),
(14, 'Suemen Jana', 'soumen@gmail.com', '1234567896', 'Male', 'HIT', 'BSC', 'CIVIL', '2026', 'Civil', '5', NULL, NULL, NULL, '2026-02-09 08:41:16', 'Pune', 'Automation'),
(15, 'Soumen Jana', 'soumenj303@gmail.com', '9641808133', 'Male', 'SNU', 'B.Tech', 'Computer Science', '2025', 'Java / Python Development', '12', NULL, NULL, 'https://drive.google.com/file/d/1ZFAfbAIoij2ZPP2RdBW1BHCkxY4iZ7GU/view?usp=drivesdk', '2026-02-10 14:23:50', 'Kolkata', 'Java');

-- --------------------------------------------------------

--
-- Table structure for table `internship_skills`
--

CREATE TABLE `internship_skills` (
  `id` int(11) NOT NULL,
  `internship_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `internship_skills`
--

INSERT INTO `internship_skills` (`id`, `internship_id`, `skill_id`) VALUES
(1, 13, 95),
(2, 13, 8),
(3, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `j2cemploye`
--

CREATE TABLE `j2cemploye` (
  `id` int(11) NOT NULL,
  `emailId` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `j2cemploye`
--

INSERT INTO `j2cemploye` (`id`, `emailId`, `password`, `firstName`, `lastName`, `mobileNumber`) VALUES
(1, 'contact@j2c.in', NULL, NULL, NULL, NULL),
(2, 'subhadippradhansubha@gmail.com', 'gtgtftyf', 'Subhadip', 'Pradhan', '9647350232'),
(3, 'saibaljana687@gmail.com', 'Saibal@123', 'Saibal', 'Jana', '9875555895'),
(4, 'contact@j2c.in', 'Anita@2000', 'Anita', 'Acharjya', '7602171906'),
(5, 'subhadippradhansubha@gmail.com', 'drgdrgdr', 'Subhadip', 'Pradhan', '9647350232');

-- --------------------------------------------------------

--
-- Table structure for table `jobseekers`
--

CREATE TABLE `jobseekers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `university` varchar(100) DEFAULT NULL,
  `passing_year` varchar(10) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `resume` varchar(200) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `profile_summary` text DEFAULT NULL,
  `languages_known` varchar(255) DEFAULT NULL,
  `tenth_board` varchar(100) DEFAULT NULL,
  `tenth_year` varchar(10) DEFAULT NULL,
  `tenth_percent` varchar(10) DEFAULT NULL,
  `twelfth_board` varchar(100) DEFAULT NULL,
  `twelfth_year` varchar(10) DEFAULT NULL,
  `twelfth_percent` varchar(10) DEFAULT NULL,
  `profile_completion` int(11) DEFAULT 0,
  `portfolio_link` varchar(255) DEFAULT NULL,
  `total_experience` varchar(10) DEFAULT NULL,
  `notice_period` varchar(50) DEFAULT NULL,
  `current_designation` varchar(100) DEFAULT NULL,
  `current_company` varchar(150) DEFAULT NULL,
  `current_salary` varchar(50) DEFAULT NULL,
  `profile_last_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobseekers`
--

INSERT INTO `jobseekers` (`id`, `fullname`, `email`, `mobile`, `dob`, `gender`, `location`, `qualification`, `specialization`, `university`, `passing_year`, `linkedin`, `password`, `skills`, `resume`, `photo`, `created_at`, `profile_summary`, `languages_known`, `tenth_board`, `tenth_year`, `tenth_percent`, `twelfth_board`, `twelfth_year`, `twelfth_percent`, `profile_completion`, `portfolio_link`, `total_experience`, `notice_period`, `current_designation`, `current_company`, `current_salary`, `profile_last_updated`) VALUES
(1, 'Rohit Sharma', 'rohit.experienced@example.com', '9876543210', '1994-05-18', 'Male', 'Bengaluru', 'B.Tech', 'Computer Science', 'ABC Institute of Technology', '2016', 'https://www.linkedin.com/in/rohit-sharma-demo', 'pass123', 'Java,Spring Boot,MySQL,REST API', 'rohit_resume.pdf', 'rohit_photo.jpg', '2026-03-16 20:28:29', 'Senior Java developer with 5+ years of experience in building scalable enterprise applications in finance and e-commerce domains.', 'English,Hindi', 'CBSE', '2010', '88%', 'CBSE', '2012', '85%', 90, 'https://github.com/rohit-demo', '5', '60 Days', 'Senior Software Engineer', 'TechNova Solutions Pvt Ltd', '12 LPA', '2026-03-17 01:58:29'),
(2, 'Ananya Verma', 'ananya.fresher@example.com', '9123456780', '2001-09-10', 'Female', 'Pune', 'B.Sc', 'Information Technology', 'XYZ College of Science', '2023', 'https://www.linkedin.com/in/ananya-verma-demo', 'pass123', 'HTML,CSS,JavaScript,React,MySQL', 'ananya_resume.pdf', 'ananya_photo.jpg', '2026-03-16 20:28:29', 'Enthusiastic fresher with strong fundamentals in web development, eager to work on real-world projects and learn modern frameworks.', 'English,Hindi,Marathi', 'State Board', '2017', '86%', 'State Board', '2019', '82%', 80, 'https://github.com/ananya-demo', '0', '', '', '', '', '2026-03-17 01:58:29'),
(117, 'Ravi Kumar', 'ravi@gmail.com', '9876543210', '1999-05-12', 'Male', 'Bangalore', 'B.Tech', 'Computer Science', 'VTU', '2021', 'https://linkedin.com/in/ravikumar', 'ravi123', 'Java, Spring Boot, MySQL', 'ravi_resume.pdf', '', '2026-02-09 20:55:10', 'Java backend developer with Spring Boot experience', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '3', '30 Days', NULL, NULL, NULL, NULL),
(118, 'Sneha Reddy', 'sneha@gmail.com', '9123456789', '2000-02-20', 'Female', 'Hyderabad', 'MCA', 'Software Engineering', 'Osmania University', '2022', 'https://linkedin.com/in/snehareddy', 'sneha123', 'Java,JSP,Servlets,SQL', 'sneha_resume.pdf', 'sneha.png', '2026-02-09 20:55:10', 'Full stack Java developer', 'English, Hindi, Marathi', 'CBSE', '2011', '92%', 'CBSE', '2013', '88%', 95, 'github.com/arjun-dev', '1', 'Immediate', NULL, NULL, NULL, '2026-03-16 17:33:01'),
(119, 'Arjun Mehta', 'arjun.mehta@email.com', '9876543210', '1995-05-15', 'Male', 'Mumbai', 'B.Tech', 'Computer Science', 'IIT Bombay', '2017', 'linkedin.com/in/arjunm', 'pass123', 'Java, Spring Boot, MySQL, AWS', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Backend Developer with 6 years of experience in building scalable microservices.', 'English, Hindi, Marathi', 'CBSE', '2011', '92%', 'CBSE', '2013', '88%', 95, 'github.com/arjun-dev', '6 Years', '30 Days', NULL, NULL, NULL, NULL),
(120, 'Priya Sharma', 'priya.s@email.com', '9822334455', '1998-08-22', 'Female', 'Bangalore', 'M.Tech', 'Data Science', 'IISc Bangalore', '2021', 'linkedin.com/in/priyas', 'securePass', 'Python, R, TensorFlow, Tableau', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Data Scientist passionate about AI research and predictive modeling.', 'English, Hindi, Kannada', 'ICSE', '2014', '95%', 'ISC', '2016', '93%', 90, 'priyads.portfolio', '2 Years', '15 Days', NULL, NULL, NULL, NULL),
(121, 'Rahul Verma', 'rahul.v@email.com', '9001122334', '1993-12-10', 'Male', 'Delhi', 'MBA', 'Marketing', 'FMS Delhi', '2016', 'linkedin.com/in/rahulv', 'market123', 'SEO, Google Ads, Content Strategy', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Marketing Manager specializing in digital growth and brand positioning.', 'English, Hindi, Punjabi', 'CBSE', '2009', '85%', 'CBSE', '2011', '82%', 100, 'rahulverma.com', '7 Years', '60 Days', NULL, NULL, NULL, NULL),
(122, 'Ananya Iyer', 'ananya.i@email.com', '8877665544', '1999-02-28', 'Female', 'Chennai', 'B.E.', 'Electronics', 'Anna University', '2020', 'linkedin.com/in/ananyai', 'pass999', 'C++, Embedded Systems, IoT', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Hardware engineer focused on IoT solutions and firmware development.', 'English, Tamil', 'State Board', '2015', '98%', 'State Board', '2017', '96%', 85, '', '3 Years', 'Immediate', NULL, NULL, NULL, NULL),
(123, 'Vikram Singh', 'vikram.s@email.com', '7766554433', '1990-04-05', 'Male', 'Hyderabad', 'B.Tech', 'Information Technology', 'JNTU', '2012', 'linkedin.com/in/vikrams', 'oldisgold', 'PHP, Laravel, JavaScript, VueJS', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Senior Full Stack Developer with over a decade of experience in FinTech.', 'English, Hindi, Telugu', 'State Board', '2006', '78%', 'State Board', '2008', '75%', 100, 'vikramcodes.io', '11 Years', '90 Days', NULL, NULL, NULL, NULL),
(124, 'Sanya Malhotra', 'sanya.m@email.com', '9988776655', '1997-07-14', 'Female', 'Pune', 'B.Des', 'UI/UX Design', 'NID Ahmedabad', '2019', 'linkedin.com/in/sanyam', 'designlife', 'Figma, Adobe XD, Sketch, HTML/CSS', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Creative Designer specializing in user-centric mobile application interfaces.', 'English, Hindi', 'CBSE', '2013', '89%', 'CBSE', '2015', '91%', 95, 'behance.net/sanya', '4 Years', '30 Days', NULL, NULL, NULL, NULL),
(125, 'Ishaan Das', 'ishaan.d@email.com', '9123456789', '2001-11-20', 'Male', 'Kolkata', 'B.Sc', 'Mathematics', 'St. Xaviers College', '2023', 'linkedin.com/in/ishaand', 'mathisart', 'SQL, Excel, Statistics, PowerBI', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Fresh graduate looking to start a career in Business Analytics.', 'English, Bengali', 'WBBSE', '2017', '94%', 'WBCHSE', '2019', '90%', 70, '', '0 Years', 'Immediate', NULL, NULL, NULL, NULL),
(126, 'Megha Kulkarni', 'megha.k@email.com', '8123456780', '1996-01-30', 'Female', 'Pune', 'M.Com', 'Finance', 'Pune University', '2018', 'linkedin.com/in/meghak', 'finance88', 'Accounting, Tally, GST, Auditing', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Detail-oriented Finance professional with experience in taxation and audits.', 'English, Marathi, Hindi', 'State Board', '2012', '82%', 'State Board', '2014', '85%', 90, '', '5 Years', '45 Days', NULL, NULL, NULL, NULL),
(127, 'Aman Gupta', 'aman.g@email.com', '7009988776', '1994-09-18', 'Male', 'Gurgaon', 'B.Tech', 'Mechanical', 'DTU', '2016', 'linkedin.com/in/amang', 'mech123', 'AutoCAD, SolidWorks, Lean Manufacturing', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'Production Engineer focused on workflow optimization and supply chain.', 'English, Hindi', 'CBSE', '2010', '88%', 'CBSE', '2012', '84%', 85, '', '7 Years', '30 Days', NULL, NULL, NULL, NULL),
(128, 'Sneha Reddy', 'sneha.r@email.com', '9008007006', '2000-03-12', 'Female', 'Hyderabad', 'B.A.', 'Psychology', 'Osmania University', '2021', 'linkedin.com/in/snehar', 'hrpass', 'Talent Acquisition, Employee Engagement, MS Office', 'ravi_resume.pdf', NULL, '2026-03-05 12:09:23', 'HR Generalist looking for opportunities in IT recruitment.', 'English, Telugu, Hindi', 'ICSE', '2016', '91%', 'ISC', '2018', '89%', 80, '', '2 Years', '15 Days', NULL, NULL, NULL, NULL),
(129, 'Karan Malhotra', 'karan.m@email.com', '9811122201', '1995-04-12', 'Male', 'Noida', 'B.Tech', 'IT', 'IP University', '2017', 'linkedin.com/in/karanm', 'pass123', 'Swift, Objective-C, iOS SDK, Xcode, SwiftUI, CoreData, Firebase, CocoaPods, MVVM, Combine, Bitbucket, TestFlight, App Store Connect, Realm', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Senior iOS Developer with 6 years of experience building high-performance consumer apps.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, '6 Years', '30 Days', NULL, NULL, NULL, NULL),
(130, 'Riya Kapoor', 'riya.k@email.com', '9811122202', '1997-08-19', 'Female', 'Bangalore', 'B.E.', 'Computer Science', 'VTU', '2019', 'linkedin.com/in/riyak', 'pass123', 'Kotlin, Java, Android Studio, Jetpack Compose, Retrofit, Dagger Hilt, Room DB, Coroutines, Google Maps API, Payment Gateways, Git, CI/CD, Material Design', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Android Specialist focused on modern architecture and smooth user experiences.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, '4 Years', '15 Days', NULL, NULL, NULL, NULL),
(131, 'Zaid Sheikh', 'zaid.s@email.com', '9811122203', '1993-11-30', 'Male', 'Hyderabad', 'M.Tech', 'AI & Robotics', 'IIT Hyderabad', '2016', 'linkedin.com/in/zaids', 'pass123', 'Python, PyTorch, OpenCV, Computer Vision, Image Processing, CUDA, GANs, YOLO, NumPy, Pandas, Linux, Docker, ONNX, Model Optimization', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'AI Research Engineer specializing in real-time object detection and computer vision systems.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, '7 Years', 'Immediate', NULL, NULL, NULL, NULL),
(132, 'Sunita Menon', 'sunita.m@email.com', '9811122204', '1991-02-14', 'Female', 'Mumbai', 'MBA', 'HR', 'NMIMS', '2013', 'linkedin.com/in/sunitam', 'pass123', 'Talent Acquisition, Strategic HR, Employee Engagement, Performance Management, Payroll, Statutory Compliance, HRMS, LinkedIn Recruiter, Behavioral Interviewing, Onboarding, Conflict Resolution, Policy Formulation', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'HR Lead with 10 years of experience in scaling tech startups and organizational culture building.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, '10 Years', '60 Days', NULL, NULL, NULL, NULL),
(133, 'Deepak Verma', 'deepak.v@email.com', '9811122205', '1996-06-22', 'Male', 'Delhi', 'BBA', 'HRM', 'Amity University', '2018', 'linkedin.com/in/deepakv', 'pass123', 'Technical Recruiting, Sourcing, Boolean Search, ATS, Naukri, Monster, Candidate Mapping, Salary Negotiation, Screening, Vendor Management, Campus Hiring', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Technical Recruiter with a strong network in Java and Python developer communities.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, '5 Years', '30 Days', NULL, NULL, NULL, NULL),
(134, 'Sameer Khan', 'sameer.k@email.com', '9811122206', '1994-10-05', 'Male', 'Gurgaon', 'MBA', 'Sales', 'IMT Ghaziabad', '2016', 'linkedin.com/in/sameerk', 'pass123', 'B2B Sales, Lead Generation, CRM, Salesforce, Cold Calling, Sales Pitching, Negotiation, Account Management, Market Analysis, Revenue Growth, Networking, Presentations, Hubspot', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Top-performing Sales Manager exceeding targets consistently in the SaaS industry.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, '7 Years', 'Immediate', NULL, NULL, NULL, NULL),
(135, 'Anjali Gupta', 'anjali.g@email.com', '9811122207', '1998-12-12', 'Female', 'Pune', 'B.Com', 'Marketing', 'Symbiosis', '2020', 'linkedin.com/in/anjalig', 'pass123', 'Business Development, Inside Sales, Lead Qualification, Customer Success, Email Outreach, LinkedIn Sales Navigator, Excel, Canva, Communication, Client Retention', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Inside Sales Specialist with 3 years of experience in the EdTech sector.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, '3 Years', '15 Days', NULL, NULL, NULL, NULL),
(136, 'Varun Dsouza', 'varun.d@email.com', '9811122208', '1995-03-25', 'Male', 'Goa', 'B.Des', 'Visual Comm', 'NID', '2017', 'linkedin.com/in/varund', 'pass123', 'UI Design, UX Research, Figma, Adobe XD, Wireframing, Prototyping, Design Systems, User Journeys, Micro-interactions, Zeplin, InVision, Typography, Accessibility', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'UX Designer passionate about creating accessible and user-centric digital products.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, '6 Years', '45 Days', NULL, NULL, NULL, NULL),
(137, 'Neha Reddy', 'neha.r@email.com', '9811122209', '1999-01-08', 'Female', 'Chennai', 'B.Arch', 'Interior Design', 'Anna University', '2021', 'linkedin.com/in/nehar', 'pass123', 'AutoCAD, SketchUp, Revit, V-Ray, 3ds Max, Photoshop, Space Planning, Interior Styling, Material Selection, Vendor Coordination, Site Supervision, Lighting Design', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Architectural Designer focused on modern sustainable residential interiors.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, '2 Years', '30 Days', NULL, NULL, NULL, NULL),
(138, 'Abhishek Rawat', 'abhishek.r@email.com', '9811122210', '1992-05-18', 'Male', 'Jaipur', 'B.Tech', 'Civil', 'MNIT', '2014', 'linkedin.com/in/abhishekr', 'pass123', 'Project Planning, Site Execution, Quantity Surveying, Billing, AutoCAD, MS Project, Primavera P6, Estimation, RCC Design, Structural Analysis, Safety Management, Quality Control', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Civil Engineer with 9 years of experience in high-rise building construction.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, '9 Years', '60 Days', NULL, NULL, NULL, NULL),
(139, 'Sonia Gandhi', 'sonia.g@email.com', '9811122211', '1996-07-14', 'Female', 'Chandigarh', 'B.E.', 'Electrical', 'PEC', '2018', 'linkedin.com/in/soniag', 'pass123', 'Circuit Design, MATLAB, PLC, SCADA, Power Systems, Electrical Simulation, Arduino, PCB Design, Control Systems, AutoCAD Electrical, Troubleshooting', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Electrical Engineer with expertise in automation and power distribution systems.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, '5 Years', '30 Days', NULL, NULL, NULL, NULL),
(140, 'Manish Pandey', 'manish.p@email.com', '9811122212', '1994-09-20', 'Male', 'Lucknow', 'M.Com', 'Accounting', 'LU', '2016', 'linkedin.com/in/manishp', 'pass123', 'Financial Analysis, Tally ERP 9, GST, Income Tax, Auditing, Balance Sheet, P&L, Banking, Excel Macro, Reconciliation, Costing, Statutory Compliance', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Accounts Manager with 7 years of experience in manufacturing sector finance.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, '7 Years', 'Immediate', NULL, NULL, NULL, NULL),
(141, 'Pooja Bhatia', 'pooja.b@email.com', '9811122213', '1997-11-02', 'Female', 'Indore', 'B.Sc', 'Statistics', 'DAVV', '2019', 'linkedin.com/in/poojab', 'pass123', 'Data Analysis, SQL, Tableau, Power BI, Python, Excel Solver, Data Cleaning, Statistical Modeling, A/B Testing, Reporting, Dashboarding, Google Analytics', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Business Analyst translating complex data into actionable business insights.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, '4 Years', '15 Days', NULL, NULL, NULL, NULL),
(142, 'Ishaan Sharma', 'ishaan.s@email.com', '9811122214', '1998-02-14', 'Male', 'Bhopal', 'B.A.', 'English', 'BU', '2020', 'linkedin.com/in/ishaans', 'pass123', 'Content Writing, Copywriting, SEO Writing, Ghostwriting, Blogging, Editing, Proofreading, Keyword Research, WordPress, Social Media Copy, Creative Writing, AP Style', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Content Strategist with 3 years of experience in the lifestyle and tech niche.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, '3 Years', 'Immediate', NULL, NULL, NULL, NULL),
(143, 'Tanvi Jain', 'tanvi.j@email.com', '9811122215', '1995-10-10', 'Female', 'Bangalore', 'B.Tech', 'CS', 'PESIT', '2017', 'linkedin.com/in/tanvij', 'pass123', 'Manual Testing, Selenium Webdriver, Java, TestNG, Cucumber, API Testing, Postman, JIRA, SQL, Regression Testing, LoadRunner, JMeter, Bug Tracking, Agile', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Quality Assurance Engineer with 6 years of experience in automated and manual testing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, '6 Years', '30 Days', NULL, NULL, NULL, NULL),
(144, 'Rajesh Kumar', 'rajesh.k@email.com', '9811122216', '1990-04-04', 'Male', 'Patna', 'BCA', 'CS', 'IGNOU', '2012', 'linkedin.com/in/rajeshk', 'pass123', 'Technical Support, IT Infrastructure, Troubleshooting, Windows Server, Networking, Active Directory, Hardware Maintenance, Linux, Cloud Computing, Office 365, VPN', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'IT Support Specialist with 11 years of experience managing enterprise IT systems.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, '11 Years', 'Immediate', NULL, NULL, NULL, NULL),
(145, 'Shruti Iyer', 'shruti.i@email.com', '9811122217', '2002-05-20', 'Female', 'Coimbatore', 'B.E.', 'Computer Science', 'PSG Tech', '2024', 'linkedin.com/in/shrutii', 'pass123', 'Java, Python, HTML, CSS, JavaScript, SQL, C++, DSA, Git, React Basics, Bootstrap, Communication Skills, Problem Solving, Fast Learner', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Eager Computer Science fresher with a strong foundation in DSA and web technologies.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, 'Fresher', 'Immediate', NULL, NULL, NULL, NULL),
(146, 'Gaurav Singh', 'gaurav.s@email.com', '9811122218', '2001-08-15', 'Male', 'Varanasi', 'B.Tech', 'Mechanical', 'BHU', '2023', 'linkedin.com/in/gauravs', 'pass123', 'AutoCAD, SolidWorks, Thermodynamics, Manufacturing, MS Office, Python, Leadership, Teamwork, Machine Design, English Proficiency', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Mechanical Engineer fresher looking for opportunities in the automotive or production sector.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, 'Fresher', 'Immediate', NULL, NULL, NULL, NULL),
(147, 'Madhav Nair', 'madhav.n@email.com', '9811122219', '1993-12-05', 'Male', 'Kochi', 'MBA', 'Operations', 'CUSAT', '2015', 'linkedin.com/in/madhavn', 'pass123', 'Operations Management, Supply Chain, Logistics, Inventory Control, Vendor Management, Lean Six Sigma, ERP, Procurement, Strategic Planning, Cost Optimization', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Operations Professional with 8 years of experience optimizing supply chain processes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, '8 Years', '45 Days', NULL, NULL, NULL, NULL),
(148, 'Kriti Sanon', 'kriti.s@email.com', '9811122220', '1997-03-30', 'Female', 'Noida', 'B.Tech', 'ECE', 'JIIT', '2019', 'linkedin.com/in/kritis', 'pass123', 'Embedded Systems, C, C++, RTOS, Microcontrollers, IoT, I2C, SPI, UART, Firmware Development, Debugging, Linux, Python', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Embedded Software Engineer with 4 years of experience in IoT device development.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, '4 Years', '30 Days', NULL, NULL, NULL, NULL),
(149, 'Arpit Agrawal', 'arpit.a@email.com', '9811122221', '1996-11-18', 'Male', 'Nagpur', 'B.Tech', 'CS', 'VNIT', '2018', 'linkedin.com/in/arpita', 'pass123', 'Data Engineering, Apache Spark, Hadoop, ETL, SQL, Python, Airflow, AWS S3, Redshift, Snowflake, Kafka, Data Modeling, Big Data Analytics', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Data Engineer with 5 years of experience in building robust data pipelines.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, '5 Years', '30 Days', NULL, NULL, NULL, NULL),
(150, 'Meera Shah', 'meera.s@email.com', '9811122222', '1998-06-15', 'Female', 'Ahmedabad', 'MBA', 'Digital Marketing', 'MICA', '2020', 'linkedin.com/in/meeras', 'pass123', 'Social Media Marketing, Content Strategy, Influencer Marketing, Copywriting, Google Ads, Analytics, Community Management, Canva, Meta Suite, Brand Strategy', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Digital Marketing Specialist focused on organic brand growth and social engagement.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, '3 Years', 'Immediate', NULL, NULL, NULL, NULL),
(151, 'Vivek Oberoi', 'vivek.o@email.com', '9811122223', '1991-09-09', 'Male', 'Mumbai', 'MCA', 'Software', 'VJTI', '2014', 'linkedin.com/in/viveko', 'pass123', 'PHP, Laravel, MySQL, JavaScript, jQuery, Vue.js, REST API, Redis, ElasticSearch, Nginx, Docker, Git, Payment Integration', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Backend Developer with 9 years of experience in scaling high-traffic web platforms.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, '9 Years', 'Immediate', NULL, NULL, NULL, NULL),
(152, 'Rishi Kapoor', 'rishi.k@email.com', '9811122224', '1994-01-01', 'Male', 'Delhi', 'B.Tech', 'IT', 'NSUT', '2016', 'linkedin.com/in/rishik', 'pass123', 'Cyber Security, Ethical Hacking, Network Security, SIEM, Firewalls, Penetration Testing, Wireshark, Metasploit, Python, Linux, OWASP Top 10', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Security Analyst with 7 years of experience in vulnerability assessment and network hardening.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, '7 Years', '30 Days', NULL, NULL, NULL, NULL),
(153, 'Tina Dabi', 'tina.d@email.com', '9811122225', '1999-07-21', 'Female', 'Jaipur', 'M.A.', 'Public Admin', 'Rajasthan Univ', '2021', 'linkedin.com/in/tinad', 'pass123', 'Public Relations, Event Management, Communication, Policy Analysis, MS Office, Research, Social Work, Leadership, Public Speaking', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Public Administration graduate with strong interpersonal and policy research skills.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, '2 Years', 'Immediate', NULL, NULL, NULL, NULL),
(154, 'Aditya Roy', 'aditya.r@email.com', '9811122226', '1995-10-02', 'Male', 'Kolkata', 'B.Sc', 'Hotel Mgmt', 'IHM', '2017', 'linkedin.com/in/adityar', 'pass123', 'Customer Service, Front Office, Hospitality Management, CRM, Conflict Resolution, Team Coordination, Opera PMS, Event Planning, Revenue Management', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Hospitality Professional with 6 years of experience in luxury hotel management.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, '6 Years', '15 Days', NULL, NULL, NULL, NULL),
(155, 'Sana Khan', 'sana.k@email.com', '9811122227', '1997-04-12', 'Female', 'Surat', 'B.Com', 'Finance', 'VNSGU', '2019', 'linkedin.com/in/sanak', 'pass123', 'Financial Accounting, Tally, GST, Banking Operations, Auditing, Taxation, MS Excel, Financial Modeling, Payroll, SAP FICO', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Finance Associate specialized in tax compliance and corporate accounting.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, '4 Years', 'Immediate', NULL, NULL, NULL, NULL),
(156, 'Rahul Dravid', 'rahul.d@email.com', '9811122228', '1992-01-11', 'Male', 'Bangalore', 'B.E.', 'CS', 'RVCE', '2014', 'linkedin.com/in/rahuld', 'pass123', 'Machine Learning, Deep Learning, NLP, Python, SQL, TensorFlow, Keras, Scikit-Learn, MLOps, Data Visualization, Hadoop, Spark', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Machine Learning Engineer with 9 years of experience in predictive analytics.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, '9 Years', 'Immediate', NULL, NULL, NULL, NULL),
(157, 'Simran Kaur', 'simran.k@email.com', '9811122229', '2000-09-09', 'Female', 'Amritsar', 'BCA', 'CS', 'GNDU', '2022', 'linkedin.com/in/simrank', 'pass123', 'Manual Testing, Java, SQL, Jira, Selenium, Test Planning, Bug Reporting, Communication, Teamwork, MS Office', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'QA Intern with experience in manual testing and basic automation tools.', 'Bengali', NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, '1 Year', 'Immediate', NULL, NULL, NULL, NULL),
(158, 'Vijay Mallya', 'vijay.m@email.com', '9811122230', '1990-12-18', 'Male', 'London', 'MBA', 'Finance', 'Foreign Univ', '2012', 'linkedin.com/in/vijaym', 'pass123', 'Business Strategy, Luxury Brands, Corporate Finance, Leadership, Networking, International Trade, Risk Management, Aviation Management', 'ravi_resume.pdf', NULL, '2026-03-05 13:01:40', 'Senior Business Consultant with a focus on global trade and luxury market entry.', '', NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, '11 Years', '90 Days', 'Java Developer', 'PCS Global', NULL, '2026-03-13 14:59:48'),
(159, 'Vijay M', 'vijay.m@email.com', '9988776655', '1999-05-14', 'Male', 'Bangalore', 'B.Tech', 'Computer Science', 'VTU', '2021', 'https://linkedin.com/in/vijaym', 'vijay123', 'Java, Spring Boot, MySQL, HTML, CSS, JavaScript', 'vijay_resume.pdf', 'vijay_photo.jpg', '2026-03-16 12:14:48', 'Passionate Java developer with experience in building web applications using Spring Boot and MySQL.', 'English, Kannada, Hindi', 'Karnataka State Board', '2015', '89', 'Karnataka PU Board', '2017', '91', 85, 'https://github.com/vijaym', '2', '30 Days', 'Software Developer', 'Infosys', '5 LPA', '2026-03-16 17:44:48'),
(160, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', '2000-05-15', 'Male', 'Bangalore', 'B.Tech', 'Computer Science', 'VTU', '2022', 'linkedin.com/rahul', 'pass123', 'Java, Spring Boot, MySQL', 'rahul_resume.pdf', 'rahul.jpg', '2026-03-23 06:25:10', 'Fresher software developer', 'English, Hindi', 'CBSE', '2016', '85%', 'PUC', '2018', '88%', 80, 'rahulportfolio.com', '0', 'Immediate', 'Fresher', 'NA', '0', '2026-03-23 11:55:10'),
(161, 'Anita Verma', 'anita@gmail.com', '9123456780', '1999-08-10', 'Female', 'Hyderabad', 'MCA', 'IT', 'Osmania University', '2021', 'linkedin.com/anita', 'pass123', 'Python, Django, SQL', 'anita_resume.pdf', 'anita.jpg', '2026-03-23 06:25:10', 'Backend developer with internship experience', 'English, Telugu', 'State Board', '2015', '90%', 'Intermediate', '2017', '92%', 90, 'anitaportfolio.com', '1', '30 days', 'Software Developer', 'XYZ Tech', '4 LPA', '2026-03-23 11:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `jobseeker_experience`
--

CREATE TABLE `jobseeker_experience` (
  `id` int(11) NOT NULL,
  `jobseeker_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `from_date` varchar(20) DEFAULT NULL,
  `to_date` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `employment_type` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `current_company` tinyint(1) DEFAULT 0,
  `salary` varchar(50) DEFAULT NULL,
  `skills_used` text DEFAULT NULL,
  `achievements` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobseeker_experience`
--

INSERT INTO `jobseeker_experience` (`id`, `jobseeker_id`, `company_name`, `designation`, `from_date`, `to_date`, `description`, `employment_type`, `location`, `industry`, `department`, `current_company`, `salary`, `skills_used`, `achievements`, `created_at`) VALUES
(14, 117, 'Tech Mahindra', 'Junior Developer', '2021-07', '2023-08', 'Worked on Spring Boot microservices for retail clients.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(15, 1, 'Infosys', 'Systems Engineer', '2023-09', 'Present', 'Developing REST APIs and managing MySQL databases.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(16, 118, 'Wipro', 'Project Trainee', '2022-06', '2023-12', 'Full stack development using Java, JSP, and Servlets.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(17, 119, 'Morgan Stanley', 'Associate Engineer', '2017-06', '2020-05', 'Built high-frequency trading backend components.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(18, 119, 'Zomato', 'Senior Backend Engineer', '2020-06', 'Present', 'Scaling microservices to handle 1M+ concurrent requests.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(19, 120, 'Microsoft Research', 'Data Scientist', '2021-08', 'Present', 'Researching predictive models for cloud resource allocation.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(20, 121, 'Nykaa', 'Marketing Lead', '2016-05', 'Present', 'Driving digital growth and brand positioning strategies.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(21, 123, 'Paytm', 'Senior Developer', '2012-07', '2018-01', 'Developed core payment gateway modules using PHP.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(22, 123, 'Razorpay', 'Lead Engineer', '2018-02', 'Present', 'Leading the FinTech engineering team for merchant dashboard.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(23, 129, 'Zomato', 'iOS Developer', '2018-01', '2021-05', 'Developed core food delivery features in Swift.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(24, 129, 'Swiggy', 'Senior iOS Developer', '2021-06', 'Present', 'Leading iOS architecture migration to SwiftUI and Combine.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(25, 131, 'TCS Research', 'Research Analyst', '2016-07', '2020-01', 'Worked on automated number plate recognition systems.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(26, 131, 'Nvidia', 'AI Engineer', '2020-02', 'Present', 'Optimizing computer vision models for CUDA kernels.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(27, 143, 'Cognizant', 'QA Analyst', '2017-08', '2020-12', 'Manual and automated testing of healthcare applications.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(28, 143, 'Accenture', 'Senior QA Engineer', '2021-01', 'Present', 'Building automation frameworks using Selenium and TestNG.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(29, 149, 'Walmart Global Tech', 'Data Engineer', '2018-07', '2021-12', 'Managed ETL pipelines using Hadoop and Hive.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(30, 149, 'Uber', 'Senior Data Engineer', '2022-01', 'Present', 'Optimizing real-time data streaming using Kafka and Spark.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(31, 150, 'Social Beat', 'Content Specialist', '2020-07', '2022-05', 'Managed social media calendars and influencer outreach for lifestyle brands.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(32, 150, 'MICA Labs', 'Digital Strategist', '2022-06', 'Present', 'Leading organic growth strategies and Meta ad campaigns.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(33, 151, 'BookMyShow', 'Backend Developer', '2014-06', '2019-03', 'Optimized PHP/Laravel APIs for high-traffic ticket booking systems.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(34, 151, 'Dream11', 'Senior Backend Engineer', '2019-04', 'Present', 'Scaling microservices using Redis and ElasticSearch for millions of users.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(35, 152, 'Quick Heal', 'Security Analyst', '2016-08', '2021-12', 'Conducted vulnerability assessments and penetration testing on desktop products.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(36, 152, 'CrowdStrike', 'Senior Security Engineer', '2022-01', 'Present', 'Managing SIEM tools and network hardening for enterprise clients.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(37, 154, 'Taj Hotels', 'Front Office Executive', '2017-06', '2020-08', 'Handled guest relations and Opera PMS management.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(38, 154, 'Marriott International', 'Assistant Manager', '2020-09', 'Present', 'Overseeing luxury hotel operations and revenue management.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(39, 155, 'Deloitte India', 'Tax Associate', '2019-06', '2022-12', 'Managed corporate tax filings and GST reconciliations.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(40, 155, 'EY', 'Finance Consultant', '2023-01', 'Present', 'Specializing in financial modeling and SAP FICO implementations.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(41, 156, 'Fractal Analytics', 'Machine Learning Engineer', '2014-07', '2018-12', 'Built predictive models for retail supply chain optimization.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(42, 156, 'Google AI', 'Senior ML Engineer', '2019-01', 'Present', 'Implementing deep learning and NLP models for search ranking.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(43, 157, 'TestVagrant', 'QA Intern', '2022-08', 'Present', 'Executing manual test cases and assisting in Selenium automation scripts.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(44, 158, 'United Breweries', 'Director of Strategy', '2012-05', '2017-10', 'Led international market entry and brand positioning.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48'),
(45, 158, 'Force India Consulting', 'Managing Partner', '2017-11', 'Present', 'Consulting on global trade, aviation management, and risk.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-13 09:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `jobseeker_projects`
--

CREATE TABLE `jobseeker_projects` (
  `id` int(11) NOT NULL,
  `jobseeker_id` int(11) DEFAULT NULL,
  `project_title` varchar(100) DEFAULT NULL,
  `tech_stack` varchar(255) DEFAULT NULL,
  `project_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobseeker_projects`
--

INSERT INTO `jobseeker_projects` (`id`, `jobseeker_id`, `project_title`, `tech_stack`, `project_desc`) VALUES
(1, 7, 'PCS Employee Management Software', 'vhnkjgyt,ngj,mjbh', 'sdfghjhgfxcvbnm'),
(2, 1, 'Server creation', 'Node.js', 'Create server by https 3000'),
(5, 2, 'E-Commerce Backend', 'Spring Boot, MySQL, JWT', 'Built a secure RESTful API for a shopping cart system.'),
(6, 118, 'Student Portal', 'Java, JSP, MySQL', 'Developed a web-based portal for student marks and attendance.'),
(7, 119, 'Real-time Analytics Engine', 'Java, Kafka, AWS', 'Built a pipeline to process 10k events per second for log analysis.'),
(8, 120, 'Customer Churn Predictor', 'Python, Scikit-Learn, TensorFlow', 'Developed a model with 92% accuracy to predict subscriber churn.'),
(9, 124, 'Fintech Mobile App UI', 'Figma, Adobe XD', 'Designed a 50+ screen interface for a modern digital banking app.'),
(10, 129, 'HealthTrack Pro', 'SwiftUI, CoreData, HealthKit', 'Created a fitness app that syncs real-time heart rate data from Apple Watch.'),
(11, 130, 'Eco-Friendly Maps', 'Kotlin, Google Maps API, Jetpack Compose', 'An Android app calculating the lowest carbon footprint routes.'),
(12, 131, 'Traffic Monitor AI', 'Python, YOLOv8, OpenCV', 'Real-time vehicle detection and counting system for smart cities.'),
(13, 136, 'Portfolio Website', 'Figma, HTML/CSS, JavaScript', 'Interactive design portfolio focused on accessibility and UX.'),
(14, 141, 'Retail Sales Dashboard', 'Tableau, SQL, Python', 'Visualized 5 years of sales data to identify seasonal trends.'),
(15, 143, 'Banking Automation Suite', 'Selenium, Java, Jenkins', 'End-to-end automation of core banking transaction flows.'),
(16, 145, 'Campus Library System', 'Java, Swing, SQL', 'Final year project to manage book issuance and returns.'),
(17, 146, 'Automotive Engine Simulation', 'AutoCAD, SolidWorks, Python', 'Structural analysis of a 4-stroke IC engine piston.'),
(18, 148, 'Smart Home Hub', 'C++, RTOS, ESP32', 'Firmware development for a centralized IoT home automation controller.'),
(19, 149, 'Big Data Warehouse', 'Snowflake, Airflow, Spark', 'Architected a data lake for processing 100TB of log data annually.'),
(20, 151, 'Scalable Chat Server', 'PHP, Laravel, Redis', 'Backend for a real-time messaging app supporting 50k active users.'),
(21, 156, 'Sentiment Analysis Bot', 'Python, NLP, TensorFlow', 'Analyzes social media trends to predict market sentiment.'),
(22, 150, 'Brand Identity Launch', 'Canva, Meta Suite', 'Developed a full brand strategy for a D2C startup, increasing engagement by 40%.'),
(23, 151, 'Real-time Analytics Dashboard', 'Laravel, Redis, Vue.js', 'Built a dashboard to monitor 100k+ concurrent web socket connections.'),
(24, 152, 'Vulnerability Scanner', 'Python, Metasploit, Linux', 'Developed a custom script to automate OWASP Top 10 vulnerability checks.'),
(25, 153, 'Public Policy Analysis', 'MS Office, Research Tools', 'Conducted an in-depth study on rural education accessibility for state policy.'),
(26, 154, 'Guest Experience Automation', 'CRM, Opera PMS', 'Implemented an automated check-in system that reduced wait times by 15%.'),
(27, 155, 'Automated Payroll System', 'SAP FICO, Excel Macro', 'Created a macro-based tool to automate GST calculations for 500+ employees.'),
(28, 156, 'Smart Sentiment Bot', 'Python, TensorFlow, NLP', 'Developed a system to categorize customer reviews into 5 emotional levels.'),
(29, 157, 'Library Management QA', 'Jira, SQL', 'Documented 50+ bugs and test cases for a campus library management module.'),
(30, 158, 'Global Trade Portal', 'Business Strategy', 'Developed a framework for luxury brand entry into emerging Asian markets.');

-- --------------------------------------------------------

--
-- Table structure for table `jobs_connections`
--

CREATE TABLE `jobs_connections` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `status` enum('PENDING','ACCEPTED','REJECTED') DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobs_connections`
--

INSERT INTO `jobs_connections` (`id`, `employee_id`, `jobseeker_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 159, 'PENDING', '2026-03-18 18:19:01', '2026-03-18 18:19:01'),
(2, 4, 157, 'PENDING', '2026-03-19 12:01:12', '2026-03-19 12:01:12'),
(3, 4, 158, 'PENDING', '2026-03-20 05:33:26', '2026-03-20 05:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `jobseeker_id`, `applied_at`) VALUES
(2, 22, 118, '2026-02-16 08:53:48'),
(3, 24, 118, '2026-02-16 11:45:05'),
(4, 21, 118, '2026-02-16 11:59:51'),
(5, 20, 118, '2026-02-16 14:27:18'),
(6, 18, 118, '2026-02-16 14:30:43'),
(7, 14, 118, '2026-02-19 05:13:26'),
(8, 19, 118, '2026-02-19 09:51:50'),
(9, 17, 118, '2026-02-20 05:18:55'),
(10, 26, 118, '2026-02-25 12:29:26'),
(11, 30, 118, '2026-03-17 08:14:00'),
(12, 28, 118, '2026-03-18 07:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `job_master`
--

CREATE TABLE `job_master` (
  `job_id` int(11) NOT NULL,
  `employer_email` varchar(45) DEFAULT NULL,
  `post_as` varchar(200) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `job_title` varchar(200) DEFAULT NULL,
  `job_location` varchar(200) DEFAULT NULL,
  `min_exp` int(11) DEFAULT NULL,
  `max_exp` int(11) DEFAULT NULL,
  `min_salary` int(11) DEFAULT NULL,
  `max_salary` int(11) DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `preferred_role` varchar(200) DEFAULT NULL,
  `current_salary` decimal(10,2) DEFAULT NULL,
  `expected_salary` varchar(50) DEFAULT NULL,
  `preferred_location` varchar(200) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `skills_required` text DEFAULT NULL,
  `qualifications` text DEFAULT NULL,
  `contact_email` varchar(200) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `prefer_call_times` varchar(200) DEFAULT NULL,
  `company_email` varchar(45) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `posted_date` timestamp NULL DEFAULT current_timestamp(),
  `work_mode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `job_master`
--

INSERT INTO `job_master` (`job_id`, `employer_email`, `post_as`, `company_name`, `job_title`, `job_location`, `min_exp`, `max_exp`, `min_salary`, `max_salary`, `benefits`, `preferred_role`, `current_salary`, `expected_salary`, `preferred_location`, `job_description`, `skills_required`, `qualifications`, `contact_email`, `contact_phone`, `prefer_call_times`, `company_email`, `status`, `posted_date`, `work_mode`) VALUES
(2, 'contact@j2c.in', 'Company/Business', 'PCS global pvt ltd', 'Multiple Vacancies : Human Resources,Operations and Placements', 'kolkata', 2, 5, 25000, 30000, 'Provident Fund', NULL, NULL, NULL, NULL, NULL, 'Communication skiils,ProvlemSolvingApproch', NULL, NULL, NULL, NULL, 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', NULL),
(3, 'contact@j2c.in', 'Company/Business', 'PCS global pvt ltd', 'Multiple Vacancies : Human Resources,Operations and Placements', 'kolkata', 2, 5, 25000, 30000, 'Provident Fund', 'Human Resources,Operations and Placements', 25000.00, '30000', 'kokata', 'You will gain hands-on experience across multiple departments including Human Resources, Operations, Marketing, Placements, and Design. This role provides a holistic understanding of business functions while developing leadership, communication, and project management skills essential for a managerial career path.', 'Excellent communication and interpersonal skills.\r\nStrong organizational and multitasking abilities.\r\nProficiency in Canva, MS Office, and basic digital marketing tools.\r\nCreative thinking and problem-solving approach.\r\nBasic understanding of HR and operations functions.', 'Any Graduate', 'hr@pcsglobal.in', '8697741611', '10am-6pm', 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', NULL),
(4, 'contact@j2c.in', 'Company/Business', 'PCS global pvt ltd', 'HR Executive', 'Bangalore', 0, 4, 10000, 25000, 'CAB', NULL, NULL, NULL, NULL, 'hgskjgkzsf', 'Coomunicatin skills,Accountability', 'M.Tech', NULL, NULL, NULL, 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', ''),
(5, 'contact@j2c.in', 'Company/Business', 'PCS global pvt ltd', 'Backend Developer', 'Bangalore', 2, 5, 1500, 30000, 'CAB', NULL, NULL, NULL, NULL, 'gsxgk', 'Pyton,React', 'B.Tech', NULL, NULL, NULL, 'contact@j2c.in', 'Active', '2026-03-04 18:30:00', NULL),
(6, NULL, 'Company/Business', 'PCS global pvt ltd', 'HR Executive', 'Bangalore', 1, 5, 10000, 20000, 'CAB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', NULL),
(7, NULL, 'Company/Business', 'PCS global pvt ltd', 'HR Executive', 'Bangalore', 1, 5, 10000, 20000, 'CAB', NULL, NULL, NULL, NULL, 'Proactively identify new business opportunities, conduct cold calls, and send emails to prospective clients.', NULL, NULL, 'anitaacharjya@gmail.com', '9876543210', '10:00 AM - 7:00 PM', 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', NULL),
(8, NULL, 'Company/Business', 'dfghjk', 'Backend Developer', 'Bangalore', 1, 4, 10000, 15000, 'CAB', NULL, NULL, NULL, NULL, 'dfghjkkjhgfdrtyujkmnbgv', NULL, NULL, 'anitaacharjya9539@gmail.com', '345678909', '9:00 AM - 6:00 PM', 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', NULL),
(9, NULL, 'Company/Business', 'zoozle', 'AI Engineer', 'Lucknow', 0, 1, 20000, 25000, 'Bonus', NULL, NULL, NULL, NULL, 'zoozle is top it company', NULL, NULL, 'zoozle@com.in', '123087346', 'Flexible', 'null', 'Active', '2026-02-24 11:34:17', NULL),
(10, NULL, 'Company/Business', 'Pcs global', 'Backend Developer', 'Kolkata', 1, 2, 30000, 15000, 'Food', NULL, NULL, NULL, NULL, 'kjcjkgkc', NULL, NULL, 'saibaljana76@gmail.com', '7899998999', '9:00 AM - 6:00 PM', 'null', 'Active', '2026-02-24 11:34:17', NULL),
(11, NULL, 'Company/Business', 'EY', 'Software Engineer', 'Bangalore', 0, 3, 20000, 25000, 'PF', NULL, NULL, NULL, NULL, 'Backend Developer', NULL, NULL, 'saibaljana76@gmail.com', '7899998999', '10:00 AM - 7:00 PM', 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', NULL),
(12, NULL, 'Company/Business', 'Pcs global', 'Accountant', 'Ahmedabad', 1, 3, 30000, 30000, 'PF', NULL, NULL, NULL, NULL, 'jh', NULL, NULL, 'saibaljana76@gmail.com', '7899998999', '9:00 AM - 6:00 PM', 'contact@j2c.in', 'Active', '2026-02-24 11:34:17', NULL),
(13, NULL, 'Company/Business', 'TechNova Pvt Ltd', 'Java Developer', 'Hyderabad', 1, 3, 300000, 500000, 'PF, Health Insurance', 'Backend Developer', 400000.00, '500000', 'Hyderabad', 'Develop and maintain enterprise Java applications.', 'Java, Spring Boot, MySQL, REST API', 'B.Tech / MCA', 'hr@technova.in', '9876543211', '9:00 AM - 6:00 PM', 'contact@technova.in', 'Active', '2026-02-24 11:34:17', NULL),
(14, NULL, 'Company/Business', 'CodeCraft Solutions', 'Frontend Developer', 'Bangalore', 0, 2, 250000, 400000, 'Bonus, Flexible Hours', 'UI Developer', 300000.00, '400000', 'Bangalore', 'Work on responsive web applications and UI components.', 'HTML, CSS, JavaScript, React', 'Any Graduate', 'careers@codecraft.in', '9876543212', '10:00 AM - 7:00 PM', 'info@codecraft.in', 'Active', '2026-02-24 11:34:17', NULL),
(15, NULL, 'Company/Business', 'InnoSoft Technologies', 'Python Developer', 'Pune', 2, 4, 400000, 700000, 'PF, Medical Insurance', 'Software Developer', 500000.00, '650000', 'Pune', 'Build scalable backend services using Python.', 'Python, Django, REST API, PostgreSQL', 'B.Tech / BCA', 'jobs@innosoft.in', '9876543213', '9:30 AM - 6:30 PM', 'contact@innosoft.in', 'Active', '2026-02-24 11:34:17', NULL),
(16, NULL, 'Company/Business', 'NextGen AI', 'AI Engineer', 'Mumbai', 0, 2, 500000, 900000, 'Performance Bonus', 'ML Engineer', 600000.00, '800000', 'Mumbai', 'Develop AI/ML models and deploy them in production.', 'Python, TensorFlow, Machine Learning', 'B.Tech / M.Tech', 'hr@nextgenai.in', '9876543214', 'Flexible', 'info@nextgenai.in', 'Active', '2026-02-24 11:34:17', NULL),
(17, NULL, 'Company/Business', 'CloudNet Systems', 'DevOps Engineer', 'Chennai', 3, 6, 600000, 1000000, 'PF, Insurance, Bonus', 'Cloud Engineer', 750000.00, '900000', 'Chennai', 'Manage CI/CD pipelines and cloud infrastructure.', 'AWS, Docker, Kubernetes, Jenkins', 'B.Tech', 'careers@cloudnet.in', '9876543215', '10:00 AM - 6:00 PM', 'contact@cloudnet.in', 'Active', '2026-02-24 11:34:17', NULL),
(18, NULL, 'Company/Business', 'FinEdge Solutions', 'Accountant', 'Delhi', 1, 3, 250000, 350000, 'PF', 'Accounts Executive', 300000.00, '350000', 'Delhi', 'Handle financial records and tax filings.', 'Tally, GST, MS Excel', 'B.Com', 'hr@finedge.in', '9876543216', '9:00 AM - 5:00 PM', 'info@finedge.in', 'Active', '2026-02-24 11:34:17', NULL),
(19, NULL, 'Company/Business', 'MarketPro Pvt Ltd', 'Digital Marketing Executive', 'Kolkata', 0, 2, 200000, 350000, 'Incentives', 'Marketing Executive', 250000.00, '300000', 'Kolkata', 'Manage SEO, SEM and social media campaigns.', 'SEO, Google Ads, Social Media Marketing', 'Any Graduate', 'jobs@marketpro.in', '9876543217', '10:00 AM - 6:00 PM', 'contact@marketpro.in', 'Active', '2026-02-24 11:34:17', NULL),
(20, NULL, 'Company/Business', 'DataCore Analytics', 'Data Analyst', 'Noida', 1, 4, 400000, 800000, 'Bonus, Insurance', 'Data Analyst', 500000.00, '700000', 'Noida', 'Analyze data and create dashboards for business insights.', 'SQL, Power BI, Excel, Python', 'B.Tech / B.Sc', 'hr@datacore.in', '9876543218', '9:00 AM - 6:00 PM', 'info@datacore.in', 'Active', '2026-02-24 11:34:17', NULL),
(21, NULL, 'Company/Business', 'SecureIT Pvt Ltd', 'Cyber Security Analyst', 'Gurgaon', 2, 5, 500000, 900000, 'PF, Insurance', 'Security Analyst', 600000.00, '850000', 'Gurgaon', 'Monitor security threats and vulnerabilities.', 'Cyber Security, SIEM, Networking', 'B.Tech', 'careers@secureit.in', '9876543219', '10:00 AM - 7:00 PM', 'contact@secureit.in', 'Active', '2026-02-24 11:34:17', NULL),
(22, NULL, 'Company/Business', 'AppWorks Studio', 'Mobile App Developer', 'Ahmedabad', 1, 3, 300000, 600000, 'Bonus', 'Android Developer', 400000.00, '550000', 'Ahmedabad', 'Develop Android applications and maintain APIs.', 'Java, Kotlin, Firebase', 'B.Tech / MCA', 'hr@appworks.in', '9876543220', '9:30 AM - 6:30 PM', 'info@appworks.in', 'Active', '2026-02-24 11:34:17', NULL),
(24, 'contact@j2c.in', 'Company/Business', 'Cognigents', 'Marketting', 'Kolkata', 1, 3, 12555, 41455, 'Accommodation', 'Software', 7122.00, '54987', 'Kolkata', 'gddakdbglkhk', 'CommunicationSkills', 'MBA', 'saibaljana76@gmail.com', '78655645', '10AM', 'con@gmail.com', 'Active', NULL, NULL),
(25, NULL, 'Company/Business', 'pcs global1234', 'Backend Developer', 'Ahmedabad', 0, 2, 10000, 20000, 'Gym Membership', NULL, NULL, NULL, NULL, 'jddfgjhkljhgxcvbnm,mnbv', NULL, NULL, 'pcd@gmail.com', '3698755421', '10:00 AM - 7:00 PM', 'null', 'Active', '2026-02-24 11:34:17', NULL),
(26, NULL, 'Company/Business', 'pcffd', 'HR Executive', 'Ahmednagar', 2, 4, 25000, 30000, 'CAB', NULL, NULL, NULL, NULL, 'iba jgahdjdjhadijldka;dkou good ', 'Big Data', 'B.E (CSE)', 'pcdvinayaka@gmail.com', '3698755421', '10:00 AM - 7:00 PM', 'vinayaka@gmail.com', 'Active', '2026-02-24 11:34:17', NULL),
(27, NULL, 'Company/Business', 'pcs global1578', 'Backend Developer', 'Agra', 2, 4, 10000, 15000, 'Food', NULL, NULL, NULL, NULL, 'sgdhfhn', 'Adaptability', 'B.Tech (Electrical)', 'pcdvinayaka@gmail.com', '3698755421', '11:00 AM - 8:00 PM', 'vinayaka@gmail.com', 'Active', '2026-02-24 11:34:17', NULL),
(28, NULL, 'Company/Business', 'pcs global5555', 'AI Engineer', 'Ahmedabad', 0, 3, 15000, 20000, 'Food', NULL, NULL, NULL, NULL, 'higufsajhasfhgfifgogu addd', 'Accountability, Adaptability', 'B.E (Electrical)', 'pcdvinayakaaaaaaaa@gmail.com', '3698755421', '9:00 AM - 6:00 PM', 'vinayaka@gmail.com', 'Active', '2026-02-24 11:34:17', NULL),
(29, NULL, 'Company/Business', 'PCS', 'AI Engineer', 'Ahmednagar', 2, 3, 20000, 25000, 'CAB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vinayaka@gmail.com', 'Active', '2026-02-26 05:42:15', 'Hybrid'),
(30, NULL, 'Company/Business', 'PCS', 'Accountant', 'Ahmedabad', 1, 2, 25000, 30000, 'Health Insurance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vinayaka@gmail.com', 'Active', '2026-02-26 05:49:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_titles`
--

CREATE TABLE `job_titles` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `job_titles`
--

INSERT INTO `job_titles` (`id`, `title`) VALUES
(1, 'Software Engineer'),
(2, 'Web Developer'),
(3, 'Full Stack Developer'),
(4, 'Frontend Developer'),
(5, 'Backend Developer'),
(6, 'Mobile App Developer'),
(7, 'Data Analyst'),
(8, 'Data Scientist'),
(9, 'Machine Learning Engineer'),
(10, 'AI Engineer'),
(11, 'DevOps Engineer'),
(12, 'System Administrator'),
(13, 'Database Administrator'),
(14, 'Network Engineer'),
(15, 'Cybersecurity Analyst'),
(16, 'UI/UX Designer'),
(17, 'QA Tester'),
(18, 'Technical Support Engineer'),
(19, 'Cloud Architect'),
(20, 'Project Manager'),
(21, 'Operations Manager'),
(22, 'Business Analyst'),
(23, 'Product Manager'),
(24, 'HR Executive'),
(25, 'HR Manager'),
(26, 'Recruitment Specialist'),
(27, 'Training & Development Manager'),
(28, 'Finance Manager'),
(29, 'Accountant'),
(30, 'Financial Analyst'),
(31, 'Marketing Manager'),
(32, 'Brand Manager'),
(33, 'Sales Executive'),
(34, 'Sales Manager'),
(35, 'Customer Service Executive'),
(36, 'Customer Relationship Manager'),
(37, 'Store Manager'),
(38, 'Retail Sales Associate'),
(39, 'Doctor'),
(40, 'Nurse'),
(41, 'Pharmacist'),
(42, 'Lab Technician'),
(43, 'Medical Representative'),
(44, 'Physiotherapist'),
(45, 'Dietician'),
(46, 'Teacher'),
(47, 'Professor'),
(48, 'Trainer'),
(49, 'Education Counselor'),
(50, 'Graphic Designer'),
(51, 'Content Writer'),
(52, 'Copywriter'),
(53, 'Social Media Manager'),
(54, 'Event Manager'),
(55, 'Logistics Executive'),
(56, 'Supply Chain Manager'),
(57, 'Legal Advisor'),
(58, 'Consultant'),
(59, 'java developer intern');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city`) VALUES
(1, 'Agra'),
(2, 'Ahmedabad'),
(3, 'Ahmednagar'),
(4, 'Ajmer'),
(5, 'Alappuzha'),
(6, 'Aligarh'),
(7, 'Allahabad (Prayagraj)'),
(8, 'Amravati'),
(9, 'Amritsar'),
(10, 'Anantapur'),
(11, 'Asansol'),
(12, 'Aurangabad'),
(13, 'Bangalore'),
(14, 'Baroda (Vadodara)'),
(15, 'Belgaum'),
(16, 'Bhubaneswar'),
(17, 'Bhopal'),
(18, 'Bikaner'),
(19, 'Bokaro Steel City'),
(20, 'Chandigarh'),
(21, 'Chennai'),
(22, 'Coimbatore'),
(23, 'Cuttack'),
(24, 'Dehradun'),
(25, 'Delhi'),
(26, 'Dhanbad'),
(27, 'Durgapur'),
(28, 'Faridabad'),
(29, 'Ghaziabad'),
(30, 'Gorakhpur'),
(31, 'Guwahati'),
(32, 'Gwalior'),
(33, 'Hubli-Dharwad'),
(34, 'Hyderabad'),
(35, 'Indore'),
(36, 'Jabalpur'),
(37, 'Jaipur'),
(38, 'Jalandhar'),
(39, 'Jammu'),
(40, 'Jamshedpur'),
(41, 'Jhansi'),
(42, 'Jodhpur'),
(43, 'Kannur'),
(44, 'Kanpur'),
(45, 'Kochi (Cochin)'),
(46, 'Kolhapur'),
(47, 'Kolkata'),
(48, 'Kurnool'),
(49, 'Ludhiana'),
(50, 'Lucknow'),
(51, 'Madurai'),
(52, 'Mangalore'),
(53, 'Meerut'),
(54, 'Mysore'),
(55, 'Nagpur'),
(56, 'Nashik'),
(57, 'Noida'),
(58, 'Patna'),
(59, 'Pune'),
(60, 'Raipur'),
(61, 'Rajkot'),
(62, 'Ranchi'),
(63, 'Salem'),
(64, 'Siliguri'),
(65, 'Surat'),
(66, 'Thiruvananthapuram'),
(67, 'Tiruchirappalli'),
(68, 'Tirupati'),
(69, 'Udaipur'),
(70, 'Ujjain'),
(71, 'Varanasi'),
(72, 'Vijayawada'),
(73, 'Visakhapatnam'),
(74, 'Warangal');

-- --------------------------------------------------------

--
-- Table structure for table `login_master`
--

CREATE TABLE `login_master` (
  `id` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_queue`
--

CREATE TABLE `mail_queue` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `attempt` int(11) DEFAULT 0,
  `max_attempts` int(11) DEFAULT 3,
  `status` enum('PENDING','SENT','FAILED') DEFAULT 'PENDING',
  `last_attempt` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent_at` timestamp NULL DEFAULT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization_details`
--

CREATE TABLE `organization_details` (
  `id` int(11) NOT NULL,
  `organizationName` varchar(255) NOT NULL,
  `isIndependent` varchar(5) DEFAULT 'no',
  `organizationDescription` text DEFAULT NULL,
  `organizationCity` varchar(100) NOT NULL,
  `industry` varchar(100) NOT NULL,
  `employees` varchar(50) NOT NULL,
  `organizationLogo` varchar(255) DEFAULT NULL,
  `panProof` varchar(255) DEFAULT NULL,
  `companyCertificate` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `organization_details`
--

INSERT INTO `organization_details` (`id`, `organizationName`, `isIndependent`, `organizationDescription`, `organizationCity`, `industry`, `employees`, `organizationLogo`, `panProof`, `companyCertificate`, `createdAt`, `email`) VALUES
(1, 'PCS Global Pvt Ltd', 'yes', 'wertyuiop[', 'kolkata', 'Information Technology', '200+', 'd41b9938-4032-4ef3-94f2-5e02514c2241_ibm.png', '2e2fef4b-4002-4173-9281-df7faae2f49a_amazon.png', '59bc03fc-3a28-4577-98ab-f930cbae3d76_cognizent.png', '2025-11-26 14:27:05', NULL),
(2, 'PCS Global Pvt Ltd', 'yes', 'sdfghjkl;\'bbn', 'kolkata', 'Information Technology', '200+', '2fe57920-4e8b-483d-b6ba-0d2d5d42fdca_ibm.png', 'f889924a-74c0-4356-9b3c-df2f419a70c2_amazon.png', '6709e554-5c92-4693-a85f-3d2d07dccaea_infosys.jpg', '2025-11-27 06:47:43', NULL),
(3, 'PCS Global Pvt Ltd', 'yes', 'cvbnnnn', 'kolkata', 'Information Technology', '200+', 'ibm.png', 'wipro.png', 'infosys.jpg', '2025-11-27 09:54:24', 'contact@j2c.in'),
(4, 'PCS Global Pvt Ltd', 'yes', 'IT services company focusing on enterprise software and cloud solutions.', 'Kolkata', 'Information Technology', '200+', 'pcs_logo.png', 'pcs_pan.png', 'pcs_certificate.png', '2026-02-09 17:40:36', 'contact@pcsglobal.com'),
(5, 'TechNova Solutions', 'no', 'Product-based startup working on AI-powered recruitment platforms.', 'Bangalore', 'Software Development', '50-100', 'technova_logo.png', 'technova_pan.png', 'technova_certificate.png', '2026-02-09 17:40:36', 'hr@technova.in'),
(6, 'InnoWave Systems', 'yes', 'Digital transformation and data analytics consulting firm.', 'Hyderabad', 'IT Consulting', '100-200', 'innowave_logo.png', 'innowave_pan.png', 'innowave_certificate.png', '2026-02-09 17:40:36', 'careers@innowave.com'),
(7, 'BlueSky Innovations', 'no', 'EdTech company providing learning platforms and internship programs.', 'Chennai', 'Education Technology', '25-50', 'bluesky_logo.png', 'bluesky_pan.png', 'bluesky_certificate.png', '2026-02-09 17:40:36', 'jobs@blueskyedu.in'),
(8, 'NextGen Softwares', 'yes', 'Full-stack development and mobile app solutions company.', 'Pune', 'Software Services', '150+', 'nextgen_logo.png', 'nextgen_pan.png', 'nextgen_certificate.png', '2026-02-09 17:40:36', 'recruitment@nextgensoft.com'),
(9, 'Pcs', 'no', ' Full-stack development and mobile app solutions company', 'Kolkata', 'Software Development', '51 – 200', NULL, NULL, NULL, '2026-02-10 05:45:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_ambassador_program`
--

CREATE TABLE `post_ambassador_program` (
  `id` int(11) NOT NULL,
  `org_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `mode` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `stipend` varchar(100) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `positions` int(11) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `responsibilities` text DEFAULT NULL,
  `eligibility` text DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(10) DEFAULT 'Active',
  `posted_on` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `post_ambassador_program`
--

INSERT INTO `post_ambassador_program` (`id`, `org_name`, `email`, `title`, `mode`, `duration`, `stipend`, `last_date`, `positions`, `file_path`, `responsibilities`, `eligibility`, `benefits`, `description`, `status`, `posted_on`) VALUES
(1, 'PCS', 'pcsglobal@gmail.com', 'Campus Ambassador Program', 'Remote', '2 Months', '4500', '2026-04-30', 60, 'uploads/', 'kkkkkkkkkkkkkkkkkkkkk', '', 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'lllllllllllllllllllllllllll', 'active', '2026-04-28 07:31:27'),
(2, 'pcsGlobal', 'pcsglobal@gmail.com', 'pcsprogram', 'Hybrid', '3 Months', '4500', '2026-04-30', 78, 'uploads/', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', 'B.Tech, BCA, MCA, Any Graduate', 'good', 'good', 'Active', '2026-04-29 06:12:32'),
(3, 'pcsGlobal', 'pcsglobal@gmail.com', 'goood', 'Hybrid', '6 Months', '4500', '2026-04-30', 78, 'uploads/', 'ffffffffffffffffffffffffasassaxaaxdas', 'Social Media Active, Laptop Required, Internet Required', 'eeeeeeeeeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaaaaa', 'qqqqqqqqqqqqqqqqqqqqqqqq', 'inactive', '2026-04-29 06:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `post_internship_drive`
--

CREATE TABLE `post_internship_drive` (
  `id` int(11) NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `company_email` varchar(150) NOT NULL,
  `internship_title` varchar(150) NOT NULL,
  `internship_type` varchar(100) NOT NULL,
  `location` varchar(150) NOT NULL,
  `openings` int(11) NOT NULL,
  `stipend_type` enum('Paid','Unpaid','Selfpaid') NOT NULL,
  `stipend_amount` varchar(100) DEFAULT NULL,
  `duration` varchar(50) NOT NULL,
  `last_date` date NOT NULL,
  `required_skill` text NOT NULL,
  `description` text NOT NULL,
  `eligibility` text DEFAULT NULL,
  `posted_on` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'Active',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `post_internship_drive`
--

INSERT INTO `post_internship_drive` (`id`, `company_name`, `company_email`, `internship_title`, `internship_type`, `location`, `openings`, `stipend_type`, `stipend_amount`, `duration`, `last_date`, `required_skill`, `description`, `eligibility`, `posted_on`, `status`, `updated_at`) VALUES
(1, 'PCS', 'contact@gmail.com', 'Accountant', 'Work From Home', 'Kolkata', 9, 'Paid', '5000', '6 Months', '2026-04-30', 'Administrative Support,Agile Methodology', 'Hhhhhhhhhhhhhh', 'ooooooooooooo', '2026-04-29 08:21:39', 'Active', '2026-04-29 08:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `saved_internships`
--

CREATE TABLE `saved_internships` (
  `id` int(11) NOT NULL,
  `internship_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `saved_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `saved_internships`
--

INSERT INTO `saved_internships` (`id`, `internship_id`, `jobseeker_id`, `saved_date`) VALUES
(3, 4, 1, '2026-03-30 08:00:26'),
(4, 31, 1, '2026-03-30 09:11:54'),
(5, 38, 1, '2026-03-31 06:14:01'),
(6, 36, 1, '2026-03-31 06:39:46'),
(7, 40, 1, '2026-03-31 06:44:52'),
(8, 41, 1, '2026-03-31 07:49:15'),
(9, 35, 1, '2026-03-31 07:50:53'),
(10, 42, 1, '2026-04-08 12:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `saved_jobs`
--

CREATE TABLE `saved_jobs` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `saved_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `saved_jobs`
--

INSERT INTO `saved_jobs` (`id`, `job_id`, `jobseeker_id`, `saved_date`) VALUES
(10, 29, 118, '2026-03-18 05:22:05'),
(11, 30, 2, '2026-03-18 08:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `skills` varchar(500) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `skills`) VALUES
(1, 'Java'),
(2, 'Python'),
(3, 'C'),
(4, 'C++'),
(5, 'C#'),
(6, 'JavaScript'),
(7, 'TypeScript'),
(8, 'HTML'),
(9, 'CSS'),
(10, 'React'),
(11, 'Angular'),
(12, 'Vue.js'),
(13, 'Node.js'),
(14, 'Express.js'),
(15, 'Spring Boot'),
(16, 'Django'),
(17, 'Flask'),
(18, 'PHP'),
(19, 'Laravel'),
(20, 'Ruby on Rails'),
(21, 'Go'),
(22, 'Rust'),
(23, 'Kotlin'),
(24, 'Swift'),
(25, 'Objective-C'),
(26, 'SQL'),
(27, 'NoSQL'),
(28, 'MySQL'),
(29, 'PostgreSQL'),
(30, 'MongoDB'),
(31, 'Oracle DB'),
(32, 'SQLite'),
(33, 'Firebase'),
(34, 'Redis'),
(35, 'GraphQL'),
(36, 'REST API'),
(37, 'SOAP API'),
(38, 'Docker'),
(39, 'Kubernetes'),
(40, 'AWS'),
(41, 'Azure'),
(42, 'Google Cloud Platform'),
(43, 'Cloud Computing'),
(44, 'DevOps'),
(45, 'CI/CD'),
(46, 'Jenkins'),
(47, 'Travis CI'),
(48, 'Git'),
(49, 'GitHub'),
(50, 'GitLab'),
(51, 'Bitbucket'),
(52, 'Linux'),
(53, 'Unix'),
(54, 'Shell Scripting'),
(55, 'Bash'),
(56, 'PowerShell'),
(57, 'Networking'),
(58, 'Cybersecurity'),
(59, 'Ethical Hacking'),
(60, 'Penetration Testing'),
(61, 'Information Security'),
(62, 'Data Structures'),
(63, 'Algorithms'),
(64, 'Machine Learning'),
(65, 'Deep Learning'),
(66, 'Artificial Intelligence'),
(67, 'Data Science'),
(68, 'Big Data'),
(69, 'Hadoop'),
(70, 'Spark'),
(71, 'TensorFlow'),
(72, 'PyTorch'),
(73, 'Computer Vision'),
(74, 'Natural Language Processing'),
(75, 'Blockchain'),
(76, 'Internet of Things (IoT)'),
(77, 'Edge Computing'),
(78, 'Virtual Reality (VR)'),
(79, 'Augmented Reality (AR)'),
(80, 'Game Development'),
(81, 'Unity'),
(82, 'Unreal Engine'),
(83, 'Mobile App Development'),
(84, 'Android Development'),
(85, 'iOS Development'),
(86, 'Embedded Systems'),
(87, 'Firmware Development'),
(88, 'Microcontrollers'),
(89, 'Robotics'),
(90, 'Quantum Computing'),
(91, 'Serverless Architecture'),
(92, 'API Development'),
(93, 'Web Development'),
(94, 'Frontend Development'),
(95, 'Backend Development'),
(96, 'Full Stack Development'),
(97, 'UI/UX Design'),
(98, 'User Interface Design'),
(99, 'User Experience Design'),
(100, 'Accessibility (a11y)'),
(101, 'Performance Optimisation'),
(102, 'Software Testing'),
(103, 'Automated Testing'),
(104, 'Selenium'),
(105, 'JIRA'),
(106, 'Agile Methodology'),
(107, 'Scrum'),
(108, 'Kanban'),
(109, 'Software Architecture'),
(110, 'Design Patterns'),
(111, 'Database Design'),
(112, 'System Administration'),
(113, 'IT Support'),
(114, 'Cloud Security'),
(115, 'Data Engineering'),
(116, 'Site Reliability Engineering (SRE)'),
(117, 'Digital Twin'),
(118, 'Microservices'),
(119, 'Containerization'),
(120, 'Service Mesh'),
(121, 'Observability'),
(122, 'Telemetry & Monitoring'),
(123, 'Log Management'),
(124, 'DevSecOps'),
(125, 'Prompt Engineering'),
(126, 'Communication'),
(127, 'Teamwork'),
(128, 'Leadership'),
(129, 'Time Management'),
(130, 'Adaptability'),
(131, 'Creativity'),
(132, 'Problem Solving'),
(133, 'Critical Thinking'),
(134, 'Emotional Intelligence'),
(135, 'Negotiation'),
(136, 'Decision Making'),
(137, 'Organisation'),
(138, 'Planning'),
(139, 'Customer Service'),
(140, 'Presentation Skills'),
(141, 'Public Speaking'),
(142, 'Conflict Resolution'),
(143, 'Interpersonal Skills'),
(144, 'Attention to Detail'),
(145, 'Research'),
(146, 'Analytical Skills'),
(147, 'Empathy'),
(148, 'Motivation'),
(149, 'Self-Discipline'),
(150, 'Accountability'),
(151, 'Work Ethic'),
(152, 'Professionalism'),
(153, 'Networking'),
(154, 'Business Development'),
(155, 'Sales'),
(156, 'Marketing Strategy'),
(157, 'Brand Management'),
(158, 'Content Writing'),
(159, 'Editing'),
(160, 'Copywriting'),
(161, 'Event Management'),
(162, 'Human Resources'),
(163, 'Recruitment'),
(164, 'Training & Development'),
(165, 'Change Management'),
(166, 'Operations Management'),
(167, 'Supply Chain Management'),
(168, 'Logistics'),
(169, 'Quality Assurance'),
(170, 'Compliance'),
(171, 'Project Management'),
(172, 'Budgeting'),
(173, 'Financial Literacy'),
(174, 'Data Entry'),
(175, 'Administrative Support'),
(176, 'Office Management'),
(177, 'Customer Relationship Management'),
(178, 'Vendor Management'),
(179, 'Team Building'),
(180, 'Coaching & Mentoring'),
(181, 'Strategic Thinking'),
(182, 'Entrepreneurship'),
(183, 'Presentation Design'),
(184, 'Visual Communication'),
(185, 'Social Media Management'),
(186, 'Public Relations'),
(187, 'Media Planning'),
(188, 'Legal Awareness'),
(189, 'Risk Management'),
(190, 'Business Analytics (non-technical)'),
(191, 'Event Coordination'),
(192, 'Hospitality Management'),
(193, 'Healthcare Administration'),
(194, 'Teaching / Tutoring'),
(195, 'Curriculum Development'),
(196, 'Foreign Language Proficiency'),
(197, 'Cultural Awareness'),
(198, 'Sustainability Management'),
(199, 'Negotiation & Persuasion'),
(200, 'Salesforce Support (non-technical)'),
(201, 'Retail Management'),
(202, 'Hospitality & Guest Services'),
(203, 'Customer Experience Design'),
(204, 'Facilities Management'),
(205, 'Team Coordination'),
(206, 'Vendor Coordination'),
(207, 'Training Facilitation'),
(208, 'Life Coaching'),
(209, 'Volunteer Management'),
(210, 'Fundraising'),
(211, 'Public Policy Understanding'),
(212, 'Community Engagement'),
(213, 'Grant Writing'),
(214, 'Media Production (non-tech)'),
(215, 'Graphic Design (non-tech)'),
(216, 'Photography'),
(217, 'Video Editing (non-tech)'),
(218, 'Interior Design'),
(219, 'Fashion Merchandising'),
(220, 'Quality Control'),
(221, 'Health & Safety Management'),
(222, 'Environmental Management'),
(223, 'Logistics Planning'),
(224, 'Event Marketing'),
(225, 'Brand Ambassador Skills'),
(226, 'Product Demonstration'),
(227, 'Retail Sales'),
(228, 'Franchise Management'),
(229, 'Store Operations'),
(230, 'Customer Relations'),
(231, 'Front-Office Management'),
(232, 'Back-Office Operations'),
(233, 'Legal Coordination'),
(234, 'Insurance Brokering'),
(235, 'Brokerage Support'),
(236, 'Real Estate Sales'),
(237, 'Property Management'),
(238, 'Facility Operations'),
(239, 'Senior Citizen Care Management'),
(240, 'Childcare Services'),
(241, 'Tourism & Travel Management'),
(242, 'Housekeeping Management'),
(243, 'Leadership Development'),
(244, 'Executive Assistance');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state_name`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
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
-- Table structure for table `tpo_registration`
--

CREATE TABLE `tpo_registration` (
  `id` int(11) NOT NULL,
  `college_name` varchar(200) DEFAULT NULL,
  `tpo_name` varchar(150) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `designation` varchar(150) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `college_address` text DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tpo_registration`
--

INSERT INTO `tpo_registration` (`id`, `college_name`, `tpo_name`, `email`, `mobile`, `designation`, `state`, `city`, `college_address`, `password`, `created_at`, `status`) VALUES
(1, 'NSEC', 'Saibal Jana', 'saibaljana76@gmail.com', '9845656878', 'Assistant Training & Placement Officer', 'West Bengal', 'Kolkata', 'Techno City, Panchpota, Garia, Kolkata, West Bengal – 700152, India.', 'Ss12345@', '2026-04-02 11:35:11', 'Pending'),
(2, 'NSEC', 'Parimal Mandal', 'parimal@gmail.com', '9845656654', 'Corporate Relations Officer', 'Chhattisgarh', 'Kolkata', 'JHhxbx', 'Ss12345@', '2026-04-02 12:08:03', 'Approved'),
(3, 'BCDA', 'Pabitra Kumer Dey', 'pabitra@gmail.com', '9875456654', 'Internship & Placement Officer', 'Punjab', 'Ajmer', '78, Jessore Rd, South, Hridaypur, Barasat, Kolkata, West Bengal 700127', 'Pp12345@', '2026-04-04 12:34:23', 'Rejected'),
(4, 'SNU', 'Soumen Jana', 'soumean@gmail.com', '8975456698', 'Corporate Relations Officer', 'Goa', 'Alappuzha', 'Goa', 'Soumen@123', '2026-04-06 13:46:03', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('jobseeker','employer') NOT NULL,
  `ref_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `mobile`, `password`, `role`, `ref_id`, `created_at`, `updated_at`) VALUES
(1, 'rohit.experienced@example.com', '9876543210', 'pass123', 'jobseeker', 1, '2026-03-16 20:26:29', '2026-03-16 20:26:29'),
(2, 'ananya.fresher@example.com', '9123456780', 'pass123', 'jobseeker', 2, '2026-03-16 20:26:29', '2026-03-16 20:26:29'),
(119, 'ravi@gmail.com', '9876543210', 'ravi123', 'jobseeker', 1, '2026-02-09 20:55:50', '2026-02-09 20:55:50'),
(120, 'sneha@gmail.com', '9123456789', 'sneha123', 'jobseeker', 118, '2026-02-09 20:55:50', '2026-03-16 11:14:35'),
(121, 'contact@j2c.in', '7602171906	', 'Anita@2000', 'employer', 3, '2026-02-12 07:56:02', '2026-02-12 07:56:02'),
(122, 'vijay.m@email.com', '9988776655', 'vijay123', 'jobseeker', 122, '2026-03-16 12:14:35', '2026-03-16 12:14:35'),
(123, 'kavyashivaram34@gmail.com', '6364354908', 'Kavya@9880', 'jobseeker', 122, '2026-03-18 07:14:07', '2026-04-11 17:13:25'),
(124, 'saibal@gmail.com', '8436350842', 'Saibal123', 'employer', 4, '2026-03-26 10:02:27', '2026-03-26 10:02:27');

-- --------------------------------------------------------

--
-- Table structure for table `webinars`
--

CREATE TABLE `webinars` (
  `id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `speaker_name` varchar(100) NOT NULL,
  `speaker_image` varchar(255) DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `zoom_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `webinars`
--

INSERT INTO `webinars` (`id`, `topic`, `speaker_name`, `speaker_image`, `scheduled_date`, `zoom_link`, `created_at`) VALUES
(2, 'How to Restart your career', 'aloksir', 'images/Sunit_Chaudhury_CEO.jpeg', '2026-04-07 17:47:00', '', '2026-04-06 12:18:08'),
(3, 'jsp sevlet class', 'anitha mam', 'images/Sunit_Chaudhury_CEO.jpeg', '2026-04-07 11:12:00', '', '2026-04-07 05:42:38'),
(4, 'vinayaka', 'vinayaka', 'images/speaker_1775574571648.jpeg', '2026-04-07 20:39:00', '', '2026-04-07 15:09:34'),
(5, 'vinayaka', 'vinayaka', 'images/Sunit_Chaudhury_CEO.jpeg', '2026-04-08 20:39:00', '', '2026-04-07 15:09:51'),
(6, 'vinayaka', 'vinayaka', 'images/Sunit_Chaudhury_CEO.jpeg', '2026-04-10 20:39:00', '', '2026-04-07 15:10:04'),
(7, 'vinayaka', 'vinayaka', 'images/Sunit_Chaudhury_CEO.jpeg', '2026-04-14 20:40:00', '', '2026-04-07 15:10:18'),
(8, 'vinayaka', 'vinayaka', 'images/speaker_1775574689934.jpeg', '2026-04-25 20:41:00', '', '2026-04-07 15:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `webinar_registrations`
--

CREATE TABLE `webinar_registrations` (
  `id` int(11) NOT NULL,
  `webinar_id` int(11) DEFAULT 0,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `gap_status` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `webinar_registrations`
--

INSERT INTO `webinar_registrations` (`id`, `webinar_id`, `full_name`, `email`, `mobile`, `gap_status`, `industry`, `registration_date`) VALUES
(1, 0, 'vinayaka s h', 'vinayaka@gmail.com', '7777777777', '0-2 Years', 'IT/Tech', '2026-04-06 11:13:56'),
(2, 2, 'vinayaka s h', 'vinayaka@gmail.com', '7777777777', '0-2 Years', 'Unspecified', '2026-04-06 16:19:38'),
(3, 3, 'saibal', 'saibal2gmail.com', '7777777777', '0-2 Years', 'Unspecified', '2026-04-07 05:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_applications`
--

CREATE TABLE `workshop_applications` (
  `id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `college` varchar(150) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `workshop_applications`
--

INSERT INTO `workshop_applications` (`id`, `workshop_id`, `fullName`, `email`, `mobile`, `college`, `course`, `year`, `domain`, `reason`, `created_at`) VALUES
(1, 0, 'Soumen Jana', 'soumenj303@gmail.com', '9196418081', 'TIU', 'M.Tech', '2nd Year', 'Embedded Systems', 'oooooooooooooooooooooooooo', '2026-04-22 06:28:23'),
(2, 1, 'Parimal Mandal', 'parimal@gmail.com', '9196418081', 'SNU', 'M.Tech', '4th Year', 'Internet of Things (IoT)', 'ooooooooooooooooooooooooooooo', '2026-04-22 06:42:57'),
(3, 1, 'Zoya', 'zoya123@gmail.com', '9154645874', 'SVU', 'M.Tech', '4th Year', 'Internet of Things (IoT)', 'good', '2026-04-29 06:21:27'),
(4, 1, 'Zoya', 'zoya123@gmail.com', '9154645874', 'SVU', 'BBA', '4th Year', 'Embedded Systems', 'gopf', '2026-04-29 07:58:11'),
(5, 1, 'Suman Jana', 'suman@gmail.com', '9178675643', 'SNU', 'MCA', '3rd Year', 'Embedded Systems', 'good', '2026-04-29 07:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_post`
--

CREATE TABLE `workshop_post` (
  `id` int(11) NOT NULL,
  `organizerName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `fees` varchar(50) DEFAULT NULL,
  `lastDate` varchar(50) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `eligibility` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(10) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `workshop_post`
--

INSERT INTO `workshop_post` (`id`, `organizerName`, `email`, `title`, `type`, `location`, `duration`, `fees`, `lastDate`, `skills`, `eligibility`, `description`, `status`) VALUES
(1, 'my TCS', 'mytcs@gmail.com', 'my TCS', 'Online', 'Zoom', '2 Weeks', '500', '2026-04-30', 'Java,Spring Boot,Hibernate,JSP & Servlet,JavaScript,React,Data Structures,Algorithms', 'B.Tech,2nd Year,70% Above,Basic Programming Knowledge,Java Basics Required', 'GOOD', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `assessment_categories`
--
ALTER TABLE `assessment_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `assessment_results`
--
ALTER TABLE `assessment_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `basic_info`
--
ALTER TABLE `basic_info`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`campaign_id`);

--
-- Indexes for table `campaign_logs`
--
ALTER TABLE `campaign_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `campus_ambassador_registration`
--
ALTER TABLE `campus_ambassador_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campus_hiring_registration`
--
ALTER TABLE `campus_hiring_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_gap_candidates`
--
ALTER TABLE `career_gap_candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `career_restart_programs`
--
ALTER TABLE `career_restart_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_webinar`
--
ALTER TABLE `career_webinar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_webinar_registrations`
--
ALTER TABLE `career_webinar_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `college_emails`
--
ALTER TABLE `college_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_registrations`
--
ALTER TABLE `course_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_internships`
--
ALTER TABLE `deleted_internships`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `deleted_jobs`
--
ALTER TABLE `deleted_jobs`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `education_history`
--
ALTER TABLE `education_history`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `employer_personal_details`
--
ALTER TABLE `employer_personal_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer_plans`
--
ALTER TABLE `employer_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internship_applications`
--
ALTER TABLE `internship_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_application` (`internship_id`,`jobseeker_id`),
  ADD KEY `fk_jobseeker_application` (`jobseeker_id`);

--
-- Indexes for table `internship_drive_registration`
--
ALTER TABLE `internship_drive_registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_registration` (`email`,`internship_drive_id`);

--
-- Indexes for table `internship_postings`
--
ALTER TABLE `internship_postings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internship_registrations`
--
ALTER TABLE `internship_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internship_skills`
--
ALTER TABLE `internship_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `j2cemploye`
--
ALTER TABLE `j2cemploye`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobseekers`
--
ALTER TABLE `jobseekers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobseeker_experience`
--
ALTER TABLE `jobseeker_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobseeker_id` (`jobseeker_id`);

--
-- Indexes for table `jobseeker_projects`
--
ALTER TABLE `jobseeker_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobseeker_id` (`jobseeker_id`);

--
-- Indexes for table `jobs_connections`
--
ALTER TABLE `jobs_connections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_connection` (`employee_id`,`jobseeker_id`),
  ADD KEY `jobseeker_id` (`jobseeker_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_id` (`job_id`,`jobseeker_id`);

--
-- Indexes for table `job_master`
--
ALTER TABLE `job_master`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `job_titles`
--
ALTER TABLE `job_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_master`
--
ALTER TABLE `login_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `mail_queue`
--
ALTER TABLE `mail_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state_status` (`state`,`status`);

--
-- Indexes for table `organization_details`
--
ALTER TABLE `organization_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_ambassador_program`
--
ALTER TABLE `post_ambassador_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_internship_drive`
--
ALTER TABLE `post_internship_drive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_internships`
--
ALTER TABLE `saved_internships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_unique_saved` (`jobseeker_id`,`internship_id`),
  ADD KEY `idx_jobseeker` (`jobseeker_id`),
  ADD KEY `idx_internship` (`internship_id`);

--
-- Indexes for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `jobseeker_id` (`jobseeker_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tpo_registration`
--
ALTER TABLE `tpo_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `webinars`
--
ALTER TABLE `webinars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webinar_registrations`
--
ALTER TABLE `webinar_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_applications`
--
ALTER TABLE `workshop_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_post`
--
ALTER TABLE `workshop_post`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assessment_categories`
--
ALTER TABLE `assessment_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_results`
--
ALTER TABLE `assessment_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basic_info`
--
ALTER TABLE `basic_info`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `campaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `campaign_logs`
--
ALTER TABLE `campaign_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campus_ambassador_registration`
--
ALTER TABLE `campus_ambassador_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `campus_hiring_registration`
--
ALTER TABLE `campus_hiring_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `career_gap_candidates`
--
ALTER TABLE `career_gap_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `career_restart_programs`
--
ALTER TABLE `career_restart_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_webinar`
--
ALTER TABLE `career_webinar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `career_webinar_registrations`
--
ALTER TABLE `career_webinar_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `college_emails`
--
ALTER TABLE `college_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_registrations`
--
ALTER TABLE `course_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `deleted_internships`
--
ALTER TABLE `deleted_internships`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `deleted_jobs`
--
ALTER TABLE `deleted_jobs`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `education_history`
--
ALTER TABLE `education_history`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employer_personal_details`
--
ALTER TABLE `employer_personal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employer_plans`
--
ALTER TABLE `employer_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internship_applications`
--
ALTER TABLE `internship_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `internship_drive_registration`
--
ALTER TABLE `internship_drive_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `internship_postings`
--
ALTER TABLE `internship_postings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `internship_registrations`
--
ALTER TABLE `internship_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `internship_skills`
--
ALTER TABLE `internship_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `j2cemploye`
--
ALTER TABLE `j2cemploye`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobseekers`
--
ALTER TABLE `jobseekers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `jobseeker_experience`
--
ALTER TABLE `jobseeker_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jobseeker_projects`
--
ALTER TABLE `jobseeker_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jobs_connections`
--
ALTER TABLE `jobs_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `job_master`
--
ALTER TABLE `job_master`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `job_titles`
--
ALTER TABLE `job_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `login_master`
--
ALTER TABLE `login_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `mail_queue`
--
ALTER TABLE `mail_queue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_details`
--
ALTER TABLE `organization_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post_ambassador_program`
--
ALTER TABLE `post_ambassador_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_internship_drive`
--
ALTER TABLE `post_internship_drive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_internships`
--
ALTER TABLE `saved_internships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `tpo_registration`
--
ALTER TABLE `tpo_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `webinars`
--
ALTER TABLE `webinars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `webinar_registrations`
--
ALTER TABLE `webinar_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `workshop_applications`
--
ALTER TABLE `workshop_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workshop_post`
--
ALTER TABLE `workshop_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  ADD CONSTRAINT `assessment_questions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `assessment_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assessment_results`
--
ALTER TABLE `assessment_results`
  ADD CONSTRAINT `assessment_results_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `assessment_categories` (`id`);

--
-- Constraints for table `education_history`
--
ALTER TABLE `education_history`
  ADD CONSTRAINT `FK_education_history_basicinfo` FOREIGN KEY (`userid`) REFERENCES `basic_info` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `internship_applications`
--
ALTER TABLE `internship_applications`
  ADD CONSTRAINT `fk_internship_application` FOREIGN KEY (`internship_id`) REFERENCES `internship_postings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jobseeker_application` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseekers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobseeker_experience`
--
ALTER TABLE `jobseeker_experience`
  ADD CONSTRAINT `jobseeker_experience_ibfk_1` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseekers` (`id`);

--
-- Constraints for table `jobseeker_projects`
--
ALTER TABLE `jobseeker_projects`
  ADD CONSTRAINT `jobseeker_projects_ibfk_1` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseekers` (`id`);

--
-- Constraints for table `jobs_connections`
--
ALTER TABLE `jobs_connections`
  ADD CONSTRAINT `jobs_connections_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `j2cemploye` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_connections_ibfk_2` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseekers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_master` (`job_id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_internships`
--
ALTER TABLE `saved_internships`
  ADD CONSTRAINT `saved_internships_ibfk_1` FOREIGN KEY (`internship_id`) REFERENCES `internship_postings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_internships_ibfk_2` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseekers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD CONSTRAINT `saved_jobs_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_master` (`job_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_jobs_ibfk_2` FOREIGN KEY (`jobseeker_id`) REFERENCES `jobseekers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

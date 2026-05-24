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
-- Database: `j2c`
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

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`) VALUES
(1, 'contact@j2c.in', 'j2c##2025', 'master'),
(2, 'intership@j2c', 'j2cinter##2025', 'internship');

-- --------------------------------------------------------

--
-- Table structure for table `archived_internships`
--

CREATE TABLE `archived_internships` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `email_body` longtext DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'ACTIVE',
  `sent_count` int(11) DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `last_run_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`campaign_id`, `campaign_name`, `category`, `send_limit`, `schedule_day`, `subject`, `from_email`, `email_body`, `created_on`, `status`, `sent_count`, `state`, `last_run_date`) VALUES
(1, 'College Campus Drive ', 'College Bulk Email', 1000, 'Monday', 'Proposal for Campus Recruitment Drive of Perennation Computer Solutions Global Pvt. Ltd. (PCS Global)', NULL, '<style>\r\n      \r\n    body { background-color: #fff }\r\n    * ::-webkit-scrollbar-track { background: rgba(0, 0, 0, 0.1) }\r\n    * ::-webkit-scrollbar-thumb { background: rgba(255, 255, 255, 0.2) }\r\n    * ::-webkit-scrollbar { width: 10px }\r\n  \r\n\r\n      \r\n\r\n      [data-gjs-type=\"wrapper\"] {\r\n        min-height: 100vh;\r\n        padding-top: 0.001em;\r\n      }\r\n\r\n      .gjs-dashed *[data-gjs-highlightable] {\r\n        outline: 1px dashed rgba(170,170,170,0.7);\r\n        outline-offset: -2px;\r\n      }\r\n\r\n      .gjs-selected {\r\n        outline: 2px solid #3b97e3 !important;\r\n        outline-offset: -2px;\r\n      }\r\n\r\n      .gjs-selected-parent {\r\n        outline: 2px solid #ffca6f !important\r\n      }\r\n\r\n      .gjs-no-select {\r\n        user-select: none;\r\n        -webkit-user-select:none;\r\n        -moz-user-select: none;\r\n      }\r\n\r\n      .gjs-freezed {\r\n        opacity: 0.5;\r\n        pointer-events: none;\r\n      }\r\n\r\n      .gjs-no-pointer {\r\n        pointer-events: none;\r\n      }\r\n\r\n      .gjs-pointer-init {\r\n        pointer-events: initial;\r\n      }\r\n\r\n      .gjs-plh-image {\r\n        background: #f5f5f5;\r\n        border: none;\r\n        height: 100px;\r\n        width: 100px;\r\n        display: block;\r\n        outline: 3px solid #ffca6f;\r\n        cursor: pointer;\r\n        outline-offset: -2px\r\n      }\r\n\r\n      .gjs-grabbing {\r\n        cursor: grabbing;\r\n        cursor: -webkit-grabbing;\r\n      }\r\n\r\n      .gjs-is__grabbing {\r\n        overflow-x: hidden;\r\n      }\r\n\r\n      .gjs-is__grabbing,\r\n      .gjs-is__grabbing * {\r\n        cursor: grabbing !important;\r\n      }\r\n\r\n      \r\n      * { box-sizing: border-box; } body {margin: 0;}\r\n    </style><div data-gjs-highlightable=\"true\" id=\"i8lt\" data-gjs-type=\"wrapper\" class=\"\" draggable=\"true\"><div data-gjs-highlightable=\"true\" id=\"i0np\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><div data-gjs-highlightable=\"true\" id=\"i5hh\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><h2 data-gjs-highlightable=\"true\" id=\"il15\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">J2C Career Update 🚀</h2><p data-gjs-highlightable=\"true\" id=\"i2aq\" data-gjs-type=\"text\" draggable=\"true\" class=\"gjs-selected\" contenteditable=\"false\"><p id=\"i594c\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"i122h\" data-gjs-type=\"text\" draggable=\"true\">Dear Sir/Madam,</span></p><p id=\"in2kw\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"ikta1\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Greetings from Perennation Computer Solutions Global Pvt. Ltd.!</span></p><p id=\"i2ylp\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><span id=\"ioez2\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">PERENNATION COMPUTER SOLUTIONS GLOBAL Pvt. Ltd., an ISO 9001:2008 Certified Company, is widely known as PCS Global, an ITES Technology driven company successfully providing IT Services and product development to domestic and onsite clients, physically office located in Bengaluru &amp; Kolkata. The core activity of PCS Global Pvt. Ltd. is Web Development, IT Consulting &amp; Information Security. Since the inception of the company, 3000+ associates, including many Fresh Engineers from the various Engineering Colleges situated all over India, have joined PCS Global Pvt. Ltd. Our Industry Academia Collaborations include:</span></p><ol id=\"il80c\" data-gjs-type=\"default\" draggable=\"true\"><li id=\"iazcp\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><span id=\"idnit\" data-gjs-type=\"text\" draggable=\"true\">Campus Recruitment Drive</span></li><li id=\"ierjq\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><span id=\"ig3xo\" data-gjs-type=\"text\" draggable=\"true\">Industrial Training for colleges students</span></li><li id=\"i1blz\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"izx3n\" data-gjs-type=\"text\" draggable=\"true\">Webinar for Emerging skills in Industry</span></li><li id=\"ivx3s\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"i10oo\" data-gjs-type=\"text\" draggable=\"true\">Build Career around Passion for Students (Journey to Corporate - J2C)</span></li></ol><p id=\"icile\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"iwlwl\" data-gjs-type=\"text\" draggable=\"true\">Please visit us:</span></p><p id=\"ilvkl\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><span id=\"i95kl\" data-gjs-type=\"text\" draggable=\"true\">Website:&nbsp;<a id=\"ibdbg\" data-gjs-type=\"link\" draggable=\"true\" href=\"http://www.pcsglobal.in/\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.pcsglobal.in/&amp;source=gmail&amp;ust=1776427130541000&amp;usg=AOvVaw2OZ23P1Rjy9uEB_gBDaBlg\">www.pcsglobal.in</a></span></p><p id=\"id065\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"ihuxb\" data-gjs-type=\"text\" draggable=\"true\">YouTube:&nbsp;<a id=\"iiq3t\" data-gjs-type=\"link\" draggable=\"true\" href=\"https://www.youtube.com/@PCSGlobalPrivateLimited\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://www.youtube.com/@PCSGlobalPrivateLimited&amp;source=gmail&amp;ust=1776427130541000&amp;usg=AOvVaw1060Rf70csNVjwknMnOJ1F\">https://www.youtube.<wbr id=\"iwvvk\" data-gjs-type=\"default\" draggable=\"true\">com/@PCSGlobalPrivateLimited</a></span></p><p id=\"i7j0z\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"i5pjz\" data-gjs-type=\"text\" draggable=\"true\">LinkedIn:&nbsp;<a id=\"ik6q4\" data-gjs-type=\"link\" draggable=\"true\" href=\"https://www.linkedin.com/company/14401725/admin/feed/posts/\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://www.linkedin.com/company/14401725/admin/feed/posts/&amp;source=gmail&amp;ust=1776427130541000&amp;usg=AOvVaw2iAu4LT6AE3aWLsz6gBDd_\">https://www.<wbr id=\"iym6l\" data-gjs-type=\"default\" draggable=\"true\">linkedin.com/company/14401725/<wbr id=\"i5195\" data-gjs-type=\"default\" draggable=\"true\">admin/feed/posts/</a></span></p><p id=\"i3zij\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"i9v5o\" data-gjs-type=\"text\" draggable=\"true\">Facebook Page:&nbsp;<a id=\"ifynz\" data-gjs-type=\"link\" draggable=\"true\" href=\"https://www.facebook.com/hrpcsglobal/\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://www.facebook.com/hrpcsglobal/&amp;source=gmail&amp;ust=1776427130541000&amp;usg=AOvVaw1yFy8vfszNaqrO-aojRI9F\">https://www.facebook.<wbr id=\"iu8xd\" data-gjs-type=\"default\" draggable=\"true\">com/hrpcsglobal/</a></span></p><p id=\"iywwe\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><span id=\"i7ac9\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">PCS Global is hiring for entry level Software Engineer (Job Role: Java Full Stack Developer, Salesforce CRM, Python Full Stack Developer, Software Tester, Data Analyst, Front End Developer) with qualifications B.Tech, MCA, BCA batch students who are currently pursuing 3rd year.</span></p><p id=\"inkat\" data-gjs-type=\"default\" draggable=\"true\"><span id=\"ivpcb\" data-gjs-type=\"text\" draggable=\"true\">Contact Number:&nbsp;<br id=\"iyp5r\" data-gjs-type=\"default\" draggable=\"true\">&nbsp;Alok Halder (Founder And CEO) : 8697741611&nbsp;</span></p><p id=\"iegmo\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><br id=\"izng7\" data-gjs-type=\"default\" draggable=\"true\"></p><p id=\"iht72\" data-gjs-type=\"default\" draggable=\"true\"><br id=\"i89wf\" data-gjs-type=\"default\" draggable=\"true\"></p></p><br data-gjs-highlightable=\"true\" id=\"iq5dm\" data-gjs-type=\"default\" draggable=\"true\"><br data-gjs-highlightable=\"true\" id=\"iena7\" data-gjs-type=\"default\" draggable=\"true\"><p data-gjs-highlightable=\"true\" id=\"ie0ql\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Thanks,<br id=\"ipzxy\" data-gjs-type=\"default\" draggable=\"true\"><b id=\"im36x\" data-gjs-type=\"text\" draggable=\"true\">J2C Team</b></p></div></div></div><div class=\"gjs-css-rules\"><div id=\"gjs-css-rules\"><style>#il15{color:#003580;}</style><style>#ie0ql{margin-top:20px;}</style><style>#i5hh{max-width:600px;margin:auto;background:#fff;padding:20px;border-radius:10px;}</style><style>#i0np{font-family:Arial;background:#f5f6fa;padding:20px;}</style><style></style><style></style><style>#i122h{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#ikta1{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#ioez2{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#idnit{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#iazcp{margin-left:15px;}</style><style>#ig3xo{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#ierjq{margin-left:15px;}</style><style>#izx3n{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#i1blz{margin-left:15px;}</style><style>#i10oo{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#ivx3s{margin-left:15px;}</style><style>#iwlwl{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#i95kl{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#ihuxb{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#i5pjz{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#i9v5o{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#i7ac9{font-family:\"times new roman\",times,serif;font-size:11pt;}</style><style>#ivpcb{font-family:\"times new roman\",times,serif;font-size:11pt;}</style></div><div id=\"gjs-css-rules-992\"></div><div id=\"gjs-css-rules-768\"></div><div id=\"gjs-css-rules-480\"></div></div><div class=\"gjs-js-cont\"></div>', '2026-04-16 12:34:42', 'ACTIVE', 169, 'West Bengal', '2026-04-16');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_images`
--

CREATE TABLE `campaign_images` (
  `id` int(11) NOT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_images`
--

INSERT INTO `campaign_images` (`id`, `file_id`, `file_name`) VALUES
(1, '11U8SOw8Qw1so3NUdYE3J2FpXh85-FbZl', 'logo.png'),
(2, '1CPEi-nlChnjjFxUWEd_h7vmNvMkDy-Xa', 'logo.png'),
(3, '1fPRHGVUg50BoeABYZiSGYZhH9Xb97jPp', 'logo.png'),
(4, '1ke9aKhTH3tGBEkNq3aSSFDE_600mDh9b', 'logo.png'),
(5, '1Hsxfhtij34aZ9XUJmLbDF9QNaKTEb2am', 'logo.png'),
(6, '1Np2VL_cjLXQiHT6gLQVkM4gRM4KmfBzF', 'logo.png'),
(7, '1oE1eLsgDl_fO7qm6DrO5K_bmsx1JgGRb', 'logo.png'),
(8, '15kqAaMECnq823TolsCwBwQrxbsjTnw5-', 'logo.png'),
(9, '1lGzLZ9tr9Ezn9VMiDf5t43jIB08DGO6t', 'logo.png'),
(10, '1tZqzIBrG3ywOsIIL_TfR9UIzNIHtGrS9', 'logo.png'),
(11, '1kjZm_MMydf0wYFkY7CKPSVdLs6CgqKfJ', 'logo.png'),
(12, '1PsT7s0t6Cie5b0QeXog355Uowkcxu1s8', 'logo.png');

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
(2, 'Amit Kumar Sinha ', 'amitsinhassj5@gmail.com', '9315362671', 'Male', 3.00, 'Other', '', 'Manual testing, java ', 0.00, '0', '', 'https://drive.google.com/file/d/1AJfFXwmtvrmJ_JV5ms8r6ULD9glErjvw/view?usp=drivesdk', '2026-02-13 16:27:09');

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
(1, ' Techno India University', '  hr@technoindiauniversity.ac.in,info@technoindiauniversity.ac.in,admission@technoindiauniversity.ac.in', 'West Bengal'),
(2, 'Kazi Nazrul University', 'vc.knuasnl@gmail.com', 'West Bengal'),
(3, 'Visva-Bharati University', 'info@visva-bharati.ac.in', 'West Bengal'),
(4, 'Vidyasagar University', '', 'West Bengal'),
(5, 'Uttar Banga Krishi Vishwavidyalaya', 'registrar@ubkv.ac.in', 'West Bengal'),
(6, 'West Bengal State University', 'shcell.wbsu@gmail.com', 'West Bengal'),
(7, 'West Bengal University of Technology', 'partha@digitekindia.co.in', 'West Bengal'),
(8, 'West Bengal University of Animal and Fishery Sciences', '', 'West Bengal'),
(9, ' West Bengal University of Health Sciences', 'registrarwbuhs@gmail.com', 'West Bengal'),
(10, 'West Bengal National University of Juridical Sciences', '', 'West Bengal'),
(11, 'Bengal Engineering & Science University', '', 'West Bengal'),
(12, 'Sidho Kanho Birsha University', 'contact@skbu.ac.in', 'West Bengal'),
(13, 'Ramakrishna Mission Vivekananda University', 'vivekananda.university@gmail.com', 'West Bengal'),
(14, 'Rabindra Bharati University', 'registrar@rbu.ac.in', 'West Bengal'),
(15, 'Presidency University', '', 'West Bengal'),
(16, 'Netaji Subhas Open University', '', 'West Bengal'),
(17, 'International Management Institute, Kolkata', '', 'West Bengal'),
(18, 'University of North Bengal ', 'regnbu@sancharnet.in', 'West Bengal'),
(19, 'University of Kalyani', 'vcklyuniv@gmail.com', 'West Bengal'),
(20, 'University of Gour Banga', 'registrar@ugb.ac.in', 'West Bengal'),
(21, 'IIT Kharagpur', '', 'West Bengal'),
(22, ' Jadavpur University', 'hod@bengali.jdvu.ac.in', 'West Bengal'),
(23, 'University of Calcutta', '', 'West Bengal'),
(24, 'University of Burdwan', '', 'West Bengal'),
(25, 'Bidhan Chandra Krishi Viswavidyalaya ', 'bckvvc@gmail.com', 'West Bengal'),
(26, 'Aliah University ', 'infodesk@aliah.ac.in', 'West Bengal'),
(27, 'Haldia Institute of Technology', 'tpohit@hithaldia.in\n', 'West Bengal'),
(28, 'JIS College of Engineering', 'subhasis.biswas@jisgroup.org,jisce_tnp@jisgroup.org', 'West Bengal'),
(29, 'MCKV Institute of Engineering', 'info@mckvie.edu.in', 'West Bengal'),
(30, 'Abacus Institute Of Engineering & Management(AIEM)', 'abacus.institute@jisgroup.org', 'West Bengal'),
(31, 'Kalyani Government Engineering College', 'tnp_kgec@kgec.edu.in', 'West Bengal'),
(32, 'Techno International New Town (TINT)', 'info@tictcollege.in,info@tict.edu.in', 'West Bengal'),
(33, 'Academy of Technology', 'placement@aot.edu.in,corporaterelations@aot.edu.in', 'West Bengal'),
(34, 'Dr. Sudhir Chandra Sur Institute of Technology & Sports Complex', 'info@dsec.ac.in', 'West Bengal'),
(35, 'RCC Institute of Information Technology', 'fic.tnp@rcciit.org.in,\nplacement@rcciit.org.in', 'West Bengal'),
(36, 'Budge Budge Institute of Technology', 'tnp@bbit.edu.in', 'West Bengal'),
(37, 'Indian Institute of Engineering Science and Technology, Shibpur (IIEST)', 'hodhrm@iiests.ac.in,hrmbesus@gmail.com', 'West Bengal'),
(38, 'Camellia Institute Of Technology', 'cittnp2007@gmail.com', 'West Bengal'),
(39, 'Birbhum Institute of Engineering & Technology (BIET)', 'tpo@bietsuri.ac.in', 'West Bengal'),
(40, 'Ghani Khan Choudhury Institute of Engineering And Technology', 'administration@gkciet.ac.in\n\n', 'West Bengal'),
(41, 'Calcutta Institute of Engineering And Management (CIEM)', '', 'West Bengal'),
(42, 'Hooghly Engineering & Technology College', 'tpo.hetc@gmail.com', 'West Bengal'),
(43, 'Bengal Institute of Technology and Management', 'info@bitm.org.in,director@bitm.org.in,bitmadmission19@gmail.com', 'West Bengal'),
(44, 'Camellia Institute of Engineering and Technology', 'tnp.ciet.cip@gmail.com', 'West Bengal'),
(45, 'Techno International Batanagar', 'tib@tib.edu.in', 'West Bengal'),
(46, 'Future Institute of Technology', 'fit@teamfuture.in,career@teamfuture.com', 'West Bengal'),
(47, 'Ideal Institute of Engineering & Ideal Institute of Nursing & NSCBIP & DWPS', 'admission@iiekalyani.com', 'West Bengal'),
(48, 'OmDayal Group of Institutions', 'contact@omdayal.com', 'West Bengal'),
(49, 'I.M.P.S. College of Engineering & Technology', 'impscet.tpo@gmail.com', 'West Bengal'),
(50, 'B.P.C Institute of Technology (Polytechnic College)', 'bpcit1wb@gmail.com', 'West Bengal'),
(51, 'Hemnalini Memorial College Of Engineering', 'hmce2021@gmail.com', 'West Bengal'),
(52, 'Babasaheb Ambedkar government Polytechnic', 'tehattapolywb@gmail.com', 'West Bengal'),
(53, 'Techno Engineering College Banipur', 'placementcell@tecb.edu.in', 'West Bengal'),
(54, 'Surendra Institute of Engineering and Management, Siliguri', 'info@siemsiliguri.org,siemslg@gmail.com', 'West Bengal'),
(55, 'Swami Vivekananda School of Diploma (SVSD)', ' sanakaeducationaltrust@gmail.com,info@setgoi.com', 'West Bengal'),
(56, 'RCC Institute of Information Technology', 'fic.tnp@rcciit.org.in,\nplacement@rcciit.org.in', 'West Bengal'),
(57, 'Budge Budge Institute of Technology', 'tnp@bbit.edu.in', 'West Bengal'),
(58, 'Calcutta Institute of Engineering And Management (CIEM)', '', 'West Bengal'),
(59, 'Dr. Sudhir Chandra Sur Institute of Technology & Sports Complex', 'info@dsec.ac.in', 'West Bengal'),
(60, 'Brainware University', 'info@brainwareuniversity.ac.in,tpo@brainwareuniversity.ac.in', 'West Bengal'),
(61, 'JIS College of Engineering', 'subhasis.biswas@jisgroup.org,jisce_tnp@jisgroup.org', 'West Bengal'),
(62, 'MCKV Institute of Engineering', 'info@mckvie.edu.in', 'West Bengal'),
(63, 'Techno International New Town (TINT)', 'info@tictcollege.in,info@tict.edu.in', 'West Bengal'),
(64, 'Camellia Institute Of Technology', 'cittnp2007@gmail.com', 'West Bengal'),
(65, 'Haldia Institute of Technology', 'tpohit@hithaldia.in\n', 'West Bengal'),
(66, 'Future Institute of Technology', 'fit@teamfuture.in,career@teamfuture.com', 'West Bengal'),
(67, 'OmDayal Group of Institutions', 'contact@omdayal.com', 'West Bengal'),
(68, 'Kalyani Government Engineering College', 'tnp_kgec@kgec.edu.in', 'West Bengal'),
(69, 'Academy of Technology', 'placement@aot.edu.in,corporaterelations@aot.edu.in', 'West Bengal'),
(70, 'Ghani Khan Choudhury Institute of Engineering And Technology', 'tpo@gkciet.ac.in,surajit@gkciet.ac.in,amitdas@gkciet.ac.in', 'West Bengal'),
(71, 'Ideal Institute of Engineering & Ideal Institute of Nursing & NSCBIP & DWPS', 'admission@iiekalyani.com', 'West Bengal'),
(72, 'Bengal Institute of Technology and Management', 'info@bitm.org.in,director@bitm.org.in,bitmadmission19@gmail.com', 'West Bengal'),
(73, 'North Calcutta Polytechnic College', 'principal.ncp.1@gmail.com', 'West Bengal'),
(74, 'Hooghly Engineering & Technology College', 'tpo.hetc@gmail.com', 'West Bengal'),
(75, 'IAS Academy', 'ksgkolkata@ksgindia.com,info@eliteias.in ', 'West Bengal'),
(76, 'Abacus Institute Of Engineering & Management(AIEM)', 'abacus.institute@jisgroup.org', 'West Bengal'),
(77, 'B.P.C Institute of Technology (Polytechnic College)', 'bpcit1wb@gmail.com', 'West Bengal'),
(78, 'Birbhum Institute of Engineering & Technology (BIET)', 'tpo@bietsuri.ac.in', 'West Bengal'),
(79, 'Assam down town University', 'rimjhim@adtu.in', 'West Bengal'),
(80, 'Swami Vivekananda Group Of Institutes', 'admission@swamivivekanandagroup.com', 'West Bengal'),
(81, 'Techno International Batanagar', 'tib@tib.edu.in', 'West Bengal'),
(82, 'Mallabhum Institute of Technology', 'tnpcell@mitbishnupur.ac.in', 'West Bengal'),
(83, 'BFIT Group of Institutions', 'Placement@bfitgroup.in', 'West Bengal'),
(84, 'Siliguri Institute of Technology - [SIT], Darjeeling', 'info@sittechno.org', 'West Bengal'),
(85, 'Surendra Institute of Engineering and Management - [SIEM], Darjeeling', 'info@siemsiliguri.org, siemslg@gmail.com', 'West Bengal'),
(86, 'Darjeeling Polytechnic, Darjeeling', 'darpoly2000@yahoo.co.in', 'West Bengal'),
(87, 'Sikkim Professional University, West Sikkim', 'contact@spu.ac', 'West Bengal'),
(88, 'National Institute of Technology - [NIT], South Sikkim', 'info@nitsikkim.ac.in', 'West Bengal'),
(89, 'Siliguri Government Polytechnic - [SGP], Siliguri', ' siligovtpoly@gmail.com', 'West Bengal'),
(90, 'JD Institute of Fashion Technology, Siliguri', 'delhi@jdinstitute.co', 'West Bengal'),
(91, 'SRM University Sikkim, Gangtok', ' registrar@srmus.edu.in', 'West Bengal'),
(92, 'Vinayaka Missions Sikkim University - [VMSU], Gangtok', 'contactus@vmsuniversity.in', 'West Bengal'),
(93, 'College of Agricultural Engineering and Post Harvest Technology - [CAEPHT], Gangtok', '', 'West Bengal'),
(94, 'Sikkim Manipal University - [SMU], East Sikkim', 'principal.physiotherapy@smims.smu.edu.in', 'West Bengal'),
(95, 'Sikkim Manipal Institute of Technology - [SMIT], East Sikkim', 'principal.physiotherapy@smims.smu.edu.in', 'West Bengal'),
(96, 'Medhavi Skills University, East Sikkim', 'contact@msu.edu.in', 'West Bengal'),
(97, 'Jalpaiguri Government Engineering College - [JGEC], Jalpaiguri', 'verification@jgec.ac.in', 'West Bengal'),
(98, 'IMPS Polytechnic College, Jalpaiguri', 'principaljpi@yahoo.co.in', 'West Bengal'),
(99, 'Jalpaiguiri Govrnment Polytechnic College, Jalpaiguri', 'principaljpi@yahoo.co.in', 'West Bengal'),
(100, 'Rajganj Government Polytechnic, Jalpaiguri', 'rajganjpoly@gmail.com', 'West Bengal'),
(101, 'Raiganj Polytechnic, Uttar Dinajpur', ' rai_poly@rediffmail.com', 'West Bengal'),
(102, 'Falakata Polytechnic - [FP], Alipurduar', 'falakatapoly@gmail.com', 'West Bengal'),
(103, 'Coochbehar Government Engineering College, Cooch Behar', 'principalofficecgec@gmail.com', 'West Bengal'),
(104, 'Uttar Banga Krishi Vishwavidyalaya - [UBKV], Cooch Behar', 'registrar@ubkv.ac.in', 'West Bengal'),
(105, 'Cooch Behar Panchanan Barma University- [CBPBU], Cooch Behar', 'info@cbpbu.ac.in', 'West Bengal'),
(106, 'Government Polytechnic, Araria', 'principalgpararia@gmail.com', 'West Bengal'),
(107, 'Shri Phanishwar Nath Renu Engineering College - [SPNREC], Araria', 'principal@spnrecararia.ac.in', 'West Bengal'),
(108, 'Purnea College of Engineering - [PCE], Purnea', '', 'West Bengal'),
(109, 'Millia Institute of Technology - [MIT], Purnea', 'mitpur_rb07@yahoo.com', 'West Bengal'),
(110, 'Vidya Vihar Institute of Technology - [VVIT], Purnea', ' vidyaviharit@gmail.com', 'West Bengal'),
(111, 'Millia Polytechnic, Purnea', 'milliapolytechnic_09@yahoo.co.in', 'West Bengal'),
(112, 'Purnea University, Purnea', 'info@purneauniversity.ac.in', 'West Bengal'),
(113, 'Supaul College of Engineering - [SCE], Supaul', '', 'West Bengal'),
(114, 'Katihar Engineering College - [KEC], Katihar', '', 'West Bengal'),
(115, 'Gangarampur Government Polytechnic College, Dakshin Dinajpur', 'poly.ganga@gmail.com', 'West Bengal'),
(116, 'Hilli Government Polytechnic, Dakshin Dinajpur', ' hgpolytechnic@gmail.com', 'West Bengal'),
(117, 'BP Mandal College of Engineering, Madhepura', 'enquiry@bpmcemadhepura.org', 'West Bengal'),
(118, 'Alipurduar Government Engineering and Management College', '', 'West Bengal'),
(119, 'Bankura Unnayani Institute of Engineering - [BUIE], Bankura', 'sagun.tudu@cse.agemc.ac.in', 'West Bengal'),
(120, 'KG Engineering Institute, Bankura', 'aloke.roykgp@gmail.com,amrita.mukherjee@gmail.com', 'West Bengal'),
(121, 'Basirhat Government Polytechnic College, Bankura', 'kgei.bsp@gmail.com', 'West Bengal'),
(122, 'Bankura Government Polytechnic, Bankura', ' bgp.bku@gmail.com', 'West Bengal'),
(123, 'Bishnupur Public Institute of Engineering - [BPIE], Bankura', 'bgp.bku@gmail.com ', 'West Bengal'),
(124, 'Mallabhum Institute of Polytechnic, Bankura', ' say2ashim@gmail.com', 'West Bengal'),
(125, 'Mallabhum Institute of Technology - [MIT], Bishnupur', 'mipbishnupur2014@gmail.com', 'West Bengal'),
(126, 'National Institute of Technology - [NIT], Durgapur', 'tnpcell@mitbishnupur.ac.in', 'West Bengal'),
(127, 'Bengal College of Engineering and Technology - [BCET], Durgapur', 'placementcell@nitdgp.ac.in,cdc@nitdgp.ac.in', 'West Bengal'),
(128, 'Dr. B.C. Roy Engineering College - [BCREC], Durgapur', 'placement@bcetdgp.ac.in', 'West Bengal'),
(129, 'Bengal College of Engineering - [BCE], Durgapur', 'bipul.chanda@bcrec.ac.in,tpo.kol@bcrec.ac.in', 'West Bengal'),
(130, 'The New Horizons Institute of Technology - [NHIT], Durgapur', 'placement@bcetdgp.ac.in', 'West Bengal'),
(131, 'Kanad Institute of Engineering and Management - [KIEM], Durgapur', 'info@nhit.in', 'West Bengal'),
(132, 'Sanaka Educational Trust\'s Group of Institutions- [SETGOI], Durgapur', 'priyasha.kanad@gmail.com', 'West Bengal'),
(133, 'Institute of Engineering and Industrial Technology, Durgapur', '', 'West Bengal'),
(134, 'NSHM Knowledge Campus, Durgapur', 'educationiiet@gmail.com', 'West Bengal'),
(135, 'National School of Management Studies, Durgapur', 'contactus@nshm.com', 'West Bengal'),
(136, 'Durgapur Institute of Advanced Technology & Management - [DIATM], Durgapur', 'nsmsdc@gmail.com', 'West Bengal'),
(137, 'National Power Training Institute - [NPTI], Durgapur', 'tpo.diatm@rahul.ac.in', 'West Bengal'),
(138, 'National Institute of Management - [NIM], Durgapur', 'nptidurgapur@npti.in', 'West Bengal'),
(139, 'ABS Academy of Polytechnic, Durgapur', 'nim_management@rediffmail.com', 'West Bengal'),
(140, 'Santiniketan Polytechnic, Durgapur', 'info@absacademy.com ', 'West Bengal'),
(141, 'Techno Polytechnic, Durgapur', 'santiniketanpolytechnicdgp@gmail.com', 'West Bengal'),
(142, 'Bengal College of Polytechnic - [BCP], Durgapur', 'tip.durgapur@gmail.com', 'West Bengal'),
(143, 'Durgapur Polytechnic College - [DPC], Durgapur', '', 'West Bengal'),
(144, 'Luthfaa Polytechnic Institute, Durgapur', 'dsetao@gmail.com,durgapurpolytechnic@gmail.com', 'West Bengal'),
(145, 'Dr. B.C. Roy Polytechnic- [BCRP], Durgapur', 'sanjibm4@gmail.com', 'West Bengal'),
(146, 'Durgapur Institute of Polytechnic, Durgapur', 'tpo.kol@bcrec.ac.in,bipul.chanda@bcrec.ac.in ', 'West Bengal'),
(147, 'Rajendranath College of Polytechnic - [RCP], Durgapur', 'dip@rahul.ac.in', 'West Bengal'),
(148, 'Asansol Engineering College - [AEC], Asansol', 'principal@rpcollege.ind.in', 'West Bengal'),
(149, 'Asansol Polytechnic - [AP], Asansol', 'principal@aecwb.edu.in', 'West Bengal'),
(150, 'Kazi Nazrul University - [KNU], Asansol', 'asansolpolytechnic_mes@yahoo.com\n', 'West Bengal'),
(151, 'Asansol Institute of Engineering and Management Polytechnic - [AIEM-P], Asansol', ' tpo@knu.ac.in', 'West Bengal'),
(152, 'Kanyapur Polytechnic, Asansol', 'placement.aiemp2021@gmail.com ', 'West Bengal'),
(153, 'Salbani Institute of Technology - [SIT], Asansol', 'principal_kanyapurpolytechnic@rediffmail.com', 'West Bengal'),
(154, 'N.S. Polytechnic College - [NSPC], Bundwan', 'sit.salbani@gmail.com', 'West Bengal'),
(155, 'Institute of Science & Technology - [IST] Paschim Medinipur, Chandrakona', 'tponspc@gmail.com', 'West Bengal'),
(156, 'Ramkrishna Mahato Government Engineering College, Purulia', ' info@gasonline.org.in, hr@gasonline.org.in', 'West Bengal'),
(157, 'Sidho Kanho Birsha University-[SKBU], Purulia', 'tpo@rkmgec.ac.in', 'West Bengal'),
(158, 'Raghunathpur Government Polytechnic, Purulia', '', 'West Bengal'),
(159, 'Camellia Institute of Polytechnic - [CIP], Purulia', 'rgpoly.2016@gmail.com', 'West Bengal'),
(160, 'Purulia Polytechnic, Purulia', 'cipinfo@cip.net.in,registrar.camellia@gmail.com,ciprajkumar@gmail.com', 'West Bengal'),
(161, 'Bundwan Polytechnic, Purulia', 'purupoly@gmail.com ', 'West Bengal'),
(162, 'Baghmundi Government Polytechnic, Purulia', 'bndpoly@gmail.com', 'West Bengal'),
(163, 'Bengal Institute of Technology and Management - [BITM], Santiniketan', 'bgmdpoly@gmail.com', 'West Bengal'),
(164, 'Aryabhatta Institute of Engineering and Management - [AIEMD], Burwan', 'info@bitm.org.in,', 'West Bengal'),
(165, 'University Institute of Technology, University Of Burdwan - [UIT], Bardhaman', 'aiemd_tpo@yahoo.co.in,info@aiemd.in,aiemdcode171@rediffmail.com,mssce@aiemd.in', 'West Bengal'),
(166, 'Camellia Institute of Engineering and Technology - [CIET], Bardhaman', 'principal@uit.buruniv.ac.in, placement@uit.buruniv.ac.in, uitbuburdwan@yahoo.co.in', 'West Bengal'),
(167, 'Cambridge institute of technology', 'tnp.ciet.cip@gmail.com', 'West Bengal'),
(168, 'Jalpaiguri Government Engineering College', 'nm1231@gmail.com', 'West Bengal'),
(169, 'Kalyani Government Engineering College', 'tnp_kgec@kgec.edu.in', 'West Bengal'),
(170, 'Haldia Institute of Technology', 'kgp_hit123@sanchamet.in', 'West Bengal'),
(171, 'Institute of Engineering and Management', 'admin@iemcal.com', 'West Bengal'),
(172, 'Bankura Unnayani Institute of Technology', 'amrita.mukherjee@gmail.com', 'West Bengal'),
(173, 'Murshidabad College of Engineering & Technology', 'placementmcet@yahoo.in', 'West Bengal'),
(174, 'College of Engineering and Management,Kolaghat', 'tpo.cemk@gmail.com', 'West Bengal'),
(175, 'Asansol Engineering College', 'principal.aecwb@gmail.com', 'West Bengal'),
(176, 'Netaji Subash Engineering College', 'principal_nsec@rediffmail.com', 'West Bengal'),
(177, 'Government College of Engineering and Textile Technology,Serampore', '', 'West Bengal'),
(178, 'Government College of Engineering and Textile Technology,Berhampore', 'gcettbcse@gmail.com', 'West Bengal'),
(179, 'Government College of Engineering and LeatherTechnology.', 'trg_placement@gmail.com', 'West Bengal'),
(180, 'Government College of Engineering and Ceramic Technology.', 'gcect@rediffmail.com', 'West Bengal'),
(181, 'BP Poddar Institute of Management &Technology', 'info@bppimt.ac.in', 'West Bengal'),
(182, 'MCKV Institute of Engineering', 'principal@mckvie.edu.in', 'West Bengal'),
(183, 'RCC Institute of Information Technology', 'placement.rcciit@gmail.com', 'West Bengal'),
(184, 'Birbhum Institute of Engineering and Technology', 'tnp@bietsuri.ac.in', 'West Bengal'),
(185, 'Siliguri Institute of Technology', 'sudeepdas26@gmail.com', 'West Bengal'),
(186, 'DR.B.C.Roy Engineering College,Durgapur', 'tpo.kol@bcrec.ac.in', 'West Bengal'),
(187, 'Bengal Institute of Technology', 'adimission@technoindiagroup.com', 'West Bengal'),
(188, 'St Thomas College of Engineering and Technology', 'stcet@stcet.ac.in/info@stcet.ac.in', 'West Bengal'),
(189, 'JIS College of Engineering', 'info.jiscollege@jisgroup.org', 'West Bengal'),
(190, 'Gupta College of Technological Sciences,Asansol', 'placement.gcts@gmail.com', 'West Bengal'),
(191, 'Bengal College of Engineering & Technology', 'placement@bcetdgp.ac.in', 'West Bengal'),
(192, 'Heritage Institute of Technology', 'placement@heritageit.edu', 'West Bengal'),
(193, 'Narula Institute of Technology', 'info@nit.ac.in', 'West Bengal'),
(194, 'Bharatiya Vidya Bhavan Institute of Management Science', 'admin@bimskol.org', 'West Bengal'),
(195, 'Techno India', 'admission@technoindiagroup.com', 'West Bengal'),
(196, 'Dumkal Institute of Engineering and Technology', 'dietnet@hotmail.com', 'West Bengal'),
(197, 'Bholananda National academy', 'bnv_bkp2005@yahoo.co.in', 'West Bengal'),
(198, 'George College', 'enquiry@georgecollege.org', 'West Bengal'),
(199, 'Gitaram Institute of Management', 'gitaram.institute2000@gmail.com', 'West Bengal'),
(200, 'Army Institute of Management', 'placement_cell@aim.ac.in', 'West Bengal'),
(201, 'Institute of Business Management and Research', '', 'West Bengal'),
(202, 'Meghnad Saha Institute of Technology', 'info@msitcollege.org', 'West Bengal'),
(203, 'Guru Nanak Institute of Technology', 'info.gnit@jisgroup.org', 'West Bengal'),
(204, 'Neotia Institute of Technology ,Management & Science', 'sunanda.sinha@nitmas.edu.in', 'West Bengal'),
(205, 'Techno India Institute of Technology', 'tictplacementcell@yahoo.com', 'West Bengal'),
(206, 'Future Institute of Engineering and Management', 'fiem.placement.head@teamfuture.in', 'West Bengal'),
(207, 'NSHM College of Management and Technology', 'director.CRTT@nshm.com', 'West Bengal'),
(208, 'Nopany Institute of Management Studies', 'info@nims.ac.in', 'West Bengal'),
(209, 'Techno India(Hooghly Campus)', 'placement@technoindiahooghly.org', 'West Bengal'),
(210, 'Syamaprasad Institute of Technology & Management', 'siae.edu@gmail.com', 'West Bengal'),
(211, 'Dinabandhu Andrews Institute of Technology & Management', 'info@daitm.org.in', 'West Bengal'),
(212, 'Durgapur Institute of Advanced Technology and Management', 'tpo.diatm@rahul.ac.in', 'West Bengal'),
(213, 'Pailan College of Management and Technology', 'saikat.ganguly@pcmt-india.net', 'West Bengal'),
(214, 'National Power Training Institute', 'durgapur.nptier@gmail.com', 'West Bengal'),
(215, 'Mallabhum Institute of Technology', 'tnpcell@mitbishnupur.ac.in', 'West Bengal'),
(216, 'Bengal Institute of Technology and Management', 'director@bitm.org.in', 'West Bengal'),
(217, 'George College of Management and Science', 'enquiry@georgecollege.org', 'West Bengal'),
(218, 'Calcutta Institute of Engineering and Management', 'info@ciem.ac.in', 'West Bengal'),
(219, 'Management Institute of Durgapur', 'spdutta@rahul.ac.in', 'West Bengal'),
(220, 'Saroj Mohan institute of Technology', 'tpo.degree@smitgp.edu.in', 'West Bengal'),
(221, 'Academy of Technology', 'placement@aot.edu.in', 'West Bengal'),
(222, 'IMPS College of Engineering & Technology', 'impscet.tpo@gmail.com', 'West Bengal'),
(223, 'Aryabhatta Institute of Engineering and Management,Durgapur', 'info@aiemd.org', 'West Bengal'),
(224, 'Kingston School of Management and Science', 'keduins@gmail.com', 'West Bengal'),
(225, 'Haldia Institute of Management', 'him.2004@rediffmail.co', 'West Bengal'),
(226, 'Hooghly Engineering and Technology College', 'tpo.hetc@gmail.com', 'West Bengal'),
(227, 'Calcutta Institute of Technology', 'placement@bciedu.org', 'West Bengal'),
(228, 'International Institute of Management Sciences', '', 'West Bengal'),
(229, 'Institute of Science and Technology', 'tpo@estonline.org.in', 'West Bengal'),
(230, 'Eastern Institute for Integrated Learning in Management', 'corporateeiilm18@gmail.com', 'West Bengal'),
(231, 'Techno India College of Technology,Newtown', 'tictplacementcell@yahoo.com', 'West Bengal'),
(232, 'Global Institute of Science and Technology', 'info@gisthaldia.org', 'West Bengal'),
(233, 'Bengal School of Technology and Management', '', 'West Bengal'),
(234, 'Institute of Management Study', 'p3.sengupta@gmail.com', 'West Bengal'),
(235, 'Advanced Information and  Management Studies', 'response@aimssyndicate.org', 'West Bengal'),
(236, 'The Calcutta Anglo Gujarati College', '', 'West Bengal'),
(237, 'Kotibarsha Institute of Technology & Management', 'info@kitm.net.in', 'West Bengal'),
(238, 'Seacom Engineering College', 'principal@seacomengineering.org ', 'West Bengal'),
(239, 'Dream Institute of Technology', 'placement@dreaminstituteonline.com', 'West Bengal'),
(240, 'Institute of Genetic Engineering', 'career.ige@gmail.com', 'West Bengal'),
(241, 'Tamralipta institute of Management&Technology', 'timt.institute@gmail', 'West Bengal'),
(242, 'The Heritage Academy', 'admin@tha.edu.in', 'West Bengal'),
(243, 'Seacom Management College', 'seacommanagement@rediffmail.com', 'West Bengal'),
(244, 'NIMAS', 'nimas.admission@gmail.com', 'West Bengal'),
(245, 'ABS Academy of Science,Technology & Management', 'info@absacademy.com', 'West Bengal'),
(246, 'Prajnananada Institute of Technology and Management', 'info@pitmkol.in', 'West Bengal'),
(247, 'Gurukul Management Studies', 'gurukul221@gmail.com', 'West Bengal'),
(248, 'Techno India - Kolkata', 'info@ticollege.ac.in', 'West Bengal'),
(249, 'Durgapur Institute of Science,Technology and Management', 'support@youth4work.com', 'West Bengal'),
(250, 'Camellia Institute of Technology', 'director@camelliait.ac.in', 'West Bengal'),
(251, 'Camellia School of Business Management', '', 'West Bengal'),
(252, 'Greater Kolkata College of Engineering and Management', 'info@gkcem.ac.in', 'West Bengal'),
(253, 'Camellia School of Engineering and Technology', 'admin@cset.org.in', 'West Bengal'),
(254, 'Abacus Institute of Engineering and Management', 'abacus.institute@jisgroup.org', 'West Bengal'),
(255, 'Swami Vivekananda Institute of Science and Technology', 'contact@svist.org', 'West Bengal'),
(256, 'Techno India - Banipur', 'admission@technoindiagroup.com', 'West Bengal'),
(257, 'Swami Vivekananda Institute of Management and Computer Science', 'mbaplacement1@gmail.com', 'West Bengal'),
(258, 'Kanad Institute of Engineering and Management', 'info@besonline.in', 'West Bengal'),
(259, 'Supreme Knowledege Foundation Group of Institution', 'mankundu@skf.edu.in', 'West Bengal'),
(260, 'Techno India - Durgapur', 'tigps.durgapur@gmail.com', 'West Bengal'),
(261, 'Dr.Sudhir Chandra Sur Degree Engineering College', 'info@dsec.ac.in', 'West Bengal'),
(262, 'Camellia Institute of Technology and Management', 'citmhooghly09@gmail.com', 'West Bengal'),
(263, 'Techno India - Balurghat', 'enquiry@technoindiagroup.com', 'West Bengal'),
(264, 'Global Institute of Management and Technology', 'tpo@gimt-india.com', 'West Bengal'),
(265, 'Surendra Institute of Engineering and Management', 'info@siemsiliguri.org', 'West Bengal'),
(266, 'Regent Education &Research Foundation group of Institutions', 'registrar@regent.ac.in', 'West Bengal'),
(267, '', '', ''),
(268, '', '', ''),
(269, '', '', ''),
(270, '', '', ''),
(271, '', '', ''),
(272, '', '', ''),
(273, '', '', ''),
(274, '', '', ''),
(275, '', '', ''),
(276, '', '', ''),
(277, '', '', ''),
(278, '', '', ''),
(279, '', '', ''),
(280, '', '', ''),
(281, '', '', ''),
(282, '', '', ''),
(283, '', '', ''),
(284, '', '', ''),
(285, '', '', ''),
(286, '', '', ''),
(287, '', '', ''),
(288, '', '', ''),
(289, '', '', ''),
(290, '', '', ''),
(291, '', '', ''),
(292, '', '', ''),
(293, '', '', ''),
(294, '', '', ''),
(295, '', '', ''),
(296, '', '', ''),
(297, '', '', ''),
(298, '', '', ''),
(299, '', '', ''),
(300, '', '', ''),
(301, '', '', ''),
(302, '', '', ''),
(303, '', '', ''),
(304, '', '', ''),
(305, '', '', ''),
(306, '', '', ''),
(307, '', '', ''),
(308, '', '', ''),
(309, '', '', ''),
(310, '', '', ''),
(311, '', '', ''),
(312, '', '', ''),
(313, '', '', ''),
(314, '', '', ''),
(315, '', '', ''),
(316, '', '', ''),
(317, '', '', ''),
(318, '', '', ''),
(319, '', '', ''),
(320, '', '', ''),
(321, '', '', ''),
(322, '', '', ''),
(323, '', '', ''),
(324, '', '', ''),
(325, '', '', ''),
(326, '', '', ''),
(327, '', '', ''),
(328, '', '', ''),
(329, '', '', ''),
(330, '', '', ''),
(331, '', '', ''),
(332, '', '', ''),
(333, '', '', ''),
(334, '', '', ''),
(335, '', '', ''),
(336, '', '', ''),
(337, '', '', ''),
(338, '', '', ''),
(339, '', '', ''),
(340, '', '', ''),
(341, '', '', ''),
(342, '', '', ''),
(343, '', '', ''),
(344, '', '', ''),
(345, '', '', ''),
(346, '', '', ''),
(347, '', '', ''),
(348, '', '', ''),
(349, '', '', ''),
(350, '', '', ''),
(351, '', '', ''),
(352, '', '', ''),
(353, '', '', ''),
(354, '', '', ''),
(355, '', '', ''),
(356, '', '', ''),
(357, '', '', ''),
(358, '', '', ''),
(359, '', '', ''),
(360, '', '', ''),
(361, '', '', ''),
(362, '', '', ''),
(363, '', '', ''),
(364, '', '', ''),
(365, '', '', ''),
(366, '', '', ''),
(367, '', '', ''),
(368, '', '', ''),
(369, '', '', ''),
(370, '', '', ''),
(371, '', '', ''),
(372, '', '', ''),
(373, '', '', ''),
(374, '', '', ''),
(375, '', '', ''),
(376, '', '', ''),
(377, '', '', ''),
(378, '', '', ''),
(379, '', '', ''),
(380, '', '', ''),
(381, '', '', ''),
(382, '', '', ''),
(383, '', '', ''),
(384, '', '', ''),
(385, '', '', ''),
(386, '', '', ''),
(387, '', '', ''),
(388, '', '', ''),
(389, '', '', ''),
(390, '', '', ''),
(391, '', '', ''),
(392, '', '', ''),
(393, '', '', ''),
(394, '', '', ''),
(395, '', '', ''),
(396, '', '', ''),
(397, '', '', ''),
(398, '', '', ''),
(399, '', '', ''),
(400, '', '', ''),
(401, '', '', ''),
(402, '', '', ''),
(403, '', '', ''),
(404, '', '', ''),
(405, '', '', ''),
(406, '', '', ''),
(407, '', '', ''),
(408, '', '', ''),
(409, '', '', ''),
(410, '', '', ''),
(411, '', '', ''),
(412, '', '', ''),
(413, '', '', ''),
(414, '', '', ''),
(415, '', '', ''),
(416, '', '', ''),
(417, '', '', ''),
(418, '', '', ''),
(419, '', '', ''),
(420, '', '', ''),
(421, '', '', ''),
(422, '', '', ''),
(423, '', '', ''),
(424, '', '', ''),
(425, '', '', ''),
(426, '', '', ''),
(427, '', '', ''),
(428, '', '', ''),
(429, '', '', ''),
(430, '', '', ''),
(431, '', '', ''),
(432, '', '', ''),
(433, '', '', ''),
(434, '', '', ''),
(435, '', '', ''),
(436, '', '', ''),
(437, '', '', ''),
(438, '', '', ''),
(439, '', '', ''),
(440, '', '', ''),
(441, '', '', ''),
(442, '', '', ''),
(443, '', '', ''),
(444, '', '', ''),
(445, '', '', ''),
(446, '', '', ''),
(447, '', '', ''),
(448, '', '', ''),
(449, '', '', ''),
(450, '', '', ''),
(451, '', '', ''),
(452, '', '', ''),
(453, '', '', ''),
(454, '', '', ''),
(455, '', '', ''),
(456, '', '', ''),
(457, '', '', ''),
(458, '', '', ''),
(459, '', '', ''),
(460, '', '', ''),
(461, '', '', ''),
(462, '', '', ''),
(463, '', '', ''),
(464, '', '', ''),
(465, '', '', ''),
(466, '', '', ''),
(467, '', '', ''),
(468, '', '', ''),
(469, '', '', ''),
(470, '', '', ''),
(471, '', '', ''),
(472, '', '', ''),
(473, '', '', ''),
(474, '', '', ''),
(475, '', '', ''),
(476, '', '', ''),
(477, '', '', ''),
(478, '', '', ''),
(479, '', '', ''),
(480, '', '', ''),
(481, '', '', ''),
(482, '', '', ''),
(483, '', '', ''),
(484, '', '', ''),
(485, '', '', ''),
(486, '', '', ''),
(487, '', '', ''),
(488, '', '', ''),
(489, '', '', ''),
(490, '', '', ''),
(491, '', '', ''),
(492, '', '', ''),
(493, '', '', ''),
(494, '', '', ''),
(495, '', '', ''),
(496, '', '', ''),
(497, '', '', ''),
(498, '', '', ''),
(499, '', '', ''),
(500, '', '', ''),
(501, '', '', ''),
(502, '', '', ''),
(503, '', '', ''),
(504, '', '', ''),
(505, '', '', ''),
(506, '', '', ''),
(507, '', '', ''),
(508, '', '', ''),
(509, '', '', ''),
(510, '', '', ''),
(511, '', '', ''),
(512, '', '', ''),
(513, '', '', ''),
(514, '', '', ''),
(515, '', '', ''),
(516, '', '', ''),
(517, '', '', ''),
(518, '', '', ''),
(519, '', '', ''),
(520, '', '', ''),
(521, '', '', ''),
(522, '', '', ''),
(523, '', '', ''),
(524, '', '', ''),
(525, '', '', ''),
(526, '', '', ''),
(527, '', '', ''),
(528, '', '', ''),
(529, '', '', ''),
(530, '', '', ''),
(531, '', '', ''),
(532, '', '', ''),
(533, '', '', ''),
(534, '', '', ''),
(535, '', '', ''),
(536, '', '', ''),
(537, '', '', ''),
(538, '', '', ''),
(539, '', '', ''),
(540, '', '', ''),
(541, '', '', ''),
(542, '', '', ''),
(543, '', '', ''),
(544, '', '', ''),
(545, '', '', ''),
(546, '', '', ''),
(547, '', '', ''),
(548, '', '', ''),
(549, '', '', ''),
(550, '', '', ''),
(551, '', '', ''),
(552, '', '', ''),
(553, '', '', ''),
(554, '', '', ''),
(555, '', '', ''),
(556, '', '', ''),
(557, '', '', ''),
(558, '', '', ''),
(559, '', '', ''),
(560, '', '', ''),
(561, '', '', ''),
(562, '', '', ''),
(563, '', '', ''),
(564, '', '', ''),
(565, '', '', ''),
(566, '', '', ''),
(567, '', '', ''),
(568, '', '', ''),
(569, '', '', ''),
(570, '', '', ''),
(571, '', '', ''),
(572, '', '', ''),
(573, '', '', ''),
(574, '', '', ''),
(575, '', '', ''),
(576, '', '', ''),
(577, '', '', ''),
(578, '', '', ''),
(579, '', '', ''),
(580, '', '', ''),
(581, '', '', ''),
(582, '', '', ''),
(583, '', '', ''),
(584, '', '', ''),
(585, '', '', ''),
(586, '', '', ''),
(587, '', '', ''),
(588, '', '', ''),
(589, '', '', ''),
(590, '', '', ''),
(591, '', '', ''),
(592, '', '', ''),
(593, '', '', ''),
(594, '', '', ''),
(595, '', '', ''),
(596, '', '', ''),
(597, '', '', ''),
(598, '', '', ''),
(599, '', '', ''),
(600, '', '', ''),
(601, '', '', ''),
(602, '', '', ''),
(603, '', '', ''),
(604, '', '', ''),
(605, '', '', ''),
(606, '', '', ''),
(607, '', '', ''),
(608, '', '', ''),
(609, '', '', ''),
(610, '', '', ''),
(611, '', '', ''),
(612, '', '', ''),
(613, '', '', ''),
(614, '', '', ''),
(615, '', '', ''),
(616, '', '', ''),
(617, '', '', ''),
(618, '', '', ''),
(619, '', '', ''),
(620, '', '', ''),
(621, '', '', ''),
(622, '', '', ''),
(623, '', '', ''),
(624, '', '', ''),
(625, '', '', ''),
(626, '', '', ''),
(627, '', '', ''),
(628, '', '', ''),
(629, '', '', ''),
(630, '', '', ''),
(631, '', '', ''),
(632, '', '', ''),
(633, '', '', ''),
(634, '', '', ''),
(635, '', '', ''),
(636, '', '', ''),
(637, '', '', ''),
(638, '', '', ''),
(639, '', '', ''),
(640, '', '', ''),
(641, '', '', ''),
(642, '', '', ''),
(643, '', '', ''),
(644, '', '', ''),
(645, '', '', ''),
(646, '', '', ''),
(647, '', '', ''),
(648, '', '', ''),
(649, '', '', ''),
(650, '', '', ''),
(651, '', '', ''),
(652, '', '', ''),
(653, '', '', ''),
(654, '', '', ''),
(655, '', '', ''),
(656, '', '', ''),
(657, '', '', ''),
(658, '', '', ''),
(659, '', '', ''),
(660, '', '', ''),
(661, '', '', ''),
(662, '', '', ''),
(663, '', '', ''),
(664, '', '', ''),
(665, '', '', ''),
(666, '', '', ''),
(667, '', '', ''),
(668, '', '', ''),
(669, '', '', ''),
(670, '', '', ''),
(671, '', '', ''),
(672, '', '', ''),
(673, '', '', ''),
(674, '', '', ''),
(675, '', '', ''),
(676, '', '', ''),
(677, '', '', ''),
(678, '', '', ''),
(679, '', '', ''),
(680, '', '', ''),
(681, '', '', ''),
(682, '', '', ''),
(683, '', '', ''),
(684, '', '', ''),
(685, '', '', ''),
(686, '', '', ''),
(687, '', '', ''),
(688, '', '', ''),
(689, '', '', ''),
(690, '', '', ''),
(691, '', '', ''),
(692, '', '', ''),
(693, '', '', ''),
(694, '', '', ''),
(695, '', '', ''),
(696, '', '', ''),
(697, '', '', ''),
(698, '', '', ''),
(699, '', '', ''),
(700, '', '', ''),
(701, '', '', ''),
(702, '', '', ''),
(703, '', '', ''),
(704, '', '', ''),
(705, '', '', ''),
(706, '', '', ''),
(707, '', '', ''),
(708, '', '', ''),
(709, '', '', ''),
(710, '', '', ''),
(711, '', '', ''),
(712, '', '', ''),
(713, '', '', ''),
(714, '', '', ''),
(715, '', '', ''),
(716, '', '', ''),
(717, '', '', ''),
(718, '', '', ''),
(719, '', '', ''),
(720, '', '', ''),
(721, '', '', ''),
(722, '', '', ''),
(723, '', '', ''),
(724, '', '', ''),
(725, '', '', ''),
(726, '', '', ''),
(727, '', '', ''),
(728, '', '', ''),
(729, '', '', ''),
(730, '', '', ''),
(731, '', '', ''),
(732, '', '', ''),
(733, '', '', ''),
(734, '', '', ''),
(735, '', '', ''),
(736, '', '', ''),
(737, '', '', ''),
(738, '', '', ''),
(739, '', '', ''),
(740, '', '', ''),
(741, '', '', ''),
(742, '', '', ''),
(743, '', '', ''),
(744, '', '', ''),
(745, '', '', ''),
(746, '', '', ''),
(747, '', '', ''),
(748, '', '', ''),
(749, '', '', ''),
(750, '', '', ''),
(751, '', '', ''),
(752, '', '', ''),
(753, '', '', ''),
(754, '', '', ''),
(755, '', '', ''),
(756, '', '', ''),
(757, '', '', ''),
(758, '', '', ''),
(759, '', '', ''),
(760, '', '', ''),
(761, '', '', ''),
(762, '', '', ''),
(763, '', '', ''),
(764, '', '', ''),
(765, '', '', ''),
(766, '', '', ''),
(767, '', '', ''),
(768, '', '', ''),
(769, '', '', ''),
(770, '', '', ''),
(771, '', '', ''),
(772, '', '', ''),
(773, '', '', ''),
(774, '', '', ''),
(775, '', '', ''),
(776, '', '', ''),
(777, '', '', ''),
(778, '', '', ''),
(779, '', '', ''),
(780, '', '', ''),
(781, '', '', ''),
(782, '', '', ''),
(783, '', '', ''),
(784, '', '', ''),
(785, '', '', ''),
(786, '', '', ''),
(787, '', '', ''),
(788, '', '', ''),
(789, '', '', ''),
(790, '', '', ''),
(791, '', '', ''),
(792, '', '', ''),
(793, '', '', ''),
(794, '', '', ''),
(795, '', '', ''),
(796, '', '', ''),
(797, '', '', ''),
(798, '', '', ''),
(799, '', '', ''),
(800, '', '', ''),
(801, '', '', ''),
(802, '', '', ''),
(803, '', '', ''),
(804, '', '', ''),
(805, '', '', ''),
(806, '', '', ''),
(807, '', '', ''),
(808, '', '', ''),
(809, '', '', ''),
(810, '', '', ''),
(811, '', '', ''),
(812, '', '', ''),
(813, '', '', ''),
(814, '', '', ''),
(815, '', '', ''),
(816, '', '', ''),
(817, '', '', ''),
(818, '', '', ''),
(819, '', '', ''),
(820, '', '', ''),
(821, '', '', ''),
(822, '', '', ''),
(823, '', '', ''),
(824, '', '', ''),
(825, '', '', ''),
(826, '', '', ''),
(827, '', '', ''),
(828, '', '', ''),
(829, '', '', ''),
(830, '', '', ''),
(831, '', '', ''),
(832, '', '', ''),
(833, '', '', ''),
(834, '', '', ''),
(835, '', '', ''),
(836, '', '', ''),
(837, '', '', ''),
(838, '', '', ''),
(839, '', '', ''),
(840, '', '', ''),
(841, '', '', ''),
(842, '', '', ''),
(843, '', '', ''),
(844, '', '', ''),
(845, '', '', ''),
(846, '', '', ''),
(847, '', '', ''),
(848, '', '', ''),
(849, '', '', ''),
(850, '', '', ''),
(851, '', '', ''),
(852, '', '', ''),
(853, '', '', ''),
(854, '', '', ''),
(855, '', '', ''),
(856, '', '', ''),
(857, '', '', ''),
(858, '', '', ''),
(859, '', '', ''),
(860, '', '', ''),
(861, '', '', ''),
(862, '', '', ''),
(863, '', '', ''),
(864, '', '', ''),
(865, '', '', ''),
(866, '', '', ''),
(867, '', '', ''),
(868, '', '', ''),
(869, '', '', ''),
(870, '', '', ''),
(871, '', '', ''),
(872, '', '', ''),
(873, '', '', ''),
(874, '', '', ''),
(875, '', '', ''),
(876, '', '', ''),
(877, '', '', ''),
(878, '', '', ''),
(879, '', '', ''),
(880, '', '', ''),
(881, '', '', ''),
(882, '', '', ''),
(883, '', '', ''),
(884, '', '', ''),
(885, '', '', ''),
(886, '', '', ''),
(887, '', '', ''),
(888, '', '', ''),
(889, '', '', ''),
(890, '', '', ''),
(891, '', '', ''),
(892, '', '', ''),
(893, '', '', ''),
(894, '', '', ''),
(895, '', '', ''),
(896, '', '', ''),
(897, '', '', ''),
(898, '', '', ''),
(899, '', '', ''),
(900, '', '', ''),
(901, '', '', ''),
(902, '', '', ''),
(903, '', '', ''),
(904, '', '', ''),
(905, '', '', ''),
(906, '', '', ''),
(907, '', '', ''),
(908, '', '', ''),
(909, '', '', ''),
(910, '', '', ''),
(911, '', '', ''),
(912, '', '', ''),
(913, '', '', ''),
(914, '', '', ''),
(915, '', '', ''),
(916, '', '', ''),
(917, '', '', ''),
(918, '', '', ''),
(919, '', '', ''),
(920, '', '', ''),
(921, '', '', ''),
(922, '', '', ''),
(923, '', '', ''),
(924, '', '', ''),
(925, '', '', ''),
(926, '', '', ''),
(927, '', '', ''),
(928, '', '', ''),
(929, '', '', ''),
(930, '', '', ''),
(931, '', '', ''),
(932, '', '', ''),
(933, '', '', ''),
(934, '', '', ''),
(935, '', '', ''),
(936, '', '', ''),
(937, '', '', ''),
(938, '', '', ''),
(939, '', '', ''),
(940, '', '', ''),
(941, '', '', ''),
(942, '', '', ''),
(943, '', '', ''),
(944, '', '', ''),
(945, '', '', ''),
(946, '', '', ''),
(947, '', '', ''),
(948, '', '', ''),
(949, '', '', ''),
(950, '', '', ''),
(951, '', '', ''),
(952, '', '', ''),
(953, '', '', ''),
(954, '', '', ''),
(955, '', '', ''),
(956, '', '', ''),
(957, '', '', ''),
(958, '', '', ''),
(959, '', '', ''),
(960, '', '', ''),
(961, '', '', ''),
(962, '', '', ''),
(963, '', '', ''),
(964, '', '', ''),
(965, '', '', ''),
(966, '', '', ''),
(967, '', '', ''),
(968, '', '', ''),
(969, '', '', ''),
(970, '', '', ''),
(971, '', '', ''),
(972, '', '', ''),
(973, '', '', ''),
(974, '', '', ''),
(975, '', '', ''),
(976, '', '', ''),
(977, '', '', ''),
(978, '', '', ''),
(979, '', '', ''),
(980, '', '', ''),
(981, '', '', ''),
(982, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `batch_start` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `placement_support` varchar(10) DEFAULT NULL,
  `certificate_available` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `description`, `duration`, `batch_start`, `price`, `discount_price`, `placement_support`, `certificate_available`) VALUES
(1, 'Full Stack Development', 'Become a full stack developer with job-ready skills', '6 months', '7th Dec', 45000, 34999, 'Yes', 'Yes'),
(2, 'Artificial Intelligence & ML', 'Build smart AI apps using ML concepts', '8 weeks', '15th Dec', 9999, 4999, 'No', 'Yes');

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
(2, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'AutoCad', NULL, NULL, NULL, '2026-02-10 14:04:31', 'Approved'),
(3, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'AutoCad', NULL, NULL, NULL, '2026-02-10 14:06:10', NULL),
(4, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:07:14', NULL),
(5, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2024, NULL, 'AutoCad', NULL, NULL, NULL, '2026-02-10 14:08:00', NULL),
(6, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2024, NULL, 'AutoCad', NULL, NULL, NULL, '2026-02-10 14:09:04', NULL),
(7, 'Soumen Jana', 'soumenj303@gmail.com', '09641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:09:46', NULL),
(8, 'Soumen Jana', 'soumenj303@gmail.com', '9641808133', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'Fullstack', NULL, NULL, NULL, '2026-02-10 14:11:37', NULL),
(9, 's', 'abcdddd@gmail.com', '8372145113', NULL, NULL, NULL, 'B.Tech', 2024, NULL, 'Software Testing', NULL, NULL, NULL, '2026-04-01 15:07:48', 'Rejected'),
(10, 'admin\' AND extractvalue(1,concat(0x7e,(select version()))) --', 'avab@gmail.com', '8372045196', NULL, NULL, NULL, 'B.Tech', 2025, NULL, 'SupplyChain', NULL, NULL, NULL, '2026-04-01 15:09:11', NULL);

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
  `end_date` date DEFAULT NULL,
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
  `posted_on` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `template_html` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `template_html`, `created_at`) VALUES
(1, 'College Placemnt Email Invite', '<style></style>', '2026-03-24 07:48:32'),
(2, 'College Placemnt Email Invite', '<style></style>', '2026-03-24 11:14:22');

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
(3, 'Anita ', 'contact@j2c.in', NULL, '7602171906', 'Approved'),
(8, 'Anita Acharjy', 'hr@pcsgpl.com', 'Anita@2000', '8918872645', NULL),
(9, 'SUTANU MONDAL', 'sutanu.mondal@aot.edu.in', '12345', '8372045195', NULL),
(11, 'Anita Acharjya', 'onboard@pcsgpl.com', 'Anita@2000', '7602171909', 'Approved');

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
  `student_email` varchar(150) NOT NULL,
  `applied_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internship_postings`
--

CREATE TABLE `internship_postings` (
  `id` int(11) NOT NULL,
  `employer_email` varchar(150) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `internship_type` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `openings` int(11) DEFAULT NULL,
  `stipend_type` varchar(50) DEFAULT NULL,
  `stipend_amount` int(11) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `responsibilities` text DEFAULT NULL,
  `perks` text DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `posted_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `location` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `internship_postings`
--

INSERT INTO `internship_postings` (`id`, `employer_email`, `title`, `category`, `internship_type`, `duration`, `start_date`, `end_date`, `openings`, `stipend_type`, `stipend_amount`, `skills`, `responsibilities`, `perks`, `additional_info`, `posted_on`, `location`) VALUES
(1, 'contact@j2c.in', 'cvbnbvcvbn', 'Web Development', 'In-office', '3 months', '2025-12-10', NULL, 70, 'Fixed', 0, 'dfghjhgfds', 'cdfghjkjhgfd', 'Certificate, LOR, Certificate, LOR', 'vbnmnbvc', '2025-12-10 12:41:39', NULL),
(2, 'contact@j2c.in', 'web devlopmntbintern', 'Web Development', 'In-office', '3 months', '2026-01-28', NULL, 100, 'Fixed', 10000, 'rtyufgkoko', 'v bnmnbv ', 'Certificate, LOR, 5 Days, Certificate, LOR, 5 Days', 'cvbnm,mnb', '2026-01-28 06:01:08', NULL),
(3, 'contact@j2c.in', 'web devlopmntbintern', 'Web Development', 'In-office', '3 months', '2026-01-28', NULL, 100, 'Fixed', 10000, 'rtyufgkoko', 'v bnmnbv ', 'Certificate, LOR, 5 Days, Certificate, LOR, 5 Days', 'cvbnm,mnb', '2026-01-28 06:01:59', NULL),
(4, 'onboard@pcsgpl.com', 'Brand Manager', 'Marketing', 'In-office', '1 Month', '2026-02-28', NULL, 5, 'Performance Based', 0, 'Event Marketing', 'wwwwwwwwww', 'Certificate, Letter of Recommendation, Informal Dress Code', 'fffffffff', '2026-02-27 17:39:11', 'Allahabad (Prayagraj)'),
(5, 'hr@pcsgpl.com', 'Full Stack Developer', 'IT & Software', 'In-office', '3 Months', '2026-03-01', NULL, 5, 'Performance Based', 2000, 'Java', 'Good i Programming Language.', 'Certificate, Letter of Recommendation', 'jnxkjvhkxhvk', '2026-02-28 05:21:26', 'Kolkata');

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
  `skills` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `internship_registrations`
--

INSERT INTO `internship_registrations` (`id`, `full_name`, `email`, `mobile`, `gender`, `college`, `course`, `branch`, `graduation_year`, `domain`, `duration`, `internship_type`, `resume`, `google_drive_link`, `created_at`, `location`, `skills`) VALUES
(1, 'Anita Acharjya', 'anitaacharjya9539@gmail.com', '7602171906', 'Female', 'buie ', 'btecg', 'cse', '2025', 'Java / Python Development', '1', 'Paid', NULL, 'https://drive.google.com/file/d/1NuYZrgg81dDQ9W1s1f3duMtFZ5Y6k38I/view?usp=drivesdk', '2025-11-11 11:46:21', 'Jhargram', 'C,Java,JDBC,J2EE,MYSQL'),
(2, 'Suman Mondal', 'sumangsv26@gmail.com', '9832077783', 'Male', 'University of Engineering and Management, Kolkata ', 'B.Tech', 'Computer Science and Engineering ', '2025', 'Web Development', '6', 'Paid', NULL, 'https://drive.google.com/file/d/1sx9ZiAs4ptn1q7w0OnP2PVwwumiPmfAe/view?usp=drivesdk', '2025-11-22 04:24:11', NULL, NULL),
(3, '1', 'sfdfs1@gmail.com', '1', 'Male', '1', '1', '1', '2024', 'Web Development', '1111111', 'Paid', NULL, 'https://drive.google.com/file/d/1JNsPkDZPpi8kz_pJWjbxKMjp4S2MB99l/view?usp=drivesdk', '2026-01-02 07:43:08', NULL, NULL),
(4, 'Ranajeet Bera', 'cse23057@cemk.ac.in', '7980322987', 'Male', 'college of engineering and management kolaghat ', 'B.tech', 'Cse', '2027', 'Java / Python Development', '2', 'Paid', NULL, 'https://drive.google.com/file/d/18m8saEZYBbxZ20iz4bzOrHPReJdFbtO5/view?usp=drivesdk', '2026-01-15 04:35:49', NULL, NULL),
(5, 'Shreyasi Ghosh', 'cse23184@ac.in', '933979191', 'Female', 'college of engineering and management ,kolaghat', 'Btech', 'computer science and engineering', '2027', 'Java / Python Development', '3', 'Free', NULL, 'https://drive.google.com/file/d/1moJLixger22KHBZOSoaNCmZS-RJxHo-z/view?usp=drivesdk', '2026-01-15 04:38:05', NULL, NULL),
(6, 'Sania Naz', 'sanianazu786@gmail.com', '8001925659', 'Female', 'College of  Engineering and Management,Kolaghat', 'Btech', 'Computer Science and Engineering', '2027', 'Web Development', '3', 'Free', NULL, 'https://drive.google.com/file/d/1nAz2JSM15XOKYYpR-8sd6LWOeIz0dwHX/view?usp=drivesdk', '2026-01-15 04:40:36', NULL, NULL),
(7, 'Biswajit Kar', 'karriju963@gmail.com', '6296389356', 'Male', 'College of Engineering & Management,Kolaghat', 'B.Tech', 'Computer Science & Engineering ', '2027', 'Java / Python Development', '6', 'Free', NULL, 'https://drive.google.com/file/d/16VCzZYiSQYobVnNyrxaKCkru_B66QgFl/view?usp=drivesdk', '2026-01-15 04:54:48', NULL, NULL),
(8, 'ANJAN CHOWDHURI', 'cse23043@cemk.ac.in', '9907850110', 'Male', 'College of Engineering and management, Kolaghat', 'B-tech', 'Computer Science and Engineering', '2027', 'Java / Python Development', '6', 'Free', NULL, 'https://drive.google.com/file/d/1qmKtRJjAVrZbCR0uvYM1PSo_1Ev_Flif/view?usp=drivesdk', '2026-01-15 04:56:20', NULL, NULL),
(9, 'Amritlal Khanra ', 'cse23014@cemk.ac.in', '8293414116', 'Male', 'College of engineering and management, Kolaghat ', 'Btech', 'Computer science and engineering ', '2027', 'Java / Python Development', '-6', 'Free', NULL, 'https://drive.google.com/file/d/1t4Xy_lKfVRLKPVkQb4f8KCOc0QSjSedl/view?usp=drivesdk', '2026-01-15 05:01:00', NULL, NULL),
(10, 'SK SAHANOWAJ', 'sksahanowaj046@gmail.com', '8967715443', 'Male', 'COLLEGE OF ENGINEERING AND MANAGEMENT KOLAGHAT', 'BTECH', 'COMPUTER SCIENCE AND ENGINEERING', '2027', 'Java / Python Development', '6', 'Free', NULL, 'https://drive.google.com/file/d/1LaaBH7f0JKF093g-0ysVbY_mfiwbgD5d/view?usp=drivesdk', '2026-01-15 13:55:42', NULL, NULL),
(11, 'Swarnadip Patra', 'swarnadippatra1812@gmail.com', '7029705034', 'Male', 'College of Engineering and Management, Kolaghat', 'B.Tech', 'Computer Science and Engineering', '2027', 'Java / Python Development', '6', 'Paid', NULL, 'https://drive.google.com/file/d/18YGCkzFpN_ERP4yR9kpLKcv1uxoMZyg6/view?usp=drivesdk', '2026-01-16 13:16:26', NULL, NULL),
(12, 'Anita Acharjya', 'anitaacharjya@gmail.com', '7602171906', 'Female', 'buie ', 'B.Tech', 'Computer Science', '2023', 'Web Development', '6', 'Paid', NULL, 'https://drive.google.com/file/d/1HSoxVCMskVnJRv-cKWZeWc66GH5R2lrl/view?usp=drivesdk', '2026-02-05 12:00:46', NULL, NULL),
(13, 'Anita Acharjya', 'anit@gmail.com', '7602171906', 'Female', 'buie ', 'B.Tech', 'Computer Science', '2023', 'Web Development', '6', 'Paid', NULL, NULL, '2026-02-05 13:49:23', NULL, NULL),
(14, 'Shibu Kumar', 'shibukumar9000@gmail.com', '8002659429', 'Male', 'Asansol Engineering College', 'B.Tech', 'Information Technology', '2025', 'Data Analytics', '6', NULL, NULL, 'https://drive.google.com/file/d/1wEUMbiX_09v3NGNJljcptqpZY4XTOvhV/view?usp=drivesdk', '2026-02-23 09:16:09', 'kolkata', '28');

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
  `notice_period` varchar(45) DEFAULT NULL,
  `current_designation` varchar(100) DEFAULT NULL,
  `current_company` varchar(150) DEFAULT NULL,
  `current_salary` varchar(50) DEFAULT NULL,
  `profile_last_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobseekers`
--

INSERT INTO `jobseekers` (`id`, `fullname`, `email`, `mobile`, `dob`, `gender`, `location`, `qualification`, `specialization`, `university`, `passing_year`, `linkedin`, `password`, `skills`, `resume`, `photo`, `created_at`, `profile_summary`, `languages_known`, `tenth_board`, `tenth_year`, `tenth_percent`, `twelfth_board`, `twelfth_year`, `twelfth_percent`, `profile_completion`, `portfolio_link`, `total_experience`, `notice_period`, `current_designation`, `current_company`, `current_salary`, `profile_last_updated`) VALUES
(5, 'Kamalnath Velpula ', 'kamalnath645@gmail.com', '9966378413', '2001-02-15', 'Male', 'Bangalore', 'BTech ', 'Electrical and Electronics Engineering ', 'Narayana Engineering College Nellore ', '2023', NULL, '9966378413Ka@', 'CSS, HTML, Java, JavaScript, MySQL, React, Spring Boot, SQL', NULL, NULL, '2025-11-06 15:02:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Pagolu Sravani ', 'pagolusravani970@gmail.com', '8978362387', '2001-01-12', 'Female', 'Guntur ', 'B.pharmacy ', 'Pharmaceuticals science ', 'Acharya Nagarjuna University ', '2022', NULL, 'Ammu@143', 'Full Stack Development', NULL, NULL, '2025-11-11 09:38:59', NULL, NULL, NULL, '2016', '7.0', NULL, '2018', '8.20', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Anita Acharjyaa', 'anitaacharjya9539@gmail.com', '7602171906', '2025-11-16', 'Female', 'Kolkata', 'BTech', 'CSE', 'BUIE', '2023', NULL, 'Anita@2000', 'Accountability', 'https://drive.google.com/file/d/1iV-LDpLSNRKAyMN7jgSbqzCqhjMwkjda/view?usp=drivesdk', 'https://drive.google.com/file/d/1QQgYCKfY1RwHmT0TMFuEmkIR3Tua3WDv/view?usp=drivesdk', '2025-11-16 05:51:33', 'hiii', 'English,Hindi,Bengali', 'WBBSE', '2016', '79', 'WBCHSE', '2018', '90', 0, NULL, '2.5', NULL, NULL, NULL, NULL, NULL),
(8, 'Anita Acharjya', 'anitaachar@gmail.com', '9876543210', '2025-11-16', 'Female', 'Kolkata', 'BTech', 'CSE', 'BUIE', '2023', NULL, 'Anita@2000', 'Accessibility (a11y), Administrative Support, Agile Methodology', 'https://drive.google.com/file/d/1JyC3ELFV_J_M1T8alLkrut5h447Bz6Sk/view?usp=drivesdk', NULL, '2025-11-16 05:57:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Avik Das', 'avikdas8900245198@gmail.com', '8597794746', '2025-11-05', 'Male', 'kolkata', 'B.tech', 'CSE', ' CEMK', '2020', NULL, '1234', 'Administrative Support', 'https://drive.google.com/file/d/1k4rl3D-nzpLxEIbs92X1O6b2F27lBH4M/view?usp=drivesdk', NULL, '2025-11-16 06:57:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Arnab Ghosh', 'arnab4581@gmail.com', '097499999', '2025-11-10', 'Select', 'West Bengal', 'd', 'cse', 'hshhs', '2025', NULL, '12345678', 'Adaptability', 'https://drive.google.com/file/d/1eTH_4QZ9PSxTmyxokvpnCt0m44Q1YPFW/view?usp=drivesdk', NULL, '2025-11-16 06:58:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Arpan Ghosh', 'arpanthe123@gmail.com', '6296981663', '2005-04-13', 'Male', 'Kolaghat', 'B.Tech', 'CSE', 'College of Engineering & Management, Kolaghat', '2026', NULL, 'arpan@123', 'Backend Development', 'https://drive.google.com/file/d/1U9wyP412MJbNx7wsaaEi6HR6RY2lPo1n/view?usp=drivesdk', NULL, '2025-11-16 07:00:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Sudipta Paria', 'sudiptaparia2003@gmail.com', '8509163392', '2003-09-14', 'Female', 'Kolaghat', 'BTech', 'computer science', 'college of engineering and management,kolaghat', '2026', NULL, 'Sudipta@123', 'C', 'https://drive.google.com/file/d/1_59JQt3HJLQ8zZNqpKmCjIxXMXy-PGjG/view?usp=drivesdk', NULL, '2025-11-16 07:00:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'soumitra samanta', 'fake506.soumitra@gmail.com', '7868905436', '2025-11-16', 'Female', 'kolaghat', 'B.Tech', 'CSE', 'CEMK', '2026', NULL, 'soumitra', 'C++', 'https://drive.google.com/file/d/1MfvpbbXd4lcIoavwrCjCUxkC1x7sukUX/view?usp=drivesdk', NULL, '2025-11-16 07:01:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Sayan Sasmal', 'mr.sayansasmal18@gmail.com', '8167753469', '2004-11-25', 'Male', 'Kolaghat, West Bengal', 'B.Tech', 'Computer Science and Engineering', 'College of Engineering and Management, Kolaghat', '2026', NULL, 'suman@99', 'Data Science, Data Structures, Java, Machine Learning, Python', 'https://drive.google.com/file/d/1epMJB-cHd-xnhVGPIOc21RBQ1-mg7gmc/view?usp=drivesdk', NULL, '2025-11-16 07:04:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Subhadip Pal', 'subhadip.pal2k@gmail.com', '09749788063', '2000-05-16', 'Male', 'Kolkata', 'B.Tech', 'CSE', 'CEMk', '2026', NULL, 'Tatai@2000', 'Data Science', 'https://drive.google.com/file/d/1AzWV4HzHJXuxAHWktlHgYRvJVOF52wuK/view?usp=drivesdk', NULL, '2025-11-16 07:05:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'M Hari Kishore', 'hari.kishore2604@gmail.com', '9474446158', '2004-04-26', 'Male', 'Kharagpur', 'B Tech', 'Computer Science', 'College of Engineering & Management, Kolaghat', '2026', NULL, 'hari@j2c2025', 'Automated Testing, Azure, Backend Development, Bash, C, Cloud Computing, Communication, CSS, Docker, Flask, GitHub, GitLab, HTML, Java, JavaScript, Linux, Networking, Public Speaking, Python, React', 'https://drive.google.com/file/d/1iFe2-wpDocogryZXyEzuiIBU61f6KWsB/view?usp=drivesdk', NULL, '2025-11-16 07:06:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Prem', 'mahtopremnath07@gmail.com', '8745846542', '2005-06-15', 'Male', 'Kolaghat', 'B.tech', 'Information Technology', 'CEMK', '2026', NULL, 'Prem@123', 'Java', 'https://drive.google.com/file/d/1TCw220aucQ73pLv5MWheOMxOXrWRKiUq/view?usp=drivesdk', NULL, '2025-11-16 12:22:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'SUSHOVAN BERA ', 'sbera9885@gmail.com', '8101775367', '2003-04-09', 'Male', 'College Of Engineering And Management Kolaghat, kolaghat ', 'B.tech', 'Information Technology', 'College of Engineering and Management, Kolaghat', '2026', NULL, 'Sushovan@123', 'C, Java', 'https://drive.google.com/file/d/1nkhMSnY4M6C_gqqEK7d7ORdttguRJRBq/view?usp=drivesdk', NULL, '2025-11-16 12:23:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'MAHADEB JANA', 'janamahadeb743@gmail.com', '7797204344', '2003-06-07', 'Male', 'Kolaghat,West Bengal', 'B.Tech', 'Electronices and Communication Engineering', 'college Of Engineering And Management, Kolaghat', '2026', NULL, 'Mahdeb009@', 'C', 'https://drive.google.com/file/d/1AoAfSWKaipN4UUXysBsnPS5Z54gGu5hD/view?usp=drivesdk', NULL, '2025-11-16 12:24:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'snehadip', 'biswasd6@gmail.com', '7895677890', '2004-09-01', 'Male', 'kolkata', 'b.tech', 'electrical engineering', 'college of engineering and management ,kolaghat', '2026', NULL, '8436967884', 'Robotics', 'https://drive.google.com/file/d/18hDEQW2dKuAEPz84utQlyErNb4YGvT4M/view?usp=drivesdk', NULL, '2025-11-16 12:25:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'P C Ghosh', 'tpo@cemk.ac.in', '9830319129', '1973-01-01', 'Male', 'KTTP township ,721171', 'B.tech', 'Mechanical engineering ', 'CEMK', '2026', NULL, 'Cemk1234', 'Automated Testing, C++, Java', 'https://drive.google.com/file/d/1tdxPZ_F5ZeDnUn6VRMkp4RuVXgNYOyuB/view?usp=drivesdk', NULL, '2025-11-16 12:28:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Akash Patra', 'akashpatra1040@gmail.com', '9679346861', '2004-11-11', 'Male', 'kolaghat', 'B.Tech', 'Electronics and Communication', '', '2026', NULL, 'akash@j2c', 'C, C++, Data Structures, Embedded Systems, Firmware Development, Internet of Things (IoT), Java, Problem Solving', 'https://drive.google.com/file/d/1ocXgCzC0g-xMUimEesQopAac83R0X8Kp/view?usp=drivesdk', NULL, '2025-11-16 12:28:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Sayan Dey', 'sdey68428@gmail.com', '8617494187', '2004-04-07', 'Male', 'Midnapore', 'B.Tech', 'Computer Science', 'College of Engineering & Management, Kolaghat', '2026', NULL, 'Sayan@1234', 'C, Cloud Computing, Data Structures, Database Design, Git, HTML, Java, Machine Learning, Networking, Photography, Project Management, Python, SQL', 'https://drive.google.com/file/d/1E2stuNNdndzM_hGlbdczajCVha-DakJj/view?usp=drivesdk', NULL, '2025-12-07 17:23:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Rakesh Malash', 'rakeshmalash956@gmail.com', '9800135855', '2003-04-01', 'Male', 'Kolaghat, Purba Medinipur, West Bengal, IND', 'B.Tech', 'Computer Science And Engineering', 'College Of Engineering & Management , Kolaghat', '2026', NULL, 'Rakesh@123', 'AWS, Backend Development, C, CSS, Cybersecurity, Data Science, Data Structures, Deep Learning, Django, HTML, Java, JavaScript, Machine Learning', 'https://drive.google.com/file/d/1QIbdygs2D-duzSwJy2IZl7cLvIpBDDF6/view?usp=drivesdk', NULL, '2025-12-07 18:14:26', NULL, NULL, 'West Bengal Board of Secondary Education (WBBSE)', '2020', '60.2', 'West Bengal Council of Higher Secondary Education', '2022', '91.8', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'ABDUL RAJIBUL MALLICK', 'mallickabdulrajibul@gmail.com', '7001069533', '2004-12-03', 'Male', 'Bagnan, Howrah', 'B. Tech', 'Computer Science and Engineering', 'College of Engineering and Management, Kolaghat', '2026', NULL, '2004@rajibul', 'Data Engineering, Data Entry, Data Science, Decision Making, Git, GitHub, Java, Machine Learning, MySQL, Python, Self-Discipline, SQL, Teamwork, Time Management, Work Ethic', 'https://drive.google.com/file/d/1SVkcNaa54yp4zq9RUkAZxGCpTTg7Qc7v/view?usp=drivesdk', NULL, '2025-12-08 02:45:01', NULL, NULL, 'West Bengal Board of Secondary Education', '2020', '78', 'West Bengal Council of Higher Secondary Education', '2022', '89.4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Gokul Ms', 'gokulmsv21@gmail.com', '9345684583', '2004-02-21', 'Select', 'Tiruchirappalli', 'BE', 'Computer Science and Engineering', 'JJ College of Engineering and Technology', '2025', NULL, 'Gokul@phoenix21', 'CSS, Frontend Development, HTML, Java, JavaScript, SQL', 'https://drive.google.com/file/d/1eaKmyhECX37tcEVKUK05d35wa-yqASrn/view?usp=drivesdk', NULL, '2025-12-13 13:49:43', 'My name is Gokul, and I recently graduated with a B.E. in Computer Science and Engineering (2025). I have completed two internships as a Frontend Developer, where I built responsive and user-friendly web applications and gained strong practical experience. I am proficient in frontend technologies and have hands-on knowledge of Next.js, MongoDB, and SQL query development. I also have a solid understanding of Data Structures and Algorithms fundamentals, which helps me write efficient, optimized, and scalable code. I am excited to bring my skills, eagerness to learn, and problem-solving mindset to a dynamic development team.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Anita Acharjya', 'anitaacharjya@gmail.com', '8918872645', '2026-01-01', 'Male', 'Kolkata', 'BTech', 'CSE', 'BUIE', '2023', NULL, 'Anita@2000', 'Adaptability', 'https://drive.google.com/file/d/1fzAtdfZgahmo_oZxjqkB5vmX1deTpjIA/view?usp=drivesdk', NULL, '2026-01-01 06:45:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Soumya Ranjan Sahoo ', 'soumya.297sahoo@gmail.com', '8599868758', '1997-06-01', 'Male', 'Bhubaneswar, Odisha ', 'B.Tech', 'Mechanical Engineering ', 'Suddhananda Engineering & Research Centre ', '2019', NULL, 'Soumya@297', 'Angular, API Development, Backend Development, CSS, GitHub, HTML, Java, JavaScript, Kotlin, Microservices, MongoDB, MySQL, Spring Boot, SQL', 'https://drive.google.com/file/d/1gKJzUUeSQ_DSmO5ZNAH4E0AcFSfcdrxe/view?usp=drivesdk', NULL, '2026-01-07 14:57:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Ritu Raj', 'rituraj2615@gmail.com', '9006536080', '2005-03-15', 'Male', 'Durgapur, West Bengal, India', 'B.Tech', 'Electronics and Communication', 'Sanaka Educational Trust\'s Groups of Institutions , Durgapur', '2026', NULL, 'ankit1@A', 'Artificial Intelligence, Data Science, Machine Learning', 'https://drive.google.com/file/d/1mFrnciI7CiYbq2Vtub9A0Ag5Uw5wfanE/view?usp=drivesdk', NULL, '2026-01-08 16:03:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Gourab Ganguly', 'gourabofficial702@gmail.com', '6294692462', '2004-02-01', 'Male', 'Kolkata, India ', 'Btech', 'Computer Science', 'sanaka educational trust ', '2026', NULL, 'gourab@@04', 'Express.js, Full Stack Development, Java, JavaScript, MongoDB, Node.js, React, SQL', 'https://drive.google.com/file/d/1C4pUDccQkVziHjRhsFVlc2rKgP8hActi/view?usp=drivesdk', NULL, '2026-01-08 16:04:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Ankita Das', 'ankitadas7802@gmail.com', '8695393874', '2002-08-07', 'Female', 'Kolkata ', 'B.Tech', 'Electronics and communication engineering ', 'Sanaka Educational Trust Group of Institute ', '2026', NULL, 'ankita7802', 'Business Development', 'https://drive.google.com/file/d/1fhRlc11H2PXNPrRN6zHNv_24KNcTiaBv/view?usp=drivesdk', NULL, '2026-01-08 16:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Haimanti Mondal', 'haimantim1@gmail.com', '09832448641', '2004-11-03', 'Female', 'Ankar bagan lakurdi ps burdwan, west bengal pin code 713102', 'Btech', 'Electronics and communication Engineering ', 'Sanaka educational institute of technology ', '2026', NULL, 'Suchwna@2004', 'C, Embedded Systems, Python', 'https://drive.google.com/file/d/1tX2Jt9C9mdrS0-_lxF3YthfYgVXZ2zvP/view?usp=drivesdk', NULL, '2026-01-08 16:08:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'ANURAG', 'anuragkarmakar09@gmail.com', '8016770489', '1997-06-30', 'Male', 'Durgapur ', 'B.tech', 'Electronics and Communication Engineering', 'SANAKA EDUCATIONAL TRUST’S GROUP OF INSTITUTIONS ', '2026', NULL, 'Anurag@pcs123', 'Java, SQL', 'https://drive.google.com/file/d/1h9Li5ql1GjsGSGZgFn_9VITPrFts4NRk/view?usp=drivesdk', NULL, '2026-01-08 16:10:47', NULL, NULL, 'CBSE', '2013', '76', 'WBCHSE', '2015', '68.4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Akash Samanta', 'akashsamanta427@gmail.com', '8001974980', '2002-08-09', 'Male', 'Bagnan, Howrah', 'B. Tech.', 'Computer Science', 'College of Engineering and Management, Kolaghat', '2027', NULL, 'Akash@2002', 'C++', 'https://drive.google.com/file/d/1tS6DEeikVd4oxAKran9hw4YsewjMRY-I/view?usp=drivesdk', NULL, '2026-01-09 10:56:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Debkanta', 'chaudhuridebkanta@gmail.com', '7318990907', '2005-05-29', 'Male', 'Kolaghat,West Bengal', 'Higher Secondary', 'Computer science', 'College of Engineering and Management , kolaghat', '2027', NULL, 'Debu@123', 'C', 'https://drive.google.com/file/d/1EuBnswd0IU2F3hfjrebmE_BimR9IF08l/view?usp=drivesdk', NULL, '2026-01-09 10:58:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Ik Jasu', 'ikjasu04@gmail.com', '7439584952', '2003-10-12', 'Male', 'Howrah', 'B.Tech', 'Computer Science', 'College Of Engineering and Management, Kolaghat', '2027', NULL, 'Ik1@jasu', 'Web Development', 'https://drive.google.com/file/d/1nDM3NEw8avsgALTWRCETYenuZY95wRr7/view?usp=drivesdk', NULL, '2026-01-09 10:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'kalyanmay chakraborty', 'kalyanmaychakraborty6@gmail.com', '8653923627', '2005-07-24', 'Male', 'Mecheda', 'B.Tech', 'CSE(AIML)', 'CEMK', '2027', NULL, '@kalyanmay24', 'Editing, Java', 'https://drive.google.com/file/d/1dR9ErOPEPSXFtr26adqsxTHiKn3p8OdR/view?usp=drivesdk', NULL, '2026-01-09 10:59:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'RITAM JANA', 'ece23001@cemk.ac.in', '6297195842', '2004-08-21', 'Male', 'Kolaghat', 'B.Tech', 'Electronices & Communication Engineering', 'College of engineering & Management, Kolagaht', '2027', NULL, 'ritam@1234', 'Embedded Systems, Java', 'https://drive.google.com/file/d/1ALQtptDfpWQewU8BF_QaVLoOjuw4WeBq/view?usp=drivesdk', NULL, '2026-01-09 10:59:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'ADWITIA SAHA', 'cse23186@cemk.ac.in', '6800743256', '2015-02-28', 'Female', 'Kolkata, west bengal', 'B.Tech', 'Computer Science', 'CEMK', '2027', NULL, 'adwi@6', 'Web Development', 'https://drive.google.com/file/d/1HNrzZfPT-icg1IZJZ7Q6wewWhs2y6tFG/view?usp=drivesdk', NULL, '2026-01-09 10:59:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Aditi Mondal', 'aditimondal2032@gmail.com', '9091719491', '2005-04-12', 'Female', 'Mecheda', 'B.Tech', 'Computer Science', 'College of Engineering and Management,Kolaghat', '2027', NULL, 'aditi@2005', 'C', 'https://drive.google.com/file/d/1ZN1njlNGZ2WBcyJG6s91Qh1rq41ieChg/view?usp=drivesdk', NULL, '2026-01-09 11:00:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Madhuchhanda Chakrabarti', 'madhuchhanda7777@gmail.com', '07439385883', '2005-05-01', 'Female', 'Howrah, West Bengal, India', 'B.Tech', 'Computer Science', 'college of engineering & management, kolaghat', '2027', NULL, '01052005', 'C', 'https://drive.google.com/file/d/1rIHm9AGXzslApxkdF5QPXS2ndsUkrkH0/view?usp=drivesdk', NULL, '2026-01-09 11:00:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'virat Kohali', 'xamab11592@gopicta.com', '9090909090', '1990-10-10', 'Male', 'delhi', 'B.tech', 'Computer Science', 'vidyasagar University', '2027', NULL, 'J2c@123', 'Software Architecture', 'https://drive.google.com/file/d/1uGPOkvmcXP0BeS4e_5VCcnHqprk-ymtZ/view?usp=drivesdk', NULL, '2026-01-09 11:00:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Tathagata Debnath', 'tathagatadebnath41@gmail.com', '07047781165', '2005-08-21', 'Male', 'Kolkata', 'B.Tech', 'Artificial Intelligence & Machine Learning', 'College of Engineering & Management, Kolaghat', '2027', NULL, 'Debnath1@', 'Artificial Intelligence, C, Communication, Content Writing, Critical Thinking, Data Entry, Data Structures, Java, Leadership, Machine Learning, Problem Solving, Python', 'https://drive.google.com/file/d/1hTq_R0zpwB0teCz-WM1H_yJ_gAlnzhtt/view?usp=drivesdk', NULL, '2026-01-09 11:00:43', NULL, 'Hindi,English,Bengali', 'ICSE', '2021', '83%', 'CBSE', '2023', '73.6%', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Subhrangsu Das', 'subhrangsudas31@gmail.com', '7908957796', '2005-01-31', 'Male', 'Kharagpur', 'B.Tech', 'Computer Science', 'College of Engineering and Management, Kolaghat', '2027', NULL, 'career@123', 'Python', 'https://drive.google.com/file/d/1J0NDHgxAMRFqv1fYuxsmysDcbJerLyWR/view?usp=drivesdk', NULL, '2026-01-09 11:01:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'SHRESTHA SAMANTA', 'aiml2356@cemk.ac.in', '9163891303', '2005-05-05', 'Female', 'Bagnan', '10+2', 'Aiml', 'College Of Engineering and Management kolaghat', '2027', NULL, '2005', 'Artificial Intelligence', 'https://drive.google.com/file/d/1Cwt_fJbjiQYP0S7jY5fwWGjWqjvuwsuk/view?usp=drivesdk', NULL, '2026-01-09 11:03:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'ABHIK ADHIKARY', 'aiml2338@cemk.ac.in', '8207052476', '2005-04-06', 'Male', 'Howrah, West Bengal', '10+2', 'AIML', 'College of Engineering and Management, Kolaghat', '2027', NULL, 'Abhik2005', 'Artificial Intelligence', 'https://drive.google.com/file/d/19OI5NpOn4FooOPsRg4IjLu78OGrOBHed/view?usp=drivesdk', NULL, '2026-01-09 11:03:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Apabrita Ghosh', 'apabritaghosh04@gmail.com', '7319574458', '2004-10-03', 'Female', 'Medinipur', 'B.Tech', 'Computer Science', 'College Of Engineering & Management,KOLAGHAT', '2027', NULL, 'apabrita@2004', 'C, Java', 'https://drive.google.com/file/d/1dLK_OINDv1aVoxrP4PJRzdHN2q76Z8zm/view?usp=drivesdk', NULL, '2026-01-09 11:03:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'DEEPSIKHA DAS', 'aiml2330@cemk.ac.in', '8597658433', '2005-03-23', 'Female', 'Kolkata', '10+2', 'AIML', 'College Of Engineering and Management, Kolaghat', '2027', NULL, 'root', 'Artificial Intelligence', 'https://drive.google.com/file/d/14hPMOhNWHZ0oEaP_p431N445lvqJhbGv/view?usp=drivesdk', NULL, '2026-01-09 11:03:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'Shreya Pal', 'shreyapal622@gmail.com', '6297979661', '2005-01-31', 'Female', 'kolaghat', 'B-tech', 'Information Technology', 'College of Engineering and Management Kolagaht', '2027', NULL, 'Shreya@2005', 'Java', 'https://drive.google.com/file/d/1YkT_iAGM51v4jGWKhddakCPxMiWJlSm9/view?usp=drivesdk', NULL, '2026-01-09 11:05:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'KOYEL MANNA', 'it2345@cemk.ac.in', '6296820615', '2005-08-10', 'Female', 'Kolaghat,Purba Medinipur,West Bengal', 'BTech', '', 'COLLEGE OF ENGINEERING AND MANAGEMENT,KOLAGHAT', '2027', NULL, 'koyelmanna', 'Artificial Intelligence', 'https://drive.google.com/file/d/1UaOEY5kwd3UEHzCtskyit9qBcuNQwgKB/view?usp=drivesdk', NULL, '2026-01-09 11:05:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Sourav Ghosh', 'souravghoshmr1@gmail.com', '9798847565', '2003-07-21', 'Male', 'kolkata', 'b.tech', 'Electronics & Communication Engineering', 'College Of Engineering & Management Kolaghat', '2027', NULL, 'Sourav@123', 'Java', 'https://drive.google.com/file/d/1fDiGNAauUobBfsSMmjhxEBz5OxnGqZy6/view?usp=drivesdk', NULL, '2026-01-09 11:05:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'Nelkantha Dey', 'deyneelkanth2005@gmail.com', '9907305572', '2005-05-09', 'Male', 'Bishnupur', 'B. Tech', 'Computer Science and Engineering', 'College of Engineering and Management, Kolaghat', '2027', NULL, 'Neelkanth513@', 'Java', 'https://drive.google.com/file/d/1GnbEtDVBq_NDW_HBzdahScoZO5a0Sakw/view?usp=drivesdk', NULL, '2026-01-09 11:06:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'PRITAM RAUT', 'cse23113@cemk.ac.in', '8509318008', '2005-03-18', 'Male', 'Tamluk', 'B.Tech', 'CSE', 'College of Engineering & Management ,Kolaghat', '2027', NULL, 'College113', 'C, Java, Python', 'https://drive.google.com/file/d/1WFe9XjA8NrDIWsuPtuGSI-XrrhSTEdzU/view?usp=drivesdk', NULL, '2026-01-09 11:06:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Shreya Bhowmik', 'shreyabhowmik123@gmail.com', '9382265315', '2004-07-31', 'Female', 'Balichak', '12th board', 'Electronics and Communication Engineering', 'College of Engineering and Management,Kolaghat', '2027', NULL, 'shreya@2004', 'Java', 'https://drive.google.com/file/d/1wTaMmgm5y4lI2nHCM02I0-hEJxJs-CZU/view?usp=drivesdk', NULL, '2026-01-09 11:06:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'Soumili Parai', 'soumiliparai@gmail.com', '7908830445', '2004-10-25', 'Female', 'kolaghat,Purba Medinipur,west Bengal', 'B.Tech', 'Computer Science', 'College of Engineering and Management,Kolaghat', '2027', NULL, 'soumili321', 'C', 'https://drive.google.com/file/d/1eBC90dVClGyHIUg9tM_Cu8trxiV8iam3/view?usp=drivesdk', NULL, '2026-01-09 11:07:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'Sania saha', 'SahaSania2005@gmail.com', '07365950664', '2005-09-06', 'Female', 'kolaghat', 'Higher Secondary', 'Information Technology', 'College Of Engineering And Management,Kolaghat', '2027', NULL, 'Sana@0609', 'Java', 'https://drive.google.com/file/d/1YGpwJlXAAxXJSOB-uMuP6NNSLLcX9nBq/view?usp=drivesdk', NULL, '2026-01-09 11:07:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'Somdeb Santra', 'cse23187@cemk.ac.in', '9046557364', '2004-06-26', 'Male', 'Tamluk', 'B.Tech', 'Computer Science & Engineering', 'College Of Engineering & Management, Kolaghat', '2027', NULL, 'Somdeb@1234', 'C, Java, Python', 'https://drive.google.com/file/d/1oXiIWc31XPUuEehKe2e7DZmukXd_zTBf/view?usp=drivesdk', NULL, '2026-01-09 11:08:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'Niladri Das', 'dasniladri20067@gmail.com', '6297532090', '2004-08-23', 'Male', 'Kolaghat', 'B.Tech', 'Computer Science and Engineering', 'College of Engineering and Management, Kolaghat', '2027', NULL, 'Niladri#1234', 'Artificial Intelligence', 'https://drive.google.com/file/d/12OGko-19ebzS1Jh5WaXQ-ogVQLSNEphi/view?usp=drivesdk', NULL, '2026-01-15 04:30:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Ritam Sarangi', 'ritamsarangi3@gmail.com', '7319564388', '2005-10-02', 'Male', 'Contai', 'B.Tech', 'Electronics and Communication Engineering ', 'College of Engineering and Management,Kolaghat ', '2027', NULL, 'ritam@2005', 'C++', 'https://drive.google.com/file/d/16a4CTAN65xxoXVJfOg5Dc97_6215Ti1x/view?usp=drivesdk', NULL, '2026-01-15 04:32:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'RIMA GHOSH', 'cse23088@cemk.ac.in', '09933621793', '2005-10-16', 'Female', 'kolaghat', 'B.Tech', 'Computer Science', 'College of Engineering & Management,Kolaghat', '2027', NULL, 'Rima@1234', 'C, C++, Java, Photography, Python', 'https://drive.google.com/file/d/1Acvq74mncvVTLQcloj2qzruABEDYqnYI/view?usp=drivesdk', NULL, '2026-01-15 04:33:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'SREEJAN DAS', 'sreejandas2305@gmail.com', '6289849806', '2005-02-23', 'Male', 'Kolaghat', 'B.TECH', 'ECE', 'College of Engineering and Management Kolaghat', '2027', NULL, 'sreejan@2005', 'Embedded Systems', 'https://drive.google.com/file/d/1eXRqhj-qiJ0oTZXVcBvA7Y6zmFVfR5vY/view?usp=drivesdk', NULL, '2026-01-15 04:33:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Shoumik Khan', 'shoumikkhan09@gmail.com', '7047640129', '2003-04-09', 'Male', 'Kolkata', 'B.Tech', 'Computer Science', 'College of Engineering & Management,Kolaghat', '2027', NULL, 'Shoumik04#', 'Web Development', 'https://drive.google.com/file/d/1qA1tZJPietN-nk4H-jnz8a25aH2y0ynw/view?usp=drivesdk', NULL, '2026-01-15 04:33:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'AVIK MITRA', 'avikmitra1717@gmail.com', '9830871918', '2005-05-30', 'Male', 'Uluberia, Howrah', 'B.Tech', 'Information Technology ', 'College of Engineering and Management,Kolaghat', '2027', NULL, 'avikmitra2005', 'Web Development', 'https://drive.google.com/file/d/1T2vV93wChqHHrDzKHBioAa4dQ-AMgfsU/view?usp=drivesdk', NULL, '2026-01-15 04:33:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Suvajit', 'vivekgoswami.info@gmail.com', '0', '2004-02-01', 'Select', 'Kolaghat', 'B.Tech', 'IT', 'CEMK', '0', NULL, '0', 'AWS', 'https://drive.google.com/file/d/1DAox40pxcCMUE4lXJOonfovsWBKHWQLf/view?usp=drivesdk', NULL, '2026-01-15 04:34:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'ARPAN GUCHHAIT', 'arpanguchhait2023@gmail.com', '9883683496', '2004-10-11', 'Male', 'Kolaghat ', 'H.S.', '', 'College of Engineering and Management, Kolaghat ', '2023', NULL, 'Arpan@2004', 'C', 'https://drive.google.com/file/d/1tOhq0GJF12mLZ8PMr2hEc3d3wNkKP0tu/view?usp=drivesdk', NULL, '2026-01-15 04:34:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Bittu Mondal', 'mondalbittu047@gmail.com', '7020058928', '2004-10-16', 'Male', 'Ghatal, Paschim Medinipur', 'B.Tech', 'Computer Science & Engineering', 'College Of Engineering And Management, Kolaghat', '2027', NULL, 'Bittu@2004', 'Artificial Intelligence', 'https://drive.google.com/file/d/1OKAnAXx7cUrnlMf3JUyqiXLMd-HhpJd5/view?usp=drivesdk', NULL, '2026-01-15 04:35:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'Dipanwita Ghara', 'dipanwitaghara@gmail.com', '8670928443', '2004-06-29', 'Female', 'Tamluk, Purba Medinipur', 'B.Tech', 'Information Technology', 'College of Engineering & Management, Kolaghat', '2027', NULL, 'dipu@2014', 'Mobile App Development', 'https://drive.google.com/file/d/1AONHMT0v_hPZVFurNLpAap3fsjOK0Fbt/view?usp=drivesdk', NULL, '2026-01-15 04:35:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'SAMBADIP MONDAL', 'aiml2345@cemk.ac.in', '8293086585', '2004-11-14', 'Male', 'Kolaghat ', 'Higher secondary ', 'Aiml', 'College of engineering and management Kolaghat ', '2027', NULL, 'samba@2004', 'Artificial Intelligence, Machine Learning', 'https://drive.google.com/file/d/12UQSvNR04U8pXs_kPk3700Q_-cQHRuBU/view?usp=drivesdk', NULL, '2026-01-15 04:36:41', NULL, 'C, python,java', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Sayak Bhattacharya', 'bhattacharyasayak977@gmail.com', '8240538201', '2004-10-25', 'Male', 'Howrah ,West Bengal', 'Graduation', 'Computer Science', 'College of Engineering and Management', '2027', NULL, 'Sayak@2004#', 'Algorithms, CSS, Express.js, HTML, Java, JavaScript, MongoDB, Node.js, REST API', 'https://drive.google.com/file/d/1zEJXTsEXVPjN2OQGvaqa4Y1i5v5RNFuR/view?usp=drivesdk', NULL, '2026-01-15 04:37:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Apurba Das', 'anshudas873@gmail.com', '9163950523', '2004-11-19', 'Male', 'Kolkata', '12th', 'Computer Science', 'College of Engineering and Management, Kolaghat', '2027', NULL, 'Apurba123$', 'Data Science, Data Structures, Video Editing (non-tech)', 'https://drive.google.com/file/d/1ZMeExt33sd2d_QYoC1nzFmY8SCtD4pX3/view?usp=drivesdk', NULL, '2026-01-15 04:40:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'DIYASI NAG', 'ece23004@cemk.ac.in', '7585962139', '2003-06-25', 'Female', 'Howrah', 'Btech', 'Electronics & Communication Engineering', 'College of Engineering & Management,Kolaghat', '2027', NULL, '758596', 'UI/UX Design', 'https://drive.google.com/file/d/10obDap4i5aWYAV3RINk8kW2dNKNRmip5/view?usp=drivesdk', NULL, '2026-01-15 04:41:15', NULL, 'Bengali,Hindi,English', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Shrabana Ghorai', 'shrabana.ghorai@gmail.com', '7319167201', '2004-10-14', 'Female', 'Contai', 'B.Tech', 'Artificial Intelligence & Machine Learning', 'College of Engineering & Management ,Kolaghat', '2027', NULL, '834855', 'Artificial Intelligence', 'https://drive.google.com/file/d/1-LFpGDvByVzajKu5V-O2ER0jUUr6tS0C/view?usp=drivesdk', NULL, '2026-01-15 04:41:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'ANUBHAV BASULI', 'anubhavbasuli99@gmail.com', '7029399278', '2005-08-28', 'Male', 'KOLKATA', 'B.Tech ', 'Information Technology ', 'College of engineering and management Kolaghat ', '2027', NULL, 'Anubhav@12', 'C, Python, Web Development', 'https://drive.google.com/file/d/1KGQxxGAA1XUYgwJcf-e1m7GrYia1Vrmk/view?usp=drivesdk', NULL, '2026-01-15 04:42:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'SABARNA GHOSH', 'cse23101@cemk.ac.in', '08900418337', '2001-12-06', 'Male', 'Kolaghat ', 'B.Tech', 'Computer Science and engineering ', 'College of Engineering and management,Kolaghat ', '2027', NULL, 'f7f4zKtFgYEpPKT', 'C, Java, Python', 'https://drive.google.com/file/d/1Kg51pUw8PeBwFcan4orKa08QtkrBERWS/view?usp=drivesdk', NULL, '2026-01-15 04:43:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'Sayandeb Gurey', 'gureysayandeb@gmail.com', '7583910229', '2004-07-23', 'Male', 'Shantipur,Mecheda,Purba Medinipur-721137', 'B.Tech', 'Computer Science and Engineering', 'College Of Engineering And Management, Kolaghat', '2027', NULL, 'SS182304', 'Java, JavaScript, PHP', 'https://drive.google.com/file/d/1pSQ3vU1kkt1jbmHBp8Kgcprr_0ne05Y7/view?usp=drivesdk', NULL, '2026-01-15 04:43:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'ANKIKA DAS', 'ece23005@cemk.ac.in', '9907618060', '2005-11-15', 'Female', 'Kolaghat ', 'B.Tech', 'ELECTRONICS & COMMUNICATION ENGINEERING', 'COLLEGE OF ENGINEERING & MANAGEMENT , KOLAGHAT', '2027', NULL, '1234567890', 'Graphic Design (non-tech)', 'https://drive.google.com/file/d/1Dm9YniM7kBmBmXbszs5LHd7c_ioyAyRk/view?usp=drivesdk', NULL, '2026-01-15 04:44:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'Sohana Khan', 'ece23026@cemk.ac.in', '7602003101', '2003-11-14', 'Female', 'MIDNAPORE', 'B.Tech', 'Electronics & Communication', 'College of Engineering & Management,Kolaghat', '2027', NULL, 'PAVILION', 'C++', 'https://drive.google.com/file/d/1nrxL0RLKpwrP7kq8kZLH8M6DpBTK5mWk/view?usp=drivesdk', NULL, '2026-01-15 04:45:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Tanushree Bagchi', 'tanushree25bagchi@gmail.com', '9073847955', '2005-03-25', 'Female', 'kolkata', 'B.tech', 'CSE(AI&ML)', 'college of engineering and management , kolaghat', '2027', NULL, '-9R>w7kwf))5b~j', 'Artificial Intelligence, Data Science, Data Structures, Java, Python', 'https://drive.google.com/file/d/1FttxVzt5piK0ST6AFWgBpLBmU3rh5udI/view?usp=drivesdk', NULL, '2026-01-15 04:46:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'POULAMI PARIA', 'aiml2315@cemk.ac.in', '7003132239', '2005-05-27', 'Female', 'Kolaghat ', 'B.Tech', 'AIML ', 'College of Engineering and Management, Kolaghat ', '2027', NULL, 'bithi21', 'Java', 'https://drive.google.com/file/d/1FE8-sK2E3loxeni3nENmh6ypzwH0DLBM/view?usp=drivesdk', NULL, '2026-01-15 04:47:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'SK HABIB HOSSAIN', 'skhabib1812@gmail.com', '8609270502', '2003-12-18', 'Male', 'AMTA, HOWRAH', 'B.TECH', 'COMPUTER SCIENCE AND ENGINEERING', 'COLLEGE OF ENGINEERING AND MANAGEMENT , KOLAGHAT', '2027', NULL, 'Jewel_2003', 'Artificial Intelligence, Content Writing, Data Science, Full Stack Development, Java', 'https://drive.google.com/file/d/19xhrY56q9_Mm4uJT14W47T1kSwxuib8t/view?usp=drivesdk', NULL, '2026-01-15 04:47:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'Debasmita Maity', 'maitydebasmita52@gmail.com', '08016938531', '2005-04-03', 'Female', 'Tamluk', 'B.Tech', 'Electronics and Communication Eng.', 'College of Engineering and Management,Kolaghat', '2027', NULL, 'mistu2310', 'Analytical Skills', 'https://drive.google.com/file/d/1KEUUihCUdnE8QSy6h2CdwgbQM8x_74jN/view?usp=drivesdk', NULL, '2026-01-15 04:47:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'MONALI SASMAL', 'cse23134@cemk.ac.in', '9933013071', '2005-03-04', 'Female', 'Bagnan', 'B.Tech', 'Computer Science', 'College of Engineering and Management,Kolaghat', '2027', NULL, '234376', 'Java', 'https://drive.google.com/file/d/1fLoCTjUmlgDyNZgtAlUqJFEpksSzVbHV/view?usp=drivesdk', NULL, '2026-01-15 04:51:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'MALLIKA SAMANTA', 'cse23050@cemk.ac.in', '7602098803', '2004-08-05', 'Female', 'Moyna, Purba Medinipur ', 'B.Tech', 'Computer Science ', 'College of Engineering and Management, kolaghat ', '2027', NULL, '7602098803', 'Java', 'https://drive.google.com/file/d/1BW9rNaDjxw82MDiLVOQ0kd58EOwL76sv/view?usp=drivesdk', NULL, '2026-01-15 04:52:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'MAISHA FARHIN', 'maishafarhin05@gmail.com', '8910841644', '2005-07-04', 'Female', 'BAGNAN HOWRAH', 'B.TECH', 'COMPUTER SCIENCE AND ENGINEERING', 'COLLEGE OF ENGINEERING AND MANAGEMENT , KOLAGHAT', '2027', NULL, 'Maisha_2005', 'Artificial Intelligence, C, Full Stack Development, Java, Python', 'https://drive.google.com/file/d/1Jc7O3t_0hLvz90SapYtJIYNL0-0hxNcM/view?usp=drivesdk', NULL, '2026-01-15 04:56:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'Ayan Samanta', 'iamayan.samanta15@gmail.com', '8609020869', '2005-04-24', 'Male', 'Mecheda', 'B.Tech', 'COMPUTER SCIENCE AND ENGINEERING ', 'COLLEGE OF ENGINEERING AND MANAGEMENT, KOLAGHAT', '2027', NULL, 'Rahul@2404', 'Frontend Development, Game Development, Java', 'https://drive.google.com/file/d/1RQr_0niY-8combHLkUOEP82E6mfs6Tbn/view?usp=drivesdk', NULL, '2026-01-15 04:58:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'AYAN MAKAR', 'ayanmakar90@gmail.com', '9382721650', '2004-09-11', 'Male', 'Dharinda, Tamluk, Purba Medinipur', 'B.Tech', 'Computer Science & Engineering', 'College of Engineering And Management, Kolaghat', '2027', NULL, 'ayan@makar90j2c', 'C, Java, Python', 'https://drive.google.com/file/d/1ZzcsKLUkPndWZY_1EZv-dYYeqAVNxnlz/view?usp=drivesdk', NULL, '2026-01-15 05:09:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'SK SAHANOWAJ', 'sksahanowaj046@gmail.com', '8967715443', '2002-07-27', 'Male', 'Nandigram, West Bengal, India', 'HIGHER SECONDARY PASS', 'COMPUTER SCIENCE', 'COLLEGE OF ENGINEERIN AND MANAGEMENT KOLAGHAT', '2027', NULL, 'cse23161ir', 'Java', 'https://drive.google.com/file/d/1IUj1rq5mxMk98cLpWFyr9eyj4Aek53hB/view?usp=drivesdk', NULL, '2026-01-15 13:49:33', NULL, 'ENGLISH,HINDI,BENGALI', 'W.B.B.S.E', '2019', '86.6', 'W.B.C.H.S.E', '2021', '80', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'Murari Mohan Das', 'murarimohandas584@gmail.com', '7479052852', '2004-01-02', 'Male', 'Kolaghat ', 'B.Tech ', 'Computer science and engineering ', 'College of engineering and management, Kolaghat ', '2027', NULL, 'neon123', 'Java', 'https://drive.google.com/file/d/1bcbuOSsgfNNkHxbQqZ7SZj6xJOx4Mcod/view?usp=drivesdk', NULL, '2026-01-15 14:25:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'Debartha Mondal', 'debarthamondal82@gmail.com', '7602668523', '2005-06-13', 'Select', 'Kolaghat', 'H.S', '', 'College of Engineering & Management, Kolaghat', '2023', NULL, 'Rocky@2005', 'C, HTML, Java', 'https://drive.google.com/file/d/15EYyxYwcPLUHQ3HJfhX-rdkuj4hX-j_0/view?usp=drivesdk', NULL, '2026-01-15 15:37:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'RANITA PAUL', 'cse24l199@cemk.ac.in', '7810859901', '2005-11-25', 'Female', 'Khirpai', 'B.Tech', 'Computer Science', 'College of Engineering & Management, Kolghat', '2027', NULL, '2607', 'Data Structures, Python', 'https://drive.google.com/file/d/1bua724jalFPURscu4HMNo_eemx02zFVn/view?usp=drivesdk', NULL, '2026-01-15 16:42:05', NULL, NULL, 'WBBSE ', '2021', '87.71%', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'SOURIKTA SAMANTA', 'cse24l200@cemk.ac.in', '8116119521', '2004-05-11', 'Female', 'Tamluk,Purba Medinipur ', 'BTech ', 'Computer Science and Engineering ', 'College of Engineering and Management, Kolaghat ', '2027', NULL, 'Sou@2004', 'CSS, HTML, Java, JavaScript', 'https://drive.google.com/file/d/1JureEB_WgQ4exrnvlLC2MjJyG2AhlNYI/view?usp=drivesdk', NULL, '2026-01-15 16:51:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'SUSMITA SAU', 'cse24l205@cemk.ac.in', '7430826866', '2004-08-26', 'Female', 'Nandakumar,Purba Medinipur ', 'BTech ', 'Computer science and engineering ', 'College of engineering and management, Kolaghat ', '2027', NULL, 'susmita@@123', 'Adaptability, C, Coaching & Mentoring, Communication, HTML, Java, Problem Solving, Python, Time Management', 'https://drive.google.com/file/d/1MxP56StmZhqE-ZcjB_CtsKzEgMdjbyy_/view?usp=drivesdk', NULL, '2026-01-15 17:05:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'Soham Mondal', 'sohammondal965431@gmail.com', '7439528043', '2004-07-15', 'Male', 'Uluberia, Howrah, West Bengal', 'B.Tech', 'Electronics and Communication Engineering', 'College of Engineering & Management, Kolaghat', '2027', NULL, 'Mondal@2004', 'C, Data Structures, Embedded Systems, Python', 'https://drive.google.com/file/d/1wBbhw4qJi0JIBT0Vdm9HvPGlR_0G-ByS/view?usp=drivesdk', NULL, '2026-01-15 19:13:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'Shubhajit Maity', 'shubhajitmaity62900@gmail.com', '08100644737', '2005-03-21', 'Male', 'Howrah', 'B.Tech', 'Computer Science & engineering', 'College of Engineering & Management, Kolaghat', '2027', NULL, 'Shubha@2005', 'Algorithms, C, CSS, Data Structures, HTML, Java, JavaScript, Python', 'https://drive.google.com/file/d/1-rQlYHJailgIrDKGljiL0ffeKipqPw5q/view?usp=drivesdk', NULL, '2026-01-16 05:13:43', NULL, 'Bengali, English, Hindi', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'Rajesh Mondal', 'rajeshmondal4928@gmail.com', '9907375956', '2005-02-24', 'Male', 'Ghatal, Paschim Medinipur ', 'B.Tech', 'Information Technology ', 'College of Engineering and Management, Kolaghat ', '2027', NULL, 'it2308cemk@', 'C', 'https://drive.google.com/file/d/1mnDMiLsbeipKOSO-a8NLaMVTgCfiWurl/view?usp=drivesdk', NULL, '2026-01-16 05:37:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'Sujit Maity', 'sujitmaity0485@gmail.com', '9907414851', '2005-07-29', 'Male', 'Brajaballav pur,Moyna,Purba Medinipur', 'B.Tech', 'Electronic communication engineering', 'Collage of engineering and management,kolaghat', '2027', NULL, 'Sujit@2005', 'C, Java,Matlab,', 'https://drive.google.com/file/d/1-uSeUTM5ycneM_ZNeRreVBh5VN_Z76qR/view?usp=drivesdk', NULL, '2026-01-16 05:37:32', NULL, NULL, 'WBBSE', '2021', '77.85', 'WBCHSE', '2023', '60.2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'Moumita Jana', 'janamoumita777@gmail.com', '9733192180', '2005-02-22', 'Female', 'Panskura', 'Graduation ', 'Electronics and communication Engineering ', 'College of Engineering and Management, Kolaghat ', '2027', NULL, 'Moumita @22', 'C++, Communication, HTML, Java', 'https://drive.google.com/file/d/1szhTQ9CsgCefdh6eikiqCPjKOmCbKhJ4/view?usp=drivesdk', NULL, '2026-01-16 05:54:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'Subhanur Alam', 'subhanuralam@gmail.com', '9883911575', '2005-02-10', 'Female', 'Kolaghat', 'Graduation', 'Electronics & Communication Engineering', 'College of Engineering & Management , Kolaghat', '2027', NULL, 'Subhanur@10', 'C++, Communication, Java', 'https://drive.google.com/file/d/1H63YXVkoaVZCQkYy41S6cfsScrAETCKE/view?usp=drivesdk', NULL, '2026-01-16 05:54:08', NULL, 'Bengali,English,Hindi', 'W.B.B.S.E', '2021', '68.57%', 'W.B.C.H.S.E', '2023', '65.2%', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'Sailen Kumar Panda', 'sailenp052@gmail.com', '8167536990', '2005-06-29', 'Male', 'Ghatal', 'B.Tech', 'Computer Science & Engineering', 'College Of Engineering & Management, Kolaghat', '2027', NULL, 'sailen@123', 'Frontend Development, Game Development, Java', 'https://drive.google.com/file/d/1cn0WrTSeD2Vl8qMxNfwCZwR3Nuy_GT2A/view?usp=drivesdk', NULL, '2026-01-16 05:57:30', NULL, NULL, 'WBBSE', '2021', '74', 'WBCHSE', '2023', '76.2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'SHRAYAJYOTI DEY', 'cse23157@cemk.ac.in', '9635649726', '2004-11-05', 'Male', 'Kolkata', 'B. Tech', 'Computer Science & Engineering', 'College of Engineering & Management, Kolaghat', '2027', NULL, 'Dey@2004', 'Algorithms, C, CSS, Data Structures, Express.js, HTML, Java, JavaScript, Node.js, PostgreSQL, Python', 'https://drive.google.com/file/d/1XhFz4E4_xW_KKQJdAs9QzVygNg9x1Bem/view?usp=drivesdk', NULL, '2026-01-16 06:09:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'Sneha Mahish', 'snehamahish51@gmail.com', '8101574149', '2005-05-08', 'Female', 'Midnapore, Paschim Medinipur', 'B.Tech', 'CSE(AI & ML)', 'College of Engineering and Management, Kolaghat', '2027', NULL, '@Rohit45', 'Artificial Intelligence, Data Science, Data Structures, Java, Python', 'https://drive.google.com/file/d/12MkYD5aPfCVOCmtGWLIm6nEicDJZYVfR/view?usp=drivesdk', NULL, '2026-01-16 06:10:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'DIPANNITA MANDAL', 'ece23039@cemk.ac.in', '9907126831', '2004-09-22', 'Female', 'Kolaghat ', 'Graduation ', 'Electronics and communication Engineering ', 'College Of Engineering and Management, Kolaghat ', '2027', NULL, '12345678', 'C++, Communication, Java', 'https://drive.google.com/file/d/1slEJJJ3ZGiqou4hi8bNf1WgHa35LnobV/view?usp=drivesdk', NULL, '2026-01-16 06:36:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 'ANKITA JANA', 'ece23049@cemk.ac.in', '8145924839', '2005-06-16', 'Female', 'Kolaghat ', 'Graduation ', 'Electronics and Communication Engineering ', 'College of Engineering and Management Kolaghat ', '2027', NULL, '9248', 'Business Analytics (non-technical), C, C++, Data Entry, Python', 'https://drive.google.com/file/d/1xkCDknzQ7HRI-v7Cps1-4TpX63ZCP1AQ/view?usp=drivesdk', NULL, '2026-01-16 06:47:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'KOUSIK CHANAK', 'it2332@cemk.ac.in', '9339520170', '2004-09-24', 'Male', 'Kolaghat ', 'B.Tech', 'Information Technology ', 'College of engineering and management, Kolaghat ', '2027', NULL, 'KOUSIK2005', 'Web Development', 'https://drive.google.com/file/d/1JPB8TATVaS0jY9jOXrR10-aDG26U1nZ0/view?usp=drivesdk', NULL, '2026-01-16 06:54:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'SARTHAK TUNG', 'sarthaktung@gmail.com', '8436616176', '2004-12-12', 'Male', 'Bagnan,Howrah', '12th Standard', 'Computer Science and Engineering', 'College of Engineering and Management', '2027', NULL, 'sarthak2004*', 'Artificial Intelligence, C, CSS, Data Structures, Frontend Development, GitHub, HTML, Java, JavaScript, Python', 'https://drive.google.com/file/d/1gWQJdZpVGNdwKsofFC7hC2nkryQxJ9Np/view?usp=drivesdk', NULL, '2026-01-16 07:44:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'SAGAR MANNA', 'sagarmanna963@gmail.com', '7449528531', '2005-12-24', 'Male', 'Uluberia', 'HS', 'COMPUTER SCIENCE AND ENGINEERING(ARTIFICIAL INTELLIGENCE AND MACHINE LEARNING)', 'COLLEGE OF ENGINEERING AND MANAGEMENT,KOLAGHAT', '2027', NULL, 'sagar@2005', 'Artificial Intelligence, Data Science, Full Stack Development, Java, Machine Learning', 'https://drive.google.com/file/d/1JXOdtrJKYINWChBp1C2DZEf45gh888V6/view?usp=drivesdk', NULL, '2026-01-16 14:41:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'RITESHNA MAHAPATRA', 'cse24l201@cemk.ac.in', '8509681340', '2004-09-20', 'Female', 'Keshiary, Paschim Medinipur', 'B.Tech', 'Computer Science and Engineering', 'College of Engineering and Management,Kolaghat', '2027', NULL, '8523', 'Data Entry', 'https://drive.google.com/file/d/1KMg7vSeEAWh61o343K8Bn7EcNStJMvuC/view?usp=drivesdk', NULL, '2026-01-17 03:12:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'Pallab Dey', 'pallabdey2005@gmail.com', '9330825336', '2005-06-19', 'Male', 'Howrah', 'Btech', 'Computer science', 'College of Engineering and management , kolaghat', '2027', NULL, 'Pallab@123', 'Full Stack Development', 'https://drive.google.com/file/d/1Lj7U3cxjsT4ErkFteFaZ88_zVijMu7ek/view?usp=drivesdk', NULL, '2026-01-17 08:44:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'Sk Nafis Ali', 'sksanny50@gmail.com', '8768150551', '2004-04-21', 'Male', 'Kolkata', 'B.Tech', 'Computer Science', 'College of Engineering & Management,Kolaghat', '2027', NULL, 'sknafisali2027', 'Java', 'https://drive.google.com/file/d/1KMmemnpdDQVfvyKuzk6eecVSg3TwVZ_p/view?usp=drivesdk', NULL, '2026-01-17 14:04:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jobseekers` (`id`, `fullname`, `email`, `mobile`, `dob`, `gender`, `location`, `qualification`, `specialization`, `university`, `passing_year`, `linkedin`, `password`, `skills`, `resume`, `photo`, `created_at`, `profile_summary`, `languages_known`, `tenth_board`, `tenth_year`, `tenth_percent`, `twelfth_board`, `twelfth_year`, `twelfth_percent`, `profile_completion`, `portfolio_link`, `total_experience`, `notice_period`, `current_designation`, `current_company`, `current_salary`, `profile_last_updated`) VALUES
(110, 'SAYAN BISWAS', 'cse23009@cemk.ac.in', '9051410466', '2003-06-12', 'Male', 'Howrah ', 'B.Tech', 'Computer Science ', 'College of engineering and management, Kolaghat ', '2027', NULL, 'j2cpass', 'Full Stack Development', 'https://drive.google.com/file/d/12ykB_7uhgmRQlvOWDF5fCG9CT_pAaYK1/view?usp=drivesdk', NULL, '2026-01-18 04:14:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'ISITA DUTTA', 'duttaisita0@gmail.com', '8597731369', '2004-05-02', 'Female', 'Contai', 'BTech ', 'Computer Science and Engineering ', 'College of engineering and management ', '2027', NULL, 'isita123', 'Java', 'https://drive.google.com/file/d/1ob0bViDLsSyY-WUrew7dyxlIpPS0tuKR/view?usp=drivesdk', NULL, '2026-01-18 04:49:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 'BRISTI MONDAL', 'www.bristimondal2004@gmail.com', '7436795266', '2004-04-08', 'Female', 'Kolaghat ', 'B.Tech', 'Computer Science And Engineering ', 'College Of Engineering and Management,Kolaghat ', '2027', NULL, 'Mindal@2023', 'Artificial Intelligence, C, Java, Python, Web Development', 'https://drive.google.com/file/d/1SkJuMM7fGzpRPLqrxL9lkD4WDip8Xrci/view?usp=drivesdk', NULL, '2026-01-18 04:50:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'DEBALINA ROY', 'cse23040@cemk.ac.in', '7477732863', '2005-05-10', 'Female', 'Kolaghat, Purba Medinipur ', 'Higher Secondary ', 'Computer science ', 'College of Engineering and Management, Kolaghat ', '2027', NULL, 'debalina123', 'Analytical Skills', 'https://drive.google.com/file/d/19VjRYVIQ86iKyIU-IGAn4uO90tj2lG9M/view?usp=drivesdk', NULL, '2026-01-18 04:59:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'Abhimanyu Pulagam', 'pulagamabhimanyu04@gmail.com', '06295173889', '2004-03-05', 'Male', 'Kolkata', 'B.Tech', 'Information Technology', 'College of Engineering and Management Kolaghat', '2027', NULL, 'Abhi1234', 'Python', 'https://drive.google.com/file/d/1Bz26i8rDfFuvnVa94wbR5j5gcaXlg_Oc/view?usp=drivesdk', NULL, '2026-01-18 05:23:49', NULL, 'C', 'Board of Secondary Education Andhra Pradesh', '2021', '100', 'Board of Intermediate Education Andhra Pradesh', '2023', '76', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'Subham Dinda', 'subhamdinda863@gmail.com', '6295666379', '2005-08-15', 'Male', 'Tamluk, Purba Medinipur, West Bengal ', 'Graduation ', 'Electronics & Communication Engineering ', 'College of Engineering And Management Kolaghat ', '2025', NULL, 'subha12345', 'C', 'https://drive.google.com/file/d/1fha8Y_AdaLvf29aFpKFasNfQ4WA-4gEh/view?usp=drivesdk', NULL, '2026-01-18 06:22:19', NULL, NULL, 'West Bengal Board of Secondary Education ', '2021', '79.42', 'West Bengal council of Higher secondary education ', '2023', '61.9', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'Ranajeet Bera', 'cse23057@cemk.ac.in', '7980322987', '2005-02-10', 'Male', 'Kolkata, West Bengal, India', 'B.tech', 'Computer science ', 'cse/23/057', '2027', NULL, 'Kamana@23', 'Frontend Development, Full Stack Development, Game Development, GraphQL, Hadoop, MySQL, Node.js, Prompt Engineering, UI/UX Design, Virtual Reality (VR), Vue.js', 'https://drive.google.com/file/d/1H_BbgQtSZsuVHM5vZhDvtD_M6wLTOoMj/view?usp=drivesdk', NULL, '2026-01-18 08:01:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'saibal jana', 'saibaljana76@gmail.com', '8436350842', '1999-10-11', 'Male', 'Kolkata', 'Bachelor in Information technology', 'Information Technology', 'NESC', '2025', NULL, 'Saibal123', 'Accountability', 'https://drive.google.com/file/d/1e7ttA0VFl1ReQ8yUxTPhUvhRri1KchdX/view?usp=drivesdk', NULL, '2026-02-12 07:04:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'Firdaush Khan', 'firdaushkhan42@gmail.com', '8800983125', '2002-10-18', 'Female', 'Greater Noida west ', 'B.tech', 'Computer science ', 'Mangalmay institute of engineering & technology ', '2025', NULL, 'khansahab', 'Full Stack Development', 'https://drive.google.com/file/d/1zTZxYoTZow140ZcpVZknTxXqGpOwX0Pk/view?usp=drivesdk', NULL, '2026-02-12 18:24:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'Shubham Sharad Shinde', 'shindeshubhamsharad@gmail.com', '9130830429', '2001-11-25', 'Male', 'Pune', 'BE', 'Computer Engineering', 'Savitribai Phule Pune University', '2025', NULL, 'Shubham@2511', 'Accountability, Adaptability, Analytical Skills, AWS, Business Analytics (non-technical), Communication, Data Engineering, Data Science, GitHub, MySQL, Python, Teamwork', 'https://drive.google.com/file/d/1fke1VaD4w55rdeEfAelTyFq6woc_gOdg/view?usp=drivesdk', NULL, '2026-02-13 10:04:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Sakshi Kumari', 'sakshichoudhary030@gmail.com', '7667117751', '2001-08-05', 'Female', 'Ranchi India', 'MCA', 'Computer Application', 'Sarala Birla University', '2024', NULL, 'Joules@0508', 'Backend Development, C++, Cloud Security, Communication, CSS, Data Structures, Django, Full Stack Development, GitHub, HTML, Internet of Things (IoT), Interpersonal Skills, Java, Problem Solving, Python, Web Development', 'https://drive.google.com/file/d/1_W102OwkeoyVNnzKKYHiB28eBFv-6Tvv/view?usp=drivesdk', NULL, '2026-02-13 15:55:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, ' SUTANU     ', 'sutanumondal0@gmail.com', '8372045195', '2026-02-22', 'Male', 'kolkata', 'B.TECH', 'AUTOMATION', 'AOT', '', NULL, '     ', 'Accountability, Administrative Support, Agile Methodology', 'https://drive.google.com/file/d/1XTI2IF7c4enF-dttoDcDC2KYp5Ze9v2r/view?usp=drivesdk', NULL, '2026-02-21 16:44:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'Nikhil Kumar', 'nikhils9802@gmail.com', '8800801043', '2002-01-04', 'Male', 'Delhi', 'B.Tech', 'Electronics and Communication Enginnering', 'GB Pant DSEU Okhla-1 Campus', '2025', NULL, 'J2C@9802', 'Algorithms, API Development, Attention to Detail, Backend Development, C, CI/CD, Communication, Conflict Resolution, Critical Thinking, CSS, Data Structures, Database Design, Decision Making, Django, Emotional Intelligence, Empathy, Express.js, Full Stack Development, Git, GitHub, HTML, Interpersonal Skills, Java, JavaScript, Jenkins, Laravel, Leadership, Microservices, MongoDB, Node.js, NoSQL, Performance Optimisation, PostgreSQL, Problem Solving, Prompt Engineering, Python, React, Redis, REST API, Serverless Architecture, Software Architecture, SQL, Team Coordination, Time Management, TypeScript, Web Development', 'https://drive.google.com/file/d/1CejitQdFSc0vBEQJMHFK36u7rrV8fDZu/view?usp=drivesdk', NULL, '2026-02-22 07:55:01', 'Software engineer with experience building scalable REST APIs, background job workflows, and social\r\nmedia publishing pipelines using Node.js, MongoDB, PostgreSQL, and Redis-based queues. Strong\r\nproblem-solving background with 500+ DSA problems solved and a 210-day streak on GeeksforGeeks.\r\nOptimized backend systems to reduce Meta API usage by 93% and deliver reliable OAuth-based integrations.', 'English, Hindi', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'Adwiti Ghosh', 'adwitighosh08@gmail.com', '7477689224', '2002-10-08', 'Female', 'Kolkata', 'MCA', 'Computer Application', 'Meghnad Saha Institute Of Technology', '2025', NULL, 'Adwiti@9', 'Python, SQL,Excel,PowerBI', 'https://drive.google.com/file/d/1geAbHTCmF7QSHv-UBszSU_V20wtVj0MZ/view?usp=drivesdk', NULL, '2026-02-23 08:51:11', 'Data Analyst fresher with hands-on experience in customer behavior analysis and data-driven problem solving. Proficient in Python, SQL, Power BI, Tableau, and Excel for data cleaning, analysis, and visualization. Skilled in transforming raw data into meaningful insights through dashboards and reports. Eager to contribute analytical skills and business understanding in a Data Analyst role.', 'Bengali,English,Hindi', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Fresher', NULL, NULL, NULL, NULL, NULL),
(124, 'Shibu Kumar', 'shibukumar9000@gmail.com', '8002659429', '2004-01-05', 'Male', 'kolkata', 'B.Tech', 'Information Technology (IT)', 'Asansol Engineering College', '2025', NULL, 'Shibu@0766', 'PostgreSQL, Python', 'https://drive.google.com/file/d/1tw9UoXSzTAybBkGNvnQB8ZPvGwgilaqu/view?usp=drivesdk', NULL, '2026-02-23 09:21:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'Vinayaka Vinni', 'vinayakavinni868@gmail.com', '7786357714', '2003-06-04', 'Male', 'Bangalore', 'BE', 'Computer Science', 'Don Bosco Institute Of Technology', '2025', NULL, '1234', 'CSS', NULL, 'https://drive.google.com/file/d/1udZSCj5zVGeyQmHm0tsMNLtF551yf5CN/view?usp=drivesdk', '2026-02-27 16:11:41', 'hii', 'English,Hindi,Bengali', 'state', '2019', '80', 'state ', '2021', '76', 0, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(126, 'Saurav Mallick', 'sauravmallick41@gmail.com', '6290551506', '1996-07-19', 'Male', 'Kolkata', 'B.Tech', 'Computer Science & Engineering', 'Dream Institute of Technology', '2018', NULL, 'Saurav96@', 'Analytical Skills, Communication, Decision Making, MySQL, Problem Solving, Python, Salesforce Support (non-technical)', 'https://drive.google.com/file/d/1yBcQRpIUNcdRm1ICzArOaSNgX-2ykYGc/view?usp=drivesdk', 'https://drive.google.com/file/d/1MdOXooXA5QiVXAPY2O2XufEXDPRdRyRq/view?usp=drivesdk', '2026-03-09 14:47:01', NULL, 'English, Hindi, Bengali', 'WBBSE', '2012', '74', 'WBCHSE', '2014', '54', 0, NULL, '3 Years', NULL, NULL, NULL, NULL, NULL),
(127, 'vinayaka vinni', 'vinayakavinni696@gmail.com', '8563958475', '2003-06-04', 'Male', 'Bangalore', 'BE', 'Computer Science', 'Don Bosco Institute Of Technology', '2025', NULL, 'Vinni@2003', 'CSS, HTML, Java, JavaScript, Python', NULL, NULL, '2026-03-14 03:56:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'Anita Acharjya', 'anitaacharjya20166@gmail.com', '9933879225', '2003-07-18', 'Female', 'Chennai', 'BTech', 'CSE', 'BUIE', '2023', NULL, 'Anita@2000', 'Angular, Artificial Intelligence, Azure', NULL, NULL, '2026-03-14 05:09:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'Rabindranath Tagore', 'kakamoni12345@gmail.com', '8583005957', '2026-03-19', 'Male', 'Remote', 'btech', 'cs', 'uem', '2026', NULL, 'admin', 'CSS', NULL, NULL, '2026-03-21 05:25:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'siddappa', 's13669462@gmail.com', '565646464646', '1980-04-09', 'Male', 'bagalkot ', 'BE', 'Computer Science', 'Don  Institute Of Technology', '2010', NULL, 's13669462', 'Accountability', NULL, NULL, '2026-04-02 05:33:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'Kiruthika M', 'kiruthikam0466@gmail.com', '8870721433', '2004-12-23', 'Female', 'Tiruchirappalli', 'B.Tech', 'Electronics & Communication', 'V S B Engineering College', '2026', NULL, 'Kiruthika@2312', 'CSS, HTML, Java', NULL, NULL, '2026-04-17 05:49:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'Nisha', 'nisha2352005@gmail.com', '6379932414', '2005-05-23', 'Female', 'Tiruchirappalli', 'B.Tech', 'Electronics & Communication', 'V.S.B Engineering College', '2026', NULL, 'Nisha_2305', 'CSS, HTML, Java', NULL, NULL, '2026-04-17 05:58:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'KEERTHANA GUDIPELLY', '2003keerthanag@gmail.com', '8639339137', '2003-07-11', 'Female', 'Hyderabad', 'B.Tech', 'Computer Science', 'MRCEW', '2024', NULL, '#Keerthana@123#', 'Python', NULL, NULL, '2026-04-19 13:17:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 7, 'pcs global pvt ltd', 'HR Manager', '2026-01', '2026-12', 'vgnmnvgjhbghcgg', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(2, 7, 'pcs global pvt ltd', 'Jr. Software Engineer', '2025-01', '2026-12', 'xcvbnmhgfd', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(3, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(4, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(5, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(6, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(7, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(8, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(9, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(10, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(11, 33, 'L&t Construction and Mining Machinery ', 'Junior Engineer ', '2022-07', '2024-06', 'Servicing and  Maintenance of HEMM(Heavy Earth Moving Machinery)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(12, 118, 'Infosoft technologies ', 'Software Developer ', '2025-10', '2025-12', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(13, 126, 'Accenture', 'Associate Software Engineer', '2019-01', '2020-10', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26'),
(15, 126, 'Tech Mahindra', 'Customer Support Associate', '2023-09', '2025-01', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-12 07:09:26');

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
(2, 116, 'Server creation', 'Node.js', 'Create server by https 3000');

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

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `applied_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `jobseeker_id`, `applied_at`) VALUES
(1, 7, 7, '2026-02-24 10:03:31'),
(2, 8, 125, '2026-02-27 16:22:58'),
(3, 9, 7, '2026-03-05 15:13:36'),
(4, 5, 7, '2026-03-14 08:06:53'),
(5, 10, 7, '2026-03-14 17:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `job_master`
--

CREATE TABLE `job_master` (
  `job_id` int(11) NOT NULL,
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
  `posted_date` date DEFAULT NULL,
  `work_mode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `job_master`
--

INSERT INTO `job_master` (`job_id`, `post_as`, `company_name`, `job_title`, `job_location`, `min_exp`, `max_exp`, `min_salary`, `max_salary`, `benefits`, `preferred_role`, `current_salary`, `expected_salary`, `preferred_location`, `job_description`, `skills_required`, `qualifications`, `contact_email`, `contact_phone`, `prefer_call_times`, `company_email`, `posted_date`, `work_mode`) VALUES
(1, 'Company/Business', 'pcs global pvt ltd', 'java devloper', 'kolkata', 2, 4, 3, 6, 'fghjjjk', 'java devloper', 6.00, '9', 'kokata', 'sdfrtyuio', 'sdxcfgvbhnjmk,.', 'szdxcfgvbhnjm,.', 'anitaacharjya9539@gmail.com', '9876543210', '10-6', NULL, NULL, NULL),
(2, 'Company/Business', 'PCS global pvt ltd', 'Multiple Vacancies : Human Resources,Operations and Placements', 'kolkata', 2, 5, 25000, 30000, 'Provident Fund', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'contact@j2c.in', NULL, NULL),
(3, 'Company/Business', 'PCS global pvt ltd', 'Multiple Vacancies : Human Resources,Operations and Placements', 'kolkata', 2, 5, 25000, 30000, 'Provident Fund', 'Human Resources,Operations and Placements', 25000.00, '30000', 'kokata', 'You will gain hands-on experience across multiple departments including Human Resources, Operations, Marketing, Placements, and Design. This role provides a holistic understanding of business functions while developing leadership, communication, and project management skills essential for a managerial career path.', 'Excellent communication and interpersonal skills.\r\nStrong organizational and multitasking abilities.\r\nProficiency in Canva, MS Office, and basic digital marketing tools.\r\nCreative thinking and problem-solving approach.\r\nBasic understanding of HR and operations functions.', 'Any Graduate', 'hr@pcsglobal.in', '8697741611', '10am-6pm', 'contact@j2c.in', NULL, NULL),
(4, 'Company/Business', 'PCS global pvt ltd', 'HR Executive', 'Bangalore', 0, 4, 10000, 25000, 'CAB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'contact@j2c.in', NULL, NULL),
(5, 'Company/Business', 'PCS global pvt ltd', 'Backend Developer', 'Bangalore', 6, 10, 15000, 30000, 'CAB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'contact@j2c.in', NULL, NULL),
(6, 'Company/Business', 'PCS global pvt ltd', 'HR Executive', 'Bangalore', 1, 5, 10000, 20000, 'CAB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'contact@j2c.in', NULL, NULL),
(7, 'Company/Business', 'PCS global pvt ltd', 'HR Executive', 'Bangalore', 1, 5, 10000, 20000, 'CAB', NULL, NULL, NULL, NULL, 'Proactively identify new business opportunities, conduct cold calls, and send emails to prospective clients.', NULL, NULL, 'anitaacharjya@gmail.com', '9876543210', '10:00 AM - 7:00 PM', 'contact@j2c.in', NULL, NULL),
(8, 'Company/Business', 'dfghjk', 'Backend Developer', 'Bangalore', 1, 4, 10000, 15000, 'CAB', NULL, NULL, NULL, NULL, 'dfghjkkjhgfdrtyujkmnbgv', NULL, NULL, 'anitaacharjya9539@gmail.com', '345678909', '9:00 AM - 6:00 PM', 'contact@j2c.in', NULL, NULL),
(9, 'Company/Business', 'PCS global', 'Backend Developer', 'Kolkata,Bangalore', 1, 2, 20000, 20000, 'Food', NULL, NULL, NULL, NULL, 'zjknzlkzld', 'Java,Spring Boot', 'B.Tech (CSE), B.Tech (IT)', 'saibaljana76@gmail.com', '7899998999', 'Flexible', 'hr@pcsgpl.com', NULL, NULL),
(10, 'Company/Business', 'TCS', 'Business Analyst', 'Bangalore', 1, 4, 10000, 15000, 'CAB', NULL, NULL, NULL, NULL, 'Rewuierd for Business Related ', 'Accountability, Adaptability', 'All Graduates', 'anitaacharjya9539@gmail.com', '9876543210', '11:00 AM - 8:00 PM', 'onboard@pcsgpl.com', NULL, NULL),
(11, 'Company/Business', 'PCS Global Pvt Ltd', 'AI Engineer', 'Ahmedabad', 2, 3, 25000, 30000, 'Food', NULL, NULL, NULL, NULL, 'nfdgfdzxcghjkl', 'Adaptability, Administrative Support, CSS', 'B.E (CSE)', 'pcd@gmail.com', '9766892358986', '9:00 AM - 6:00 PM', 'contact@j2c.in', NULL, NULL),
(12, 'Company/Business', 'PCS Global Pvt Ltd', 'AI Engineer', 'Kolkata', 0, 3, 20000, 30000, 'CAB', NULL, NULL, NULL, NULL, 'hjjgghfhf', 'Algorithms, Analytical Skills', 'B.Tech (IT)', 'saibaljana76@gmail.com', '7899998999', 'Flexible', 'contact@j2c.in', NULL, NULL),
(13, 'Company/Business', 'PCS Global Pvt Ltd', 'AI Engineer', 'Ahmedabad', 1, 1, 95000, 95000, 'CAB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'contact@j2c.in', NULL, NULL);

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
(58, 'Consultant');

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

--
-- Dumping data for table `login_master`
--

INSERT INTO `login_master` (`id`, `email`, `password`, `source`) VALUES
(1, 'anitaacharjya9539@gmail.com', 'Anita@2000', 'EMAIL'),
(4, 'c.rajarao@gmail.com', 'Bopt@3131#', 'EMAIL'),
(5, 'mallickabdulrajibul@gmail.com', '2004@rajibul', 'EMAIL'),
(6, 'soumya.297sahoo@gmail.com', 'Soumya@297', 'EMAIL'),
(7, 'ravikumarssp121@gmail.com', 'Zxcv@2002', 'EMAIL'),
(8, 'anuragkarmakar09@gmail.com', 'Anurag@pcs123', 'EMAIL'),
(9, 'basulibipasha635@gmail.com', 'Bipasha@2006', 'EMAIL'),
(10, 'nehamaiti14@gmail.com', 'NehaMaiti@123', 'EMAIL'),
(11, 'anganakhatua10@gmail.com', '-<tv1@#fF:wW', 'EMAIL'),
(12, 'xamab11592@gopicta.com', 'J2c@123', 'EMAIL'),
(13, 'aiml2339@cemk.ac.in', 'anubhab777', 'EMAIL'),
(14, 'kaysan8890@gmail.com', 'jok221', 'EMAIL'),
(15, 'adaksukalyan2528@gmail.com', 'Sanju@553', 'EMAIL'),
(16, 'cse23187@cemk.ac.in', 'cse23187ql', 'EMAIL'),
(17, 'aiml2338@cemk.ac.in', 'aiml2338za', 'EMAIL'),
(18, 'SahaSania2005@gmail.com', 'Joy@1210', 'EMAIL'),
(19, 'cse23125@cemk.ac.in', 'cse23125co', 'EMAIL'),
(20, 'shreyapal622@gmail.com', 'shreya_@sp66', 'EMAIL'),
(21, 'www.bristimondal2004@gmail.com', 'Mondal@2023', 'EMAIL'),
(22, 'shoumikkhan09@gmail.com', 'Shoumik04#', 'EMAIL'),
(23, 'anubhavbasuli99@gmail.com', 'Anubhav@12', 'EMAIL'),
(24, 'skhabib1812@gmail.com', 'Jewel_2003', 'EMAIL'),
(25, 'cse23114@cemk.ac.in', 'Rakesh@2025', 'EMAIL'),
(26, 'banerjee5e@gmail.com', 'C@handan123', 'EMAIL'),
(27, 'pallabdey2005@gmail.com', 'Pallab@123', 'EMAIL'),
(28, 'debarthamondal82@gmail.com', 'Rocky@76', 'EMAIL'),
(29, 'maitypalash2088@gmail.com', 'paash@7029', 'EMAIL'),
(30, 'maishafarhin05@gmail.com', 'Mus055@#', 'EMAIL'),
(31, 'cse23157@cemk.ac.in', 'Dey@2004', 'EMAIL'),
(32, 'tanushree25bagchi@gmail.com', '-9R>w7kwf))5b~j', 'EMAIL'),
(33, 'cse23057@cemk.ac.in', 'Kamana@23', 'EMAIL'),
(34, 'sutanumondal0@gmail.com', '     ', 'EMAIL'),
(35, 'nikhils9802@gmail.com', 'J2C@9802', 'EMAIL'),
(36, 'shibukumar9000@gmail.com', 'Shibu@0766', 'EMAIL'),
(37, 'sakshi.runghe2002@gmail.com', 'Sakshi@2026', 'EMAIL');

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
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `organization_details`
--

INSERT INTO `organization_details` (`id`, `organizationName`, `isIndependent`, `organizationDescription`, `organizationCity`, `industry`, `employees`, `organizationLogo`, `panProof`, `companyCertificate`, `createdAt`, `email`, `status`) VALUES
(1, 'PCS Global Pvt Ltd', 'yes', 'wertyuiop[', 'kolkata', 'Information Technology', '200+', 'd41b9938-4032-4ef3-94f2-5e02514c2241_ibm.png', '2e2fef4b-4002-4173-9281-df7faae2f49a_amazon.png', '59bc03fc-3a28-4577-98ab-f930cbae3d76_cognizent.png', '2025-11-26 14:27:05', NULL, 'PENDING'),
(2, 'PCS Global Pvt Ltd', 'yes', 'sdfghjkl;\'bbn', 'kolkata', 'Information Technology', '200+', '2fe57920-4e8b-483d-b6ba-0d2d5d42fdca_ibm.png', 'f889924a-74c0-4356-9b3c-df2f419a70c2_amazon.png', '6709e554-5c92-4693-a85f-3d2d07dccaea_infosys.jpg', '2025-11-27 06:47:43', NULL, 'PENDING'),
(3, 'PCS Global Pvt Ltd', 'yes', 'cvbnnnn', 'kolkata', 'Information Technology', '200+', 'ibm.png', 'wipro.png', 'infosys.jpg', '2025-11-27 09:54:24', 'contact@j2c.in', 'Approved'),
(4, 'IoTivity Communications Private Limited', 'yes', 'IoTivity Communications Private Limited delivers advanced eSIM, IoT, and M2M connectivity solutions built for global-scale deployments. As a Universal Discovery Service Provider (UDSP), we enable secure remote SIM provisioning, multi-operator connectivity, and intelligent device lifecycle management. Our mission is to simplify digital connectivity for enterprises, operators, and next-generation connected ecosystems.\r\n', 'Kolkata', 'Others', '11 – 50', 'ioivity_logo.jpg', 'pan.pdf', 'RegistrationCertificate191007708111.pdf', '2026-02-16 05:18:44', NULL, 'PENDING'),
(5, 'J2C', 'no', 'IT & Software', 'kolkata', 'Information Technology', '200+', NULL, NULL, NULL, '2026-02-21 12:13:45', NULL, 'PENDING'),
(6, 'PCS DEMO', 'no', 'IT SUPPORT', 'KOLKATA', 'Software Development', '1 – 10', NULL, NULL, NULL, '2026-02-21 17:07:23', NULL, 'PENDING'),
(9, 'J2C', 'yes', 'IT Service & Consulting', 'kolkata', 'Information Technology', '200+', 'https://drive.google.com/file/d/1WYhOphKzfw4m3xjEB0810jLMrFKSIUBg/view?usp=drivesdk', 'https://drive.google.com/file/d/1kEQxku3v0K-6xKBIeJ8a20uOZ7F_hRSa/view?usp=drivesdk', 'https://drive.google.com/file/d/1N8gcmra-z0z7iV_ywTEEq61nvhfOCxx_/view?usp=drivesdk', '2026-03-16 14:52:23', 'onboard@pcsgpl.com', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `saved_internships`
--

CREATE TABLE `saved_internships` (
  `id` int(11) NOT NULL,
  `internship_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `saved_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 7, '2026-03-31 13:37:57');

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
(3, 'anitaacharjya95393@gmail.com', '8918872645', 'Anita@2000', 'jobseeker', 3, '2025-11-06 14:19:56', '2025-11-06 14:19:56'),
(4, 'sunitchaudhuri@gmail.com', '8334001667', 'Sunit@123', 'jobseeker', 4, '2025-11-06 14:27:41', '2025-11-06 14:27:41'),
(5, 'kamalnath645@gmail.com', '9966378413', '9966378413Ka@', 'jobseeker', 5, '2025-11-06 15:02:16', '2025-11-06 15:02:16'),
(7, 'pagolusravani970@gmail.com', '8978362387', 'Ammu@143', 'jobseeker', 6, '2025-11-11 09:38:59', '2025-11-11 09:38:59'),
(8, 'anitaacharjya9539@gmail.com', '7602171906', 'Anita@2000', 'jobseeker', 7, '2025-11-16 05:51:34', '2025-11-16 05:51:34'),
(9, 'anitaachar@gmail.com', '9876543210', 'Anita@2000', 'jobseeker', 8, '2025-11-16 05:57:08', '2025-11-16 05:57:08'),
(10, 'avikdas8900245198@gmail.com', '8597794746', '1234', 'jobseeker', 9, '2025-11-16 06:57:53', '2025-11-16 06:57:53'),
(11, 'arnab4581@gmail.com', '097499999', '12345678', 'jobseeker', 10, '2025-11-16 06:58:09', '2025-11-16 06:58:09'),
(12, 'arpanthe123@gmail.com', '6296981663', 'arpan@123', 'jobseeker', 11, '2025-11-16 07:00:09', '2025-11-16 07:00:09'),
(13, 'sudiptaparia2003@gmail.com', '8509163392', 'Sudipta@123', 'jobseeker', 12, '2025-11-16 07:00:40', '2025-11-16 07:00:40'),
(14, 'fake506.soumitra@gmail.com', '7868905436', 'soumitra', 'jobseeker', 13, '2025-11-16 07:01:58', '2025-11-16 07:01:58'),
(15, 'mr.sayansasmal18@gmail.com', '8167753469', 'suman@99', 'jobseeker', 14, '2025-11-16 07:04:52', '2025-11-16 07:04:52'),
(16, 'subhadip.pal2k@gmail.com', '09749788063', 'Tatai@2000', 'jobseeker', 15, '2025-11-16 07:05:07', '2025-11-16 07:05:07'),
(17, 'hari.kishore2604@gmail.com', '9474446158', 'hari@j2c2025', 'jobseeker', 16, '2025-11-16 07:06:51', '2025-11-16 07:06:51'),
(18, 'mahtopremnath07@gmail.com', '8745846542', 'Prem@123', 'jobseeker', 17, '2025-11-16 12:22:15', '2025-11-16 12:22:15'),
(19, 'sbera9885@gmail.com', '8101775367', 'Sushovan@123', 'jobseeker', 18, '2025-11-16 12:23:58', '2025-11-16 12:23:58'),
(20, 'janamahadeb743@gmail.com', '7797204344', 'Mahdeb009@', 'jobseeker', 19, '2025-11-16 12:24:51', '2025-11-16 12:24:51'),
(21, 'biswasd6@gmail.com', '7895677890', '8436967884', 'jobseeker', 20, '2025-11-16 12:25:25', '2025-11-16 12:25:25'),
(22, 'tpo@cemk.ac.in', '9830319129', 'Cemk1234', 'jobseeker', 21, '2025-11-16 12:28:24', '2025-11-16 12:28:24'),
(23, 'akashpatra1040@gmail.com', '9679346861', 'akash@j2c', 'jobseeker', 22, '2025-11-16 12:28:28', '2025-11-16 12:28:28'),
(24, 'contact@j2c.in', '7602171906', 'Anita@2000', 'employer', 3, '2025-11-26 14:22:27', '2025-11-26 14:22:27'),
(25, 'sdey68428@gmail.com', '8617494187', 'Sayan@1234', 'jobseeker', 23, '2025-12-07 17:23:21', '2025-12-07 17:23:21'),
(26, 'rakeshmalash956@gmail.com', '9800135855', 'Rakesh@123', 'jobseeker', 24, '2025-12-07 18:14:26', '2025-12-07 18:14:26'),
(27, 'mallickabdulrajibul@gmail.com', '7001069533', '2004@rajibul', 'jobseeker', 25, '2025-12-08 02:45:01', '2025-12-08 02:45:01'),
(28, 'gokulmsv21@gmail.com', '9345684583', 'Gokul@phoenix21', 'jobseeker', 26, '2025-12-13 13:49:43', '2025-12-13 13:49:43'),
(29, 'anitaacharjya@gmail.com', '8918872645', 'Anita@2000', 'jobseeker', 27, '2026-01-01 06:45:28', '2026-01-01 06:45:28'),
(30, 'soumya.297sahoo@gmail.com', '8599868758', 'Soumya@297', 'jobseeker', 28, '2026-01-07 14:57:02', '2026-01-07 14:57:02'),
(31, 'rituraj2615@gmail.com', '9006536080', 'ankit1@A', 'jobseeker', 29, '2026-01-08 16:03:36', '2026-01-08 16:03:36'),
(32, 'gourabofficial702@gmail.com', '6294692462', 'gourab@@04', 'jobseeker', 30, '2026-01-08 16:04:04', '2026-01-08 16:04:04'),
(33, 'ankitadas7802@gmail.com', '8695393874', 'ankita7802', 'jobseeker', 31, '2026-01-08 16:04:46', '2026-01-08 16:04:46'),
(34, 'haimantim1@gmail.com', '09832448641', 'Suchwna@2004', 'jobseeker', 32, '2026-01-08 16:08:33', '2026-01-08 16:08:33'),
(35, 'anuragkarmakar09@gmail.com', '8016770489', 'Anurag@pcs123', 'jobseeker', 33, '2026-01-08 16:10:47', '2026-01-08 16:10:47'),
(36, 'akashsamanta427@gmail.com', '8001974980', 'Akash@2002', 'jobseeker', 34, '2026-01-09 10:56:45', '2026-01-09 10:56:45'),
(37, 'chaudhuridebkanta@gmail.com', '7318990907', 'Debu@123', 'jobseeker', 35, '2026-01-09 10:58:08', '2026-01-09 10:58:08'),
(38, 'ikjasu04@gmail.com', '7439584952', 'Ik1@jasu', 'jobseeker', 36, '2026-01-09 10:59:30', '2026-01-09 10:59:30'),
(39, 'kalyanmaychakraborty6@gmail.com', '8653923627', '@kalyanmay24', 'jobseeker', 37, '2026-01-09 10:59:33', '2026-01-09 10:59:33'),
(40, 'ece23001@cemk.ac.in', '6297195842', 'ritam@1234', 'jobseeker', 38, '2026-01-09 10:59:37', '2026-01-09 10:59:37'),
(41, 'cse23186@cemk.ac.in', '6800743256', 'adwi@6', 'jobseeker', 39, '2026-01-09 10:59:45', '2026-01-09 10:59:45'),
(42, 'aditimondal2032@gmail.com', '9091719491', 'aditi@2005', 'jobseeker', 40, '2026-01-09 11:00:03', '2026-01-09 11:00:03'),
(43, 'madhuchhanda7777@gmail.com', '07439385883', '01052005', 'jobseeker', 41, '2026-01-09 11:00:13', '2026-01-09 11:00:13'),
(44, 'xamab11592@gopicta.com', '9090909090', 'J2c@123', 'jobseeker', 42, '2026-01-09 11:00:37', '2026-01-09 11:00:37'),
(45, 'tathagatadebnath41@gmail.com', '07047781165', 'Debnath1@', 'jobseeker', 43, '2026-01-09 11:00:43', '2026-01-09 11:00:43'),
(46, 'subhrangsudas31@gmail.com', '7908957796', 'career@123', 'jobseeker', 44, '2026-01-09 11:01:55', '2026-01-09 11:01:55'),
(47, 'aiml2356@cemk.ac.in', '9163891303', '2005', 'jobseeker', 45, '2026-01-09 11:03:14', '2026-01-09 11:03:14'),
(48, 'aiml2338@cemk.ac.in', '8207052476', 'Abhik2005', 'jobseeker', 46, '2026-01-09 11:03:31', '2026-01-09 11:03:31'),
(49, 'apabritaghosh04@gmail.com', '7319574458', 'apabrita@2004', 'jobseeker', 47, '2026-01-09 11:03:41', '2026-01-09 11:03:41'),
(50, 'aiml2330@cemk.ac.in', '8597658433', 'root', 'jobseeker', 48, '2026-01-09 11:03:56', '2026-01-09 11:03:56'),
(51, 'shreyapal622@gmail.com', '6297979661', 'Shreya@2005', 'jobseeker', 49, '2026-01-09 11:05:17', '2026-01-09 11:05:17'),
(52, 'it2345@cemk.ac.in', '6296820615', 'koyelmanna', 'jobseeker', 50, '2026-01-09 11:05:40', '2026-01-09 11:05:40'),
(53, 'souravghoshmr1@gmail.com', '9798847565', 'Sourav@123', 'jobseeker', 51, '2026-01-09 11:05:50', '2026-01-09 11:05:50'),
(54, 'deyneelkanth2005@gmail.com', '9907305572', 'Neelkanth513@', 'jobseeker', 52, '2026-01-09 11:06:31', '2026-01-09 11:06:31'),
(55, 'cse23113@cemk.ac.in', '8509318008', 'College113', 'jobseeker', 53, '2026-01-09 11:06:36', '2026-01-09 11:06:36'),
(56, 'shreyabhowmik123@gmail.com', '9382265315', 'shreya@2004', 'jobseeker', 54, '2026-01-09 11:06:56', '2026-01-09 11:06:56'),
(57, 'soumiliparai@gmail.com', '7908830445', 'soumili321', 'jobseeker', 55, '2026-01-09 11:07:34', '2026-01-09 11:07:34'),
(58, 'SahaSania2005@gmail.com', '07365950664', 'Sana@0609', 'jobseeker', 56, '2026-01-09 11:07:37', '2026-01-09 11:07:37'),
(59, 'cse23187@cemk.ac.in', '9046557364', 'Somdeb@1234', 'jobseeker', 57, '2026-01-09 11:08:36', '2026-01-09 11:08:36'),
(60, 'dasniladri20067@gmail.com', '6297532090', 'Niladri#1234', 'jobseeker', 58, '2026-01-15 04:30:14', '2026-01-15 04:30:14'),
(61, 'ritamsarangi3@gmail.com', '7319564388', 'ritam@2005', 'jobseeker', 59, '2026-01-15 04:32:41', '2026-01-15 04:32:41'),
(62, 'cse23088@cemk.ac.in', '09933621793', 'Rima@1234', 'jobseeker', 60, '2026-01-15 04:33:03', '2026-01-15 04:33:03'),
(63, 'sreejandas2305@gmail.com', '6289849806', 'sreejan@2005', 'jobseeker', 61, '2026-01-15 04:33:15', '2026-01-15 04:33:15'),
(64, 'shoumikkhan09@gmail.com', '7047640129', 'Shoumik04#', 'jobseeker', 62, '2026-01-15 04:33:40', '2026-01-15 04:33:40'),
(65, 'avikmitra1717@gmail.com', '9830871918', 'avikmitra2005', 'jobseeker', 63, '2026-01-15 04:33:59', '2026-01-15 04:33:59'),
(66, 'vivekgoswami.info@gmail.com', '0', '0', 'jobseeker', 64, '2026-01-15 04:34:09', '2026-01-15 04:34:09'),
(67, 'arpanguchhait2023@gmail.com', '9883683496', 'Arpan@2004', 'jobseeker', 65, '2026-01-15 04:34:15', '2026-01-15 04:34:15'),
(68, 'mondalbittu047@gmail.com', '7020058928', 'Bittu@2004', 'jobseeker', 66, '2026-01-15 04:35:54', '2026-01-15 04:35:54'),
(69, 'dipanwitaghara@gmail.com', '8670928443', 'dipu@2014', 'jobseeker', 67, '2026-01-15 04:35:59', '2026-01-15 04:35:59'),
(70, 'aiml2345@cemk.ac.in', '8293086585', 'samba@2004', 'jobseeker', 68, '2026-01-15 04:36:41', '2026-01-15 04:36:41'),
(71, 'bhattacharyasayak977@gmail.com', '8240538201', 'Sayak@2004#', 'jobseeker', 69, '2026-01-15 04:37:13', '2026-01-15 04:37:13'),
(72, 'anshudas873@gmail.com', '9163950523', 'Apurba123$', 'jobseeker', 70, '2026-01-15 04:40:05', '2026-01-15 04:40:05'),
(73, 'ece23004@cemk.ac.in', '7585962139', '758596', 'jobseeker', 71, '2026-01-15 04:41:15', '2026-01-15 04:41:15'),
(74, 'shrabana.ghorai@gmail.com', '7319167201', '834855', 'jobseeker', 72, '2026-01-15 04:41:47', '2026-01-15 04:41:47'),
(75, 'anubhavbasuli99@gmail.com', '7029399278', 'Anubhav@12', 'jobseeker', 73, '2026-01-15 04:42:45', '2026-01-15 04:42:45'),
(76, 'cse23101@cemk.ac.in', '08900418337', 'f7f4zKtFgYEpPKT', 'jobseeker', 74, '2026-01-15 04:43:36', '2026-01-15 04:43:36'),
(77, 'gureysayandeb@gmail.com', '7583910229', 'SS182304', 'jobseeker', 75, '2026-01-15 04:43:39', '2026-01-15 04:43:39'),
(78, 'ece23005@cemk.ac.in', '9907618060', '1234567890', 'jobseeker', 76, '2026-01-15 04:44:20', '2026-01-15 04:44:20'),
(79, 'ece23026@cemk.ac.in', '7602003101', 'PAVILION', 'jobseeker', 77, '2026-01-15 04:45:24', '2026-01-15 04:45:24'),
(80, 'tanushree25bagchi@gmail.com', '9073847955', '-9R>w7kwf))5b~j', 'jobseeker', 78, '2026-01-15 04:46:28', '2026-01-15 04:46:28'),
(81, 'aiml2315@cemk.ac.in', '7003132239', 'bithi21', 'jobseeker', 79, '2026-01-15 04:47:09', '2026-01-15 04:47:09'),
(82, 'skhabib1812@gmail.com', '8609270502', 'Jewel_2003', 'jobseeker', 80, '2026-01-15 04:47:48', '2026-01-15 04:47:48'),
(83, 'maitydebasmita52@gmail.com', '08016938531', 'mistu2310', 'jobseeker', 81, '2026-01-15 04:47:55', '2026-01-15 04:47:55'),
(84, 'cse23134@cemk.ac.in', '9933013071', '234376', 'jobseeker', 82, '2026-01-15 04:51:19', '2026-01-15 04:51:19'),
(85, 'cse23050@cemk.ac.in', '7602098803', '7602098803', 'jobseeker', 83, '2026-01-15 04:52:34', '2026-01-15 04:52:34'),
(86, 'maishafarhin05@gmail.com', '8910841644', 'Maisha_2005', 'jobseeker', 84, '2026-01-15 04:56:25', '2026-01-15 04:56:25'),
(87, 'iamayan.samanta15@gmail.com', '8609020869', 'Rahul@2404', 'jobseeker', 85, '2026-01-15 04:58:48', '2026-01-15 04:58:48'),
(88, 'ayanmakar90@gmail.com', '9382721650', 'ayan@makar90j2c', 'jobseeker', 86, '2026-01-15 05:09:14', '2026-01-15 05:09:14'),
(89, 'sksahanowaj046@gmail.com', '8967715443', 'cse23161ir', 'jobseeker', 87, '2026-01-15 13:49:33', '2026-01-15 13:49:33'),
(90, 'murarimohandas584@gmail.com', '7479052852', 'neon123', 'jobseeker', 88, '2026-01-15 14:25:07', '2026-01-15 14:25:07'),
(91, 'debarthamondal82@gmail.com', '7602668523', 'Rocky@2005', 'jobseeker', 89, '2026-01-15 15:37:12', '2026-01-15 15:37:12'),
(92, 'cse24l199@cemk.ac.in', '7810859901', '2607', 'jobseeker', 90, '2026-01-15 16:42:05', '2026-01-15 16:42:05'),
(93, 'cse24l200@cemk.ac.in', '8116119521', 'Sou@2004', 'jobseeker', 91, '2026-01-15 16:51:29', '2026-01-15 16:51:29'),
(94, 'cse24l205@cemk.ac.in', '7430826866', 'susmita@@123', 'jobseeker', 92, '2026-01-15 17:05:58', '2026-01-15 17:05:58'),
(95, 'sohammondal965431@gmail.com', '7439528043', 'Mondal@2004', 'jobseeker', 93, '2026-01-15 19:13:54', '2026-01-15 19:13:54'),
(96, 'shubhajitmaity62900@gmail.com', '08100644737', 'Shubha@2005', 'jobseeker', 94, '2026-01-16 05:13:43', '2026-01-16 05:13:43'),
(97, 'rajeshmondal4928@gmail.com', '9907375956', 'it2308cemk@', 'jobseeker', 95, '2026-01-16 05:37:14', '2026-01-16 05:37:14'),
(98, 'sujitmaity0485@gmail.com', '9907414851', 'Sujit@2005', 'jobseeker', 96, '2026-01-16 05:37:32', '2026-01-16 05:37:32'),
(99, 'janamoumita777@gmail.com', '9733192180', 'Moumita @22', 'jobseeker', 97, '2026-01-16 05:54:06', '2026-01-16 05:54:06'),
(100, 'subhanuralam@gmail.com', '9883911575', 'Subhanur@10', 'jobseeker', 98, '2026-01-16 05:54:08', '2026-01-16 05:54:08'),
(101, 'sailenp052@gmail.com', '8167536990', 'sailen@123', 'jobseeker', 99, '2026-01-16 05:57:30', '2026-01-16 05:57:30'),
(102, 'cse23157@cemk.ac.in', '9635649726', 'Dey@2004', 'jobseeker', 100, '2026-01-16 06:09:40', '2026-01-16 06:09:40'),
(103, 'snehamahish51@gmail.com', '8101574149', '@Rohit45', 'jobseeker', 101, '2026-01-16 06:10:37', '2026-01-16 06:10:37'),
(104, 'ece23039@cemk.ac.in', '9907126831', '12345678', 'jobseeker', 102, '2026-01-16 06:36:51', '2026-01-16 06:36:51'),
(105, 'ece23049@cemk.ac.in', '8145924839', '9248', 'jobseeker', 103, '2026-01-16 06:47:08', '2026-01-16 06:47:08'),
(106, 'it2332@cemk.ac.in', '9339520170', 'KOUSIK2005', 'jobseeker', 104, '2026-01-16 06:54:05', '2026-01-16 06:54:05'),
(107, 'sarthaktung@gmail.com', '8436616176', 'sarthak2004*', 'jobseeker', 105, '2026-01-16 07:44:58', '2026-01-16 07:44:58'),
(108, 'sagarmanna963@gmail.com', '7449528531', 'sagar@2005', 'jobseeker', 106, '2026-01-16 14:41:56', '2026-01-16 14:41:56'),
(109, 'cse24l201@cemk.ac.in', '8509681340', '8523', 'jobseeker', 107, '2026-01-17 03:12:47', '2026-01-17 03:12:47'),
(110, 'pallabdey2005@gmail.com', '9330825336', 'Pallab@123', 'jobseeker', 108, '2026-01-17 08:44:05', '2026-01-17 08:44:05'),
(111, 'sksanny50@gmail.com', '8768150551', 'sknafisali2027', 'jobseeker', 109, '2026-01-17 14:04:06', '2026-01-17 14:04:06'),
(112, 'cse23009@cemk.ac.in', '9051410466', 'j2cpass', 'jobseeker', 110, '2026-01-18 04:14:42', '2026-01-18 04:14:42'),
(113, 'duttaisita0@gmail.com', '8597731369', 'isita123', 'jobseeker', 111, '2026-01-18 04:49:03', '2026-01-18 04:49:03'),
(114, 'www.bristimondal2004@gmail.com', '7436795266', 'Mindal@2023', 'jobseeker', 112, '2026-01-18 04:50:05', '2026-01-18 04:50:05'),
(115, 'cse23040@cemk.ac.in', '7477732863', 'debalina123', 'jobseeker', 113, '2026-01-18 04:59:43', '2026-01-18 04:59:43'),
(116, 'pulagamabhimanyu04@gmail.com', '06295173889', 'Abhi1234', 'jobseeker', 114, '2026-01-18 05:23:49', '2026-01-18 05:23:49'),
(117, 'subhamdinda863@gmail.com', '6295666379', 'subha12345', 'jobseeker', 115, '2026-01-18 06:22:19', '2026-01-18 06:22:19'),
(118, 'cse23057@cemk.ac.in', '7980322987', 'Kamana@23', 'jobseeker', 116, '2026-01-18 08:01:17', '2026-01-18 08:01:17'),
(119, 'saibaljana76@gmail.com', '8436350842', 'Saibal123', 'jobseeker', 117, '2026-02-12 07:04:25', '2026-02-12 07:04:25'),
(120, 'firdaushkhan42@gmail.com', '8800983125', 'khansahab', 'jobseeker', 118, '2026-02-12 18:24:02', '2026-02-12 18:24:02'),
(121, 'shindeshubhamsharad@gmail.com', '9130830429', 'Shubham@2511', 'jobseeker', 119, '2026-02-13 10:04:55', '2026-02-13 10:04:55'),
(122, 'sakshichoudhary030@gmail.com', '7667117751', 'Joules@0508', 'jobseeker', 120, '2026-02-13 15:55:12', '2026-02-13 15:55:12'),
(127, 'hr@pcsgpl.com', '8918872645', 'Anita@2000', 'employer', 8, '2026-02-21 10:06:29', '2026-02-21 10:06:29'),
(128, 'sutanumondal0@gmail.com', '8372045195', '     ', 'jobseeker', 121, '2026-02-21 16:44:18', '2026-02-21 16:44:18'),
(129, 'sutanu.mondal@aot.edu.in', '8372045195', '12345', 'employer', 9, '2026-02-21 17:02:35', '2026-02-21 17:02:35'),
(130, 'nikhils9802@gmail.com', '8800801043', 'J2C@9802', 'jobseeker', 122, '2026-02-22 07:55:01', '2026-02-22 07:55:01'),
(131, 'adwitighosh08@gmail.com', '7477689224', 'Adwiti@9', 'jobseeker', 123, '2026-02-23 08:51:11', '2026-02-23 08:51:11'),
(132, 'shibukumar9000@gmail.com', '8002659429', 'Shibu@0766', 'jobseeker', 124, '2026-02-23 09:21:15', '2026-02-23 09:21:15'),
(133, 'vinayakavinni868@gmail.com', '7786357714', '1234', 'jobseeker', 125, '2026-02-27 16:11:41', '2026-02-27 16:11:41'),
(135, 'sauravmallick41@gmail.com', '6290551506', 'Saurav96@', 'jobseeker', 126, '2026-03-09 14:47:01', '2026-03-09 14:47:01'),
(136, 'vinayakavinni696@gmail.com', '8563958475', 'Vinni@2003', 'jobseeker', 127, '2026-03-14 03:56:37', '2026-03-14 03:56:37'),
(138, 'anitaacharjya20166@gmail.com', '9933879225', 'Anita@2000', 'jobseeker', 129, '2026-03-14 05:09:04', '2026-03-14 05:09:04'),
(139, 'onboard@pcsgpl.com', '7602171909', 'Anita@2000', 'employer', 11, '2026-03-16 14:45:06', '2026-03-16 14:45:06'),
(140, 'kakamoni12345@gmail.com', '8583005957', 'admin', 'jobseeker', 130, '2026-03-21 05:25:00', '2026-03-21 05:25:00'),
(141, 's13669462@gmail.com', '565646464646', 's13669462', 'jobseeker', 131, '2026-04-02 05:33:57', '2026-04-02 05:33:57'),
(142, 'kiruthikam0466@gmail.com', '8870721433', 'Kiruthika@2312', 'jobseeker', 132, '2026-04-17 05:49:30', '2026-04-17 05:49:30'),
(143, 'nisha2352005@gmail.com', '6379932414', 'Nisha_2305', 'jobseeker', 133, '2026-04-17 05:58:55', '2026-04-17 05:58:55'),
(144, '2003keerthanag@gmail.com', '8639339137', '#Keerthana@123#', 'jobseeker', 134, '2026-04-19 13:17:06', '2026-04-19 13:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_count`
--

CREATE TABLE `visitor_count` (
  `id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_count`
--

INSERT INTO `visitor_count` (`id`, `count`) VALUES
(1, 10012);

-- --------------------------------------------------------

--
-- Table structure for table `visitor_log`
--

CREATE TABLE `visitor_log` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `visit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_log`
--

INSERT INTO `visitor_log` (`id`, `ip_address`, `visit_date`) VALUES
(1, '0:0:0:0:0:0:0:1', '2026-04-27'),
(2, '27.122.61.13', '2026-04-27'),
(3, '17.246.23.44', '2026-04-28'),
(4, '202.141.65.253', '2026-04-28'),
(5, '42.105.195.151', '2026-04-28'),
(6, '45.251.234.50', '2026-04-29'),
(7, '47.77.228.238', '2026-04-30'),
(8, '66.249.70.164', '2026-04-30'),
(9, '66.249.70.166', '2026-04-30'),
(10, '52.167.144.171', '2026-04-30'),
(11, '115.187.38.235', '2026-04-30');

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
-- Indexes for table `archived_internships`
--
ALTER TABLE `archived_internships`
  ADD PRIMARY KEY (`archive_id`);

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
  ADD PRIMARY KEY (`campaign_id`),
  ADD KEY `idx_campaign_status` (`status`);

--
-- Indexes for table `campaign_images`
--
ALTER TABLE `campaign_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_logs`
--
ALTER TABLE `campaign_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `career_gap_candidates`
--
ALTER TABLE `career_gap_candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `mobile_2` (`mobile`),
  ADD UNIQUE KEY `email_3` (`email`);

--
-- Indexes for table `college_emails`
--
ALTER TABLE `college_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
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
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `internship_id` (`internship_id`,`student_email`);

--
-- Indexes for table `internship_postings`
--
ALTER TABLE `internship_postings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internship_registrations`
--
ALTER TABLE `internship_registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
-- Indexes for table `saved_internships`
--
ALTER TABLE `saved_internships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_save` (`internship_id`,`jobseeker_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `visitor_count`
--
ALTER TABLE `visitor_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_log`
--
ALTER TABLE `visitor_log`
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
-- AUTO_INCREMENT for table `archived_internships`
--
ALTER TABLE `archived_internships`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `campaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaign_images`
--
ALTER TABLE `campaign_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `campaign_logs`
--
ALTER TABLE `campaign_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_gap_candidates`
--
ALTER TABLE `career_gap_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `college_emails`
--
ALTER TABLE `college_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=983;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_registrations`
--
ALTER TABLE `course_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `deleted_internships`
--
ALTER TABLE `deleted_internships`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_jobs`
--
ALTER TABLE `deleted_jobs`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `education_history`
--
ALTER TABLE `education_history`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employer_personal_details`
--
ALTER TABLE `employer_personal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employer_plans`
--
ALTER TABLE `employer_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internship_applications`
--
ALTER TABLE `internship_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internship_postings`
--
ALTER TABLE `internship_postings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `internship_registrations`
--
ALTER TABLE `internship_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `jobseeker_experience`
--
ALTER TABLE `jobseeker_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobseeker_projects`
--
ALTER TABLE `jobseeker_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs_connections`
--
ALTER TABLE `jobs_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `job_master`
--
ALTER TABLE `job_master`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `job_titles`
--
ALTER TABLE `job_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `login_master`
--
ALTER TABLE `login_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
-- AUTO_INCREMENT for table `saved_internships`
--
ALTER TABLE `saved_internships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `visitor_log`
--
ALTER TABLE `visitor_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `education_history`
--
ALTER TABLE `education_history`
  ADD CONSTRAINT `FK_education_history_basicinfo` FOREIGN KEY (`userid`) REFERENCES `basic_info` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `internship_applications`
--
ALTER TABLE `internship_applications`
  ADD CONSTRAINT `internship_applications_ibfk_1` FOREIGN KEY (`internship_id`) REFERENCES `internship_postings` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `job_applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobseekers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_internships`
--
ALTER TABLE `saved_internships`
  ADD CONSTRAINT `saved_internships_ibfk_1` FOREIGN KEY (`internship_id`) REFERENCES `internship_postings` (`id`) ON DELETE CASCADE;

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

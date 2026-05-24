-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:40 PM
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
-- Database: `financedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `email` varchar(405) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(450) DEFAULT NULL,
  `name` varchar(450) DEFAULT NULL,
  `empid` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `email`, `password`, `role`, `name`, `empid`) VALUES
(1, 'hr@pcsglobal.in', 'PCSGPL##2025', 'admin', NULL, NULL),
(4, 'khushbuh440@gmail.com', 'PCSGPL##2742', 'sales', 'Khusbu Hasani', '2742'),
(5, 'ishatul786@gmail.com', 'PCSGPL##786', 'sales', 'Ishan Mallick', '100'),
(6, 'sunitchaudhuri@pcsglobal.in', 'PCSGPL##2025', 'sales', 'Sunit Chaudhuri', '1001');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expense_id` int(11) NOT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `expenses_by` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `income_id` int(11) NOT NULL,
  `payment_amount` double DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `installment_type` varchar(10) DEFAULT NULL,
  `number_of_installments` int(11) DEFAULT NULL,
  `income_date` date DEFAULT NULL,
  `process_type` varchar(10) DEFAULT NULL,
  `process_by` varchar(450) DEFAULT NULL,
  `installment_amount` varchar(405) DEFAULT NULL,
  `empid` varchar(450) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'SUBMITTED',
  `payment_proof` varchar(255) DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `drive_file_id` varchar(100) DEFAULT NULL,
  `drive_file_name` varchar(255) DEFAULT NULL,
  `admin_email` varchar(45) DEFAULT NULL,
  `invoice_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`income_id`, `payment_amount`, `customer_name`, `email`, `phone_number`, `installment_type`, `number_of_installments`, `income_date`, `process_type`, `process_by`, `installment_amount`, `empid`, `payment_status`, `payment_proof`, `submitted_at`, `drive_file_id`, `drive_file_name`, `admin_email`, `invoice_file`) VALUES
(1, 11800, 'Bidisha Ghosh', 'hr@pcsglobal.in', '8697741611', 'Partial', 2, '2025-03-05', 'CIELP', NULL, NULL, NULL, 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(2, 5900, 'Aman Pal', 'pal1411.aman@gmail.com', '9044178198', 'Full', 1, '2025-04-03', 'OTHERS', 'Rakshanda', '5900', '2908', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(7, 11800, 'Bidisha Ghosh', 'ghoshb2098@gmail.com', '8697468330', 'Partial', 2, '2025-03-05', 'CIELP', 'Sunit Chaudhuri', '11800', '1051', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(8, 590, 'Ashish Mohakud', 'sunitchaudhuri@pcsgpl.com', '6370274713', 'Full', 0, '2025-03-19', 'OTHERS', 'Sunit/Rakshanda', '590', '1051', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(9, 5900, 'Ashish Kumar Sah', 'ashishkumarbrp@gmail.com', '7001884399', 'Full', 0, '2025-03-25', 'OTHERS', 'Sunit Chaudhuri', '0', '1051', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(10, 5900, 'Garish Kumar Bansal', 'bansalgarish@gmail.com', '7428074671', 'Full', 0, '2025-03-25', 'OTHERS', 'Sunit Chaudhuri', '0', '1051', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(11, 25000, 'Munmun Das', 'munmund1501@gmail.com', '9830933123', 'Full', 0, '2025-05-29', 'OTHERS', 'Alok/Sunit', '0', '1051', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(12, 17700, 'Arnab Chakraborty', 'ac858644@gmail.com', '9434168024', 'Full', 0, '2025-04-07', 'CIELP', 'Sunit', '0', '1051', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(13, 11800, 'Bidisha Ghosh', 'ghoshb2098@gmail.com', '8697468330', 'Partial', 2, '2025-04-11', 'CIELP', 'Sunit', '11800', '1051', 'SUBMITTED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(14, 590, 'Nitin Sharma', 'nitinsharma814585@gmail.com', '8293058610', 'Full', 1, '2025-05-13', 'OTHERS', 'Rakshanda', '590', '2908', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(15, 590, 'Sharath Kumar', 'sharath2002n@gmail.com', '9951347087', 'Full', 1, '2025-05-22', 'OTHERS', 'Rakshanda', '590', '2908', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, NULL, NULL),
(16, 1000, 'Subhrangshu', 'subhrangsudas31@gmail.com', '7908957796', 'Full', 0, '2026-02-04', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(17, 1000, 'Poulami Das', 'poulamid436@gmail.com', '9907590545', 'Full', 0, '2026-02-03', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(18, 1000, 'Sayan biswas', 'sybisuas115@gmail.com', '9051410466', 'Full', 0, '2026-02-04', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(19, 1000, 'Srijita Chanda ', 'srijita@gmail.com', '9563855300', 'Full', 0, '2026-02-04', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(20, 1000, 'Debasmita samanta ', 'mahatodebashis02@gmail.com', '9641054368', 'Full', 0, '2026-02-04', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(21, 1000, 'Nayanika Raha', 'Nayanika@gmail.com', '7098854336', 'Full', 0, '2026-02-05', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(23, 1000, 'Sayantan Paul', 'sayantan22100@gmail.com', '8317852507', 'Full', 2, '2026-02-05', 'OTHERS', 'Ishan', '1000', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(24, 1000, 'Susmita sau', 'susmitasau7030@gmail.com', '7430826866', 'Full', 0, '2026-02-05', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(25, 1000, 'SNEHIL JOSHI', 'snehiljoshi17@gmail.com', '9753875834', 'Full', 0, '2026-02-05', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(26, 1000, 'ANIRUDDHA DAS', 'aniruddha0083@gmail.com', '6290876775', 'Full', 0, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(27, 1000, 'Riteshna Mahapatra', 'dineshmahapatra2279@gmail.com', '8509681340', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(29, 1000, 'NILKANTHA ', 'nilkantha@gmail.com', '9907305572', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(30, 1000, 'Ik Jasu', 'ikjasu04@gmail.com', '7439584952', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(31, 1000, 'Nayana Manna', 'cse23145@cemk.ac.in', '9907479312', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(32, 1000, 'duttaisita0@gmail.com', 'duttaisita0@gmail.com', '8597731369', 'Full', NULL, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(33, 1000, 'SANGLAP DAS', 'sanglap@gmail.com', '8170908550', 'Full', 0, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(34, 1000, 'Ranajeet Bera', 'cse23057@cemk.ac.in', '7980322987', 'Full', 0, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(35, 1000, 'Shreya Pal', 'shreyapal9661@gmail.com', '6297979661', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(36, 1000, 'Sohasini Adgiri', 'vival.smith@gmail.com', '8348952100', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(37, 1000, 'swapnil', 'Swapnilmanna157@gmail.com', '7439586322', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(39, 1000, 'Pramit Mondal', 'pramit@gmail.com', '9547719016', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(40, 1000, 'Akash Samanta', 'akashsamantaofficial@gmail.com', '8001974980', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(41, 1000, 'IMROZ AHAMED', 'imrozmur@gmail.com', '6296666257', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(42, 1000, 'Riya Dey', 'nisade94@gmail.com', '7601906077', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(43, 1000, 'RANITA PAUL', 'paulranita90@gmail.com', '7810859901', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(44, 1000, 'Shrayajyoti Dey', 'shrayajyotidey04@gmail.com', '9635649726', 'Full', NULL, '2026-02-06', 'OTHERS', 'Ishan', '0', '100', 'REJECTED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(46, 1000, 'Sindrela Mondal', 'sindrela7855@gmail.com', '7908007855', 'Full', NULL, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(47, 1000, 'Priyanka Shaw', 'priyankasw09@gmail.com', '7439465715', 'Full', NULL, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(48, 1000, 'SRAWAN SINGH RAJPUT', 'srawansr07@gmail.com', '9382582019', 'Full', NULL, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(49, 1000, 'Monali Sasmal', 'cse23134@cemk.ac.in', '9933013071', 'Full', NULL, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(51, 1000, 'Apabrita Ghosh', 'apabrita@gmail.com', '7319574458', 'Full', 0, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(52, 1000, 'SUBHRANIL', 'subhranil@gmailcom', '9735743093', 'Full', NULL, '2026-02-07', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 09:35:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(53, 1000, 'Ritam sarkar', 'sarkar@gmail.com', '8768682760', 'Full', NULL, '2026-02-09', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 13:12:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(55, 1000, 'Rupam sarkar', 'sarkar@gmail.com', '9563056017', 'Full', NULL, '2026-02-09', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 13:14:51', NULL, NULL, 'ishatul786@gmail.com', NULL),
(56, 1000, 'Aitik bera ', 'beraaitik@gmail.com', '8653084606', 'Full', NULL, '2026-02-09', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-09 13:20:53', NULL, NULL, 'ishatul786@gmail.com', NULL),
(57, 1000, 'Subhajit chanda', 'subhajitchandra@gmail.com', '8016473461', 'Full', NULL, '2026-02-10', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-10 06:55:45', NULL, NULL, 'ishatul786@gmail.com', NULL),
(58, 1000, 'Poornima R Kemmanakeri', 'poonima@gmail.com', '9611950296', 'Full', NULL, '2026-02-11', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-12 06:58:05', NULL, NULL, 'ishatul786@gmail.com', NULL),
(59, 1000, 'Sania', 'sania@gmail.com', '8001925659', 'Full', NULL, '2026-02-11', 'OTHERS', 'Ishan', '0', '100', 'APPROVED', NULL, '2026-02-12 07:25:54', NULL, NULL, 'ishatul786@gmail.com', NULL),
(62, 1000, 'Anisha KK', 'anishakrish27@gmail.com', '6380223027', NULL, NULL, NULL, 'SIP', NULL, NULL, NULL, 'APPROVED', '1Rc-bRZlmKTWnyDwjv-9NpaLGhB4V2db5', '2026-02-20 09:42:08', NULL, NULL, 'ishatul786@gmail.com', NULL),
(63, 1000, 'sujoy patra', 'patrasujoy92@gmail.com', '8927901048', NULL, NULL, NULL, 'CELP', NULL, NULL, NULL, 'APPROVED', '1OAZkDwFsjlYoUOuQp_b4hK61ikauy0yi', '2026-02-22 07:24:14', NULL, NULL, 'ishatul786@gmail.com', NULL),
(64, 1000, 'Chaitali Patra ', 'chaitalipatra587@gmail.com', '7551825159', NULL, NULL, NULL, 'CELP', NULL, NULL, NULL, 'APPROVED', '1fSokTnllFBapYp3XZhQerNwY7ahGyzLQ', '2026-03-09 10:08:59', NULL, NULL, 'ishatul786@gmail.com', NULL),
(65, 1, 'Anita Acharjya', 'anitaacharjya9539@gmail.com', '7602171906', NULL, NULL, NULL, 'OTHERS', NULL, NULL, NULL, 'APPROVED', '1UGsKt4uLk68L9PjQXrFbVGs3IXnizycK', '2026-04-01 06:16:17', NULL, NULL, 'sunitchaudhuri@pcsglobal.in', NULL),
(66, 1, 'Test', 'anitaacharjya9539@gmail.com', '7602171906', NULL, NULL, NULL, 'SIP', NULL, NULL, NULL, 'APPROVED', '1E-H9GTnsBv8dpj7_Z1u0iFk6bjgP2p94', '2026-04-01 08:28:53', NULL, NULL, 'sunitchaudhuri@pcsglobal.in', NULL),
(67, 1, 'Amrita Acharjya', 'anitaacharjya9539@gmail.com', '9933879225', NULL, NULL, NULL, 'SIP', NULL, NULL, NULL, 'APPROVED', '12iuoQvZ_EJBuMltBDpHgmDbxbsTiLF9k', '2026-04-01 08:47:43', NULL, NULL, 'sunitchaudhuri@pcsglobal.in', '1XKviCmuTllPAJWm70VmudhUoBLqmn2nm'),
(68, 1, 'Anita Acharjya', 'anitaacharjya9539@gmail.com', '7602171906', NULL, NULL, NULL, 'SIP', NULL, NULL, NULL, 'APPROVED', '1b0TDv05BmyRx7fuU8f8aWil4df39YyRj', '2026-04-07 13:37:18', NULL, NULL, 'sunitchaudhuri@pcsglobal.in', '1WzI-c5o1qG-sexk9lIaSx0-pAwoDmv8O'),
(69, 1180, 'MD ANAS', 'mdanasshaikh295@gmail.com', '9319308945', NULL, NULL, NULL, 'CELP', NULL, NULL, NULL, 'APPROVED', '1XPIOIfmIJ0MY9cJbhfhLvV4CKm_Kf6o-', '2026-04-13 06:11:48', NULL, NULL, 'ishatul786@gmail.com', '1SA8MB4RivWwHIdfzWsAVGFDnyc8OtPu2'),
(70, 3000, 'Tusar kanti samanta', 'kantisamantatusar@gmail.com', '8972179958', NULL, NULL, NULL, 'SIP', NULL, NULL, NULL, 'SUBMITTED', '1u_nqoDLvzwDQTzAUZnS97ZcGxylOnjiX', '2026-04-28 14:46:24', NULL, NULL, 'ishatul786@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_otp`
--

CREATE TABLE `payment_otp` (
  `id` int(11) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `expiry_time` datetime NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `attempts` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_otp`
--

INSERT INTO `payment_otp` (`id`, `token`, `email`, `otp`, `expiry_time`, `verified`, `created_at`, `attempts`) VALUES
(2, 'f1a9867bc03340ea9a4afd6ddbe2206e', 'anitaacharjya9539@gmail.com', '797174', '2026-02-10 18:52:53', 0, '2026-02-10 13:17:53', 0),
(3, '7aa3fd0b3d7a4eae9d75a929ec99b908', 'anitaacharjya9539@gmail.com', '607887', '2026-02-10 19:03:35', 0, '2026-02-10 13:28:35', 0),
(4, 'feaf844f725a4755903a5f942607c6d1', 'anitaacharjya9539@gmail.com', '582201', '2026-02-10 19:12:48', 1, '2026-02-10 13:37:48', 0),
(5, 'f5374c3347924a70877ddcdc2dab10a9', 'anitaacharjya9539@gmail.com', '191933', '2026-02-10 21:03:52', 1, '2026-02-10 15:28:52', 0),
(6, '63eae0b0695542918b4d56852061baa9', 'anitaacharjya9539@gmail.com', '618311', '2026-02-12 20:25:36', 1, '2026-02-12 14:50:36', 0),
(7, '36252bc947b547218cc9c02f92343fd0', 'anitaacharjya9539@gmail.com', '235891', '2026-02-12 21:41:06', 1, '2026-02-12 16:06:06', 0),
(8, '4ae9199dafa64d3291cea5b29f7b1b85', 'alokhalder@gmail.com', '315420', '2026-02-13 00:54:55', 1, '2026-02-12 19:19:55', 0),
(9, '9018a2c6aba34d84aaa67e875e84cafe', 'alokhalder@gmail.com', '573084', '2026-02-20 14:58:54', 1, '2026-02-20 09:23:54', 0),
(11, '9ec04c553b8c45f8ac7f880a65597b05', 'anishakrish27@gmail.com', '735945', '2026-02-20 15:13:04', 1, '2026-02-20 09:38:04', 0),
(16, '5b755ec1d384474280c63cfa9bfa45e1', 'patrasujoy92@gmail.com', '492706', '2026-02-21 14:21:37', 1, '2026-02-21 08:46:37', 0),
(17, '32f67cb39e7646d2bf78f88c354b82f0', 'patrasujoy92@gmail.com', '937486', '2026-02-22 12:56:45', 1, '2026-02-22 07:21:45', 0),
(18, '0d08fad3f63047e0b3477ada83efc45a', 'khushbuh440@gmail.com', '237453', '2026-02-27 19:34:22', 1, '2026-02-27 13:59:22', 0),
(19, '8ddad29785f54b8ab4372a34fa40ac3b', 'khushbuh440@gmail.com', '722829', '2026-03-08 19:12:31', 1, '2026-03-08 13:37:31', 0),
(20, '041921b9dd244679809ec682599b2e19', 'chaitalipatra587@gmail.com', '576211', '2026-03-09 15:40:38', 1, '2026-03-09 10:05:38', 0),
(23, 'e67613f4b97a4f54b204e88df8d9b807', 'sudipc014@gmail.com', '568476', '2026-03-11 19:19:02', 1, '2026-03-11 13:44:02', 0),
(24, '5e8f4dc4124646ba89dae66d2516bf7a', 'harapriyamohantyhpm@gmail.com', '380514', '2026-03-14 13:20:06', 1, '2026-03-14 07:45:06', 0),
(25, 'aa537a235e0547f4b21b5d58e8f826e0', 'anitaacharjya9539@gmail.com', '564265', '2026-04-01 11:47:49', 1, '2026-04-01 06:12:49', 0),
(26, 'b583311f52304d6baa367a3a0a650aa1', 'anitaacharjya9539@gmail.com', '711582', '2026-04-01 14:02:28', 1, '2026-04-01 08:27:28', 0),
(27, '347c12f5547c458e8360746c664f8c9b', 'anitaacharjya9539@gmail.com', '702601', '2026-04-01 14:16:54', 1, '2026-04-01 08:41:54', 0),
(28, '950ea05725ec4634a35f8c70531db6e8', 'anitaacharjya9539@gmail.com', '683735', '2026-04-07 19:11:18', 1, '2026-04-07 13:36:18', 0),
(32, '7a4893b7179549e9807eeda2258761d5', 'mdanasshaikh295@gmail.com', '934796', '2026-04-13 11:43:56', 1, '2026-04-13 06:08:56', 0),
(33, 'ca1817a78cbb43bda21da4fc5ff189ea', 'subhamchakraborty706@gmail.com', '725823', '2026-04-25 14:54:45', 1, '2026-04-25 09:19:45', 0),
(34, '8bab44510b1e415ea901e68611d195ba', 'kantisamantatusar@gmail.com', '490043', '2026-04-28 20:14:55', 1, '2026-04-28 14:39:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_tokens`
--

CREATE TABLE `payment_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `amount` double NOT NULL,
  `process_type` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiry_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `otp_verified` tinyint(1) DEFAULT 0,
  `admin_email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_tokens`
--

INSERT INTO `payment_tokens` (`id`, `token`, `customer_email`, `amount`, `process_type`, `status`, `created_at`, `expiry_time`, `otp_verified`, `admin_email`) VALUES
(1, '1fbcf1987db64f96bbf8edd7d2b8cb4d', 'anitaacharjya9539@gmail.com', 1000, 'CIELP', 'PENDING', '2026-02-10 12:51:34', '2026-02-11 12:51:34', 0, NULL),
(2, 'f1a9867bc03340ea9a4afd6ddbe2206e', 'anitaacharjya9539@gmail.com', 1000, 'CIELP', 'PENDING', '2026-02-10 13:17:14', '2026-02-11 13:17:14', 0, NULL),
(3, '7aa3fd0b3d7a4eae9d75a929ec99b908', 'anitaacharjya9539@gmail.com', 1000, 'CIELP', 'PENDING', '2026-02-10 13:27:41', '2026-02-11 13:27:41', 0, NULL),
(4, 'feaf844f725a4755903a5f942607c6d1', 'anitaacharjya9539@gmail.com', 1000, 'CIELP', 'PENDING', '2026-02-10 13:37:17', '2026-02-11 13:37:17', 1, NULL),
(5, '790c4e596dbb48569498e3385e2ea803', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'PENDING', '2026-02-10 15:26:05', '2026-02-11 15:26:05', 0, NULL),
(6, 'f5374c3347924a70877ddcdc2dab10a9', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'PENDING', '2026-02-10 15:28:14', '2026-02-11 15:28:14', 1, NULL),
(7, 'd5aad361fb974142a77e8b1762e632c9', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'PENDING', '2026-02-12 14:22:12', '2026-02-13 14:22:12', 0, NULL),
(8, '957f90e66b3a4c89a1ad3f7884c24c15', 'anitaacharjya9539@gmail.com', 1000, 'CIELP', 'PENDING', '2026-02-12 14:29:37', '2026-02-13 14:29:37', 0, NULL),
(9, 'cba2fdb236d145e3adf858aea433409a', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'PENDING', '2026-02-12 14:39:36', '2026-02-13 14:39:36', 0, NULL),
(10, '958b1c6c81594c869b0c7bfff5aef160', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'PENDING', '2026-02-12 14:47:30', '2026-02-13 14:47:30', 0, NULL),
(11, '63eae0b0695542918b4d56852061baa9', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'USED', '2026-02-12 14:49:53', '2026-02-13 14:49:53', 1, NULL),
(12, '36252bc947b547218cc9c02f92343fd0', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'USED', '2026-02-12 16:05:38', '2026-02-13 16:05:38', 1, NULL),
(13, '4ae9199dafa64d3291cea5b29f7b1b85', 'alokhalder@gmail.com', 1000, 'SIP', 'PENDING', '2026-02-12 19:17:58', '2026-02-13 19:17:58', 1, NULL),
(14, '9018a2c6aba34d84aaa67e875e84cafe', 'alokhalder@gmail.com', 100, 'SIP', 'PENDING', '2026-02-20 09:21:41', '2026-02-21 09:21:41', 1, NULL),
(15, '410b993fc8814c529a936c4f8cb0dd86', 'anishakrish27@gmail.com', 1000, 'SIP', 'PENDING', '2026-02-20 09:25:28', '2026-02-21 09:25:28', 0, NULL),
(16, '9ec04c553b8c45f8ac7f880a65597b05', 'anishakrish27@gmail.com', 1000, 'SIP', 'USED', '2026-02-20 09:25:41', '2026-02-21 09:25:41', 1, NULL),
(17, '63a6227e3620472ab1a536574405a877', 'patrasujoy92@gmail.com', 1000, 'CELP', 'PENDING', '2026-02-20 13:13:03', '2026-02-21 13:13:03', 0, NULL),
(18, '5b755ec1d384474280c63cfa9bfa45e1', 'patrasujoy92@gmail.com', 1000, 'CELP', 'PENDING', '2026-02-20 13:13:15', '2026-02-21 13:13:15', 1, NULL),
(19, '410a9d95a29f424b8b5e9441d15a36f3', 'soudipmaity605@gmail.com', 1000, 'CELP', 'PENDING', '2026-02-21 05:39:08', '2026-02-22 05:39:08', 0, NULL),
(20, '539d3362599d4a3cae8baccee1120cc6', 'sarkarsujoy715@gmail.com', 1000, 'CELP', 'PENDING', '2026-02-21 05:56:25', '2026-02-22 05:56:25', 0, NULL),
(21, '24c52f09dfaf4f32a2e952228ceacea5', 'gorairajnandini18@gmail.com', 5000, 'CELP', 'PENDING', '2026-02-21 07:13:08', '2026-02-22 07:13:08', 0, NULL),
(22, 'ae60b00019db4e4c9a26c0ec2877dc60', 'gorairajnandini18@gmail.com', 5000, 'CELP', 'PENDING', '2026-02-21 07:13:30', '2026-02-22 07:13:30', 0, NULL),
(23, '32f67cb39e7646d2bf78f88c354b82f0', 'patrasujoy92@gmail.com', 1000, 'CELP', 'USED', '2026-02-22 07:21:32', '2026-02-23 07:21:32', 1, NULL),
(24, 'e0f6dd7b4c2a4c46aeef8e9346e17eb9', 'meghahaldar1999@gmail.com', 12000, 'CELP', 'PENDING', '2026-02-26 05:31:11', '2026-02-27 05:31:11', 0, NULL),
(25, '0d08fad3f63047e0b3477ada83efc45a', 'khushbuh440@gmail.com', 1180, 'SIP', 'PENDING', '2026-02-27 13:58:45', '2026-02-28 13:58:45', 1, NULL),
(26, '4660b6338f9644aa8600104428cb30fe', 'skasraf231@gmail.com', 5000, 'CELP', 'PENDING', '2026-03-02 14:00:02', '2026-03-03 14:00:02', 0, NULL),
(27, '3586702fe8b24967ae98da66c7a03239', 'skasraf231@gmail.com', 5000, 'CELP', 'PENDING', '2026-03-02 14:00:03', '2026-03-03 14:00:03', 0, NULL),
(28, '8ddad29785f54b8ab4372a34fa40ac3b', 'khushbuh440@gmail.com', 1000, 'SIP', 'PENDING', '2026-03-08 13:36:58', '2026-03-09 13:36:58', 1, 'sunitchaudhuri@pcsglobal.in'),
(29, '041921b9dd244679809ec682599b2e19', 'chaitalipatra587@gmail.com', 1000, 'CELP', 'USED', '2026-03-09 10:05:12', '2026-03-10 10:05:12', 1, 'ishatul786@gmail.com'),
(30, '385be6c40903470da02b5071c1c7b2a6', 'chaitalipatra587@gmail.com', 1000, 'CELP', 'PENDING', '2026-03-09 10:05:13', '2026-03-10 10:05:13', 0, 'ishatul786@gmail.com'),
(31, 'e67613f4b97a4f54b204e88df8d9b807', 'sudipc014@gmail.com', 1000, 'CELP', 'PENDING', '2026-03-11 13:41:45', '2026-03-12 13:41:45', 1, 'ishatul786@gmail.com'),
(32, '11b8004d3e824c1ebc0990d1f07ecbcd', 'harapriyamohantyhpm@gmail.com', 1180, 'CELP', 'PENDING', '2026-03-13 16:07:55', '2026-03-14 16:07:55', 0, 'ishatul786@gmail.com'),
(33, 'b24bafb50d194dafae5470e82bdf6e25', 'harapriyamohantyhpm@gmail.com', 1180, 'CELP', 'PENDING', '2026-03-13 16:07:56', '2026-03-14 16:07:56', 0, 'ishatul786@gmail.com'),
(34, '5f49840cd7e84fbbadcf98d972fcd7b3', 'harapriyamohantyhpm@gmail.com', 1180, 'CELP', 'PENDING', '2026-03-13 16:07:58', '2026-03-14 16:07:58', 0, 'ishatul786@gmail.com'),
(35, '5e8f4dc4124646ba89dae66d2516bf7a', 'harapriyamohantyhpm@gmail.com', 1180, 'CELP', 'PENDING', '2026-03-14 07:44:54', '2026-03-15 07:44:54', 1, 'ishatul786@gmail.com'),
(36, 'aa537a235e0547f4b21b5d58e8f826e0', 'anitaacharjya9539@gmail.com', 1, 'OTHERS', 'USED', '2026-04-01 06:12:05', '2026-04-02 06:12:05', 1, 'sunitchaudhuri@pcsglobal.in'),
(37, '53df19f3d33441b79ccd944d2a63fa33', 'anitaacharjya9539@gmail.com', 1000, 'SIP', 'PENDING', '2026-04-01 07:04:08', '2026-04-02 07:04:08', 0, 'sunitchaudhuri@pcsglobal.in'),
(38, 'b583311f52304d6baa367a3a0a650aa1', 'anitaacharjya9539@gmail.com', 1, 'SIP', 'USED', '2026-04-01 08:26:52', '2026-04-02 08:26:52', 1, 'sunitchaudhuri@pcsglobal.in'),
(39, '347c12f5547c458e8360746c664f8c9b', 'anitaacharjya9539@gmail.com', 1, 'SIP', 'USED', '2026-04-01 08:41:05', '2026-04-02 08:41:05', 1, 'sunitchaudhuri@pcsglobal.in'),
(40, '4e090926720e4b98bcc1b6de124f1cbf', 'jyotirmayeeswain79@gmail.com', 1180, 'CELP', 'PENDING', '2026-04-01 13:51:48', '2026-04-02 13:51:48', 0, 'ishatul786@gmail.com'),
(41, 'fd9de99a2df9438ba73b0b25d9dc3283', 'saniyakhan72803@gmail.com', 10000, 'CELP', 'PENDING', '2026-04-03 12:23:43', '2026-04-04 12:23:43', 0, 'ishatul786@gmail.com'),
(42, 'f05c4e65bab947f6b898da2b12f38a3a', 'anitaacharjya9539@gmail.com', 1, 'OTHERS', 'PENDING', '2026-04-03 13:27:43', '2026-04-04 13:27:43', 0, 'sunitchaudhuri@pcsglobal.in'),
(43, '76acd664addb4251a6a566b9a19ed817', 'soumyadipmiatur1@gmail.com', 1000, 'CELP', 'PENDING', '2026-04-03 15:52:23', '2026-04-04 15:52:23', 0, 'ishatul786@gmail.com'),
(44, '950ea05725ec4634a35f8c70531db6e8', 'anitaacharjya9539@gmail.com', 1, 'SIP', 'USED', '2026-04-07 13:35:39', '2026-04-08 13:35:39', 1, 'sunitchaudhuri@pcsglobal.in'),
(45, '4990aa5f6a8647ceb7e77774d69247ea', 'ksharithadivyasri718@gmail.com', 1180, 'CELP', 'PENDING', '2026-04-10 14:41:33', '2026-04-11 14:41:33', 0, 'ishatul786@gmail.com'),
(46, '923d4a344ba64f1a8aa5a950db41d4c0', 'mdanassheikh295@gmail.com', 1180, 'CELP', 'PENDING', '2026-04-13 06:06:53', '2026-04-14 06:06:53', 0, 'ishatul786@gmail.com'),
(47, '7a4893b7179549e9807eeda2258761d5', 'mdanasshaikh295@gmail.com', 1180, 'CELP', 'USED', '2026-04-13 06:07:56', '2026-04-14 06:07:56', 1, 'ishatul786@gmail.com'),
(48, 'f094379669c34180820827501153f276', 'bikashpawan8@gmail.com', 15000, 'CELP', 'PENDING', '2026-04-18 16:47:35', '2026-04-19 16:47:35', 0, 'ishatul786@gmail.com'),
(49, 'ca1817a78cbb43bda21da4fc5ff189ea', 'subhamchakraborty706@gmail.com', 1180, 'SIP', 'PENDING', '2026-04-25 09:12:56', '2026-04-26 09:12:56', 1, 'ishatul786@gmail.com'),
(50, '5ff0d77987b942d0af9efd75fa0509a2', 'kantisamantatusar@gmauil.com', 3000, 'SIP', 'PENDING', '2026-04-28 13:37:28', '2026-04-29 13:37:28', 0, 'ishatul786@gmail.com'),
(51, '8bab44510b1e415ea901e68611d195ba', 'kantisamantatusar@gmail.com', 3000, 'SIP', 'USED', '2026-04-28 13:37:50', '2026-04-29 13:37:50', 1, 'ishatul786@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_id`);

--
-- Indexes for table `payment_otp`
--
ALTER TABLE `payment_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_tokens`
--
ALTER TABLE `payment_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `payment_otp`
--
ALTER TABLE `payment_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payment_tokens`
--
ALTER TABLE `payment_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

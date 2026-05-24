-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:39 PM
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
-- Database: `exam_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `Name` text DEFAULT NULL,
  `Email` text DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `Name`, `Email`, `password`) VALUES
(8086, 'Govind K Choudhury', 'shnjnsrdr.1995@gmail.com', 'ff8c5dc789465a4b4c628212bf6ecd4f');

-- --------------------------------------------------------

--
-- Table structure for table `admin_section`
--

CREATE TABLE `admin_section` (
  `sl_no` int(11) NOT NULL,
  `admin_id` varchar(100) DEFAULT NULL,
  `admin_password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin_section`
--

INSERT INTO `admin_section` (`sl_no`, `admin_id`, `admin_password`) VALUES
(1, 'govind', 'pcs@2019'),
(2, 'Madhuparna Agarwala', '');

-- --------------------------------------------------------

--
-- Table structure for table `college_master`
--

CREATE TABLE `college_master` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `c_branch_name` varchar(50) NOT NULL,
  `c_cont_num` varchar(15) NOT NULL,
  `c_email` varchar(100) NOT NULL,
  `c_addr1` varchar(100) DEFAULT NULL,
  `c_addr2` varchar(100) DEFAULT NULL,
  `c_district` varchar(50) NOT NULL,
  `c_state` varchar(50) NOT NULL,
  `c_pin` int(11) NOT NULL,
  `c_status` enum('0','1') NOT NULL DEFAULT '0',
  `c_create_date` date NOT NULL,
  `c_update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `college_master`
--

INSERT INTO `college_master` (`c_id`, `c_name`, `c_branch_name`, `c_cont_num`, `c_email`, `c_addr1`, `c_addr2`, `c_district`, `c_state`, `c_pin`, `c_status`, `c_create_date`, `c_update_date`) VALUES
(1, 'Gurunanak Institute Of Technology', 'Guru', '0987674567', 'gnit@gmail.com', 'Sodepur', 'Sodepur', 'Kolkata', 'West Bengal', 700091, '1', '2020-03-13', '2020-03-13'),
(2, 'Kalinga Institute of Technology', 'KIIT', '0987674567', 'kiit@gmail.com', 'Odisha', 'Odisha', 'Kolkata', 'West Bengal', 700091, '1', '2020-03-13', '2020-04-17'),
(7, 'University of Engineering & Management', 'UEM', '0987678909', 'uem@ac.in', 'Newtown', 'Kolkata', 'Kolkata', '28', 700091, '1', '2020-03-20', '2020-03-20'),
(18, ' Heritage Institute of Technology', 'Main', '1234567890', 'hit@gmail.com', 'kolkata', 'Kolkata', 'Kolkata', 'IN-WB', 700107, '1', '2020-04-14', '2020-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `correct_answer`
--

CREATE TABLE `correct_answer` (
  `ans_id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `correct_ans_key` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `correct_answer`
--

INSERT INTO `correct_answer` (`ans_id`, `q_id`, `correct_ans_key`) VALUES
(1, 1, 'B'),
(2, 2, 'C'),
(3, 3, 'C'),
(4, 4, 'A'),
(5, 5, 'C'),
(6, 6, 'D'),
(7, 7, 'A'),
(8, 8, 'C'),
(9, 9, 'A'),
(10, 10, 'B'),
(11, 11, 'A'),
(12, 12, 'A'),
(13, 13, 'C'),
(14, 14, 'A'),
(15, 15, 'A'),
(16, 16, 'D'),
(17, 17, 'A'),
(18, 18, 'D'),
(19, 19, 'A'),
(20, 20, 'A'),
(21, 21, 'D'),
(22, 22, 'D'),
(23, 23, 'B'),
(24, 24, 'A'),
(25, 25, 'C'),
(26, 26, 'D'),
(27, 27, 'B'),
(28, 28, 'C'),
(29, 29, 'D'),
(30, 30, 'A'),
(31, 31, 'B'),
(32, 32, 'D'),
(33, 33, 'A'),
(34, 34, 'A'),
(35, 35, 'B'),
(36, 36, 'B'),
(37, 37, 'A'),
(38, 38, 'B'),
(39, 39, 'C'),
(40, 40, 'B'),
(41, 41, 'A'),
(42, 42, 'A'),
(43, 43, 'C'),
(44, 44, 'B'),
(45, 45, 'D'),
(46, 46, 'D'),
(47, 47, 'A'),
(48, 48, 'B'),
(49, 49, 'B'),
(50, 50, 'B'),
(51, 51, 'D'),
(52, 52, 'A'),
(53, 53, 'A'),
(54, 54, 'B'),
(55, 55, 'A'),
(56, 56, 'C'),
(57, 57, 'A'),
(58, 58, 'A'),
(59, 59, 'C'),
(60, 60, 'D'),
(61, 61, 'A'),
(62, 62, 'B'),
(63, 63, 'B'),
(64, 64, 'B'),
(65, 65, 'B'),
(66, 66, 'B'),
(67, 67, 'B'),
(68, 68, 'D'),
(69, 69, 'C'),
(70, 70, 'C'),
(71, 71, 'C'),
(72, 72, 'C'),
(73, 73, 'B'),
(74, 74, 'D'),
(75, 75, 'B'),
(76, 76, 'A'),
(77, 77, 'D'),
(78, 78, 'A'),
(79, 79, 'C'),
(80, 80, 'D'),
(81, 81, 'C'),
(82, 82, 'C'),
(83, 83, 'D'),
(84, 84, 'B'),
(85, 85, 'A'),
(86, 86, 'C'),
(87, 87, 'C'),
(88, 88, 'A'),
(89, 89, 'C'),
(90, 90, 'A'),
(91, 91, 'D'),
(92, 92, 'D'),
(93, 93, 'B'),
(94, 94, 'A'),
(95, 95, 'D'),
(96, 96, 'B'),
(97, 97, 'A'),
(98, 98, 'C'),
(99, 99, 'A'),
(100, 100, 'A'),
(101, 101, 'A'),
(102, 102, 'B'),
(103, 103, 'A'),
(104, 104, 'A'),
(105, 105, 'A'),
(106, 106, 'A'),
(107, 107, 'A'),
(108, 108, 'B'),
(109, 109, 'B'),
(110, 110, 'A'),
(111, 111, 'A'),
(112, 112, 'C'),
(113, 113, 'D'),
(114, 114, 'B'),
(115, 115, 'B'),
(116, 116, 'A'),
(117, 117, 'A'),
(118, 118, 'A'),
(119, 119, 'A'),
(120, 120, 'A'),
(121, 121, 'C'),
(122, 122, 'A'),
(123, 123, 'B'),
(124, 124, 'D'),
(125, 125, 'C'),
(126, 126, 'C'),
(127, 127, 'B'),
(128, 128, 'C'),
(129, 129, 'D'),
(130, 130, 'A'),
(131, 131, 'C'),
(132, 132, 'D'),
(133, 133, 'C'),
(134, 134, 'C'),
(135, 135, 'C'),
(136, 136, 'B'),
(137, 137, 'D'),
(138, 138, 'A'),
(139, 139, 'D'),
(140, 140, 'C'),
(141, 141, 'D'),
(142, 142, 'C'),
(143, 143, 'A'),
(144, 144, 'C'),
(145, 145, 'A'),
(146, 146, 'D'),
(147, 147, 'B'),
(148, 148, 'B'),
(149, 149, 'C'),
(150, 150, 'A'),
(151, 151, 'C'),
(152, 152, 'B'),
(153, 153, 'A'),
(154, 154, 'A'),
(155, 155, 'D'),
(156, 156, 'B'),
(157, 157, 'C'),
(158, 158, 'A'),
(159, 159, 'C'),
(160, 160, 'B'),
(161, 161, 'C'),
(162, 162, 'D'),
(163, 163, 'C'),
(164, 164, 'B'),
(165, 165, 'A'),
(166, 166, 'C'),
(167, 167, 'B'),
(168, 168, 'C'),
(169, 169, 'B'),
(170, 170, 'D'),
(171, 171, 'C'),
(172, 172, 'B'),
(173, 173, 'C'),
(174, 174, 'C'),
(175, 175, 'D'),
(176, 176, 'A'),
(177, 177, 'D'),
(178, 178, 'B'),
(179, 179, 'B'),
(180, 180, 'B'),
(181, 181, 'A'),
(182, 182, 'D'),
(183, 183, 'B'),
(184, 184, 'D'),
(185, 185, 'C'),
(186, 186, 'C'),
(187, 187, 'B'),
(188, 188, 'B'),
(189, 189, 'D'),
(190, 190, 'D'),
(191, 191, 'B'),
(192, 192, 'D'),
(193, 193, 'B'),
(194, 194, 'C'),
(195, 195, 'D'),
(196, 196, 'B'),
(197, 197, 'A'),
(198, 198, 'A'),
(199, 199, 'A'),
(200, 200, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `idmaster`
--

CREATE TABLE `idmaster` (
  `identifier` varchar(50) NOT NULL,
  `current_number` int(11) NOT NULL,
  `end_range` varchar(255) NOT NULL,
  `increment` int(11) NOT NULL,
  `prefix` varchar(45) NOT NULL,
  `start_range` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `idmaster`
--

INSERT INTO `idmaster` (`identifier`, `current_number`, `end_range`, `increment`, `prefix`, `start_range`) VALUES
('PCS', 1203, '99999', 1, 'PCS', '00000');

-- --------------------------------------------------------

--
-- Table structure for table `question_table`
--

CREATE TABLE `question_table` (
  `q_no` int(11) NOT NULL,
  `question` text NOT NULL,
  `Opt_one` text NOT NULL,
  `Opt_two` text NOT NULL,
  `Opt_three` text NOT NULL,
  `Opt_four` text NOT NULL,
  `Opt_five` text NOT NULL,
  `set_num` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `question_table`
--

INSERT INTO `question_table` (`q_no`, `question`, `Opt_one`, `Opt_two`, `Opt_three`, `Opt_four`, `Opt_five`, `set_num`) VALUES
(1, '<b> Find the unit digit in the product (4387)^245*(621)^72<br></b>', '1', '7', '2', '8', 'I am not attending this question', '1'),
(2, '<b> Sum of a fraction and thrice its reciprocal is 31/6.What is the fraction?</b>', '44076', '43930', '9/2', '44078', 'I am not attending this question', '1'),
(3, '<b>  357:714::468:?</b>', '579', '417', '936', '864', 'I am not attending this question', '1'),
(4, '<b> If 16^24 divided by 17 ,the remainder is <br>', '1', '3', '4', '8', 'I am not attending this question', '1'),
(5, '<b> Find the sum of the first 50 odd numbers. <br>', '1600', '1900', '2500', '2900', 'I am not attending this question', '1'),
(6, '<b> A number whose one-fourth part is increased by 5 is equal to the third part diminished by 5.What is the number? <br></b>', '100', '80', '60', '120', 'I am not attending this question', '1'),
(7, '<b>If the number is divided by 3, it reduced by 34. The number is <br></b>', '51', '50', '45', '40', 'I am not attending this question', '1'),
(8, '<b> If( 25% of x )= (40% of y), then x:y is equal to <br></b>', '0.213194444', '0.338194444', '8:05', '0.339583333', 'I am not attending this question', '1'),
(9, '<b> An fruit vendor buys 30 oranges for  Rs. 187.50 .At what price  did he sell  each orange to get a profit  of 12%? <br></b>', 'Rs.7', 'Rs.7.50', 'Rs.8', 'Rs.8.25', 'I am not attending this question', '1'),
(10, '<b>If  the cost price  of 12 articles to the selling price of 10 articles, then find the profit% in transaction. <br></b>', '0.15', '0.2', '25%', 'Data insufficient', 'I am not attending this question', '1'),
(11, '<b>Pure milk costs Rs.20 per litre. After adding water the  milkman sells the mixture at the rate of Rs.18 per litre,thereby  making a profit of 25% .In What ratio does he mix the two? <br></b>', '0.754861111', '0.753472222', '12:07', '0.503472222', 'I am not attending this question', '1'),
(12, '<b>A sum of Rs.8000 was lent partly at 7% and partly at 9% simple interest. If total annual interest be Rs.620.The ration in which the money was lent at given rates is  <br></b>', '0.210416667', '0.044444444', '2:03', '0.127777778', 'I am not attending this question', '1'),
(13, '<b>In what time will a sum   double itself at 8% per annum simple interest ? <br></b>', '12 yr ', '10 yr', '12.5 yr', '10.5 yr', 'I am not attending this question', '1'),
(14, '<b> The average of 15 observations is 20.Average of first 5is 16 and next 7 is 22.If 13th observation is 2 more than 14 and 14th observation  is 2 more than 15th observation. Find the 15th observation <br></b>', '20', '12', '6', '30', 'I am not attending this question', '1'),
(15, '<b>A person travels 120km in 6h, the next 130 km in 5h  and next 200km in 4h.Find his average speed during the whole journey. <br></b>', '37km/h', '30km/h ', '36km/h', 'Cannot be determined', 'I am not attending this question', '1'),
(16, '<b>8 men can complete a work in 14days.They started  the work and after 2days 3 men left. In how many days will the work be completed  by the remaining men? <br></b>', '12days', '9 days ', '15 days', 'none of these', 'I am not attending this question', '1'),
(17, '<b> A and B complete a piece of work in 5 days working together.If A had  worked twice as fast the work  would have been completed in 4 days.In how many days can A alone complete the work ? <br></b>', '20 days ', '18 days', '24 days', '15 days', 'I am not attending this question', '1'),
(18, '<b>A man rows 25 km downstream and 20 km upstream taking 5h each time .What is the velocity of the current ?<br></b>', '1km/h', '2.5 km/h', '3.5 km/h', 'None of these', 'I am not attending this question', '1'),
(19, '<b>A walks at 3  km/h and    4 h after his start , b cycles after him at 5km/h.How  far from the start does B catch up with A? <br></b>', '30 km', '34 km', '36km', '38km', 'I am not attending this question', '1'),
(20, '<b>A train 250m long crosses a platform of  equal length in 50s .Find the speed of the train  <br></b>', '10m/s', '15 m/s', '25m/s', '20m/s', 'I am not attending this question', '1'),
(21, '<b>The percentage increase in area of a rectangle, if each of its sides is increased by 25% is  <br></b>', '0.25', '0.5', '54%', '0.5625', 'I am not attending this question', '1'),
(22, '<b>What will be the area of a semi-Circle whose perimeter is 66cm ?<br></b>', '693cm^2', '646cm^2', '521cm^2', 'none of these', 'I am not attending this question', '1'),
(23, '<b>Please select the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete. The words may seem similar or right but there is only one word that should be selected.In a little-publicized deal, Pepsi Cola has ...... the entire soft drink market in Afghanistan <br></b>', 'occupied', 'conquered', 'swallowed', 'captured', 'I am not attending this question', '1'),
(24, '<b>Find the correctly spell  words  <br></b>', 'Efficient', 'Treatmeant', 'Beterment', 'Employd', 'I am not attending this question', '1'),
(25, '<b>What is the synonyms of CANNY ? <br></b>', 'Obstinate', 'Handsome', 'Clever', 'Stout ', 'I am not attending this question', '1'),
(26, '<b> Which of the following operating system is also known as single user operating system? <br></b>', 'Windows', 'Linux', 'Unix', 'DOS ', 'I am not attending this question', '1'),
(27, '<b>It is the first program run on a computer ,when the computer boots up <br></b>', 'System software', 'operating System', 'System operations', 'processing system', 'I am not attending this question', '1'),
(28, '<b>Router operate in which layer of the OSI model?  <br></b>', 'physical layer', 'Data link layer', 'Network layer', 'none of the above', 'I am not attending this question', '1'),
(29, '<b>Which step is taken first in designing a program?  <br></b>', 'Data validation', 'Input design', 'Task analysis', ' Problem identification', 'I am not attending this question', '1'),
(30, '<p><b> What is the output of the program? <br> typedef struct data;<br>{<br> int x; <br>sdata *b; <br>}sdata;<br><b></p>', 'Error: Declaration missing \';\'', ' Error: in typedef ', 'No error', 'None of above', 'I am not attending this question', '1'),
(31, '<p> What is the output of the program? <br>#include < stdio.h > <br>int main() <br>{ <br>char c=48; <br>int i, mask=01; <br>for(i=1; i<=5; i++){ <br><br>printf(%c\" c|mask);<br>  <br> mask = mask<<1;<br> } <br> return 0; <br> } <br></b></p>', '12400', '12480', '12500', '12556', 'I am not attending this question', '1'),
(32, '<b>Pointer is used in <br></b>', 'Direct addressing', 'Indexed Addressing', 'Indexed mode', 'Immediate Addressing', 'I am not attending this question', '1'),
(33, '<b>An array can be passed in a function in C language through  ? <br></b>', 'Call by value only', 'Call by reference only', 'Both a & b ', 'Call by preference', 'I am not attending this question', '1'),
(34, '<b>Static variables are sometimes called <br></b>', 'Class variables', 'functional variables', 'dynamic variables', 'auto variables', 'I am not attending this question', '1'),
(35, '<b>By default any real number in C is treated as  <br></b>', 'a float', 'a double ', 'a long double', 'none of the above', 'I am not attending this question', '1'),
(36, '<p>What is the output of the following program?<br>main(){ <br>  <br>int i =2;<br> <br>printf (\\n %d %d ++i', '++i);<br> }<br></p>', ' 3 4', '4 3', '4 4', 'I am not attending this question', '1'),
(37, '<b>When you omit parameters from a function call, value can be provided by   <br></b>', 'formal parameters', 'reference parameters ', 'overloaded parameters', 'default parameters', 'I am not attending this question', '1'),
(38, '<b> The feature in object oriented programming that allows the same operation to be carried out differently , depending on the object, is  <br></b>', 'inheritance', 'polymorphism', 'overfunctioning', 'overriding', 'I am not attending this question', '1'),
(39, '<b>The process of extracting the relevant attributes of an object is known as  <br></b>', ' polymorphism', ' Inheritance', 'Abstraction', 'data hiding ', 'I am not attending this question', '1'),
(40, '<b>Local variables   <br></b>', 'are created outside a block  ', 'are known only to that block', 'Continue to exist when their block ends', 'Are illegal in C++', 'I am not attending this question', '1'),
(41, '<b>The JDBC-ODBC bridge is    <br></b>', 'Three tiered', 'Multipread', 'Best of any platform', 'All of the above', 'I am not attending this question', '1'),
(42, '<b>Queue can be used to implement ?   <br></b>', 'radix sort', 'quick sort', 'recursion ', 'depth first search', 'I am not attending this question', '1'),
(43, '<b>Which of the following is useful in implementing quick sort?  <br></b>', 'Stack', 'Set', 'List', 'Queue  ', 'I am not attending this question', '1'),
(44, '<b> A linear list in which elements can be added or removed at either end but not in middle is known as  <br></b>', 'queue', 'deque ', 'stack', 'tree', 'I am not attending this question', '1'),
(45, '<b>The order of the Binary search algorithm is <br></b>', 'n', 'n^2', 'nlog(n)', 'log(n)', 'I am not attending this question', '1'),
(46, '<b>In SQL, which of the following is not a data definition language command ?   <br></b>', 'RENAME', 'REVOKE', 'GRANT', 'UPDATE', 'I am not attending this question', '1'),
(47, '<b> In SQL, which command is used to changes data in a data table?  <br></b>', 'UPDATE', 'INSERT', 'BROWSE', ' APPEND', 'I am not attending this question', '1'),
(48, '<b>In a relational schema, each tuple is divided into fields called  <br></b>', 'relational', 'domains', 'queries', 'all of this', 'I am not attending this question', '1'),
(49, '<b>To discard all pending data changes   <br></b>', 'COMMIT', 'ROLLBACK', 'SAVEPOINT LOCK', 'DISCHARGE', 'I am not attending this question', '1'),
(50, '<b>TRUNCATE statement in SQL is a  <br></b>', 'DML STATEMENT', 'DDL STATEMENT', 'DSL STATEMENT', 'DCL STATEMENT', 'I am not attending this question', '1'),
(51, '<b> If 892.7 - 573.07 - 95.007 = ?A?. What is the value of A? <br></b>', '414.637', '224.777', '233.523', '224.623', 'I am not attending this question', '1'),
(52, '<b>Which of the following numbers is not divisible by 14?<br></b>', '3542', '2086', '1998', '2996', 'I am not attending this question', '1'),
(53, '<b>A customer paid you $600 for construction work, out of which, 3/5 of the total amount was spent on the purchase of materials and 1/5 of the remaining was spent on travelling. How much is left after all the deductions?<br></b>', '120', '190', '$192 ', '240', 'I am not attending this question', '1'),
(54, '<b>How many numbers are there in all from 4000 to 4999 (both 4000 and 4999 included) having at least one of their digits repeated?<br></b>', '492', '501', '455', ': 496', 'I am not attending this question', '1'),
(55, '<b> Dhruv and Naksh drive at the speeds of 36 Kmph and 54 kmph respectively. If Naksh tak324es 3 hours\nlesser than what Dhruv takes for the same distance. Then distance is :<br></b>', '296', '324', '453', '121', 'I am not attending this question', '2'),
(56, '<b>Abhimanyu and supreet can together finish a work in 50 days. They worked together for 35 days and\nthen supreet left. After another 21 days, Abhimanyu finished the remaining work. In how many days\nAbhimanyu alone can finish the work?<br></b>', '50', '80', '12', '70', 'I am not attending this question', '2'),
(57, '<b>The greatest number which on dividing 1657 and 2037 leaves remainders 6 and 5\nrespectively, is:<br></b>', '112', '127', '126', '129', 'I am not attending this question', '2'),
(58, '<b>A bag contains a white and b black balls. Two players A and B alternatively draw a ball from the bag, replacing the ball each time after the draw till one of them draws a white ball and wins the game. A begins the game, if the probability of As winning the game is three times that of B, then the ratio a:b is<br></b>', '0.084027778', '0.16875', '18:01', '0.511805556', 'I am not attending this question', '2'),
(59, '<b>Two vessels have equal volumes of pure alcohol and Pepsi. A bartender is mixing the drinks. He takes half the volume of the firstvessel containing alcohol and transfers it to the second vessel containing Pepsi. He now transfers ? of the resultant solution fromthe second vessel to the first. He repeats the entire process once more transferring always ? of the resultant solution to the othervessel.What is the respective ratio of Pepsi to alcohol in the second vessel after the process?<br></b>', '0.253472222', '0.04375', '9:05', '0.503472222', 'I am not attending this question', '2'),
(60, '<b>A person incurs a loss of 5% be selling a watch for Rs. 1140. At what price should the\nwatch be sold to earn 5% profit.<br></b>', '1023', '1260', '1320', '1200', 'I am not attending this question', '2'),
(61, '<b>A book was sold for Rs 27.50 with a profit of 10%. If it were sold for Rs. 25.75, then\nwould have been percentage of profit and loss ?<br></b>', '0.04', '0.06', '7%', '0.03', 'I am not attending this question', '2'),
(62, '<b>The cost price of 20 articles is the same as the selling price of x articles. If the profit is\n25%, find out the value of x<br></b>', '0.16', '0.12', '15%', '0.18', 'I am not attending this question', '2'),
(63, '<b>Sahil purchased a machine at Rs 10000, then got it repaired at Rs 5000, then gave its\ntransportation charges Rs 1000. Then he sold it with 50% of profit. At what price he actually sold\nit.<br></b>', '24000', '25000', '26000', '27000', 'I am not attending this question', '2'),
(64, '<b>A plot is sold for Rs. 18,700 with a loss of 15%. At what price it should be sold to get\nprofit of 15%.\n<br></b>', '25400', '25300', '25700', '29400', 'I am not attending this question', '2'),
(65, '<b> The pulse rate of a person is 15 beats in 10 seconds. At this rate, what will be pulse rate of the person per\nminute?\n<br></b>', '90 beats per minute\n', '50 beats per minute', '30 beats per minute', '150 beats per minute', 'I am not attending this question', '2'),
(66, '<b>. A storekeeper sold a wrist watch for $660, including a sales tax of 10%.If the cost price of the watch is\n$500, what is the percentage profit for shopkeeper?\n<br></b>', '0.1', '0.6', '20%', '0.4', 'I am not attending this question', '2'),
(67, '<b> A man gains 20% by selling an article for a certain price. If he sells it at double the price,\nthe percentage of profit will be.<br></b>', '140', '122', '130', '150', 'I am not attending this question', '2'),
(68, '<b>The cost price of 20 articles is the same as the selling price of x articles. If the profit is\n25% then determine the value of x.<br></b>', '16', '12', '17', '18', 'I am not attending this question', '2'),
(69, '<b>The cost price of 20 articles is the same as the selling price of x articles. If the profit is\n25% then determine the value of x.<br></b>', '400', '225', '200', '300', 'I am not attending this question', '2'),
(70, '<b>The cost price of 20 articles is the same as the selling price of x articles. If the profit is\n25% then determine the value of x.<br></b>', '11.75', '11.87', '11.23', '11.81', 'I am not attending this question', '2'),
(71, '<b>The ?A? state government has chalked out a plan for the underdeveloped ?B? district where 66% of the funds will be placed in the hands of a committee of local representatives.\nCourses of action:\nI. The ?A? state government should decide guidelines and norms for the functioning of the committee.\nII. Other state government may follow similar plan if directed by the Central government.', 'If only I follows', 'If only IIfollows', '', '?If either I or II follows', 'I am not attending this question', '2'),
(72, 'If a legislature decides to fund agricultural subsidy programs, national radio, and a small business loan program, what 2 other programs can they fund?', 'harbor improvements and school music program', 'harbor improvements and international airport', 'hurricane preparedness and school music program', 'hurricane preparedness and school music program', 'I am not attending this question', '2'),
(73, 'Statement: Anger is energy, in a more proactive way and how to channelize it is in itself a skill.\nAssumptions: I. Anger need to be channelized.\nII. Only skillful people can channelize anger to energy.', 'If only assumption I is implicit.', 'If only assumption II is implicit.', 'if either I or II is implicit.', 'if neither I or II is implicit.', 'I am not attending this question', '2'),
(74, 'The new ABC policy envisages major changes in the earlier policy.\nAssumptions: I. ABC Policy should not be consistent with economic conditions of India and abroad.\nII. There were some flaws in the earlier ABC policy.', 'If only assumption I is implicit.', 'If only assumption II is implicit.', 'If neither I nor II is implicit.', 'If I II is implicit.', 'I am not attending this question', '2'),
(75, 'Some kings are queens. All queens are beautiful. Conclusions: All kings are beautiful. All queens are kings.', 'Only conclusion I follows', 'Only conclusion II follows', 'Neither conclusion I follows', 'Either conclusion I follows', 'I am not attending this question', '2'),
(76, 'Statements: All tubes are handles. All cups are handles.\nConclusions: All cups are tubes. Some handles are not cups.', 'Only conclusion I follows', 'Only conclusion II follows', 'Neither conclusion I follows', 'Either conclusion I follows', 'I am not attending this question', '2'),
(77, 'AMB, CLB, BKC, DJC, ______', 'EID', 'CID', 'EJF', 'EIF', 'I am not attending this question', '2'),
(78, 'Three of the following four are alike in respect of their positions in the above series. Which is the one that does not belong to that group?', 'Q * 8', 'None', '6 2 C', 'YGD', 'I am not attending this question', '2'),
(79, 'To approach this question, use a sentence: ?A ______ could not exist without ______.?Champion \nFind the word that fits in.', 'running', 'swimming', 'winning', 'speaking', 'I am not attending this question', '2'),
(80, 'saddle', 'horse', 'seat', 'stirrups', 'horn', 'I am not attending this question', '2'),
(81, '<b>Direction: Select the option that is most nearly opposite in meaning to the given word.\nVANITY (OPPOSITE)<br></b>', 'Pride', 'Conceit', 'Humility', 'Indifference', 'I am not attending this question', '2'),
(82, '<b>. Direction: Select the correct option that fills the blank(s) to make the sentence meaningfully\ncomplete.\nShe_____most of her time tomusic.<br></b>', 'spent', 'lent', 'devoted', 'made', 'I am not attending this question', '2'),
(83, '<b> Direction: In the question, a part of the sentence is given in italics. Select the correct alternative that\n is similar in meaning to the word in italics.\nSurprisingly, Alaska received scanty rainfall this year.<br></b>', 'rare', 'little', 'heavy', 'scattered', 'I am not attending this question', ''),
(84, '<b>Direction: Read the sentence to determine if there is any grammatical error in it. Choose\nthelettercorrespondingtothepartthatcontainstheerror.Ignoreerrorsofpunctuation,ifany.\n(A) Themeetingadjournedabruptly/(B)bytheCEOafter/(C)aboutthreehoursof deliberation.\n/ (D) Noerror<br></b>', 'A', 'B', 'C', 'D', 'I am not attending this question', '2'),
(85, '<b>Direction: In the question, a part of the sentence is italicized. Select the correct alternative to\n the italicized part that may improve the sentence construction.\nPlease remind me of posting these letters to my relatives.<br></b>', 'byposting', 'topost', ' forposting', 'no improvementneeded', 'I am not attending this question', '2'),
(86, '<b>Read each sentence to find out whether there is any grammatical error in it. The error, if any will be in one part of the sentence. The letter of that part is the answer. If there is no error, the answer is \'D\'. (Ignore the errors of punctuation, if any).            \n(solve as per the direction given above)<br></b>', 'A. We discussed about the problem so thoroughly', 'B. on the eve of the examination', 'C. that I found it very easy to work it out.', 'D. No error', 'I am not attending this question', '2'),
(87, '<b>In the following the questions choose the word which best expresses the meaning of the given word.\n\n  CORPULENT<br></b>', 'Lean', 'Gaunt', 'Emaciated', 'Obese', 'I am not attending this question', '2'),
(88, '<b>EMBEZZLE<br></b>', 'Misappropriate', 'Balance', 'Remunerate', 'Clear', 'I am not attending this question', '2'),
(89, '<b>In questions given below out of four alternatives, choose the one which can be substituted for the given word/sentence.   Extreme old age when a man behaves like a fool<br></b>', 'Imbecility', 'Senility', 'Dotage', 'Superannuation', 'I am not attending this question', '2'),
(90, '<b>In questions given below out of four alternatives, choose the one which can be substituted for the given word/sentence    \nThat which cannot be corrected <br></b>', 'Unintelligible', 'Indelible', 'Illegible', 'Incorrigible', 'I am not attending this question', '2'),
(91, '<b>class Test { \n    public static void main(String[] args) { \n        for(int i = 0; true; i++) { \n            System.out.println(\"Hello\"); \n            break; \n        } \n    } \n}<br></b>', 'compiler error', 'nothing printed', 'Hello', 'None of these', 'I am not attending this question', '2'),
(92, '<b>class Main { \n    public static void main(String args[]) {    \n        System.out.println(fun()); \n    }  \n    int fun() { \n        return 20; \n    }  \n} <br></b>', '20', 'nothing printed', 'Compiler error', 'None of these', 'I am not attending this question', '2'),
(93, '<b>class Derived  \n{ \n    protected final void getDetails() \n    { \n        System.out.println(\"Derived class\"); \n    } \n} \n  \npublic class Test extends Derived \n{ \n    protected final void getDetails() \n    { \n        System.out.println(\"Test class\"); \n    } \n    public static void main(String[] args) \n    { \n        Derived obj = new Derived(); \n        obj.getDetails(); \n    } \n} </br></b>', 'Derived class', 'Test class', 'Compiler error', 'Runtime error', 'I am not attending this question', '2'),
(94, '<b>class Helper \n{ \n    private int data; \n    private Helper() \n    { \n        data = 5; \n    } \n} \npublic class Test \n{ \n    public static void main(String[] args) \n    { \n        Helper help = new Helper(); \n        System.out.println(help.data); \n    } \n} <br></b>', 'compilation error', '5', 'Nothing printed', 'none of the above', 'I am not attending this question', ''),
(95, '<b>Which of the following option leads to the portability and security of Java?<br></b>', 'Bytecode is executed by JVM', 'The applet makes the Java code secure and portable', 'Use of exception handling', 'Dynamic binding between objects', 'I am not attending this question', '2'),
(96, '<b>Which of the following is a valid declaration of a char?<br></b>', 'char ch = \'\\utea\'', 'char ca = \'tea\'', 'char cr = \\u0223', 'char cc = \'\\itea\'', 'I am not attending this question', '2'),
(97, '<b>What does the expression float a = 35 / 0 return?<br></b>', '0', 'Not a Number', 'infinity', 'Runtime exception', 'I am not attending this question', '2'),
(98, '<b>Evaluate the following Java expression, if x=3, y=5, and z=10:\n\n++z + y - y + z + x++<br></b>', '24', '23', '20', '25', 'I am not attending this question', '2'),
(99, '<b>Which of the following tool is used to generate API documentation in HTML format from doc comments in source code?<br></b>', 'javap tool', 'javaw command', 'Javadoc tool', 'javah command', 'I am not attending this question', '2'),
(100, '<b> Which of the following for loop declaration is not valid?<br></b>', 'for ( int i = 99; i >= 0; i / 9 )', 'for ( int i = 7; i <= 77; i += 7 )', 'for ( int i = 20; i >= 2; - -i )', 'for ( int i = 2; i <= 20; i = 2* i )', 'I am not attending this question', '3'),
(101, '<b>Till when India has extended ban on scheduled International Commercial Passenger Flights?  <br></b>', '44222', '44256', '01-Jan-21', '44196', 'I am not attending this question', '3'),
(102, '<b>  After Reliance Industries and TCS, which firm has crossed the Rs 8 lakh crore mark?<br></b>', 'Larsen & Toubro', 'SBI Bank', 'Tata Motors', 'HDFC Bank', 'I am not attending this question', '3'),
(103, '<b> Which of the following words named as Word of the Year 2020 in Cambridge Dictionary? <br></b>', 'Pandemic', 'Quarantine', 'COVID-19', 'Lockdown', 'I am not attending this question', '3'),
(104, '<b>Who has been announced as a Brand Ambassador of Puma?  <br></b>', 'Dua Lipa', 'Priyanka Chopra', 'Kareena Kapoor', 'Sania Mirza', 'I am not attending this question', '3'),
(105, '<b> Which state government has expanded Swasthya Sathi scheme? <br></b>', 'Uttar Pradesh', 'Delhi', 'Haryana', 'West Bengal', 'I am not attending this question', '3'),
(106, '<b> In which city road construction has begun by using plastic waste? <br></b>', 'Bengaluru', 'Lucknow', 'Kolkata', 'Ranchi', 'I am not attending this question', ''),
(107, '<b> At which spot Indian National Team has moved up in latest FIFA Rankings? <br></b>', '104', '108', '102', '122', 'I am not attending this question', '3'),
(108, '<b> Which state government has started Garbh Sanskar scheme? <br></b>', 'Kerala', 'Madhya Pradesh', 'Uttar Pradesh', 'Gujarat', 'I am not attending this question', '3'),
(109, '<b>Who is the author of the book titled Jungle Nama?  <br></b>', 'Amitav Ghosh', 'Shashi Tharoor', 'Arundhati Roy', 'Chetan Bhagat', 'I am not attending this question', '3'),
(110, '<b>Which Corps of Indian Army has launched a 1971 kilometres cycling expedition in Gujarat and Rajasthan?  <br></b>', 'Konark Corps', 'Nagrota Corps', 'Kharga Corps', 'Rising Star Corps', 'I am not attending this question', '3'),
(111, '<b>A shopkeeper sold an article for Rs 2564.36. Approximately what was his profit percent if\nthe cost price of the article was Rs 2400<br></b>', '0.07', '0.09', '6%', '0.1', 'I am not attending this question', '3'),
(112, '<b>A sum of money at simple interest amounts to Rs. 2240 in 2 years and to Rs. 2600 in 5\nyears. What is the principal amount<br></b>', '1000', '2000', '5000', '8000', 'I am not attending this question', '3'),
(113, 'A man saves Rs 200 at the end of each year and lends the money at 5% compound interest. How much will it become at the end of 3 years.', 'Rs 662.02', 'Rs 669.02', 'Rs 667.02', 'Rs 661.02', 'I am not attending this question', '3'),
(114, 'Find compound interest on Rs. 7500 at 4% per annum for 2 years, compounded annually', '612', '225', '129', '275', 'I am not attending this question', '3'),
(115, 'The least number of complete years in which a sum of money put out at 20% compound interest will be more than doubled is', '4 years', '6 years', '8 years', '9 years', 'I am not attending this question', ''),
(116, '<b>If the simple interest on a sum of money for 2 years at 5% per annum is Rs.50, what will be the\ncompound interest on same values<br></b>', 'Rs 51.25', 'Rs 51.21', 'Rs 52.25', 'Rs 50.12', 'I am not attending this question', '3'),
(117, '<b>The difference between simple and compound interests compounded annually on a\ncertain sum of money for 2 years at 4% per annum is Rs 1. Find the sum<br></b>', '625', '631', '620', '621', 'I am not attending this question', '3'),
(118, '<b>Two boys starting from the same place walk at a rate of 5kmph and 5.5kmph\nrespectively. What time will they take to be 8.5km apart, if they walk in the same direction?<br></b>', '20', '17', '25', '30', 'I am not attending this question', ''),
(119, '<b> A box contains 4 red, 3 white and 2 blue balls. Three balls are drawn at random. Find out the number of ways of selecting the balls of different colours<br></b>', '11', '24', '36', '38', 'I am not attending this question', '3'),
(120, '<b>A bag contains 2 white balls, 3 black balls and 4 red balls. In how many ways can 3 balls be\ndrawn from the bag, if at least one black ball is to be included in the draw<br></b>', '64', '77', '12', '87', 'I am not attending this question', '3'),
(121, 'Look at this series: 80, 10, 70, 15, 60, ... What number should come next?', '20', '25', '45', '46', 'I am not attending', '3'),
(122, 'In the following questions choose the word which is the exact OPPOSITE of the given ENORMOUS words', 'soft', 'average', 'tiny', 'weak', 'I am not attending', ''),
(123, 'Commision', 'Start', 'close', 'finish', 'terminate', 'I am not attending', '3'),
(124, 'ARTIFICIAL', 'Red', 'natural', 'truthful', 'solid', 'I am not attending', '3'),
(125, 'Which of phrases given below each sentence should replace the phrase printed in bold type to make the  grammatically correct? If the sentence is correct as it is, mark \'E\' as the answer. The small child does whatever his father was done.', 'did', 'does', 'has done', 'None of above', 'I am not attending', '3'),
(126, 'You need not come unless you want to.', 'You don\'t need to come unless you want to', 'You come only when you want to', 'No error', 'You come only when you want ', ' I am not attending', ''),
(127, 'The man to who I sold my house was a cheat.', 'to whom i sold', 'the man ', 'No error', 'red', 'I am not attending', '3'),
(128, 'Meaning To make clean breast of', 'To confess without of reserve', 'To praise', 'To play and praise', 'None of above', 'I am not attending', '3'),
(129, 'To keeps one\'s temper', 'To be in good mood', 'To be aloof ', 'To become king', 'None of above', 'I am not attending', ''),
(130, 'To catch a tartar', 'To cstch a dangerous person', 'To deal with a person ', 'To meet with disaster ', 'None of above', 'I am not attending', '33'),
(131, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.    \nFate smiles ...... those who untiringly grapple with stark realities of life<br></b>', 'with', 'over', 'on', 'round', 'I am not attending this question', '3'),
(132, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.  Catching the earlier train will give us the ...... to do some shopping<br></b>', 'chance', 'luck', 'possibility', 'occasion', 'I am not attending this question', '3'),
(133, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.  \nI saw a ...... of cows in the field <br></b>', 'group', 'herd', 'swarm', 'flock', 'I am not attending this question', '3'),
(134, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.   \nSuccess in this examination depends ...... hard work alone<br></b>', 'at', 'over', 'for', 'on', 'I am not attending this question', '3'),
(135, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.  My uncle decided to take ...... and my sister to the market.<br></b>', 'I', 'mine', 'me ', 'myself', 'I am not attending this question', '3'),
(136, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.   \nIf you smuggle goods into the country, they may be ...... by the customs authority<br></b>', 'possessed', 'punished', 'confiscated', 'fined', 'I am not attending this question', '3'),
(137, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.  Man does not live by ...... alone.<br></b>', 'food', 'bread', 'meals', 'diet', 'I am not attending this question', '3'),
(138, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.  Piyush behaves strangely at times and, therefore, nobody gets ...... with him.<br></b>', 'about', 'thought', 'along', 'up', 'I am not attending this question', '3'),
(139, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.   \nRohan and Rohit are twin brothers, but they do not look ......<br></b>', 'unique', 'different', 'likely', 'alike', 'I am not attending this question', '3'),
(140, '<b>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.  <br></b>', 'in', 'on', 'to', 'into', 'I am not attending this question', '3'),
(141, '<b>Which of the following is not a Java features?<br></br>', 'Dynamic', 'Architecture Neutral', 'Use of pointers', 'Object-oriented', 'I am not attending', '3'),
(142, '<b>_____ is used to find and fix bugs in the Java programs<br></b>', 'JVM', 'JRE', 'JDK', 'JDB', 'I am not attending', '3'),
(143, '<b>You want subclasses in any package to have access to members of a superclass. Which is the most restrictive access that accomplishes this objective?<br></br>', 'public', 'private', 'protected', 'None of these', 'I am not attending', '3'),
(144, '<b>Which three form part of correct array declarations?\n\npublic int a [ ]\nstatic int [ ] a\npublic [ ] int a\nprivate int a [3]\nprivate int [3] a [ ]\npublic final int [ ] a<br></b>', ' 1, 3, 4', ' 2, 4, 5', '1, 2, 6', ' 2, 5, 6', 'I am not attending', '3'),
(145, '<b>What is the prototype of the default constructor?<br><b>', 'Test( )', 'Test(void)', 'public Test( )', 'public Test(void)', 'I am not attending', '3'),
(146, '<b>Which cause a compiler error?<br></b>', 'int[ ] scores = {3, 5, 7};', ' int [ ][ ] scores = {2,7,6}, {9,3,45};', 'String cats[ ] = {\"Fluffy\", \"Spot\", \"Zeus\"};', 'boolean results[ ] = new boolean [] {true, false, true};', 'I am not attending', '3'),
(147, '<b>public class ReturnIt \n{ \n    returnType methodA(byte x, double y) /* Line 3 */\n    { \n        return (long)x / y * 2; \n    } \n}<br></b>', 'int', 'byte', 'long', 'double', 'I am not attending', '3'),
(148, '<b>Which one creates an instance of an array?<br></b>', ' int[ ] ia = new int[15]', 'float fa = new float[20];', 'char[ ] ca = Some String', 'int ia[ ] [ ] = { 4, 5, 6 }, { 1,2,3 };', 'I am not attending', '3'),
(149, '<b>Which two cause a compiler error?\n\nfloat[ ] f = new float(3);\nfloat f2[ ] = new float[ ];\nfloat[ ]f1 = new float[3];\nfloat f3[ ] = new float[3];\nfloat f5[ ] = {1.0f, 2.0f, 2.0f};<br></b>', '2,4', '3,5', '4,5', '1,2', 'I am not attending', '3'),
(150, '<b>Given a method in a protected class, what access modifier do you use to restrict access to that method to only the other members of the same class?<br></b>', 'final', 'static', 'private', 'protected', 'I am not attending', '4'),
(151, '<b>What is the rank of India in the Global Terrorism index 2020?  <br></b>', '2nd', '9th', '8th', '4th', 'I am not attending this question', '4'),
(152, '<b>  Indian Navy Day is celebrated on which date?<br></b>', '44168', '44169', '01-Dec', '44165', 'I am not attending this question', '4'),
(153, '<b>  Who has partnered with Suryoday Small Finance Bank to offer instant digital loans for MSMEs? <br></b>', 'Paytm', 'BHIM', 'PhonePe', 'Google Pay', 'I am not attending this question', '4'),
(154, '<b>Which state government has proposed to set-up its 6th Raimona National Park?  <br></b>', 'Assam', 'Madhya Pradesh', 'Bihar', 'Pachim Bangal', 'I am not attending this question', '4'),
(155, '<b> Which country emerged as the first country to approve COVID-19 vaccine? <br></b>', 'USA', 'Russia', 'Europe', 'United Kingdom', 'I am not attending this question', '4'),
(156, '<b> National energy conservation day is celebrated on which date?  <br></b>', '44176', '44179', '15-Dec', '44175', 'I am not attending this question', '4'),
(157, '<b>Which city ranked top position in global power city index 2020?  <br></b>', 'New York', 'Delhi', 'London', 'Paris', 'I am not attending this question', '4'),
(158, '<b>Who has launched Khud kamao Ghar Chalao Yojana scheme?   <br></b>', 'Sonu Sood', 'Aamir Khan', 'Akshay Kumar', 'Amitabh Bachchan', 'I am not attending this question', '4'),
(159, '<b> Who has been awarded with bharati award 2020? <br></b>', 'Prem Gopal', 'Jaganmohan Reddy', 'Seeni Viswanathan', 'Yash Chaudhari', 'I am not attending this question', '4'),
(160, '<b>India and which country has announced the introduction of temporary air services in corona era?   <br></b>', 'Bhutan', 'Nepal', 'Bangladesh', 'Myanmar', 'I am not attending this question', '4'),
(161, '<b>Which variables are created when an object is created with the use of the keyword \'new\' and destroyed when the object is destroyed<br></b>', 'Local variables', 'Class Variables', 'Instance variable', 'Static variables', 'I am not attending', '4'),
(162, '<b>find output: int values[ ] = {1,2,3,4,5,6,7,8,9,10};   for(int i=0;i< Y; ++i)   System.out.println(values[i]);<br></b>', '10', '11', '0:00', 'None of these', 'I am not attending', '4'),
(163, '<b>The concept of multiple inheritances is implemented in Java by  I. Extending two or more classes. II. Extending one class and implementing one or more interfaces. III. Implementing two or more interfaces.<br></b>', 'Only (II)', ' (I) and (II)', '(II) and (III)', 'Only (III).', 'I am not attending', '4'),
(164, '<b>Which of the following is a member of the java.lang package?<br></b> ', 'List ', 'Queue ', 'Stack ', 'Process.', 'I am not attending', '4'),
(165, '<b>String s1 = ? yes? ; String s2 = ? yes ? ; String s3 = new String ( s1);  Which of the following would equate to true?<br></b>', 's1 == s2', 's1 = s2', 's3 == s1', 's1!=s2.', 'I am not attending', '4'),
(166, '<b>What will be the result of the expression 13 & 25 in java?<br></b>', '38', '25', '9', '12', 'I am not attending', '4'),
(167, '<b>Which one of these is a valid method declaration?<br></b>', 'void method1', 'void method2()', 'void method3(void)', 'methods(void)', 'I am not attending', '4'),
(168, '<b>Which one of the following class definitions is a valid definition of a class that cannot be instantiated?<br><b>', 'class Ghost { abstract void haunt(); }', 'abstract class Ghost { void haunt(); } ', 'abstract class Ghost { void haunt() { }; }', 'abstract Ghost { abstract void haunt(); } ', 'I am not attending', '4'),
(169, '<b>Given the following definition of a class, which fields are accessible from outside the package com.corporation.project?  package com.corporation.project; public class MyClass { int i; public int j; protected int k; private int l; } Select the correct answer<br></b>', 'Field i is accessible  in all classes in  other packages', 'Field j is accessible in all classes in other packages', 'Field k is accessible in all classes in other packages', 'Field l is accessible in subclasses only in other packages', 'I am not attending', '4'),
(170, '<b>Predict the output of following Java Programs. class Test {      protected int x, y;  }     class Main {      public static void main(String args[]) {          Test t = new Test();          System.out.println(t.x +  \" + t.y);      }  } <br></b>\"', 'null null', '1  1', '1 0', '0  0', 'I am not attending', '4'),
(171, '<b>class Test {      public static void main(String[] args) {          for(int i = 0; true; i++) {              System.out.println(Hello);              break;          }      }  }<br></b>', 'compiler error', 'nothing printed', 'Hello', 'None of these', 'I am not attending', '4'),
(172, '<b> If 892.7 - 573.07 - 95.007 = ?A?. What is the value of A? <br></b>', '414.637', '224.777', '233.523', '224.623', 'I am not attending', '4'),
(173, '<b>Which of the following numbers is not divisible by 14?<br></b>', '3542', '2086', '1998', '2996', 'I am not attending this question', '4'),
(174, '<b>A customer paid you $600 for construction work, out of which, 3/5 of the total amount was spent on the purchase of materials and 1/5 of the remaining was spent on travelling. How much is left after all the deductions?<br></b>', '$120 ', '$190 ', '$192 ', '$240 ', 'I am not attending this question', '4'),
(175, '<b>How many numbers are there in all from 4000 to 4999 (both 4000 and 4999 included) having at least one of their digits repeated?<br></b>', '492', '501', '455', ': 496', 'I am not attending this question', '4'),
(176, '<b> Dhruv and Naksh drive at the speeds of 36 Kmph and 54 kmph respectively. If Naksh tak324es 3 hours lesser than what Dhruv takes for the same distance. Then distance is :<br></b>', '296', '324', '453', '121', 'I am not attending this question', '4'),
(177, '<b>Abhimanyu and supreet can together finish a work in 50 days. They worked together for 35 days and then supreet left. After another 21 days, Abhimanyu finished the remaining work. In how many days Abhimanyu alone can finish the work?<br></b>', '50', '80', '12', '70', 'I am not attending this question', '4'),
(178, '<b>The greatest number which on dividing 1657 and 2037 leaves remainders 6 and 5 respectively, is:<br></b>', '112', '127', '126', '129', 'I am not attending this question', '4'),
(179, '<b>A bag contains a white and b black balls. Two players A and B alternatively draw a ball from the bag, replacing the ball each time after the draw till one of them draws a white ball and wins the game. A begins the game, if the probability of As winning the game is three times that of B, then the ratio a:b is<br></b>', '0.084027778', '0.16875', '18:01', '0.511805556', 'I am not attending this question', '4'),
(180, '<b>Two vessels have equal volumes of pure alcohol and Pepsi. A bartender is mixing the drinks. He takes half the volume of the firstvessel containing alcohol and transfers it to the second vessel containing Pepsi. He now transfers ? of the resultant solution fromthe second vessel to the first. He repeats the entire process once more transferring always ? of the resultant solution to the othervessel.What is the respective ratio of Pepsi to alcohol in the second vessel after the process?<br></b>', '0.253472222', '0.04375', '9:05', '0.503472222', 'I am not attending this question', '4'),
(181, '<b>A person incurs a loss of 5% be selling a watch for Rs. 1140. At what price should the watch be sold to earn 5% profit.<br></b>', '1023', '1260', '1320', '1200', 'I am not attending this question', '4'),
(182, '<b>A book was sold for Rs 27.50 with a profit of 10%. If it were sold for Rs. 25.75, then would have been percentage of profit and loss ?<br></b>', '0.04', '0.06', '7%', '0.03', 'I am not attending this question', '4'),
(183, 'What number should come next?\n', '10', '16', '13', '15', 'I am not attending this', '4'),
(184, 'Which word is the odd man out', 'trivial', 'important', 'unimportant', 'insignificant', '', '4'),
(185, 'Which word does NOT belong with the others?', 'index', 'glossary', 'chapter', 'book', 'I am not attending', '4'),
(186, 'Which word does NOT belong with the others?', 'wing', 'fin', 'beak', 'rudder', 'I am not attending', '4'),
(187, 'CUP : LIP :: BIRD : ?', 'Grass', 'forest', 'beak', 'bush', 'I am not attending', '4'),
(188, 'Paw : Cat :: Hoof : ?', 'Lamb', 'Horse', 'Elephant ', 'Tiger', 'I am not attending', '4'),
(189, 'An Informal Gathering occurs when a group of people get together in a casual, relaxed manner. Which situation below is the best example of an Informal Gathering?', 'A debating club meets on the first Sunday morning of every month.', 'After finding out about his salary raise, Jay and a few colleagues go out for a quick dinner after work.', 'Meena sends out 10 invitations for a bachelorette party she is giving for her elder sister.', ' Whenever she eats at a Chinese restaurant, Roop seems to run into Dibya.', 'I am not attending', '4'),
(190, 'A Tiebreaker is an additional contest carried out to establish a winner among tied contestants. Choose one situation from the options below that best represents a Tiebreaker.', 'At halftime, the score is tied at 2-2 in a football match.', 'Serena and Maria have each secured 1 set in the game.', 'The umpire tosses a coin to decide which team will have bat first.', 'RCB and KKR each finished at 140 all out.', 'I am not attending', '4'),
(191, 'Pick the odd man out?', 'just ', 'fair ', 'ujy', 'biased', 'I am not attending', '4'),
(192, 'Safe : Secure :: Protect :', 'lock', 'guard', 'sure', 'conserve', 'I am not attending', '4'),
(193, 'The ?A? state government has chalked out a plan for the underdeveloped ?B? district where 66% of the funds will be placed in the hands of a committee of local representatives.\nCourses of action:\nI. The ?A? state government should decide guidelines and norms for the functioning of the committee.\nII. Other state government may follow similar plan if directed by the Central government.', 'If only I follows', 'If only IIfollows', '', '?If either I or II follows', 'I am not attending', '4'),
(194, 'In the following questions choose the word which is the exact OPPOSITE of the given ENORMOUS words', 'soft', 'average', 'tiny', 'weak', 'I am not attending', '4'),
(195, 'Commision', 'Start', 'close', 'finish', 'terminate', 'I am not attending', '4'),
(196, 'ARTIFICIAL', 'Red', 'natural', 'truthful', 'solid', 'I am not attending', '4'),
(197, 'Which of phrases given below each sentence should replace the phrase printed in bold type to make the  grammatically correct? If the sentence is correct as it is, mark \'E\' as the answer. The small child does whatever his father was done.', 'did', 'does', 'has done', 'None of above', 'I am not attending', '4'),
(198, 'You need not come unless you want to.', 'You don\'t need to come unless you want to', 'You come only when you want to', 'No error', 'You come only when you want ', ' I am not attending', '4'),
(199, 'The man to who I sold my house was a cheat.', 'to whom i sold', 'the man ', 'No error', 'red', 'I am not attending', '4'),
(200, 'Meaning To make clean breast of', 'To confess without of reserve', 'To praise', 'To play and praise', 'None of above', 'I am not attending', '4');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `sl_no` int(11) NOT NULL,
  `student_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `score` varchar(45) NOT NULL,
  `registered_date` varchar(45) NOT NULL,
  `exam_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `s_id` int(11) NOT NULL,
  `s_code` varchar(40) NOT NULL,
  `s_name` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`s_id`, `s_code`, `s_name`) VALUES
(1, 'IN-AP', 'Andhra Pradesh'),
(2, 'IN-AR', 'Arunachal Pradesh'),
(3, 'IN-AS', 'Assam'),
(4, 'IN-BR', 'Bihar'),
(5, 'IN-CT', 'Chhattisgarh'),
(6, 'IN-GA', 'Goa'),
(7, 'IN-GJ', 'Gujarat'),
(8, 'IN-HR', 'Haryana'),
(9, 'IN-HP', 'Himachal Pradesh'),
(10, 'IN-JK', 'Jammu and Kashmir'),
(11, 'IN-JH', 'Jharkhand'),
(12, 'IN-KA', 'Karnataka'),
(13, 'IN-KL', 'Kerala'),
(14, 'IN-MP', 'Madhya Pradesh'),
(15, 'IN-MH', 'Maharashtra'),
(16, 'IN-MN', 'Manipur'),
(17, 'IN-ML', 'Meghalaya'),
(18, 'IN-MZ', 'Mizoram'),
(19, 'IN-NL', 'Nagaland'),
(20, 'IN-OR', 'Odisha (Orissa)'),
(21, 'IN-PB', 'Punjab'),
(22, 'IN-RJ', 'Rajasthan'),
(23, 'IN-SK', 'Sikkim'),
(24, 'IN-TN', 'Tamil Nadu'),
(25, 'IN-TR', 'Tripura'),
(26, 'IN-UP', 'Uttar Pradesh'),
(27, 'IN-UT', 'Uttarakhand'),
(28, 'IN-WB', 'West Bengal'),
(29, 'IN-AN', 'Andaman and Nicobar Islands'),
(30, 'IN-CH', 'Chandigarh'),
(31, 'IN-DN', 'Dadra and Nagar Haveli'),
(32, 'IN-CT', 'Chhattisgarh'),
(33, 'IN-LD', 'Lakshadweep'),
(34, 'IN-DL', 'National Capital Territory of Delhi'),
(35, 'IN-PY', 'Puducherry');

-- --------------------------------------------------------

--
-- Table structure for table `std_ans_table`
--

CREATE TABLE `std_ans_table` (
  `sl_no` int(11) NOT NULL,
  `ans_key` varchar(45) DEFAULT NULL,
  `q_id` int(11) DEFAULT NULL,
  `std_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_detail`
--

CREATE TABLE `student_detail` (
  `std_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(60) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `email_id` varchar(60) NOT NULL,
  `nationality` varchar(15) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `college_id` varchar(45) NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `stream` varchar(50) NOT NULL,
  `address_line1` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address_line2` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `state` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `district` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pin` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `current_date_val` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `purpose` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'e = Exam, w = Workshop',
  `student_status` int(11) DEFAULT 0,
  `exam_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_section`
--
ALTER TABLE `admin_section`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `college_master`
--
ALTER TABLE `college_master`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `correct_answer`
--
ALTER TABLE `correct_answer`
  ADD PRIMARY KEY (`ans_id`),
  ADD KEY `q_id_idx` (`q_id`);

--
-- Indexes for table `idmaster`
--
ALTER TABLE `idmaster`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `question_table`
--
ALTER TABLE `question_table`
  ADD PRIMARY KEY (`q_no`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`sl_no`),
  ADD KEY `student_idx` (`student_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `std_ans_table`
--
ALTER TABLE `std_ans_table`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `student_detail`
--
ALTER TABLE `student_detail`
  ADD PRIMARY KEY (`std_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_section`
--
ALTER TABLE `admin_section`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `college_master`
--
ALTER TABLE `college_master`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `correct_answer`
--
ALTER TABLE `correct_answer`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `question_table`
--
ALTER TABLE `question_table`
  MODIFY `q_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_ans_table`
--
ALTER TABLE `std_ans_table`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `correct_answer`
--
ALTER TABLE `correct_answer`
  ADD CONSTRAINT `q_id` FOREIGN KEY (`q_id`) REFERENCES `question_table` (`q_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `student` FOREIGN KEY (`student_id`) REFERENCES `student_detail` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

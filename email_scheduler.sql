-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:38 PM
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
-- Database: `email_scheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `engineering_college`
--

CREATE TABLE `engineering_college` (
  `college_id` int(11) NOT NULL,
  `engineering_college_name` varchar(100) NOT NULL DEFAULT 'NA',
  `college_type` varchar(45) NOT NULL DEFAULT 'NA',
  `contact_person` varchar(45) NOT NULL DEFAULT 'NA',
  `designation` varchar(45) NOT NULL DEFAULT 'NA',
  `primary_email` varchar(45) NOT NULL DEFAULT 'NA',
  `secondary_email` varchar(45) NOT NULL DEFAULT 'NA',
  `comtact_number` varchar(45) NOT NULL DEFAULT 'NA',
  `website` varchar(45) NOT NULL DEFAULT 'NA',
  `engineering_college_state` varchar(45) NOT NULL DEFAULT 'NA',
  `mail_sent` varchar(45) NOT NULL DEFAULT 'not sent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `engineering_college`
--

INSERT INTO `engineering_college` (`college_id`, `engineering_college_name`, `college_type`, `contact_person`, `designation`, `primary_email`, `secondary_email`, `comtact_number`, `website`, `engineering_college_state`, `mail_sent`) VALUES
(1, 'Jalpaiguri Government Engineering College', 'engineering', 'DR Nimai Mukhopadhaya', 'TPO', 'nm1231@gmail.com', 'NA', '(03561)255132', 'https://jgec.ac.in', 'West Bengal', 'not sent'),
(2, 'Kalyani Government Engineering College', 'engineering', 'Kalyani Government Engineering College', 'TPO', 'tnp_kgec@kgec.edu.in', 'NA', '9433190264', 'https://collegedunia.com', 'West Bengal', 'not sent'),
(3, 'Haldia Institute of Technology', 'engineering', 'Mr Susmit Maity', 'Asst. Prof of IT', 'kgp_hit123@sanchamet.in', 'NA', '(03224)252900', 'https://collegedunia.com', 'West Bengal', 'not sent'),
(4, 'Institute of Engineering and Management', 'engineering', 'NA', 'NA', 'admin@iemcal.com', 'jobs@iemcal.com', '(033)2357 2059', 'iem.edu.in', 'West Bengal', 'not sent'),
(5, 'Bankura Unnayani Institute of Technology', 'engineering', 'Mrs.Amrita Mukherjee', 'TPO', 'amrita.mukherjee@gmail.com', 'NA', '9434362846', 'www.buie.ac.in', 'West Bengal', 'not sent'),
(6, 'Murshidabad College of Engineering & Technology46', 'engineering', 'Dr.Subhendu Biswas', 'TPO', 'placementmcet@yahoo.in', 'NA', '9434641559', 'www.mcetbhb.net', 'West Bengal', 'not sent'),
(7, 'College of Engineering and Management,Kolaghat', 'engineering', 'NA', 'NA', 'tpo.cemk@gmail.com', 'tpo@cemk.ac.in', '9830319129', 'www.cemkolaghat.org', 'West Bengal', 'not sent'),
(8, 'Asansol Engineering College', 'engineering', 'Indranil Mitra', 'TPO', 'principal.aecwb@gmail.com', 'recruitmentaec@gmail.com', '0341-2253057', 'www.aecwb.edu.in', 'West Bengal', 'not sent'),
(9, 'Netaji Subash Engineering College', 'engineering', 'NA', 'NA', 'principal_nsec@rediffmail.com', 'nacc@giascal01.vsnl.net.in', '033-2436-3333', 'https://nsec.ac.in', 'West Bengal', 'not sent'),
(10, 'Government College of Engineering and Textile Technology,Serampore', 'engineering', 'NA', 'NA', 'sumanta1955@gmail.com', 'NA', '033-2662-1058', 'www.gcetts.org', 'West Bengal', 'not sent'),
(11, 'Government College of Engineering and Textile Technology,Berhampore', 'engineering', 'Mrinal Kanti Kumar', 'TPO', 'trg_placement@gmail.com', 'NA', '9433190264', 'https://gcelt.gov.in', 'West Bengal', 'not sent'),
(12, 'Government College of Engineering and Ceramic Technology.', 'engineering', 'NA', 'NA', 'gcect@rediffmail.com', 'NA', '23701263', 'http://gcect.ac.in', 'West Bengal', 'not sent'),
(13, 'BP Poddar Institute of Management &Technology', 'engineering', 'Mr.Santanu Banerjee', 'NA', 'info@bppimt.ac.in', 'bppimt09@gmail.com', '9836436999', 'www.bppimt.ac.in', 'West Bengal', 'not sent'),
(14, 'MCKV Institute of Engineering', 'engineering', 'Mr.Sandeep Dutta', 'TPO', 'principal@mckvie.edu.in', 'info@mckvie.edu.in', '9007017339', 'www.mckvie.edu.in', 'West Bengal', 'not sent'),
(15, 'RCC Institute of Information Technology', 'engineering', 'NA', 'NA', 'placement.rcciit@gmail.com', 'NA', '9830198815', 'https://rcciit.org', 'West Bengal', 'not sent'),
(16, 'Birbhum Institute of Engineering and Technology', 'engineering', 'Mr Ashis Debnath', 'TPO', 'tnp@bietsuri.ac.in', 'NA', '9433320588', 'www.bietsuri.ac.in', 'West Bengal', 'not sent'),
(17, 'Siliguri Institute of Technology', 'engineering', 'Mr.Sudeep Das', 'TPO', 'sudeepdas26@gmail.com', 'NA', '9758135789', 'www.sittechno.org', 'West Bengal', 'not sent'),
(18, 'DR.B.C.Roy Engineering College,Durgapur', 'engineering', 'NA', 'NA', 'tpo.kol@bcrec.ac.in', 'bcrec_kolkata@yahoo.co.in', '033-235544112', 'https://bcrec.ac.in', 'West Bengal', 'not sent'),
(19, 'Bengal Institute of Technology', 'engineering', 'NA', 'NA', 'adimission@technoindiagroup.com', 'NA', '98544416', 'www.bitcollege.org', 'West Bengal', 'not sent'),
(20, 'St Thomas College of Engineering and Technology', 'engineering', 'NA', 'NA', 'stcet@stcet.ac.in', 'info@stcet.ac.in', '033-24481-081', 'www.stcet.org', 'West Bengal', 'not sent'),
(21, 'JIS College of Engineering', 'engineering', 'NA', 'NA', 'info.jiscollege@jisgroup.org', 'NA', '033-2582-2138', 'www.jiscollege.ac.in', 'West Bengal', 'not sent'),
(22, 'Gupta College of Technological Sciences,Asansol', 'engineering', 'NA', 'NA', 'placement.gcts@gmail.com', 'NA', '9800625765', 'www.gctsindia.in', 'West Bengal', 'not sent'),
(23, 'Bengal College of Engineering & Technology', 'engineering', 'Rakesh Yadav', 'TPO', 'placement@bcetdgp.ac.in', 'NA', '9933564121', 'https://bcetdgp.in', 'West Bengal', 'not sent'),
(24, 'Heritage Institute of Technology', 'engineering', 'Mr Kaushik Bhattarcharya', 'TPO', 'placement@heritageit.edu', 'hitplacement@heritageit.edu', '9830007333', 'www.heritageit.edu', 'West Bengal', 'not sent'),
(25, 'Narula Institute of Technology', 'engineering', 'NA', 'NA', 'info@nit.ac.in', 'NA', '033-2563 8888', 'https://nit.ac.in', 'West Bengal', 'not sent'),
(26, 'Bharatiya Vidya Bhavan Institute of Management Science', 'engineering', 'NA', 'NA', 'admin@bimskol.org', 'NA', '9830605544', 'www.bimskol.org', 'West Bengal', 'not sent'),
(27, 'Techno India', 'engineering', 'NA', 'NA', 'admission@technoindiagroup.com', 'NA', '9836544419', 'www.technoindiagroup.com', 'West Bengal', 'not sent'),
(28, 'Dumkal Institute of Engineering and Technology', 'engineering', 'NA', 'NA', 'dietnet@hotmail.com', 'besdiet.org@gmail.com', '9832668156', 'www.besdiet.org', 'West Bengal', 'not sent'),
(29, 'Bholananda National academy', 'engineering', 'NA', 'NA', 'bnv_bkp2005@yahoo.co.in', 'NA', '033 25940454', 'www.bholananda.org', 'West Bengal', 'not sent'),
(30, 'George College', 'engineering', 'NA', 'NA', 'enquiry@georgecollege.org', 'NA', '9830122991', 'www.georgecollege.org', 'West Bengal', 'not sent'),
(31, 'Gitaram Institute of Management', 'engineering', 'NA', 'NA', 'gitaram.institute2000@gmail.com', 'NA', '9002805538', 'https://gitaram.net', 'West Bengal', 'not sent'),
(32, 'Army Institute of Management', 'engineering', 'Puja Singh Ghosh', 'TPO', 'placement_cell@aim.ac.in', 'NA', '9051661236', 'www.aim.ac.in', 'West Bengal', 'not sent'),
(33, 'Institute of Business Management and Research', 'engineering', 'Shri S.S Pal', 'TPO', 'NA', 'NA', '9038298825', 'https://ibmrkolkata.ac.in', 'West Bengal', 'not sent'),
(34, 'Meghnad Saha Institute of Technology', 'engineering', 'NA', 'NA', 'info@msitcollege.org', 'NA', '033-2443 1032', 'www.msitcollege.org', 'West Bengal', 'not sent'),
(35, 'Guru Nanak Institute of Technology', 'engineering', 'NA', 'NA', 'info.gnit@jisgroup.org', 'NA', '033 2523 3900', 'https://gnit.ac.in', 'West Bengal', 'not sent'),
(36, 'Neotia Institute of Technology ,Management & Science', 'engineering', 'Prof.Sunanda Sinha', 'TPO', 'sunanda.sinha@nitmas.edu.in', 'NA', '9831730966', 'www.nitmas.edu.in', 'West Bengal', 'not sent'),
(37, 'Techno India Institute of Technology', 'engineering', 'NA', 'NA', 'tictplacementcell@yahoo.com', 'NA', '033 2357 6163', 'www.tict.edu.in', 'West Bengal', 'not sent'),
(38, 'Future Institute of Engineering and Management', 'engineering', 'Mrs Puja Roy Gangopadhyaya', 'TPO', 'fiem.placement.head@teamfuture.in', 'NA', '8584099995', 'https://futureengineering.in', 'West Bengal', 'not sent'),
(39, 'NSHM College of Management and Technology', 'engineering', 'NA', 'NA', 'director.CRTT@nshm.com', 'NA', '6292145279', 'www.nshm.com', 'West Bengal', 'not sent'),
(40, 'Nopany Institute of Management Studies', 'engineering', 'NA', 'NA', 'info@nims.ac.in', 'NA', '7044175206', 'www.nims.ac.in', 'West Bengal', 'not sent'),
(41, 'Techno India(Hooghly Campus)', 'engineering', 'NA', 'NA', 'placement@technoindiahooghly.org', 'NA', '033-2680 2389', 'www.technoindiahooghly.org', 'West Bengal', 'not sent'),
(42, 'Syamaprasad Institute of Technology & Management', 'engineering', 'NA', 'NA', 'siae.edu@gmail.com', 'NA', '033-2420 2611', 'https://syamaprasadinstt.org/sitm/', 'West Bengal', 'not sent'),
(43, 'Dinabandhu Andrews Institute of Technology & Management', 'engineering', 'Surajit Das', 'TPO', 'info@daitm.org.in', 'daitm2009@gmail.com', '033-24360099', 'www.daitm.org.in', 'West Bengal', 'not sent'),
(44, 'Durgapur Institute of Advanced Technology and Management', 'engineering', 'Mr Arunava Dutta', 'TPO', 'tpo.diatm@rahul.ac.in', 'NA', '7407147000', 'https://diatm.rahul.ac.in', 'West Bengal', 'not sent'),
(45, 'Pailan College of Management and Technology', 'engineering', 'Mr.Saikat Ganguly', 'TPO', 'saikat.ganguly@pcmt-india.net', 'NA', '9932878276', 'www.pcmt-india.net', 'West Bengal', 'not sent'),
(46, 'National Power Training Institute', 'engineering', 'NA', 'NA', 'durgapur.nptier@gmail.com', 'NA', '0343 2546237', 'www.nptidurgapur.com', 'West Bengal', 'not sent'),
(47, 'Mallabhum Institute of Technology', 'engineering', 'Mr.Abhishek Pal', 'TPO', 'tnpcell@mitbishnupur.ac.in', 'NA', '9064420541', 'www.mitbishnupur.ac.in', 'West Bengal', 'not sent'),
(48, 'Bengal Institute of Technology and Management', 'engineering', 'NA', 'NA', 'director@bitm.org.in', 'NA', '9007030104', 'https://bitm.org.in', 'West Bengal', 'not sent'),
(49, 'George College of Management and Science', 'engineering', 'NA', 'NA', 'enquiry@georgecollege.org', 'NA', '9830122991', 'www.georgecollege.org', 'West Bengal', 'not sent'),
(50, 'Calcutta Institute of Engineering and Management', 'engineering', 'Sudipta Dhar', 'TPO', 'info@ciem.ac.in', 'NA', '6289566429', 'https://ciem.ac.in', 'West Bengal', 'not sent'),
(51, 'Management Institute of Durgapur', 'engineering', 'NA', 'NA', 'spdutta@rahul.ac.in', 'NA', '8918469940', 'https://mid.rahul.ac.in', 'West Bengal', 'not sent'),
(52, 'Saroj Mohan institute of Technology', 'engineering', 'NA', 'NA', 'tpo.degree@smitgp.edu.in', 'NA', '9733090085', 'https://smitgp.edu.in', 'West Bengal', 'not sent'),
(53, 'Academy of Technology', 'engineering', 'NA', 'NA', 'placement@aot.edu.in', 'corporaterelations@aot.edu.in', '9830156906', 'https://aot.edu.in', 'West Bengal', 'not sent'),
(54, 'IMPS College of Engineering & Technology', 'engineering', 'Mr.Anirban Dutta', 'TPO', 'impscet.tpo@gmail.com', 'NA', '9232306747', 'www.impscet.nit', 'West Bengal', 'not sent'),
(55, 'Aryabhatta Institute of Engineering and Management,Durgapur', 'engineering', 'Mr.Saikat Ganguly', 'TPO', 'info@aiemd.org', 'NA', '9832804970', 'www.aiemd.org', 'West Bengal', 'not sent'),
(56, 'Kingston School of Management and Science', 'engineering', 'NA', 'NA', 'keduins@gmail.com', 'NA', '033-2542 9800', 'https://ksmscal.edu.in', 'West Bengal', 'not sent'),
(57, 'Haldia Institute of Management', 'engineering', 'NA', 'NA', 'him.2004@rediffmail.co', 'NA', '3224205101', 'www.himhaldia.edu.in', 'West Bengal', 'not sent'),
(58, 'Hooghly Engineering and Technology College', 'engineering', 'Mr Dipankar Mitra', 'TPO', 'tpo.hetc@gmail.com', 'NA', '9831011436', 'www.hetc.ac.in', 'West Bengal', 'not sent'),
(59, 'Calcutta Institute of Technology', 'engineering', 'Ms.Tarannum Jahan', 'NA', 'placement@bciedu.org', 'NA', '8335069588', 'www.bciedu.org', 'West Bengal', 'not sent'),
(60, 'International Institute of Management Sciences', 'engineering', 'NA', 'NA', 'NA', 'NA', '033-2288 0008', 'www.iimsind.org', 'West Bengal', 'not sent'),
(61, 'Institute of Science and Technology', 'engineering', 'NA', 'NA', 'tpo@estonline.org.in', 'NA', '3225-267288', 'https://istonline.org.in', 'West Bengal', 'not sent'),
(62, 'Eastern Institute for Integrated Learning in Management', 'engineering', 'Mr.Surajit Chatterjee', 'NA', 'corporateeiilm18@gmail.com', 'NA', '9163393604', 'www.eiilm.co.in', 'West Bengal', 'not sent'),
(63, 'Techno India College of Technology,Newtown', 'engineering', 'NA', 'NA', 'tictplacementcell@yahoo.com', 'NA', '033-2357-6163', 'www.tict.edu.in', 'West Bengal', 'not sent'),
(64, 'Global Institute of Science and Technology', 'engineering', 'NA', 'NA', 'info@gisthaldia.org', 'NA', '3224 255953', 'https://gisthaldia.org', 'West Bengal', 'not sent'),
(65, 'Bengal School of Technology and Management', 'engineering', 'NA', 'NA', 'NA', 'NA', '8334825272', 'https://bengalschooloftechnology.org', 'West Bengal', 'not sent'),
(66, 'Institute of Management Study', 'engineering', 'Prasanta Kumar Sengupta', 'TPO', 'p3.sengupta@gmail.com', 'NA', '9433456814', 'https://imscal.org', 'West Bengal', 'not sent'),
(67, 'Advanced Information and  Management Studies', 'engineering', 'NA', 'NA', 'response@aimssyndicate.org', 'NA', '9434032581', 'https://aimscollege.org', 'West Bengal', 'not sent'),
(68, 'The Calcutta Anglo Gujarati College', 'engineering', 'NA', 'NA', 'NA', 'NA', '033 2235 9903', 'www.cges.ac.in', 'West Bengal', 'not sent'),
(69, 'Kotibarsha Institute of Technology & Management', 'engineering', 'NA', 'NA', 'info@kitm.net.in', 'NA', '9002318455', 'www.kitm.net.in', 'West Bengal', 'not sent'),
(70, 'Seacom Engineering College', 'engineering', 'NA', 'NA', 'principal@seacomengineering.org', 'admission@seacomengineering.org', '9836255810', 'www.seacomengineering.org', 'West Bengal', 'not sent'),
(71, 'Dream Institute of Technology', 'engineering', 'NA', 'NA', 'placement@dreaminstituteonline.com', 'NA', '9830895486', 'www.dreaminstituteonline.com', 'West Bengal', 'not sent'),
(72, 'Institute of Genetic Engineering', 'engineering', 'NA', 'NA', 'career.ige@gmail.com', 'NA', '033-25260051', 'www.ige-india.com', 'West Bengal', 'not sent'),
(73, 'Tamralipta institute of Management&Technology', 'engineering', 'NA', 'NA', 'timt.institute@gmail', 'NA', '8697511132', 'www.timt.org.in', 'West Bengal', 'not sent'),
(74, 'The Heritage Academy', 'engineering', 'NA', 'NA', 'admin@tha.edu.in', 'NA', '9830411222', 'www.tha.edu.in', 'West Bengal', 'not sent'),
(75, 'Seacom Management College', 'engineering', 'NA', 'NA', 'seacommanagement@rediffmail.com', 'NA', '033-2430 9308', 'www.seacommanagement.org', 'West Bengal', 'not sent'),
(76, 'NIMAS', 'engineering', 'NA', 'NA', 'nimas.admission@gmail.com', 'NA', '9874669007', 'www.nimas.in', 'West Bengal', 'not sent'),
(77, 'ABS Academy of Science,Technology & Management', 'engineering', 'NA', 'NA', 'info@absacademy.com', 'NA', '9434789201', 'www.absacademy.com', 'West Bengal', 'not sent'),
(78, 'Prajnananada Institute of Technology and Management', 'engineering', 'NA', 'NA', 'info@pitmkol.in', 'NA', '9830304496', 'www.pitmkol.in', 'West Bengal', 'not sent'),
(79, 'Gurukul Management Studies', 'engineering', 'NA', 'NA', 'gurukul221@gmail.com', 'NA', '8961 643542', 'https://gurukulstudy.com', 'West Bengal', 'not sent'),
(80, 'Techno India - Kolkata', 'engineering', 'NA', 'NA', 'info@ticollege.ac.in', 'principal@ticollege.ac.in', '033-23575683', 'https://ticollege.ac.in', 'West Bengal', 'not sent'),
(81, 'Durgapur Institute of Science,Technology and Management', 'engineering', 'NA', 'NA', 'support@youth4work.com', 'NA', '(0343) 2601868', 'www.distindia.org.in', 'West Bengal', 'not sent'),
(82, 'Camellia Institute of Technology', 'engineering', 'Mr.Arindam Biswas', 'TPO', 'director@camelliait.ac.in', 'NA', '9007030111', 'https://camelliait.ac.in', 'West Bengal', 'not sent'),
(83, 'Camellia School of Business Management', 'engineering', 'NA', 'NA', 'NA', 'NA', '9007030116', 'www.camelliagroup.in', 'West Bengal', 'not sent'),
(84, 'Greater Kolkata College of Engineering and Management', 'engineering', 'NA', 'NA', 'info@gkcem.ac.in', 'NA', '9073683914', 'https://gkcem.ac.in', 'West Bengal', 'not sent'),
(85, 'Camellia School of Engineering and Technology', 'engineering', 'NA', 'NA', 'admin@cset.org.in', 'NA', '9007030136', 'www.cset.org.in', 'West Bengal', 'not sent'),
(86, 'Abacus Institute of Engineering and Management', 'engineering', 'NA', 'NA', 'abacus.institute@jisgroup.org', 'NA', '03213-222660', 'www.abacusinstitute.org', 'West Bengal', 'not sent'),
(87, 'Swami Vivekananda Institute of Science and Technology', 'engineering', 'Mr.Purnendu nayek', 'TPO', 'contact@svist.org', 'NA', '9831760742', 'www.svist.org', 'West Bengal', 'not sent'),
(88, 'Techno India - Banipur', 'engineering', 'NA', 'NA', 'admission@technoindiagroup.com', 'NA', '9836544416', 'www.tibanipur.com', 'West Bengal', 'not sent'),
(89, 'Swami Vivekananda Institute of Management and Computer Science', 'engineering', 'Prof Amit De', 'TPO', 'mbaplacement1@gmail.com', 'NA', '9830952990', 'https://svimcs.org', 'West Bengal', 'not sent'),
(90, 'Kanad Institute of Engineering and Management', 'engineering', 'NA', 'NA', 'info@besonline.in', 'NA', '9564733330', 'https://collegedunia.com', 'West Bengal', 'not sent'),
(91, 'Supreme Knowledege Foundation Group of Institution', 'engineering', 'NA', 'NA', 'mankundu@skf.edu.in', 'NA', '9163321080', 'www.skf.edu.in', 'West Bengal', 'not sent'),
(92, 'Techno India - Durgapur', 'engineering', 'NA', 'NA', 'tigps.durgapur@gmail.com', 'NA', '7029274898', 'https://durgapur.tigps.in', 'West Bengal', 'not sent'),
(93, 'Dr.Sudhir Chandra Sur Degree Engineering College', 'engineering', 'NA', 'NA', 'info@dsec.ac.in', 'NA', '033-2560 3889', 'https://dsec.ac.in', 'West Bengal', 'not sent'),
(94, 'Camellia Institute of Technology and Management', 'engineering', 'NA', 'NA', 'citmhooghly09@gmail.com', 'NA', '9932681540', 'https://citm.org.in', 'West Bengal', 'not sent'),
(95, 'Techno India - Balurghat', 'engineering', 'NA', 'NA', 'enquiry@technoindiagroup.com', 'NA', '9432487011', 'www.technoindiagroup.com/tgbg/', 'West Bengal', 'not sent'),
(96, 'Global Institute of Management and Technology', 'engineering', 'NA', 'NA', 'info@siemsiliguri.org', 'NA', '9830876403', 'https://gimt-india.in', 'West Bengal', 'not sent'),
(97, 'Surendra Institute of Engineering and Management', 'engineering', 'NA', 'NA', 'info@siemsiliguri.org', 'NA', '9800869925', 'www.siemsiliguri.org', 'West Bengal', 'not sent'),
(98, 'Regent Education &Research Foundation group of Institutions', 'engineering', 'Sanjay Biswas', 'TPO ', 'registrar@regent.ac.in', 'NA', '033-30085432   ', 'https://www.rerf.in', 'West Bengal', 'not sent'),
(99, 'Swami Vivekananda Institute of Modern Science', 'engineering', 'NA', 'NA', 'NA', 'NA', '8335043359', 'www.svims.in', 'West Bengal', 'not sent');

-- --------------------------------------------------------

--
-- Table structure for table `engineering_college_test`
--

CREATE TABLE `engineering_college_test` (
  `college_id` int(11) NOT NULL,
  `engineering_college_name` varchar(100) NOT NULL DEFAULT 'NA',
  `college_type` varchar(45) NOT NULL DEFAULT 'NA',
  `contact_person` varchar(45) NOT NULL DEFAULT 'NA',
  `designation` varchar(45) NOT NULL DEFAULT 'NA',
  `primary_email` varchar(45) NOT NULL DEFAULT 'NA',
  `secondary_email` varchar(45) NOT NULL DEFAULT 'NA',
  `comtact_number` varchar(45) NOT NULL DEFAULT 'NA',
  `website` varchar(45) NOT NULL DEFAULT 'NA',
  `engineering_college_state` varchar(45) NOT NULL DEFAULT 'NA',
  `mail_sent` varchar(45) NOT NULL DEFAULT 'not sent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `engineering_college_test`
--

INSERT INTO `engineering_college_test` (`college_id`, `engineering_college_name`, `college_type`, `contact_person`, `designation`, `primary_email`, `secondary_email`, `comtact_number`, `website`, `engineering_college_state`, `mail_sent`) VALUES
(1, 'Nit', 'NA', 'NA', 'NA', 'shnjnsrdr.1995@gmail.com', 'NA', 'NA', 'NA', 'NA', 'not sent'),
(2, 'Shinjan', 'NA', 'NA', 'NA', 'rnisrdr.1995@gmail.com', 'NA', 'NA', 'NA', 'NA', 'not sent'),
(3, 'roni', 'NA', 'NA', 'NA', 'shinjanroni.1995@gmail.com', 'NA', 'NA', 'NA', 'NA', 'not sent'),
(4, 'teni', 'NA', 'NA', 'NA', 'shinjans63@gmail.com', 'NA', 'NA', 'NA', 'NA', 'not sent'),
(5, 'roni office', 'NA', 'NA', 'NA', 'shinjan.pcsglobal@gmail.com', 'NA', 'NA', 'NA', 'NA', 'not sent'),
(6, 'Soumak Konar', 'NA', 'NA', 'NA', 'hrm.pcsglobal@gmail.com', 'NA', 'NA', 'NA', 'NA', 'not sent'),
(7, 'office', 'NA', 'NA', 'NA', 'shinjan.s@pcsgpl.com', 'NA', 'NA', 'NA', 'NA', 'not sent');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `permission` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `permission`) VALUES
(1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `scheduler_time`
--

CREATE TABLE `scheduler_time` (
  `time_id` int(11) NOT NULL,
  `hh` varchar(45) NOT NULL,
  `mm` varchar(45) NOT NULL,
  `ss` varchar(45) NOT NULL,
  `interval` int(11) NOT NULL,
  `selected_timer` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `sl_no` int(11) NOT NULL,
  `selected_state` varchar(45) NOT NULL,
  `scheduler_active` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`sl_no`, `selected_state`, `scheduler_active`) VALUES
(1, 'goa', '0');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `s_id` int(11) NOT NULL,
  `s_code` text NOT NULL,
  `s_name` text NOT NULL
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
-- Table structure for table `stored_message`
--

CREATE TABLE `stored_message` (
  `msg_id` int(11) NOT NULL,
  `subject` longtext NOT NULL,
  `message` longtext NOT NULL,
  `thanks` longtext NOT NULL,
  `attachment` longtext DEFAULT NULL,
  `attachment_two` longtext DEFAULT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `engineering_college`
--
ALTER TABLE `engineering_college`
  ADD PRIMARY KEY (`college_id`,`primary_email`);

--
-- Indexes for table `engineering_college_test`
--
ALTER TABLE `engineering_college_test`
  ADD PRIMARY KEY (`college_id`,`primary_email`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduler_time`
--
ALTER TABLE `scheduler_time`
  ADD PRIMARY KEY (`time_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `stored_message`
--
ALTER TABLE `stored_message`
  ADD PRIMARY KEY (`msg_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `engineering_college`
--
ALTER TABLE `engineering_college`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `engineering_college_test`
--
ALTER TABLE `engineering_college_test`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scheduler_time`
--
ALTER TABLE `scheduler_time`
  MODIFY `time_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `stored_message`
--
ALTER TABLE `stored_message`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

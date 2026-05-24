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
-- Database: `email_scheduler_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `engineering_college`
--

CREATE TABLE `engineering_college` (
  `college_id` int(11) NOT NULL,
  `engineering_college_name` varchar(100) NOT NULL,
  `contact_person` varchar(45) NOT NULL,
  `designation` varchar(45) NOT NULL,
  `primary_email` varchar(45) NOT NULL,
  `secondary_email` varchar(45) DEFAULT NULL,
  `comtact_number` varchar(45) NOT NULL,
  `website` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `engineering_college`
--

INSERT INTO `engineering_college` (`college_id`, `engineering_college_name`, `contact_person`, `designation`, `primary_email`, `secondary_email`, `comtact_number`, `website`) VALUES
(1, 'Jalpaiguri Government Engineering College', 'DR Nimai Mukhopadhaya', 'TPO', 'nm1231@gmail.com', '', '(03561)255132', 'https://jgec.ac.in'),
(2, 'Kalyani Government Engineering College', 'Kalyani Government Engineering College', 'TPO', 'tnp_kgec@kgec.edu.in', '', '9433190264', 'https://collegedunia.com'),
(3, 'Haldia Institute of Technology', 'Mr Susmit Maity', 'Asst. Prof of IT', 'kgp_hit123@sanchamet.in', '', '(03224)252900', 'https://collegedunia.com'),
(4, 'Institute of Engineering and Management', '', '', 'admin@iemcal.com', 'jobs@iemcal.com', '(033)2357 2059', 'iem.edu.in'),
(5, 'Bankura Unnayani Institute of Technology', 'Mrs.Amrita Mukherjee', 'TPO', 'amrita.mukherjee@gmail.com', '', '9434362846', 'www.buie.ac.in'),
(6, 'Murshidabad College of Engineering & Technology46', 'Dr.Subhendu Biswas', 'TPO', 'placementmcet@yahoo.in', '', '9434641559', 'www.mcetbhb.net'),
(7, 'College of Engineering and Management,Kolaghat', '', '', 'tpo.cemk@gmail.com', 'tpo@cemk.ac.in', '9830319129', 'www.cemkolaghat.org'),
(8, 'Asansol Engineering College', 'Indranil Mitra', 'TPO', 'principal.aecwb@gmail.com', 'recruitmentaec@gmail.com', '0341-2253057', 'www.aecwb.edu.in'),
(9, 'Netaji Subash Engineering College', '', '', 'principal_nsec@rediffmail.com', 'nacc@giascal01.vsnl.net.in', '033-2436-3333', 'https://nsec.ac.in'),
(10, 'Government College of Engineering and Textile Technology,Serampore', '', '', 'sumanta1955@gmail.com', '', '033-2662-1058', 'www.gcetts.org'),
(11, 'Government College of Engineering and Textile Technology,Berhampore', 'Mrinal Kanti Kumar', 'TPO', 'trg_placement@gmail.com', '', '9433190264', 'https://gcelt.gov.in'),
(12, 'Government College of Engineering and Ceramic Technology.', '', '', 'gcect@rediffmail.com', '', '23701263', 'http://gcect.ac.in'),
(13, 'BP Poddar Institute of Management &Technology', 'Mr.Santanu Banerjee', '', 'info@bppimt.ac.in', 'bppimt09@gmail.com', '9836436999', 'www.bppimt.ac.in'),
(14, 'MCKV Institute of Engineering', 'Mr.Sandeep Dutta', 'TPO', 'principal@mckvie.edu.in', 'info@mckvie.edu.in', '9007017339', 'www.mckvie.edu.in'),
(15, 'RCC Institute of Information Technology', '', '', 'placement.rcciit@gmail.com', '', '9830198815', 'https://rcciit.org'),
(16, 'Birbhum Institute of Engineering and Technology', 'Mr Ashis Debnath', 'TPO', 'tnp@bietsuri.ac.in', '', '9433320588', 'www.bietsuri.ac.in'),
(17, 'Siliguri Institute of Technology', 'Mr.Sudeep Das', 'TPO', 'sudeepdas26@gmail.com', '', '9758135789', 'www.sittechno.org'),
(18, 'DR.B.C.Roy Engineering College,Durgapur', '', '', 'tpo.kol@bcrec.ac.in', 'bcrec_kolkata@yahoo.co.in', '033-235544112', 'https://bcrec.ac.in'),
(19, 'Bengal Institute of Technology', '', '', 'adimission@technoindiagroup.com', '', '98544416', 'www.bitcollege.org'),
(20, 'St Thomas College of Engineering and Technology', '', '', 'stcet@stcet.ac.in', 'info@stcet.ac.in', '033-24481-081', 'www.stcet.org'),
(21, 'JIS College of Engineering', '', '', 'info.jiscollege@jisgroup.org', '', '033-2582-2138', 'www.jiscollege.ac.in'),
(22, 'Gupta College of Technological Sciences,Asansol', '', '', 'placement.gcts@gmail.com', '', '9800625765', 'www.gctsindia.in'),
(23, 'Bengal College of Engineering & Technology', 'Rakesh Yadav', 'TPO', 'placement@bcetdgp.ac.in', '', '9933564121', 'https://bcetdgp.in'),
(24, 'Heritage Institute of Technology', 'Mr Kaushik Bhattarcharya', 'TPO', 'placement@heritageit.edu', 'hitplacement@heritageit.edu', '9830007333', 'www.heritageit.edu'),
(25, 'Narula Institute of Technology', '', '', 'info@nit.ac.in', '', '033-2563 8888', 'https://nit.ac.in'),
(26, 'Bharatiya Vidya Bhavan Institute of Management Science', '', '', 'admin@bimskol.org', '', '9830605544', 'www.bimskol.org'),
(27, 'Techno India', '', '', 'admission@technoindiagroup.com', '', '9836544419', 'www.technoindiagroup.com'),
(28, 'Dumkal Institute of Engineering and Technology', '', '', 'dietnet@hotmail.com', 'besdiet.org@gmail.com', '9832668156', 'www.besdiet.org'),
(29, 'Bholananda National academy', '', '', 'bnv_bkp2005@yahoo.co.in', '', '033 25940454', 'www.bholananda.org'),
(30, 'George College', '', '', 'enquiry@georgecollege.org', '', '9830122991', 'www.georgecollege.org'),
(31, 'Gitaram Institute of Management', '', '', 'gitaram.institute2000@gmail.com', '', '9002805538', 'https://gitaram.net'),
(32, 'Army Institute of Management', 'Puja Singh Ghosh', 'TPO', 'placement_cell@aim.ac.in', '', '9051661236', 'www.aim.ac.in'),
(33, 'Institute of Business Management and Research', 'Shri S.S Pal', 'TPO', '', '', '9038298825', 'https://ibmrkolkata.ac.in'),
(34, 'Meghnad Saha Institute of Technology', '', '', 'info@msitcollege.org', '', '033-2443 1032', 'www.msitcollege.org'),
(35, 'Guru Nanak Institute of Technology', '', '', 'info.gnit@jisgroup.org', '', '033 2523 3900', 'https://gnit.ac.in'),
(36, 'Neotia Institute of Technology ,Management & Science', 'Prof.Sunanda Sinha', 'TPO', 'sunanda.sinha@nitmas.edu.in', '', '9831730966', 'www.nitmas.edu.in'),
(37, 'Techno India Institute of Technology', '', '', 'tictplacementcell@yahoo.com', '', '033 2357 6163', 'www.tict.edu.in'),
(38, 'Future Institute of Engineering and Management', 'Mrs Puja Roy Gangopadhyaya', 'TPO', 'fiem.placement.head@teamfuture.in', '', '8584099995', 'https://futureengineering.in'),
(39, 'NSHM College of Management and Technology', '', '', 'director.CRTT@nshm.com', '', '6292145279', 'www.nshm.com'),
(40, 'Nopany Institute of Management Studies', '', '', 'info@nims.ac.in', '', '7044175206', 'www.nims.ac.in'),
(41, 'Techno India(Hooghly Campus)', '', '', 'placement@technoindiahooghly.org', '', '033-2680 2389', 'www.technoindiahooghly.org'),
(42, 'Syamaprasad Institute of Technology & Management', '', '', 'siae.edu@gmail.com', '', '033-2420 2611', 'https://syamaprasadinstt.org/sitm/'),
(43, 'Dinabandhu Andrews Institute of Technology & Management', 'Surajit Das', 'TPO', 'info@daitm.org.in', 'daitm2009@gmail.com', '033-24360099', 'www.daitm.org.in'),
(44, 'Durgapur Institute of Advanced Technology and Management', 'Mr Arunava Dutta', 'TPO', 'tpo.diatm@rahul.ac.in', '', '7407147000', 'https://diatm.rahul.ac.in'),
(45, 'Pailan College of Management and Technology', 'Mr.Saikat Ganguly', 'TPO', 'saikat.ganguly@pcmt-india.net', '', '9932878276', 'www.pcmt-india.net'),
(46, 'National Power Training Institute', '', '', 'durgapur.nptier@gmail.com', '', '0343 2546237', 'www.nptidurgapur.com'),
(47, 'Mallabhum Institute of Technology', 'Mr.Abhishek Pal', 'TPO', 'tnpcell@mitbishnupur.ac.in', '', '9064420541', 'www.mitbishnupur.ac.in'),
(48, 'Bengal Institute of Technology and Management', '', '', 'director@bitm.org.in', '', '9007030104', 'https://bitm.org.in'),
(49, 'George College of Management and Science', '', '', 'enquiry@georgecollege.org', '', '9830122991', 'www.georgecollege.org'),
(50, 'Calcutta Institute of Engineering and Management', 'Sudipta Dhar', 'TPO', 'info@ciem.ac.in', '', '6289566429', 'https://ciem.ac.in'),
(51, 'Management Institute of Durgapur', '', '', 'spdutta@rahul.ac.in', '', '8918469940', 'https://mid.rahul.ac.in'),
(52, 'Saroj Mohan institute of Technology', '', '', 'tpo.degree@smitgp.edu.in', '', '9733090085', 'https://smitgp.edu.in'),
(53, 'Academy of Technology', '', '', 'placement@aot.edu.in', 'corporaterelations@aot.edu.in', '9830156906', 'https://aot.edu.in'),
(54, 'IMPS College of Engineering & Technology', 'Mr.Anirban Dutta', 'TPO', 'impscet.tpo@gmail.com', '', '9232306747', 'www.impscet.nit'),
(55, 'Aryabhatta Institute of Engineering and Management,Durgapur', 'Mr.Saikat Ganguly', 'TPO', 'info@aiemd.org', '', '9832804970', 'www.aiemd.org'),
(56, 'Kingston School of Management and Science', '', '', 'keduins@gmail.com', '', '033-2542 9800', 'https://ksmscal.edu.in'),
(57, 'Haldia Institute of Management', '', '', 'him.2004@rediffmail.co', '', '3224205101', 'www.himhaldia.edu.in'),
(58, 'Hooghly Engineering and Technology College', 'Mr Dipankar Mitra', 'TPO', 'tpo.hetc@gmail.com', '', '9831011436', 'www.hetc.ac.in'),
(59, 'Calcutta Institute of Technology', 'Ms.Tarannum Jahan', '', 'placement@bciedu.org', '', '8335069588', 'www.bciedu.org'),
(60, 'International Institute of Management Sciences', '', '', '', '', '033-2288 0008', 'www.iimsind.org'),
(61, 'Institute of Science and Technology', '', '', 'tpo@estonline.org.in', '', '3225-267288', 'https://istonline.org.in'),
(62, 'Eastern Institute for Integrated Learning in Management', 'Mr.Surajit Chatterjee', '', 'corporateeiilm18@gmail.com', '', '9163393604', 'www.eiilm.co.in'),
(63, 'Techno India College of Technology,Newtown', '', '', 'tictplacementcell@yahoo.com', '', '033-2357-6163', 'www.tict.edu.in'),
(64, 'Global Institute of Science and Technology', '', '', 'info@gisthaldia.org', '', '3224 255953', 'https://gisthaldia.org'),
(65, 'Bengal School of Technology and Management', '', '', '', '', '8334825272', 'https://bengalschooloftechnology.org'),
(66, 'Institute of Management Study', 'Prasanta Kumar Sengupta', 'TPO', 'p3.sengupta@gmail.com', '', '9433456814', 'https://imscal.org'),
(67, 'Advanced Information and  Management Studies', '', '', 'response@aimssyndicate.org', '', '9434032581', 'https://aimscollege.org'),
(68, 'The Calcutta Anglo Gujarati College', '', '', '', '', '033 2235 9903', 'www.cges.ac.in'),
(69, 'Kotibarsha Institute of Technology & Management', '', '', 'info@kitm.net.in', '', '9002318455', 'www.kitm.net.in'),
(70, 'Seacom Engineering College', '', '', 'principal@seacomengineering.org', 'admission@seacomengineering.org', '9836255810', 'www.seacomengineering.org'),
(71, 'Dream Institute of Technology', '', '', 'placement@dreaminstituteonline.com', '', '9830895486', 'www.dreaminstituteonline.com'),
(72, 'Institute of Genetic Engineering', '', '', 'career.ige@gmail.com', '', '033-25260051', 'www.ige-india.com'),
(73, 'Tamralipta institute of Management&Technology', '', '', 'timt.institute@gmail', '', '8697511132', 'www.timt.org.in'),
(74, 'The Heritage Academy', '', '', 'admin@tha.edu.in', '', '9830411222', 'www.tha.edu.in'),
(75, 'Seacom Management College', '', '', 'seacommanagement@rediffmail.com', '', '033-2430 9308', 'www.seacommanagement.org'),
(76, 'NIMAS', '', '', 'nimas.admission@gmail.com', '', '9874669007', 'www.nimas.in'),
(77, 'ABS Academy of Science,Technology & Management', '', '', 'info@absacademy.com', '', '9434789201', 'www.absacademy.com'),
(78, 'Prajnananada Institute of Technology and Management', '', '', 'info@pitmkol.in', '', '9830304496', 'www.pitmkol.in'),
(79, 'Gurukul Management Studies', '', '', 'gurukul221@gmail.com', '', '8961 643542', 'https://gurukulstudy.com'),
(80, 'Techno India - Kolkata', '', '', 'info@ticollege.ac.in', 'principal@ticollege.ac.in', '033-23575683', 'https://ticollege.ac.in'),
(81, 'Durgapur Institute of Science,Technology and Management', '', '', 'support@youth4work.com', '', '(0343) 2601868', 'www.distindia.org.in'),
(82, 'Camellia Institute of Technology', 'Mr.Arindam Biswas', 'TPO', 'director@camelliait.ac.in', '', '9007030111', 'https://camelliait.ac.in'),
(83, 'Camellia School of Business Management', '', '', '', '', '9007030116', 'www.camelliagroup.in'),
(84, 'Greater Kolkata College of Engineering and Management', '', '', 'info@gkcem.ac.in', '', '9073683914', 'https://gkcem.ac.in'),
(85, 'Camellia School of Engineering and Technology', '', '', 'admin@cset.org.in', '', '9007030136', 'www.cset.org.in'),
(86, 'Abacus Institute of Engineering and Management', '', '', 'abacus.institute@jisgroup.org', '', '03213-222660', 'www.abacusinstitute.org'),
(87, 'Swami Vivekananda Institute of Science and Technology', 'Mr.Purnendu nayek', 'TPO', 'contact@svist.org', '', '9831760742', 'www.svist.org'),
(88, 'Techno India - Banipur', '', '', 'admission@technoindiagroup.com', '', '9836544416', 'www.tibanipur.com'),
(89, 'Swami Vivekananda Institute of Management and Computer Science', 'Prof Amit De', 'TPO', 'mbaplacement1@gmail.com', '', '9830952990', 'https://svimcs.org'),
(90, 'Kanad Institute of Engineering and Management', '', '', 'info@besonline.in', '', '9564733330', 'https://collegedunia.com'),
(91, 'Supreme Knowledege Foundation Group of Institution', '', '', 'mankundu@skf.edu.in', '', '9163321080', 'www.skf.edu.in'),
(92, 'Techno India - Durgapur', '', '', 'tigps.durgapur@gmail.com', '', '7029274898', 'https://durgapur.tigps.in'),
(93, 'Dr.Sudhir Chandra Sur Degree Engineering College', '', '', 'info@dsec.ac.in', '', '033-2560 3889', 'https://dsec.ac.in'),
(94, 'Camellia Institute of Technology and Management', '', '', 'citmhooghly09@gmail.com', '', '9932681540', 'https://citm.org.in'),
(95, 'Techno India - Balurghat', '', '', 'enquiry@technoindiagroup.com', '', '9432487011', 'www.technoindiagroup.com/tgbg/'),
(96, 'Global Institute of Management and Technology', '', '', 'info@siemsiliguri.org', '', '9830876403', 'https://gimt-india.in'),
(97, 'Surendra Institute of Engineering and Management', '', '', 'info@siemsiliguri.org', '', '9800869925', 'www.siemsiliguri.org'),
(98, 'Regent Education &Research Foundation group of Institutions', 'Sanjay Biswas', 'TPO ', 'registrar@regent.ac.in', '', '033-30085432   ', 'https://www.rerf.in'),
(99, 'Swami Vivekananda Institute of Modern Science', '', '', '', '', '8335043359', 'www.svims.in');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `engineering_college`
--
ALTER TABLE `engineering_college`
  ADD PRIMARY KEY (`college_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `engineering_college`
--
ALTER TABLE `engineering_college`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

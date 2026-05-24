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
-- Database: `appteknow_stdents_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `type` enum('CODING','APTITUDE') DEFAULT NULL,
  `max_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_results`
--

CREATE TABLE `assessment_results` (
  `id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `violations` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('PRESENT','ABSENT','LEAVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('ONGOING','COMPLETED') DEFAULT 'ONGOING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communications`
--

CREATE TABLE `communications` (
  `id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `type` enum('EMAIL','WHATSAPP') DEFAULT NULL,
  `sent_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_master`
--

CREATE TABLE `course_master` (
  `id` int(11) NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_master`
--

INSERT INTO `course_master` (`id`, `course_name`, `duration`, `description`) VALUES
(1, 'Java', '3 Months', 'Java Programming Course'),
(2, 'Python', '3 Months', 'Python Programming Course'),
(3, 'AWS', '2 Months', 'AWS Cloud Certification'),
(4, 'Data Analytics', '3 Months', 'Data Analytst Course'),
(5, 'Data Science', '3 months', 'Data Science'),
(6, 'MERN STACK', '6 Months', 'MERN stack course'),
(7, 'AI DevOps', '6 Months', 'AI DevOps - learn AI integration in DevOps');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` enum('CASH','ONLINE','CARD','BANK_TRANSFER') DEFAULT NULL,
  `receipt_url` varchar(255) DEFAULT NULL,
  `paid_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `job_role` varchar(150) DEFAULT NULL,
  `criteria` text DEFAULT NULL,
  `posted_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` enum('APPLIED','SELECTED','REJECTED') DEFAULT 'APPLIED'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `status` enum('NEW','FOLLOWUP','CONVERTED') DEFAULT 'NEW',
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `project_name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_master`
--

CREATE TABLE `role_master` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `role_master`
--

INSERT INTO `role_master` (`id`, `role_name`) VALUES
(2, 'ADMIN'),
(5, 'MARKETER'),
(4, 'STUDENT'),
(1, 'SUPER_ADMIN'),
(3, 'TRAINER');

-- --------------------------------------------------------

--
-- Table structure for table `skills_master`
--

CREATE TABLE `skills_master` (
  `id` int(11) NOT NULL,
  `skill_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `skills_master`
--

INSERT INTO `skills_master` (`id`, `skill_name`) VALUES
(100, 'Accessibility (a11y)'),
(150, 'Accountability'),
(130, 'Adaptability'),
(174, 'Administrative Support'),
(106, 'Agile Methodology'),
(63, 'Algorithms'),
(146, 'Analytical Skills'),
(84, 'Android Development'),
(11, 'Angular'),
(92, 'API Development'),
(66, 'Artificial Intelligence'),
(144, 'Attention to Detail'),
(79, 'Augmented Reality (AR)'),
(103, 'Automated Testing'),
(40, 'AWS'),
(41, 'Azure'),
(231, 'Back-Office Operations'),
(95, 'Backend Development'),
(55, 'Bash'),
(68, 'Big Data'),
(51, 'Bitbucket'),
(75, 'Blockchain'),
(224, 'Brand Ambassador Skills'),
(156, 'Brand Management'),
(234, 'Brokerage Support'),
(171, 'Budgeting'),
(189, 'Business Analytics (non-technical)'),
(153, 'Business Development'),
(3, 'C'),
(5, 'C#'),
(4, 'C++'),
(164, 'Change Management'),
(239, 'Childcare Services'),
(45, 'CI/CD'),
(43, 'Cloud Computing'),
(114, 'Cloud Security'),
(179, 'Coaching & Mentoring'),
(126, 'Communication'),
(211, 'Community Engagement'),
(169, 'Compliance'),
(73, 'Computer Vision'),
(142, 'Conflict Resolution'),
(119, 'Containerization'),
(157, 'Content Writing'),
(159, 'Copywriting'),
(131, 'Creativity'),
(133, 'Critical Thinking'),
(9, 'CSS'),
(196, 'Cultural Awareness'),
(194, 'Curriculum Development'),
(202, 'Customer Experience Design'),
(229, 'Customer Relations'),
(176, 'Customer Relationship Management'),
(139, 'Customer Service'),
(58, 'Cybersecurity'),
(115, 'Data Engineering'),
(173, 'Data Entry'),
(67, 'Data Science'),
(62, 'Data Structures'),
(111, 'Database Design'),
(136, 'Decision Making'),
(65, 'Deep Learning'),
(110, 'Design Patterns'),
(44, 'DevOps'),
(124, 'DevSecOps'),
(117, 'Digital Twin'),
(16, 'Django'),
(38, 'Docker'),
(77, 'Edge Computing'),
(158, 'Editing'),
(86, 'Embedded Systems'),
(134, 'Emotional Intelligence'),
(147, 'Empathy'),
(181, 'Entrepreneurship'),
(221, 'Environmental Management'),
(59, 'Ethical Hacking'),
(190, 'Event Coordination'),
(160, 'Event Management'),
(223, 'Event Marketing'),
(243, 'Executive Assistance'),
(14, 'Express.js'),
(203, 'Facilities Management'),
(237, 'Facility Operations'),
(218, 'Fashion Merchandising'),
(172, 'Financial Literacy'),
(33, 'Firebase'),
(87, 'Firmware Development'),
(17, 'Flask'),
(195, 'Foreign Language Proficiency'),
(227, 'Franchise Management'),
(230, 'Front-Office Management'),
(94, 'Frontend Development'),
(96, 'Full Stack Development'),
(209, 'Fundraising'),
(80, 'Game Development'),
(48, 'Git'),
(49, 'GitHub'),
(50, 'GitLab'),
(21, 'Go'),
(42, 'Google Cloud Platform'),
(212, 'Grant Writing'),
(214, 'Graphic Design (non-tech)'),
(35, 'GraphQL'),
(69, 'Hadoop'),
(220, 'Health & Safety Management'),
(192, 'Healthcare Administration'),
(201, 'Hospitality & Guest Services'),
(191, 'Hospitality Management'),
(241, 'Housekeeping Management'),
(8, 'HTML'),
(161, 'Human Resources'),
(61, 'Information Security'),
(233, 'Insurance Brokering'),
(217, 'Interior Design'),
(76, 'Internet of Things (IoT)'),
(143, 'Interpersonal Skills'),
(85, 'iOS Development'),
(113, 'IT Support'),
(1, 'Java'),
(6, 'JavaScript'),
(46, 'Jenkins'),
(105, 'JIRA'),
(108, 'Kanban'),
(23, 'Kotlin'),
(39, 'Kubernetes'),
(19, 'Laravel'),
(128, 'Leadership'),
(242, 'Leadership Development'),
(187, 'Legal Awareness'),
(232, 'Legal Coordination'),
(207, 'Life Coaching'),
(52, 'Linux'),
(123, 'Log Management'),
(167, 'Logistics'),
(222, 'Logistics Planning'),
(64, 'Machine Learning'),
(155, 'Marketing Strategy'),
(186, 'Media Planning'),
(213, 'Media Production (non-tech)'),
(88, 'Microcontrollers'),
(118, 'Microservices'),
(83, 'Mobile App Development'),
(30, 'MongoDB'),
(148, 'Motivation'),
(28, 'MySQL'),
(74, 'Natural Language Processing'),
(135, 'Negotiation'),
(198, 'Negotiation & Persuasion'),
(57, 'Networking'),
(13, 'Node.js'),
(27, 'NoSQL'),
(25, 'Objective-C'),
(121, 'Observability'),
(175, 'Office Management'),
(165, 'Operations Management'),
(31, 'Oracle DB'),
(137, 'Organisation'),
(60, 'Penetration Testing'),
(101, 'Performance Optimisation'),
(215, 'Photography'),
(18, 'PHP'),
(138, 'Planning'),
(29, 'PostgreSQL'),
(56, 'PowerShell'),
(182, 'Presentation Design'),
(140, 'Presentation Skills'),
(132, 'Problem Solving'),
(225, 'Product Demonstration'),
(152, 'Professionalism'),
(170, 'Project Management'),
(125, 'Prompt Engineering'),
(236, 'Property Management'),
(210, 'Public Policy Understanding'),
(185, 'Public Relations'),
(141, 'Public Speaking'),
(2, 'Python'),
(72, 'PyTorch'),
(168, 'Quality Assurance'),
(219, 'Quality Control'),
(90, 'Quantum Computing'),
(10, 'React'),
(235, 'Real Estate Sales'),
(162, 'Recruitment'),
(34, 'Redis'),
(145, 'Research'),
(36, 'REST API'),
(200, 'Retail Management'),
(226, 'Retail Sales'),
(188, 'Risk Management'),
(89, 'Robotics'),
(20, 'Ruby on Rails'),
(22, 'Rust'),
(154, 'Sales'),
(199, 'Salesforce Support (non-technical)'),
(107, 'Scrum'),
(104, 'Selenium'),
(149, 'Self-Discipline'),
(238, 'Senior Citizen Care Management'),
(91, 'Serverless Architecture'),
(120, 'Service Mesh'),
(54, 'Shell Scripting'),
(116, 'Site Reliability Engineering (SRE)'),
(37, 'SOAP API'),
(184, 'Social Media Management'),
(109, 'Software Architecture'),
(102, 'Software Testing'),
(70, 'Spark'),
(15, 'Spring Boot'),
(26, 'SQL'),
(32, 'SQLite'),
(228, 'Store Operations'),
(180, 'Strategic Thinking'),
(166, 'Supply Chain Management'),
(197, 'Sustainability Management'),
(24, 'Swift'),
(112, 'System Administration'),
(193, 'Teaching / Tutoring'),
(178, 'Team Building'),
(204, 'Team Coordination'),
(127, 'Teamwork'),
(122, 'Telemetry & Monitoring'),
(71, 'TensorFlow'),
(129, 'Time Management'),
(240, 'Tourism & Travel Management'),
(163, 'Training & Development'),
(206, 'Training Facilitation'),
(47, 'Travis CI'),
(7, 'TypeScript'),
(97, 'UI/UX Design'),
(81, 'Unity'),
(53, 'Unix'),
(82, 'Unreal Engine'),
(99, 'User Experience Design'),
(98, 'User Interface Design'),
(205, 'Vendor Coordination'),
(177, 'Vendor Management'),
(216, 'Video Editing (non-tech)'),
(78, 'Virtual Reality (VR)'),
(183, 'Visual Communication'),
(208, 'Volunteer Management'),
(12, 'Vue.js'),
(93, 'Web Development'),
(151, 'Work Ethic');

-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

CREATE TABLE `state_master` (
  `id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`id`, `state_name`) VALUES
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
(35, 'Lakshadweep'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
(36, 'Puducherry'),
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
-- Table structure for table `student_batches`
--

CREATE TABLE `student_batches` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('PENDING','COMPLETED') DEFAULT 'PENDING',
  `violations` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role_id`, `status`, `created_at`) VALUES
(1, 'hk', 'hk@gmail.com', '6687787097', '123', 4, 'ACTIVE', '2026-02-13 11:18:38'),
(2, 'bhuvan', 'bhuvan@gmail.com', '9880949136', '1234', 3, 'ACTIVE', '2026-02-13 11:19:06'),
(3, 'superadmin', 'superadmin@gmail.com', '6364354908', '1234', 1, 'ACTIVE', '2026-02-13 11:19:06'),
(4, 'Vinayaka S H', 'admin@gmail.com', '9731877491', '1234', 2, 'ACTIVE', '2026-02-13 11:21:35'),
(5, 'Admin', 'admin1@gmail.com', '9731877491', '123', 2, 'ACTIVE', '2026-02-13 12:21:56'),
(6, 'vinayaka', 'vinu@gmail.com', '6602336021', 'vinu', 3, 'ACTIVE', '2026-02-13 16:21:59'),
(7, 'Kavya S', 'kavya@gmail.com', '6364354908', '1234', 4, 'ACTIVE', '2026-02-14 17:24:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessment_results`
--
ALTER TABLE `assessment_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_id` (`assessment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `communications`
--
ALTER TABLE `communications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `course_master`
--
ALTER TABLE `course_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_name` (`course_name`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `role_master`
--
ALTER TABLE `role_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `skills_master`
--
ALTER TABLE `skills_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `skill_name` (`skill_name`);

--
-- Indexes for table `state_master`
--
ALTER TABLE `state_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `state_name` (`state_name`);

--
-- Indexes for table `student_batches`
--
ALTER TABLE `student_batches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_batch` (`student_id`,`batch_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_results`
--
ALTER TABLE `assessment_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `communications`
--
ALTER TABLE `communications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_master`
--
ALTER TABLE `course_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_master`
--
ALTER TABLE `role_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `skills_master`
--
ALTER TABLE `skills_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `state_master`
--
ALTER TABLE `state_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `student_batches`
--
ALTER TABLE `student_batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_results`
--
ALTER TABLE `assessment_results`
  ADD CONSTRAINT `assessment_results_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`),
  ADD CONSTRAINT `assessment_results_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course_master` (`id`),
  ADD CONSTRAINT `batches_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `communications`
--
ALTER TABLE `communications`
  ADD CONSTRAINT `communications_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `job_applications_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`);

--
-- Constraints for table `student_batches`
--
ALTER TABLE `student_batches`
  ADD CONSTRAINT `student_batches_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `student_batches_ibfk_2` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

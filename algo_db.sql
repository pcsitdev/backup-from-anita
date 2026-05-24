-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 05:36 PM
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
-- Database: `algo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `algovisuals_table`
--

CREATE TABLE `algovisuals_table` (
  `id` varchar(40) NOT NULL,
  `subtopic_id` varchar(40) DEFAULT NULL,
  `code_text` longtext NOT NULL,
  `code_steps` longtext NOT NULL,
  `input_array` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments_table`
--

CREATE TABLE `comments_table` (
  `id` varchar(40) NOT NULL,
  `username` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` date DEFAULT NULL,
  `topic_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `problem_description`
--

CREATE TABLE `problem_description` (
  `id` varchar(40) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `problem_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `problem_table`
--

CREATE TABLE `problem_table` (
  `id` varchar(40) NOT NULL,
  `name` varchar(200) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `difficulty` varchar(10) NOT NULL DEFAULT 'Easy',
  `video_link` varchar(1000) DEFAULT NULL,
  `author_id` varchar(40) NOT NULL,
  `hints` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hints`)),
  `set_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `problem_visuals`
--

CREATE TABLE `problem_visuals` (
  `id` varchar(40) NOT NULL,
  `problem_id` varchar(40) NOT NULL,
  `code_text` varchar(500) NOT NULL,
  `code_steps` longtext NOT NULL,
  `input_array` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `set_table`
--

CREATE TABLE `set_table` (
  `id` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subtopic_table`
--

CREATE TABLE `subtopic_table` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) NOT NULL DEFAULT 'Easy',
  `external_video` varchar(1000) DEFAULT NULL,
  `tutorial_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topics_table`
--

CREATE TABLE `topics_table` (
  `id` varchar(40) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `subtopic_tableId` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutorials_table`
--

CREATE TABLE `tutorials_table` (
  `id` varchar(40) NOT NULL,
  `title` varchar(255) NOT NULL,
  `authorId` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'algorithm'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `id` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user',
  `dateJoined` datetime NOT NULL DEFAULT '2026-03-22 05:25:50'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`id`, `username`, `password`, `email`, `role`, `dateJoined`) VALUES
('dc5aa034-b606-47a9-8d61-1a8d52bee4fb', 'sayan', '$2b$10$loVyO92ybnbyPtIzKnG7pu4g5QUOUa58EXYouWpEKBbb0DTDt0KIa', 'sybisuas115@gmail.com', 'user', '2026-03-28 18:53:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_problem`
--

CREATE TABLE `user_problem` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `problem_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`problem_ids`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `algovisuals_table`
--
ALTER TABLE `algovisuals_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `algovisuals_table_subtopic_id_subtopic_table_id_fk` (`subtopic_id`);

--
-- Indexes for table `comments_table`
--
ALTER TABLE `comments_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_table_topic_id_topics_table_id_fk` (`topic_id`);

--
-- Indexes for table `problem_description`
--
ALTER TABLE `problem_description`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `problem_description_problem_id_unique` (`problem_id`);

--
-- Indexes for table `problem_table`
--
ALTER TABLE `problem_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problem_table_set_id_fkey` (`set_id`),
  ADD KEY `problem_table_author_id_users_table_id_fk` (`author_id`);

--
-- Indexes for table `problem_visuals`
--
ALTER TABLE `problem_visuals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `problem_visuals_problem_id_unique` (`problem_id`);

--
-- Indexes for table `set_table`
--
ALTER TABLE `set_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set_table_author_id_users_table_id_fk` (`author_id`);

--
-- Indexes for table `subtopic_table`
--
ALTER TABLE `subtopic_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subtopic_table_tutorial_id_idx` (`tutorial_id`);

--
-- Indexes for table `topics_table`
--
ALTER TABLE `topics_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `topics_table_subtopic_tableId_key` (`subtopic_tableId`),
  ADD KEY `subtopic_tableId_topics_table_id_fk` (`subtopic_tableId`);

--
-- Indexes for table `tutorials_table`
--
ALTER TABLE `tutorials_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tutorials_table_authorId_users_table_id_fk` (`authorId`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_table_email_unique` (`email`);

--
-- Indexes for table `user_problem`
--
ALTER TABLE `user_problem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_problem_user_id_unique` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `algovisuals_table`
--
ALTER TABLE `algovisuals_table`
  ADD CONSTRAINT `algovisuals_table_subtopic_id_subtopic_table_id_fk` FOREIGN KEY (`subtopic_id`) REFERENCES `subtopic_table` (`id`);

--
-- Constraints for table `comments_table`
--
ALTER TABLE `comments_table`
  ADD CONSTRAINT `comments_table_topic_id_topics_table_id_fk` FOREIGN KEY (`topic_id`) REFERENCES `topics_table` (`id`);

--
-- Constraints for table `problem_description`
--
ALTER TABLE `problem_description`
  ADD CONSTRAINT `problem_description_problem_id_problem_table_id_fk` FOREIGN KEY (`problem_id`) REFERENCES `problem_table` (`id`);

--
-- Constraints for table `problem_table`
--
ALTER TABLE `problem_table`
  ADD CONSTRAINT `problem_table_author_id_users_table_id_fk` FOREIGN KEY (`author_id`) REFERENCES `users_table` (`id`),
  ADD CONSTRAINT `problem_table_set_id_fkey` FOREIGN KEY (`set_id`) REFERENCES `set_table` (`id`);

--
-- Constraints for table `problem_visuals`
--
ALTER TABLE `problem_visuals`
  ADD CONSTRAINT `problem_visuals_problem_id_problem_table_id_fk` FOREIGN KEY (`problem_id`) REFERENCES `problem_table` (`id`);

--
-- Constraints for table `set_table`
--
ALTER TABLE `set_table`
  ADD CONSTRAINT `set_table_author_id_users_table_id_fk` FOREIGN KEY (`author_id`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `subtopic_table`
--
ALTER TABLE `subtopic_table`
  ADD CONSTRAINT `subtopic_table_tutorial_id_fkey` FOREIGN KEY (`tutorial_id`) REFERENCES `tutorials_table` (`id`);

--
-- Constraints for table `topics_table`
--
ALTER TABLE `topics_table`
  ADD CONSTRAINT `subtopic_tableId_topics_table_id_fk` FOREIGN KEY (`subtopic_tableId`) REFERENCES `subtopic_table` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tutorials_table`
--
ALTER TABLE `tutorials_table`
  ADD CONSTRAINT `tutorials_table_authorId_users_table_id_fk` FOREIGN KEY (`authorId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `user_problem`
--
ALTER TABLE `user_problem`
  ADD CONSTRAINT `user_problem_user_id_users_table_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

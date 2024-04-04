-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2024 at 01:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `election_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `candidate_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `mobile_no` int(10) NOT NULL,
  `IsActive` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`candidate_id`, `name`, `Gender`, `DOB`, `mobile_no`, `IsActive`) VALUES
(1, 'chavda vasudevbhai', 'Male', '1989-02-12', 1234567890, 1),
(2, 'chavda vasanben', 'Female', '1988-03-24', 1234567890, 1);

-- --------------------------------------------------------

--
-- Table structure for table `create_election`
--

CREATE TABLE `create_election` (
  `election_id` int(10) NOT NULL,
  `election_party_id` int(10) NOT NULL,
  `datetime` datetime NOT NULL,
  `IsAtive` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `create_election`
--

INSERT INTO `create_election` (`election_id`, `election_party_id`, `datetime`, `IsAtive`) VALUES
(1, 1, '2024-03-24 00:00:00', 1),
(2, 2, '2024-03-24 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `election_party`
--

CREATE TABLE `election_party` (
  `election_Party_id` int(10) NOT NULL,
  `Party_Name` varchar(50) NOT NULL,
  `candidate_id` int(10) NOT NULL,
  `IsActive` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `election_party`
--

INSERT INTO `election_party` (`election_Party_id`, `Party_Name`, `candidate_id`, `IsActive`) VALUES
(1, 'BJP', 1, 1),
(2, 'Congres', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Mobile_No` int(10) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Name`, `UserName`, `Password`, `Mobile_No`, `IsActive`) VALUES
(1, 'kishan chavda', 'chavda', '12345', 2147483647, 1),
(2, 'milesh', 'mchavda', '1234', 1234567890, 1),
(3, 'UserName', 'UserName', '1234567890', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `votting`
--

CREATE TABLE `votting` (
  `id` int(10) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `party_name` varchar(20) NOT NULL,
  `IsActive` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votting`
--

INSERT INTO `votting` (`id`, `voter_id`, `party_name`, `IsActive`) VALUES
(1, 12345678, 'BJP', 1),
(2, 123, 'Congres', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`candidate_id`);

--
-- Indexes for table `create_election`
--
ALTER TABLE `create_election`
  ADD PRIMARY KEY (`election_id`);

--
-- Indexes for table `election_party`
--
ALTER TABLE `election_party`
  ADD PRIMARY KEY (`election_Party_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votting`
--
ALTER TABLE `votting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `candidate_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `create_election`
--
ALTER TABLE `create_election`
  MODIFY `election_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `election_party`
--
ALTER TABLE `election_party`
  MODIFY `election_Party_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `votting`
--
ALTER TABLE `votting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `election_party`
--
ALTER TABLE `election_party`
  ADD CONSTRAINT `election_party_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

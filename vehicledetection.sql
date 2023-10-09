-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2023 at 04:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicledetection`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `user_id` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NationalID` varchar(14) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `PlateNumber` varchar(10) NOT NULL,
  `HashedPassword` varchar(255) NOT NULL,
  `ProfilePicture` varchar(255) DEFAULT NULL,
  `Violation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`user_id`, `Email`, `NationalID`, `UserName`, `Password`, `PlateNumber`, `HashedPassword`, `ProfilePicture`, `Violation`) VALUES
(21, 'sm2422000@gmail.com', '30002242401929', 'salma', '123456789', 'اوج٧٨٢٣', '$2y$10$Y7jr9bb/mRhWRzA5OrtDyOa5/Q/FtPEOvvmaZhsgJ691TGt.iSucS', 'uploads/64ab66478f1143.52002726.jpeg', 'NO Violationexceed speed'),
(11, 'rawanehab124@gmail.com', '30201202106838', 'RowanEhab', '30107102100429', 'دل٤٦٢٥', '$2y$10$TtX3oEat7vlD22OTgTFZiepouagUBFwN6haJo4l5hhI3qYApXUNbq', 'uploads/64948b5b212a29.42436764.jpeg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `governmentdata`
--

CREATE TABLE `governmentdata` (
  `nationalID` varchar(20) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `platenumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `governmentdata`
--

INSERT INTO `governmentdata` (`nationalID`, `color`, `platenumber`) VALUES
('30002242401929', 'Red', 'اوج٧٨٢٣'),
('30201202106838', 'white', 'دل٤٦٢٥'),
('98765432176543', 'brown', 'دع١٢٦٨');

-- --------------------------------------------------------

--
-- Table structure for table `modelsdata`
--

CREATE TABLE `modelsdata` (
  `damagestatus` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `platenumber` varchar(50) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modelsdata`
--

INSERT INTO `modelsdata` (`damagestatus`, `color`, `type`, `platenumber`, `speed`) VALUES
('no damage', 'brown', 'car', 'دع١٢٦٨', 47),
('no damage', 'white', 'car', 'دل٤٦٢٥', 19),
('no damage', 'grey', 'car', 'رن٦٢١٣', 12),
('no damage', 'white', 'car', 'طي٤٥٣١', 9),
('smash', 'white', 'car', 'اوج٧٨٢٣', 8);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `counter` int(11) NOT NULL,
  `vehicletype` varchar(40) NOT NULL,
  `location` varchar(50) NOT NULL,
  `video` longblob NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `speed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`counter`, `vehicletype`, `location`, `video`, `date`, `time`, `speed`) VALUES
(12, 'car', 'elharam', 0x20, '0000-00-00', '00:00:00', 60),
(33, 'car', 'elmohandsen', 0x433a5c78616d70705c6874646f63735c4772616450726f6a6563745c4d6f64656c735c75706c6f616465645f766964656f2e6d7034, '2023-07-13', '17:17:00', 50),
(36, 'car', 'elzmalek', 0x433a5c78616d70705c6874646f63735c4772616450726f6a6563745c4d6f64656c735c75706c6f616465645f766964656f2e6d7034, '2023-07-04', '17:48:00', 33),
(45, 'truck', 'dokki', 0x433a5c78616d70705c6874646f63735c4772616450726f6a6563745c4d6f64656c735c75706c6f616465645f766964656f2e6d7034, '2023-07-29', '21:26:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `violation`
--

CREATE TABLE `violation` (
  `PlatNumber` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ViolationID` int(11) NOT NULL,
  `Violation` varchar(50) DEFAULT NULL,
  `nationalID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violation`
--

INSERT INTO `violation` (`PlatNumber`, `Price`, `ViolationID`, `Violation`, `nationalID`) VALUES
('دع١٢٦٨', 500.00, 33, 'wrong Type', '98765432176543'),
('دل٤٦٢٥', 500.00, 34, 'wrong Type', '30201202106838'),
('اوج٧٨٢٣', 6000.00, 46, 'exceed speed', '30002242401929');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`NationalID`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `PlateNumber` (`PlateNumber`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`counter`);

--
-- Indexes for table `violation`
--
ALTER TABLE `violation`
  ADD PRIMARY KEY (`ViolationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `counter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `violation`
--
ALTER TABLE `violation`
  MODIFY `ViolationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

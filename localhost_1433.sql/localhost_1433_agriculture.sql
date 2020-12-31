-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:1433
-- Generation Time: Dec 31, 2020 at 07:26 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agriculture`
--
CREATE DATABASE IF NOT EXISTS `agriculture` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `agriculture`;

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `fid` varchar(10) NOT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `faddress` varchar(50) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`fid`, `fname`, `faddress`, `phone`, `location`) VALUES
('f1', 'jone', 'jaffna', '071123467', NULL),
('f2', 'kal', 'monaragala', '0111234567', NULL),
('f3', 'rik', 'colombo', '1561561', NULL),
('f4', 'jane', 'kilinochchi', '20258896', NULL),
('f5', 'ganidu', 'mathara', '58461456', NULL),
('f6', 'kalana', 'galle', '4561564', NULL),
('f7', 'sid', 'ampara', '84865465', NULL),
('f8', 'mac', 'badulla', '45615', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `harvest`
--

CREATE TABLE `harvest` (
  `fid` varchar(10) NOT NULL,
  `htype` varchar(20) NOT NULL,
  `hname` varchar(25) NOT NULL,
  `weight` int(5) NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `flag` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `harvest`
--

INSERT INTO `harvest` (`fid`, `htype`, `hname`, `weight`, `photo`, `flag`, `status`, `id`) VALUES
('f1', 'vegetable', 'pumpkin', 70, NULL, NULL, 'success', 1),
('f1', 'fruit', 'mango', 100, NULL, NULL, 'success', 2),
('f2', 'animal foods', 'chiken', 200, NULL, NULL, 'success', 3),
('f3', 'vegetable', 'brinjole', 55, NULL, NULL, 'waste', 4),
('f4', 'vegetable', 'carrot', 70, NULL, NULL, 'waste', 5),
('f5', 'fruit', 'banana', 100, NULL, NULL, 'waste', 6),
('f8', 'animal foods', 'beef', 200, NULL, NULL, 'success', 7),
('f8', 'see food', 'proun', 55, NULL, NULL, 'success', 8);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `eid` varchar(10) NOT NULL,
  `ename` varchar(40) NOT NULL,
  `eaddress` varchar(50) NOT NULL,
  `pnum` varchar(14) NOT NULL,
  `position` varchar(20) NOT NULL,
  `branch` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `harvest`
--
ALTER TABLE `harvest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`eid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `harvest`
--
ALTER TABLE `harvest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `harvest`
--
ALTER TABLE `harvest`
  ADD CONSTRAINT `harvest_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `farmer` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE;

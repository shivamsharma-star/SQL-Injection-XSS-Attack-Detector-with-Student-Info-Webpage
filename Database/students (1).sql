-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 12:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `students`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` int(11) NOT NULL,
  `enrollment_no` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `section` varchar(5) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`id`, `enrollment_no`, `name`, `class`, `section`, `email`) VALUES
(1, 'ENR001', 'Aarav Sharma', '10', 'A', 'aarav@example.com'),
(2, 'ENR002', 'Vivaan Gupta', '9', 'B', 'vivaan@example.com'),
(3, 'ENR003', 'Aditya Verma', '8', 'A', 'aditya@example.com'),
(4, 'ENR004', 'Ishaan Singh', '7', 'C', 'ishaan@example.com'),
(5, 'ENR005', 'Vihaan Kumar', '6', 'B', 'vihaan@example.com'),
(6, 'ENR006', 'Arjun Yadav', '5', 'A', 'arjun@example.com'),
(7, 'ENR007', 'Rudra Mehta', '12', 'B', 'rudra@example.com'),
(8, 'ENR008', 'Reyansh Jain', '11', 'C', 'reyansh@example.com'),
(9, 'ENR009', 'Sai Patel', '10', 'A', 'sai@example.com'),
(10, 'ENR010', 'Krishna Rao', '9', 'B', 'krishna@example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

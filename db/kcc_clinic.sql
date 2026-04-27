-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2026 at 05:29 PM
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
-- Database: `kcc_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `user_id`, `appointment_date`, `status`, `notes`, `created_at`) VALUES
(2, 5, 17, '2026-04-27 23:24:00', 'pending', 'Sakit akong Hart', '2026-04-27 23:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `equipment_id` int(11) NOT NULL,
  `equipment_name` varchar(100) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `item_status` varchar(100) DEFAULT NULL,
  `date_acquired` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`equipment_id`, `equipment_name`, `quantity`, `item_status`, `date_acquired`) VALUES
(5, 'Folding Bed', 2, 'Good', '2026-04-27');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempt_time` datetime NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `email`, `ip_address`, `attempt_time`, `user_agent`, `user_id`) VALUES
(36, 'glennazuelo1@gmail.com', '::142432432', '2025-04-15 13:15:00', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `record_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chief_complaint` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date_consulted` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(100) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `date_received` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`medicine_id`, `medicine_name`, `quantity`, `expiry_date`, `date_received`) VALUES
(3, 'biogesic', 25, '2027-07-17', '2026-04-17'),
(4, 'Maalox', 5, '0001-04-20', '2026-04-16'),
(5, 'Bioflu', 6, '2026-04-27', '2026-04-27');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `parent_id` int(11) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parent_id`, `last_name`, `name`, `middle_name`, `contact`, `address`) VALUES
(2, 'Villahermosa', 'Maylene', 'Garcia', '09303522792', 'Coloso Street');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `sex` varchar(14) DEFAULT 'male',
  `age` int(120) NOT NULL,
  `birthdate` date NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `department` enum('Elementary','Highschool','Senior','College') DEFAULT 'Elementary'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `last_name`, `name`, `middle_name`, `sex`, `age`, `birthdate`, `contact`, `department`) VALUES
(3, 'Villahermosa', 'Kert', 'Garcia', 'Male', 21, '2004-08-14', '09303522792', 'College'),
(4, 'Vargas', 'Kaye Ranier', 'Salidio', 'Male', 20, '2005-07-25', '09630085626', 'College'),
(5, 'Anilao', 'John', 'Sabanal', 'Male', 25, '2026-04-27', '09707522792', 'College');

-- --------------------------------------------------------

--
-- Table structure for table `patient_parents`
--

CREATE TABLE `patient_parents` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `relationship` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `LOGID` int(11) NOT NULL,
  `USERID` int(11) DEFAULT NULL,
  `ACTION` text DEFAULT NULL,
  `DATELOG` varchar(30) DEFAULT NULL,
  `TIMELOG` varchar(30) DEFAULT NULL,
  `user_ip_address` text DEFAULT NULL,
  `device_used` text DEFAULT NULL,
  `USER_NAME` varchar(100) DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`LOGID`, `USERID`, `ACTION`, `DATELOG`, `TIMELOG`, `user_ip_address`, `device_used`, `USER_NAME`, `identifier`) VALUES
(101, 12, 'Logout', '2026-04-17', '02:59:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(102, 12, 'Login: Kert', '2026-04-17', '02:59:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(103, 12, 'New User has been added: Admin', '2026-04-17', '03:00:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(104, 12, 'Logout', '2026-04-17', '03:00:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(105, 13, 'Login: Admin', '2026-04-17', '03:00:56', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGIN'),
(106, 13, 'Logout', '2026-04-17', '03:32:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGOUT'),
(107, 12, 'Login: Kert', '2026-04-17', '03:32:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(108, 12, 'Logout', '2026-04-17', '03:38:09', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(109, 12, 'Login: Kert', '2026-04-17', '03:41:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(110, 12, 'Logout', '2026-04-17', '04:11:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(111, 12, 'Login: Kert', '2026-04-17', '04:12:04', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(112, 12, 'Logout', '2026-04-17', '04:12:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(113, 12, 'Login: Kert', '2026-04-17', '04:13:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(114, 12, 'Logout', '2026-04-17', '04:14:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(115, 12, 'Login: Kert', '2026-04-17', '04:14:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(116, 12, 'Logout', '2026-04-17', '04:15:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(117, 13, 'Login: Admin', '2026-04-17', '04:15:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGIN'),
(118, 13, 'Logout', '2026-04-17', '04:16:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGOUT'),
(119, 13, 'Login: Admin', '2026-04-17', '04:16:57', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGIN'),
(120, 13, 'Logout', '2026-04-17', '04:18:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGOUT'),
(121, 12, 'Login: Kert', '2026-04-17', '04:18:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(122, 12, 'Logout', '2026-04-17', '04:33:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(123, 12, 'Login: Kert', '2026-04-17', '07:46:09', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(124, 12, 'Logout', '2026-04-17', '07:50:31', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(125, 12, 'Login: Kert', '2026-04-17', '13:33:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(126, 12, 'Logout', '2026-04-17', '13:34:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(127, 12, 'Login: Kert', '2026-04-17', '13:42:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(128, 12, 'New Record has been added: Mark', '2026-04-17', '13:44:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(129, 12, 'New Medicine has been added: Biogesic', '2026-04-17', '13:45:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(130, NULL, 'Logout', '2026-04-17', '18:19:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', NULL, 'LOGOUT'),
(131, 12, 'Login: Kert', '2026-04-17', '18:20:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(132, 12, 'New Medicine has been added: Biogesic', '2026-04-17', '18:21:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(133, 12, 'New Equipment has been added: Folding Bed', '2026-04-17', '18:31:27', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(134, 12, 'Logout', '2026-04-17', '18:32:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(135, 12, 'Login: Kert', '2026-04-17', '18:32:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(136, 12, 'Logout', '2026-04-17', '18:39:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(137, 12, 'Login: Kert', '2026-04-17', '18:42:02', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(138, 12, 'Logout', '2026-04-17', '18:43:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(139, 12, 'Login: Kert', '2026-04-18', '21:41:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(140, 12, 'Login: Kert', '2026-04-19', '12:24:04', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(141, 12, 'Logout', '2026-04-19', '12:24:54', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(142, 12, 'Login: Kert', '2026-04-19', '21:39:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(143, 12, 'Login: Kert', '2026-04-19', '23:10:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(144, 12, 'Logout', '2026-04-19', '23:13:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(145, 12, 'Login: Kert', '2026-04-19', '23:14:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(146, 12, 'Logout', '2026-04-19', '23:14:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(147, 12, 'Login: Kert', '2026-04-19', '23:14:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(148, 12, 'Logout', '2026-04-19', '23:15:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(149, 12, 'Login: Kert', '2026-04-19', '23:16:10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(150, 12, 'Logout', '2026-04-19', '23:22:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(151, 12, 'Login: Kert', '2026-04-19', '23:28:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(152, 12, 'Logout', '2026-04-19', '23:29:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(153, 12, 'Login: Kert', '2026-04-20', '23:54:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(154, 12, 'New Record has been added: Mark Owen', '2026-04-20', '23:54:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(155, 12, 'Delete Record', '2026-04-20', '23:54:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'DELETED'),
(156, 12, 'New Record has been added: Kert', '2026-04-21', '00:29:18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(157, 12, 'Logout', '2026-04-21', '00:31:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(158, 12, 'Login: Kert', '2026-04-21', '02:28:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(159, 12, 'Logout', '2026-04-21', '02:45:56', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(160, 12, 'Login: Kert', '2026-04-21', '02:56:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(161, 12, 'Logout', '2026-04-21', '02:56:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(162, 12, 'Login: Kert', '2026-04-21', '03:02:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(163, 13, 'Login: Admin', '2026-04-21', '03:03:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGIN'),
(164, 13, 'Logout', '2026-04-21', '03:03:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGOUT'),
(165, 13, 'Login: Admin', '2026-04-21', '03:04:57', '::1', 'Mozilla/5.0 (Linux; Android 9; ASUS_I001DA Build/PKQ1.190414.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/131.0.6778.260 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Admin', 'LOGIN'),
(166, 13, 'Logout', '2026-04-21', '03:05:05', '::1', 'Mozilla/5.0 (Linux; Android 9; ASUS_I001DA Build/PKQ1.190414.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/131.0.6778.260 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Admin', 'LOGOUT'),
(167, 13, 'Login: Admin', '2026-04-21', '03:05:14', '::1', 'Mozilla/5.0 (Linux; Android 9; ASUS_I001DA Build/PKQ1.190414.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/131.0.6778.260 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Admin', 'LOGIN'),
(168, 13, 'Login: Admin', '2026-04-21', '03:05:49', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Admin', 'LOGIN'),
(169, 13, 'New Equipment has been added: Thermometer ', '2026-04-21', '03:06:23', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Admin', 'ADD'),
(170, 13, 'Logout', '2026-04-21', '03:06:41', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Admin', 'LOGOUT'),
(171, 12, 'Logout', '2026-04-21', '03:06:51', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(172, 12, 'Login: Kert', '2026-04-21', '03:23:18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(173, 12, 'New User has been added: Divino', '2026-04-21', '03:24:05', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(174, NULL, 'Login: Divino', '2026-04-21', '03:25:36', '::1', 'Mozilla/5.0 (Linux; Android 14; 2310FPCA4G Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/147.0.7727.55 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Divino', 'LOGIN'),
(175, 12, 'Login: Kert', '2026-04-21', '03:25:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(176, 12, 'Logout', '2026-04-21', '03:25:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(177, 13, 'Logout', '2026-04-21', '03:26:13', '::1', 'Mozilla/5.0 (Linux; Android 9; ASUS_I001DA Build/PKQ1.190414.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/131.0.6778.260 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Admin', 'LOGOUT'),
(178, 12, 'Logout', '2026-04-21', '03:28:31', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(179, 12, 'Login: Kert', '2026-04-21', '06:04:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(180, 12, 'New User has been added: Jorem Tabungcay', '2026-04-21', '06:05:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(181, NULL, 'Login: Jorem Tabungcay', '2026-04-21', '06:09:33', '::1', 'Mozilla/5.0 (Linux; Android 14; Infinix X6882 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/146.0.7680.177 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Jorem Tabungcay', 'LOGIN'),
(182, 12, 'Login: Kert', '2026-04-21', '10:33:03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(183, 12, 'New User has been added: Kaye', '2026-04-21', '10:33:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(184, 12, 'Logout', '2026-04-21', '10:34:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(185, NULL, 'Login: Kaye', '2026-04-21', '10:34:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kaye', 'LOGIN'),
(186, NULL, 'Logout', '2026-04-21', '10:34:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kaye', 'LOGOUT'),
(187, NULL, 'Login: Kaye', '2026-04-21', '10:44:40', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36', 'Kaye', 'LOGIN'),
(188, NULL, 'Login: Kaye', '2026-04-21', '23:55:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'Kaye', 'LOGIN'),
(189, NULL, 'New Record has been added: Kaye Ranier', '2026-04-21', '23:57:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'Kaye', 'ADD'),
(190, 12, 'Login: Kert', '2026-04-22', '13:41:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(191, 12, 'Logout', '2026-04-22', '13:43:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(192, 12, 'Login: Kert', '2026-04-22', '14:23:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(193, 12, 'Logout', '2026-04-22', '14:55:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(194, 13, 'Login: Admin', '2026-04-22', '14:56:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGIN'),
(195, 13, 'Login: Admin', '2026-04-22', '14:56:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGIN'),
(196, 13, 'Logout', '2026-04-22', '15:00:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Admin', 'LOGOUT'),
(197, 13, 'Login: Admin', '2026-04-22', '15:01:27', '::1', 'Mozilla/5.0 (Linux; Android 15; Infinix X6852 Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/147.0.7727.55 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Admin', 'LOGIN'),
(198, 12, 'Login: Kert', '2026-04-22', '15:02:18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(199, 13, 'New Medicine has been added: Adrian', '2026-04-22', '15:03:06', '::1', 'Mozilla/5.0 (Linux; Android 15; Infinix X6852 Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/147.0.7727.55 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/557.0.0.53.76;]', 'Admin', 'ADD'),
(200, 12, 'Logout', '2026-04-22', '15:03:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(201, 12, 'Login: Kert', '2026-04-26', '23:09:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(202, 12, 'Delete user', '2026-04-26', '23:29:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'DELETED'),
(203, 12, 'Delete user', '2026-04-26', '23:32:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'DELETED'),
(204, 12, 'Delete user', '2026-04-26', '23:32:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'DELETED'),
(205, 12, 'Logout', '2026-04-26', '23:49:02', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(206, 12, 'Login: Kert', '2026-04-26', '23:49:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(207, 12, 'Logout', '2026-04-26', '23:56:57', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(208, 12, 'Login: Kert', '2026-04-26', '23:57:00', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(209, 12, 'New User has been added: Mark Owen', '2026-04-27', '00:07:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(210, 12, 'Logout', '2026-04-27', '00:07:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(211, 17, 'Login: Mark Owen', '2026-04-27', '00:07:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(212, 17, 'Logout', '2026-04-27', '00:09:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(213, 12, 'Login: Kert', '2026-04-27', '00:09:51', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(214, 12, 'Logout', '2026-04-27', '00:10:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(215, 17, 'Login: Mark Owen', '2026-04-27', '00:10:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(216, 17, 'Logout', '2026-04-27', '00:11:43', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(217, 17, 'Login: Mark Owen', '2026-04-27', '00:11:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(218, 17, 'Logout', '2026-04-27', '00:14:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(219, 12, 'Login: Kert', '2026-04-27', '00:15:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(220, 12, 'Logout', '2026-04-27', '00:15:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(221, 17, 'Login: Mark Owen', '2026-04-27', '00:15:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(222, 17, 'Logout', '2026-04-27', '00:22:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(223, 17, 'Login: Mark Owen', '2026-04-27', '00:22:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(224, 17, 'Login: Mark Owen', '2026-04-27', '00:24:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(225, 17, 'Logout', '2026-04-27', '00:26:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(226, 17, 'Login: Mark Owen', '2026-04-27', '00:26:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(227, 17, 'Logout', '2026-04-27', '00:27:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(228, 12, 'Login: Kert', '2026-04-27', '00:28:31', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(229, 12, 'Logout', '2026-04-27', '00:28:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(230, 17, 'Login: Mark Owen', '2026-04-27', '00:28:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(231, 17, 'Logout', '2026-04-27', '00:29:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(232, 17, 'Login: Mark Owen', '2026-04-27', '00:29:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(233, 17, 'Logout', '2026-04-27', '00:37:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(234, 12, 'Login: Kert', '2026-04-27', '00:37:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(235, 12, 'New User has been apdated: Kert', '2026-04-27', '00:37:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(236, 12, 'New User has been added: Divino', '2026-04-27', '00:38:31', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(237, 12, 'Logout', '2026-04-27', '00:38:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(238, 18, 'Login: Divino', '2026-04-27', '00:38:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGIN'),
(239, 18, 'Logout', '2026-04-27', '00:39:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGOUT'),
(240, 17, 'Login: Mark Owen', '2026-04-27', '00:39:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(241, 17, 'Logout', '2026-04-27', '00:40:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(242, 12, 'Login: Kert', '2026-04-27', '00:40:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(243, 12, 'Logout', '2026-04-27', '00:41:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(244, 17, 'Login: Mark Owen', '2026-04-27', '00:41:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(245, 17, 'Logout', '2026-04-27', '00:41:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(246, 12, 'Login: Kert', '2026-04-27', '00:41:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(247, 12, 'New User has been added: Kert', '2026-04-27', '00:42:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(248, 12, 'Logout', '2026-04-27', '00:42:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(249, NULL, 'Login: Kert', '2026-04-27', '00:42:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(250, NULL, 'Logout', '2026-04-27', '00:43:16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(251, 12, 'Login: Kert', '2026-04-27', '00:43:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(252, 12, 'Delete user', '2026-04-27', '00:43:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'DELETED'),
(253, 12, 'Logout', '2026-04-27', '00:44:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(254, 17, 'Login: Mark Owen', '2026-04-27', '00:44:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(255, 17, 'Logout', '2026-04-27', '00:45:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(256, 12, 'Login: Kert', '2026-04-27', '00:45:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(257, 12, 'New User has been apdated: Mark Owen', '2026-04-27', '00:46:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(258, 12, 'New User has been apdated: Divino', '2026-04-27', '00:46:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(259, 12, 'Logout', '2026-04-27', '00:46:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(260, 17, 'Login: Mark Owen', '2026-04-27', '00:46:27', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(261, 17, 'Logout', '2026-04-27', '00:46:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(262, 18, 'Login: Divino', '2026-04-27', '00:46:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGIN'),
(263, 18, 'Logout', '2026-04-27', '00:46:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGOUT'),
(264, 12, 'Login: Kert', '2026-04-27', '00:46:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(265, 12, 'Logout', '2026-04-27', '00:48:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(266, 17, 'Login: Mark Owen', '2026-04-27', '00:48:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(267, 17, 'Logout', '2026-04-27', '00:48:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(268, 12, 'Login: Kert', '2026-04-27', '00:48:46', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(269, 12, 'Logout', '2026-04-27', '00:50:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(270, 17, 'Login: Mark Owen', '2026-04-27', '00:50:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(271, 17, 'Logout', '2026-04-27', '00:53:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(272, 12, 'Login: Kert', '2026-04-27', '00:53:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(273, 12, 'Logout', '2026-04-27', '00:53:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(274, 17, 'Login: Mark Owen', '2026-04-27', '00:53:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(275, 17, 'Logout', '2026-04-27', '00:58:18', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(276, 18, 'Login: Divino', '2026-04-27', '00:58:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGIN'),
(277, 18, 'Logout', '2026-04-27', '01:05:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGOUT'),
(278, 12, 'Login: Kert', '2026-04-27', '01:05:56', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(279, 12, 'Logout', '2026-04-27', '01:07:10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(280, 17, 'Login: Mark Owen', '2026-04-27', '01:07:16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(281, 17, 'Logout', '2026-04-27', '01:07:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(282, 18, 'Login: Divino', '2026-04-27', '01:07:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGIN'),
(283, 18, 'Logout', '2026-04-27', '01:10:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGOUT'),
(284, 17, 'Login: Mark Owen', '2026-04-27', '01:10:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(285, 17, 'Logout', '2026-04-27', '01:33:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(286, 12, 'Login: Kert', '2026-04-27', '01:33:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(287, 12, 'New Guardian has been added: Maylene', '2026-04-27', '02:31:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(288, 12, 'Logout', '2026-04-27', '02:55:00', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(289, 12, 'Login: Kert', '2026-04-27', '03:03:03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(290, 12, 'New Record has been added: John', '2026-04-27', '03:04:16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(291, 12, 'New Record has been apdated: Kert', '2026-04-27', '03:40:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(292, 12, 'New Record has been apdated: Kert', '2026-04-27', '03:40:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(293, 12, 'New Record has been apdated: Kert', '2026-04-27', '03:42:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(294, 12, 'New Record has been apdated: Kaye Ranier', '2026-04-27', '03:42:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(295, 12, 'New Record has been apdated: John', '2026-04-27', '03:42:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'UPDATED'),
(296, 12, 'Logout', '2026-04-27', '03:44:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(297, 17, 'Login: Mark Owen', '2026-04-27', '03:44:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(298, 17, 'New Medicine has been apdated: biogesic', '2026-04-27', '03:51:34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(299, 17, 'New Medicine has been apdated: biogesic', '2026-04-27', '03:53:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(300, 17, 'New Medicine has been apdated: Maalox', '2026-04-27', '03:53:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(301, 17, 'New Equipment has been added: Cup', '2026-04-27', '03:59:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'ADD'),
(302, 17, 'New Medicine has been added: Decogesic', '2026-04-27', '04:02:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'ADD'),
(303, 17, 'New Medicine has been apdated: Bioflu', '2026-04-27', '04:02:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(304, 17, 'Delete Equipment', '2026-04-27', '04:06:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'DELETED'),
(305, 17, 'Delete Equipment', '2026-04-27', '04:06:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'DELETED'),
(306, 17, 'Delete Equipment', '2026-04-27', '04:06:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'DELETED'),
(307, 17, 'New Equipment has been added: Folding Bed', '2026-04-27', '04:07:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'ADD'),
(308, 17, 'New Equipment has been apdated: Folding Bed', '2026-04-27', '04:13:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(309, 17, 'New Equipment has been apdated: Folding Bed', '2026-04-27', '04:13:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(310, 17, 'New Equipment has been apdated: Folding Bed', '2026-04-27', '04:13:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(311, 17, 'New Equipment has been apdated: Folding Bed', '2026-04-27', '04:13:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'UPDATED'),
(312, 17, 'Logout', '2026-04-27', '04:14:07', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(313, 18, 'Login: Divino', '2026-04-27', '04:14:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGIN'),
(314, 18, 'Logout', '2026-04-27', '04:14:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGOUT'),
(315, 18, 'Login: Divino', '2026-04-27', '13:04:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGIN'),
(316, 18, 'Logout', '2026-04-27', '13:04:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGOUT'),
(317, 12, 'Login: Kert', '2026-04-27', '14:35:51', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(318, 12, 'Logout', '2026-04-27', '14:37:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(319, 18, 'Login: Divino', '2026-04-27', '14:37:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGIN'),
(320, 18, 'Logout', '2026-04-27', '14:37:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Divino', 'LOGOUT'),
(321, 17, 'Login: Mark Owen', '2026-04-27', '14:37:41', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGIN'),
(322, 17, 'Logout', '2026-04-27', '14:43:09', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Mark Owen', 'LOGOUT'),
(323, 12, 'Login: Kert', '2026-04-27', '14:43:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(324, 12, 'Logout', '2026-04-27', '14:43:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(325, 12, 'Login: Kert', '2026-04-27', '22:28:56', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(326, 12, 'Logout', '2026-04-27', '22:33:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGOUT'),
(327, 12, 'Login: Kert', '2026-04-27', '22:33:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'LOGIN'),
(328, 12, 'Added appointment for patient ID: 3', '2026-04-27', '23:21:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD'),
(329, 12, 'Deleted appointment ID: 1', '2026-04-27', '23:22:54', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'DELETE'),
(330, 12, 'Added appointment for patient ID: 5', '2026-04-27', '23:24:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Kert', 'ADD');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `transaction_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(100) DEFAULT 'user',
  `status` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `email`, `password`, `role`, `status`, `name`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, NULL, 'Kert@gmail.com', '$2y$10$4I7egAI7ruh8OaWj.gFpzOB4XQeYdQg/hoMr1eQgQrKZgpoLstOgq', 'Admin', 'Active', 'Kert', '09636083085', '2026-04-15 11:57:18', '2026-04-26 16:37:36', '2026-04-26 16:37:36'),
(13, NULL, 'admin@gmail.com', '$2y$10$p2BxNnkDCa6FijQWzSpPE.lZl0E8T9Nuv7AQTPkAEWtWWKGohnPjK', 'Admin', 'Active', 'Admin', '09636083085', '2026-04-16 19:00:44', '2026-04-16 11:00:44', '2026-04-16 11:00:44'),
(17, NULL, 'owen@gmail.com', '$2y$10$H3xIT3aSaS6WeD0nkWhY1OMlY1hBEw6E8LMZxJJ/Eh7vZmeuqvnYu', 'Doctor', 'Active', 'Mark Owen', '09262682108210', '2026-04-26 16:07:40', '2026-04-26 16:46:13', '2026-04-26 16:46:13'),
(18, NULL, 'Divino@gmail.com', '$2y$10$zTJkD6lRIEI3Kt/uNgTk9uJS5QsUKQ.aWd.E5tapZnKRAY2Iy1rQO', 'Nurse', 'Active', 'Divino', '09636083085', '2026-04-26 16:38:31', '2026-04-26 16:46:19', '2026-04-26 16:46:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`equipment_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_login_user` (`user_id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_parents`
--
ALTER TABLE `patient_parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`patient_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`LOGID`),
  ADD KEY `USERID` (`USERID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient_parents`
--
ALTER TABLE `patient_parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `LOGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `fk_login_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `patient_parents`
--
ALTER TABLE `patient_parents`
  ADD CONSTRAINT `patient_parents_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_parents_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD CONSTRAINT `fk_logs_users` FOREIGN KEY (`USERID`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2022 at 04:45 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `module_assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `parent_id`, `title`, `is_active`, `created_at`, `link`) VALUES
(1, 0, 'product', 1, '2022-04-05 08:55:17', '#1'),
(2, 1, 'Product One', 0, '2022-04-05 08:55:17', '#2'),
(3, 1, 'Product Two', 0, '2022-04-05 08:56:18', '#3'),
(4, 0, 'customer', 0, '0000-00-00 00:00:00', '#4'),
(5, 4, 'Customer One', 0, '0000-00-00 00:00:00', '#5'),
(6, 4, 'Customer Two', 0, '0000-00-00 00:00:00', '#6'),
(7, 5, 'Cutomer One-one', 0, '0000-00-00 00:00:00', '#7'),
(8, 5, 'Customer One-two', 0, '0000-00-00 00:00:00', '#8'),
(9, 0, 'Inventory', 0, '0000-00-00 00:00:00', '#9'),
(10, 9, 'Inventory One', 0, '0000-00-00 00:00:00', '#10'),
(11, 0, 'Music', 0, '0000-00-00 00:00:00', '#11'),
(12, 0, 'Hr', 0, '0000-00-00 00:00:00', '#12'),
(13, 12, 'Hr One', 0, '0000-00-00 00:00:00', '#13'),
(14, 12, 'Hr Two', 0, '0000-00-00 00:00:00', '#14'),
(15, 14, 'Hr Two-one', 0, '0000-00-00 00:00:00', '#15'),
(16, 14, 'Hr Two-two', 0, '0000-00-00 00:00:00', '#16');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(20) NOT NULL,
  `name` text NOT NULL,
  `modules` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `modules`, `date`) VALUES
(1, 'basic', '[\"1\",\"4\"]', '2022-04-13 20:41:15.000000'),
(2, 'bronze', '[\"1\",\"4\",\"9\"]', '2022-04-13 20:41:26.000000'),
(3, 'gold', '[\"1\",\"4\",\"9\",\"11\",\"12\"]', '2022-04-13 20:45:32.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

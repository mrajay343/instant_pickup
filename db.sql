-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 12:57 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `segwitz`
--
CREATE DATABASE IF NOT EXISTS `segwitz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `segwitz`;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `username`, `amount`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ajay', 50, 1641551273, 1, '2022-01-07 10:46:48', '2022-01-07 10:46:48'),
(2, 'Ajay', 50, 1641551273, 1, '2022-01-07 10:53:19', '2022-01-07 10:53:19'),
(3, 'Ajay', 50, 1641529671, 1, '2022-01-07 10:53:38', '2022-01-07 10:53:38'),
(4, 'Ajay', 50, 1641533271, 1, '2022-01-07 10:53:51', '2022-01-07 10:53:51'),
(5, 'Ajay', 50, 1641014871, 1, '2022-01-07 10:54:05', '2022-01-07 10:54:05'),
(6, 'Ajay', 50, 1641101271, 1, '2022-01-07 10:54:16', '2022-01-07 10:54:16'),
(7, 'Ajay', 50, 1641187671, 1, '2022-01-07 10:54:31', '2022-01-07 10:54:31'),
(8, 'Ajay', 55, 1639546071, 1, '2022-01-07 11:36:17', '2022-01-07 11:36:17'),
(9, 'Ajay', 55, 1639546071, 1, '2022-01-07 11:48:01', '2022-01-07 11:48:01'),
(10, 'Ajay', 111, 1639546071, 1, '2022-01-07 11:48:10', '2022-01-07 11:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT '',
  `last_name` varchar(255) DEFAULT '',
  `phone` varchar(20) DEFAULT '',
  `email` varchar(200) DEFAULT '',
  `address` varchar(200) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `status` int(4) NOT NULL DEFAULT 1,
  `auth_key` varchar(200) DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `email`, `address`, `password`, `status`, `auth_key`, `created_at`, `updated_at`) VALUES
(1, 'Ajay', '', '+9999', 'mrajay343@gmail.com', '', '$2a$08$oNtczxyNwH.at0wcrhF5NOgfcuL671K9Byd1HZEdpwRyEyzsvxUza', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NDEyMTI2NjAsImV4cCI6MTY0MTI5OTA2MH0.OyS-22Grl5VmkLmQ-nTG1oUPYP43Lr68w4spe2ibfh8', '2022-01-03 12:24:22', '2022-01-03 12:24:22'),
(2, 'Ajay', '', '+999988888', 'msrajay343@gmail.com', '', '$2a$08$4G5ldEfjU6kAdAnWhq22M.03PMrreQGndBDzTpCaRBxtX7CBpb.Ju', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NDEyMTI4OTIsImV4cCI6MTY0MTI5OTI5Mn0.M1FgeL2b9qyIb3aBTLCfUp1zO0AWs3Z_Y6ZkdGElcT4', '2022-01-03 12:28:12', '2022-01-03 12:28:12'),
(3, 'Ajay', '', '+999988888s', 'msdrajay343@gmail.com', '', '$2a$08$ot0PfEJsp1CTuxUlEvb5tuOjUyvOvtK7mZI4QduXW801zsfIsrsHG', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NDEyMTI5NTMsImV4cCI6MTY0MTI5OTM1M30.Ts9G759IvS6mrsKGwLXOonACGp24d5hfO6rSSj6N7lk', '2022-01-03 12:29:13', '2022-01-03 12:29:13'),
(4, 'Ajay', '', '+9999888880', 'msdrajay343@gmail.coms0', '', '$2a$08$Q32wfuKR0w1lMbQNO06F2.NkfJtxNV2BwudvtJHqk7sWH7ONbIOKm', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NDEyMTMzMDIsImV4cCI6MTY0MTI5OTcwMn0.ODVdw3Ns6yS6BsVeMVLRgUj-6pPSY3sE4i0Vz3UoJHY', '2022-01-03 12:35:02', '2022-01-03 12:35:02'),
(5, 'Ajay', '', '+9999888880', 'mrajay343@gmail.com1', '', '$2a$08$X5s0y3S44dwwt7yDSMpNse5U2YU3WwHs6fV0ptiwQE/KdiAt3pdi2', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NDEyMTQwMjAsImV4cCI6MTY0MTMwMDQyMH0.1rn2nh1QC-_qqJ2nueYo3JahvSv1XBZLmEY38A74gn4', '2022-01-03 12:47:00', '2022-01-03 12:47:00'),
(6, 'Ajay', '', '+99998888800', 'mrajay343@gmail.com1', '', '$2a$08$XtmUyWPDXWATlOI3.OgHc.LMCEAO.Y37qVcZpxk7UQNHBCeW.DA7i', 1, '', '2022-01-03 13:04:48', '2022-01-03 13:04:48'),
(7, 'Ajay', '', '+99998888800', 'mrajay343@gmail.com1q', '', '$2a$08$jlPDqaQs2twdSSsDxuPUaO5ddAIWLLsAZpvF/VzbvbOz/rv3AFE7O', 1, '', '2022-01-03 13:05:55', '2022-01-03 13:05:55'),
(8, 'Ajay', '', '+999988888000', 'mrajay343@gmail.com1q', '', '$2a$08$XbCRZPSB1vL6GGRLIsmwJu/.g/OgsFqSu8YJkb.lWZzRqd1P9Q2ay', 1, '', '2022-01-03 13:06:37', '2022-01-03 13:06:37'),
(9, 'Ajay', '', '+44444444', 'ajay343@gmail.com', '', '$2a$08$qBfdjoui..ZWg2p6GT2WI.G4m1tu1Bf72gAFC9v.T0AOewBDeCEkK', 1, '', '2022-01-03 13:09:57', '2022-01-03 13:09:57'),
(10, 'Ajay', '', '+44444444', 'ajay343@gmail.com123', '', '$2a$08$Adw4lW5DEXkJaW9nIyp7LuTosEjKrWq0XPkj7.gTJJmHTEtpwc6Hi', 1, '', '2022-01-03 13:10:48', '2022-01-03 13:10:48'),
(11, 'Ajay', '', '+444444440', 'ajay343@gmail.com123', '', '$2a$08$SdLh9CU.b3xYLtOX5c39leFuJTADLr/1qRtZmyQf/LbJN4ADbIzJS', 1, '', '2022-01-03 13:11:41', '2022-01-03 13:11:41'),
(12, 'Ajay', '', '7777', 'ajay4444343@gmail.com', '', '$2a$08$q1oq91e7nidVNU.jvouexuBUIXU6GJnY4vtj12vI7pztHtZt9c7/q', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImlhdCI6MTY0MTIyNDU5NCwiZXhwIjoxNjQxMzEwOTk0fQ.pl0X1-FALA4o5x62nim5q35vS9CyYNVQz-mvw-vatjg', '2022-01-03 15:16:46', '2022-01-03 15:43:14'),
(13, 'Vijay', 'fff', '+9199969664910', 'comssddde@gmail.com', 'addressaddressaddressaddressaddress', '$2a$08$2K32ztfK8JWYgDGh.DOnLugd3gEXjqdD0iYSj.jgcEb.pToKyoUja', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImlhdCI6MTY0MTI4NjIzOSwiZXhwIjoxNjQxMzcyNjM5fQ.fr1WIW2ntruMKsY0_1ORIfWFbgtT40mzyBtrs1xnFVg', '2022-01-04 08:30:01', '2022-01-04 10:42:35'),
(14, 'Ajay', '', '777711', '4ajay4444343@gmail.com', '', '$2a$08$d8ibj0VcGIWO5xNizfTcqeF/XWHlambwtLfWHbNDKwegCBZCRNqfC', 1, '', '2022-01-04 09:44:27', '2022-01-04 09:44:27'),
(15, 'Ajay', 'Dhiman', '+917015755995', 'ad343@gmail.com', 'ddfdfdfdf', '$2a$08$BsJBMRPVlIz7k9XgMvYhGeJDA6DA7FTOmQy4Ak4QL8tIpocO5M5kG', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImlhdCI6MTY0MTI4OTY0MCwiZXhwIjoxNjQxMzc2MDQwfQ.nZVwH1XtNDDjsur83uwHPZAQtIsB_qU-ryunZmBE-tU', '2022-01-04 09:45:14', '2022-01-04 09:47:20'),
(16, 'Sahil Dhiman', 'Dhiman', '+9198969999', 'ad3ddd43@gmail.com', 'ddfdfdfdf', '$2a$08$gD4DF4nnAn5TpQOLqqi97els26NOJvaEswY1pcN0.8EnpD8CqGBrC', 1, '', '2022-01-04 11:56:32', '2022-01-04 11:56:32'),
(17, 'Sahil Dhiman', 'Dhiman', '+91989699992', '@ad3ddd43', 'ddfdfdfdf', '$2a$08$YTtx9vKIJjNu7Gf9YcqdMuWSGTFqXVCAYL/ESSp6p7jXgZv1LP.Di', 1, '', '2022-01-04 11:56:53', '2022-01-04 11:56:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

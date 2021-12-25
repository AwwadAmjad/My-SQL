-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2021 at 09:50 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mail_delivery_services`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(6) NOT NULL,
  `streetName` varchar(20) NOT NULL,
  `zipcode` int(6) NOT NULL,
  `city` varchar(10) NOT NULL,
  `country` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `streetName`, `zipcode`, `city`, `country`) VALUES
(1, 'Goldschlagstraße', 1140, 'wien', 'Österreich'),
(2, 'linzerstraße', 234, 'wien', 'Österreich'),
(3, 'pfferhofweg', 5482, 'Salzburg', 'Österreich'),
(4, 'pittermann', 8453, 'Graz', 'Österrich');

-- --------------------------------------------------------

--
-- Table structure for table `bigstorehouse`
--

CREATE TABLE `bigstorehouse` (
  `id` int(15) NOT NULL,
  `available` enum('Inland','Ausland') NOT NULL DEFAULT 'Inland',
  `fk_receiver_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bigstorehouse`
--

INSERT INTO `bigstorehouse` (`id`, `available`, `fk_receiver_id`) VALUES
(1, 'Ausland', 1),
(2, 'Inland', 2),
(3, 'Ausland', 3),
(4, 'Ausland', 4);

-- --------------------------------------------------------

--
-- Table structure for table `local_post`
--

CREATE TABLE `local_post` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `fk_receiver` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `local_post`
--

INSERT INTO `local_post` (`id`, `name`, `fk_receiver`) VALUES
(1, 'D_Post', 1),
(2, 'A_post', 2),
(3, 'I_Post', 3),
(4, 'N_Post', 4);

-- --------------------------------------------------------

--
-- Table structure for table `packet`
--

CREATE TABLE `packet` (
  `id` int(12) NOT NULL,
  `weightOfPacket` decimal(4,2) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `size` varchar(10) NOT NULL,
  `shipTo` varchar(25) NOT NULL,
  `fk_post_Id` int(11) DEFAULT NULL,
  `fk_sender_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packet`
--

INSERT INTO `packet` (`id`, `weightOfPacket`, `price`, `size`, `shipTo`, `fk_post_Id`, `fk_sender_Id`) VALUES
(1, '1.00', '18.80', 'S', 'Deutschland', 3, 1),
(2, '2.00', '4.00', 'M', 'Österrreich', 4, 2),
(3, '11.20', '19.85', 'XL', 'Italy', 7, 3),
(4, '1.40', '8.00', 'XS', 'Niederlande', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(20) NOT NULL,
  `CompanyOfship` varchar(15) NOT NULL,
  `dateOfship` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `PacketNummber` int(20) NOT NULL,
  `State` varchar(15) NOT NULL,
  `fk_bigStoreHouse` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `CompanyOfship`, `dateOfship`, `PacketNummber`, `State`, `fk_bigStoreHouse`) VALUES
(3, 'GLS', '2014-02-11 04:40:33', 508058054, 'Express', 1),
(4, 'DHL', '2019-07-22 05:08:50', 587450809, 'Normal', 2),
(7, 'DPD', '2018-09-20 09:06:43', 62511505, 'Document / Expr', 3),
(8, 'UPS ', '2019-12-12 10:06:43', 987545050, 'Normal ', 4);

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `id` int(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `S_addrese_id` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`id`, `firstName`, `lastName`, `email`, `S_addrese_id`, `phone`) VALUES
(1, 'Sabine', 'Hauser', 'saabine@gmail.com', 1, 68558510),
(2, 'christopher', 'Müllner', 'muellner50@gmail.at', 2, 2147483647),
(3, 'walid', 'khaliel', 'W_8558@yahoo.com', 3, 67687147),
(4, 'sara', 'metrovic', 'sara_20@gmx.com', 4, 660687450);

-- --------------------------------------------------------

--
-- Table structure for table `receiver_land`
--

CREATE TABLE `receiver_land` (
  `id` int(18) NOT NULL,
  `arrivd_packet` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `city` varchar(20) NOT NULL,
  `Zoll` enum('with','without') DEFAULT 'without',
  `fk_local_post` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiver_land`
--

INSERT INTO `receiver_land` (`id`, `arrivd_packet`, `city`, `Zoll`, `fk_local_post`) VALUES
(1, '2014-03-01 11:40:20', 'Dortmund', 'with', 1),
(2, '2019-08-12 10:02:10', 'Graz', 'without', 2),
(3, '2018-11-28 02:10:43', 'Roma', 'with', 3),
(4, '2020-01-10 01:11:10', 'Amsterdam', 'with', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `id` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `fk_adress_Id` int(11) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`id`, `firstName`, `lastName`, `fk_adress_Id`, `email`, `phone`) VALUES
(1, 'Amjad', 'Awwad', 1, 'awwd@yahoo.de', 681485852),
(2, 'samer', 'salama', 2, 'samer@gmail.com', 2147483647),
(3, 'alaa', 'Alzobani', 3, 'alaa@hotmail.com', 2147483647),
(4, 'akram', 'Ibrahim', 4, 'akram@gmx.de', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `s_addrese`
--

CREATE TABLE `s_addrese` (
  `id` int(6) NOT NULL,
  `R_streetName` varchar(20) NOT NULL,
  `R_zipcode` int(6) NOT NULL,
  `R_city` varchar(10) NOT NULL,
  `R_country` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s_addrese`
--

INSERT INTO `s_addrese` (`id`, `R_streetName`, `R_zipcode`, `R_city`, `R_country`) VALUES
(1, 'Deutscherstraße', 85400, 'Dortmund', 'Deuschland'),
(2, 'Molischgasse', 2587, 'Graz', 'Österreich'),
(3, 'italystrasse', 97542, 'Roma', 'Italy'),
(4, 'Niederlanderstrasse', 78520, 'Amsterdam', 'Niederlande');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bigstorehouse`
--
ALTER TABLE `bigstorehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`);

--
-- Indexes for table `local_post`
--
ALTER TABLE `local_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_receiver` (`fk_receiver`);

--
-- Indexes for table `packet`
--
ALTER TABLE `packet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sender_Id` (`fk_sender_Id`),
  ADD KEY `fk_post_Id` (`fk_post_Id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PacketNummber` (`PacketNummber`),
  ADD KEY `fk_bigStoreHouse` (`fk_bigStoreHouse`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `S_addrese_id` (`S_addrese_id`);

--
-- Indexes for table `receiver_land`
--
ALTER TABLE `receiver_land`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_local_post` (`fk_local_post`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_adress_Id` (`fk_adress_Id`);

--
-- Indexes for table `s_addrese`
--
ALTER TABLE `s_addrese`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bigstorehouse`
--
ALTER TABLE `bigstorehouse`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `local_post`
--
ALTER TABLE `local_post`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `packet`
--
ALTER TABLE `packet`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receiver_land`
--
ALTER TABLE `receiver_land`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `s_addrese`
--
ALTER TABLE `s_addrese`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bigstorehouse`
--
ALTER TABLE `bigstorehouse`
  ADD CONSTRAINT `bigstorehouse_ibfk_1` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver_land` (`id`);

--
-- Constraints for table `local_post`
--
ALTER TABLE `local_post`
  ADD CONSTRAINT `local_post_ibfk_1` FOREIGN KEY (`fk_receiver`) REFERENCES `receiver` (`id`);

--
-- Constraints for table `packet`
--
ALTER TABLE `packet`
  ADD CONSTRAINT `packet_ibfk_1` FOREIGN KEY (`fk_sender_Id`) REFERENCES `sender` (`id`),
  ADD CONSTRAINT `packet_ibfk_2` FOREIGN KEY (`fk_post_Id`) REFERENCES `post` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`fk_bigStoreHouse`) REFERENCES `bigstorehouse` (`id`);

--
-- Constraints for table `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `receiver_ibfk_2` FOREIGN KEY (`S_addrese_id`) REFERENCES `s_addrese` (`id`);

--
-- Constraints for table `receiver_land`
--
ALTER TABLE `receiver_land`
  ADD CONSTRAINT `receiver_land_ibfk_1` FOREIGN KEY (`fk_local_post`) REFERENCES `local_post` (`id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_adress_Id`) REFERENCES `address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

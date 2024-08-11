-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2024 at 04:12 PM
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
-- Database: `bank_itera`
--

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id_nasabah` int(5) NOT NULL,
  `no_rekening` char(15) NOT NULL,
  `nama_nasabah` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telepon` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `no_rekening`, `nama_nasabah`, `alamat`, `no_telepon`) VALUES
(1, '145678', 'Puspa Sari', 'Sei Batang Kuis', '081376809122'),
(2, '256132', 'Sinta Jojo', 'Iskandar Muda', '089987654311'),
(3, '247182', 'Bunga Putri', 'Jalan Martapura', '081249987011'),
(4, '350067', 'Grace Sebayang', 'Gang Keluarga', '085276812453'),
(5, '114115', 'Christine Talia', 'Sei Kambah', '082266778866'),
(6, '100111', 'Rimayka', 'Perumahan Puri K', '081234567890'),
(7, '248671', 'Intra Indra Kerbang Tinggi', 'I', '08136690922'),
(8, '356538', 'Talia Talio', 'Jalan Jatisari', '08994735421'),
(9, '144161', 'Putri Natalia', 'Sumber Sari', '08214997801');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `No_rekening` varchar(6) NOT NULL,
  `kode_cabang` char(5) NOT NULL,
  `nomor_pin` varchar(6) DEFAULT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`No_rekening`, `kode_cabang`, `nomor_pin`, `saldo`) VALUES
('100111', 'KKM69', '213671', 998500),
('114115', 'SGS01', '203010', 500000),
('140932', 'JOJ02', '024422', 1200000),
('144161', 'MDN74', '230499', 1000000),
('145678', 'SGS02', '908723', 1000000),
('220983', 'SMG12', '450817', 5422000),
('247182', 'JKT48', '091298', 4000000),
('248671', 'GSG52', '007010', 5000000),
('256132', 'KKM70', '340987', 230000),
('350067', 'RGS02', '230987', 5500000),
('356538', 'KMK07', '998070', 600000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `No_transaksi` int(11) NOT NULL,
  `No_rekening` varchar(6) NOT NULL,
  `jenis_transaksi` varchar(10) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`No_transaksi`, `No_rekening`, `jenis_transaksi`, `tgl_transaksi`, `jumlah`) VALUES
(1, '220983', 'DEBET', '2022-06-12 12:00:45', 500000),
(2, '220983', 'DEBET', '2022-06-13 08:20:33', 2150000),
(3, '140932', 'ATM', '2022-06-14 10:56:52', 100000),
(4, '140932', 'ATM', '2022-06-14 15:16:23', 100000),
(5, '120087', 'DEBET', '2022-06-15 15:03:33', 1250000),
(6, '220983', 'ATM', '2022-06-17 20:34:22', 150000),
(7, '220983', 'ATM', '2022-06-15 15:40:12', 100000),
(8, '220983', 'DEBET', '2022-06-16 08:23:23', 2500000),
(11, '100111', 'ATM', '2022-06-09 08:00:45', 100000),
(12, '114115', 'ATM', '2022-06-09 11:10:12', 200000),
(13, '114115', 'DEBET', '2022-06-09 13:00:30', 50000),
(14, '256132', 'DEBET', '2022-06-15 11:20:00', 150000),
(15, '145678', 'ATM', '2022-06-18 23:11:22', 250000),
(16, '145678', 'DEBET', '2022-06-18 15:30:08', 300000),
(17, '350067', 'ATM', '2022-06-18 10:02:45', 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`No_rekening`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`No_transaksi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `nasabah_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`No_rekening`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

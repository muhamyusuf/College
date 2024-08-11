-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2024 at 04:13 PM
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
-- Database: `galeri_itera`
--

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` char(7) NOT NULL,
  `pegawai_nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `pegawai_nama`, `jabatan`) VALUES
('pg_001', 'Santi', 'Cashier'),
('Pg_002', 'Siska', 'Casier'),
('Pg_003', 'Nuri', 'Casier'),
('Pg_004', 'Jamal', 'Casier'),
('pg_201', 'Santo', 'Cashier'),
('pg_300', 'Yaya', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` char(6) NOT NULL,
  `pembeli_nama` varchar(255) NOT NULL,
  `pembeli_kontak` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `pembeli_nama`, `pembeli_kontak`) VALUES
('C_800', 'Egi', '0812521221'),
('C_810', 'Ardi', '0862145121'),
('C_890', 'Prassetya', '08521116464'),
('C_901', 'Rudi', '081231511'),
('C_991', 'Andi', '085212021111');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` char(5) NOT NULL,
  `produk_nama` varchar(255) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `supplies_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_nama`, `jumlah_stok`, `supplies_id`) VALUES
('P109', 'Teh Kotak 300 ml', 40, 'S002'),
('P114', 'Milo 100 ml', 800, 'S001'),
('P115', 'Milo 150 ml', 50, 'S003'),
('P123', 'Gulaku 1 Kg', 100, 'S005'),
('P235', 'Aqua 250 ml', 300, 'S001'),
('P311', 'Grand 320 ml', 400, 'S003'),
('P333', 'Sari Roti 100 gram', 30, 'S005'),
('P441', 'Rojo Lele 5 kg', 60, 'S002'),
('P453', 'Garam 30 gram', 20, 'S006'),
('P552', 'Aqua 1 L', 300, 'S001'),
('P882', 'Indomilk 25 ml', 200, 'S004');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `suppliers_id` char(5) NOT NULL,
  `company_nama` varchar(255) NOT NULL,
  `nama_kontak` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`suppliers_id`, `company_nama`, `nama_kontak`) VALUES
('S001', 'Semua Terang', 'Ali'),
('S002', 'Suka Maju', 'Rahmat'),
('S003', 'Maju Terus', 'Dayono'),
('S004', 'Pelita Baru', 'Puspa'),
('S005', 'Surya Kun', 'Siti'),
('S006', 'Ceria Kasih', 'Topan');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(5) NOT NULL,
  `id_pembeli` char(6) NOT NULL,
  `id_pegawai` char(7) NOT NULL,
  `produk_id` char(5) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `jumlah_beli` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pembeli`, `id_pegawai`, `produk_id`, `tgl_transaksi`, `jumlah_beli`) VALUES
(1, 'C_901', 'pg_002', 'P552', '2022-09-12 00:00:00', 3),
(2, 'C_901', 'pg_003', 'P109', '2022-09-15 00:00:00', 10),
(3, 'C_810', 'pg_001', 'P114', '2022-09-15 00:00:00', 2),
(4, 'C_991', 'pg_004', 'P333', '2022-09-18 00:00:00', 3),
(5, 'C_800', 'pg_001', 'P552', '2022-09-18 00:00:00', 1),
(6, 'C_810', 'pg_002', 'P552', '2022-09-20 00:00:00', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`suppliers_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pembeli` (`id_pembeli`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2023 at 10:07 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `revminder`
--

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id` int NOT NULL,
  `id_mobil` int DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `jarak` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `biaya` int DEFAULT NULL,
  `kategori` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dikerjakan` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id`, `id_mobil`, `tanggal`, `jarak`, `biaya`, `kategori`, `dikerjakan`, `keterangan`) VALUES
(8, NULL, '2023-12-07 10:03:00', '20 kM', 10, 'Aki', 'bengkel', 'Montirnya ga worth it');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `nama_pemilik` text COLLATE utf8mb4_general_ci NOT NULL,
  `no_pol` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kendaraan` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `merek` text COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `transmisi` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `tahun` int NOT NULL,
  `warna` text COLLATE utf8mb4_general_ci NOT NULL,
  `jenis` text COLLATE utf8mb4_general_ci NOT NULL,
  `produk` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id`, `id_user`, `nama_pemilik`, `no_pol`, `nama_kendaraan`, `merek`, `model`, `transmisi`, `tahun`, `warna`, `jenis`, `produk`) VALUES
(12, 27, '', '', 'Lamborghini Marchilago', '', '', '', 2006, '', '', ''),
(14, 35, '', '', 'GTR R35', '', '', '', 2008, '', '', ''),
(19, 25, '', '', 'Bugati Veyron', '', '', '', 2010, '', '', ''),
(20, 25, '', '', 'AUDI', '', '', '', 2012, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `motor`
--

CREATE TABLE `motor` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `nama_pemilik` text COLLATE utf8mb4_general_ci NOT NULL,
  `no_pol` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kendaraan` char(40) COLLATE utf8mb4_general_ci NOT NULL,
  `merek` text COLLATE utf8mb4_general_ci NOT NULL,
  `model` char(20) COLLATE utf8mb4_general_ci NOT NULL,
  `transmisi` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `tahun` int NOT NULL,
  `warna` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `jenis` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `produk` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motor`
--

INSERT INTO `motor` (`id`, `id_user`, `nama_pemilik`, `no_pol`, `nama_kendaraan`, `merek`, `model`, `transmisi`, `tahun`, `warna`, `jenis`, `produk`) VALUES
(17, 35, '', '', 'Ducati Panegale', '', '', '', 2020, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nowa` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `nowa`, `alamat`, `password`) VALUES
(25, 'ade', 'ade@gmail.com', '0895703085680', 'jl dursasana raya', '$2b$10$Gbk9Ks99RCEShwjkCfB.k.Ot0ld0d1Bf/xymJnoM91TL2RYOmmj5a'),
(27, 'dwinandar2', 'adedwinandar@gmail.com', '0891283123', 'dursasanaraya', '$2b$10$nHlUQkYRXD4fnJIN0LmrNuHvoAUK/7ihi0iKeUf2Ba2aD4U/I977K'),
(30, 'gyfiqu', 'wivoqe@mailinator.com', '0892749213', 'In eiusmod et et qua', '$2b$10$UaVErzlh7MVQDXFgc32hf.sgahw647QWy65jeytGxZwZSzL3CPW1y'),
(31, 'fakodanexi', 'tohyrasilu@mailinator.com', '089577525129', 'Qui atque maxime vol', '$2b$10$t2gLto3IWbjqU6Gvp.xcmuegicJx0h.WZZJxYVozQxg/AVKr46AjC'),
(32, 'beremu', 'jebopi@mailinator.com', '0896249287', 'Qui repellendus Del', '$2b$10$X.LcLNRtXFAsG97kOen51efC3syfCq5gI.PsuKU.tR/79VbGMKDnG'),
(34, 'asdasd', 'adedwinandar@gmail.com', '08912831232', 'dursasanaraya', '$2b$10$y8wlqDogizLpl2yq9bC6B.6rZpD2i2dbGmjLz.JgEfalo8prLHv0K'),
(35, 'yunan', 'yunan@gmail.com', '0896524241', 'dursasanaraya', '$2b$10$yr7V.iMLwUpbqyOeyopZkeAq3Mrbfw27xsusMWYZyUD8nPywb.PQ2'),
(36, 'asdasdasdd', 'rahasia@gmail.com', '0892738123', 'rahasia asdasd', '$2b$12$0naXErpen.HaC9XpBfGOI.EuRBXfqZ3hCPX02AOXwKGY1rp/gRDC6'),
(37, 'wuqepagi', 'sini@mailinator.com', '08977692632', 'Aspernatur placeat ', '$2b$12$Cmg1atCkD6WuF1OFgh2I9OhxWx4fz4bBx/52J8wNsLEevz8OTKu9y'),
(38, 'nodokyfyly', 'jemadak@mailinator.com', '089798722323', 'Magnam ipsum in eos', '$2b$12$E5MTxrJ3nHRLk3YM03ovK.GfmayHurksQUy9btZTinsNTDWTUy5mK'),
(39, 'yunanasd', 'asdesdsda@gmail.com', '0897264812321', 'Voluptas qui culpa a', '$2b$12$ojPdYjTKlBgRci9AEVronOXxRzmsi.11MXrhbQxeRE7QRvGUciQDq'),
(40, 'qyvyl', 'lorusoci@mailinator.com', '08979684546', 'Illum itaque proide', '$2b$12$E4ybh4yzIaohTrkS4adDMOE4BVDCJnOm4wlq/G8/iHHzxQnUFvWJq'),
(41, 'bangandy', 'andy@mailinator.com', '08978676436', 'At alias a consequat', '$2b$12$VfREAu1xj.jAiCJCui5P8eMYnHxaeAGOwzY37ZeSiUkU7.NHoOh9K');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mobil` (`id_mobil`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `motor`
--
ALTER TABLE `motor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `layanan`
--
ALTER TABLE `layanan`
  ADD CONSTRAINT `layanan_ibfk_1` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `motor`
--
ALTER TABLE `motor`
  ADD CONSTRAINT `motor_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

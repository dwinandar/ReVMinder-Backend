-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2023 at 08:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

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
  `id` int(11) NOT NULL,
  `id_kendaraan` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `jarak` varchar(50) DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  `kategori` varchar(40) DEFAULT NULL,
  `dikerjakan` varchar(20) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_pemilik` text NOT NULL,
  `no_pol` varchar(30) NOT NULL,
  `nama_kendaraan` varchar(40) NOT NULL,
  `merek` text NOT NULL,
  `model` varchar(40) NOT NULL,
  `transmisi` varchar(25) NOT NULL,
  `tahun` int(11) NOT NULL,
  `warna` text NOT NULL,
  `jenis` text NOT NULL,
  `produk` text NOT NULL
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
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_pemilik` text NOT NULL,
  `no_pol` varchar(30) NOT NULL,
  `nama_kendaraan` char(40) NOT NULL,
  `merek` text NOT NULL,
  `model` char(20) NOT NULL,
  `transmisi` varchar(30) NOT NULL,
  `tahun` int(11) NOT NULL,
  `warna` varchar(20) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `produk` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motor`
--

INSERT INTO `motor` (`id`, `id_user`, `nama_pemilik`, `no_pol`, `nama_kendaraan`, `merek`, `model`, `transmisi`, `tahun`, `warna`, `jenis`, `produk`) VALUES
(17, 35, '', '', 'Ducati Panegale', '', '', '', 2020, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pengingat`
--

CREATE TABLE `pengingat` (
  `tanggal` datetime NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `ingatkan` varchar(30) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nowa` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
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
(41, 'bangandy', 'andy@mailinator.com', '08978676436', 'At alias a consequat', '$2b$12$VfREAu1xj.jAiCJCui5P8eMYnHxaeAGOwzY37ZeSiUkU7.NHoOh9K'),
(42, 'dudul', 'dudul@reply.com', '89898989', 'Madiun', '$2b$12$YfRy3sCxTk.51Z9lC655iem6uhPjU5PIzhLS/vVgoIjqhhJfVQz16'),
(43, 'nafid', 'nafid123@reply.com', '1210292', 'genuk', '$2b$12$qE6Fq.hH//EWezYzg92aiuJx7vbW/dm7VNohq5N6Mi3C.ZGbGHK1e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mobil` (`id_kendaraan`);

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
-- Indexes for table `pengingat`
--
ALTER TABLE `pengingat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kendaraan` (`id_kendaraan`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `motor`
--
ALTER TABLE `motor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `layanan`
--
ALTER TABLE `layanan`
  ADD CONSTRAINT `layanan_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `mobil` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `layanan_ibfk_2` FOREIGN KEY (`id_kendaraan`) REFERENCES `motor` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `motor`
--
ALTER TABLE `motor`
  ADD CONSTRAINT `motor_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `pengingat`
--
ALTER TABLE `pengingat`
  ADD CONSTRAINT `pengingat_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `mobil` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `pengingat_ibfk_2` FOREIGN KEY (`id_kendaraan`) REFERENCES `motor` (`id`), ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

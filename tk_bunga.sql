-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2020 at 04:08 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tk_bunga`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Bunga Papan'),
(2, 'Bouquet');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `nama_produk` varchar(45) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `nota_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id` int(11) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `total` decimal(20,2) NOT NULL,
  `ppn` decimal(5,2) NOT NULL,
  `tagihan` decimal(20,2) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `nama_customer` varchar(65) DEFAULT NULL,
  `jenis_faktur` varchar(15) NOT NULL COMMENT 'penjualan = customer beli secara online.\npembelian = pihat toko belanja barang ke distributor.',
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(65) DEFAULT NULL,
  `status_transaksi` varchar(45) NOT NULL COMMENT 'cancel\npending\nsuccess'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id`, `tanggal`, `total`, `ppn`, `tagihan`, `id_customer`, `nama_customer`, `jenis_faktur`, `id_pegawai`, `nama_pegawai`, `status_transaksi`) VALUES
(950, NULL, '1100000.00', '10.00', '1210000.00', 1, 'ekas', 'penjualan', NULL, NULL, 'success');

-- --------------------------------------------------------

--
-- Table structure for table `preview`
--

CREATE TABLE `preview` (
  `id` int(11) NOT NULL,
  `foto` varchar(45) NOT NULL,
  `t_produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(65) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `thumbnail`, `harga`, `deskripsi`, `stok`, `kategori_id`) VALUES
(1, 'Amour', '/assets/image/amour.jpg', '500000.00', NULL, 10, 2),
(2, 'Angel', '/assets/image/angel.jpg', '465000.00', NULL, 10, 2),
(3, 'Isabeliz', '/assets/image/isabeliz.jpg', '610000.00', NULL, 10, 2),
(4, 'Angie Rose', '/assets/image/angierose.jpg', '550000.00', NULL, 10, 2),
(5, 'Summer Hush', '/assets/image/summerhush.jpg', '675000.00', NULL, 10, 2),
(6, 'Pink Lady', '/assets/image/pinklady.jpg', '575000.00', NULL, 10, 2),
(7, 'Lullaby', '/assets/image/lullaby.jpg', '450000.00', NULL, 10, 2),
(8, 'Lavende', '/assets/image/lavende.jpg', '655000.00', NULL, 10, 2),
(9, 'Bunga Papan 1', '/assets/image/bp1.png', '700000.00', NULL, 10, 1),
(10, 'Bunga Papan 2', '/assets/image/bp2.png', '1000000.00', NULL, 10, 1),
(11, 'Bunga Papan 3', '/assets/image/bp3.png', '850000.00', NULL, 10, 1),
(12, 'Bunga Papan 4', '/assets/image/bp4.png', '800000.00', NULL, 10, 1),
(13, 'Bunga Papan 5', '/assets/image/bp5.png', '900000.00', NULL, 10, 1),
(14, 'Bunga Papan 6', '/assets/image/bp6.png', '1200000.00', NULL, 10, 1),
(15, 'Bunga Papan 7', '/assets/image/bp7.png', '860000.00', NULL, 10, 1),
(16, 'Bunga Papan 8', '/assets/image/bp8.png', '800000.00', NULL, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_menu`
--

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL,
  `nama` varchar(65) NOT NULL,
  `url` varchar(200) NOT NULL,
  `t_roole_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_roole`
--

CREATE TABLE `t_roole` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_roole`
--

INSERT INTO `t_roole` (`id`, `nama`) VALUES
(1, 'Manager'),
(2, 'Employee'),
(3, 'Guest'),
(4, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `no` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL,
  `t_roole_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `nama`, `email`, `password`, `no`, `status`, `t_roole_id`) VALUES
(1, 'ekas', 'ekas@gmail.com', '12345', '0', 'active', 4),
(2, 'ivan', 'ivan@gmail.com', '12345', '0', 'active', 4),
(3, 'arya', 'arya@gmail.com', '12345', '0', 'active', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`nota_id`,`produk_id`),
  ADD KEY `fk_keranjang_nota1_idx` (`nota_id`),
  ADD KEY `fk_keranjang_produk1_idx` (`produk_id`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `preview`
--
ALTER TABLE `preview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_preview_t_produk1_idx` (`t_produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_produk_kategori1_idx` (`kategori_id`);

--
-- Indexes for table `t_menu`
--
ALTER TABLE `t_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_menu_t_roole1_idx` (`t_roole_id`);

--
-- Indexes for table `t_roole`
--
ALTER TABLE `t_roole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_user_t_roole_idx` (`t_roole_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nota`
--
ALTER TABLE `nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=953;

--
-- AUTO_INCREMENT for table `preview`
--
ALTER TABLE `preview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `t_menu`
--
ALTER TABLE `t_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_roole`
--
ALTER TABLE `t_roole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `fk_keranjang_nota1` FOREIGN KEY (`nota_id`) REFERENCES `nota` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_keranjang_produk1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `preview`
--
ALTER TABLE `preview`
  ADD CONSTRAINT `fk_preview_t_produk1` FOREIGN KEY (`t_produk_id`) REFERENCES `produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_t_produk_kategori1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `t_menu`
--
ALTER TABLE `t_menu`
  ADD CONSTRAINT `fk_t_menu_t_roole1` FOREIGN KEY (`t_roole_id`) REFERENCES `t_roole` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `fk_t_user_t_roole` FOREIGN KEY (`t_roole_id`) REFERENCES `t_roole` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

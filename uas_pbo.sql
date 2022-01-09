-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2022 at 05:58 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_pbo`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_barang`
--

CREATE TABLE `mst_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `kategori_barang` varchar(20) NOT NULL,
  `merek` varchar(50) DEFAULT NULL,
  `ukuran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_barang`
--

INSERT INTO `mst_barang` (`kd_barang`, `nama_barang`, `kategori_barang`, `merek`, `ukuran`) VALUES
('0102', 'AC', 'Barang Electronik', 'SAMSUNG', '50 x 50 '),
('0398', 'MEJA TAMU', 'Barang Furniture', 'OLIMPIC', '90 x 90 cm'),
('123456', 'Meja bundar segitu', 'Barang Furniture', 'xxxxx', '50X50 cm'),
('1456', 'Kuris Tamu VIP', 'Barang Furniture', 'Tasmina', '12 x 20 m'),
('3498', 'Kursi Direktur', 'Barang Furniture', 'ASUS', '46 x 60'),
('4455', 'LAMPU', 'Barang Hiasan', 'LG', '10 x 10 cm'),
('5342', 'LAMPU', 'Barang Furniture', 'SONY', '20 x 20 cm'),
('7689', 'MEJA BUNDAR', 'Barang Furniture', 'ASUS', '70 x 70 cm');

-- --------------------------------------------------------

--
-- Table structure for table `mst_lokasi`
--

CREATE TABLE `mst_lokasi` (
  `kd_lokasi` varchar(10) NOT NULL,
  `nama_lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_lokasi`
--

INSERT INTO `mst_lokasi` (`kd_lokasi`, `nama_lokasi`) VALUES
('4512', 'RUANG BERKAS'),
('6531', 'LOBBY'),
('700', 'DAPUR MASAK'),
('8767', 'RUANG RAPAT'),
('G00011', 'Gudang berangkas'),
('GD001', 'Ruang Direksi'),
('GD0201', 'Ruang Karyawan');

-- --------------------------------------------------------

--
-- Table structure for table `mst_user`
--

CREATE TABLE `mst_user` (
  `id_user` varchar(10) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(35) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_user`
--

INSERT INTO `mst_user` (`id_user`, `username`, `password`, `nama`, `jenis_kelamin`, `alamat`) VALUES
('0932', 'CINDY', 'CINDY', 'CINDY', 'Perempuan', 'LANDASAN ULIN'),
('0980', 'KEVIN', 'KEVIN', 'KEVIN', 'Laki - laki', 'paringin'),
('123', 'admin', 'admin', 'BOY', 'Laki - laki', 'martapura'),
('1234', 'ade', 'ade', 'ABOY', 'Laki - laki', 'banjarbaru'),
('202', 'ABDI', '0202', 'ABDI', 'Laki - laki', 'Landasan Ulin'),
('6432', 'SANDRA MELDA', 'SANDRA', 'SANDRA', 'Perempuan', 'MARTAPURA');

-- --------------------------------------------------------

--
-- Table structure for table `trx_inventaris_keluar`
--

CREATE TABLE `trx_inventaris_keluar` (
  `kd_inventaris_keluar` char(15) NOT NULL,
  `kd_inventaris_masuk` char(15) NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `keterangan` varchar(20) NOT NULL,
  `id_user` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trx_inventaris_keluar`
--

INSERT INTO `trx_inventaris_keluar` (`kd_inventaris_keluar`, `kd_inventaris_masuk`, `jumlah`, `tanggal_keluar`, `keterangan`, `id_user`) VALUES
('OUT0003', 'IN0003', 111, '2022-01-08', 'usang', '123'),
('OUT0004', 'IN0003', 11113, '2022-01-08', 'rusak terbanting', '123'),
('OUT0005', 'IN0005', 8, '2022-01-08', 'BARU', '123'),
('OUT0006', 'IN0001', 50, '2022-01-08', 'sedikit lecet', '123'),
('OUT0007', 'IN0001', 9, '2022-01-08', 'nice', '123'),
('OUT0008', 'IN0001', 3, '2022-01-08', 'MASIH DI DALAM DUS', '123'),
('OUT0009', 'IN0007', 12, '2022-01-09', 'BARU DATANG', '123'),
('OUT0010', 'IN0008', 98, '2022-01-09', 'BAGUS SEKALI', '123');

-- --------------------------------------------------------

--
-- Table structure for table `trx_inventaris_masuk`
--

CREATE TABLE `trx_inventaris_masuk` (
  `kd_inventaris_masuk` char(15) NOT NULL,
  `kd_barang` varchar(10) NOT NULL,
  `jumlah` float NOT NULL,
  `nilai_barang` float NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `id_user` varchar(10) NOT NULL,
  `kd_lokasi` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trx_inventaris_masuk`
--

INSERT INTO `trx_inventaris_masuk` (`kd_inventaris_masuk`, `kd_barang`, `jumlah`, `nilai_barang`, `tanggal_masuk`, `id_user`, `kd_lokasi`) VALUES
('IN0001', '12314', 20, 10000, '2022-01-08', '123', 'G00011'),
('IN0002', '1456', 19, 10000, '2022-01-07', '123', 'G00011'),
('IN0003', '1456', 190, 10000, '2022-01-07', '123', 'GD001'),
('IN0004', '12314', 200, 21, '2022-01-07', '123', 'GD001'),
('IN0005', '12314', 20, 23, '2022-01-07', '123', 'G00011'),
('IN0006', '1456', 220, 1400, '2022-01-08', '123', 'GD0201'),
('IN0008', '7689', 65, 12, '2022-01-09', '123', '4512');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_barang`
--
ALTER TABLE `mst_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `mst_lokasi`
--
ALTER TABLE `mst_lokasi`
  ADD PRIMARY KEY (`kd_lokasi`);

--
-- Indexes for table `mst_user`
--
ALTER TABLE `mst_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `trx_inventaris_keluar`
--
ALTER TABLE `trx_inventaris_keluar`
  ADD PRIMARY KEY (`kd_inventaris_keluar`);

--
-- Indexes for table `trx_inventaris_masuk`
--
ALTER TABLE `trx_inventaris_masuk`
  ADD PRIMARY KEY (`kd_inventaris_masuk`,`kd_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

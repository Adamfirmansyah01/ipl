-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2023 pada 10.03
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perusahaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apply`
--

CREATE TABLE `apply` (
  `ID_Apply` int(10) NOT NULL,
  `ID_js` int(10) NOT NULL,
  `Date_Apply` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `approve`
--

CREATE TABLE `approve` (
  `ID_Approve` int(10) NOT NULL,
  `ID_Admin` int(10) NOT NULL,
  `Date_Approve` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `ID_Customer` varchar(10) NOT NULL,
  `ID_Role` int(5) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobprovider`
--

CREATE TABLE `jobprovider` (
  `ID_jp` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobseeker`
--

CREATE TABLE `jobseeker` (
  `ID_js` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact_num` int(11) NOT NULL,
  `gender` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `request`
--

CREATE TABLE `request` (
  `ID_Request` int(10) NOT NULL,
  `ID_jp` int(10) NOT NULL,
  `Date_Request` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `ID_Role` int(10) NOT NULL,
  `nama_role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vacancy`
--

CREATE TABLE `vacancy` (
  `ID_Vacancy` int(10) NOT NULL,
  `ID_Approve` int(10) NOT NULL,
  `ID_Apply` int(10) NOT NULL,
  `ID_Request` int(10) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Desc` varchar(20) NOT NULL,
  `Num_of_jobs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Indeks untuk tabel `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`ID_Apply`),
  ADD KEY `ID_js` (`ID_js`);

--
-- Indeks untuk tabel `approve`
--
ALTER TABLE `approve`
  ADD PRIMARY KEY (`ID_Approve`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_Customer`),
  ADD KEY `ID_Role` (`ID_Role`);

--
-- Indeks untuk tabel `jobprovider`
--
ALTER TABLE `jobprovider`
  ADD PRIMARY KEY (`ID_jp`),
  ADD KEY `ID_jp` (`ID_jp`);

--
-- Indeks untuk tabel `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD PRIMARY KEY (`ID_js`);

--
-- Indeks untuk tabel `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`ID_Request`),
  ADD KEY `ID_jp` (`ID_jp`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID_Role`);

--
-- Indeks untuk tabel `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`ID_Vacancy`),
  ADD KEY `ID_Approve` (`ID_Approve`,`ID_Apply`,`ID_Request`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `approve`
--
ALTER TABLE `approve`
  ADD CONSTRAINT `approve_ibfk_1` FOREIGN KEY (`ID_Approve`) REFERENCES `admin` (`ID_Admin`);

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ID_Role`) REFERENCES `role` (`ID_Role`);

--
-- Ketidakleluasaan untuk tabel `jobprovider`
--
ALTER TABLE `jobprovider`
  ADD CONSTRAINT `jobprovider_ibfk_1` FOREIGN KEY (`ID_jp`) REFERENCES `admin` (`ID_Admin`);

--
-- Ketidakleluasaan untuk tabel `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD CONSTRAINT `jobseeker_ibfk_1` FOREIGN KEY (`ID_js`) REFERENCES `customer` (`ID_Role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

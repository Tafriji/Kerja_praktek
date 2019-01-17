-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Des 2018 pada 02.45
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokolintang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `foto` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `merk`, `stok`, `harga`, `harga_jual`, `foto`) VALUES
('BRG001', 'Barang Antik 1', 'KTG001', 'Antik', 11, 200000000, 400000, 'gambar_barang/barangantik.jpg'),
('BRG002', 'Barang Antik 2', 'KTG001', 'Antik', 3, 2100000000, 250000, 'gambar_barang/barangantik2.jpg'),
('BRG003', 'Barang Antik 3', 'KTG001', 'Antik', 13, 200000, 250000, 'gambar_barang/1.PNG'),
('BRG004', 'Barang Antik 4', 'KTG001', 'Antik', 16, 200000, 250000, 'gambar_barang/1.PNG'),
('BRG005', 'kerudung1', 'KTG001', 'Antik', 23, 200000, 250000, 'gambar_barang/a4.PNG');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `barang_laris`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `barang_laris` (
`foto` varchar(500)
,`id_barang` varchar(10)
,`nama_barang` varchar(20)
,`total` decimal(32,0)
,`tanggal` timestamp
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail`
--

CREATE TABLE `detail` (
  `id_detail` varchar(10) NOT NULL,
  `id_transaksi` varchar(10) DEFAULT NULL,
  `id_barang` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jumlah` int(11) NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail`
--

INSERT INTO `detail` (`id_detail`, `id_transaksi`, `id_barang`, `harga`, `tanggal`, `jumlah`, `id_user`, `status`) VALUES
('DTL001', 'TRS001', 'BRG001', 400000, '2018-11-23 03:10:47', 8, 'Admin', 1),
('DTL002', 'TRS001', 'BRG002', 250000, '2018-11-23 03:10:50', 8, 'Admin', 1),
('DTL003', 'TRS005', 'BRG002', 250000, '2018-12-13 11:32:47', 10, 'Admin', 1),
('DTL004', 'TRS006', 'BRG002', 250000, '2018-12-13 11:33:35', 2, 'Admin', 1);

--
-- Trigger `detail`
--
DELIMITER $$
CREATE TRIGGER `kurangstok` AFTER INSERT ON `detail` FOR EACH ROW begin
update barang set stok = stok - new.jumlah 
where id_barang=new.id_barang;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kurannnnng` AFTER UPDATE ON `detail` FOR EACH ROW begin
declare x,y,z integer;
select old.jumlah from detail where id_detail=old.id_detail and old.id_transaksi IS null  into x;
select new.jumlah from detail where id_detail=new.id_detail and old.id_transaksi IS null  into y;
set z=y-x;
update barang set stok=stok-z where id_barang=new.id_barang;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah` BEFORE DELETE ON `detail` FOR EACH ROW begin 
update barang set stok= stok + old.jumlah where id_barang = old.id_barang;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_online`
--

CREATE TABLE `detail_online` (
  `id_detail_online` varchar(10) NOT NULL,
  `id_transaksi` varchar(10) DEFAULT NULL,
  `id_barang` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jumlah` int(11) NOT NULL,
  `id_member` varchar(10) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_online`
--

INSERT INTO `detail_online` (`id_detail_online`, `id_transaksi`, `id_barang`, `harga`, `tanggal`, `jumlah`, `id_member`, `status`) VALUES
('DTO001', 'TRS004', 'BRG001', 400000, '2018-12-13 11:26:14', 6, 'MBR003', 1),
('DTO002', 'TRS004', 'BRG002', 250000, '2018-12-13 11:26:15', 1, 'MBR003', 1),
('DTO003', 'TRS007', 'BRG001', 400000, '2018-12-13 12:29:55', 5, 'MBR003', 1),
('DTO004', 'TRS007', 'BRG002', 250000, '2018-12-13 12:29:57', 6, 'MBR003', 1),
('DTO005', 'TRS007', 'BRG003', 250000, '2018-12-13 12:29:59', 4, 'MBR003', 1),
('DTO006', 'TRS007', 'BRG004', 250000, '2018-12-13 12:30:00', 4, 'MBR003', 1);

--
-- Trigger `detail_online`
--
DELIMITER $$
CREATE TRIGGER `kuranggggg1` AFTER UPDATE ON `detail_online` FOR EACH ROW begin
declare x,y,z integer;
select old.jumlah from detail_online where id_detail_online=old.id_detail_online and old.id_transaksi IS null into x;
select new.jumlah from detail_online where id_detail_online=new.id_detail_online and old.id_transaksi IS null  into y;
set z=y-x;
update barang set stok=stok-z where id_barang=new.id_barang;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kurangstok1` AFTER INSERT ON `detail_online` FOR EACH ROW begin
update barang set stok = stok - new.jumlah 
where id_barang=new.id_barang;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah1` BEFORE DELETE ON `detail_online` FOR EACH ROW begin 
update barang set stok= stok + old.jumlah where id_barang = old.id_barang;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `id_detail_pembelian` varchar(10) NOT NULL,
  `id_order` varchar(10) DEFAULT NULL,
  `id_barang` varchar(10) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP,
  `jumlah` int(11) DEFAULT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_supliyer` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`id_detail_pembelian`, `id_order`, `id_barang`, `harga`, `tanggal`, `jumlah`, `id_user`, `status`, `id_supliyer`) VALUES
('PMB001', 'ORD001', 'BRG001', 200000000, '2018-11-19 16:40:19', 40, 'Admin', 1, 'SPL001'),
('PMB002', 'ORD001', 'BRG002', 2100000000, '2018-11-19 16:40:24', 40, 'Admin', 1, 'SPL001'),
('PMB003', 'ORD002', 'BRG001', 200000000, '2018-11-22 14:47:23', 25, 'Admin', 1, 'SPL001'),
('PMB004', 'ORD003', 'BRG002', 2100000000, '2018-11-22 16:34:44', 29, 'Admin', 1, 'SPL001'),
('PMB005', 'ORD004', 'BRG001', 200000000, '2018-11-27 09:15:21', 25, 'Admin', 1, 'SPL001'),
('PMB006', 'ORD005', 'BRG002', 2100000000, '2018-12-07 22:48:11', 12, 'Admin', 1, 'SPL001'),
('PMB007', 'ORD006', 'BRG003', 200000, '2018-12-13 19:26:47', 17, 'Admin', 1, 'SPL001'),
('PMB008', 'ORD006', 'BRG004', 200000, '2018-12-13 19:26:48', 20, 'Admin', 1, 'SPL001'),
('PMB009', 'ORD006', 'BRG005', 200000, '2018-12-13 19:26:48', 23, 'Admin', 1, 'SPL001');

--
-- Trigger `detail_pembelian`
--
DELIMITER $$
CREATE TRIGGER `kurangstokdetailpembelian` AFTER UPDATE ON `detail_pembelian` FOR EACH ROW BEGIN
DECLARE X,Y,z INTEGER;
SELECT old.jumlah FROM detail_pembelian WHERE id_detail_pembelian=old.id_detail_pembelian and old.id_order is null INTO X;
SELECT new.jumlah FROM detail_pembelian WHERE id_detail_pembelian=new.id_detail_pembelian and old.id_order is null INTO Y;
SET z=Y-X;
UPDATE barang SET stok=stok+z WHERE id_barang=new.id_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kurangstokkkkkkk` BEFORE DELETE ON `detail_pembelian` FOR EACH ROW begin 
update barang set stok= stok - old.jumlah where id_barang = old.id_barang;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambahstok` AFTER INSERT ON `detail_pembelian` FOR EACH ROW begin
update barang set stok=stok+new.jumlah, harga=new.harga
where id_barang= new.id_barang;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(70) NOT NULL,
  `bagian` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `nomor_telp` varchar(13) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `alamat`, `bagian`, `jenis_kelamin`, `nomor_telp`, `level`) VALUES
('KRY001', 'agung', 'Jogja', 'Superadmin', 'L', '6287830517727', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(10) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `jenis_barang`) VALUES
('KTG001', 'barangantik');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `laporan_pembelian`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `laporan_pembelian` (
`nama` varchar(30)
,`nama_barang` varchar(20)
,`id_order` varchar(10)
,`harga` int(11)
,`jumlah` int(11)
,`id_user` varchar(10)
,`tanggal` datetime
,`total_bayar` int(11)
,`jumlahtotal` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `laporan_penjualan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `laporan_penjualan` (
`nama_barang` varchar(20)
,`id_transaksi` varchar(10)
,`harga` int(11)
,`jumlah` int(11)
,`id_member` varchar(10)
,`tanggal` datetime
,`total_bayar` int(11)
,`jumlahtotal` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `laporan_penjualan_offline`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `laporan_penjualan_offline` (
`nama_barang` varchar(20)
,`id_transaksi` varchar(10)
,`harga` int(11)
,`jumlah` int(11)
,`id_user` varchar(10)
,`tanggal` datetime
,`total_bayar` int(11)
,`jumlahtotal` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `laris`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `laris` (
`foto` varchar(500)
,`id_barang` varchar(10)
,`nama_barang` varchar(20)
,`total` decimal(32,0)
,`tanggal` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `laris2`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `laris2` (
`foto` varchar(500)
,`id_barang` varchar(10)
,`nama_barang` varchar(20)
,`total` decimal(32,0)
,`tanggal` timestamp
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` varchar(10) NOT NULL,
  `nama_member` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `jenis_kelamin` varchar(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `pertanyaan` varchar(40) NOT NULL,
  `jawaban` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat`, `no_telp`, `jenis_kelamin`, `email`, `password`, `pertanyaan`, `jawaban`) VALUES
('MBR003', 'syukron', 'pekalongan', '087830517727', 'L', 'zukronthanks@gmail.com', 'c526fd52a2c7e631c2391d3efe8311bb', 'siapa anda', 'aku');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orderbarang`
--

CREATE TABLE `orderbarang` (
  `id_order` varchar(10) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orderbarang`
--

INSERT INTO `orderbarang` (`id_order`, `tanggal`, `total_bayar`) VALUES
('ORD001', '2018-11-19 16:40:25', 2147483647),
('ORD002', '2018-11-22 14:47:25', 2147483647),
('ORD003', '2018-11-22 16:34:46', 2147483647),
('ORD004', '2018-11-27 09:15:24', 2147483647),
('ORD005', '2018-12-07 22:48:24', 2147483647),
('ORD006', '2018-12-13 19:26:50', 12000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supliyer`
--

CREATE TABLE `supliyer` (
  `id_supliyer` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `kontak` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supliyer`
--

INSERT INTO `supliyer` (`id_supliyer`, `nama`, `alamat`, `kontak`) VALUES
('SPL001', 'Jati Agung', 'Jl. Wonosari KM 7 ', '08123294934');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_bayar` int(11) NOT NULL,
  `jenis_transaksi` varchar(10) NOT NULL,
  `Status` int(11) NOT NULL,
  `bukti_transaksi` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal`, `total_bayar`, `jenis_transaksi`, `Status`, `bukti_transaksi`) VALUES
('TRS001', '2018-11-23 10:10:55', 5200000, 'offline', 1, NULL),
('TRS002', '2018-11-23 10:11:45', 7700000, 'online', 1, 'bukti_transaksi/spongebob.jpg'),
('TRS003', '2018-12-07 22:36:14', 1450000, 'online', 1, 'bukti_transaksi/1.PNG'),
('TRS004', '2018-12-13 18:26:24', 2650000, 'online', 1, 'bukti_transaksi/12.PNG'),
('TRS005', '2018-12-13 18:32:53', 2500000, 'offline', 1, NULL),
('TRS006', '2018-12-13 18:33:38', 500000, 'offline', 1, NULL),
('TRS007', '2018-12-13 19:30:26', 5500000, 'online', 0, NULL);

--
-- Trigger `transaksi`
--
DELIMITER $$
CREATE TRIGGER `tambaaaah` BEFORE DELETE ON `transaksi` FOR EACH ROW begin 
delete from detail where id_transaksi = old.id_transaksi;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(10) NOT NULL,
  `id_karyawan` varchar(10) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `pertanyaannya` varchar(30) NOT NULL,
  `jawabannya` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_karyawan`, `password`, `pertanyaannya`, `jawabannya`) VALUES
('Admin', NULL, '545aff346297211f41bf7fe4dcc27808', 'a', 'c'),
('agung', 'KRY001', 'a70b2fad5fc73f2ce1919a682be6eeaa', 'a', 'b'),
('ndaru21', NULL, '0819290c9e0696b715ccc89937cd7dc1', 'apa', 'aja');

-- --------------------------------------------------------

--
-- Struktur untuk view `barang_laris`
--
DROP TABLE IF EXISTS `barang_laris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_laris`  AS  select `b`.`foto` AS `foto`,`a`.`id_barang` AS `id_barang`,`b`.`nama_barang` AS `nama_barang`,sum(`a`.`jumlah`) AS `total`,`a`.`tanggal` AS `tanggal` from (`detail_online` `a` join `barang` `b` on((`b`.`id_barang` = `a`.`id_barang`))) group by `a`.`id_barang` order by sum(`a`.`jumlah`) desc limit 0,3 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `laporan_pembelian`
--
DROP TABLE IF EXISTS `laporan_pembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_pembelian`  AS  select `d`.`nama` AS `nama`,`b`.`nama_barang` AS `nama_barang`,`c`.`id_order` AS `id_order`,`a`.`harga` AS `harga`,`a`.`jumlah` AS `jumlah`,`a`.`id_user` AS `id_user`,`c`.`tanggal` AS `tanggal`,`c`.`total_bayar` AS `total_bayar`,(`a`.`harga` * `a`.`jumlah`) AS `jumlahtotal` from (((`detail_pembelian` `a` join `barang` `b` on((`b`.`id_barang` = `a`.`id_barang`))) join `orderbarang` `c` on((`c`.`id_order` = `a`.`id_order`))) join `supliyer` `d` on((`a`.`id_supliyer` = `a`.`id_supliyer`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `laporan_penjualan`
--
DROP TABLE IF EXISTS `laporan_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_penjualan`  AS  select `b`.`nama_barang` AS `nama_barang`,`c`.`id_transaksi` AS `id_transaksi`,`a`.`harga` AS `harga`,`a`.`jumlah` AS `jumlah`,`a`.`id_member` AS `id_member`,`c`.`tanggal` AS `tanggal`,`c`.`total_bayar` AS `total_bayar`,(`a`.`harga` * `a`.`jumlah`) AS `jumlahtotal` from ((`detail_online` `a` join `barang` `b` on((`b`.`id_barang` = `a`.`id_barang`))) join `transaksi` `c` on((`c`.`id_transaksi` = `a`.`id_transaksi`))) where (`c`.`Status` = 1) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `laporan_penjualan_offline`
--
DROP TABLE IF EXISTS `laporan_penjualan_offline`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_penjualan_offline`  AS  select `b`.`nama_barang` AS `nama_barang`,`c`.`id_transaksi` AS `id_transaksi`,`a`.`harga` AS `harga`,`a`.`jumlah` AS `jumlah`,`a`.`id_user` AS `id_user`,`c`.`tanggal` AS `tanggal`,`c`.`total_bayar` AS `total_bayar`,(`a`.`harga` * `a`.`jumlah`) AS `jumlahtotal` from ((`detail` `a` join `barang` `b` on((`b`.`id_barang` = `a`.`id_barang`))) join `transaksi` `c` on((`c`.`id_transaksi` = `a`.`id_transaksi`))) where (`c`.`Status` = 1) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `laris`
--
DROP TABLE IF EXISTS `laris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laris`  AS  select `b`.`foto` AS `foto`,`a`.`id_barang` AS `id_barang`,`b`.`nama_barang` AS `nama_barang`,sum(`a`.`jumlah`) AS `total`,`a`.`tanggal` AS `tanggal` from (`detail_online` `a` join `barang` `b` on((`b`.`id_barang` = `a`.`id_barang`))) group by `a`.`id_barang` order by sum(`a`.`jumlah`) desc ;

-- --------------------------------------------------------

--
-- Struktur untuk view `laris2`
--
DROP TABLE IF EXISTS `laris2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laris2`  AS  select `b`.`foto` AS `foto`,`a`.`id_barang` AS `id_barang`,`b`.`nama_barang` AS `nama_barang`,sum(`a`.`jumlah`) AS `total`,`a`.`tanggal` AS `tanggal` from (`detail` `a` join `barang` `b` on((`b`.`id_barang` = `a`.`id_barang`))) group by `a`.`id_barang` order by sum(`a`.`jumlah`) desc ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `fk_barang3` (`id_kategori`);

--
-- Indeks untuk tabel `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_barang1` (`id_barang`),
  ADD KEY `fk_transaksi1` (`id_transaksi`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indeks untuk tabel `detail_online`
--
ALTER TABLE `detail_online`
  ADD PRIMARY KEY (`id_detail_online`),
  ADD KEY `fk_barang1` (`id_barang`),
  ADD KEY `fk_transaksi1` (`id_transaksi`),
  ADD KEY `detail_online_ibfk_1` (`id_member`);

--
-- Indeks untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`id_detail_pembelian`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_supliyer` (`id_supliyer`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `jenis_barang` (`jenis_barang`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `orderbarang`
--
ALTER TABLE `orderbarang`
  ADD PRIMARY KEY (`id_order`);

--
-- Indeks untuk tabel `supliyer`
--
ALTER TABLE `supliyer`
  ADD PRIMARY KEY (`id_supliyer`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_karyawan1` (`id_karyawan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `fk_barang1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaksi1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_online`
--
ALTER TABLE `detail_online`
  ADD CONSTRAINT `detail_online_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_online_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_online_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `detail_pembelian_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orderbarang` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pembelian_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pembelian_ibfk_3` FOREIGN KEY (`id_supliyer`) REFERENCES `supliyer` (`id_supliyer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_karyawan1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2019 pada 07.08
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
('BRG001', 'Piyama Anak 1', 'KTG001', 'Risqi', 24, 30000, 40000, 'gambar_barang/bajuanakpiyama40rb.jpg'),
('BRG002', 'Celana Joger Anak 1', 'KTG002', 'Diana', 36, 10000, 17000, 'gambar_barang/celana_anak_joger1_17rb.jpg'),
('BRG003', 'Celana Joger Anak 2', 'KTG002', 'Diana', 36, 10000, 17000, 'gambar_barang/celana_anak_joger2_17rb.jpg'),
('BRG004', 'Celana Joger Anak 3', 'KTG002', 'Diana', 36, 10000, 17000, 'gambar_barang/celana_anak_joger3_17rb.jpg'),
('BRG005', 'Celana Joger Anak 4', 'KTG002', 'Diana', 36, 10000, 17000, 'gambar_barang/celana_anak_joger4_17rb.jpg'),
('BRG006', 'Daster Anak 1', 'KTG001', 'Risqi', 18, 12000, 20000, 'gambar_barang/daster_anak1_20rb.jpg'),
('BRG007', 'Daster Anak 2', 'KTG001', 'Risqi', 18, 12000, 20000, 'gambar_barang/daster_anak2_20rb.jpg'),
('BRG008', 'Daster Anak 3', 'KTG001', 'Risqi', 20, 12000, 20000, 'gambar_barang/daster_anak3_20rb.jpg'),
('BRG009', 'Kaos Anak Tayo 1', 'KTG004', 'Tutu', 12, 10000, 17000, 'gambar_barang/kaos_anak_tayo1_17rb.jpg'),
('BRG010', 'Kaos Anak Tayo 2', 'KTG004', 'Tutu', 12, 10000, 17000, 'gambar_barang/kaos_anak_tayo2_17rb.jpg'),
('BRG011', 'Kaos Anak Tayo 3', 'KTG004', 'Tutu', 12, 10000, 17000, 'gambar_barang/kaos_anak_tayo3_17rb.jpg'),
('BRG012', 'Kaos Anak Tayo 4', 'KTG004', 'Tutu', 12, 10000, 17000, 'gambar_barang/kaos anak tayo4 17rb.jpg'),
('BRG013', 'Kaos Anak Tayo 5', 'KTG004', 'Tutu', 12, 10000, 17000, 'gambar_barang/kaos_anak_tayo5_17rb.jpg'),
('BRG014', 'Rok Anak 1', 'KTG005', 'Putri', 22, 15000, 25000, 'gambar_barang/rok_anak_renda_biru_25rb.jpg'),
('BRG015', 'Rok Anak 2', 'KTG005', 'Putri', 21, 15000, 25000, 'gambar_barang/rok_anak_renda_merah_25rb.jpg'),
('BRG016', 'Rok Anak 3', 'KTG005', 'Putri', 24, 15000, 25000, 'gambar_barang/rok_anak_renda_pink_25rb.jpg'),
('BRG017', 'Kerudung Anak Rabani', 'KTG003', 'Alim', 24, 12000, 17000, 'gambar_barang/kerudung_anak_rabani_17rb.jpg'),
('BRG018', 'Celana Panjang Beggy', 'KTG010', 'Almira', 24, 45000, 70000, 'gambar_barang/celana_panjang_beggy_pants1 70rb.jpg'),
('BRG019', 'Celana Panjang Beggy', 'KTG010', 'Almira', 24, 45000, 70000, 'gambar_barang/celana_panjang_beggy_pants2_70rb.jpg'),
('BRG021', 'Celana Panjang Beggy', 'KTG010', 'Almira', 24, 45000, 70000, 'gambar_barang/celana_panjang_beggy_pants4_70rb.jpg'),
('BRG022', 'Celana Panjang Soft ', 'KTG010', 'Fila', 12, 40000, 65000, 'gambar_barang/celana_panjang_soft_jeans_fila_65rb.jpg'),
('BRG023', 'Celana Pendek Kulot ', 'KTG010', 'Almira', 21, 15000, 25000, 'gambar_barang/celana_pendek_kulot1_25rb.jpg'),
('BRG024', 'Celana Panjang Scuba', 'KTG010', 'Almira', 36, 20000, 35000, 'gambar_barang/celana_scuba_35rb.jpg'),
('BRG025', 'Piyama Dewasa 1', 'KTG012', 'Sifa', 21, 40000, 60000, 'gambar_barang/dewasa_piyama_60rb.jpg'),
('BRG026', 'Gamis Dewasa Flece', 'KTG006', 'Fila', 36, 70000, 120000, 'gambar_barang/dewasa_set_flece_120rb.jpg'),
('BRG027', 'Gamis Dewasa Spandek', 'KTG006', 'Fila', 36, 20000, 35000, 'gambar_barang/gamis_fila_spandek1_50rb.jpg'),
('BRG028', 'Gamis Dewasa Spandek', 'KTG006', 'Fila', 24, 20000, 35000, 'gambar_barang/gamis_fila_spandek2_35rb.jpg'),
('BRG029', 'Gamis Dewasa Spandek', 'KTG006', 'Fila', 19, 20000, 35000, 'gambar_barang/gamis_fila_spandek3_35rb.jpg'),
('BRG030', 'Gamis Dewasa Spandek', 'KTG006', 'Fila', 24, 20000, 35000, 'gambar_barang/gamis_fila_spandek4_35rb.jpg'),
('BRG031', 'Gamis Jersey Aisyah ', 'KTG006', 'Aisyah', 48, 45000, 70000, 'gambar_barang/gamis_jersey_70rb.jpg'),
('BRG032', 'Gamis Jersey Aisyah ', 'KTG006', 'Aisyah', 48, 45000, 70000, 'gambar_barang/gamis_jersey_aisyah1_70rb.jpg'),
('BRG033', 'Gamis Jersey Aisyah ', 'KTG006', 'Aisyah', 48, 45000, 70000, 'gambar_barang/gamis_jersey_aisyah2_70rb.jpg'),
('BRG034', 'Gamis Jersey Busui 1', 'KTG006', 'Aisyah', 24, 45000, 70000, 'gambar_barang/gamis_jersey_busui1_70rb.jpg'),
('BRG035', 'Gamis Jersey Busui 2', 'KTG006', 'Aisyah', 24, 45000, 70000, 'gambar_barang/gamis_jersey_busui3_70rb.jpg'),
('BRG036', 'Gamis Jersey Busui 3', 'KTG006', 'Aisyah', 24, 45000, 70000, 'gambar_barang/gamis_jersey_busui3_70rb.jpg'),
('BRG037', 'Gamis Jersey Busui 4', 'KTG006', 'Aisyah', 24, 45000, 70000, 'gambar_barang/gamis_jersey_busui4_70rb.jpg'),
('BRG038', 'Gamis Jersey Busui 5', 'KTG006', 'Aisyah', 24, 45000, 70000, 'gambar_barang/gamis_jersey_busui5_70rb.jpg'),
('BRG039', 'Gamis Mostcrep 1', 'KTG006', 'Aisyah', 12, 55000, 95000, 'gambar_barang/gamis_mostcrep_mutiara_95rb.jpg'),
('BRG040', 'Gamis Mostcrep 2', 'KTG006', 'Aisyah', 12, 50000, 90000, 'gambar_barang/gamis_mostcrept_90rb.jpg'),
('BRG041', 'Jaket Hodie 1', 'KTG011', 'Fila', 12, 35000, 65000, 'gambar_barang/jaket_hodie_flece1_65rb.jpg'),
('BRG042', 'Jaket Hodie 2', 'KTG011', 'Fila', 12, 35000, 65000, 'gambar_barang/jaket_hodie_flece2_65rb.jpg'),
('BRG043', 'Jaket Jeans 1', 'KTG011', 'LOB', 24, 35000, 65000, 'gambar_barang/jaket_jeans_coklat_65rb.jpg'),
('BRG044', 'Jaket Jeans 2', 'KTG011', 'LOB', 24, 35000, 65000, 'gambar_barang/jaket_jeans_pink_65rb.jpg'),
('BRG045', 'Kaos Dewasa 1', 'KTG007', 'Fila', 12, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong1_20rb.jpg'),
('BRG046', 'Kaos Dewasa 2', 'KTG001', 'Fila', 36, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong2_20rb.jpg'),
('BRG047', 'Kaos Dewasa 3', 'KTG007', 'Fila', 12, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong3_20rb.jpg'),
('BRG048', 'Kaos Dewasa 4', 'KTG007', 'Fila', 12, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong4_20rb.jpg'),
('BRG049', 'Kaos Dewasa 5', 'KTG007', 'Fila', 12, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong5_20rb.jpg'),
('BRG050', 'Kaos Dewasa 6', 'KTG007', 'Fila', 12, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong6_20rb.jpg'),
('BRG051', 'Kaos Dewasa 7', 'KTG007', 'Fila', 12, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong7_20rb.jpg'),
('BRG052', 'Kaos Dewasa 8', 'KTG007', 'Fila', 12, 10000, 20000, 'gambar_barang/kaos_dewasa_oblong8_20rb.jpg'),
('BRG053', 'Kaos Dewasa 9', 'KTG007', 'Fila', 12, 15000, 30000, 'gambar_barang/kaos_memon_30rb.jpg'),
('BRG054', 'Kaos Dewasa 10', 'KTG007', 'Fila', 12, 18000, 35000, 'gambar_barang/kaos_la_vie_35rb.jpg'),
('BRG055', 'Kaos Dewasa 11', 'KTG007', 'Fila', 12, 18000, 35000, 'gambar_barang/kaos_salur_35rb.jpg'),
('BRG056', 'Kerudung Ramora 1', 'KTG008', 'Bergo', 37, 20000, 40000, 'gambar_barang/kerudung_bergo_ramora1_40rb.jpg'),
('BRG057', 'Kerudung Ramora 2', 'KTG008', 'Bergo', 36, 20000, 40000, 'gambar_barang/kerudung_bergo_ramora2_40rb.jpg'),
('BRG058', 'Kerudung Ramora 3', 'KTG008', 'Bergo', 36, 20000, 40000, 'gambar_barang/kerudung_bergo_ramora3_40rb.jpg'),
('BRG059', 'Kerudung Ramora 4', 'KTG008', 'Bergo', 36, 20000, 40000, 'gambar_barang/kerudung_bergo_ramora4_40rb.jpg'),
('BRG060', 'Kerudung Ramora 5', 'KTG008', 'Bergo', 36, 20000, 40000, 'gambar_barang/kerudung_bergo_ramora5_40rb.jpg'),
('BRG061', 'Kerudung Khimar 1', 'KTG008', 'Nameera', 48, 20000, 40000, 'gambar_barang/kerudung_khimar_namira1_40rb.jpg'),
('BRG062', 'Kerudung Khimar 2', 'KTG008', 'Nameera', 48, 20000, 40000, 'gambar_barang/kerudung_khimar_namira2_40rb.jpg'),
('BRG063', 'Kerudung Khimar 3', 'KTG008', 'Nameera', 48, 20000, 40000, 'gambar_barang/kerudung_khimar_namira3_40rb.jpg'),
('BRG064', 'Kerudung Khimar 4', 'KTG008', 'Nameera', 48, 20000, 40000, 'gambar_barang/kerudung_khimar_namira4_40rb.jpg'),
('BRG065', 'Kerudung Khimar 5', 'KTG008', 'Nameera', 48, 20000, 40000, 'gambar_barang/kerudung_khimar_namira5_40rb.jpg'),
('BRG066', 'Kerudung Khimar 6', 'KTG008', 'Nameera', 48, 20000, 40000, 'gambar_barang/kerudung_khimar_namira6_40rb.jpg'),
('BRG067', 'Kerudung Khimar 7', 'KTG008', 'Nameera', 48, 16000, 25000, 'gambar_barang/kerudung_khimar_per_kriwil_25rb.jpg'),
('BRG068', 'Kerudung Khimar 8', 'KTG008', 'Nameera', 48, 20000, 35000, 'gambar_barang/kerudung_khimar_polos1_35rb.jpg'),
('BRG069', 'Kerudung Khimar 10', 'KTG008', 'Nameera', 48, 20000, 35000, 'gambar_barang/kerudung_khimar_polos2_35rb.jpg'),
('BRG070', 'Kerudung rabani 1', 'KTG008', 'Nameera', 24, 16000, 25000, 'gambar_barang/kerudung_rabani1_25rb.jpg'),
('BRG071', 'Kerudung Rabani 2', 'KTG008', 'Nameera', 24, 16000, 25000, 'gambar_barang/kerudung_rabani2_25rb.jpg'),
('BRG072', 'Kerudung Assania 1', 'KTG008', 'Arabia', 24, 10000, 17000, 'gambar_barang/kerudung_saudi_assania_17rb.jpg'),
('BRG073', 'Kerudung Persegi 1', 'KTG008', 'Arabia', 24, 15000, 30000, 'gambar_barang/kerudung_segi_empat_gerigi_mutiara_30rb.jpg'),
('BRG074', 'Kerudung Sifon 1', 'KTG008', 'Arabia', 36, 10000, 20000, 'gambar_barang/kerudung_sifon_20rb.jpg'),
('BRG075', 'Kerudung Silk 1', 'KTG008', 'Arabia', 24, 15000, 30000, 'gambar_barang/kerudung_silk_motif1_30rb.jpg'),
('BRG076', 'Kerudung Silk 2', 'KTG008', 'Arabia', 23, 15000, 30000, 'gambar_barang/kerudung_silk_motif2_30rb.jpg'),
('BRG077', 'Rok Plisket 1', 'KTG009', 'Difa', 36, 20000, 35000, 'gambar_barang/rok_plisket1_35rb.jpg'),
('BRG078', 'Rok Plisket 2', 'KTG009', 'Difa', 36, 20000, 35000, 'gambar_barang/rok_plisket2_35rb.jpg'),
('BRG079', 'Rok Plisket 3', 'KTG009', 'Difa', 34, 20000, 35000, 'gambar_barang/rok_plisket3_35rb.jpg');

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
('DTL001', 'TRS010', 'BRG025', 60000, '2019-01-13 13:20:57', 3, 'agung', 1),
('DTL002', 'TRS014', 'BRG079', 35000, '2019-01-13 15:29:29', 2, 'agung', 1);

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
('DTO001', 'TRS008', 'BRG014', 25000, '2018-12-17 06:36:04', 2, 'MBR003', 1),
('DTO002', 'TRS008', 'BRG015', 25000, '2018-12-17 06:36:11', 3, 'MBR003', 1),
('DTO003', 'TRS008', 'BRG076', 30000, '2018-12-17 06:36:12', 1, 'MBR003', 1),
('DTO004', 'TRS009', 'BRG007', 20000, '2018-12-19 00:15:15', 3, 'MBR003', 1),
('DTO005', 'TRS009', 'BRG008', 20000, '2018-12-19 00:15:17', 3, 'MBR003', 1),
('DTO006', 'TRS011', 'BRG006', 20000, '2019-01-13 13:44:37', 2, 'MBR003', 1),
('DTO007', 'TRS011', 'BRG007', 20000, '2019-01-13 13:44:39', 3, 'MBR003', 1),
('DTO008', 'TRS011', 'BRG008', 20000, '2019-01-13 13:44:41', 1, 'MBR003', 1),
('DTO009', 'TRS012', 'BRG006', 20000, '2019-01-13 13:53:58', 4, 'MBR003', 1),
('DTO010', 'TRS013', 'BRG023', 25000, '2019-01-13 13:55:56', 3, 'MBR003', 1),
('DTO011', 'TRS015', 'BRG029', 35000, '2019-01-13 15:52:06', 5, 'MBR003', 1);

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
('PMB001', 'ORD008', 'BRG001', 30000, '2018-12-17 11:11:15', 24, 'Admin', 1, 'SPL001'),
('PMB002', 'ORD008', 'BRG006', 12000, '2018-12-17 11:13:00', 24, 'Admin', 1, 'SPL001'),
('PMB003', 'ORD008', 'BRG007', 12000, '2018-12-17 11:13:01', 24, 'Admin', 1, 'SPL001'),
('PMB004', 'ORD008', 'BRG008', 12000, '2018-12-17 11:13:02', 24, 'Admin', 1, 'SPL001'),
('PMB005', 'ORD008', 'BRG046', 10000, '2018-12-17 11:13:03', 36, 'Admin', 1, 'SPL001'),
('PMB006', 'ORD008', 'BRG025', 40000, '2018-12-17 11:13:05', 24, 'Admin', 1, 'SPL001'),
('PMB007', 'ORD008', 'BRG002', 10000, '2018-12-17 11:13:06', 36, 'Admin', 1, 'SPL001'),
('PMB008', 'ORD008', 'BRG003', 10000, '2018-12-17 11:13:08', 36, 'Admin', 1, 'SPL001'),
('PMB009', 'ORD008', 'BRG004', 10000, '2018-12-17 11:13:12', 36, 'Admin', 1, 'SPL001'),
('PMB010', 'ORD008', 'BRG005', 10000, '2018-12-17 11:13:13', 36, 'Admin', 1, 'SPL001'),
('PMB011', 'ORD008', 'BRG018', 45000, '2018-12-17 11:14:32', 24, 'Admin', 1, 'SPL003'),
('PMB012', 'ORD008', 'BRG019', 45000, '2018-12-17 11:14:33', 24, 'Admin', 1, 'SPL003'),
('PMB014', 'ORD008', 'BRG021', 45000, '2018-12-17 11:14:35', 24, 'Admin', 1, 'SPL003'),
('PMB015', 'ORD008', 'BRG022', 40000, '2018-12-17 11:14:36', 12, 'Admin', 1, 'SPL003'),
('PMB016', 'ORD008', 'BRG023', 15000, '2018-12-17 11:14:37', 24, 'Admin', 1, 'SPL003'),
('PMB017', 'ORD008', 'BRG024', 20000, '2018-12-17 11:14:39', 36, 'Admin', 1, 'SPL003'),
('PMB018', 'ORD008', 'BRG026', 70000, '2018-12-17 11:15:27', 36, 'Admin', 1, 'SPL003'),
('PMB019', 'ORD008', 'BRG027', 20000, '2018-12-17 11:15:28', 36, 'Admin', 1, 'SPL003'),
('PMB020', 'ORD008', 'BRG028', 20000, '2018-12-17 11:15:29', 24, 'Admin', 1, 'SPL003'),
('PMB021', 'ORD008', 'BRG029', 20000, '2018-12-17 11:15:30', 24, 'Admin', 1, 'SPL003'),
('PMB022', 'ORD008', 'BRG030', 20000, '2018-12-17 11:15:31', 24, 'Admin', 1, 'SPL003'),
('PMB023', 'ORD008', 'BRG031', 45000, '2018-12-17 11:16:40', 48, 'Admin', 1, 'SPL005'),
('PMB024', 'ORD008', 'BRG032', 45000, '2018-12-17 11:16:41', 48, 'Admin', 1, 'SPL005'),
('PMB025', 'ORD008', 'BRG033', 45000, '2018-12-17 11:16:42', 48, 'Admin', 1, 'SPL005'),
('PMB026', 'ORD008', 'BRG034', 45000, '2018-12-17 11:16:42', 24, 'Admin', 1, 'SPL005'),
('PMB027', 'ORD008', 'BRG035', 45000, '2018-12-17 11:16:43', 24, 'Admin', 1, 'SPL005'),
('PMB028', 'ORD008', 'BRG036', 45000, '2018-12-17 11:16:44', 24, 'Admin', 1, 'SPL005'),
('PMB029', 'ORD008', 'BRG037', 45000, '2018-12-17 11:16:45', 24, 'Admin', 1, 'SPL005'),
('PMB030', 'ORD008', 'BRG038', 45000, '2018-12-17 11:16:46', 24, 'Admin', 1, 'SPL005'),
('PMB031', 'ORD008', 'BRG039', 55000, '2018-12-17 11:17:48', 12, 'Admin', 1, 'SPL003'),
('PMB032', 'ORD008', 'BRG040', 50000, '2018-12-17 11:17:49', 12, 'Admin', 1, 'SPL003'),
('PMB033', 'ORD008', 'BRG017', 12000, '2018-12-17 11:17:50', 24, 'Admin', 1, 'SPL003'),
('PMB034', 'ORD008', 'BRG041', 35000, '2018-12-17 11:17:51', 12, 'Admin', 1, 'SPL003'),
('PMB035', 'ORD008', 'BRG042', 35000, '2018-12-17 11:17:52', 12, 'Admin', 1, 'SPL003'),
('PMB036', 'ORD008', 'BRG043', 35000, '2018-12-17 11:17:52', 24, 'Admin', 1, 'SPL003'),
('PMB037', 'ORD008', 'BRG044', 35000, '2018-12-17 11:17:53', 24, 'Admin', 1, 'SPL003'),
('PMB038', 'ORD008', 'BRG009', 10000, '2018-12-17 11:18:27', 12, 'Admin', 1, 'SPL001'),
('PMB039', 'ORD008', 'BRG010', 10000, '2018-12-17 11:18:27', 12, 'Admin', 1, 'SPL001'),
('PMB040', 'ORD008', 'BRG011', 10000, '2018-12-17 11:18:28', 12, 'Admin', 1, 'SPL001'),
('PMB041', 'ORD008', 'BRG012', 10000, '2018-12-17 11:18:29', 12, 'Admin', 1, 'SPL001'),
('PMB042', 'ORD008', 'BRG013', 10000, '2018-12-17 11:18:32', 12, 'Admin', 1, 'SPL001'),
('PMB043', 'ORD008', 'BRG045', 10000, '2018-12-17 11:19:36', 12, 'Admin', 1, 'SPL003'),
('PMB044', 'ORD008', 'BRG047', 10000, '2018-12-17 11:19:36', 12, 'Admin', 1, 'SPL003'),
('PMB045', 'ORD008', 'BRG048', 10000, '2018-12-17 11:19:38', 12, 'Admin', 1, 'SPL003'),
('PMB046', 'ORD008', 'BRG049', 10000, '2018-12-17 11:19:38', 12, 'Admin', 1, 'SPL003'),
('PMB047', 'ORD008', 'BRG050', 10000, '2018-12-17 11:19:39', 12, 'Admin', 1, 'SPL003'),
('PMB048', 'ORD008', 'BRG051', 10000, '2018-12-17 11:19:40', 12, 'Admin', 1, 'SPL003'),
('PMB049', 'ORD008', 'BRG052', 10000, '2018-12-17 11:19:41', 12, 'Admin', 1, 'SPL003'),
('PMB050', 'ORD008', 'BRG053', 15000, '2018-12-17 11:19:42', 12, 'Admin', 1, 'SPL003'),
('PMB051', 'ORD008', 'BRG054', 18000, '2018-12-17 11:19:48', 12, 'Admin', 1, 'SPL003'),
('PMB052', 'ORD008', 'BRG055', 18000, '2018-12-17 11:19:49', 12, 'Admin', 1, 'SPL003'),
('PMB053', 'ORD008', 'BRG056', 20000, '2018-12-17 11:19:50', 37, 'Admin', 1, 'SPL001'),
('PMB054', 'ORD008', 'BRG057', 20000, '2018-12-17 11:20:50', 36, 'Admin', 1, 'SPL007'),
('PMB055', 'ORD008', 'BRG058', 20000, '2018-12-17 11:20:51', 36, 'Admin', 1, 'SPL007'),
('PMB056', 'ORD008', 'BRG059', 20000, '2018-12-17 11:20:52', 36, 'Admin', 1, 'SPL007'),
('PMB057', 'ORD008', 'BRG060', 20000, '2018-12-17 11:20:53', 36, 'Admin', 1, 'SPL007'),
('PMB058', 'ORD008', 'BRG061', 20000, '2018-12-17 11:22:29', 48, 'Admin', 1, 'SPL004'),
('PMB059', 'ORD008', 'BRG062', 20000, '2018-12-17 11:22:30', 48, 'Admin', 1, 'SPL004'),
('PMB060', 'ORD008', 'BRG063', 20000, '2018-12-17 11:22:31', 48, 'Admin', 1, 'SPL004'),
('PMB061', 'ORD008', 'BRG064', 20000, '2018-12-17 11:22:32', 48, 'Admin', 1, 'SPL004'),
('PMB062', 'ORD008', 'BRG065', 20000, '2018-12-17 11:22:33', 48, 'Admin', 1, 'SPL004'),
('PMB063', 'ORD008', 'BRG066', 20000, '2018-12-17 11:22:34', 48, 'Admin', 1, 'SPL004'),
('PMB064', 'ORD008', 'BRG067', 16000, '2018-12-17 11:22:35', 48, 'Admin', 1, 'SPL004'),
('PMB065', 'ORD008', 'BRG068', 20000, '2018-12-17 11:22:36', 48, 'Admin', 1, 'SPL004'),
('PMB066', 'ORD008', 'BRG069', 20000, '2018-12-17 11:22:37', 48, 'Admin', 1, 'SPL004'),
('PMB067', 'ORD008', 'BRG070', 16000, '2018-12-17 11:24:16', 24, 'Admin', 1, 'SPL005'),
('PMB068', 'ORD008', 'BRG071', 16000, '2018-12-17 11:24:17', 24, 'Admin', 1, 'SPL005'),
('PMB069', 'ORD008', 'BRG072', 10000, '2018-12-17 11:24:18', 24, 'Admin', 1, 'SPL005'),
('PMB070', 'ORD008', 'BRG073', 15000, '2018-12-17 11:24:19', 24, 'Admin', 1, 'SPL007'),
('PMB071', 'ORD008', 'BRG074', 10000, '2018-12-17 11:24:20', 36, 'Admin', 1, 'SPL007'),
('PMB072', 'ORD008', 'BRG075', 15000, '2018-12-17 11:24:21', 24, 'Admin', 1, 'SPL007'),
('PMB073', 'ORD008', 'BRG076', 15000, '2018-12-17 11:24:22', 24, 'Admin', 1, 'SPL007'),
('PMB074', 'ORD008', 'BRG014', 15000, '2018-12-17 11:24:43', 24, 'Admin', 1, 'SPL001'),
('PMB075', 'ORD008', 'BRG015', 15000, '2018-12-17 11:24:57', 24, 'Admin', 1, 'SPL002'),
('PMB076', 'ORD008', 'BRG016', 15000, '2018-12-17 11:24:57', 24, 'Admin', 1, 'SPL002'),
('PMB077', 'ORD008', 'BRG077', 20000, '2018-12-17 11:25:22', 36, 'Admin', 1, 'SPL006'),
('PMB078', 'ORD008', 'BRG078', 20000, '2018-12-17 11:25:23', 36, 'Admin', 1, 'SPL006'),
('PMB079', 'ORD008', 'BRG079', 20000, '2018-12-17 11:25:24', 36, 'Admin', 1, 'SPL006');

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
('KRY001', 'agung', 'Jogja', 'Superadmin', 'L', '6287830517727', 1),
('KRY002', 'syukron', 'pekalongan', 'Admin', 'L', '087830517727', 0);

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
('KTG001', 'Baju Anak'),
('KTG012', 'Baju Dewasa'),
('KTG002', 'Celana Anak'),
('KTG010', 'Celana Dewasa'),
('KTG006', 'Gamis Dewasa'),
('KTG003', 'Hijab Anak'),
('KTG011', 'Jaket Dewasa'),
('KTG004', 'Kaos Anak'),
('KTG007', 'Kaos Dewasa'),
('KTG008', 'Kerudung dewasa'),
('KTG005', 'Rok Anak'),
('KTG009', 'Rok Dewasa');

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
('MBR003', 'syukron', 'pekalongan', '087830517727', 'L', 'zukronthanks@gmail.com', '5814eb401e456b09fb3cadb5f47bd75c', 'siapa anda', 'aku');

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
('ORD006', '2018-12-13 19:26:50', 12000000),
('ORD007', '2018-12-17 11:10:11', 0),
('ORD008', '2018-12-17 11:25:40', 50660000);

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
('SPL001', 'Diana Collection', 'Pekalongan', '087804029040'),
('SPL002', 'Tutu Collecton', 'Semarang', '085772536525'),
('SPL003', 'Adifa', 'Pekalongan', '081222242683'),
('SPL004', 'Nameera', 'Batang', '082242300032'),
('SPL005', 'Almira', 'Pekalongan', '085786768700'),
('SPL006', 'Rizqi Fashion', 'Batang', '085726032267'),
('SPL007', 'Aisyah Fashion', 'Pekalongan', '087764218580');

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
('TRS007', '2018-12-13 19:30:26', 5500000, 'online', 0, NULL),
('TRS008', '2018-12-17 13:36:26', 155000, 'online', 1, 'bukti_transaksi/3.PNG'),
('TRS009', '2018-12-19 07:18:14', 120000, 'online', 1, 'bukti_transaksi/1.PNG'),
('TRS010', '2019-01-13 20:21:12', 180000, 'offline', 1, NULL),
('TRS011', '2019-01-13 20:44:52', 120000, 'online', 1, 'bukti_transaksi/2.PNG'),
('TRS012', '2019-01-13 20:54:05', 80000, 'online', 1, 'bukti_transaksi/3.PNG'),
('TRS013', '2019-01-13 20:56:35', 75000, 'online', 1, 'bukti_transaksi/4.PNG'),
('TRS014', '2019-01-13 22:29:32', 70000, 'offline', 1, NULL),
('TRS015', '2019-01-13 22:52:33', 175000, 'online', 1, 'bukti_transaksi/12.PNG');

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
('ndaru21', NULL, '0819290c9e0696b715ccc89937cd7dc1', 'apa', 'aja'),
('syukron', 'KRY002', '078d3c86c96c577439741e8470ff115d', 'a', 'b');

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

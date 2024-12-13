-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 05:16 PM
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
-- Database: `db_sampah_4`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `bank_id`, `admin_email`, `admin_password`, `created_at`, `updated_at`) VALUES
(10, 1, 'admin1@gmail.com', '$2y$10$nPNhrsUEU.Oz/YFy9zS/veivHhRtAiIyyeYLG9StHGzQQun2EVP/K', '2024-11-29 11:51:53', '2024-11-29 11:51:53'),
(11, 11, 'admin2@gmail.com', '$2y$10$6uwWXTZGTIJYKN0KQMw6Mu.mTcUBx/KXTOYj85f6hd6h/yB/X5iZO', '2024-12-04 16:54:48', '2024-12-04 16:54:48'),
(12, 21, 'admin3@gmail.com', '$2y$10$Ms8thMfH2t4QylKKnwlwIeC5/i5574Iw2cT7/KX4bi5pv5sI6PflK', '2024-12-04 16:55:23', '2024-12-04 16:55:23'),
(13, 31, 'admin4@gmail.com', '$2y$10$7NXPMMb1itDf2c7c4uKUzerm5frclhNqbkc4RdO.VZKyVSoJ/0Gly', '2024-12-04 16:55:49', '2024-12-04 16:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `bank_locations`
--

CREATE TABLE `bank_locations` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `bank_operating_hours` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `jam_buka_bank_sampah` time DEFAULT NULL,
  `jam_tutup_bank_sampah` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_locations`
--

INSERT INTO `bank_locations` (`bank_id`, `bank_name`, `bank_address`, `bank_operating_hours`, `region`, `kecamatan`, `kelurahan`, `jam_buka_bank_sampah`, `jam_tutup_bank_sampah`) VALUES
(1, 'CAMELIA RW. 14', 'Jl. Rawa Kedaung Rt. 006 014', '01:08 - 01:08', 'Jakarta Barat', 'Cengkareng', 'Cengkareng Timur', '01:08:00', '01:08:00'),
(2, 'SDN Jelambar Baru 05', 'Jl. Jelambar Selatan XVI No.14 RT.01 09', '08.00 - 17.00', 'Jakarta Barat', 'Grogol Petamburan', 'Jelambar baru', '08:00:00', '17:00:00'),
(3, 'Bs. Tawakal Jaya RW 09', 'Jl. Tawakal 10 a No.1 RT. 01 09', '08.00 - 17.00', 'Jakarta Barat', 'Grogol Petamburan', 'Tomang', '08:00:00', '17:00:00'),
(4, 'Wijaya Mandiri Kel. Wijaya Kusuma', 'Jl. Wijaya Kusuma II No. 2 Rt. 05 05', '08.00 - 17.00', 'Jakarta Barat', 'Grogol Petamburan', 'Wijaya kusuma', '08:00:00', '17:00:00'),
(5, 'BS RSUD Kalideres', 'Jl. Satu Maret', '08.00 - 17.00', 'Jakarta Barat', 'Kalideres', 'Pegadungan', '08:00:00', '17:00:00'),
(6, 'Mawar Garden', 'Jl. Komp. Green Garden Blok C2 No.12 RT 09 RW 03 Kedoya Utara', '08.00 - 17.00', 'Jakarta Barat', 'Kebon Jeruk', 'Kedoya Utara', '08:00:00', '17:00:00'),
(7, 'Benyamin RW 02', 'Jl. Sasak II RT 06 RW 02 Kelapa Dua', '08.00 - 17.00', 'Jakarta Barat', 'Kebon Jeruk', 'Kelapa Dua', '08:00:00', '17:00:00'),
(8, 'Bank Sampah SMPN 88', 'Jl Anggrek Garuda', '08.00 - 17.00', 'Jakarta Barat', 'Palmerah', 'Kemanggisan', '08:00:00', '17:00:00'),
(9, 'USMAN Usaha Mandiri Kel.Jembes', 'Jl. Jembatan Besi VII', '08.00 - 17.00', 'Jakarta Barat', 'Tambora', 'Jembatan Besi', '08:00:00', '17:00:00'),
(10, 'RW 09 Kalianyar', 'JL. Kalianyar', '08.00 - 17.00', 'Jakarta Barat', 'Tambora', 'Kalianyar', '08:00:00', '17:00:00'),
(11, 'Melati Pasar Gembrong', 'Jl. Pangkalan Asem Raya RT.008 02', '08.00 - 17.00', 'Jakarta Pusat', 'Cempaka Putih', 'Cempaka Putih Barat', '08:00:00', '17:00:00'),
(12, 'Bougenville', 'Jl. Cempaka I RT. 007 009 No. 21', '08.00 - 17.00', 'Jakarta Pusat', 'Cempaka Putih', 'Cempaka Putih Barat', '08:00:00', '17:00:00'),
(13, 'Cempaka Abadi Sapel', 'Komp. Perkantoran Rawakerbau Rawasari Selatan', '08.00 - 17.00', 'Jakarta Pusat', 'Cempaka Putih', 'Cempaka Putih Timur', '08:00:00', '17:00:00'),
(14, 'Pucuk Merah', 'Jl. Cempaka Putih Timur', '08.00 - 17.00', 'Jakarta Pusat', 'Cempaka Putih', 'Cempaka Putih Timur', '08:00:00', '17:00:00'),
(15, 'Lagura 18 RT 018 RW 03', 'Jl. Cempaka Putih Timur XVII', '08.00 - 17.00', 'Jakarta Pusat', 'Cempaka Putih', 'Cempaka Putih Timur', '08:00:00', '17:00:00'),
(16, 'Baper Seven', 'Jl. Rawasari Barat', '08.00 - 17.00', 'Jakarta Pusat', 'Cempaka Putih', 'Cempaka Putih Timur', '08:00:00', '17:00:00'),
(17, 'Cempaka RT 09 RW 03', 'Jl. Cempaka Putih Timur XVII', '08.00 - 17.00', 'Jakarta Pusat', 'Cempaka Putih', 'Cempaka Putih Timur', '08:00:00', '17:00:00'),
(18, 'SMK 02', 'Jl. Batu NO 3', '08.00 - 17.00', 'Jakarta Pusat', 'Gambir', 'Gambir', '08:00:00', '17:00:00'),
(19, 'Rw.08', 'Jl. Karnolog 1', '08.00 - 17.00', 'Jakarta Pusat', 'Senen', 'Kenari', '08:00:00', '17:00:00'),
(20, 'Green Pandawa SMKN 19', 'Jl. Danau Limboto No 11', '08.00 - 17.00', 'Jakarta Pusat', 'Tanah Abang', 'Bendungan Hilir', '08:00:00', '17:00:00'),
(21, 'SMKN 41 Jakarta', 'Jl. Komp. Timah RT.001 003', '08.00 - 17.00', 'Jakarta Selatan', 'Cilandak', 'Pondok Labu', '08:00:00', '17:00:00'),
(22, 'Nusa Indah', 'Jl. Makmur Rt. 03 03', '08.00 - 17.00', 'Jakarta Selatan', 'Kebayoran Lama', 'Keb.Lama Utara', '08:00:00', '17:00:00'),
(23, 'Pinang Indah RW 04', 'Jl. H. Muhni RW. 04 Kel. Pondok Pinang RPTRA', '08.00 - 17.00', 'Jakarta Selatan', 'Kebayoran Lama', 'Pondok Pinang', '08:00:00', '17:00:00'),
(24, 'SDN. Duren 05 Pagi', 'Jl. Guru Alip Minyak 1 No, 40 RT.005 006', '08.00 - 17.00', 'Jakarta Selatan', 'Pancoran', 'Duren Tiga', '08:00:00', '17:00:00'),
(25, 'Kantr. Kec. Pasar Minggu', 'Jl. Ragunan No. 16', '08.00 - 17.00', 'Jakarta Selatan', 'Pasar Minggu', 'Jati Padang', '08:00:00', '17:00:00'),
(26, 'Kecamatan Pesanggrahan', 'Jl. Pesanggrahan Indah', '08.00 - 17.00', 'Jakarta Selatan', 'Pesanggrahan', 'Pesanggrahan', '08:00:00', '17:00:00'),
(27, 'Adira Finance', 'Jl. Jend. Sudirman', '08.00 - 17.00', 'Jakarta Selatan', 'Setiabudi', 'Karet Kuningan', '08:00:00', '17:00:00'),
(28, 'Setia 21 PPSU', 'Jl. Setiabudi BaratNo.8L RT 003 003', '08.00 - 17.00', 'Jakarta Selatan', 'Setiabudi', 'Setiabudi', '08:00:00', '17:00:00'),
(29, 'MARSELA 07 RW.07', 'Jl. Rambutan RT.03 RW.07', '08.00 - 17.00', 'Jakarta Selatan', 'Tebet', 'Manggarai Selatan', '08:00:00', '17:00:00'),
(30, 'Puskesmas Kec. Tebet', 'Jl. Tebet Timur IIA No. 2 RT 006 002', '08.00 - 17.00', 'Jakarta Selatan', 'Tebet', 'Tebet Timur', '08:00:00', '17:00:00'),
(31, 'Berkah Srikandi Rw. 01', 'Jl. Balai Rakyat III Rt. 013 Rw. 01', '08.00 - 17.00', 'Jakarta Timur', 'Duren Sawit', 'Pondok Bambu', '08:00:00', '17:00:00'),
(32, 'Rw.13 Bidara Cina', 'Jl. Asrama Polri RT 01 RW 13', '08.00 - 17.00', 'Jakarta Timur', 'Jatinegara', 'Bidara Cina', '08:00:00', '17:00:00'),
(33, 'Rw.02 Melati', 'Jl. Pangeran RT 003 002 Kel. Balekambang', '08.00 - 17.00', 'Jakarta Timur', 'Kramat Jati', 'Balekambang', '08:00:00', '17:00:00'),
(34, 'Bina Bersih', 'Jl. gading Rt 02 Rw 01', '08.00 - 17.00', 'Jakarta Timur', 'Kramat Jati', 'Kramat Jati', '08:00:00', '17:00:00'),
(35, 'RW 03 Kebon Manggis', 'Jl. Kesatriaan IX RT.17 RW.3', '08.00 - 17.00', 'Jakarta Timur', 'Matraman', 'Kebon Manggis', '08:00:00', '17:00:00'),
(36, 'Kasela Dipo Utan Kayu Selatan', 'Jl. Galur Sari Timur RT.13 RW.1', '08.00 - 17.00', 'Jakarta Timur', 'Matraman', 'Utan Kayu Selatan', '08:00:00', '17:00:00'),
(37, 'Kenanga', 'Lapangan Porpamas RT.7 RW.7', '08.00 - 17.00', 'Jakarta Timur', 'Matraman', 'Utan Kayu Selatan', '08:00:00', '17:00:00'),
(38, 'Matahari Rw 09 Pulogadung', 'Jl. Kayu Mas Utara', '08.00 - 17.00', 'Jakarta Timur', 'Pulogadung', 'Pulogadung', '08:00:00', '17:00:00'),
(39, 'Rw 01 Pulo Gadung', 'Jl. Perintis Kemerdekaan Rt 003 004', '08.00 - 17.00', 'Jakarta Timur', 'Pulogadung', 'Pulo Gadung', '08:00:00', '17:00:00'),
(40, 'Rw 08 Rawamangun\r\n', 'Jl. Pinang Raya RT 04 RW 08', '08.00 - 17.00', 'Jakarta Timur', 'Pulogadung', 'Rawamangun', '08:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `detail_request`
--

CREATE TABLE `detail_request` (
  `detail_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `waste_id` int(11) NOT NULL,
  `waste_weight` float NOT NULL,
  `points_earned` int(11) DEFAULT NULL,
  `detail_request_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_request`
--

INSERT INTO `detail_request` (`detail_id`, `request_id`, `waste_id`, `waste_weight`, `points_earned`, `detail_request_updated_at`) VALUES
(3, 2, 3, 3, 24, '0000-00-00 00:00:00'),
(4, 2, 4, 5, 50, '0000-00-00 00:00:00'),
(5, 3, 4, 5, 50, '0000-00-00 00:00:00'),
(6, 4, 4, 1, 10, '0000-00-00 00:00:00'),
(7, 4, 5, 2, 10, '0000-00-00 00:00:00'),
(8, 5, 4, 1, 10, '0000-00-00 00:00:00'),
(9, 5, 3, 1, 8, '0000-00-00 00:00:00'),
(10, 6, 4, 1, 10, '0000-00-00 00:00:00'),
(11, 6, 5, 1, 5, '0000-00-00 00:00:00'),
(12, 7, 5, 2, 10, '0000-00-00 00:00:00'),
(13, 7, 4, 1, 10, '0000-00-00 00:00:00'),
(14, 8, 3, 1, 8, '0000-00-00 00:00:00'),
(15, 8, 4, 1, 10, '0000-00-00 00:00:00'),
(16, 9, 4, 10, 150, '0000-00-00 00:00:00'),
(17, 9, 5, 10, 50, '0000-00-00 00:00:00'),
(18, 9, 3, 10, 50, '0000-00-00 00:00:00'),
(19, 10, 4, 100, 1500, '0000-00-00 00:00:00'),
(20, 11, 5, 100, 500, '0000-00-00 00:00:00'),
(21, 12, 5, 1, 5, '0000-00-00 00:00:00'),
(22, 12, 4, 1, 15, '0000-00-00 00:00:00'),
(23, 13, 4, 10, 150, '0000-00-00 00:00:00');

--
-- Triggers `detail_request`
--
DELIMITER $$
CREATE TRIGGER `calculate_points_earned` BEFORE INSERT ON `detail_request` FOR EACH ROW BEGIN
    DECLARE calculated_points INT;

    -- Hitung points berdasarkan perkalian antara weight di detail_request dan point di waste
    SET calculated_points = NEW.waste_weight * (SELECT waste_point FROM waste WHERE waste_id = NEW.waste_id LIMIT 1);

    -- Set points_earned langsung di NEW, yang akan digunakan untuk insert
    SET NEW.points_earned = calculated_points;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_total_points` AFTER INSERT ON `detail_request` FOR EACH ROW BEGIN
    DECLARE total_points INT;

    -- Hitung total points untuk request_id yang baru saja dimasukkan
    SELECT COALESCE(SUM(points_earned), 0) INTO total_points
    FROM detail_request
    WHERE request_id = NEW.request_id;

    -- Update total_points pada tabel users berdasarkan user_id
    UPDATE users
    SET user_total_points = user_total_points + NEW.points_earned
    WHERE user_id = (
        SELECT user_id
        FROM drop_off_request
        WHERE request_id = NEW.request_id
        LIMIT 1
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `drop_off_request`
--

CREATE TABLE `drop_off_request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `status` enum('waiting','accepted','rejected') NOT NULL DEFAULT 'waiting',
  `drop_off_request_created_at` datetime DEFAULT current_timestamp(),
  `drop_off_request_updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drop_off_request`
--

INSERT INTO `drop_off_request` (`request_id`, `user_id`, `bank_id`, `status`, `drop_off_request_created_at`, `drop_off_request_updated_at`) VALUES
(2, 8, 1, 'accepted', '2024-12-09 12:25:37', '2024-12-09 12:25:37'),
(3, 8, 1, 'accepted', '2024-12-09 12:48:21', '2024-12-09 12:48:21'),
(4, 8, 1, 'accepted', '2024-12-09 12:49:53', '2024-12-09 12:49:53'),
(5, 7, 1, 'accepted', '2024-12-09 20:52:55', '2024-12-09 20:52:55'),
(6, 7, 1, 'accepted', '2024-12-09 20:54:13', '2024-12-09 20:54:13'),
(7, 8, 1, 'accepted', '2024-12-09 20:58:23', '2024-12-09 20:58:23'),
(8, 8, 1, 'accepted', '2024-12-09 21:37:48', '2024-12-09 21:37:48'),
(9, 8, 1, 'accepted', '2024-12-10 19:02:10', '2024-12-10 19:02:10'),
(10, 8, 11, 'accepted', '2024-12-10 21:06:30', '2024-12-10 21:06:30'),
(11, 8, 1, 'accepted', '2024-12-10 23:08:59', '2024-12-10 23:08:59'),
(12, 8, 1, 'accepted', '2024-12-10 23:09:43', '2024-12-10 23:09:43'),
(13, 8, 1, 'accepted', '2024-12-10 23:10:27', '2024-12-10 23:10:27');

--
-- Triggers `drop_off_request`
--
DELIMITER $$
CREATE TRIGGER `prevent_rejected_update` BEFORE UPDATE ON `drop_off_request` FOR EACH ROW BEGIN
    -- Jika status sebelumnya 'rejected', cegah perubahan
    IF OLD.status = 'rejected' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Status cannot be updated once rejected';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace`
--

CREATE TABLE `marketplace` (
  `marketplace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `marketplace_product_name` varchar(255) DEFAULT NULL,
  `marketplace_description` text DEFAULT NULL,
  `marketplace_price` float DEFAULT NULL,
  `marketplace_stock` int(11) DEFAULT NULL,
  `marketplace_image` varchar(255) DEFAULT NULL,
  `marketplace_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `marketplace_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marketplace`
--

INSERT INTO `marketplace` (`marketplace_id`, `user_id`, `marketplace_product_name`, `marketplace_description`, `marketplace_price`, `marketplace_stock`, `marketplace_image`, `marketplace_created_at`, `marketplace_updated_at`) VALUES
(1, 7, 'coba', 'coba', 1, 1, '67506a764b6d1_lestari.jpeg', '2024-12-04 14:43:02', '2024-12-04 14:43:02'),
(2, 7, 'coba lagi', 'coba coba lagi', 1, 1, '67506c1645b49_3.png', '2024-12-04 14:49:58', '2024-12-04 14:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `code_otp` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `redeem`
--

CREATE TABLE `redeem` (
  `redeem_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reward_id` int(11) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bank_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `redeem`
--

INSERT INTO `redeem` (`redeem_id`, `user_id`, `reward_id`, `status`, `created_at`, `updated_at`, `bank_id`) VALUES
(58, 8, 11, 'approved', '2024-12-10 14:26:50', '2024-12-10 16:01:07', 1),
(59, 8, 11, 'approved', '2024-12-10 14:26:56', '2024-12-10 16:01:09', 1),
(60, 8, 8, 'approved', '2024-12-10 15:58:19', '2024-12-10 16:01:11', 1),
(61, 8, 8, 'approved', '2024-12-10 16:11:02', '2024-12-10 16:11:13', 1),
(62, 8, 11, 'approved', '2024-12-10 16:11:45', '2024-12-10 16:14:41', 1),
(63, 8, 11, 'approved', '2024-12-10 16:13:49', '2024-12-10 16:14:39', 1),
(64, 8, 11, 'approved', '2024-12-10 16:14:25', '2024-12-10 16:14:38', 1);

--
-- Triggers `redeem`
--
DELIMITER $$
CREATE TRIGGER `decrease_reward_stock_after_redeem` AFTER INSERT ON `redeem` FOR EACH ROW BEGIN
    -- Cek apakah reward ini sudah diredeem sebelumnya
    DECLARE existing_count INT;
    
    -- Hitung jumlah redeem untuk reward ini
    SELECT COUNT(*) INTO existing_count
    FROM redeem
    WHERE reward_id = NEW.reward_id;

    -- Kurangi stock hanya sekali per reward jika ini redeem pertama
    IF existing_count = 0 THEN
        UPDATE rewards
        SET stock = stock - 1
        WHERE reward_id = NEW.reward_id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_point_after_redeem` AFTER INSERT ON `redeem` FOR EACH ROW BEGIN
    DECLARE points_required INT;
    DECLARE current_points INT;

    -- Ambil reward_points_required dari tabel rewards berdasarkan reward_id yang ada di redeem_request
    SELECT reward_points_required
    INTO points_required
    FROM rewards
    WHERE reward_id = NEW.reward_id
    LIMIT 1;

    -- Pastikan reward_id valid
    IF points_required IS NOT NULL THEN
        -- Ambil total points pengguna saat ini
        SELECT user_total_points
        INTO current_points
        FROM users
        WHERE user_id = NEW.user_id
        LIMIT 1;

        -- Pastikan user memiliki cukup poin untuk redeem
        IF current_points >= points_required THEN
            -- Kurangi total points pengguna sesuai dengan reward_points_required
            UPDATE users
            SET user_total_points = user_total_points - points_required
            WHERE user_id = NEW.user_id;
        ELSE
            -- Jika poin tidak cukup, set total_points menjadi 0
            UPDATE users
            SET user_total_points = 0
            WHERE user_id = NEW.user_id;
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid reward_id';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `reward_id` int(11) NOT NULL,
  `reward_name` varchar(100) NOT NULL,
  `reward_image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `reward_points_required` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bank_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`reward_id`, `reward_name`, `reward_image`, `stock`, `reward_points_required`, `created_at`, `updated_at`, `bank_id`) VALUES
(8, 'Keranjang Anyaman', 'uploads/keranjang_piknik.jpeg', 1, 800, '2024-12-03 10:15:39', '2024-12-10 16:11:02', 1),
(9, 'Mangkok Kayu', 'uploads/mangkok.jpeg', 0, 600, '2024-12-03 10:22:15', '2024-12-10 12:33:01', 1),
(11, 'coba', 'uploads/—Pngtree—redeem_5396291.png', 3, 5, '2024-12-04 14:18:32', '2024-12-10 16:14:25', 1),
(12, 'coba lagi', 'uploads/—Pngtree—redeem_5396291.png', 0, 2, '2024-12-04 14:55:34', '2024-12-10 13:51:42', 1),
(15, 'baju', 'uploads/—Pngtree—redeem_5396291.png', 6, 80, '2024-12-10 04:18:15', '2024-12-10 14:08:08', 11),
(17, 'baju', 'uploads/—Pngtree—redeem_5396291.png', 0, 90, '2024-12-10 04:31:12', '2024-12-10 04:31:12', NULL),
(18, 'tas', 'uploads/—Pngtree—redeem_5396291.png', 9, 60, '2024-12-10 04:35:00', '2024-12-10 14:08:49', 11),
(21, 'baju2', 'uploads/bolehkahnangis.png', 85, 9, '2024-12-10 12:24:57', '2024-12-10 13:04:45', 1),
(22, 'tas', 'uploads/—Pngtree—redeem_5396291.png', 9, 5, '2024-12-10 14:16:21', '2024-12-10 14:16:40', 21),
(23, 'baju', 'uploads/—Pngtree—redeem_5396291.png', 8, 5, '2024-12-10 14:20:22', '2024-12-10 14:20:40', 31);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_phone_number` varchar(20) DEFAULT NULL,
  `user_total_points` int(11) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_phone_number`, `user_total_points`, `user_address`, `created_at`, `updated_at`) VALUES
(7, 'Adinda Cahya', 'user1@gmail.com', '$2y$10$H5KyOdSM2DoTLpkUBcJPn.PNnxdgc9EXqPbaktPyKrlg3NH4ydQei', '085750836090', 31, 'JL. Akasia', '2024-11-28 14:27:00', '2024-11-28 14:29:11'),
(8, 'Olivia Rodrigo', 'olivia@gmail.com', '$2y$10$po3vIkxAC7GIUsjepek1Becku53iwWTyMpwGbg2kw9dF73yqPDA22', '085643544102', 471, 'Jl. Tawakal 10 a No.1 RT. 01 09', '2024-09-03 01:41:08', '2024-12-03 14:49:42'),
(9, 'Louis Partride', 'louis@gmail.com', '$2y$10$y2BCyT9uD6DaR629aN62qeuWpzgAsdy0rv.0C.A5Fih6IAnS0vemm', '087863456765', 0, '	\r\nJl. Satu Maret', '2024-09-03 04:31:08', '2024-09-03 04:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `waste`
--

CREATE TABLE `waste` (
  `waste_id` int(11) NOT NULL,
  `waste_name` varchar(255) NOT NULL,
  `waste_point` int(11) NOT NULL,
  `waste_created_at` datetime NOT NULL,
  `waste_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waste`
--

INSERT INTO `waste` (`waste_id`, `waste_name`, `waste_point`, `waste_created_at`, `waste_updated_at`) VALUES
(3, 'Plastik', 5, '2024-11-27 13:22:43', '2024-11-27 13:22:43'),
(4, 'Logam', 15, '2024-11-27 13:23:08', '2024-11-27 13:23:08'),
(5, 'Kertas', 5, '2024-11-28 15:34:07', '2024-11-28 15:34:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `fk_admin_bank` (`bank_id`);

--
-- Indexes for table `bank_locations`
--
ALTER TABLE `bank_locations`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `detail_request`
--
ALTER TABLE `detail_request`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_request_id` (`request_id`),
  ADD KEY `fk_waste_id` (`waste_id`);

--
-- Indexes for table `drop_off_request`
--
ALTER TABLE `drop_off_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_bank_id` (`bank_id`),
  ADD KEY `fk_dropoff_user` (`user_id`);

--
-- Indexes for table `marketplace`
--
ALTER TABLE `marketplace`
  ADD PRIMARY KEY (`marketplace_id`),
  ADD KEY `fk_market_user` (`user_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `redeem`
--
ALTER TABLE `redeem`
  ADD PRIMARY KEY (`redeem_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reward_id` (`reward_id`),
  ADD KEY `fk_redeem_bank_id` (`bank_id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`reward_id`),
  ADD KEY `fk_rewards_bank_id` (`bank_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `waste`
--
ALTER TABLE `waste`
  ADD PRIMARY KEY (`waste_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bank_locations`
--
ALTER TABLE `bank_locations`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `detail_request`
--
ALTER TABLE `detail_request`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `drop_off_request`
--
ALTER TABLE `drop_off_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `marketplace`
--
ALTER TABLE `marketplace`
  MODIFY `marketplace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `redeem`
--
ALTER TABLE `redeem`
  MODIFY `redeem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `waste`
--
ALTER TABLE `waste`
  MODIFY `waste_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_bank` FOREIGN KEY (`bank_id`) REFERENCES `bank_locations` (`bank_id`);

--
-- Constraints for table `detail_request`
--
ALTER TABLE `detail_request`
  ADD CONSTRAINT `fk_request_id` FOREIGN KEY (`request_id`) REFERENCES `drop_off_request` (`request_id`),
  ADD CONSTRAINT `fk_waste_id` FOREIGN KEY (`waste_id`) REFERENCES `waste` (`waste_id`);

--
-- Constraints for table `drop_off_request`
--
ALTER TABLE `drop_off_request`
  ADD CONSTRAINT `fk_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank_locations` (`bank_id`),
  ADD CONSTRAINT `fk_dropoff_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marketplace`
--
ALTER TABLE `marketplace`
  ADD CONSTRAINT `fk_market_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `redeem`
--
ALTER TABLE `redeem`
  ADD CONSTRAINT `fk_redeem_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank_locations` (`bank_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `redeem_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `redeem_ibfk_2` FOREIGN KEY (`reward_id`) REFERENCES `rewards` (`reward_id`);

--
-- Constraints for table `rewards`
--
ALTER TABLE `rewards`
  ADD CONSTRAINT `fk_rewards_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank_locations` (`bank_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

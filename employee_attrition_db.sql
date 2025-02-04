-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jan 2025 pada 04.59
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_attrition_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_employee_db`
--

CREATE TABLE `data_employee_db` (
  `employee_id` varchar(7) DEFAULT NULL,
  `domisili` varchar(20) DEFAULT NULL,
  `jenis_kelamin` varchar(9) DEFAULT NULL,
  `date_of_birth` varchar(10) DEFAULT NULL,
  `join_date` varchar(10) DEFAULT NULL,
  `resign_date` varchar(10) DEFAULT NULL,
  `marriage_stat` varchar(7) DEFAULT NULL,
  `dependant` int(1) DEFAULT NULL,
  `education` varchar(4) DEFAULT NULL,
  `absent_90D` varchar(3) DEFAULT NULL,
  `avg_time_work` decimal(3,2) DEFAULT NULL,
  `departemen` varchar(35) DEFAULT NULL,
  `position` varchar(6) DEFAULT NULL,
  `income` int(7) DEFAULT NULL,
  `total_komp` varchar(2) DEFAULT NULL,
  `job_satisfaction` int(1) DEFAULT NULL,
  `performance_rating` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `data_employee_db`
--

INSERT INTO `data_employee_db` (`employee_id`, `domisili`, `jenis_kelamin`, `date_of_birth`, `join_date`, `resign_date`, `marriage_stat`, `dependant`, `education`, `absent_90D`, `avg_time_work`, `departemen`, `position`, `income`, `total_komp`, `job_satisfaction`, `performance_rating`) VALUES
('EM1453', 'Kota Jakarta Barat', 'Perempuan', '1977-10-27', '2020-07-11', '2021-06-16', 'Married', 3, 'SLTA', '10.', 9.45, 'Operations', 'Staff', 2270258, '', 2, 2),
('EM8267', 'Kota Jakarta Barat', 'Laki-laki', '1985-05-11', '2023-11-07', '', 'Married', 2, 'SLTA', '10.', 9.16, 'Finance & Accounting', 'Staff', 1669077, '', 2, 3),
('EM14973', 'Kota Jakarta Timur', 'Laki-laki', '1971-03-10', '2021-11-01', '', 'Married', 0, 'D1', '1.0', 9.70, 'Finance & Accounting', 'Staff', 4881262, '', 1, 3),
('EM15710', 'Kota Jakarta Pusat', 'Perempuan', '1987-08-08', '2021-10-01', '', 'Married', 0, 'S1', '2.0', 9.37, 'HR', 'Junior', 5881153, '1.', 3, 1),
('EM0618', 'Kepulauan Seribu', 'Perempuan', '1987-03-25', '2020-07-17', '', 'Married', 2, 'S1', '', 9.25, 'Corporate Strategy & Communications', 'Junior', 5457851, '', 2, 3),
('EM1505', 'Tangerang', 'Laki-laki', '1981-11-04', '2020-12-08', '2023-01-09', 'Married', 3, 'SLTA', '11.', 9.02, 'Engineering & IT', 'Staff', 1870494, '', 1, 1),
('EM10213', 'Kota Jakarta Timur', 'Laki-laki', '1975-09-26', '2022-07-24', '', 'Married', 0, 'S1', '2.0', 9.71, 'Service & Support', 'Junior', 5726605, '', 3, 1),
('EM2211', 'Kabupaten Bekasi', 'Laki-laki', '1980-11-02', '2022-12-07', '2023-04-01', 'Married', 2, 'SLTA', '2.0', 9.26, 'Engineering & IT', 'Staff', 2413182, '1.', 3, 1),
('EM3372', 'Kabupaten Bekasi', 'Laki-laki', '1985-04-30', '2023-11-15', '2024-05-16', 'Married', 3, 'SLTA', '5.0', 9.17, 'Corporate Strategy & Communications', 'Staff', 2532519, '', 2, 3),
('EM2073', 'Kabupaten Bogor', 'Laki-laki', '1985-09-02', '2021-08-28', '2023-10-03', 'Married', 2, 'SLTA', '15.', 9.68, 'Creative & Design', 'Staff', 1131295, '', 1, 3),
('EM2972', 'Kota Jakarta Barat', 'Laki-laki', '1986-04-09', '2020-09-07', '2023-01-03', 'Married', 2, 'SLTA', '5.0', 9.85, 'Creative & Design', 'Staff', 2073661, '1.', 1, 1),
('EM8655', 'Kota Jakarta Pusat', 'Perempuan', '1984-09-18', '2022-05-13', '2024-09-21', 'Married', 2, 'D2', '2.0', 9.19, 'Operations', 'Staff', 4863474, '', 2, 1),
('EM11278', 'Kabupaten Bekasi', 'Laki-laki', '1986-10-17', '2022-10-12', '', 'Married', 4, 'S1', '1.0', 9.08, 'Finance & Accounting', 'Junior', 5746347, '1.', 2, 1),
('EM12486', 'Tangerang', 'Laki-laki', '1968-12-12', '2023-11-17', '2024-06-09', 'Married', 5, 'SLTA', '12.', 9.08, 'Marketing', 'Staff', 1715216, '1.', 1, 1),
('EM4388', 'Kota Jakarta Barat', 'Laki-laki', '1981-02-28', '2023-09-12', '2024-01-23', 'Married', 3, 'D3', '0.0', 9.52, 'Creative & Design', 'Staff', 3112695, '', 1, 3),
('EM10069', 'Kota Depok', 'Laki-laki', '1967-12-10', '2023-05-26', '2024-08-03', 'Married', 0, 'D3', '3.0', 9.52, 'Marketing', 'Staff', 4529891, '', 2, 3),
('EM10335', 'Kota Bogor', 'Perempuan', '1975-03-16', '2023-08-01', '', 'Married', 2, 'D1', '0.0', 9.44, 'Corporate Strategy & Communications', 'Staff', 3700998, '', 2, 2),
('EM10695', 'Kota Jakarta Barat', 'Laki-laki', '1997-07-17', '2020-10-09', '', 'Single', 0, 'S1', '0.0', 9.72, 'HR', 'Junior', 5138571, '1.', 2, 2),
('EM12114', 'Kabupaten Bekasi', 'Laki-laki', '1990-03-04', '2021-11-20', '2023-12-15', 'Married', 2, 'SLTA', '12.', 9.27, 'HR', 'Staff', 1865631, '', 3, 3),
('EM9770', 'Kepulauan Seribu', 'Laki-laki', '1991-01-30', '2022-10-02', '2023-12-07', 'Single', 0, 'D3', '4.0', 9.85, 'HR', 'Staff', 3216386, '', 3, 2),
('EM12504', 'Kota Jakarta Timur', 'Perempuan', '1986-09-14', '2021-02-08', '2023-09-14', 'Single', 0, 'SLTA', '7.0', 9.59, 'HR', 'Staff', 2314456, '', 1, 2),
('EM2058', 'Kota Jakarta Selatan', 'Laki-laki', '1980-11-30', '2021-08-01', '2023-10-07', 'Married', 2, 'D1', '3.0', 9.60, 'HR', 'Staff', 4154315, '', 3, 2),
('EM4752', 'Tangerang', 'Laki-laki', '1988-03-18', '2022-01-18', '2024-05-08', 'Married', 1, 'D3', '0.0', 9.17, 'Engineering & IT', 'Staff', 3772775, '', 3, 1),
('EM14290', 'Tangerang', 'Perempuan', '1995-09-07', '2024-05-24', '', 'Married', 0, 'D1', '3.0', 9.62, 'Engineering & IT', 'Staff', 4772824, '', 1, 2),
('EM4938', 'Kota Jakarta Utara', 'Laki-laki', '1992-09-02', '2023-09-05', '', 'Single', 0, 'S1', '4.0', 9.86, 'Marketing', 'Junior', 5259970, '', 3, 2),
('EM13459', 'Tangerang', 'Laki-laki', '1995-06-18', '2022-06-22', '2023-08-08', 'Single', 0, 'SLTA', '14.', 9.54, 'Operations', 'Staff', 1172725, '', 3, 1),
('EM9208', 'Tangerang', 'Laki-laki', '1985-11-08', '2021-11-22', '2024-01-02', 'Married', 1, 'SLTA', '10.', 9.54, 'HR', 'Staff', 1866723, '', 3, 1),
('EM5721', 'Kabupaten Bekasi', 'Perempuan', '1993-05-16', '2023-01-31', '2023-06-03', 'Married', 1, 'SLTA', '12.', 9.27, 'Finance & Accounting', 'Staff', 2003014, '', 1, 2),
('EM9839', 'Kota Depok', 'Laki-laki', '1997-03-22', '2022-05-04', '2023-06-27', 'Married', 1, 'D3', '7.0', 9.15, 'HR', 'Staff', 3799288, '', 1, 2),
('EM2833', 'Kota Jakarta Timur', 'Laki-laki', '1970-06-13', '2022-08-11', '2023-01-03', 'Married', 2, 'SLTA', '7.0', 9.03, 'Service & Support', 'Staff', 2735426, '', 3, 3),
('EM3092', 'Kabupaten Bekasi', 'Laki-laki', '1971-10-27', '2023-09-13', '2024-05-30', 'Married', 5, 'SLTA', '9.0', 9.52, 'Creative & Design', 'Staff', 2368825, '', 2, 2),
('EM12557', 'Tangerang', 'Laki-laki', '1978-10-02', '2020-07-25', '', 'Married', 4, 'S1', '4.0', 9.77, 'Finance & Accounting', 'Junior', 5404690, '', 3, 3),
('EM5960', 'Kota Jakarta Timur', 'Perempuan', '1988-01-07', '2023-07-24', '', 'Married', 3, 'S1', '0.0', 9.04, 'Operations', 'Junior', 6043781, '', 1, 2),
('EM2224', 'Tangerang', 'Laki-laki', '1977-08-18', '2022-02-01', '2024-02-24', 'Married', 0, 'SLTA', '', 9.49, 'Corporate Strategy & Communications', 'Staff', 1261362, '', 1, 1),
('EM7059', 'Kabupaten Bekasi', 'Perempuan', '1990-09-09', '2024-09-07', '', 'Married', 3, 'S1', '4.0', 9.43, 'Operations', 'Junior', 5717391, '', 1, 3),
('EM4995', 'Kota Jakarta Barat', 'Perempuan', '1996-09-04', '2021-03-08', '', 'Married', 0, 'D1', '2.0', 9.69, 'Operations', 'Staff', 4578976, '', 1, 3),
('EM1925', 'Kabupaten Bekasi', 'Laki-laki', '1987-03-23', '2022-06-20', '2024-08-14', 'Married', 3, 'SLTA', '7.0', 9.56, 'HR', 'Staff', 1281462, '', 3, 1),
('EM8987', 'Kota Depok', 'Laki-laki', '1986-09-15', '2021-02-01', '2023-03-14', 'Married', 3, 'D1', '4.0', 9.58, 'Engineering & IT', 'Staff', 4072815, '', 1, 1),
('EM7598', 'Kota Depok', 'Laki-laki', '1993-04-14', '2023-01-05', '2024-01-28', 'Married', 1, 'SLTA', '', 9.65, 'Operations', 'Staff', 1476861, '', 1, 2),
('EM3282', 'Tangerang', 'Laki-laki', '1989-03-07', '2020-03-23', '2024-04-16', 'Married', 0, 'SLTA', '11.', 9.30, 'Creative & Design', 'Staff', 1617391, '', 2, 3),
('EM7902', 'Tangerang', 'Perempuan', '1989-04-06', '2022-07-28', '', 'Married', 0, 'S1', '1.0', 9.64, 'Corporate Strategy & Communications', 'Junior', 5674950, '', 1, 1),
('EM9087', 'Kota Jakarta Utara', 'Laki-laki', '1986-12-22', '2020-01-10', '2023-03-15', 'Married', 2, 'SLTA', '5.0', 9.42, 'Operations', 'Staff', 2433427, '', 1, 1),
('EM4435', 'Kabupaten Bekasi', 'Perempuan', '1975-01-01', '2022-03-13', '2023-04-15', 'Married', 2, 'SLTA', '11.', 9.72, 'Operations', 'Staff', 1662213, '', 2, 1),
('EM12552', 'Kota Jakarta Timur', 'Perempuan', '1977-10-09', '2023-07-12', '2023-11-01', 'Married', 3, 'SLTA', '2.0', 9.23, 'HR', 'Staff', 1985118, '', 2, 3),
('EM11851', 'Kota Jakarta Selatan', 'Laki-laki', '1983-10-16', '2020-10-04', '2023-03-06', 'Married', 0, 'SLTA', '0.0', 9.88, 'Finance & Accounting', 'Staff', 1282153, '', 3, 2),
('EM14552', 'Kabupaten Bogor', 'Laki-laki', '1973-11-27', '2023-06-10', '2023-10-31', 'Married', 3, 'D2', '3.0', 9.38, 'Creative & Design', 'Staff', 3319833, '', 2, 3),
('EM7289', 'Kota Bekasi', 'Perempuan', '1989-02-02', '2022-07-13', '2023-09-04', 'Married', 2, 'SLTA', '1.0', 9.56, 'Corporate Strategy & Communications', 'Staff', 1288501, '', 3, 2),
('EM11352', 'Kabupaten Bekasi', 'Laki-laki', '1984-05-24', '2022-07-21', '2023-09-27', 'Married', 3, 'SLTA', '2.0', 9.86, 'Finance & Accounting', 'Staff', 2519857, '', 2, 2),
('EM14465', 'Kabupaten Bogor', 'Laki-laki', '1979-10-10', '2021-04-22', '', 'Married', 2, 'S1', '3.0', 9.10, 'Marketing', 'Junior', 5672040, '', 1, 2),
('EM3066', 'Kabupaten Bekasi', 'Laki-laki', '1987-02-13', '2024-07-10', '', 'Married', 2, 'S1', '0.0', 9.54, 'Finance & Accounting', 'Junior', 5511921, '', 3, 2),
('EM7190', 'Tangerang', 'Perempuan', '1982-09-19', '2022-09-25', '2024-02-13', 'Married', 3, 'SLTA', '1.0', 9.20, 'Operations', 'Staff', 1202032, '', 2, 3),
('EM6089', 'Kabupaten Bogor', 'Perempuan', '1996-08-14', '2023-07-18', '2024-09-19', 'Married', 1, 'SLTA', '11.', 9.23, 'Marketing', 'Staff', 1398288, '', 2, 1),
('EM7819', 'Kota Jakarta Barat', 'Perempuan', '1978-04-14', '2020-12-20', '', 'Married', 0, 'S1', '0.0', 9.39, 'Marketing', 'Junior', 6171903, '1', 1, 1),
('EM13219', 'Kota Jakarta Barat', 'Perempuan', '1976-08-10', '2020-05-30', '', 'Married', 3, 'D2', '4.0', 9.15, 'Engineering & IT', 'Staff', 4496191, '', 2, 3),
('EM13984', 'Kabupaten Bogor', 'Laki-laki', '1975-05-25', '2020-09-22', '', 'Married', 2, 'D2', '5.0', 9.54, 'Operations', 'Staff', 3180779, '', 1, 2),
('EM14373', 'Kabupaten Bogor', 'Laki-laki', '1979-11-11', '2022-02-14', '2023-05-12', 'Married', 3, 'SLTA', '12.', 9.42, 'Corporate Strategy & Communications', 'Staff', 2174583, '', 1, 3),
('EM11283', 'Kepulauan Seribu', 'Laki-laki', '1995-11-30', '2021-11-13', '2023-02-06', 'Single', 0, 'D3', '3.0', 9.25, 'Service & Support', 'Staff', 4398792, '1.', 2, 3),
('EM15650', 'Kota Jakarta Utara', 'Perempuan', '1993-04-25', '2022-10-07', '', 'Married', 2, 'S1', '3.0', 9.81, 'HR', 'Junior', 5514514, '', 2, 1),
('EM8909', 'Kota Depok', 'Perempuan', '1970-12-30', '2023-06-05', '', 'Married', 2, 'S1', '2.0', 9.68, 'Operations', 'Junior', 6606331, '', 2, 3),
('EM14784', 'Kota Jakarta Pusat', 'Perempuan', '1991-01-26', '2024-10-22', '', 'Single', 0, 'D2', '3.0', 9.24, 'HR', 'Staff', 3547887, '', 1, 3),
('EM1944', 'Kota Jakarta Utara', 'Perempuan', '1975-11-20', '2021-08-16', '2023-09-15', 'Single', 0, 'SLTA', '12.', 9.30, 'Service & Support', 'Staff', 1603237, '', 1, 2),
('EM4977', 'Tangerang', 'Laki-laki', '1995-10-18', '2023-01-02', '2024-01-22', 'Married', 1, 'SLTA', '3.0', 9.81, 'Creative & Design', 'Staff', 1223958, '', 1, 1),
('EM8380', 'Kabupaten Bekasi', 'Perempuan', '1975-01-07', '2023-10-17', '2024-06-27', 'Married', 0, 'SLTA', '14.', 9.52, 'Creative & Design', 'Staff', 1533516, '', 3, 1),
('EM6875', 'Tangerang', 'Laki-laki', '1995-09-27', '2022-03-21', '2023-04-12', 'Married', 2, 'SLTA', '14.', 9.86, 'Engineering & IT', 'Staff', 1348313, '', 2, 1),
('EM6892', 'Kota Jakarta Selatan', 'Laki-laki', '1994-12-26', '2023-05-12', '2024-06-23', 'Single', 0, 'D2', '7.0', 9.19, 'Corporate Strategy & Communications', 'Staff', 4249307, '2.', 2, 2),
('EM4271', 'Kabupaten Bekasi', 'Perempuan', '1982-11-11', '2021-09-04', '2023-11-24', 'Married', 3, 'SLTA', '5.0', 9.40, 'Service & Support', 'Staff', 2888971, '', 2, 3),
('EM11911', 'Kota Jakarta Barat', 'Perempuan', '1977-05-04', '2022-04-17', '2023-06-19', 'Married', 2, 'D2', '6.0', 9.63, 'Creative & Design', 'Staff', 3653966, '', 2, 2),
('EM9979', 'Kota Jakarta Pusat', 'Perempuan', '1989-05-27', '2022-08-01', '', 'Married', 2, 'S1', '1.0', 9.86, 'Creative & Design', 'Junior', 6234675, '', 1, 3),
('EM10808', 'Kabupaten Bekasi', 'Perempuan', '1974-08-31', '2021-10-06', '2023-04-01', 'Married', 2, 'SLTA', '5.0', 9.75, 'Service & Support', 'Staff', 2643232, '', 1, 3),
('EM11187', 'Kota Depok', 'Perempuan', '1974-08-30', '2023-12-11', '', 'Married', 3, 'D2', '3.0', 9.65, 'Operations', 'Staff', 3798422, '', 3, 1),
('EM1840', 'Kabupaten Bogor', 'Perempuan', '1978-08-07', '2022-10-12', '', 'Married', 4, 'S1', '0.0', 9.30, 'Engineering & IT', 'Junior', 5521762, '', 1, 2),
('EM13097', 'Kabupaten Bekasi', 'Perempuan', '1999-06-30', '2023-07-04', '2024-09-21', 'Married', 0, 'SLTA', '0.0', 9.36, 'Creative & Design', 'Staff', 2211419, '', 1, 2),
('EM5578', 'Tangerang', 'Perempuan', '1992-10-25', '2020-11-06', '2021-09-16', 'Married', 0, 'SLTA', '', 9.74, 'Finance & Accounting', 'Staff', 2639546, '', 3, 1),
('EM7026', 'Kota Depok', 'Laki-laki', '1967-09-30', '2022-06-22', '2024-04-30', 'Married', 4, 'D3', '0.0', 9.49, 'HR', 'Staff', 3077843, '', 3, 2),
('EM14581', 'Kabupaten Bogor', 'Perempuan', '1995-09-16', '2023-08-22', '2024-10-02', 'Single', 0, 'SLTA', '11.', 9.77, 'Operations', 'Staff', 2156444, '', 2, 3),
('EM10995', 'Kabupaten Bekasi', 'Laki-laki', '1983-03-23', '2022-06-09', '2024-08-29', 'Married', 0, 'SLTA', '7.0', 9.78, 'Marketing', 'Staff', 2129143, '', 1, 2),
('EM5678', 'Tangerang', 'Laki-laki', '1971-07-16', '2023-09-18', '', 'Married', 2, 'S1', '3.0', 9.58, 'Service & Support', 'Junior', 5964073, '', 3, 2),
('EM1191', 'Kabupaten Bekasi', 'Laki-laki', '1980-04-28', '2022-04-11', '2023-06-28', 'Married', 0, 'D1', '3.0', 9.27, 'HR', 'Staff', 3460496, '1.', 1, 2),
('EM8973', 'Kota Jakarta Timur', 'Laki-laki', '1979-06-09', '2021-12-12', '2023-04-01', 'Married', 0, 'D3', '4.0', 9.66, 'Operations', 'Staff', 3185091, '', 2, 2),
('EM0064', 'Kota Jakarta Utara', 'Perempuan', '1987-04-20', '2022-07-25', '2024-08-23', 'Married', 3, 'SLTA', '0.0', 9.32, 'HR', 'Staff', 1257855, '', 3, 1),
('EM13569', 'Kota Jakarta Pusat', 'Laki-laki', '2000-05-13', '2023-05-30', '', 'Single', 0, 'S1', '4.0', 9.32, 'Operations', 'Junior', 6909993, '', 1, 3),
('EM5454', 'Tangerang', 'Perempuan', '1973-02-22', '2020-11-28', '2023-01-03', 'Married', 4, 'SLTA', '2.0', 9.49, 'Finance & Accounting', 'Staff', 1393109, '', 1, 2),
('EM13602', 'Kota Jakarta Timur', 'Perempuan', '1969-07-01', '2020-08-24', '', 'Married', 3, 'S1', '4.0', 9.41, 'Engineering & IT', 'Junior', 5328394, '', 2, 3),
('EM9199', 'Kota Jakarta Timur', 'Perempuan', '1993-09-07', '2022-10-03', '2024-02-09', 'Married', 0, 'SLTA', '4.0', 9.73, 'Engineering & IT', 'Staff', 2018588, '', 1, 3),
('EM3323', 'Kabupaten Bekasi', 'Laki-laki', '1983-11-08', '2023-07-20', '2023-12-19', 'Married', 2, 'D3', '5.0', 9.70, 'Corporate Strategy & Communications', 'Staff', 3861318, '', 1, 1),
('EM10400', 'Kabupaten Bekasi', 'Laki-laki', '1982-01-01', '2023-02-21', '2024-08-31', 'Married', 4, 'SLTA', '5.0', 9.49, 'Engineering & IT', 'Staff', 2093476, '', 2, 3),
('EM1499', 'Tangerang', 'Laki-laki', '1989-11-24', '2021-11-20', '2024-04-06', 'Married', 2, 'SLTA', '12.', 9.56, 'HR', 'Staff', 1711189, '', 2, 1),
('EM6584', 'Kabupaten Bekasi', 'Laki-laki', '1975-08-20', '2024-09-12', '', 'Married', 2, 'D3', '0.0', 9.33, 'Operations', 'Staff', 3382414, '', 3, 3),
('EM9682', 'Kota Jakarta Utara', 'Laki-laki', '1971-01-13', '2020-12-08', '2023-04-01', 'Married', 2, 'D3', '3.0', 9.52, 'Service & Support', 'Staff', 4953560, '', 1, 1),
('EM15537', 'Kota Jakarta Barat', 'Laki-laki', '1982-01-20', '2024-10-29', '', 'Married', 2, 'S1', '1.0', 9.46, 'Operations', 'Junior', 6211993, '', 1, 2),
('EM14077', 'Kota Bekasi', 'Laki-laki', '1992-04-17', '2023-06-05', '2024-04-26', 'Married', 1, 'SLTA', '8.0', 9.19, 'Corporate Strategy & Communications', 'Staff', 1145236, '', 1, 3),
('EM3255', 'Kota Bekasi', 'Perempuan', '1995-07-22', '2022-11-22', '2023-12-26', 'Single', 0, 'SLTA', '0.0', 9.10, 'Operations', 'Staff', 1235783, '', 3, 1),
('EM4668', 'Kabupaten Bekasi', 'Laki-laki', '1983-02-01', '2022-03-13', '2023-10-23', 'Married', 2, 'SLTA', '11.', 9.41, 'Engineering & IT', 'Staff', 2832327, '', 1, 1),
('EM2705', 'Kota Bekasi', 'Perempuan', '1995-07-19', '2022-07-11', '2023-10-02', 'Married', 1, 'SLTA', '6.0', 9.88, 'Finance & Accounting', 'Staff', 2942346, '', 2, 1),
('EM8192', 'Kabupaten Bekasi', 'Perempuan', '1989-08-08', '2021-03-13', '2024-07-29', 'Married', 2, 'D3', '5.0', 9.22, 'Corporate Strategy & Communications', 'Staff', 3520159, '', 1, 1),
('EM13103', 'Kota Jakarta Pusat', 'Perempuan', '1979-09-13', '2021-07-13', '', 'Divorce', 1, 'D2', '4.0', 9.90, 'Engineering & IT', 'Staff', 4976364, '', 3, 2),
('EM0364', 'Kota Jakarta Selatan', 'Laki-laki', '1968-06-02', '2021-05-05', '', 'Married', 2, 'S1', '0.0', 9.49, 'HR', 'Junior', 5027036, '2.', 3, 1),
('EM1479', 'Tangerang', 'Laki-laki', '1981-10-31', '2022-10-02', '2024-02-26', 'Single', 0, 'D3', '4.0', 9.73, 'Operations', 'Staff', 4824680, '1.', 2, 1),
('EM15706', 'Kota Bogor', 'Laki-laki', '1981-03-03', '2022-10-24', '', 'Married', 0, 'S1', '2.0', 9.56, 'Marketing', 'Junior', 6427386, '', 3, 1),
('EM12881', 'Kota Jakarta Selatan', 'Perempuan', '1982-08-20', '2020-07-05', '2023-01-18', 'Married', 2, 'D2', '11.', 9.07, 'Service & Support', 'Staff', 3963025, '', 3, 1),
('EM12732', 'Tangerang', 'Laki-laki', '1988-10-26', '2022-12-29', '2023-05-18', 'Married', 1, 'D3', '8.0', 9.63, 'Finance & Accounting', 'Staff', 3741813, '5.', 1, 1),
('EM0088', 'Kota Jakarta Timur', 'Perempuan', '2000-03-16', '2021-10-10', '', 'Married', 1, 'D1', '6.0', 9.57, 'Operations', 'Staff', 3750038, '', 3, 3),
('EM1864', 'Kota Jakarta Barat', 'Laki-laki', '1972-02-07', '2023-12-04', '', 'Married', 2, 'S1', '0.0', 9.59, 'Marketing', 'Junior', 6539041, '', 3, 3),
('EM9817', 'Kabupaten Bogor', 'Laki-laki', '1971-06-03', '2022-02-23', '', 'Married', 3, 'S1', '6.0', 9.10, 'Operations', 'Junior', 5226943, '', 1, 2),
('EM9976', 'Kabupaten Bekasi', 'Laki-laki', '1994-03-22', '2022-07-24', '2023-12-19', 'Single', 0, 'D1', '0.0', 9.12, 'Engineering & IT', 'Staff', 4408885, '', 1, 2),
('EM2581', 'Kota Bogor', 'Laki-laki', '1975-06-05', '2021-03-16', '2023-08-29', 'Married', 4, 'D3', '4.0', 9.32, 'Service & Support', 'Staff', 4596609, '', 1, 2),
('EM7739', 'Kota Jakarta Pusat', 'Perempuan', '1997-11-15', '2022-06-03', '2024-07-27', 'Married', 1, 'SLTA', '1.0', 9.73, 'Service & Support', 'Staff', 2403336, '', 3, 3),
('EM13249', 'Kota Jakarta Timur', 'Laki-laki', '1993-10-06', '2023-10-06', '', 'Married', 0, 'S1', '1.0', 9.09, 'Operations', 'Junior', 5659733, '', 3, 1),
('EM2443', 'Kota Bogor', 'Perempuan', '1999-07-27', '2023-11-06', '2024-04-03', 'Single', 0, 'D3', '6.0', 9.50, 'Finance & Accounting', 'Staff', 3411289, '1.', 1, 2),
('EM6192', 'Kabupaten Bogor', 'Perempuan', '1974-06-13', '2023-06-13', '2024-07-15', 'Married', 3, 'SLTA', '11.', 9.71, 'Service & Support', 'Staff', 1037488, '', 3, 1),
('EM3576', 'Kota Jakarta Timur', 'Perempuan', '1975-02-11', '2021-08-28', '2023-10-05', 'Married', 1, 'SLTA', '0.0', 9.76, 'Creative & Design', 'Staff', 1119607, '', 3, 2),
('EM3412', 'Kota Depok', 'Laki-laki', '1983-10-03', '2021-05-29', '', 'Married', 1, 'S1', '2.0', 9.22, 'Engineering & IT', 'Junior', 5435988, '', 2, 1),
('EM8682', 'Kabupaten Bekasi', 'Laki-laki', '1986-09-27', '2022-08-07', '2023-09-18', 'Married', 2, 'SLTA', '12.', 9.13, 'Engineering & IT', 'Staff', 1123514, '', 2, 3),
('EM14605', 'Tangerang', 'Perempuan', '1999-03-22', '2022-10-24', '2023-11-27', 'Married', 3, 'D1', '4.0', 9.89, 'HR', 'Staff', 3740342, '', 3, 1),
('EM13516', 'Kota Bogor', 'Laki-laki', '1983-05-10', '2022-11-15', '', 'Married', 0, 'S1', '9.0', 9.30, 'Corporate Strategy & Communications', 'Junior', 6490316, '3.', 1, 3),
('EM6523', 'Kabupaten Bekasi', 'Perempuan', '1984-05-10', '2023-02-28', '2024-05-12', 'Married', 2, 'D1', '3.0', 9.65, 'Service & Support', 'Staff', 3903337, '', 3, 2),
('EM9459', 'Kota Depok', 'Perempuan', '1991-05-04', '2021-02-28', '', 'Married', 0, 'D2', '6.0', 9.13, 'Engineering & IT', 'Staff', 4538372, '', 1, 3),
('EM7838', 'Kota Jakarta Timur', 'Laki-laki', '1977-10-08', '2023-02-06', '2023-07-29', 'Married', 2, 'D1', '3.0', 9.19, 'Operations', 'Staff', 4968320, '', 2, 1),
('EM4825', 'Kota Bogor', 'Perempuan', '2000-05-03', '2023-08-30', '2024-01-18', 'Single', 0, 'SLTA', '2.0', 9.18, 'Marketing', 'Staff', 2330116, '', 3, 2),
('EM15207', 'Kota Jakarta Pusat', 'Laki-laki', '1981-10-10', '2023-10-16', '', 'Married', 2, 'S1', '0.0', 9.49, 'Creative & Design', 'Junior', 6295097, '', 2, 1),
('EM6791', 'Kabupaten Bogor', 'Laki-laki', '1973-12-06', '2021-07-03', '2023-07-28', 'Married', 6, 'SLTA', '3.0', 9.79, 'Finance & Accounting', 'Staff', 1577591, '', 1, 1),
('EM11964', 'Kota Jakarta Timur', 'Laki-laki', '1992-11-17', '2022-09-26', '', 'Married', 1, 'S1', '3.0', 9.86, 'Corporate Strategy & Communications', 'Junior', 6567972, '1.', 1, 2),
('EM2285', 'Kabupaten Bekasi', 'Perempuan', '1995-11-24', '2023-07-07', '2023-10-30', 'Married', 1, 'D1', '2.0', 9.43, 'HR', 'Staff', 3996205, '', 2, 1),
('EM7530', 'Tangerang', 'Laki-laki', '1990-01-28', '2023-06-21', '2024-07-18', 'Single', 0, 'SLTA', '13.', 9.32, 'Engineering & IT', 'Staff', 1824559, '', 3, 1),
('EM15627', 'Kabupaten Bogor', 'Laki-laki', '1991-06-22', '2020-10-02', '', 'Married', 4, 'S1', '1.0', 9.39, 'Corporate Strategy & Communications', 'Junior', 7132270, '', 3, 2),
('EM6139', 'Kota Bekasi', 'Perempuan', '1977-06-06', '2020-11-24', '2023-01-31', 'Married', 2, 'D3', '5.0', 9.07, 'Service & Support', 'Staff', 3760797, '', 2, 3),
('EM7730', 'Kota Jakarta Selatan', 'Perempuan', '1970-07-02', '2023-05-02', '2024-07-17', 'Married', 1, 'SLTA', '3.0', 9.81, 'Finance & Accounting', 'Staff', 2547736, '', 2, 3),
('EM12991', 'Tangerang', 'Laki-laki', '1989-04-26', '2020-07-24', '2024-10-12', 'Married', 2, 'SLTA', '12.', 9.83, 'Finance & Accounting', 'Staff', 1033973, '', 2, 1),
('EM5737', 'Kota Jakarta Timur', 'Laki-laki', '1985-02-12', '2022-05-09', '2023-07-17', 'Married', 2, 'SLTA', '0.0', 9.32, 'HR', 'Staff', 1103191, '', 3, 3),
('EM11712', 'Kabupaten Bogor', 'Perempuan', '1999-09-20', '2023-07-17', '2024-10-03', 'Married', 4, 'SLTA', '14.', 9.57, 'Finance & Accounting', 'Staff', 1030475, '', 1, 3),
('EM12705', 'Tangerang', 'Perempuan', '1969-10-27', '2022-10-13', '', 'Married', 3, 'S1', '0.0', 9.75, 'Operations', 'Junior', 5330255, '', 1, 3),
('EM3409', 'Kota Jakarta Timur', 'Laki-laki', '1974-09-28', '2021-05-16', '2023-10-01', 'Married', 4, 'D1', '3.0', 9.73, 'Finance & Accounting', 'Staff', 4449326, '1.', 3, 1),
('EM5088', 'Kabupaten Bogor', 'Laki-laki', '1985-12-22', '2024-02-08', '', 'Married', 1, 'S1', '1.0', 9.75, 'Operations', 'Junior', 6835630, '', 2, 1),
('EM10163', 'Kota Jakarta Timur', 'Perempuan', '1988-12-14', '2021-02-23', '2023-05-15', 'Married', 1, 'SLTA', '9.0', 9.21, 'Creative & Design', 'Staff', 2198002, '', 1, 2),
('EM0557', 'Kota Jakarta Timur', 'Perempuan', '1997-05-04', '2022-12-01', '2024-02-22', 'Married', 0, 'D3', '2.0', 9.12, 'Marketing', 'Staff', 4313321, '', 2, 2),
('EM10743', 'Tangerang', 'Laki-laki', '1975-10-25', '2022-02-16', '2023-08-23', 'Married', 3, 'D2', '3.0', 9.70, 'Operations', 'Staff', 3597654, '', 2, 1),
('EM1482', 'Tangerang', 'Laki-laki', '1998-11-22', '2022-10-04', '2023-11-23', 'Single', 0, 'D1', '7.0', 9.39, 'Engineering & IT', 'Staff', 3597695, '1.', 1, 1),
('EM5213', 'Kota Jakarta Barat', 'Perempuan', '1998-04-22', '2020-02-16', '2023-05-27', 'Single', 0, 'D2', '4.0', 9.39, 'Creative & Design', 'Staff', 3100324, '1.', 1, 3),
('EM6713', 'Kota Jakarta Timur', 'Perempuan', '1980-07-31', '2022-10-09', '2023-11-19', 'Married', 1, 'SLTA', '10.', 9.49, 'Corporate Strategy & Communications', 'Staff', 2050574, '', 3, 1),
('EM12505', 'Tangerang', 'Perempuan', '1988-04-11', '2023-02-08', '2024-03-13', 'Married', 1, 'SLTA', '9.0', 9.49, 'Operations', 'Staff', 2185798, '', 1, 3),
('EM9411', 'Kota Jakarta Timur', 'Perempuan', '1997-07-24', '2023-09-05', '2024-01-31', 'Single', 0, 'SLTA', '0.0', 9.15, 'HR', 'Staff', 1559691, '', 3, 1),
('EM1393', 'Tangerang', 'Perempuan', '1982-02-13', '2023-01-23', '2024-03-01', 'Married', 1, 'SLTA', '13.', 9.21, 'Operations', 'Staff', 1414383, '', 3, 2),
('EM2226', 'Kota Jakarta Barat', 'Laki-laki', '1998-01-14', '2023-02-06', '2024-07-14', 'Married', 1, 'SLTA', '12.', 9.22, 'Engineering & IT', 'Staff', 1907027, '', 2, 3),
('EM11792', 'Kota Jakarta Timur', 'Perempuan', '1980-11-07', '2022-03-23', '2024-06-10', 'Married', 0, 'D3', '1.0', 9.78, 'Creative & Design', 'Staff', 4973770, '', 2, 2),
('EM11204', 'Kabupaten Bogor', 'Perempuan', '1983-02-23', '2023-01-27', '2023-06-01', 'Married', 1, 'SLTA', '0.0', 9.29, 'Operations', 'Staff', 1757534, '', 1, 2),
('EM3672', 'Kabupaten Bogor', 'Perempuan', '1996-10-07', '2022-06-07', '2023-08-30', 'Married', 1, 'D3', '1.0', 9.02, 'Finance & Accounting', 'Staff', 3575931, '', 1, 3),
('EM12010', 'Tangerang', 'Laki-laki', '1988-09-10', '2022-02-07', '', 'Married', 0, 'S1', '0.0', 9.70, 'Operations', 'Junior', 6016535, '', 2, 1),
('EM12441', 'Kabupaten Bekasi', 'Laki-laki', '1970-09-17', '2022-07-04', '2023-08-27', 'Single', 0, 'SLTA', '9.0', 9.23, 'Service & Support', 'Staff', 2639512, '', 1, 2),
('EM7310', 'Kota Jakarta Utara', 'Laki-laki', '1979-02-17', '2022-09-02', '2023-10-04', 'Married', 2, 'SLTA', '6.0', 9.04, 'HR', 'Staff', 2044661, '', 2, 3),
('EM11202', 'Kota Jakarta Selatan', 'Laki-laki', '1994-01-26', '2021-01-25', '2023-04-21', 'Single', 0, 'D2', '7.0', 9.24, 'Service & Support', 'Staff', 3453905, '', 3, 2),
('EM9437', 'Kota Bogor', 'Perempuan', '1985-10-04', '2022-11-27', '2023-12-26', 'Married', 2, 'SLTA', '15.', 9.74, 'Engineering & IT', 'Staff', 1601326, '', 3, 1),
('EM3425', 'Kota Depok', 'Perempuan', '1987-08-17', '2020-06-26', '2023-01-20', 'Married', 2, 'D3', '4.0', 9.56, 'Marketing', 'Staff', 4594630, '1.', 2, 3),
('EM7124', 'Kota Jakarta Utara', 'Perempuan', '1980-03-05', '2022-03-09', '2023-09-01', 'Married', 1, 'SLTA', '11.', 9.62, 'Marketing', 'Staff', 1918366, '', 2, 1),
('EM12998', 'Kota Depok', 'Laki-laki', '1999-10-08', '2021-08-10', '2024-09-18', 'Single', 0, 'SLTA', '2.0', 9.82, 'Creative & Design', 'Staff', 1445016, '', 3, 1),
('EM14358', 'Kabupaten Bogor', 'Laki-laki', '1997-06-22', '2023-11-15', '2024-04-02', 'Single', 0, 'D2', '0.0', 9.12, 'Corporate Strategy & Communications', 'Staff', 3199327, '', 2, 3),
('EM8983', 'Kota Jakarta Barat', 'Perempuan', '1988-10-14', '2022-01-18', '2023-02-27', 'Married', 2, 'SLTA', '', 9.65, 'Finance & Accounting', 'Staff', 1437440, '', 3, 3),
('EM13607', 'Kota Jakarta Utara', 'Laki-laki', '1995-09-17', '2021-09-08', '2023-03-01', 'Married', 1, 'D1', '3.0', 9.85, 'Finance & Accounting', 'Staff', 4329948, '1.', 3, 2),
('EM3121', 'Kota Jakarta Timur', 'Perempuan', '1982-08-05', '2021-10-30', '2024-05-15', 'Married', 3, 'D1', '3.0', 9.01, 'Corporate Strategy & Communications', 'Staff', 3774780, '', 2, 3),
('EM2416', 'Kota Depok', 'Laki-laki', '1993-04-07', '2023-08-18', '2024-10-02', 'Married', 1, 'SLTA', '2.0', 9.02, 'Creative & Design', 'Staff', 1499414, '', 2, 2),
('EM4120', 'Tangerang', 'Laki-laki', '1990-04-29', '2023-03-02', '2023-06-10', 'Married', 3, 'SLTA', '15.', 9.54, 'Finance & Accounting', 'Staff', 1180528, '', 1, 1),
('EM10038', 'Tangerang', 'Perempuan', '1971-11-11', '2023-02-08', '', 'Married', 4, 'S1', '3.0', 9.88, 'Marketing', 'Junior', 6380819, '', 3, 1),
('EM4890', 'Kabupaten Bekasi', 'Laki-laki', '1970-12-30', '2022-05-19', '2024-08-24', 'Married', 4, 'SLTA', '12.', 9.10, 'Engineering & IT', 'Staff', 1614977, '', 3, 2),
('EM13373', 'Kota Jakarta Selatan', 'Laki-laki', '1980-03-26', '2020-10-18', '2024-03-21', 'Divorce', 2, 'D1', '1.0', 9.56, 'HR', 'Staff', 3994157, '', 3, 2),
('EM13473', 'Tangerang', 'Perempuan', '1996-04-15', '2020-08-01', '2024-09-30', 'Single', 0, 'SLTA', '8.0', 9.52, 'Creative & Design', 'Staff', 1917129, '', 1, 2),
('EM10547', 'Kabupaten Bekasi', 'Laki-laki', '1974-05-25', '2022-06-13', '', 'Married', 4, 'D1', '5.0', 9.09, 'HR', 'Staff', 4996957, '', 3, 1),
('EM9341', 'Tangerang', 'Laki-laki', '1988-06-23', '2021-02-06', '2023-06-28', 'Married', 1, 'D1', '7.0', 9.35, 'Finance & Accounting', 'Staff', 3163736, '', 3, 3),
('EM0857', 'Kabupaten Bekasi', 'Perempuan', '1993-04-08', '2022-08-21', '2023-09-19', 'Married', 1, 'SLTA', '9.0', 9.17, 'Engineering & IT', 'Staff', 2694439, '', 3, 1),
('EM8627', 'Kota Bekasi', 'Laki-laki', '1980-04-30', '2023-01-12', '2024-07-04', 'Married', 4, 'D2', '3.0', 9.16, 'Service & Support', 'Staff', 3281261, '', 1, 3),
('EM5071', 'Kota Jakarta Barat', 'Laki-laki', '1972-11-28', '2021-12-12', '', 'Married', 3, 'S1', '1.0', 9.03, 'Operations', 'Junior', 5961945, '', 2, 3),
('EM8419', 'Tangerang', 'Perempuan', '1990-07-29', '2022-03-03', '2024-06-23', 'Married', 1, 'SLTA', '12.', 9.41, 'Engineering & IT', 'Staff', 1439155, '', 2, 2),
('EM15379', 'Kota Jakarta Pusat', 'Laki-laki', '1993-10-04', '2022-10-23', '', 'Married', 4, 'S1', '0.0', 9.56, 'Finance & Accounting', 'Junior', 6929458, '', 1, 3),
('EM6704', 'Kota Jakarta Selatan', 'Laki-laki', '1977-05-13', '2021-09-25', '2022-01-21', 'Married', 3, 'SLTA', '2.0', 9.73, 'HR', 'Staff', 2977156, '1.', 3, 1),
('EM6915', 'Kota Jakarta Barat', 'Perempuan', '1991-01-31', '2022-07-26', '2024-08-28', 'Married', 1, 'SLTA', '13.', 9.43, 'Finance & Accounting', 'Staff', 1520590, '', 1, 3),
('EM4631', 'Kota Depok', 'Laki-laki', '1979-12-15', '2022-11-28', '2024-04-20', 'Married', 3, 'SLTA', '0.0', 9.62, 'Creative & Design', 'Staff', 2097050, '', 3, 2),
('EM10483', 'Kabupaten Bekasi', 'Laki-laki', '1992-01-20', '2023-11-23', '', 'Single', 0, 'D2', '1.0', 9.26, 'Operations', 'Staff', 4840745, '', 2, 1),
('EM1517', 'Kepulauan Seribu', 'Laki-laki', '1975-11-10', '2023-01-24', '2024-07-03', 'Married', 2, 'D2', '0.0', 9.18, 'Corporate Strategy & Communications', 'Staff', 4844388, '', 1, 2),
('EM15451', 'Kabupaten Bogor', 'Laki-laki', '1987-06-17', '2024-10-22', '', 'Married', 4, 'S1', '1.0', 9.54, 'HR', 'Junior', 7735098, '', 3, 2),
('EM14714', 'Kota Jakarta Timur', 'Laki-laki', '1984-06-12', '2021-10-09', '', 'Divorce', 1, 'S1', '1.0', 9.49, 'Marketing', 'Junior', 6436156, '', 1, 2),
('EM4337', 'Tangerang', 'Laki-laki', '1988-08-10', '2023-05-11', '', 'Married', 0, 'S1', '3.0', 9.12, 'Service & Support', 'Junior', 6140482, '', 2, 1),
('EM12077', 'Tangerang', 'Laki-laki', '1988-11-01', '2023-08-09', '', 'Divorce', 0, 'S1', '1.0', 9.42, 'Engineering & IT', 'Junior', 5418059, '', 3, 1),
('EM3025', 'Kabupaten Bekasi', 'Laki-laki', '1977-09-25', '2021-03-13', '2023-06-26', 'Married', 3, 'D2', '1.0', 9.39, 'Service & Support', 'Staff', 3999464, '1.', 2, 1),
('EM11257', 'Kota Jakarta Pusat', 'Laki-laki', '1988-04-07', '2021-07-31', '2024-02-24', 'Married', 2, 'D3', '3.0', 9.50, 'Marketing', 'Staff', 4674282, '', 1, 3),
('EM7277', 'Kota Jakarta Selatan', 'Laki-laki', '1973-07-03', '2023-06-13', '2024-10-04', 'Married', 3, 'D1', '2.0', 9.87, 'Finance & Accounting', 'Staff', 3206220, '', 2, 2),
('EM7874', 'Kepulauan Seribu', 'Perempuan', '1972-09-07', '2022-05-16', '2024-04-04', 'Married', 1, 'D2', '2.0', 9.32, 'Operations', 'Staff', 4144512, '1.', 1, 3),
('EM0566', 'Kabupaten Bekasi', 'Laki-laki', '1987-05-02', '2023-01-11', '2024-02-17', 'Married', 3, 'SLTA', '6.0', 9.53, 'Corporate Strategy & Communications', 'Staff', 2364137, '', 3, 2),
('EM1740', 'Tangerang', 'Perempuan', '1978-08-19', '2021-10-24', '2023-03-19', 'Married', 2, 'D1', '4.0', 9.17, 'Engineering & IT', 'Staff', 4176408, '', 3, 2),
('EM7028', 'Tangerang', 'Perempuan', '1977-03-30', '2021-06-26', '', 'Married', 3, 'D2', '1.0', 9.86, 'Finance & Accounting', 'Staff', 4951368, '', 2, 3),
('EM0598', 'Kota Jakarta Timur', 'Laki-laki', '1977-09-22', '2023-05-15', '2024-06-26', 'Married', 3, 'D3', '6.0', 9.16, 'Marketing', 'Staff', 3895624, '', 1, 3),
('EM7681', 'Kabupaten Bekasi', 'Laki-laki', '1988-10-14', '2021-10-16', '', 'Married', 2, 'D1', '10.', 9.52, 'Operations', 'Staff', 3984439, '1.', 1, 2),
('EM13018', 'Kota Jakarta Timur', 'Perempuan', '1991-01-01', '2021-10-18', '2024-02-12', 'Married', 2, 'SLTA', '9.0', 9.51, 'Engineering & IT', 'Staff', 2609762, '', 1, 2),
('EM2740', 'Kota Bekasi', 'Laki-laki', '1990-05-30', '2021-09-22', '2023-11-29', 'Married', 2, 'SLTA', '8.0', 9.89, 'Marketing', 'Staff', 2650100, '', 3, 2),
('EM14637', 'Kabupaten Bogor', 'Perempuan', '1995-02-08', '2023-11-01', '', 'Married', 0, 'S1', '0.0', 9.11, 'Engineering & IT', 'Junior', 5971355, '', 2, 3),
('EM5176', 'Kabupaten Bogor', 'Laki-laki', '1977-08-12', '2022-10-10', '2023-12-20', 'Married', 1, 'D1', '5.0', 9.38, 'Corporate Strategy & Communications', 'Staff', 3912423, '', 2, 2),
('EM9788', 'Kota Depok', 'Perempuan', '2000-05-11', '2022-11-21', '', 'Married', 0, 'D2', '4.0', 9.35, 'Engineering & IT', 'Staff', 4587865, '', 2, 1),
('EM0813', 'Kabupaten Bogor', 'Perempuan', '1983-10-10', '2023-03-27', '2024-05-12', 'Married', 2, 'SLTA', '2.0', 9.76, 'Finance & Accounting', 'Staff', 1506103, '', 2, 1),
('EM9430', 'Kota Depok', 'Laki-laki', '1972-06-12', '2022-11-14', '2023-04-02', 'Married', 0, 'D2', '1.0', 9.36, 'Service & Support', 'Staff', 4408552, '', 2, 3),
('EM5568', 'Kota Jakarta Timur', 'Perempuan', '1989-10-14', '2023-10-07', '', 'Married', 2, 'S1', '0.0', 9.24, 'Creative & Design', 'Junior', 6333281, '1.', 1, 1),
('EM10047', 'Kabupaten Bekasi', 'Perempuan', '1979-09-24', '2022-03-27', '2023-11-29', 'Married', 1, 'D3', '3.0', 9.83, 'Marketing', 'Staff', 4842742, '', 2, 2),
('EM10890', 'Kabupaten Bekasi', 'Perempuan', '1994-07-03', '2022-07-13', '2024-09-26', 'Single', 0, 'SLTA', '4.0', 9.54, 'Service & Support', 'Staff', 1038871, '', 2, 3),
('EM3156', 'Kota Bekasi', 'Laki-laki', '1998-12-29', '2023-02-09', '2024-10-24', 'Single', 0, 'D2', '7.0', 9.64, 'Operations', 'Staff', 3652213, '', 3, 1),
('EM9592', 'Kota Jakarta Timur', 'Perempuan', '1978-07-28', '2020-03-06', '', 'Married', 3, 'SLTA', '0.0', 9.72, 'Operations', 'Staff', 1756775, '', 1, 2),
('EM9167', 'Tangerang', 'Laki-laki', '1992-02-08', '2022-08-07', '', 'Married', 2, 'S1', '5.0', 9.57, 'Finance & Accounting', 'Junior', 5638022, '', 1, 3),
('EM11055', 'Kabupaten Bogor', 'Perempuan', '1986-04-13', '2022-11-07', '2024-02-05', 'Married', 0, 'D3', '9.0', 9.37, 'Creative & Design', 'Staff', 3383028, '', 3, 1),
('EM4143', 'Kabupaten Bekasi', 'Laki-laki', '1990-11-11', '2021-05-25', '2023-08-21', 'Married', 3, 'D3', '4.0', 9.29, 'Engineering & IT', 'Staff', 4232500, '', 3, 3),
('EM3474', 'Tangerang', 'Perempuan', '1999-02-26', '2021-11-06', '2023-04-06', 'Single', 0, 'D1', '6.0', 9.02, 'Marketing', 'Staff', 4044528, '', 2, 2),
('EM0140', 'Kota Jakarta Barat', 'Perempuan', '1976-02-04', '2021-04-03', '', 'Married', 2, 'S1', '4.0', 9.88, 'Service & Support', 'Junior', 5624599, '', 2, 1),
('EM0447', 'Kabupaten Bogor', 'Perempuan', '1989-01-09', '2020-02-06', '2023-07-10', 'Married', 3, 'D1', '2.0', 9.89, 'Service & Support', 'Staff', 3835228, '', 2, 1),
('EM4274', 'Kabupaten Bogor', 'Perempuan', '1973-05-15', '2022-09-08', '2024-10-21', 'Married', 3, 'SLTA', '8.0', 9.73, 'Creative & Design', 'Staff', 1191760, '', 1, 3),
('EM11585', 'Kota Jakarta Barat', 'Laki-laki', '1970-02-25', '2023-07-04', '2024-09-12', 'Married', 2, 'D1', '0.0', 9.61, 'Engineering & IT', 'Staff', 3260299, '', 3, 3),
('EM5392', 'Kota Jakarta Utara', 'Laki-laki', '1997-12-30', '2022-06-21', '2023-07-27', 'Single', 0, 'SLTA', '3.0', 9.40, 'Corporate Strategy & Communications', 'Staff', 1198662, '', 3, 2),
('EM5527', 'Kota Jakarta Pusat', 'Perempuan', '1968-06-10', '2022-07-13', '', 'Married', 2, 'SLTA', '6.0', 9.52, 'Finance & Accounting', 'Staff', 2754170, '', 1, 2),
('EM6853', 'Kabupaten Bekasi', 'Perempuan', '1984-04-18', '2023-02-01', '2023-11-11', 'Married', 3, 'D3', '7.0', 9.40, 'Corporate Strategy & Communications', 'Staff', 4249435, '', 3, 2),
('EM3778', 'Kabupaten Bogor', 'Perempuan', '1989-06-04', '2022-02-20', '', 'Married', 2, 'S1', '1.0', 9.59, 'HR', 'Junior', 5890796, '1.', 1, 3),
('EM4760', 'Kota Jakarta Pusat', 'Perempuan', '1988-07-26', '2021-02-14', '2023-06-07', 'Married', 1, 'D3', '3.0', 9.77, 'Service & Support', 'Staff', 3621806, '', 3, 3),
('EM7649', 'Kota Jakarta Timur', 'Laki-laki', '1978-04-30', '2023-07-20', '', 'Married', 2, 'S1', '2.0', 9.24, 'Operations', 'Junior', 6336331, '', 3, 3),
('EM3950', 'Kota Jakarta Timur', 'Perempuan', '1979-01-14', '2024-09-27', '', 'Married', 1, 'S1', '3.0', 9.02, 'Creative & Design', 'Junior', 6265718, '', 1, 2),
('EM3249', 'Kota Bekasi', 'Laki-laki', '1993-05-17', '2022-10-31', '2023-08-27', 'Single', 0, 'SLTA', '8.0', 9.16, 'Marketing', 'Staff', 1348872, '', 1, 3),
('EM6590', 'Tangerang', 'Perempuan', '1985-10-07', '2021-09-21', '2023-10-27', 'Single', 0, 'SLTA', '15.', 9.60, 'Creative & Design', 'Staff', 1083526, '', 1, 3),
('EM8027', 'Tangerang', 'Laki-laki', '1969-04-09', '2023-07-13', '', 'Divorce', 0, 'S1', '0.0', 9.76, 'HR', 'Junior', 6492381, '', 3, 2),
('EM0613', 'Kota Bekasi', 'Laki-laki', '1971-04-06', '2022-07-04', '', 'Married', 2, 'S1', '2.0', 9.56, 'Operations', 'Junior', 6709855, '', 2, 3),
('EM5698', 'Kepulauan Seribu', 'Perempuan', '1993-09-21', '2021-11-17', '2023-03-31', 'Married', 2, 'D2', '3.0', 9.62, 'Operations', 'Staff', 4622008, '', 1, 1),
('EM12248', 'Kota Jakarta Utara', 'Laki-laki', '1980-10-20', '2023-01-16', '2024-02-22', 'Married', 2, 'SLTA', '9.0', 9.05, 'HR', 'Staff', 2639742, '', 3, 3),
('EM11465', 'Kota Jakarta Pusat', 'Perempuan', '1987-04-09', '2022-06-20', '', 'Married', 3, 'S1', '3.0', 9.82, 'Corporate Strategy & Communications', 'Junior', 5907410, '', 2, 1),
('EM2135', 'Kabupaten Bogor', 'Laki-laki', '1995-06-14', '2021-03-28', '2023-05-08', 'Married', 0, 'SLTA', '1.0', 9.50, 'Service & Support', 'Staff', 1024102, '', 3, 3),
('EM15090', 'Kabupaten Bogor', 'Laki-laki', '1998-11-16', '2022-10-02', '', 'Single', 0, 'S1', '0.0', 9.34, 'Marketing', 'Junior', 7881882, '1.', 3, 3),
('EM3711', 'Kabupaten Bogor', 'Laki-laki', '1991-04-11', '2020-09-18', '2023-12-19', 'Married', 1, 'D2', '4.0', 9.25, 'Operations', 'Staff', 4001891, '', 2, 1),
('EM12015', 'Kota Bekasi', 'Laki-laki', '1981-03-19', '2020-02-15', '', 'Married', 2, 'D2', '5.0', 9.40, 'Engineering & IT', 'Staff', 4585126, '', 2, 2),
('EM4446', 'Kabupaten Bogor', 'Laki-laki', '1984-12-20', '2023-04-05', '2023-08-07', 'Married', 2, 'D3', '1.0', 9.79, 'Operations', 'Staff', 3778952, '', 3, 1),
('EM2166', 'Tangerang', 'Perempuan', '1979-04-11', '2022-07-10', '2023-08-27', 'Married', 0, 'SLTA', '14.', 9.76, 'Finance & Accounting', 'Staff', 1365248, '', 2, 2),
('EM0638', 'Kabupaten Bogor', 'Laki-laki', '1991-06-05', '2023-09-11', '2024-10-02', 'Single', 0, 'SLTA', '10.', 9.22, 'Service & Support', 'Staff', 1191009, '', 3, 1),
('EM7893', 'Kota Jakarta Barat', 'Laki-laki', '1994-07-30', '2022-07-10', '2023-11-14', 'Married', 0, 'SLTA', '2.0', 9.35, 'Service & Support', 'Staff', 2041402, '', 3, 2),
('EM7937', 'Kota Jakarta Selatan', 'Perempuan', '1973-07-10', '2021-10-11', '', 'Married', 0, 'S1', '0.0', 9.69, 'Marketing', 'Junior', 5039514, '', 1, 3),
('EM2592', 'Kabupaten Bekasi', 'Laki-laki', '1983-02-09', '2023-05-08', '2024-07-14', 'Married', 2, 'SLTA', '5.0', 9.22, 'Finance & Accounting', 'Staff', 2120065, '', 3, 2),
('EM13681', 'Kota Depok', 'Laki-laki', '1998-07-19', '2023-06-13', '2023-12-06', 'Married', 1, 'SLTA', '11.', 9.26, 'Engineering & IT', 'Staff', 1747765, '', 2, 3),
('EM3398', 'Kota Jakarta Pusat', 'Laki-laki', '1970-06-06', '2021-02-28', '2023-02-28', 'Married', 0, 'D3', '8.0', 9.81, 'Operations', 'Staff', 3791464, '', 2, 2),
('EM9689', 'Kota Jakarta Timur', 'Laki-laki', '1972-04-01', '2020-01-17', '2024-04-04', 'Married', 2, 'D3', '4.0', 9.28, 'Marketing', 'Staff', 3529953, '', 2, 2),
('EM7776', 'Kota Jakarta Selatan', 'Laki-laki', '1991-08-29', '2022-09-13', '2023-11-14', 'Married', 0, 'SLTA', '0.0', 9.45, 'Operations', 'Staff', 1204523, '', 3, 1),
('EM13914', 'Kota Depok', 'Laki-laki', '1995-05-02', '2023-03-07', '2024-04-04', 'Single', 0, 'SLTA', '10.', 9.83, 'Service & Support', 'Staff', 1942489, '', 3, 2),
('EM12852', 'Kota Jakarta Barat', 'Laki-laki', '1996-05-09', '2021-03-14', '2024-05-22', 'Married', 0, 'SLTA', '13.', 9.40, 'Operations', 'Staff', 2168427, '', 3, 1),
('EM3244', 'Kabupaten Bekasi', 'Laki-laki', '1984-04-27', '2021-10-25', '2024-01-18', 'Married', 2, 'SLTA', '13.', 9.38, 'Engineering & IT', 'Staff', 1224103, '', 2, 3),
('EM9961', 'Kota Depok', 'Perempuan', '1996-11-05', '2023-05-22', '2023-10-02', 'Single', 0, 'D2', '1.0', 9.15, 'Service & Support', 'Staff', 4063989, '', 1, 3),
('EM6664', 'Kota Depok', 'Perempuan', '1998-11-28', '2022-05-29', '2023-07-15', 'Married', 1, 'D2', '6.0', 9.12, 'Marketing', 'Staff', 3066833, '', 1, 1),
('EM7906', 'Kabupaten Bekasi', 'Laki-laki', '1986-06-11', '2022-08-08', '2023-10-17', 'Married', 3, 'D3', '3.0', 9.52, 'Operations', 'Staff', 3370734, '1.', 2, 3),
('EM1863', 'Kabupaten Bekasi', 'Laki-laki', '1982-12-05', '2021-12-04', '2024-04-01', 'Married', 3, 'SLTA', '0.0', 9.70, 'Engineering & IT', 'Staff', 1406794, '', 1, 3),
('EM15675', 'Kota Jakarta Pusat', 'Laki-laki', '1977-10-10', '2021-10-09', '', 'Married', 0, 'S1', '0.0', 9.03, 'Engineering & IT', 'Junior', 5655634, '', 1, 1),
('EM14744', 'Kota Jakarta Barat', 'Laki-laki', '1987-06-10', '2020-10-07', '', 'Married', 3, 'S1', '1.0', 9.06, 'Service & Support', 'Junior', 7592711, '', 2, 2),
('EM6303', 'Tangerang', 'Perempuan', '1994-12-28', '2022-05-29', '2024-07-28', 'Single', 0, 'SLTA', '1.0', 9.07, 'Finance & Accounting', 'Staff', 1570620, '', 2, 2),
('EM3547', 'Kota Jakarta Utara', 'Perempuan', '1980-10-05', '2023-06-08', '2024-08-22', 'Married', 3, 'D2', '6.0', 9.31, 'Creative & Design', 'Staff', 3582295, '', 3, 3),
('EM12860', 'Kota Jakarta Selatan', 'Laki-laki', '1998-08-07', '2021-04-10', '2023-05-18', 'Single', 0, 'SLTA', '13.', 9.79, 'HR', 'Staff', 1494086, '', 3, 3),
('EM3477', 'Kota Jakarta Barat', 'Perempuan', '1994-03-18', '2021-11-08', '', 'Married', 1, 'S1', '1.0', 9.63, 'Marketing', 'Junior', 5194087, '1.', 2, 3),
('EM7163', 'Kota Jakarta Selatan', 'Perempuan', '1990-04-30', '2023-07-12', '', 'Married', 0, 'S1', '3.0', 9.42, 'Finance & Accounting', 'Junior', 5720326, '', 3, 3),
('EM1885', 'Tangerang', 'Perempuan', '1988-03-16', '2021-02-14', '2024-05-16', 'Married', 0, 'D1', '1.0', 9.57, 'HR', 'Staff', 4013938, '1.', 1, 2),
('EM0573', 'Tangerang', 'Perempuan', '1978-06-24', '2021-02-09', '2024-05-07', 'Married', 2, 'D2', '5.0', 9.36, 'Engineering & IT', 'Staff', 4102561, '', 1, 3),
('EM7460', 'Kabupaten Bekasi', 'Perempuan', '1976-11-15', '2020-11-16', '2021-07-31', 'Married', 0, 'SLTA', '10.', 9.78, 'Engineering & IT', 'Staff', 1973438, '', 3, 2),
('EM6717', 'Kota Jakarta Barat', 'Laki-laki', '1970-08-17', '2022-10-17', '2023-11-08', 'Married', 2, 'SLTA', '', 9.21, 'Operations', 'Staff', 1062282, '', 2, 3),
('EM6718', 'Kota Jakarta Timur', 'Perempuan', '1975-01-15', '2022-10-18', '2023-11-29', 'Married', 0, 'SLTA', '15.', 9.64, 'HR', 'Staff', 1101084, '', 2, 3),
('EM15655', 'Kabupaten Bogor', 'Laki-laki', '1988-06-13', '2021-10-23', '', 'Married', 0, 'S1', '0.0', 9.74, 'Corporate Strategy & Communications', 'Junior', 7572860, '', 1, 1),
('EM13913', 'Kota Jakarta Pusat', 'Laki-laki', '1972-10-25', '2021-03-06', '', 'Married', 4, 'S1', '1.0', 9.34, 'Service & Support', 'Junior', 5167588, '', 2, 3),
('EM13359', 'Kota Jakarta Pusat', 'Perempuan', '1980-08-16', '2020-08-30', '', 'Married', 4, 'S1', '5.0', 9.23, 'Corporate Strategy & Communications', 'Junior', 5003539, '1.', 2, 2),
('EM6955', 'Kepulauan Seribu', 'Laki-laki', '1993-03-03', '2023-11-14', '', 'Married', 1, 'S1', '1.0', 9.02, 'Creative & Design', 'Senior', 7472060, '', 4, 4),
('EM4966', 'Kabupaten Bekasi', 'Perempuan', '1982-05-25', '2021-11-16', '2023-04-01', 'Married', 3, 'SLTA', '13.', 9.49, 'Corporate Strategy & Communications', 'Staff', 1493050, '', 1, 3),
('EM8606', 'Kota Jakarta Timur', 'Perempuan', '1988-05-24', '2021-11-13', '2024-02-28', 'Single', 0, 'D1', '', 9.38, 'Corporate Strategy & Communications', 'Staff', 3431710, '', 1, 3),
('EM6747', 'Kabupaten Bekasi', 'Perempuan', '1989-12-07', '2020-01-31', '', 'Married', 2, 'S1', '2.0', 9.10, 'Operations', 'Senior', 7632034, '', 3, 3),
('EM4931', 'Kota Bogor', 'Perempuan', '1986-09-14', '2021-08-23', '', 'Divorce', 2, 'S1', '0.0', 9.23, 'Finance & Accounting', 'Junior', 6816160, '', 1, 1),
('EM3341', 'Kota Jakarta Utara', 'Laki-laki', '1994-11-18', '2022-08-29', '2023-09-28', 'Married', 1, 'SLTA', '3.0', 9.68, 'Operations', 'Staff', 1987285, '', 1, 2),
('EM6610', 'Kepulauan Seribu', 'Perempuan', '1975-02-06', '2022-11-24', '', 'Married', 2, 'D2', '1.0', 9.47, 'Service & Support', 'Staff', 4465118, '', 1, 2),
('EM11498', 'Kota Jakarta Selatan', 'Laki-laki', '1978-01-10', '2021-09-15', '2024-04-13', 'Married', 2, 'D3', '8.0', 9.26, 'Corporate Strategy & Communications', 'Staff', 3100260, '', 2, 3),
('EM15209', 'Kota Bekasi', 'Laki-laki', '1973-05-16', '2023-10-22', '', 'Married', 0, 'D2', '1.0', 9.47, 'Marketing', 'Staff', 4659744, '', 3, 2),
('EM5582', 'Kota Jakarta Selatan', 'Laki-laki', '1991-03-04', '2021-11-22', '2024-03-14', 'Married', 3, 'SLTA', '', 9.58, 'Marketing', 'Staff', 1557754, '', 2, 1),
('EM5384', 'Tangerang', 'Laki-laki', '1997-11-24', '2022-06-02', '2023-07-04', 'Single', 0, 'D2', '7.0', 9.73, 'HR', 'Staff', 4873268, '', 3, 3),
('EM12429', 'Kota Jakarta Selatan', 'Perempuan', '1982-07-04', '2023-05-12', '', 'Married', 1, 'S1', '0.0', 9.14, 'Engineering & IT', 'Junior', 7133256, '', 3, 3),
('EM7193', 'Kota Jakarta Selatan', 'Laki-laki', '1969-03-10', '2020-10-03', '2023-01-11', 'Married', 3, 'SLTA', '3.0', 9.34, 'Creative & Design', 'Staff', 1061975, '1.', 3, 2),
('EM0881', 'Kota Jakarta Selatan', 'Perempuan', '1978-02-05', '2024-10-11', '', 'Married', 3, 'D2', '4.0', 9.20, 'HR', 'Staff', 4672316, '1.', 2, 1),
('EM10112', 'Kota Depok', 'Laki-laki', '1979-12-08', '2023-09-20', '', 'Married', 2, 'D2', '2.0', 9.20, 'Service & Support', 'Staff', 3766526, '', 2, 2),
('EM13133', 'Kota Bekasi', 'Perempuan', '1987-03-23', '2020-10-30', '2024-04-01', 'Married', 1, 'D2', '4.0', 9.02, 'Service & Support', 'Staff', 4620289, '', 3, 3),
('EM5616', 'Tangerang', 'Laki-laki', '1987-07-17', '2023-03-15', '2024-05-09', 'Married', 2, 'SLTA', '12.', 9.07, 'Engineering & IT', 'Staff', 1186811, '1.', 3, 1),
('EM3762', 'Kabupaten Bogor', 'Perempuan', '1984-02-17', '2021-01-10', '2023-03-30', 'Married', 3, 'D1', '8.0', 9.39, 'Creative & Design', 'Staff', 3044262, '', 2, 2),
('EM1228', 'Kabupaten Bogor', 'Laki-laki', '1994-12-19', '2023-07-20', '2024-09-07', 'Married', 1, 'SLTA', '0.0', 9.58, 'Engineering & IT', 'Staff', 1928604, '', 1, 2),
('EM8242', 'Kota Jakarta Utara', 'Perempuan', '1994-01-13', '2022-09-05', '2024-01-19', 'Married', 2, 'D1', '0.0', 9.63, 'Marketing', 'Staff', 4338968, '1.', 3, 2),
('EM9832', 'Kota Jakarta Timur', 'Perempuan', '1995-05-23', '2021-04-11', '2023-05-30', 'Married', 2, 'SLTA', '11.', 9.71, 'Finance & Accounting', 'Staff', 1340430, '', 2, 2),
('EM15503', 'Kota Depok', 'Laki-laki', '1975-05-03', '2024-10-30', '', 'Married', 0, 'S1', '0.0', 9.73, 'Corporate Strategy & Communications', 'Junior', 5073363, '', 1, 1),
('EM9847', 'Kota Jakarta Timur', 'Laki-laki', '1967-07-07', '2024-05-25', '2024-10-31', 'Married', 0, 'D1', '0.0', 9.77, 'Finance & Accounting', 'Staff', 3989848, '1.', 2, 2),
('EM9175', 'Kabupaten Bogor', 'Laki-laki', '1983-08-24', '2022-08-16', '2023-09-30', 'Married', 1, 'SLTA', '0.0', 9.26, 'HR', 'Staff', 1676312, '', 1, 3),
('EM7583', 'Kota Jakarta Timur', 'Laki-laki', '1998-02-09', '2021-10-30', '2023-05-07', 'Single', 0, 'SLTA', '5.0', 9.64, 'Operations', 'Staff', 1203354, '', 1, 1),
('EM12684', 'Kota Jakarta Pusat', 'Laki-laki', '1990-10-14', '2023-08-24', '2024-09-26', 'Married', 2, 'SLTA', '14.', 9.26, 'HR', 'Staff', 1453063, '', 1, 3),
('EM0441', 'Kota Jakarta Barat', 'Perempuan', '1980-07-29', '2022-01-05', '2023-01-31', 'Married', 0, 'SLTA', '6.0', 9.07, 'Corporate Strategy & Communications', 'Staff', 1714913, '', 3, 2),
('EM7611', 'Kota Jakarta Selatan', 'Laki-laki', '1967-05-12', '2022-02-16', '2023-07-30', 'Married', 4, 'SLTA', '13.', 9.60, 'Marketing', 'Staff', 1234836, '', 3, 1),
('EM5493', 'Tangerang', 'Perempuan', '1983-01-10', '2022-03-10', '2023-05-15', 'Married', 1, 'SLTA', '8.0', 9.60, 'Service & Support', 'Staff', 1407830, '', 1, 1),
('EM12110', 'Kabupaten Bekasi', 'Perempuan', '1983-11-21', '2021-11-07', '', 'Divorce', 2, 'S1', '1.0', 9.72, 'Creative & Design', 'Junior', 5335369, '1.', 2, 1),
('EM2596', 'Kabupaten Bogor', 'Perempuan', '1984-04-13', '2020-05-24', '2023-01-04', 'Married', 2, 'D3', '2.0', 9.50, 'Engineering & IT', 'Staff', 4806601, '', 3, 1),
('EM8406', 'Kota Jakarta Selatan', 'Perempuan', '1993-06-09', '2022-01-25', '2023-03-18', 'Married', 1, 'D1', '4.0', 9.45, 'Corporate Strategy & Communications', 'Staff', 4976263, '', 2, 3),
('EM3937', 'Kabupaten Bogor', 'Laki-laki', '1984-05-24', '2023-08-26', '2024-10-28', 'Married', 1, 'SLTA', '14.', 9.56, 'Operations', 'Staff', 1560997, '', 2, 1),
('EM10536', 'Kota Jakarta Utara', 'Laki-laki', '2000-09-25', '2022-05-19', '2024-08-16', 'Single', 0, 'SLTA', '4.0', 9.03, 'Marketing', 'Staff', 2263833, '', 3, 2),
('EM10944', 'Kabupaten Bogor', 'Laki-laki', '1980-06-01', '2023-12-16', '2024-03-28', 'Married', 2, 'SLTA', '15.', 9.18, 'Corporate Strategy & Communications', 'Staff', 1051293, '', 3, 3),
('EM3745', 'Tangerang', 'Perempuan', '1989-12-22', '2021-12-07', '2023-01-08', 'Married', 0, 'SLTA', '9.0', 9.74, 'Engineering & IT', 'Staff', 2006064, '', 3, 1),
('EM7397', 'Tangerang', 'Perempuan', '1998-09-21', '2020-07-04', '2023-10-06', 'Single', 0, 'SLTA', '6.0', 9.02, 'Operations', 'Staff', 1162206, '', 1, 2),
('EM2260', 'Kota Jakarta Timur', 'Laki-laki', '1993-09-29', '2022-05-22', '2023-10-31', 'Married', 3, 'SLTA', '10.', 9.39, 'Marketing', 'Staff', 1616103, '', 3, 3),
('EM4640', 'Kota Jakarta Selatan', 'Laki-laki', '1975-10-16', '2021-12-20', '2023-04-24', 'Married', 0, 'D1', '0.0', 9.12, 'Creative & Design', 'Staff', 3799791, '', 3, 2),
('EM7807', 'Kota Jakarta Utara', 'Laki-laki', '1999-07-04', '2020-11-14', '2024-01-06', 'Married', 0, 'SLTA', '', 9.11, 'Engineering & IT', 'Staff', 1181765, '', 1, 1),
('EM14171', 'Tangerang', 'Perempuan', '2023-03-29', '2021-03-29', '2023-06-27', 'Married', 2, 'SLTA', '14.', 9.06, 'Finance & Accounting', 'Staff', 2080793, '', 2, 1),
('EM14521', 'Kepulauan Seribu', 'Perempuan', '1983-04-22', '2022-03-08', '2023-10-19', 'Married', 2, 'S1', '1.0', 9.21, 'Engineering & IT', 'Junior', 6463707, '', 2, 3),
('EM3446', 'Kabupaten Bekasi', 'Laki-laki', '1980-03-20', '2024-08-03', '', 'Married', 2, 'SLTA', '11.', 9.19, 'Marketing', 'Staff', 2381409, '', 1, 3),
('EM9886', 'Kota Depok', 'Laki-laki', '1994-12-10', '2022-08-25', '', 'Single', 0, 'S1', '2.0', 9.50, 'Operations', 'Junior', 6900548, '', 3, 2),
('EM6934', 'Kota Jakarta Timur', 'Laki-laki', '1977-07-26', '2021-09-25', '2024-04-12', 'Married', 2, 'D1', '2.0', 9.63, 'Service & Support', 'Staff', 4323465, '1.', 1, 1),
('EM5431', 'Kabupaten Bekasi', 'Laki-laki', '1974-07-04', '2020-10-05', '2023-02-20', 'Married', 2, 'SLTA', '7.0', 9.52, 'Marketing', 'Staff', 1929227, '', 1, 1),
('EM9009', 'Kota Depok', 'Laki-laki', '1993-06-05', '2021-05-03', '', 'Married', 1, 'S1', '3.0', 9.39, 'Service & Support', 'Junior', 5149970, '1.', 3, 1);
INSERT INTO `data_employee_db` (`employee_id`, `domisili`, `jenis_kelamin`, `date_of_birth`, `join_date`, `resign_date`, `marriage_stat`, `dependant`, `education`, `absent_90D`, `avg_time_work`, `departemen`, `position`, `income`, `total_komp`, `job_satisfaction`, `performance_rating`) VALUES
('EM1912', 'Kota Bogor', 'Perempuan', '1977-03-07', '2020-05-22', '2024-07-11', 'Married', 2, 'SLTA', '2.0', 9.14, 'Finance & Accounting', 'Staff', 1850223, '', 3, 3),
('EM8053', 'Kabupaten Bogor', 'Perempuan', '1999-01-04', '2020-10-17', '2023-01-05', 'Married', 2, 'SLTA', '13.', 9.03, 'Operations', 'Staff', 1949148, '', 1, 3),
('EM12950', 'Kota Jakarta Selatan', 'Perempuan', '1988-03-13', '2021-02-13', '2024-06-13', 'Married', 1, 'D2', '7.0', 9.02, 'Corporate Strategy & Communications', 'Staff', 3605393, '', 2, 1),
('EM12055', 'Kabupaten Bogor', 'Laki-laki', '1997-04-19', '2023-06-07', '2024-07-21', 'Married', 1, 'SLTA', '6.0', 9.73, 'Engineering & IT', 'Staff', 1213242, '', 1, 2),
('EM12433', 'Kota Jakarta Timur', 'Perempuan', '1988-08-29', '2021-05-26', '2024-07-25', 'Married', 2, 'SLTA', '1.0', 9.41, 'Creative & Design', 'Staff', 1531681, '', 1, 2),
('EM6852', 'Kabupaten Bekasi', 'Laki-laki', '1969-06-05', '2022-01-25', '2023-03-15', 'Married', 3, 'SLTA', '0.0', 9.38, 'Marketing', 'Staff', 1048418, '', 3, 1),
('EM4201', 'Kabupaten Bogor', 'Perempuan', '1969-01-10', '2021-11-15', '', 'Married', 0, 'D2', '0.0', 9.17, 'Finance & Accounting', 'Staff', 3398300, '', 1, 3),
('EM10307', 'Tangerang', 'Perempuan', '1995-10-14', '2021-05-19', '', 'Married', 1, 'D1', '0.0', 9.82, 'HR', 'Staff', 3278501, '', 3, 1),
('EM4877', 'Kota Jakarta Pusat', 'Perempuan', '1993-09-01', '2022-03-15', '2023-07-27', 'Married', 1, 'D2', '7.0', 9.12, 'Corporate Strategy & Communications', 'Staff', 3843350, '', 3, 3),
('EM12313', 'Kota Jakarta Timur', 'Laki-laki', '1987-01-14', '2021-07-18', '2023-08-23', 'Married', 2, 'SLTA', '14.', 9.46, 'Service & Support', 'Staff', 1352489, '', 1, 3),
('EM5628', 'Kepulauan Seribu', 'Laki-laki', '1992-07-22', '2022-05-10', '2023-07-05', 'Married', 1, 'D2', '2.0', 9.74, 'Service & Support', 'Staff', 4708725, '', 1, 3),
('EM8003', 'Kota Jakarta Timur', 'Laki-laki', '1973-04-20', '2023-05-24', '2024-07-04', 'Married', 3, 'SLTA', '12.', 9.41, 'Creative & Design', 'Staff', 1567993, '', 1, 1),
('EM0073', 'Kota Jakarta Selatan', 'Laki-laki', '1999-11-04', '2024-09-05', '', 'Single', 0, 'S1', '5.0', 9.01, 'Finance & Accounting', 'Junior', 5965718, '', 1, 2),
('EM5631', 'Kota Jakarta Timur', 'Perempuan', '1998-07-23', '2023-05-15', '2024-08-02', 'Married', 2, 'SLTA', '7.0', 9.76, 'Operations', 'Staff', 2190290, '', 3, 1),
('EM11737', 'Kota Jakarta Barat', 'Perempuan', '1983-10-14', '2020-10-16', '2022-11-20', 'Married', 0, 'SLTA', '8.0', 9.64, 'Finance & Accounting', 'Staff', 2648131, '', 1, 2),
('EM4763', 'Kabupaten Bogor', 'Perempuan', '1989-04-12', '2023-02-21', '2024-06-20', 'Married', 2, 'SLTA', '3.0', 9.70, 'Operations', 'Staff', 2658840, '', 2, 1),
('EM15410', 'Kota Jakarta Timur', 'Perempuan', '1996-10-27', '2023-10-07', '', 'Married', 2, 'SLTA', '6.0', 9.76, 'HR', 'Staff', 2271537, '', 2, 2),
('EM0406', 'Kota Jakarta Utara', 'Laki-laki', '1975-01-07', '2021-09-25', '2023-12-07', 'Married', 3, 'SLTA', '3.0', 9.81, 'Creative & Design', 'Staff', 1578410, '', 1, 1),
('EM1190', 'Kabupaten Bekasi', 'Laki-laki', '2000-12-30', '2022-04-06', '2023-08-09', 'Married', 0, 'SLTA', '2.0', 9.06, 'Engineering & IT', 'Staff', 1113613, '', 2, 3),
('EM13831', 'Tangerang', 'Laki-laki', '1997-03-15', '2020-08-09', '2023-12-29', 'Married', 0, 'SLTA', '13.', 9.36, 'Finance & Accounting', 'Staff', 1192348, '', 1, 2),
('EM6309', 'Tangerang', 'Laki-laki', '1985-02-19', '2020-06-21', '', 'Married', 1, 'S1', '0.0', 9.70, 'Engineering & IT', 'Junior', 6459363, '', 2, 1),
('EM10396', 'Tangerang', 'Laki-laki', '1976-06-07', '2022-01-31', '2023-02-19', 'Married', 2, 'SLTA', '', 9.80, 'HR', 'Staff', 1431058, '', 1, 3),
('EM10749', 'Kota Jakarta Timur', 'Perempuan', '1982-04-23', '2020-03-20', '', 'Married', 2, 'S1', '2.0', 9.21, 'Marketing', 'Junior', 5346398, '', 2, 1),
('EM2065', 'Kota Jakarta Barat', 'Perempuan', '1972-06-23', '2022-08-15', '', 'Married', 3, 'D2', '1.0', 9.73, 'Marketing', 'Staff', 4380790, '', 2, 3),
('EM5538', 'Kabupaten Bogor', 'Perempuan', '1975-06-20', '2021-07-25', '2022-12-30', 'Married', 0, 'SLTA', '3.0', 9.62, 'Operations', 'Staff', 2325492, '', 2, 1),
('EM0910', 'Kota Jakarta Utara', 'Perempuan', '1998-03-21', '2023-01-17', '2024-03-28', 'Married', 0, 'D2', '3.0', 9.23, 'HR', 'Staff', 4606024, '', 2, 2),
('EM7640', 'Kabupaten Bogor', 'Perempuan', '1976-02-02', '2021-05-25', '2023-08-30', 'Married', 2, 'SLTA', '1.0', 9.60, 'Engineering & IT', 'Staff', 1734737, '', 2, 3),
('EM9302', 'Kota Jakarta Selatan', 'Perempuan', '1984-11-03', '2020-10-17', '2023-03-26', 'Divorce', 3, 'D3', '4.0', 9.81, 'Finance & Accounting', 'Staff', 3900389, '', 3, 3),
('EM11731', 'Kota Jakarta Utara', 'Laki-laki', '1996-10-28', '2020-10-05', '2023-12-14', 'Single', 0, 'SLTA', '11.', 9.51, 'Creative & Design', 'Staff', 1511124, '', 3, 3),
('EM10136', 'Kepulauan Seribu', 'Perempuan', '1996-02-28', '2022-12-11', '2024-01-31', 'Single', 0, 'SLTA', '9.0', 9.62, 'Service & Support', 'Staff', 2692131, '', 2, 2),
('EM12150', 'Kota Depok', 'Perempuan', '1994-09-20', '2020-03-23', '', 'Single', 0, 'S1', '0.0', 9.16, 'Engineering & IT', 'Junior', 6201371, '', 3, 1),
('EM10887', 'Tangerang', 'Laki-laki', '1980-02-22', '2021-07-10', '2024-10-07', 'Married', 3, 'D3', '3.0', 9.34, 'Engineering & IT', 'Staff', 3883893, '', 1, 2),
('EM5376', 'Kota Jakarta Timur', 'Perempuan', '1990-03-28', '2020-05-25', '2023-01-09', 'Married', 3, 'SLTA', '6.0', 9.34, 'Operations', 'Staff', 2430859, '', 1, 2),
('EM10759', 'Tangerang', 'Perempuan', '1971-04-29', '2023-05-02', '2024-07-07', 'Married', 1, 'D1', '3.0', 9.50, 'HR', 'Staff', 3651769, '', 3, 3),
('EM8556', 'Tangerang', 'Perempuan', '1996-05-08', '2023-05-08', '2024-05-30', 'Married', 1, 'SLTA', '0.0', 9.82, 'Corporate Strategy & Communications', 'Staff', 1249229, '', 3, 1),
('EM6759', 'Kabupaten Bekasi', 'Laki-laki', '1967-07-19', '2022-03-01', '2024-07-15', 'Married', 0, 'SLTA', '4.0', 9.08, 'Corporate Strategy & Communications', 'Staff', 1931854, '', 3, 2),
('EM0716', 'Kota Jakarta Barat', 'Laki-laki', '1971-01-21', '2023-07-04', '2023-10-11', 'Divorce', 2, 'SLTA', '10.', 9.84, 'Marketing', 'Staff', 2353912, '', 1, 3),
('EM14416', 'Kota Jakarta Barat', 'Laki-laki', '1975-08-05', '2021-06-12', '2023-10-18', 'Married', 3, 'D2', '2.0', 9.73, 'Operations', 'Staff', 4205490, '', 3, 3),
('EM1356', 'Kota Bogor', 'Perempuan', '1987-02-13', '2022-09-21', '2023-02-12', 'Single', 0, 'SLTA', '0.0', 9.65, 'HR', 'Staff', 1373998, '', 3, 1),
('EM4581', 'Kota Jakarta Barat', 'Laki-laki', '1989-08-18', '2023-07-17', '2024-10-02', 'Married', 2, 'D3', '4.0', 9.28, 'Creative & Design', 'Staff', 3795606, '1.', 1, 1),
('EM2591', 'Kota Jakarta Pusat', 'Laki-laki', '1978-01-12', '2021-05-02', '2024-10-05', 'Married', 2, 'D3', '1.0', 9.62, 'HR', 'Staff', 3159481, '', 2, 3),
('EM7313', 'Kota Jakarta Pusat', 'Perempuan', '1975-12-31', '2023-09-05', '2024-10-10', 'Married', 5, 'SLTA', '8.0', 9.27, 'Engineering & IT', 'Staff', 1751928, '', 3, 1),
('EM13327', 'Kota Jakarta Timur', 'Laki-laki', '1997-12-03', '2023-05-19', '2023-10-15', 'Single', 0, 'SLTA', '5.0', 9.51, 'Creative & Design', 'Staff', 2337403, '', 3, 1),
('EM12330', 'Kota Jakarta Pusat', 'Laki-laki', '1988-08-26', '2022-08-11', '2024-09-25', 'Married', 3, 'SLTA', '2.0', 9.53, 'Engineering & IT', 'Staff', 1135339, '', 1, 1),
('EM1308', 'Kota Jakarta Barat', 'Perempuan', '1985-05-05', '2022-05-08', '2024-07-06', 'Married', 2, 'SLTA', '7.0', 9.78, 'Marketing', 'Staff', 2410392, '', 1, 2),
('EM9907', 'Tangerang', 'Perempuan', '1978-10-19', '2022-10-17', '2024-02-12', 'Divorce', 0, 'D2', '8.0', 9.02, 'Marketing', 'Staff', 3886623, '', 3, 2),
('EM13153', 'Kota Jakarta Barat', 'Perempuan', '1994-08-16', '2022-12-07', '', 'Married', 0, 'S1', '4.0', 9.65, 'Creative & Design', 'Junior', 6595900, '', 2, 3),
('EM5499', 'Kota Jakarta Timur', 'Perempuan', '1990-05-11', '2024-04-11', '2024-10-25', 'Married', 0, 'D1', '0.0', 9.25, 'Creative & Design', 'Staff', 4524106, '', 1, 1),
('EM13629', 'Tangerang', 'Perempuan', '1978-08-16', '2021-11-03', '', 'Married', 3, 'S1', '4.0', 9.27, 'Creative & Design', 'Junior', 5449473, '', 1, 1),
('EM10255', 'Kota Jakarta Utara', 'Perempuan', '1981-07-07', '2023-11-13', '2024-05-11', 'Married', 0, 'SLTA', '0.0', 9.88, 'Creative & Design', 'Staff', 1113600, '', 2, 3),
('EM2425', 'Kota Bogor', 'Perempuan', '1990-02-26', '2020-09-12', '2024-01-31', 'Married', 3, 'D2', '1.0', 9.68, 'Engineering & IT', 'Staff', 4768797, '', 1, 1),
('EM4262', 'Kota Jakarta Selatan', 'Perempuan', '1998-10-02', '2023-08-01', '2024-01-09', 'Single', 0, 'SLTA', '1.0', 9.90, 'Operations', 'Staff', 1732843, '', 2, 3),
('EM13449', 'Kota Jakarta Timur', 'Perempuan', '1985-02-01', '2023-05-23', '2024-06-23', 'Single', 0, 'SLTA', '11.', 9.67, 'Engineering & IT', 'Staff', 1752338, '', 1, 2),
('EM13804', 'Kabupaten Bogor', 'Laki-laki', '1981-08-23', '2020-06-12', '', 'Married', 5, 'S1', '3.0', 9.87, 'Marketing', 'Junior', 5963523, '', 3, 3),
('EM5620', 'Kepulauan Seribu', 'Laki-laki', '1980-05-24', '2022-03-30', '', 'Married', 1, 'S1', '1.0', 9.38, 'HR', 'Junior', 6269175, '', 2, 1),
('EM11935', 'Kota Jakarta Timur', 'Laki-laki', '1982-07-16', '2022-07-20', '2024-09-06', 'Married', 3, 'SLTA', '2.0', 9.42, 'HR', 'Staff', 1745517, '3.', 2, 2),
('EM8302', 'Kabupaten Bekasi', 'Perempuan', '1983-07-04', '2023-02-06', '2024-05-03', 'Married', 2, 'SLTA', '0.0', 9.56, 'Engineering & IT', 'Staff', 1425278, '', 1, 3),
('EM1943', 'Kota Jakarta Pusat', 'Laki-laki', '1983-10-22', '2024-08-14', '', 'Married', 3, 'D2', '2.0', 9.05, 'Operations', 'Staff', 4455046, '', 1, 1),
('EM10152', 'Kota Jakarta Selatan', 'Perempuan', '1996-05-05', '2023-01-24', '2024-09-01', 'Single', 0, 'D2', '5.0', 9.70, 'Creative & Design', 'Staff', 3473191, '', 3, 3),
('EM14155', 'Kota Jakarta Pusat', 'Perempuan', '1984-01-17', '2022-02-06', '', 'Married', 3, 'S1', '2.0', 9.26, 'Operations', 'Junior', 5712980, '', 1, 3),
('EM8741', 'Kota Depok', 'Perempuan', '1993-04-19', '2023-01-16', '2024-06-12', 'Married', 1, 'D2', '1.0', 9.88, 'Finance & Accounting', 'Staff', 4999248, '', 3, 3),
('EM3577', 'Kota Jakarta Barat', 'Perempuan', '1995-10-28', '2021-08-31', '2023-12-27', 'Married', 1, 'SLTA', '7.0', 9.89, 'Operations', 'Staff', 1313380, '', 2, 3),
('EM9136', 'Kabupaten Bogor', 'Laki-laki', '1968-03-16', '2022-06-05', '2024-10-25', 'Married', 2, 'SLTA', '5.0', 9.22, 'Marketing', 'Staff', 2929207, '', 3, 1),
('EM0972', 'Kota Jakarta Timur', 'Laki-laki', '1975-04-20', '2022-08-14', '2024-10-02', 'Married', 0, 'SLTA', '0.0', 9.43, 'Service & Support', 'Staff', 1245936, '', 3, 2),
('EM12175', 'Kepulauan Seribu', 'Perempuan', '1993-10-23', '2021-06-14', '2023-08-11', 'Married', 1, 'SLTA', '12.', 9.50, 'Operations', 'Staff', 1740095, '', 2, 1),
('EM1188', 'Tangerang', 'Laki-laki', '1994-02-02', '2021-04-04', '2024-05-18', 'Married', 1, 'D3', '5.0', 9.84, 'Service & Support', 'Staff', 3681191, '', 3, 1),
('EM1231', 'Kabupaten Bogor', 'Perempuan', '1985-06-07', '2022-07-21', '2023-11-19', 'Married', 1, 'D3', '6.0', 9.88, 'Service & Support', 'Staff', 3385792, '', 1, 3),
('EM12756', 'Kota Jakarta Selatan', 'Laki-laki', '1975-06-21', '2020-03-06', '', 'Married', 2, 'S1', '3.0', 9.16, 'Service & Support', 'Junior', 5558043, '', 2, 3),
('EM1667', 'Kota Bekasi', 'Perempuan', '1997-03-12', '2020-03-16', '', 'Single', 0, 'S1', '0.0', 9.89, 'Creative & Design', 'Junior', 5544145, '', 1, 2),
('EM0523', 'Kota Jakarta Timur', 'Laki-laki', '1993-07-22', '2022-09-14', '2023-10-30', 'Married', 0, 'SLTA', '10.', 9.87, 'Marketing', 'Staff', 2096108, '', 2, 3),
('EM9500', 'Kabupaten Bogor', 'Laki-laki', '1988-09-17', '2024-06-19', '', 'Married', 1, 'S1', '0.0', 9.16, 'Marketing', 'Junior', 6394044, '', 1, 1),
('EM15350', 'Kota Jakarta Pusat', 'Perempuan', '2000-06-08', '2021-10-23', '', 'Single', 0, 'D2', '4.0', 9.25, 'Service & Support', 'Staff', 4741905, '', 2, 3),
('EM14322', 'Kota Bogor', 'Laki-laki', '1994-05-07', '2023-08-07', '2024-10-02', 'Single', 0, 'D1', '10.', 9.70, 'Service & Support', 'Staff', 3059216, '1.', 3, 3),
('EM8862', 'Kabupaten Bekasi', 'Perempuan', '1978-02-24', '2022-12-18', '', 'Married', 3, 'S1', '1.0', 9.19, 'Finance & Accounting', 'Junior', 6751464, '', 3, 3),
('EM10790', 'Tangerang', 'Laki-laki', '2000-07-18', '2021-08-15', '2023-09-23', 'Single', 0, 'SLTA', '5.0', 9.64, 'Service & Support', 'Staff', 1563675, '', 1, 3),
('EM6566', 'Kabupaten Bekasi', 'Laki-laki', '1994-11-14', '2021-07-25', '2022-02-24', 'Single', 0, 'SLTA', '10.', 9.22, 'Creative & Design', 'Staff', 2734521, '', 3, 3),
('EM5670', 'Tangerang', 'Laki-laki', '1992-08-04', '2020-09-04', '', 'Divorce', 2, 'S1', '3.0', 9.56, 'Corporate Strategy & Communications', 'Junior', 5828837, '', 2, 3),
('EM10796', 'Kota Jakarta Timur', 'Laki-laki', '1976-09-02', '2020-09-07', '', 'Married', 3, 'S1', '0.0', 9.31, 'Operations', 'Junior', 5043614, '', 3, 1),
('EM15262', 'Tangerang', 'Perempuan', '1980-02-10', '2024-10-15', '', 'Married', 4, 'S1', '0.0', 9.58, 'Service & Support', 'Junior', 6378857, '', 3, 1),
('EM7053', 'Kota Jakarta Timur', 'Laki-laki', '1971-03-15', '2021-08-22', '2022-12-08', 'Married', 1, 'SLTA', '2.0', 9.02, 'Creative & Design', 'Staff', 2630477, '', 2, 1),
('EM8850', 'Kota Depok', 'Perempuan', '1997-06-20', '2020-11-25', '2023-01-02', 'Single', 0, 'SLTA', '10.', 9.02, 'HR', 'Staff', 2809810, '', 2, 1),
('EM14106', 'Kota Jakarta Barat', 'Laki-laki', '1979-09-29', '2023-09-19', '2024-08-25', 'Married', 0, 'SLTA', '8.0', 9.62, 'Finance & Accounting', 'Staff', 2974024, '', 2, 1),
('EM4009', 'Kabupaten Bogor', 'Laki-laki', '1979-11-27', '2021-04-25', '2023-08-22', 'Married', 3, 'SLTA', '1.0', 9.14, 'Corporate Strategy & Communications', 'Staff', 1593528, '', 3, 3),
('EM6941', 'Kota Jakarta Timur', 'Laki-laki', '1984-03-27', '2022-10-05', '2024-01-31', 'Divorce', 2, 'D3', '5.0', 9.43, 'Operations', 'Staff', 3348918, '', 2, 1),
('EM3124', 'Kabupaten Bekasi', 'Laki-laki', '1990-12-27', '2022-11-09', '', 'Married', 0, 'D2', '5.0', 9.24, 'Corporate Strategy & Communications', 'Staff', 4603157, '1.', 1, 1),
('EM13059', 'Kota Depok', 'Perempuan', '1987-09-10', '2021-02-14', '2023-05-08', 'Married', 0, 'D1', '5.0', 9.37, 'Finance & Accounting', 'Staff', 4567550, '', 2, 2),
('EM10969', 'Kabupaten Bogor', 'Perempuan', '1999-12-27', '2023-02-09', '2024-04-17', 'Single', 0, 'SLTA', '7.0', 9.44, 'Operations', 'Staff', 2747336, '', 3, 3),
('EM2901', 'Kabupaten Bogor', 'Laki-laki', '1975-11-13', '2023-02-08', '', 'Married', 3, 'S1', '2.0', 9.25, 'Service & Support', 'Junior', 6026696, '', 1, 1),
('EM1830', 'Kota Jakarta Selatan', 'Laki-laki', '1983-11-06', '2021-09-18', '2023-10-27', 'Married', 2, 'SLTA', '15.', 9.87, 'Creative & Design', 'Staff', 1177588, '', 3, 1),
('EM10286', 'Kabupaten Bogor', 'Laki-laki', '1993-12-11', '2022-02-17', '2023-06-23', 'Married', 2, 'D2', '3.0', 9.39, 'Creative & Design', 'Staff', 4494843, '', 1, 2),
('EM7173', 'Kota Jakarta Pusat', 'Laki-laki', '1979-03-12', '2021-08-08', '', 'Divorce', 6, 'D2', '2.0', 9.41, 'Creative & Design', 'Staff', 4655470, '', 1, 2),
('EM14374', 'Kabupaten Bekasi', 'Perempuan', '1979-08-18', '2022-02-14', '2023-03-10', 'Married', 2, 'SLTA', '13.', 9.89, 'Engineering & IT', 'Staff', 1991807, '', 1, 3),
('EM6978', 'Tangerang', 'Perempuan', '1986-08-29', '2022-01-25', '2024-07-31', 'Married', 2, 'SLTA', '4.0', 9.05, 'HR', 'Staff', 2892359, '', 1, 2),
('EM2110', 'Tangerang', 'Laki-laki', '1973-10-30', '2021-01-30', '2023-05-25', 'Married', 0, 'D2', '1.0', 9.82, 'Creative & Design', 'Staff', 4038599, '', 1, 3),
('EM13668', 'Kota Jakarta Timur', 'Perempuan', '1994-08-18', '2023-05-11', '2024-07-05', 'Married', 0, 'SLTA', '10.', 9.70, 'Marketing', 'Staff', 2060765, '', 2, 2),
('EM9871', 'Kota Bekasi', 'Perempuan', '1997-07-27', '2021-07-11', '2023-11-30', 'Single', 0, 'D2', '4.0', 9.62, 'Marketing', 'Staff', 4150843, '', 3, 1),
('EM14513', 'Kota Jakarta Timur', 'Perempuan', '1994-07-16', '2020-02-16', '', 'Married', 1, 'S1', '4.0', 9.42, 'Service & Support', 'Junior', 7039931, '', 3, 3),
('EM12911', 'Kabupaten Bekasi', 'Laki-laki', '1991-02-06', '2022-09-27', '2024-03-05', 'Single', 0, 'D3', '5.0', 9.76, 'Operations', 'Staff', 3072118, '', 2, 2),
('EM3879', 'Kota Jakarta Timur', 'Laki-laki', '1979-10-29', '2022-01-09', '2024-02-26', 'Married', 2, 'SLTA', '', 9.38, 'HR', 'Staff', 1095602, '', 2, 3),
('EM1068', 'Kepulauan Seribu', 'Perempuan', '1998-10-17', '2023-03-21', '2024-10-26', 'Single', 0, 'SLTA', '11.', 9.66, 'Corporate Strategy & Communications', 'Staff', 2060948, '', 1, 3),
('EM5476', 'Kota Jakarta Barat', 'Laki-laki', '1980-06-12', '2022-02-06', '2024-06-15', 'Married', 3, 'D3', '6.0', 9.62, 'HR', 'Staff', 4193732, '', 1, 3),
('EM0317', 'Kabupaten Bekasi', 'Laki-laki', '1984-08-28', '2021-11-01', '', 'Married', 2, 'S1', '3.0', 9.37, 'HR', 'Junior', 6261119, '', 3, 1),
('EM7478', 'Kota Jakarta Timur', 'Perempuan', '1968-06-06', '2023-01-03', '2024-04-18', 'Married', 2, 'SLTA', '12.', 9.78, 'Creative & Design', 'Staff', 2143634, '', 3, 2),
('EM10274', 'Tangerang', 'Laki-laki', '1996-05-24', '2023-01-12', '', 'Married', 0, 'S1', '6.0', 9.36, 'HR', 'Junior', 5328795, '', 2, 2),
('EM14672', 'Kabupaten Bekasi', 'Perempuan', '1977-10-24', '2022-11-04', '', 'Married', 0, 'S1', '1.0', 9.12, 'Creative & Design', 'Junior', 8341359, '', 1, 1),
('EM5374', 'Kabupaten Bogor', 'Laki-laki', '1999-02-23', '2021-05-17', '2023-07-20', 'Married', 0, 'D3', '4.0', 9.70, 'Marketing', 'Staff', 4358225, '', 3, 2),
('EM3115', 'Kota Depok', 'Laki-laki', '1969-04-10', '2020-10-24', '2023-01-17', 'Married', 5, 'SLTA', '10.', 9.22, 'Service & Support', 'Staff', 1902616, '', 1, 2),
('EM13260', 'Kota Jakarta Barat', 'Perempuan', '1976-12-02', '2020-10-25', '2023-02-16', 'Married', 2, 'SLTA', '8.0', 9.31, 'Creative & Design', 'Staff', 2252793, '', 2, 2),
('EM2323', 'Tangerang', 'Perempuan', '1979-02-18', '2024-10-17', '', 'Married', 3, 'D2', '4.0', 9.82, 'HR', 'Staff', 3905491, '1.', 2, 2),
('EM3331', 'Kota Jakarta Selatan', 'Laki-laki', '1997-06-08', '2023-08-09', '2024-10-16', 'Single', 0, 'D1', '2.0', 9.46, 'Operations', 'Staff', 3283258, '', 3, 2),
('EM15595', 'Tangerang', 'Perempuan', '1978-11-21', '2022-10-15', '', 'Divorce', 1, 'S1', '2.0', 9.36, 'Creative & Design', 'Junior', 5082219, '', 3, 1),
('EM13135', 'Kabupaten Bekasi', 'Laki-laki', '1976-11-22', '2023-11-03', '2024-02-11', 'Married', 0, 'D2', '1.0', 9.51, 'Corporate Strategy & Communications', 'Staff', 4567051, '', 1, 1),
('EM9225', 'Kota Jakarta Barat', 'Perempuan', '1974-06-24', '2020-01-23', '', 'Married', 2, 'S1', '0.0', 9.11, 'Engineering & IT', 'Junior', 5018210, '', 2, 1),
('EM12259', 'Kota Jakarta Pusat', 'Laki-laki', '1991-01-16', '2023-02-08', '2024-06-02', 'Married', 1, 'SLTA', '9.0', 9.70, 'HR', 'Staff', 2252345, '', 3, 3),
('EM5921', 'Kota Jakarta Selatan', 'Laki-laki', '1991-02-01', '2021-02-28', '', 'Married', 2, 'S1', '0.0', 9.07, 'Creative & Design', 'Junior', 6210202, '', 3, 1),
('EM5916', 'Kabupaten Bogor', 'Perempuan', '1980-10-07', '2023-02-16', '2024-05-12', 'Married', 3, 'SLTA', '4.0', 9.37, 'Service & Support', 'Staff', 2828025, '1.', 1, 3),
('EM2923', 'Kabupaten Bekasi', 'Perempuan', '1981-02-03', '2020-05-03', '', 'Married', 3, 'S1', '0.0', 9.27, 'Operations', 'Junior', 5308635, '', 3, 1),
('EM10767', 'Kota Jakarta Utara', 'Laki-laki', '1988-12-09', '2022-06-02', '2024-07-24', 'Married', 1, 'D2', '0.0', 9.04, 'Engineering & IT', 'Staff', 4043884, '', 3, 1),
('EM4057', 'Kabupaten Bekasi', 'Perempuan', '1980-11-21', '2022-08-23', '2023-10-20', 'Married', 0, 'D2', '6.0', 9.62, 'Engineering & IT', 'Staff', 3009755, '', 1, 3),
('EM8186', 'Kabupaten Bogor', 'Perempuan', '1974-05-04', '2023-02-14', '2024-03-05', 'Married', 3, 'SLTA', '14.', 9.01, 'Finance & Accounting', 'Staff', 1015784, '', 3, 2),
('EM6115', 'Kabupaten Bogor', 'Laki-laki', '1973-06-25', '2022-09-26', '2024-02-24', 'Married', 4, 'SLTA', '15.', 9.85, 'HR', 'Staff', 1209395, '', 3, 3),
('EM12286', 'Kota Jakarta Pusat', 'Perempuan', '1993-05-01', '2023-05-17', '2024-07-14', 'Married', 1, 'SLTA', '13.', 9.35, 'Service & Support', 'Staff', 1398484, '', 2, 1),
('EM2709', 'Kota Jakarta Selatan', 'Laki-laki', '1999-09-08', '2022-07-12', '', 'Married', 1, 'S1', '3.0', 9.73, 'Creative & Design', 'Junior', 5798016, '', 1, 1),
('EM10654', 'Kota Jakarta Selatan', 'Perempuan', '1977-12-19', '2021-06-05', '2023-09-06', 'Married', 1, 'SLTA', '6.0', 9.76, 'Finance & Accounting', 'Staff', 2804959, '', 3, 2),
('EM12523', 'Kota Jakarta Utara', 'Perempuan', '2023-04-05', '2021-04-04', '2024-06-02', 'Married', 2, 'SLTA', '0.0', 9.39, 'Creative & Design', 'Staff', 1193031, '', 1, 3),
('EM7846', 'Kota Depok', 'Laki-laki', '1992-12-20', '2023-02-27', '', 'Married', 2, 'S1', '0.0', 9.51, 'Finance & Accounting', 'Junior', 6672419, '', 1, 1),
('EM8429', 'Kota Jakarta Timur', 'Perempuan', '1996-12-24', '2022-05-09', '2023-01-02', 'Single', 0, 'SLTA', '9.0', 9.01, 'Engineering & IT', 'Staff', 2579175, '', 2, 3),
('EM1746', 'Kabupaten Bekasi', 'Perempuan', '2000-08-15', '2021-11-10', '', 'Single', 0, 'S1', '', 9.01, 'Engineering & IT', 'Junior', 5609166, '', 3, 1),
('EM9566', 'Kota Jakarta Barat', 'Laki-laki', '1980-12-07', '2022-11-21', '2024-01-31', 'Married', 3, 'SLTA', '4.0', 9.53, 'Service & Support', 'Staff', 1948560, '', 1, 2),
('EM11695', 'Kabupaten Bogor', 'Laki-laki', '1995-05-05', '2020-06-07', '', 'Married', 0, 'S1', '7.0', 9.30, 'Marketing', 'Junior', 5160507, '', 1, 2),
('EM14600', 'Kabupaten Bogor', 'Perempuan', '1994-04-24', '2020-10-16', '', 'Married', 0, 'D1', '1.0', 9.74, 'Engineering & IT', 'Staff', 4969890, '', 1, 3),
('EM10962', 'Kabupaten Bekasi', 'Perempuan', '1989-05-18', '2023-01-25', '2024-05-15', 'Married', 1, 'SLTA', '9.0', 9.77, 'Service & Support', 'Staff', 2988784, '', 2, 1),
('EM14152', 'Kabupaten Bogor', 'Laki-laki', '1979-04-16', '2021-02-01', '2023-02-21', 'Married', 4, 'D3', '1.0', 9.46, 'Marketing', 'Staff', 4268606, '', 2, 3),
('EM6906', 'Kota Jakarta Timur', 'Laki-laki', '1995-12-21', '2020-07-13', '2024-08-14', 'Single', 0, 'SLTA', '11.', 9.21, 'Marketing', 'Staff', 2240964, '', 2, 2),
('EM7431', 'Kabupaten Bekasi', 'Laki-laki', '1978-08-01', '2022-09-20', '2023-02-07', 'Married', 2, 'D3', '5.0', 9.33, 'Operations', 'Staff', 3577795, '', 2, 3),
('EM11376', 'Kota Jakarta Utara', 'Laki-laki', '1972-07-03', '2022-08-29', '', 'Married', 3, 'S1', '5.0', 9.83, 'Marketing', 'Junior', 5062912, '', 2, 1),
('EM10520', 'Kabupaten Bogor', 'Laki-laki', '1999-03-17', '2023-03-14', '2023-09-08', 'Single', 0, 'D1', '9.0', 9.40, 'Corporate Strategy & Communications', 'Staff', 3247109, '', 2, 1),
('EM7623', 'Kota Depok', 'Laki-laki', '2000-03-10', '2023-03-29', '2024-04-02', 'Single', 0, 'SLTA', '4.0', 9.67, 'HR', 'Staff', 2921972, '', 2, 3),
('EM9170', 'Kota Jakarta Timur', 'Laki-laki', '1995-11-13', '2023-08-10', '2024-05-20', 'Single', 0, 'SLTA', '10.', 9.86, 'HR', 'Staff', 1184307, '', 2, 1),
('EM4267', 'Kepulauan Seribu', 'Laki-laki', '1996-02-19', '2020-08-21', '2024-01-31', 'Married', 1, 'D2', '3.0', 9.80, 'Operations', 'Staff', 3965678, '1.', 3, 2),
('EM9962', 'Kota Jakarta Timur', 'Laki-laki', '1979-10-18', '2023-05-25', '', 'Married', 3, 'D3', '4.0', 9.32, 'Service & Support', 'Staff', 4426823, '', 3, 1),
('EM0017', 'Kabupaten Bekasi', 'Perempuan', '1972-07-05', '2022-03-20', '2023-05-10', 'Married', 2, 'SLTA', '5.0', 9.27, 'Corporate Strategy & Communications', 'Staff', 1267897, '', 3, 3),
('EM0477', 'Tangerang', 'Laki-laki', '1980-08-04', '2021-05-29', '', 'Married', 3, 'D1', '5.0', 9.07, 'Service & Support', 'Staff', 3755558, '', 1, 1),
('EM5554', 'Kota Depok', 'Laki-laki', '1974-11-05', '2021-08-18', '2024-10-30', 'Married', 2, 'SLTA', '12.', 9.23, 'Finance & Accounting', 'Staff', 1823996, '', 2, 1),
('EM0964', 'Tangerang', 'Perempuan', '1982-04-11', '2022-07-28', '2023-10-19', 'Married', 3, 'SLTA', '8.0', 9.54, 'HR', 'Staff', 2980995, '', 3, 3),
('EM8344', 'Kota Jakarta Pusat', 'Perempuan', '1975-08-12', '2022-07-10', '2024-09-06', 'Married', 4, 'SLTA', '12.', 9.42, 'Marketing', 'Staff', 2755962, '', 3, 1),
('EM3256', 'Kota Depok', 'Perempuan', '1997-06-19', '2022-11-22', '2024-02-19', 'Single', 0, 'D3', '1.0', 9.55, 'Operations', 'Staff', 3605455, '', 2, 2),
('EM0837', 'Kota Jakarta Selatan', 'Perempuan', '1991-10-25', '2023-07-03', '2024-09-15', 'Married', 1, 'D1', '7.0', 9.38, 'Marketing', 'Staff', 3765986, '', 3, 3),
('EM1868', 'Kabupaten Bekasi', 'Perempuan', '1977-12-19', '2020-12-28', '2023-04-02', 'Married', 0, 'SLTA', '12.', 9.84, 'Corporate Strategy & Communications', 'Staff', 1686584, '', 2, 3),
('EM12618', 'Tangerang', 'Perempuan', '1993-08-11', '2020-01-10', '2023-02-06', 'Married', 1, 'SLTA', '10.', 9.24, 'Finance & Accounting', 'Staff', 1272892, '', 2, 1),
('EM1164', 'Kabupaten Bekasi', 'Perempuan', '1986-05-07', '2022-01-09', '2023-06-14', 'Married', 2, 'SLTA', '2.0', 9.12, 'Engineering & IT', 'Staff', 2980816, '', 3, 2),
('EM11529', 'Kabupaten Bekasi', 'Perempuan', '1975-03-15', '2022-01-12', '2023-03-27', 'Married', 3, 'D1', '2.0', 9.20, 'Operations', 'Staff', 4974361, '', 3, 3),
('EM10652', 'Kota Depok', 'Perempuan', '1987-06-21', '2021-06-02', '2023-10-08', 'Married', 1, 'D2', '2.0', 9.07, 'Engineering & IT', 'Staff', 4384915, '', 1, 1),
('EM10579', 'Kota Jakarta Timur', 'Laki-laki', '1991-11-27', '2022-09-25', '2023-10-19', 'Single', 0, 'SLTA', '0.0', 9.27, 'Service & Support', 'Staff', 1176266, '', 1, 2),
('EM13131', 'Kota Jakarta Selatan', 'Perempuan', '1995-12-05', '2020-10-20', '', 'Single', 0, 'D1', '', 9.50, 'HR', 'Staff', 4227278, '', 2, 2),
('EM10336', 'Kota Jakarta Selatan', 'Laki-laki', '1971-04-14', '2022-08-01', '', 'Married', 2, 'S1', '0.0', 9.79, 'Creative & Design', 'Junior', 7340470, '', 1, 2),
('EM10845', 'Kabupaten Bogor', 'Laki-laki', '2023-01-30', '2020-01-30', '', 'Married', 2, 'S1', '3.0', 9.58, 'Marketing', 'Junior', 5841056, '', 2, 1),
('EM3113', 'Kota Jakarta Pusat', 'Perempuan', '1997-07-09', '2021-10-18', '2024-05-14', 'Single', 0, 'SLTA', '7.0', 9.55, 'Finance & Accounting', 'Staff', 2563421, '', 3, 1),
('EM12297', 'Kota Jakarta Barat', 'Laki-laki', '1979-05-01', '2022-06-13', '2023-08-09', 'Married', 2, 'D2', '5.0', 9.38, 'Corporate Strategy & Communications', 'Staff', 4334228, '', 3, 3),
('EM10221', 'Kota Jakarta Selatan', 'Laki-laki', '1996-06-28', '2022-08-08', '2023-10-10', 'Single', 0, 'SLTA', '5.0', 9.82, 'Engineering & IT', 'Staff', 2378389, '', 3, 3),
('EM2078', 'Kota Jakarta Selatan', 'Perempuan', '1974-03-31', '2020-09-18', '', 'Married', 2, 'D3', '1.0', 9.78, 'Engineering & IT', 'Staff', 4809950, '', 3, 3),
('EM14186', 'Kota Depok', 'Perempuan', '1993-10-14', '2023-05-22', '2024-07-10', 'Single', 0, 'SLTA', '14.', 9.07, 'Creative & Design', 'Staff', 1422040, '', 3, 3),
('EM7172', 'Kabupaten Bogor', 'Laki-laki', '1987-11-03', '2020-08-01', '', 'Married', 2, 'S1', '3.0', 9.77, 'Corporate Strategy & Communications', 'Junior', 6132136, '', 2, 1),
('EM11180', 'Kota Jakarta Pusat', 'Laki-laki', '1971-03-16', '2022-11-25', '2024-01-23', 'Divorce', 0, 'D2', '8.0', 9.62, 'Creative & Design', 'Staff', 3539295, '', 3, 1),
('EM2862', 'Kota Depok', 'Laki-laki', '1979-11-17', '2020-10-19', '', 'Married', 2, 'S1', '1.0', 9.03, 'Engineering & IT', 'Junior', 5490318, '1.', 3, 2),
('EM8772', 'Kabupaten Bekasi', 'Perempuan', '1985-02-18', '2021-04-05', '2023-10-19', 'Married', 2, 'SLTA', '2.0', 9.71, 'HR', 'Staff', 1152539, '', 3, 1),
('EM9933', 'Tangerang', 'Perempuan', '1987-10-10', '2023-01-23', '2024-02-14', 'Single', 0, 'SLTA', '13.', 9.40, 'Service & Support', 'Staff', 1190723, '', 2, 2),
('EM2843', 'Kabupaten Bogor', 'Laki-laki', '1969-03-29', '2022-09-07', '2023-01-31', 'Married', 1, 'SLTA', '4.0', 9.34, 'Creative & Design', 'Staff', 1216988, '1.', 2, 1),
('EM6424', 'Kota Depok', 'Laki-laki', '1977-12-02', '2022-06-05', '2024-10-12', 'Married', 2, 'D3', '3.0', 9.69, 'Engineering & IT', 'Staff', 4617324, '', 3, 3),
('EM10258', 'Tangerang', 'Perempuan', '1990-07-27', '2021-11-23', '2023-02-02', 'Married', 1, 'D2', '3.0', 9.23, 'Finance & Accounting', 'Staff', 4212672, '', 2, 2),
('EM4246', 'Kota Bekasi', 'Laki-laki', '1992-11-06', '2023-06-10', '2024-07-14', 'Married', 3, 'SLTA', '0.0', 9.61, 'Corporate Strategy & Communications', 'Staff', 1228096, '', 2, 2),
('EM0355', 'Kabupaten Bogor', 'Perempuan', '1997-07-08', '2021-03-16', '2023-08-31', 'Married', 1, 'D2', '7.0', 9.06, 'Operations', 'Staff', 3842710, '', 2, 2),
('EM0632', 'Kota Bogor', 'Perempuan', '1982-04-28', '2020-08-21', '2022-06-30', 'Married', 0, 'SLTA', '13.', 9.81, 'Finance & Accounting', 'Staff', 1236317, '', 2, 2),
('EM5681', 'Kota Jakarta Barat', 'Laki-laki', '1982-06-26', '2022-09-25', '2023-11-22', 'Married', 1, 'SLTA', '15.', 9.03, 'Operations', 'Staff', 1345613, '', 2, 3),
('EM15626', 'Kabupaten Bogor', 'Laki-laki', '1998-05-21', '2020-11-05', '', 'Single', 0, 'S1', '1.0', 9.90, 'Corporate Strategy & Communications', 'Junior', 6171455, '', 1, 3),
('EM7294', 'Kota Jakarta Barat', 'Perempuan', '1983-07-08', '2023-07-18', '2024-09-02', 'Married', 1, 'SLTA', '13.', 9.86, 'Marketing', 'Staff', 1407988, '', 3, 1),
('EM8189', 'Kota Jakarta Selatan', 'Laki-laki', '1992-09-26', '2022-03-01', '', 'Married', 1, 'S1', '5.0', 9.90, 'HR', 'Junior', 5460807, '', 2, 3),
('EM4869', 'Kota Jakarta Timur', 'Laki-laki', '1968-12-08', '2022-02-08', '2024-09-15', 'Married', 3, 'D2', '2.0', 9.30, 'Operations', 'Staff', 4390951, '', 1, 3),
('EM6402', 'Kota Depok', 'Laki-laki', '1980-06-18', '2022-02-23', '2024-05-31', 'Married', 2, 'SLTA', '3.0', 9.45, 'Engineering & IT', 'Staff', 1572071, '', 2, 3),
('EM2662', 'Tangerang', 'Laki-laki', '1979-09-17', '2020-01-19', '', 'Married', 3, 'S1', '0.0', 9.19, 'Marketing', 'Junior', 5991170, '', 1, 3),
('EM14320', 'Kota Jakarta Barat', 'Perempuan', '1991-08-29', '2022-08-05', '2023-12-14', 'Married', 0, 'D1', '', 9.59, 'Corporate Strategy & Communications', 'Staff', 3767144, '', 2, 1),
('EM5475', 'Tangerang', 'Laki-laki', '1996-02-23', '2023-02-06', '2024-06-12', 'Married', 2, 'SLTA', '10.', 9.32, 'Service & Support', 'Staff', 2604160, '', 2, 3),
('EM3435', 'Kota Jakarta Selatan', 'Laki-laki', '1995-12-12', '2021-07-12', '2023-12-08', 'Married', 2, 'SLTA', '11.', 9.89, 'Finance & Accounting', 'Staff', 2430424, '', 2, 3),
('EM11164', 'Kabupaten Bogor', 'Laki-laki', '1976-04-25', '2022-10-19', '2024-01-04', 'Married', 4, 'SLTA', '0.0', 9.16, 'Service & Support', 'Staff', 1855086, '', 1, 1),
('EM12709', 'Kabupaten Bogor', 'Laki-laki', '1969-08-14', '2021-11-07', '2023-04-01', 'Married', 3, 'D1', '4.0', 9.23, 'Creative & Design', 'Staff', 4169600, '', 1, 2),
('EM13620', 'Kepulauan Seribu', 'Laki-laki', '1983-10-25', '2023-10-06', '', 'Married', 0, 'S1', '0.0', 9.29, 'Operations', 'Junior', 5129030, '', 3, 1),
('EM15036', 'Kepulauan Seribu', 'Perempuan', '1986-12-29', '2022-10-07', '', 'Married', 2, 'D2', '2.0', 9.44, 'Operations', 'Staff', 4957131, '', 2, 2),
('EM11251', 'Kabupaten Bogor', 'Laki-laki', '1985-08-03', '2023-07-12', '2024-10-23', 'Married', 3, 'D1', '1.0', 9.17, 'Operations', 'Staff', 4292324, '1.', 2, 2),
('EM3959', 'Kota Jakarta Utara', 'Perempuan', '1987-01-14', '2023-10-27', '', 'Divorce', 0, 'S1', '0.0', 9.21, 'Engineering & IT', 'Junior', 6044639, '', 2, 1),
('EM3207', 'Kabupaten Bogor', 'Laki-laki', '1983-06-11', '2022-08-05', '2024-10-23', 'Married', 4, 'D1', '4.0', 9.77, 'Corporate Strategy & Communications', 'Staff', 4752518, '', 2, 3),
('EM2785', 'Kota Bekasi', 'Perempuan', '1982-10-31', '2021-01-18', '2024-03-14', 'Married', 2, 'SLTA', '15.', 9.76, 'Creative & Design', 'Staff', 1037762, '', 1, 3),
('EM3740', 'Kabupaten Bogor', 'Laki-laki', '1981-08-05', '2020-11-27', '2023-03-29', 'Married', 2, 'SLTA', '10.', 9.60, 'Marketing', 'Staff', 2250609, '', 2, 3),
('EM11571', 'Kota Jakarta Utara', 'Laki-laki', '1999-07-27', '2021-05-30', '', 'Single', 0, 'S1', '5.0', 9.73, 'Finance & Accounting', 'Junior', 5136916, '', 1, 3),
('EM13582', 'Tangerang', 'Laki-laki', '1981-06-13', '2022-07-04', '2024-10-30', 'Married', 1, 'SLTA', '5.0', 9.48, 'HR', 'Staff', 1676491, '', 2, 1),
('EM2470', 'Kota Bekasi', 'Perempuan', '1987-01-25', '2023-02-21', '2024-03-18', 'Married', 4, 'SLTA', '11.', 9.04, 'Marketing', 'Staff', 1034980, '', 3, 1),
('EM3486', 'Kota Jakarta Utara', 'Perempuan', '1972-01-21', '2024-08-23', '', 'Married', 3, 'S1', '1.0', 9.25, 'Corporate Strategy & Communications', 'Junior', 6680582, '', 3, 2),
('EM0696', 'Kabupaten Bogor', 'Laki-laki', '1981-03-07', '2022-04-06', '', 'Married', 3, 'D2', '4.0', 9.55, 'Service & Support', 'Staff', 4760112, '', 1, 1),
('EM13519', 'Kabupaten Bogor', 'Perempuan', '1984-11-26', '2022-11-20', '2024-02-05', 'Married', 0, 'SLTA', '14.', 9.85, 'Marketing', 'Staff', 1203422, '', 1, 1),
('EM15183', 'Kota Depok', 'Perempuan', '1970-04-12', '2021-10-08', '', 'Divorce', 1, 'D3', '0.0', 9.64, 'HR', 'Staff', 4141782, '', 1, 3),
('EM14592', 'Tangerang', 'Laki-laki', '1972-01-21', '2022-09-19', '', 'Married', 3, 'S1', '5.0', 9.70, 'Engineering & IT', 'Junior', 5890055, '', 1, 2),
('EM10626', 'Tangerang', 'Laki-laki', '1980-02-27', '2024-02-01', '', 'Married', 3, 'S1', '4.0', 9.16, 'HR', 'Junior', 5706808, '1.', 2, 3),
('EM14237', 'Kota Bekasi', 'Perempuan', '1996-04-04', '2021-11-13', '2024-05-16', 'Married', 0, 'D1', '4.0', 9.09, 'Service & Support', 'Staff', 3502455, '', 1, 3),
('EM0589', 'Kabupaten Bogor', 'Perempuan', '1997-09-10', '2023-04-06', '2024-06-17', 'Single', 0, 'D3', '5.0', 9.11, 'Operations', 'Staff', 3870843, '', 3, 1),
('EM5663', 'Kota Jakarta Pusat', 'Laki-laki', '1987-01-04', '2020-08-14', '2023-01-08', 'Married', 1, 'D3', '4.0', 9.77, 'Creative & Design', 'Staff', 4938792, '', 2, 3),
('EM14331', 'Kota Depok', 'Perempuan', '1984-07-08', '2023-09-06', '', 'Married', 1, 'S1', '2.0', 9.52, 'Finance & Accounting', 'Junior', 7362841, '1.', 1, 3),
('EM12692', 'Kabupaten Bekasi', 'Perempuan', '1997-01-14', '2022-09-13', '2023-10-30', 'Married', 0, 'SLTA', '9.0', 9.47, 'Engineering & IT', 'Staff', 1154041, '', 2, 3),
('EM10903', 'Kota Jakarta Barat', 'Laki-laki', '1994-05-09', '2022-08-25', '', 'Single', 0, 'S1', '', 9.06, 'Marketing', 'Junior', 5681216, '1.', 3, 1),
('EM2367', 'Kota Jakarta Barat', 'Perempuan', '1983-10-28', '2023-03-14', '2024-05-16', 'Married', 2, 'D3', '1.0', 9.52, 'Operations', 'Staff', 3893926, '', 3, 2),
('EM5752', 'Kota Jakarta Pusat', 'Perempuan', '1992-03-15', '2022-06-08', '2024-08-08', 'Married', 0, 'D2', '2.0', 9.61, 'Corporate Strategy & Communications', 'Staff', 4338085, '', 3, 1),
('EM10031', 'Tangerang', 'Laki-laki', '1979-03-11', '2020-01-04', '', 'Married', 2, 'SLTA', '9.0', 9.66, 'Engineering & IT', 'Staff', 1245356, '', 3, 1),
('EM4556', 'Kabupaten Bogor', 'Laki-laki', '1979-02-02', '2022-02-27', '2023-09-08', 'Married', 4, 'D1', '1.0', 9.84, 'Corporate Strategy & Communications', 'Staff', 4756887, '', 2, 3),
('EM15515', 'Kota Jakarta Selatan', 'Perempuan', '1982-01-03', '2021-10-01', '', 'Married', 0, 'S1', '1.0', 9.34, 'Corporate Strategy & Communications', 'Junior', 5811231, '', 1, 3),
('EM1989', 'Kota Jakarta Barat', 'Laki-laki', '1996-09-17', '2023-11-22', '2024-04-02', 'Single', 0, 'D1', '9.0', 9.65, 'Creative & Design', 'Staff', 3516861, '', 1, 1),
('EM15228', 'Kota Jakarta Timur', 'Laki-laki', '1995-05-28', '2023-10-09', '2024-01-22', 'Single', 0, 'D1', '7.0', 9.78, 'Service & Support', 'Staff', 4774296, '2.', 1, 1),
('EM10067', 'Kota Bekasi', 'Laki-laki', '1984-02-05', '2024-05-25', '', 'Married', 3, 'S1', '2.0', 9.23, 'Operations', 'Junior', 6267185, '', 2, 1),
('EM3801', 'Kota Jakarta Barat', 'Laki-laki', '1997-03-18', '2021-06-07', '2024-09-05', 'Single', 0, 'SLTA', '6.0', 9.09, 'Service & Support', 'Staff', 2817945, '', 3, 3),
('EM5202', 'Kota Jakarta Selatan', 'Laki-laki', '1997-11-09', '2020-12-26', '2023-03-13', 'Single', 0, 'SLTA', '8.0', 9.67, 'Operations', 'Staff', 1501795, '', 1, 1),
('EM11507', 'Kota Jakarta Timur', 'Perempuan', '1985-06-24', '2021-10-12', '2023-04-01', 'Married', 1, 'D1', '2.0', 9.28, 'Finance & Accounting', 'Staff', 3002256, '', 1, 1),
('EM0744', 'Kota Jakarta Timur', 'Laki-laki', '1980-12-08', '2024-09-04', '', 'Married', 2, 'D3', '1.0', 9.45, 'Service & Support', 'Staff', 4073400, '', 1, 2),
('EM12818', 'Kota Bekasi', 'Perempuan', '2000-05-11', '2022-11-16', '2024-01-31', 'Single', 0, 'SLTA', '13.', 9.26, 'HR', 'Staff', 1801779, '', 2, 2),
('EM9921', 'Kota Bekasi', 'Laki-laki', '1981-08-22', '2020-12-15', '', 'Married', 3, 'S1', '2.0', 9.40, 'Corporate Strategy & Communications', 'Junior', 6856771, '2.', 2, 1),
('EM0762', 'Kota Depok', 'Perempuan', '1992-05-01', '2023-11-06', '', 'Single', 0, 'S1', '2.0', 9.28, 'Marketing', 'Junior', 6447538, '', 1, 1),
('EM11812', 'Kabupaten Bogor', 'Perempuan', '1977-02-07', '2021-06-05', '2023-10-02', 'Married', 3, 'D2', '3.0', 9.10, 'HR', 'Staff', 3750802, '', 3, 2),
('EM1904', 'Kota Jakarta Selatan', 'Perempuan', '1981-08-01', '2022-04-18', '2024-05-25', 'Divorce', 0, 'D2', '2.0', 9.01, 'HR', 'Staff', 4900544, '1.', 3, 3),
('EM9195', 'Kabupaten Bekasi', 'Laki-laki', '1979-03-07', '2021-09-27', '2023-12-01', 'Married', 2, 'SLTA', '2.0', 9.73, 'Service & Support', 'Staff', 2917088, '', 1, 1),
('EM6414', 'Kota Jakarta Utara', 'Laki-laki', '1969-04-10', '2023-04-18', '', 'Married', 4, 'D3', '2.0', 9.46, 'Corporate Strategy & Communications', 'Staff', 4359821, '', 2, 1),
('EM6374', 'Tangerang', 'Perempuan', '1993-09-15', '2023-12-14', '', 'Married', 2, 'S1', '5.0', 9.45, 'HR', 'Junior', 6054728, '', 1, 1),
('EM12758', 'Kabupaten Bekasi', 'Perempuan', '1983-06-19', '2020-03-15', '2024-06-02', 'Married', 3, 'SLTA', '0.0', 9.02, 'Corporate Strategy & Communications', 'Staff', 1295181, '', 1, 1),
('EM8535', 'Tangerang', 'Perempuan', '1970-08-21', '2024-02-15', '', 'Married', 3, 'S1', '6.0', 9.57, 'HR', 'Junior', 5284626, '', 2, 2),
('EM4737', 'Kota Jakarta Pusat', 'Laki-laki', '1997-01-28', '2021-11-14', '', 'Married', 0, 'D1', '6.0', 9.06, 'Engineering & IT', 'Staff', 4699664, '', 2, 3),
('EM8928', 'Kabupaten Bogor', 'Laki-laki', '1998-07-02', '2021-08-01', '2023-10-11', 'Married', 2, 'SLTA', '4.0', 9.56, 'Engineering & IT', 'Staff', 2968001, '1.', 1, 2),
('EM5300', 'Kabupaten Bogor', 'Perempuan', '1980-10-28', '2022-10-25', '2024-01-04', 'Married', 0, 'SLTA', '14.', 9.70, 'Corporate Strategy & Communications', 'Staff', 1089805, '', 3, 2),
('EM13908', 'Kabupaten Bogor', 'Laki-laki', '1997-05-20', '2023-02-13', '2023-06-08', 'Married', 2, 'SLTA', '5.0', 9.23, 'Finance & Accounting', 'Staff', 2855425, '', 2, 2),
('EM0067', 'Kota Jakarta Barat', 'Laki-laki', '1984-08-26', '2022-08-15', '2023-11-03', 'Married', 1, 'D3', '5.0', 9.13, 'Engineering & IT', 'Staff', 3906685, '', 2, 3),
('EM2784', 'Kota Jakarta Utara', 'Perempuan', '1975-11-21', '2022-01-18', '2024-02-11', 'Married', 0, 'SLTA', '14.', 9.04, 'HR', 'Staff', 1222363, '', 1, 1),
('EM4443', 'Kota Jakarta Selatan', 'Perempuan', '1977-04-26', '2021-03-27', '', 'Married', 5, 'S1', '0.0', 9.70, 'HR', 'Junior', 6187703, '', 2, 3),
('EM13031', 'Kota Jakarta Timur', 'Perempuan', '1994-09-10', '2022-11-15', '2024-01-02', 'Single', 0, 'SLTA', '15.', 9.61, 'Corporate Strategy & Communications', 'Staff', 1139656, '', 1, 3),
('EM1330', 'Kota Jakarta Timur', 'Laki-laki', '1989-10-01', '2022-07-11', '2023-10-26', 'Married', 3, 'D1', '5.0', 9.71, 'Service & Support', 'Staff', 4155441, '', 3, 1),
('EM5354', 'Kabupaten Bogor', 'Laki-laki', '1992-06-30', '2023-03-13', '', 'Married', 2, 'S1', '1.0', 9.40, 'Engineering & IT', 'Junior', 5870706, '', 2, 2),
('EM13959', 'Tangerang', 'Laki-laki', '1984-10-11', '2022-07-28', '2023-10-21', 'Married', 0, 'SLTA', '3.0', 9.68, 'Finance & Accounting', 'Staff', 1545458, '', 3, 1),
('EM11579', 'Kota Jakarta Timur', 'Laki-laki', '1996-06-21', '2022-06-19', '2024-03-08', 'Single', 0, 'D3', '9.0', 9.08, 'Operations', 'Staff', 3765847, '1.', 2, 1),
('EM6711', 'Kota Jakarta Utara', 'Laki-laki', '1983-06-15', '2021-10-06', '2023-10-29', 'Married', 4, 'SLTA', '7.0', 9.74, 'Creative & Design', 'Staff', 1478780, '1.', 2, 2),
('EM3723', 'Kabupaten Bogor', 'Perempuan', '1976-07-05', '2022-10-16', '2023-12-23', 'Married', 4, 'SLTA', '14.', 9.23, 'Service & Support', 'Staff', 1385302, '', 2, 1),
('EM13834', 'Kabupaten Bogor', 'Laki-laki', '1984-03-29', '2023-08-15', '2024-10-02', 'Married', 2, 'SLTA', '11.', 9.44, 'Finance & Accounting', 'Staff', 2127138, '', 1, 3),
('EM10984', 'Kota Bogor', 'Laki-laki', '1997-10-21', '2023-03-28', '2024-08-22', 'Married', 0, 'D1', '5.0', 9.66, 'Finance & Accounting', 'Staff', 3309618, '1.', 1, 3),
('EM6751', 'Kota Jakarta Timur', 'Perempuan', '1997-06-30', '2022-02-11', '2023-04-13', 'Married', 2, 'D1', '5.0', 9.89, 'HR', 'Staff', 3495920, '', 2, 2),
('EM2220', 'Kabupaten Bekasi', 'Laki-laki', '1969-10-31', '2024-01-17', '', 'Married', 3, 'S1', '2.0', 9.25, 'Service & Support', 'Junior', 5663995, '', 1, 1),
('EM6685', 'Kota Jakarta Utara', 'Laki-laki', '2000-05-11', '2020-08-08', '2022-05-01', 'Single', 0, 'D3', '9.0', 9.47, 'HR', 'Staff', 3262935, '', 3, 3),
('EM6351', 'Tangerang', 'Laki-laki', '1997-08-04', '2021-10-11', '2023-02-13', 'Married', 0, 'SLTA', '7.0', 9.07, 'Creative & Design', 'Staff', 1469929, '', 3, 2),
('EM1761', 'Kota Jakarta Timur', 'Laki-laki', '1998-12-12', '2022-01-10', '2023-06-12', 'Married', 0, 'SLTA', '3.0', 9.10, 'Creative & Design', 'Staff', 1323584, '', 3, 1),
('EM8425', 'Kota Jakarta Utara', 'Perempuan', '1983-03-04', '2021-03-21', '2023-05-25', 'Married', 3, 'SLTA', '13.', 9.14, 'HR', 'Staff', 1281620, '', 2, 1),
('EM9884', 'Kota Depok', 'Laki-laki', '1994-11-08', '2023-08-24', '2024-04-12', 'Single', 0, 'D3', '3.0', 9.34, 'Engineering & IT', 'Staff', 4896594, '', 1, 2),
('EM10316', 'Kabupaten Bogor', 'Laki-laki', '1968-09-11', '2024-06-08', '', 'Married', 3, 'D2', '8.0', 9.28, 'Engineering & IT', 'Staff', 4396838, '', 2, 1),
('EM9523', 'Kabupaten Bekasi', 'Laki-laki', '1998-10-12', '2023-08-08', '', 'Married', 3, 'S1', '2.0', 9.42, 'Service & Support', 'Junior', 5100690, '', 3, 1),
('EM12983', 'Tangerang', 'Laki-laki', '1993-03-18', '2021-07-14', '2023-08-16', 'Single', 0, 'SLTA', '13.', 9.64, 'Operations', 'Staff', 1878236, '', 1, 2),
('EM7631', 'Kota Jakarta Selatan', 'Laki-laki', '1975-02-18', '2021-05-04', '', 'Married', 4, 'S1', '2.0', 9.58, 'Marketing', 'Junior', 5088029, '', 2, 2),
('EM1215', 'Kabupaten Bogor', 'Perempuan', '1989-03-03', '2022-06-23', '2023-09-16', 'Married', 1, 'D1', '4.0', 9.15, 'Engineering & IT', 'Staff', 3065037, '', 2, 2),
('EM4964', 'Kota Depok', 'Laki-laki', '1972-03-09', '2021-03-29', '', 'Married', 3, 'D1', '7.0', 9.17, 'Operations', 'Staff', 4211081, '', 3, 3),
('EM4712', 'Kota Bekasi', 'Laki-laki', '1994-05-10', '2021-08-18', '2024-04-02', 'Married', 1, 'D2', '7.0', 9.71, 'HR', 'Staff', 3259693, '1.', 2, 1),
('EM10373', 'Kota Jakarta Selatan', 'Laki-laki', '1995-05-08', '2020-10-27', '', 'Married', 3, 'S1', '2.0', 9.74, 'Finance & Accounting', 'Junior', 5856330, '', 1, 1),
('EM2638', 'Kota Jakarta Barat', 'Laki-laki', '1993-03-23', '2021-10-30', '', 'Married', 1, 'S1', '5.0', 9.64, 'Engineering & IT', 'Junior', 6515365, '1.', 2, 2),
('EM14017', 'Kota Jakarta Timur', 'Perempuan', '1999-10-26', '2021-12-13', '2024-03-26', 'Married', 1, 'D3', '', 9.88, 'Marketing', 'Staff', 4511915, '', 3, 1),
('EM10803', 'Kabupaten Bekasi', 'Perempuan', '1992-12-07', '2022-09-22', '2024-02-27', 'Married', 1, 'SLTA', '1.0', 9.37, 'Service & Support', 'Staff', 2102822, '', 3, 3),
('EM3413', 'Tangerang', 'Laki-laki', '1980-12-14', '2023-05-30', '2023-08-29', 'Married', 2, 'D1', '2.0', 9.04, 'HR', 'Staff', 4185678, '', 3, 3),
('EM12192', 'Tangerang', 'Laki-laki', '1993-03-12', '2023-07-18', '2024-10-02', 'Married', 0, 'SLTA', '9.0', 9.64, 'Creative & Design', 'Staff', 2963761, '1.', 2, 3),
('EM8683', 'Tangerang', 'Perempuan', '1988-09-16', '2022-08-10', '2024-10-02', 'Married', 0, 'SLTA', '12.', 9.64, 'Corporate Strategy & Communications', 'Staff', 1391343, '', 1, 1),
('EM12306', 'Kabupaten Bekasi', 'Perempuan', '1989-11-06', '2023-07-10', '2023-11-02', 'Married', 2, 'D1', '5.0', 9.34, 'Service & Support', 'Staff', 4165278, '', 3, 1),
('EM7346', 'Kabupaten Bekasi', 'Perempuan', '1985-03-21', '2021-12-21', '2023-04-04', 'Married', 0, 'D3', '3.0', 9.85, 'Creative & Design', 'Staff', 3346764, '', 2, 2),
('EM6712', 'Kota Jakarta Timur', 'Laki-laki', '1987-05-22', '2021-10-09', '2023-06-23', 'Married', 2, 'SLTA', '0.0', 9.84, 'HR', 'Staff', 2612876, '', 2, 3),
('EM0656', 'Kota Jakarta Barat', 'Perempuan', '1985-03-04', '2020-11-07', '2021-10-24', 'Married', 2, 'SLTA', '6.0', 9.11, 'Creative & Design', 'Staff', 2454723, '', 1, 3),
('EM6319', 'Kabupaten Bekasi', 'Laki-laki', '1982-05-22', '2022-08-11', '', 'Married', 4, 'S1', '1.0', 9.24, 'Operations', 'Junior', 5549477, '', 2, 1),
('EM6062', 'Kabupaten Bogor', 'Perempuan', '1992-05-01', '2021-05-23', '2023-08-04', 'Married', 2, 'D3', '6.0', 9.43, 'Corporate Strategy & Communications', 'Staff', 3446436, '', 2, 1),
('EM1063', 'Tangerang', 'Perempuan', '2000-03-13', '2020-03-08', '2024-05-09', 'Married', 1, 'SLTA', '0.0', 9.79, 'Marketing', 'Staff', 1165298, '', 2, 3),
('EM11116', 'Kabupaten Bogor', 'Perempuan', '1994-08-05', '2022-06-08', '', 'Married', 2, 'D2', '4.0', 9.59, 'Marketing', 'Staff', 4106742, '', 2, 3),
('EM5072', 'Kota Bogor', 'Laki-laki', '1982-10-26', '2020-12-14', '', 'Single', 0, 'S1', '6.0', 9.43, 'Engineering & IT', 'Junior', 5447011, '', 1, 3),
('EM14907', 'Kabupaten Bekasi', 'Laki-laki', '1982-12-12', '2022-10-17', '', 'Married', 3, 'S1', '1.0', 9.38, 'Marketing', 'Junior', 6603728, '', 2, 3),
('EM11431', 'Kota Jakarta Barat', 'Perempuan', '1973-03-05', '2022-03-10', '2024-10-30', 'Married', 2, 'D3', '11.', 9.75, 'HR', 'Staff', 3194911, '', 2, 2),
('EM3768', 'Kepulauan Seribu', 'Laki-laki', '1993-03-17', '2021-01-19', '', 'Married', 1, 'SLTA', '15.', 9.44, 'Marketing', 'Staff', 1131538, '', 1, 2),
('EM13420', 'Kabupaten Bekasi', 'Laki-laki', '1984-06-12', '2020-02-15', '2024-05-18', 'Married', 0, 'D3', '7.0', 9.03, 'HR', 'Staff', 3690687, '', 2, 1),
('EM3272', 'Kota Jakarta Barat', 'Laki-laki', '1995-07-13', '2024-01-18', '2024-07-25', 'Married', 1, 'SLTA', '3.0', 9.57, 'Corporate Strategy & Communications', 'Staff', 2853326, '', 1, 1),
('EM14384', 'Kota Jakarta Timur', 'Laki-laki', '1992-10-09', '2023-03-02', '2024-05-17', 'Married', 1, 'D3', '0.0', 9.76, 'Creative & Design', 'Staff', 3559443, '', 2, 1),
('EM1981', 'Kabupaten Bekasi', 'Perempuan', '1998-12-14', '2020-11-07', '2023-12-07', 'Married', 1, 'SLTA', '7.0', 9.79, 'Engineering & IT', 'Staff', 2967152, '1.', 2, 3),
('EM6757', 'Kota Bogor', 'Laki-laki', '1993-04-15', '2022-02-28', '2023-05-15', 'Married', 2, 'D1', '0.0', 9.50, 'Marketing', 'Staff', 4664356, '', 1, 2),
('EM4709', 'Kota Jakarta Barat', 'Laki-laki', '1969-05-01', '2024-08-05', '', 'Married', 4, 'S1', '4.0', 9.54, 'HR', 'Junior', 6581469, '', 2, 3),
('EM1148', 'Kabupaten Bekasi', 'Laki-laki', '1993-06-19', '2024-06-09', '', 'Married', 0, 'D2', '3.0', 9.79, 'Operations', 'Staff', 4815329, '', 3, 2),
('EM2706', 'Kota Jakarta Timur', 'Perempuan', '1994-06-15', '2022-07-12', '2023-11-14', 'Married', 2, 'D2', '5.0', 9.11, 'Service & Support', 'Staff', 4398903, '', 2, 1),
('EM1709', 'Kota Jakarta Selatan', 'Perempuan', '1993-10-01', '2020-07-25', '2023-01-18', 'Married', 2, 'SLTA', '0.0', 9.58, 'Creative & Design', 'Staff', 2896386, '', 3, 3),
('EM2300', 'Kota Jakarta Utara', 'Laki-laki', '1990-02-06', '2021-08-15', '2023-08-02', 'Married', 1, 'S1', '2.0', 9.03, 'Corporate Strategy & Communications', 'Junior', 6859967, '', 1, 3),
('EM13054', 'Tangerang', 'Laki-laki', '1982-10-16', '2023-02-01', '2024-02-23', 'Married', 2, 'SLTA', '3.0', 9.16, 'Engineering & IT', 'Staff', 1175754, '', 2, 1),
('EM12142', 'Kota Jakarta Pusat', 'Perempuan', '1981-09-16', '2020-02-27', '', 'Married', 1, 'S1', '2.0', 9.31, 'Marketing', 'Junior', 6215824, '', 3, 2),
('EM15672', 'Kota Jakarta Timur', 'Laki-laki', '1978-07-24', '2024-10-01', '', 'Married', 0, 'S1', '0.0', 9.62, 'Service & Support', 'Junior', 6280332, '', 2, 2),
('EM15573', 'Kota Bekasi', 'Laki-laki', '1987-06-29', '2022-10-09', '', 'Married', 2, 'S1', '0.0', 9.21, 'Service & Support', 'Junior', 5485814, '', 3, 2),
('EM3283', 'Kota Jakarta Selatan', 'Perempuan', '1980-04-12', '2020-03-28', '2023-08-16', 'Married', 2, 'D1', '1.0', 9.71, 'Finance & Accounting', 'Staff', 4131945, '', 1, 1),
('EM2483', 'Kota Jakarta Timur', 'Perempuan', '1967-11-04', '2020-05-05', '2023-04-26', 'Married', 3, 'D1', '3.0', 9.25, 'Marketing', 'Staff', 4986920, '', 3, 1),
('EM10267', 'Kota Jakarta Barat', 'Laki-laki', '1977-06-15', '2020-05-26', '', 'Married', 0, 'S1', '', 9.61, 'Finance & Accounting', 'Junior', 6582305, '4.', 2, 2),
('EM9317', 'Kabupaten Bogor', 'Laki-laki', '1986-11-05', '2022-11-22', '2024-01-18', 'Married', 0, 'D3', '1.0', 9.24, 'Finance & Accounting', 'Staff', 3118390, '1.', 2, 2),
('EM7836', 'Kota Jakarta Barat', 'Laki-laki', '1997-08-22', '2023-01-26', '2024-05-19', 'Married', 1, 'D2', '4.0', 9.18, 'Creative & Design', 'Staff', 4174663, '', 1, 2),
('EM3810', 'Kota Jakarta Selatan', 'Laki-laki', '1980-07-25', '2022-06-23', '2023-08-04', 'Married', 4, 'SLTA', '1.0', 9.39, 'Engineering & IT', 'Staff', 1144963, '', 1, 3),
('EM10461', 'Kabupaten Bogor', 'Perempuan', '1994-05-13', '2023-08-26', '', 'Single', 0, 'S1', '4.0', 9.73, 'Service & Support', 'Junior', 5713202, '', 2, 1),
('EM6940', 'Tangerang', 'Laki-laki', '1989-08-10', '2021-10-04', '', 'Married', 0, 'S1', '3.0', 9.85, 'Service & Support', 'Junior', 5343582, '', 2, 3),
('EM9479', 'Kabupaten Bekasi', 'Perempuan', '1996-04-28', '2020-05-03', '2024-10-29', 'Single', 0, 'D2', '7.0', 9.80, 'HR', 'Staff', 3858878, '', 3, 2),
('EM12532', 'Tangerang', 'Laki-laki', '1997-09-23', '2021-05-24', '', 'Married', 2, 'S1', '1.0', 9.02, 'Finance & Accounting', 'Junior', 6022665, '', 1, 3),
('EM5990', 'Kota Jakarta Barat', 'Laki-laki', '1971-11-08', '2023-10-09', '2024-06-07', 'Married', 2, 'SLTA', '0.0', 9.13, 'Finance & Accounting', 'Staff', 1673769, '', 3, 3),
('EM5525', 'Kabupaten Bekasi', 'Perempuan', '1990-12-30', '2021-07-07', '2024-05-16', 'Divorce', 2, 'D1', '5.0', 9.58, 'Creative & Design', 'Staff', 4682695, '', 1, 1),
('EM10225', 'Kota Jakarta Selatan', 'Perempuan', '1976-11-22', '2020-08-21', '2024-04-07', 'Married', 3, 'D1', '4.0', 9.49, 'Marketing', 'Staff', 4603034, '1.', 1, 2);
INSERT INTO `data_employee_db` (`employee_id`, `domisili`, `jenis_kelamin`, `date_of_birth`, `join_date`, `resign_date`, `marriage_stat`, `dependant`, `education`, `absent_90D`, `avg_time_work`, `departemen`, `position`, `income`, `total_komp`, `job_satisfaction`, `performance_rating`) VALUES
('EM14792', 'Kota Jakarta Utara', 'Laki-laki', '1996-06-09', '2024-10-09', '', 'Married', 2, 'D2', '2.0', 9.40, 'Finance & Accounting', 'Staff', 4284181, '1.', 2, 1),
('EM7245', 'Kabupaten Bekasi', 'Laki-laki', '1982-03-05', '2023-03-15', '', 'Married', 1, 'S1', '6.0', 9.39, 'Finance & Accounting', 'Junior', 5186631, '1.', 1, 3),
('EM6403', 'Kabupaten Bogor', 'Laki-laki', '1978-07-03', '2021-02-27', '2023-06-05', 'Married', 2, 'SLTA', '1.0', 9.30, 'Corporate Strategy & Communications', 'Staff', 2608627, '', 3, 3),
('EM2962', 'Kota Jakarta Timur', 'Laki-laki', '1975-03-06', '2022-08-09', '2023-12-22', 'Married', 2, 'D2', '8.0', 9.25, 'Marketing', 'Staff', 3395147, '', 2, 2),
('EM4377', 'Kabupaten Bekasi', 'Perempuan', '1992-02-14', '2023-08-08', '2024-07-24', 'Married', 1, 'SLTA', '10.', 9.35, 'Service & Support', 'Staff', 1489722, '', 1, 3),
('EM6774', 'Kabupaten Bekasi', 'Perempuan', '1984-06-20', '2023-05-09', '2024-10-12', 'Married', 0, 'D2', '3.0', 9.79, 'Service & Support', 'Staff', 3946319, '', 1, 3),
('EM8289', 'Kota Jakarta Timur', 'Laki-laki', '1979-05-22', '2022-03-29', '', 'Married', 2, 'D3', '3.0', 9.30, 'Engineering & IT', 'Staff', 4828127, '', 1, 1),
('EM2105', 'Kota Jakarta Timur', 'Laki-laki', '1990-01-14', '2023-01-16', '2023-08-18', 'Married', 1, 'SLTA', '', 9.14, 'Finance & Accounting', 'Staff', 1426694, '', 3, 1),
('EM2051', 'Kota Depok', 'Laki-laki', '1981-07-04', '2022-07-03', '', 'Married', 1, 'S1', '0.0', 9.49, 'HR', 'Junior', 7286490, '', 1, 3),
('EM12356', 'Kota Jakarta Utara', 'Perempuan', '1983-02-14', '2020-10-12', '2024-02-13', 'Married', 0, 'D2', '2.0', 9.17, 'Service & Support', 'Staff', 4412486, '1.', 1, 2),
('EM8227', 'Kabupaten Bekasi', 'Laki-laki', '1975-06-19', '2023-07-10', '', 'Married', 2, 'D2', '3.0', 9.17, 'Marketing', 'Staff', 4534362, '', 3, 3),
('EM0298', 'Kabupaten Bogor', 'Perempuan', '1975-11-25', '2022-09-08', '', 'Married', 3, 'D2', '5.0', 9.20, 'Creative & Design', 'Staff', 4503430, '1.', 1, 2),
('EM12708', 'Kota Bogor', 'Laki-laki', '1997-06-01', '2020-10-25', '2023-06-15', 'Single', 0, 'SLTA', '13.', 9.44, 'Service & Support', 'Staff', 1657584, '2.', 1, 2),
('EM14976', 'Kota Bekasi', 'Laki-laki', '1975-12-01', '2023-10-02', '', 'Married', 0, 'D2', '3.0', 9.37, 'Operations', 'Staff', 4542424, '', 1, 1),
('EM11561', 'Kota Depok', 'Perempuan', '1979-07-17', '2022-05-03', '2023-09-22', 'Married', 1, 'D1', '2.0', 9.55, 'Marketing', 'Staff', 4276711, '', 3, 1),
('EM12999', 'Kota Jakarta Barat', 'Laki-laki', '1987-12-23', '2023-08-11', '2024-10-13', 'Married', 2, 'D1', '8.0', 9.47, 'Finance & Accounting', 'Staff', 3345087, '', 2, 1),
('EM0123', 'Kabupaten Bekasi', 'Laki-laki', '1971-10-06', '2020-01-19', '2023-08-14', 'Married', 4, 'D2', '3.0', 9.28, 'Engineering & IT', 'Staff', 3789062, '', 3, 1),
('EM6644', 'Kabupaten Bekasi', 'Laki-laki', '1976-11-22', '2023-03-20', '', 'Married', 1, 'S1', '4.0', 9.08, 'Creative & Design', 'Junior', 5410777, '1.', 3, 3),
('EM14673', 'Kabupaten Bekasi', 'Perempuan', '1984-08-06', '2023-10-03', '', 'Married', 2, 'S1', '1.0', 9.49, 'Engineering & IT', 'Junior', 7019037, '', 2, 3),
('EM6102', 'Tangerang', 'Perempuan', '1990-10-28', '2022-08-16', '2023-10-03', 'Married', 0, 'SLTA', '', 9.05, 'Creative & Design', 'Staff', 1944208, '', 2, 1),
('EM4237', 'Kota Bekasi', 'Perempuan', '1974-06-26', '2021-04-25', '', 'Divorce', 0, 'D3', '0.0', 9.50, 'Creative & Design', 'Staff', 4808424, '', 3, 2),
('EM4715', 'Tangerang', 'Laki-laki', '1987-04-01', '2022-08-23', '2023-11-15', 'Married', 1, 'D1', '3.0', 9.58, 'Engineering & IT', 'Staff', 4359239, '1.', 3, 1),
('EM10994', 'Tangerang', 'Perempuan', '1995-06-15', '2021-06-07', '2023-06-28', 'Single', 0, 'SLTA', '9.0', 9.04, 'Engineering & IT', 'Staff', 1249223, '', 2, 2),
('EM4972', 'Kota Jakarta Pusat', 'Perempuan', '2000-05-23', '2021-12-11', '2024-04-16', 'Married', 0, 'D3', '9.0', 9.87, 'Creative & Design', 'Staff', 3555071, '', 2, 1),
('EM8405', 'Kabupaten Bekasi', 'Perempuan', '1997-01-01', '2021-01-23', '2024-03-23', 'Married', 2, 'SLTA', '14.', 9.86, 'Finance & Accounting', 'Staff', 1135655, '', 2, 2),
('EM12986', 'Kota Depok', 'Laki-laki', '1968-03-04', '2022-07-18', '2023-09-13', 'Married', 3, 'SLTA', '2.0', 9.15, 'Marketing', 'Staff', 2339373, '', 3, 1),
('EM9143', 'Kota Jakarta Barat', 'Laki-laki', '1998-03-12', '2021-06-20', '2024-09-04', 'Single', 0, 'D2', '1.0', 9.29, 'Operations', 'Staff', 3362953, '', 2, 2),
('EM12948', 'Kabupaten Bogor', 'Perempuan', '1972-01-14', '2021-02-08', '', 'Married', 2, 'D3', '0.0', 9.25, 'Marketing', 'Staff', 4597838, '', 1, 3),
('EM11769', 'Kota Depok', 'Laki-laki', '1976-04-21', '2021-01-09', '', 'Married', 3, 'S1', '2.0', 9.51, 'HR', 'Junior', 6173400, '', 1, 2),
('EM4457', 'Kepulauan Seribu', 'Perempuan', '1975-09-20', '2022-06-05', '2023-11-02', 'Married', 3, 'D1', '1.0', 9.52, 'Service & Support', 'Staff', 4244180, '', 1, 1),
('EM7618', 'Kota Bogor', 'Laki-laki', '1994-11-17', '2021-03-10', '2024-07-14', 'Married', 1, 'D2', '1.0', 9.81, 'HR', 'Staff', 4581241, '', 2, 3),
('EM11615', 'Tangerang', 'Laki-laki', '1987-02-02', '2022-09-14', '2023-11-03', 'Divorce', 0, 'SLTA', '8.0', 9.03, 'Service & Support', 'Staff', 2615265, '', 3, 1),
('EM4880', 'Kota Bogor', 'Perempuan', '1980-03-23', '2023-03-27', '2023-07-28', 'Married', 2, 'D2', '5.0', 9.27, 'Operations', 'Staff', 3500587, '', 2, 2),
('EM10955', 'Kabupaten Bogor', 'Laki-laki', '1983-09-05', '2022-01-10', '2024-02-14', 'Married', 2, 'SLTA', '7.0', 9.20, 'Operations', 'Staff', 2347598, '', 3, 1),
('EM14277', 'Kabupaten Bekasi', 'Perempuan', '1980-05-12', '2023-03-15', '2023-09-21', 'Married', 3, 'D1', '5.0', 9.27, 'Marketing', 'Staff', 3129848, '', 2, 2),
('EM7443', 'Kota Bogor', 'Laki-laki', '2000-09-08', '2021-10-19', '2023-04-01', 'Single', 0, 'D1', '5.0', 9.20, 'HR', 'Staff', 3567254, '1.', 1, 3),
('EM9491', 'Kota Jakarta Pusat', 'Perempuan', '1970-01-02', '2020-05-29', '', 'Married', 0, 'D3', '5.0', 9.81, 'Operations', 'Staff', 4112902, '', 3, 2),
('EM12362', 'Kota Jakarta Utara', 'Perempuan', '1993-04-09', '2024-10-27', '', 'Married', 1, 'S1', '0.0', 9.19, 'Finance & Accounting', 'Junior', 6199810, '1.', 3, 1),
('EM5779', 'Kota Jakarta Selatan', 'Perempuan', '1976-05-07', '2020-08-28', '', 'Married', 2, 'S1', '1.0', 9.65, 'Engineering & IT', 'Junior', 6003230, '', 2, 1),
('EM2937', 'Kabupaten Bekasi', 'Perempuan', '2000-06-05', '2023-06-06', '2024-07-24', 'Single', 0, 'SLTA', '7.0', 9.49, 'Finance & Accounting', 'Staff', 1265679, '', 1, 3),
('EM14348', 'Kota Jakarta Selatan', 'Perempuan', '1976-06-11', '2024-10-17', '', 'Married', 3, 'S1', '3.0', 9.29, 'Operations', 'Junior', 6322650, '4.', 3, 3),
('EM11188', 'Kota Jakarta Barat', 'Laki-laki', '2000-05-05', '2020-12-16', '2024-05-13', 'Married', 1, 'D2', '2.0', 9.82, 'Engineering & IT', 'Staff', 4715337, '3.', 3, 1),
('EM7907', 'Kabupaten Bogor', 'Perempuan', '1981-12-22', '2021-08-08', '2023-10-02', 'Married', 2, 'SLTA', '7.0', 9.20, 'Engineering & IT', 'Staff', 2697333, '', 1, 1),
('EM13228', 'Tangerang', 'Perempuan', '1993-06-28', '2021-07-20', '2024-09-04', 'Single', 0, 'SLTA', '9.0', 9.38, 'Creative & Design', 'Staff', 1302681, '', 3, 3),
('EM5660', 'Kota Jakarta Barat', 'Laki-laki', '1993-01-09', '2022-08-08', '2023-12-09', 'Married', 1, 'SLTA', '0.0', 9.11, 'Corporate Strategy & Communications', 'Staff', 1630744, '', 2, 3),
('EM15442', 'Tangerang', 'Perempuan', '1980-12-21', '2022-10-01', '', 'Married', 2, 'S1', '2.0', 9.40, 'Operations', 'Junior', 5881166, '', 2, 2),
('EM13887', 'Tangerang', 'Perempuan', '1990-04-11', '2020-12-29', '', 'Married', 1, 'D3', '1.0', 9.86, 'Operations', 'Staff', 4000859, '', 2, 1),
('EM2621', 'Kota Depok', 'Laki-laki', '1980-06-21', '2021-09-08', '', 'Married', 2, 'S1', '5.0', 9.24, 'Creative & Design', 'Junior', 5141564, '', 3, 3),
('EM11677', 'Kota Jakarta Timur', 'Perempuan', '1971-12-12', '2023-05-02', '2024-06-20', 'Married', 3, 'D2', '8.0', 9.30, 'Operations', 'Staff', 3049786, '', 2, 3),
('EM0370', 'Kabupaten Bogor', 'Laki-laki', '1983-05-02', '2021-06-03', '2023-09-04', 'Married', 2, 'SLTA', '1.0', 9.06, 'HR', 'Staff', 1494406, '', 3, 2),
('EM9701', 'Tangerang', 'Laki-laki', '1996-07-10', '2022-03-02', '2023-05-17', 'Married', 1, 'SLTA', '10.', 9.38, 'Marketing', 'Staff', 2145029, '', 3, 2),
('EM13936', 'Kota Jakarta Timur', 'Perempuan', '1991-01-27', '2020-06-07', '', 'Married', 1, 'D3', '3.0', 9.75, 'Operations', 'Staff', 4908428, '', 1, 1),
('EM7496', 'Kota Jakarta Timur', 'Perempuan', '1987-07-18', '2022-02-02', '2024-03-28', 'Married', 1, 'D3', '10.', 9.10, 'Creative & Design', 'Staff', 3790632, '', 2, 1),
('EM0516', 'Kota Depok', 'Laki-laki', '1970-05-18', '2020-09-04', '', 'Married', 0, 'S1', '4.0', 9.02, 'HR', 'Junior', 5182864, '', 1, 2),
('EM14805', 'Kota Jakarta Selatan', 'Perempuan', '1990-08-07', '2023-10-04', '', 'Married', 3, 'S1', '0.0', 9.17, 'Finance & Accounting', 'Junior', 5769814, '', 3, 3),
('EM5937', 'Kabupaten Bekasi', 'Perempuan', '1990-05-25', '2024-06-21', '2024-09-30', 'Married', 4, 'D2', '1.0', 9.30, 'Service & Support', 'Staff', 3274773, '', 2, 1),
('EM4227', 'Kabupaten Bekasi', 'Perempuan', '1992-04-20', '2022-03-01', '2023-05-05', 'Married', 3, 'D1', '3.0', 9.55, 'Engineering & IT', 'Staff', 4675050, '1.', 2, 2),
('EM2002', 'Kota Jakarta Selatan', 'Laki-laki', '1989-03-27', '2023-01-05', '2023-04-24', 'Single', 0, 'SLTA', '12.', 9.25, 'Marketing', 'Staff', 1238462, '', 3, 1),
('EM3030', 'Tangerang', 'Perempuan', '1994-05-30', '2020-03-29', '2023-06-10', 'Married', 1, 'SLTA', '15.', 9.85, 'Marketing', 'Staff', 1128309, '', 3, 1),
('EM6130', 'Tangerang', 'Laki-laki', '1993-11-03', '2020-11-03', '2024-01-09', 'Married', 2, 'D3', '7.0', 9.72, 'HR', 'Staff', 3979380, '', 3, 1),
('EM10500', 'Kota Jakarta Timur', 'Perempuan', '1973-04-15', '2022-12-07', '2024-01-12', 'Married', 0, 'SLTA', '10.', 9.12, 'Creative & Design', 'Staff', 2045190, '3.', 1, 3),
('EM9366', 'Kabupaten Bekasi', 'Perempuan', '1979-12-25', '2022-04-17', '2024-05-20', 'Married', 1, 'SLTA', '11.', 9.62, 'Operations', 'Staff', 2652659, '', 1, 2),
('EM10700', 'Kota Bekasi', 'Laki-laki', '1996-11-08', '2023-10-18', '2024-04-29', 'Single', 0, 'SLTA', '9.0', 9.17, 'Corporate Strategy & Communications', 'Staff', 2982096, '', 2, 3),
('EM1196', 'Kota Depok', 'Perempuan', '1971-04-24', '2023-05-03', '2024-05-15', 'Married', 3, 'D3', '1.0', 9.56, 'Finance & Accounting', 'Staff', 4565972, '', 1, 1),
('EM5884', 'Kota Bekasi', 'Perempuan', '2000-07-04', '2021-10-24', '', 'Single', 0, 'S1', '1.0', 9.40, 'Marketing', 'Junior', 5742406, '1.', 1, 1),
('EM6716', 'Kabupaten Bogor', 'Perempuan', '1994-01-07', '2022-10-16', '2023-03-05', 'Married', 3, 'SLTA', '14.', 9.09, 'Corporate Strategy & Communications', 'Staff', 1493839, '1.', 2, 2),
('EM8014', 'Tangerang', 'Perempuan', '1987-01-22', '2023-06-15', '2024-10-02', 'Married', 1, 'SLTA', '0.0', 9.62, 'Engineering & IT', 'Staff', 2813713, '', 1, 1),
('EM6023', 'Kepulauan Seribu', 'Laki-laki', '1972-08-10', '2022-12-11', '2024-03-04', 'Married', 3, 'SLTA', '11.', 9.49, 'Creative & Design', 'Staff', 1419028, '', 2, 3),
('EM2822', 'Kota Jakarta Timur', 'Laki-laki', '2000-03-25', '2023-06-19', '2024-09-11', 'Single', 0, 'D1', '5.0', 9.01, 'Marketing', 'Staff', 4111614, '', 1, 3),
('EM3238', 'Kabupaten Bogor', 'Perempuan', '1991-09-21', '2022-10-16', '', 'Married', 2, 'S1', '2.0', 9.35, 'Service & Support', 'Junior', 5458700, '', 2, 3),
('EM15727', 'Kota Jakarta Timur', 'Perempuan', '1980-02-02', '2023-10-14', '', 'Married', 1, 'D2', '0.0', 9.66, 'Marketing', 'Staff', 3017080, '', 1, 1),
('EM14389', 'Kota Depok', 'Perempuan', '1988-08-04', '2021-03-13', '2024-10-10', 'Single', 0, 'SLTA', '11.', 9.53, 'Engineering & IT', 'Staff', 2392697, '', 1, 3),
('EM7928', 'Kabupaten Bekasi', 'Laki-laki', '1998-03-17', '2021-09-25', '', 'Single', 0, 'D2', '1.0', 9.16, 'Service & Support', 'Staff', 3831968, '', 3, 1),
('EM1233', 'Kota Bekasi', 'Laki-laki', '1995-04-20', '2023-07-24', '2024-08-15', 'Single', 0, 'SLTA', '12.', 9.80, 'Service & Support', 'Staff', 1579971, '', 2, 2),
('EM13286', 'Kabupaten Bekasi', 'Laki-laki', '1995-12-06', '2022-01-09', '2023-02-04', 'Single', 0, 'SLTA', '10.', 9.38, 'Service & Support', 'Staff', 2366044, '', 1, 1),
('EM5625', 'Tangerang', 'Perempuan', '1980-07-03', '2023-04-17', '2024-05-30', 'Married', 3, 'SLTA', '10.', 9.17, 'HR', 'Staff', 2533428, '', 3, 1),
('EM8630', 'Kabupaten Bekasi', 'Laki-laki', '1981-07-08', '2020-01-30', '2024-03-31', 'Married', 4, 'SLTA', '2.0', 9.02, 'Creative & Design', 'Staff', 1160845, '', 2, 2),
('EM10240', 'Tangerang', 'Perempuan', '1977-06-09', '2024-10-16', '', 'Married', 2, 'S1', '0.0', 9.43, 'Service & Support', 'Junior', 5034889, '', 3, 2),
('EM14496', 'Kabupaten Bekasi', 'Perempuan', '1985-04-20', '2021-01-09', '2023-03-07', 'Married', 3, 'SLTA', '9.0', 9.19, 'Corporate Strategy & Communications', 'Staff', 1058912, '', 3, 2),
('EM15404', 'Kota Jakarta Utara', 'Laki-laki', '1994-05-05', '2022-10-22', '', 'Married', 1, 'S1', '2.0', 9.33, 'Creative & Design', 'Junior', 7141766, '', 1, 3),
('EM10095', 'Kota Jakarta Timur', 'Laki-laki', '1971-09-23', '2020-07-18', '2023-01-29', 'Single', 0, 'D3', '0.0', 9.68, 'Marketing', 'Staff', 4591239, '', 2, 3),
('EM5089', 'Kota Jakarta Selatan', 'Laki-laki', '1982-05-10', '2022-02-15', '2023-06-03', 'Married', 2, 'SLTA', '3.0', 9.22, 'Operations', 'Staff', 1458897, '', 2, 2),
('EM14512', 'Kota Jakarta Pusat', 'Perempuan', '1994-11-30', '2023-02-13', '2024-05-02', 'Single', 0, 'D1', '5.0', 9.03, 'Creative & Design', 'Staff', 4246512, '', 2, 3),
('EM11531', 'Kota Jakarta Selatan', 'Laki-laki', '1988-05-09', '2020-01-26', '', 'Married', 3, 'S1', '2.0', 9.51, 'Operations', 'Junior', 5796326, '', 2, 3),
('EM7058', 'Kota Depok', 'Perempuan', '1984-08-08', '2021-09-06', '2024-01-18', 'Married', 2, 'D3', '6.0', 9.84, 'Operations', 'Staff', 3209851, '', 2, 2),
('EM3174', 'Tangerang', 'Perempuan', '1979-06-12', '2024-04-27', '', 'Married', 2, 'S1', '0.0', 9.59, 'Service & Support', 'Junior', 5919801, '', 3, 1),
('EM4929', 'Kota Jakarta Selatan', 'Perempuan', '1983-01-17', '2021-08-21', '2023-12-07', 'Single', 0, 'D2', '5.0', 9.79, 'Engineering & IT', 'Staff', 3699300, '', 3, 3),
('EM11316', 'Kota Jakarta Utara', 'Laki-laki', '1997-10-08', '2020-03-29', '', 'Married', 1, 'S1', '1.0', 9.06, 'Service & Support', 'Junior', 6699141, '', 3, 3),
('EM6317', 'Kota Jakarta Timur', 'Perempuan', '1993-04-07', '2023-08-05', '2024-09-18', 'Married', 2, 'SLTA', '0.0', 9.47, 'HR', 'Staff', 1903853, '', 3, 1),
('EM12225', 'Kota Depok', 'Perempuan', '2000-01-05', '2020-09-29', '2024-04-01', 'Single', 0, 'SLTA', '12.', 9.09, 'Operations', 'Staff', 1481404, '', 1, 2),
('EM14205', 'Tangerang', 'Perempuan', '1974-12-25', '2022-08-15', '2023-10-10', 'Married', 2, 'D3', '7.0', 9.69, 'Marketing', 'Staff', 3399972, '', 3, 1),
('EM3273', 'Kota Bekasi', 'Laki-laki', '1972-03-02', '2021-01-25', '2022-04-22', 'Married', 3, 'D1', '7.0', 9.62, 'Engineering & IT', 'Staff', 3990561, '1.', 2, 3),
('EM5330', 'Kota Jakarta Timur', 'Perempuan', '1992-10-01', '2021-01-25', '2023-06-05', 'Married', 2, 'SLTA', '4.0', 9.05, 'Service & Support', 'Staff', 1358867, '', 1, 2),
('EM13702', 'Tangerang', 'Perempuan', '1996-07-27', '2022-08-07', '', 'Married', 1, 'S1', '4.0', 9.57, 'Engineering & IT', 'Junior', 6762624, '', 1, 1),
('EM4500', 'Kabupaten Bekasi', 'Laki-laki', '1970-02-15', '2022-09-25', '2023-11-01', 'Married', 2, 'SLTA', '7.0', 9.66, 'Creative & Design', 'Staff', 2023456, '', 3, 2),
('EM15063', 'Kepulauan Seribu', 'Laki-laki', '1998-06-30', '2023-10-02', '', 'Single', 0, 'D3', '2.0', 9.67, 'Operations', 'Staff', 4671889, '', 3, 2),
('EM4999', 'Kabupaten Bogor', 'Perempuan', '1974-07-04', '2023-03-16', '2024-05-09', 'Married', 0, 'D1', '3.0', 9.58, 'Corporate Strategy & Communications', 'Staff', 3097039, '', 2, 1),
('EM4868', 'Kota Bekasi', 'Perempuan', '1985-09-12', '2023-02-07', '', 'Married', 3, 'D2', '5.0', 9.06, 'Finance & Accounting', 'Staff', 4036338, '', 3, 3),
('EM5457', 'Kabupaten Bekasi', 'Laki-laki', '1991-06-16', '2023-12-13', '2024-04-02', 'Married', 2, 'D1', '1.0', 9.22, 'Operations', 'Staff', 4573591, '1.', 1, 3),
('EM11255', 'Kabupaten Bogor', 'Laki-laki', '1992-06-17', '2023-07-24', '2024-08-21', 'Married', 2, 'SLTA', '11.', 9.32, 'Service & Support', 'Staff', 1647611, '', 1, 2),
('EM7470', 'Tangerang', 'Perempuan', '2000-11-08', '2021-12-13', '2024-01-16', 'Married', 0, 'SLTA', '13.', 9.34, 'Engineering & IT', 'Staff', 1160013, '', 3, 3),
('EM3889', 'Kota Jakarta Pusat', 'Laki-laki', '1969-04-21', '2021-02-14', '2024-03-25', 'Married', 6, 'SLTA', '12.', 9.84, 'HR', 'Staff', 1448983, '', 3, 3),
('EM2187', 'Kota Depok', 'Laki-laki', '1980-08-08', '2022-10-07', '', 'Married', 2, 'S1', '1.0', 9.59, 'Marketing', 'Junior', 5651338, '', 1, 3),
('EM9734', 'Tangerang', 'Laki-laki', '1990-11-30', '2020-07-14', '2023-04-19', 'Married', 1, 'SLTA', '6.0', 9.18, 'Service & Support', 'Staff', 2546294, '', 3, 2),
('EM8839', 'Kota Depok', 'Laki-laki', '1977-06-30', '2020-10-20', '2024-02-05', 'Single', 0, 'SLTA', '12.', 9.46, 'HR', 'Staff', 1594552, '', 3, 1),
('EM14544', 'Kota Jakarta Utara', 'Perempuan', '1971-04-15', '2023-05-24', '2024-08-04', 'Married', 3, 'SLTA', '1.0', 9.55, 'Corporate Strategy & Communications', 'Staff', 2892248, '', 2, 2),
('EM14019', 'Kota Jakarta Pusat', 'Laki-laki', '1971-09-19', '2023-12-22', '', 'Divorce', 0, 'D1', '6.0', 9.82, 'HR', 'Staff', 3022985, '', 1, 3),
('EM0528', 'Kota Jakarta Timur', 'Perempuan', '1990-05-29', '2020-09-26', '2023-05-09', 'Married', 1, 'SLTA', '2.0', 9.25, 'Marketing', 'Staff', 2421637, '', 3, 3),
('EM6046', 'Kota Jakarta Pusat', 'Laki-laki', '1975-10-10', '2023-03-09', '2024-06-30', 'Married', 4, 'SLTA', '9.0', 9.53, 'Service & Support', 'Staff', 2992462, '', 3, 3),
('EM3002', 'Tangerang', 'Perempuan', '1988-08-12', '2023-12-04', '', 'Married', 0, 'S1', '2.0', 9.26, 'Service & Support', 'Junior', 5180467, '', 1, 2),
('EM10078', 'Kota Jakarta Barat', 'Laki-laki', '1989-12-25', '2022-06-13', '2024-04-02', 'Married', 0, 'D2', '2.0', 9.73, 'Finance & Accounting', 'Staff', 4335981, '2.', 1, 1),
('EM8315', 'Tangerang', 'Laki-laki', '1992-01-16', '2023-03-01', '2023-07-07', 'Married', 1, 'SLTA', '5.0', 9.46, 'Operations', 'Staff', 2027163, '', 1, 2),
('EM8442', 'Kota Jakarta Pusat', 'Laki-laki', '2000-05-20', '2022-06-05', '2024-08-29', 'Single', 0, 'SLTA', '7.0', 9.40, 'Marketing', 'Staff', 1121560, '', 3, 1),
('EM4018', 'Kota Jakarta Selatan', 'Laki-laki', '1983-01-07', '2023-05-09', '2024-06-27', 'Married', 1, 'D1', '8.0', 9.63, 'Finance & Accounting', 'Staff', 3056851, '', 1, 1),
('EM4062', 'Kabupaten Bogor', 'Perempuan', '1981-03-30', '2020-08-31', '', 'Married', 2, 'S1', '1.0', 9.74, 'Engineering & IT', 'Junior', 6257962, '', 2, 2),
('EM7826', 'Kota Jakarta Pusat', 'Laki-laki', '1980-08-04', '2022-01-03', '2023-01-21', 'Married', 1, 'SLTA', '4.0', 9.32, 'Creative & Design', 'Staff', 1089084, '', 3, 2),
('EM3605', 'Kota Jakarta Pusat', 'Perempuan', '1992-02-22', '2021-10-24', '', 'Married', 1, 'S1', '0.0', 9.51, 'Finance & Accounting', 'Junior', 5050366, '', 2, 3),
('EM9082', 'Kabupaten Bekasi', 'Laki-laki', '1976-08-03', '2021-12-12', '2023-03-01', 'Married', 0, 'SLTA', '6.0', 9.70, 'Service & Support', 'Staff', 2288985, '', 3, 1),
('EM7061', 'Kota Jakarta Pusat', 'Perempuan', '1995-07-21', '2022-09-14', '2023-11-14', 'Married', 1, 'SLTA', '13.', 9.11, 'Marketing', 'Staff', 1293620, '', 2, 2),
('EM6691', 'Tangerang', 'Laki-laki', '1982-05-04', '2022-08-31', '2023-10-20', 'Married', 2, 'SLTA', '0.0', 9.02, 'HR', 'Staff', 2299871, '1.', 1, 2),
('EM4974', 'Tangerang', 'Laki-laki', '1976-06-18', '2020-07-23', '', 'Married', 0, 'D3', '2.0', 9.86, 'Engineering & IT', 'Staff', 3971753, '', 2, 1),
('EM1080', 'Kabupaten Bogor', 'Laki-laki', '1974-09-29', '2022-05-19', '2023-07-21', 'Married', 2, 'SLTA', '1.0', 9.61, 'Creative & Design', 'Staff', 2976183, '', 3, 2),
('EM9669', 'Kota Jakarta Barat', 'Laki-laki', '1996-12-10', '2020-11-09', '2023-01-02', 'Divorce', 1, 'SLTA', '0.0', 9.24, 'Service & Support', 'Staff', 1473998, '', 3, 2),
('EM11195', 'Tangerang', 'Laki-laki', '1981-05-15', '2022-01-03', '2024-01-24', 'Married', 2, 'SLTA', '', 9.25, 'HR', 'Staff', 1189345, '', 1, 2),
('EM9966', 'Kota Jakarta Pusat', 'Laki-laki', '1989-01-15', '2021-06-06', '2023-07-07', 'Married', 2, 'SLTA', '7.0', 9.21, 'Engineering & IT', 'Staff', 1630599, '', 2, 2),
('EM2781', 'Kabupaten Bogor', 'Perempuan', '1992-04-06', '2023-01-04', '2024-02-23', 'Married', 2, 'SLTA', '1.0', 9.15, 'HR', 'Staff', 1908204, '', 1, 1),
('EM0398', 'Kota Jakarta Timur', 'Laki-laki', '1999-05-03', '2023-09-01', '2024-10-12', 'Single', 0, 'SLTA', '', 9.39, 'Engineering & IT', 'Staff', 1527441, '', 3, 3),
('EM1197', 'Kota Depok', 'Perempuan', '1989-10-01', '2020-05-08', '2023-09-06', 'Single', 0, 'D1', '3.0', 9.04, 'HR', 'Staff', 3526681, '', 2, 3),
('EM3184', 'Kota Depok', 'Laki-laki', '1989-11-29', '2023-06-12', '2024-04-08', 'Married', 3, 'SLTA', '5.0', 9.10, 'Marketing', 'Staff', 2616305, '', 1, 2),
('EM15214', 'Kota Jakarta Selatan', 'Laki-laki', '1986-12-01', '2022-10-02', '', 'Married', 2, 'S1', '1.0', 9.72, 'Service & Support', 'Junior', 5683921, '', 3, 3),
('EM14280', 'Kota Depok', 'Laki-laki', '1993-02-13', '2021-04-03', '', 'Single', 0, 'S1', '4.0', 9.16, 'Creative & Design', 'Junior', 5239852, '1.', 3, 1),
('EM13716', 'Kota Jakarta Timur', 'Laki-laki', '1997-06-22', '2021-09-18', '2023-11-09', 'Married', 0, 'SLTA', '1.0', 9.88, 'Engineering & IT', 'Staff', 1839046, '', 1, 1),
('EM3606', 'Kabupaten Bekasi', 'Laki-laki', '1977-09-25', '2022-10-30', '2024-01-12', 'Married', 3, 'SLTA', '4.0', 9.17, 'Operations', 'Staff', 2752719, '', 1, 1),
('EM4949', 'Kota Bekasi', 'Laki-laki', '1981-10-08', '2020-09-29', '2023-12-02', 'Married', 3, 'SLTA', '0.0', 9.33, 'Service & Support', 'Staff', 1909058, '', 3, 1),
('EM10745', 'Kota Jakarta Utara', 'Laki-laki', '1979-06-24', '2021-03-02', '2023-06-05', 'Married', 3, 'SLTA', '', 9.20, 'Finance & Accounting', 'Staff', 1373072, '', 3, 3),
('EM8826', 'Kota Jakarta Pusat', 'Perempuan', '1994-04-30', '2021-09-16', '2023-03-26', 'Married', 0, 'D2', '', 9.07, 'Service & Support', 'Staff', 4545760, '', 1, 2),
('EM5902', 'Tangerang', 'Laki-laki', '1977-05-08', '2021-12-26', '2023-04-28', 'Married', 0, 'D1', '3.0', 9.82, 'Operations', 'Staff', 4663511, '', 3, 1),
('EM3637', 'Kota Jakarta Utara', 'Perempuan', '1969-04-09', '2022-02-08', '2024-06-17', 'Married', 2, 'SLTA', '0.0', 9.32, 'Marketing', 'Staff', 1341270, '', 3, 2),
('EM2372', 'Kota Jakarta Selatan', 'Laki-laki', '1982-03-12', '2022-03-21', '2023-05-26', 'Single', 2, 'SLTA', '0.0', 9.66, 'HR', 'Staff', 1892207, '', 2, 1),
('EM2124', 'Kepulauan Seribu', 'Laki-laki', '1968-04-11', '2020-03-01', '2023-03-08', 'Married', 3, 'D1', '8.0', 9.46, 'HR', 'Staff', 3623956, '2.', 1, 1),
('EM14442', 'Kota Jakarta Selatan', 'Laki-laki', '1979-07-12', '2022-08-28', '2023-10-17', 'Divorce', 0, 'SLTA', '6.0', 9.83, 'Corporate Strategy & Communications', 'Staff', 1992541, '', 1, 1),
('EM6320', 'Tangerang', 'Laki-laki', '1993-05-11', '2023-08-18', '2024-09-17', 'Single', 0, 'SLTA', '15.', 9.25, 'Creative & Design', 'Staff', 1214974, '', 3, 3),
('EM12913', 'Kabupaten Bekasi', 'Perempuan', '1976-11-06', '2022-10-02', '2023-04-30', 'Married', 1, 'SLTA', '10.', 9.54, 'Engineering & IT', 'Staff', 2038663, '', 3, 3),
('EM11811', 'Kabupaten Bekasi', 'Perempuan', '1981-10-17', '2021-05-31', '', 'Married', 3, 'S1', '3.0', 9.89, 'Service & Support', 'Junior', 6326114, '', 3, 1),
('EM3903', 'Kota Bekasi', 'Perempuan', '1987-07-19', '2024-04-27', '', 'Married', 0, 'D3', '5.0', 9.49, 'Engineering & IT', 'Staff', 4524286, '', 3, 3),
('EM9543', 'Kota Jakarta Timur', 'Laki-laki', '1981-03-20', '2022-09-29', '', 'Married', 3, 'D3', '3.0', 9.57, 'HR', 'Staff', 4738364, '', 1, 3),
('EM0829', 'Kota Bekasi', 'Laki-laki', '1987-12-17', '2023-06-09', '', 'Married', 1, 'S1', '0.0', 9.31, 'Creative & Design', 'Junior', 5740397, '1.', 1, 1),
('EM11091', 'Kota Jakarta Timur', 'Laki-laki', '1977-05-04', '2023-03-21', '2024-04-19', 'Married', 2, 'D1', '6.0', 9.65, 'Engineering & IT', 'Staff', 3345748, '', 3, 2),
('EM15485', 'Kota Jakarta Timur', 'Laki-laki', '1986-09-15', '2023-10-18', '', 'Single', 0, 'S1', '3.0', 9.49, 'HR', 'Junior', 7150686, '', 2, 1),
('EM12380', 'Kota Jakarta Selatan', 'Laki-laki', '1973-03-18', '2021-12-18', '2023-02-17', 'Married', 4, 'SLTA', '4.0', 9.25, 'Service & Support', 'Staff', 1617206, '', 2, 2),
('EM13283', 'Tangerang', 'Perempuan', '1993-02-14', '2023-01-02', '2023-08-08', 'Married', 1, 'D1', '5.0', 9.28, 'Marketing', 'Staff', 3247646, '', 1, 1),
('EM4117', 'Kota Jakarta Barat', 'Laki-laki', '1983-12-17', '2020-02-21', '2024-07-17', 'Married', 1, 'D1', '0.0', 9.45, 'Operations', 'Staff', 4225606, '2.', 2, 1),
('EM3285', 'Kota Jakarta Utara', 'Perempuan', '1994-09-11', '2024-03-30', '2024-08-06', 'Married', 0, 'SLTA', '14.', 9.16, 'Service & Support', 'Staff', 2517376, '1.', 1, 1),
('EM10952', 'Kabupaten Bogor', 'Laki-laki', '1997-04-06', '2021-01-09', '2024-10-02', 'Single', 0, 'D1', '3.0', 9.61, 'Operations', 'Staff', 3713799, '', 2, 3),
('EM3996', 'Kota Jakarta Barat', 'Laki-laki', '1970-02-10', '2021-02-27', '', 'Married', 2, 'S1', '2.0', 9.19, 'Finance & Accounting', 'Junior', 6381690, '', 2, 1),
('EM9522', 'Tangerang', 'Perempuan', '1989-03-07', '2022-08-04', '2023-10-12', 'Divorce', 2, 'D1', '0.0', 9.17, 'Marketing', 'Staff', 3877171, '1.', 3, 1),
('EM4109', 'Kabupaten Bekasi', 'Laki-laki', '1973-01-07', '2022-02-02', '2023-07-09', 'Married', 0, 'SLTA', '13.', 9.16, 'Marketing', 'Staff', 1420368, '', 3, 1),
('EM2495', 'Kota Bogor', 'Laki-laki', '1973-08-21', '2020-06-21', '', 'Married', 4, 'S1', '2.0', 9.69, 'Operations', 'Junior', 5874917, '', 1, 2),
('EM8584', 'Kota Jakarta Selatan', 'Laki-laki', '2000-06-11', '2022-09-22', '2023-11-18', 'Married', 1, 'D2', '3.0', 9.31, 'Creative & Design', 'Staff', 4922488, '', 2, 2),
('EM4679', 'Kota Jakarta Timur', 'Perempuan', '1998-09-15', '2020-05-02', '', 'Single', 0, 'S1', '3.0', 9.10, 'Operations', 'Junior', 5557250, '', 2, 1),
('EM13801', 'Kabupaten Bogor', 'Perempuan', '1981-10-20', '2020-06-08', '', 'Married', 4, 'S1', '3.0', 9.69, 'Operations', 'Junior', 5095307, '1.', 3, 2),
('EM10545', 'Kabupaten Bekasi', 'Laki-laki', '1988-10-04', '2022-06-05', '2024-07-21', 'Married', 1, 'SLTA', '0.0', 9.51, 'Engineering & IT', 'Staff', 1524685, '', 3, 3),
('EM9497', 'Kabupaten Bekasi', 'Perempuan', '1998-04-03', '2021-06-15', '2023-04-01', 'Single', 0, 'SLTA', '10.', 9.45, 'Finance & Accounting', 'Staff', 2186894, '', 2, 3),
('EM5683', 'Kota Depok', 'Perempuan', '1973-08-22', '2022-09-26', '', 'Divorce', 2, 'D1', '2.0', 9.15, 'Engineering & IT', 'Staff', 4731236, '', 2, 3),
('EM11293', 'Kabupaten Bekasi', 'Laki-laki', '1975-08-23', '2022-12-20', '', 'Divorce', 1, 'D3', '0.0', 9.85, 'Marketing', 'Staff', 4351582, '', 3, 2),
('EM7898', 'Kota Jakarta Timur', 'Perempuan', '1978-09-10', '2022-07-24', '2023-11-01', 'Married', 1, 'D3', '0.0', 9.72, 'HR', 'Staff', 4271072, '', 2, 2),
('EM5887', 'Kepulauan Seribu', 'Laki-laki', '1977-08-15', '2022-10-30', '2024-01-04', 'Married', 3, 'D2', '0.0', 9.56, 'Finance & Accounting', 'Staff', 4965304, '', 1, 3),
('EM8902', 'Kabupaten Bogor', 'Perempuan', '1981-07-27', '2020-05-12', '', 'Married', 2, 'S1', '2.0', 9.29, 'HR', 'Junior', 5173142, '1.', 1, 2),
('EM12205', 'Kota Jakarta Pusat', 'Laki-laki', '1977-10-17', '2023-08-09', '2024-10-18', 'Married', 3, 'SLTA', '8.0', 9.26, 'Marketing', 'Staff', 1351969, '', 3, 1),
('EM2324', 'Kepulauan Seribu', 'Perempuan', '1995-03-17', '2023-10-20', '2024-01-28', 'Married', 3, 'SLTA', '14.', 9.64, 'Creative & Design', 'Staff', 1396786, '', 2, 1),
('EM7069', 'Kota Jakarta Selatan', 'Laki-laki', '1990-10-21', '2021-09-25', '2024-01-11', 'Married', 2, 'SLTA', '12.', 9.70, 'Finance & Accounting', 'Staff', 1683444, '', 1, 1),
('EM0492', 'Tangerang', 'Laki-laki', '1987-01-24', '2020-07-03', '', 'Married', 1, 'S1', '3.0', 9.56, 'Engineering & IT', 'Junior', 7148028, '', 2, 2),
('EM4989', 'Kabupaten Bekasi', 'Perempuan', '1981-03-09', '2020-02-16', '', 'Married', 2, 'S1', '1.0', 9.76, 'Finance & Accounting', 'Junior', 6247451, '', 3, 1),
('EM0940', 'Kabupaten Bekasi', 'Laki-laki', '1995-09-20', '2020-04-13', '2024-07-11', 'Married', 1, 'D3', '1.0', 9.82, 'Finance & Accounting', 'Staff', 3425977, '', 2, 1),
('EM13048', 'Kota Jakarta Timur', 'Perempuan', '1987-03-03', '2023-01-13', '2023-05-21', 'Married', 1, 'D2', '6.0', 9.38, 'Operations', 'Staff', 3825245, '', 2, 1),
('EM14137', 'Kota Depok', 'Perempuan', '1987-08-29', '2023-12-14', '2024-04-05', 'Married', 2, 'SLTA', '6.0', 9.25, 'Marketing', 'Staff', 1510595, '', 1, 3),
('EM13088', 'Kota Jakarta Pusat', 'Laki-laki', '1998-10-10', '2023-06-06', '2024-09-13', 'Married', 0, 'SLTA', '7.0', 9.25, 'Operations', 'Staff', 1959915, '', 2, 2),
('EM5952', 'Kota Jakarta Barat', 'Laki-laki', '1992-04-01', '2023-07-14', '2024-10-07', 'Married', 0, 'SLTA', '8.0', 9.31, 'HR', 'Staff', 2618609, '', 3, 3),
('EM6411', 'Kota Jakarta Barat', 'Perempuan', '1983-11-20', '2020-04-04', '2023-08-16', 'Married', 1, 'SLTA', '3.0', 9.80, 'Engineering & IT', 'Staff', 1947677, '', 3, 2),
('EM5349', 'Kabupaten Bekasi', 'Laki-laki', '1980-12-17', '2020-02-27', '', 'Married', 2, 'S1', '2.0', 9.14, 'Creative & Design', 'Junior', 5665403, '', 3, 3),
('EM4878', 'Tangerang', 'Laki-laki', '1971-04-02', '2023-03-17', '2024-05-06', 'Married', 2, 'D1', '2.0', 9.18, 'Operations', 'Staff', 3489692, '', 3, 3),
('EM5637', 'Kabupaten Bekasi', 'Perempuan', '1987-11-19', '2023-06-06', '2024-07-25', 'Married', 0, 'SLTA', '3.0', 9.52, 'Finance & Accounting', 'Staff', 2062501, '', 3, 2),
('EM13299', 'Kota Jakarta Barat', 'Laki-laki', '1993-07-12', '2022-02-20', '2024-02-27', 'Single', 0, 'SLTA', '4.0', 9.10, 'Engineering & IT', 'Staff', 2489216, '', 3, 3),
('EM13130', 'Kota Jakarta Barat', 'Laki-laki', '1983-05-13', '2022-10-19', '2024-02-01', 'Single', 0, 'D3', '6.0', 9.06, 'Creative & Design', 'Staff', 4249179, '', 3, 1),
('EM14133', 'Kabupaten Bekasi', 'Laki-laki', '1981-12-07', '2020-11-30', '2023-02-20', 'Married', 3, 'SLTA', '7.0', 9.66, 'Corporate Strategy & Communications', 'Staff', 2977953, '', 2, 1),
('EM4866', 'Kota Jakarta Selatan', 'Perempuan', '1972-10-15', '2022-01-23', '2024-07-10', 'Married', 5, 'SLTA', '4.0', 9.56, 'Corporate Strategy & Communications', 'Staff', 1970829, '', 1, 3),
('EM11228', 'Kota Bekasi', 'Perempuan', '1990-08-12', '2022-04-04', '2023-05-10', 'Married', 3, 'SLTA', '5.0', 9.36, 'HR', 'Staff', 1202842, '', 3, 3),
('EM11222', 'Kota Jakarta Timur', 'Laki-laki', '1983-12-22', '2020-03-08', '', 'Married', 5, 'S1', '1.0', 9.22, 'Marketing', 'Junior', 7156628, '1.', 3, 3),
('EM3369', 'Kabupaten Bekasi', 'Laki-laki', '1993-09-26', '2021-11-09', '2024-02-05', 'Married', 2, 'SLTA', '11.', 9.57, 'Finance & Accounting', 'Staff', 1153606, '', 1, 2),
('EM8226', 'Tangerang', 'Laki-laki', '1999-12-02', '2023-07-10', '2024-10-02', 'Single', 0, 'SLTA', '10.', 9.78, 'Finance & Accounting', 'Staff', 2523181, '', 2, 3),
('EM11136', 'Kabupaten Bogor', 'Perempuan', '1984-09-02', '2021-08-09', '2024-01-16', 'Married', 3, 'SLTA', '8.0', 9.76, 'Engineering & IT', 'Staff', 1147241, '', 2, 1),
('EM6485', 'Tangerang', 'Laki-laki', '1979-06-16', '2022-10-25', '2023-04-19', 'Married', 2, 'SLTA', '3.0', 9.11, 'Marketing', 'Staff', 1687539, '', 2, 2),
('EM4341', 'Kota Jakarta Pusat', 'Perempuan', '1994-12-12', '2021-05-22', '2023-07-16', 'Married', 0, 'SLTA', '8.0', 9.05, 'Operations', 'Staff', 1642935, '1.', 1, 2),
('EM1513', 'Kota Jakarta Barat', 'Laki-laki', '1998-01-15', '2023-01-16', '', 'Single', 0, 'S1', '1.0', 9.73, 'HR', 'Junior', 6619649, '', 3, 1),
('EM11453', 'Kota Jakarta Timur', 'Laki-laki', '1993-05-08', '2023-05-15', '2024-10-01', 'Single', 0, 'D1', '5.0', 9.81, 'HR', 'Staff', 3477585, '', 1, 3),
('EM2856', 'Kota Jakarta Pusat', 'Perempuan', '1984-10-09', '2022-10-07', '', 'Married', 3, 'S1', '3.0', 9.17, 'Service & Support', 'Junior', 5472615, '', 2, 1),
('EM7286', 'Kota Bekasi', 'Perempuan', '1989-10-18', '2023-07-05', '2024-04-02', 'Married', 4, 'D3', '2.0', 9.51, 'HR', 'Staff', 4394300, '', 3, 3),
('EM7927', 'Kota Jakarta Utara', 'Perempuan', '1972-01-01', '2020-09-21', '2023-10-19', 'Married', 4, 'SLTA', '11.', 9.64, 'Corporate Strategy & Communications', 'Staff', 1340229, '', 2, 2),
('EM0380', 'Kota Jakarta Utara', 'Laki-laki', '1999-02-04', '2022-06-27', '2023-12-01', 'Married', 1, 'D2', '4.0', 9.25, 'HR', 'Staff', 3560812, '', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_comments`
--

CREATE TABLE `employee_comments` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `employee_comments`
--

INSERT INTO `employee_comments` (`id`, `employee_id`, `comment`, `created_at`) VALUES
(1, 'EM4325', 'halo, ini testing', '2025-01-27 13:26:33'),
(2, 'EM4325', 'halo ini aku testing lagi', '2025-01-27 13:33:16'),
(3, 'EM4325', 'scasadaa', '2025-01-27 13:35:15'),
(4, 'EM4325', 'scasadaa', '2025-01-27 13:35:31'),
(5, 'EM4325', 'asdscac', '2025-01-27 13:38:49'),
(6, 'EM4325', 'xaxscsc', '2025-01-27 13:39:32'),
(7, 'EM4325', 'csdqas', '2025-01-27 13:40:14'),
(8, 'EM7819', 'testing ', '2025-01-27 14:28:39'),
(9, 'EM67181', 'ssdes', '2025-01-27 22:39:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_job_sas`
--

CREATE TABLE `employee_job_sas` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `question_1` int(11) DEFAULT NULL,
  `question_2` int(11) DEFAULT NULL,
  `question_3` int(11) DEFAULT NULL,
  `question_4` int(11) DEFAULT NULL,
  `question_5` int(11) DEFAULT NULL,
  `question_6` int(11) DEFAULT NULL,
  `question_7` int(11) DEFAULT NULL,
  `question_8` int(11) DEFAULT NULL,
  `skor_akhir` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `employee_job_sas`
--

INSERT INTO `employee_job_sas` (`id`, `employee_id`, `question_1`, `question_2`, `question_3`, `question_4`, `question_5`, `question_6`, `question_7`, `question_8`, `skor_akhir`, `created_at`) VALUES
(1, 'EM11453', 1, 1, 1, 1, 1, 1, 1, 1, 1, '2025-01-27 07:07:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_ratings`
--

CREATE TABLE `employee_ratings` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `question_1` varchar(50) NOT NULL,
  `question_2` varchar(50) NOT NULL,
  `question_3` varchar(50) NOT NULL,
  `question_4` varchar(50) NOT NULL,
  `question_5` varchar(50) NOT NULL,
  `question_6` varchar(50) NOT NULL,
  `question_7` varchar(50) NOT NULL,
  `question_8` varchar(50) NOT NULL,
  `skor_akhir` int(11) NOT NULL,
  `waktu_pengisian` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `employee_ratings`
--

INSERT INTO `employee_ratings` (`id`, `employee_id`, `question_1`, `question_2`, `question_3`, `question_4`, `question_5`, `question_6`, `question_7`, `question_8`, `skor_akhir`, `waktu_pengisian`) VALUES
(1, 'EM11453', '3', '3', '3', '3', '3', '3', '3', '3', 3, '2025-01-27 03:03:43'),
(2, 'EM8267', '3', '3', '3', '3', '3', '3', '3', '3', 3, '2025-01-27 03:05:28'),
(3, 'EM11453', '3', '3', '3', '3', '3', '3', '3', '3', 3, '2025-01-27 03:08:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history_prediction`
--

CREATE TABLE `history_prediction` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `hasil_prediksi_klasifikasi` varchar(50) DEFAULT NULL,
  `probabilitas_pred_klasifikasi` decimal(5,2) DEFAULT NULL,
  `hasil_prediksi_regresi` decimal(10,2) DEFAULT NULL,
  `waktu_prediksi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `history_prediction`
--

INSERT INTO `history_prediction` (`id`, `employee_id`, `hasil_prediksi_klasifikasi`, `probabilitas_pred_klasifikasi`, `hasil_prediksi_regresi`, `waktu_prediksi`) VALUES
(1, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-26 21:52:33'),
(2, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-26 22:03:29'),
(3, 'EM11453', 'Tidak Retensi', 95.54, 16.49, '2025-01-27 08:09:57'),
(4, 'EM11453', 'Tidak Retensi', 95.54, 16.49, '2025-01-27 08:19:05'),
(5, 'EM11453', 'Tidak Retensi', 95.54, 16.49, '2025-01-27 08:25:00'),
(6, 'EM11453', 'Tidak Retensi', 95.54, 16.49, '2025-01-27 08:25:38'),
(7, 'EM11453', 'Tidak Retensi', 95.54, 16.49, '2025-01-27 08:38:34'),
(8, 'EM11453', 'Tidak Retensi', 95.54, 16.49, '2025-01-27 08:39:28'),
(9, 'EM11453', 'Tidak Retensi', 95.12, 16.50, '2025-01-27 12:15:37'),
(10, 'EM11453', 'Tidak Retensi', 95.12, 16.50, '2025-01-27 12:19:42'),
(11, 'EM11453', 'Tidak Retensi', 95.12, 16.50, '2025-01-27 12:22:25'),
(12, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 12:23:48'),
(13, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 12:27:19'),
(14, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 12:28:56'),
(15, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 12:30:21'),
(16, 'EM14973', 'Retensi', 13.53, 35.74, '2025-01-27 20:15:41'),
(17, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 20:19:14'),
(18, 'EM11453', 'Tidak Retensi', 95.36, 16.49, '2025-01-27 20:28:48'),
(19, 'EM11453', 'Tidak Retensi', 95.36, 16.49, '2025-01-27 20:31:18'),
(20, 'EM11453', 'Tidak Retensi', 95.36, 16.49, '2025-01-27 20:40:15'),
(21, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 20:42:31'),
(22, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 20:46:30'),
(23, 'EM8267', 'Retensi', 0.06, 10.15, '2025-01-27 20:47:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shap_pred_result`
--

CREATE TABLE `shap_pred_result` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `shap_values` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `shap_pred_result`
--

INSERT INTO `shap_pred_result` (`id`, `employee_id`, `shap_values`, `created_at`) VALUES
(1, 'EM11453', '{\"domisili\": [0.015864911256707883, -0.039672566006640854, 0.05250129138403135, 0.004316671870098103, -0.008981441532175415, -0.03691147086325979, -0.028677643893221923, 0.009738166795736617, 0.3543731809131695, 0.11229522343850157, -0.02236467429145609, -0.01765007920196825, 0.03560001184086535, 0.03375561308331621, 1.077654085750788, 0.13443025288118599, 0.016334826337656823, 0.0019681034316208303, 0.1036001315838651, -0.02142157760798478, 0.012820118720707185, 2.4470657206205693, -0.05259928732079845, 0.01402612408595268, 0.15164237463803498, -0.03385091926519586, -0.032481567807413986, -0.02172238971183111, -0.053387539674543544, 0.33917626286998137, 0.022987818884066435]}', '2025-01-27 05:19:43'),
(2, 'EM8267', '{\"domisili\": -0.054348531286920486, \"jenis_kelamin\": -0.029043784096161766, \"marriage_stat\": -0.08810992035054925, \"dependant\": -0.00455854578277676, \"education\": 0.04791742067850916, \"absent_90D\": 0.034889135075289866, \"avg_time_work\": 0.0062645753950063415, \"departemen\": -0.054664439981379945, \"position\": -0.1670958802317469, \"income\": 0.20107383342448162, \"total_komp\": -0.026177310719682736, \"job_satisfaction\": -0.024735328696188944, \"performance_rating\": -0.01038959404577289, \"age_years\": 0.05642982741867107, \"active_work\": -1.2949235392886824, \"income_3_months\": 0.14602562457520002, \"income_6_months\": 0.06403606024048009, \"total_income_work\": 0.05182582812991011, \"absence_ratio\": 0.2005471901273242, \"income_dependant_ratio\": -0.0176958296974861, \"work_efficiency\": 0.0028292851794138717, \"active_work_category\": -5.581461871907119, \"work_stability_score\": 0.18171537709643645, \"married_dependent_ratio\": -0.018077422765929666, \"position_score\": 0.1082164432610815, \"job_income_position_score\": 0.06621039347910468, \"education_score\": 0.16422230820723321, \"education_income_ratio\": 0.05851128535116434, \"weighted_satisfaction_performance\": 0.07982398380855349, \"resign_risk_indicator\": 0.11446522536177353, \"adjusted_work_time\": 0.01672810436093725}', '2025-01-27 05:30:21'),
(3, 'EM14973', '{\"domisili\": -0.0069673084394661884, \"jenis_kelamin\": -0.013271977408900492, \"marriage_stat\": -0.0029880245446153655, \"dependant\": -0.00456150519595619, \"education\": -0.02191664690024874, \"absent_90D\": -0.16572219077424252, \"avg_time_work\": 0.014596908523379989, \"departemen\": -0.11679035565005416, \"position\": 0.4966015869903271, \"income\": -0.27470944566049355, \"total_komp\": -0.03920049504229357, \"job_satisfaction\": 0.046495894929020135, \"performance_rating\": 0.06605973203314158, \"age_years\": -0.27646016901819515, \"active_work\": -1.174211012176119, \"income_3_months\": -0.4445227958585274, \"income_6_months\": 0.012211249652367374, \"total_income_work\": -0.22058609199319382, \"absence_ratio\": -0.16999825733105695, \"income_dependant_ratio\": -0.07563600074390099, \"work_efficiency\": 0.017183572657402436, \"active_work_category\": 1.7401020712729003, \"work_stability_score\": -0.13745134000601006, \"married_dependent_ratio\": 0.020053419102160994, \"position_score\": 0.2813640391073691, \"job_income_position_score\": 0.17047540775810566, \"education_score\": -0.05345279779272163, \"education_income_ratio\": -0.20624283985613664, \"weighted_satisfaction_performance\": 0.0361066783927651, \"resign_risk_indicator\": 0.08629253596200868, \"adjusted_work_time\": 0.16135502713746497}', '2025-01-27 13:15:42'),
(4, 'EM8267', '{\"domisili\": -0.054348531286920486, \"jenis_kelamin\": -0.029043784096161766, \"marriage_stat\": -0.08810992035054925, \"dependant\": -0.00455854578277676, \"education\": 0.04791742067850916, \"absent_90D\": 0.034889135075289866, \"avg_time_work\": 0.0062645753950063415, \"departemen\": -0.054664439981379945, \"position\": -0.1670958802317469, \"income\": 0.20107383342448162, \"total_komp\": -0.026177310719682736, \"job_satisfaction\": -0.024735328696188944, \"performance_rating\": -0.01038959404577289, \"age_years\": 0.05642982741867107, \"active_work\": -1.2949235392886824, \"income_3_months\": 0.14602562457520002, \"income_6_months\": 0.06403606024048009, \"total_income_work\": 0.05182582812991011, \"absence_ratio\": 0.2005471901273242, \"income_dependant_ratio\": -0.0176958296974861, \"work_efficiency\": 0.0028292851794138717, \"active_work_category\": -5.581461871907119, \"work_stability_score\": 0.18171537709643645, \"married_dependent_ratio\": -0.018077422765929666, \"position_score\": 0.1082164432610815, \"job_income_position_score\": 0.06621039347910468, \"education_score\": 0.16422230820723321, \"education_income_ratio\": 0.05851128535116434, \"weighted_satisfaction_performance\": 0.07982398380855349, \"resign_risk_indicator\": 0.11446522536177353, \"adjusted_work_time\": 0.01672810436093725}', '2025-01-27 13:19:15'),
(5, 'EM11453', '{\"domisili\": 0.01599836998254338, \"jenis_kelamin\": -0.039672566006640854, \"marriage_stat\": 0.06545967330428594, \"dependant\": 0.0046252218782097424, \"education\": -0.014456319846761066, \"absent_90D\": -0.03691147086325979, \"avg_time_work\": -0.02824688830429336, \"departemen\": 0.009779471504242248, \"position\": 0.3537231499783214, \"income\": 0.10706193606852435, \"total_komp\": -0.02236467429145609, \"job_satisfaction\": -0.01760291216873429, \"performance_rating\": 0.035485377966229505, \"age_years\": 0.028155596241146257, \"active_work\": 1.0589574974828844, \"income_3_months\": 0.13400291471484188, \"income_6_months\": 0.01968070562959685, \"total_income_work\": -0.004490304499950364, \"absence_ratio\": 0.09834836813138569, \"income_dependant_ratio\": -0.021523711235866102, \"work_efficiency\": 0.023004436545048752, \"active_work_category\": 2.4539414883556785, \"work_stability_score\": -0.05425911283978267, \"married_dependent_ratio\": 0.01402612408595268, \"position_score\": 0.15164237463803498, \"job_income_position_score\": -0.058476875495434136, \"education_score\": -0.032481567807413986, \"education_income_ratio\": -0.022537973618710752, \"weighted_satisfaction_performance\": 0.034608833259218263, \"resign_risk_indicator\": 0.3364673594593166, \"adjusted_work_time\": 0.031335574328416556}', '2025-01-27 13:28:48'),
(6, 'EM11453', '{\"domisili\": 0.01599836998254338, \"jenis_kelamin\": -0.039672566006640854, \"marriage_stat\": 0.06545967330428594, \"dependant\": 0.0046252218782097424, \"education\": -0.014456319846761066, \"absent_90D\": -0.03691147086325979, \"avg_time_work\": -0.02824688830429336, \"departemen\": 0.009779471504242248, \"position\": 0.3537231499783214, \"income\": 0.10706193606852435, \"total_komp\": -0.02236467429145609, \"job_satisfaction\": -0.01760291216873429, \"performance_rating\": 0.035485377966229505, \"age_years\": 0.028155596241146257, \"active_work\": 1.0589574974828844, \"income_3_months\": 0.13400291471484188, \"income_6_months\": 0.01968070562959685, \"total_income_work\": -0.004490304499950364, \"absence_ratio\": 0.09834836813138569, \"income_dependant_ratio\": -0.021523711235866102, \"work_efficiency\": 0.023004436545048752, \"active_work_category\": 2.4539414883556785, \"work_stability_score\": -0.05425911283978267, \"married_dependent_ratio\": 0.01402612408595268, \"position_score\": 0.15164237463803498, \"job_income_position_score\": -0.058476875495434136, \"education_score\": -0.032481567807413986, \"education_income_ratio\": -0.022537973618710752, \"weighted_satisfaction_performance\": 0.034608833259218263, \"resign_risk_indicator\": 0.3364673594593166, \"adjusted_work_time\": 0.031335574328416556}', '2025-01-27 13:31:18'),
(7, 'EM11453', '{\"domisili\": 0.01599836998254338, \"jenis_kelamin\": -0.039672566006640854, \"marriage_stat\": 0.06545967330428594, \"dependant\": 0.0046252218782097424, \"education\": -0.014456319846761066, \"absent_90D\": -0.03691147086325979, \"avg_time_work\": -0.02824688830429336, \"departemen\": 0.009779471504242248, \"position\": 0.3537231499783214, \"income\": 0.10706193606852435, \"total_komp\": -0.02236467429145609, \"job_satisfaction\": -0.01760291216873429, \"performance_rating\": 0.035485377966229505, \"age_years\": 0.028155596241146257, \"active_work\": 1.0589574974828844, \"income_3_months\": 0.13400291471484188, \"income_6_months\": 0.01968070562959685, \"total_income_work\": -0.004490304499950364, \"absence_ratio\": 0.09834836813138569, \"income_dependant_ratio\": -0.021523711235866102, \"work_efficiency\": 0.023004436545048752, \"active_work_category\": 2.4539414883556785, \"work_stability_score\": -0.05425911283978267, \"married_dependent_ratio\": 0.01402612408595268, \"position_score\": 0.15164237463803498, \"job_income_position_score\": -0.058476875495434136, \"education_score\": -0.032481567807413986, \"education_income_ratio\": -0.022537973618710752, \"weighted_satisfaction_performance\": 0.034608833259218263, \"resign_risk_indicator\": 0.3364673594593166, \"adjusted_work_time\": 0.031335574328416556}', '2025-01-27 13:40:15'),
(8, 'EM8267', '{\"domisili\": -0.054348531286920486, \"jenis_kelamin\": -0.029043784096161766, \"marriage_stat\": -0.08810992035054925, \"dependant\": -0.00455854578277676, \"education\": 0.04791742067850916, \"absent_90D\": 0.034889135075289866, \"avg_time_work\": 0.0062645753950063415, \"departemen\": -0.054664439981379945, \"position\": -0.1670958802317469, \"income\": 0.20107383342448162, \"total_komp\": -0.026177310719682736, \"job_satisfaction\": -0.024735328696188944, \"performance_rating\": -0.01038959404577289, \"age_years\": 0.05642982741867107, \"active_work\": -1.2949235392886824, \"income_3_months\": 0.14602562457520002, \"income_6_months\": 0.06403606024048009, \"total_income_work\": 0.05182582812991011, \"absence_ratio\": 0.2005471901273242, \"income_dependant_ratio\": -0.0176958296974861, \"work_efficiency\": 0.0028292851794138717, \"active_work_category\": -5.581461871907119, \"work_stability_score\": 0.18171537709643645, \"married_dependent_ratio\": -0.018077422765929666, \"position_score\": 0.1082164432610815, \"job_income_position_score\": 0.06621039347910468, \"education_score\": 0.16422230820723321, \"education_income_ratio\": 0.05851128535116434, \"weighted_satisfaction_performance\": 0.07982398380855349, \"resign_risk_indicator\": 0.11446522536177353, \"adjusted_work_time\": 0.01672810436093725}', '2025-01-27 13:42:31'),
(9, 'EM8267', '{\"domisili\": -0.054348531286920486, \"jenis_kelamin\": -0.029043784096161766, \"marriage_stat\": -0.08810992035054925, \"dependant\": -0.00455854578277676, \"education\": 0.04791742067850916, \"absent_90D\": 0.034889135075289866, \"avg_time_work\": 0.0062645753950063415, \"departemen\": -0.054664439981379945, \"position\": -0.1670958802317469, \"income\": 0.20107383342448162, \"total_komp\": -0.026177310719682736, \"job_satisfaction\": -0.024735328696188944, \"performance_rating\": -0.01038959404577289, \"age_years\": 0.05642982741867107, \"active_work\": -1.2949235392886824, \"income_3_months\": 0.14602562457520002, \"income_6_months\": 0.06403606024048009, \"total_income_work\": 0.05182582812991011, \"absence_ratio\": 0.2005471901273242, \"income_dependant_ratio\": -0.0176958296974861, \"work_efficiency\": 0.0028292851794138717, \"active_work_category\": -5.581461871907119, \"work_stability_score\": 0.18171537709643645, \"married_dependent_ratio\": -0.018077422765929666, \"position_score\": 0.1082164432610815, \"job_income_position_score\": 0.06621039347910468, \"education_score\": 0.16422230820723321, \"education_income_ratio\": 0.05851128535116434, \"weighted_satisfaction_performance\": 0.07982398380855349, \"resign_risk_indicator\": 0.11446522536177353, \"adjusted_work_time\": 0.01672810436093725}', '2025-01-27 13:46:30'),
(10, 'EM8267', '{\"domisili\": -0.054348531286920486, \"jenis_kelamin\": -0.029043784096161766, \"marriage_stat\": -0.08810992035054925, \"dependant\": -0.00455854578277676, \"education\": 0.04791742067850916, \"absent_90D\": 0.034889135075289866, \"avg_time_work\": 0.0062645753950063415, \"departemen\": -0.054664439981379945, \"position\": -0.1670958802317469, \"income\": 0.20107383342448162, \"total_komp\": -0.026177310719682736, \"job_satisfaction\": -0.024735328696188944, \"performance_rating\": -0.01038959404577289, \"age_years\": 0.05642982741867107, \"active_work\": -1.2949235392886824, \"income_3_months\": 0.14602562457520002, \"income_6_months\": 0.06403606024048009, \"total_income_work\": 0.05182582812991011, \"absence_ratio\": 0.2005471901273242, \"income_dependant_ratio\": -0.0176958296974861, \"work_efficiency\": 0.0028292851794138717, \"active_work_category\": -5.581461871907119, \"work_stability_score\": 0.18171537709643645, \"married_dependent_ratio\": -0.018077422765929666, \"position_score\": 0.1082164432610815, \"job_income_position_score\": 0.06621039347910468, \"education_score\": 0.16422230820723321, \"education_income_ratio\": 0.05851128535116434, \"weighted_satisfaction_performance\": 0.07982398380855349, \"resign_risk_indicator\": 0.11446522536177353, \"adjusted_work_time\": 0.01672810436093725}', '2025-01-27 13:47:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` enum('admin','karyawan','pimpinan','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin123', 'admin'),
(2, 'karyawan', 'karyawan123', 'karyawan'),
(3, 'pimpinan', 'pimpinan123', 'pimpinan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `employee_comments`
--
ALTER TABLE `employee_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `employee_job_sas`
--
ALTER TABLE `employee_job_sas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `employee_ratings`
--
ALTER TABLE `employee_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history_prediction`
--
ALTER TABLE `history_prediction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shap_pred_result`
--
ALTER TABLE `shap_pred_result`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `employee_comments`
--
ALTER TABLE `employee_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `employee_job_sas`
--
ALTER TABLE `employee_job_sas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `employee_ratings`
--
ALTER TABLE `employee_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `history_prediction`
--
ALTER TABLE `history_prediction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `shap_pred_result`
--
ALTER TABLE `shap_pred_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

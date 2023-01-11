-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2022 at 10:26 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10
create database webshop2;
use webshop2;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 1641509311);

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Thời trang', '', 0, 1, '2021-01-01 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2021-01-01 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2021-01-01 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2021-01-01 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2021-01-01 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '0000-00-00 00:00:00'),
(7, 'Sản phẩm nam', '', 1, 1, '2021-01-01 05:37:23'),
(8, 'Sản phẩm nữ', '', 1, 2, '2021-01-01 05:37:36');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `image_link` text NOT NULL,
  `rate` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `product_id`, `content`, `image_link`, `rate`, `date`, `user_id`) VALUES
(1, 1, 'Sản phẩm tốt!', 'sp1_2.jpg', 5, 1642006097, 1),
(2, 6, '5 sao !!!!', 'sp6_3.jpg', 5, 1642006155, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_method` varchar(50) NOT NULL,
  `size_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `code`, `qty`, `amount`, `status`, `payment_method`, `size_id`) VALUES
(84, 55, 26, 'HANDEE2', 1, '350000.00', 0, 'cash', '01'),
(85, 56, 25, 'HANDEE85', 1, '268000.00', 0, 'vnpay', '01'),
(86, 56, 10, 'HANDEE85', 1, '130000.00', 0, 'vnpay', '01');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) NOT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(1, 16, 'Dầu gội romano', '<p><strong>M&Ocirc; TẢ SẢN PHẨM</strong></p>\r\n\r\n<p>romano m&atilde;i đỉnh</p>\r\n\r\n<p><strong>Đặc điểm nổi bật </strong></p>\r\n\r\n<p>- Chất liệu: 95% Cotton Compact 5% Spandex Mềm mại v&agrave; kh&ocirc;ng g&acirc;y kh&oacute; chịu khi mặc Chất liệu co gi&atilde;n 4 chiều đem lại sự thoải m&aacute;i suốt ng&agrave;y d&agrave;i Bền dai, kh&ocirc;ng bai, nh&atilde;o, x&ugrave; l&ocirc;ng Tự h&agrave;o sản xuất tại Việt Nam</p>\r\n\r\n<p>Những chiếc &aacute;o của Coolmate sử dụng chất liệu cotton compact, một dạng cotton chất lượng cao đem đến cho người mặc trải nghiệm tuyệt vời nhất. &quot;Cotton Compact&quot; l&agrave; c&acirc;u trả lời cho c&aacute;c bạn đang t&igrave;m kiếm cho m&igrave;nh một chiếc &aacute;o thun mặc l&ecirc;n nh&igrave;n đẹp trai hơn một ch&uacute;t, bền hơn v&agrave; tho&aacute;ng m&aacute;t hơn.</p>\r\n', '259000.00', 0, 'romano.jpg', '[\"romano1.jpg\"]', 38, 5, 5, 5, 1493983674);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_province` int(11) NOT NULL,
  `id_district` int(11) NOT NULL,
  `name_province` varchar(200) NOT NULL,
  `name_district` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `id_province`, `id_district`, `name_province`, `name_district`) VALUES
(1, 'GHN-Giao Hàng Nhanh', 260, 2206, 'Đà Nẵng ', 'Quận Thanh Khê');

-- --------------------------------------------------------

--
-- Table structure for table `sizedetail`
--

CREATE TABLE `sizedetail` (
  `id` int(11) NOT NULL,
  `product_id` int(255) NOT NULL,
  `size_id` varchar(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sizedetail`
--

INSERT INTO `sizedetail` (`id`, `product_id`, `size_id`, `quantity`) VALUES
(1, 1, '02', 8),
(2, 1, '01', 6),
(3, 2, '04', 30),
(4, 2, '03', 5),
(5, 2, '02', 10),
(6, 3, '04', 12),
(7, 3, '03', 10),
(8, 3, '02', 20),
(9, 3, '01', 10),
(10, 4, '03', 20),
(11, 4, '02', 10),
(12, 4, '01', 8),
(13, 5, '04', 20),
(14, 5, '03', 20),
(15, 5, '02', 20),
(16, 5, '01', 10),
(17, 6, '04', 10),
(18, 6, '03', 28),
(19, 6, '02', 14),
(20, 6, '01', 9),
(21, 7, '03', 10),
(22, 7, '02', 17),
(23, 7, '01', 8),
(24, 8, '03', 10),
(25, 8, '02', 30),
(26, 8, '01', 10),
(27, 9, '04', 10),
(28, 9, '03', 10),
(29, 9, '02', 20),
(30, 9, '01', 10),
(31, 10, '03', 20),
(32, 10, '02', 10),
(33, 10, '01', 5),
(34, 11, '04', 20),
(35, 11, '03', 10),
(36, 11, '02', 20),
(37, 11, '01', 8),
(38, 12, '02', 20),
(39, 12, '01', 20),
(40, 13, '03', 10),
(41, 13, '02', 20),
(42, 13, '01', 10),
(43, 14, '03', 20),
(44, 14, '02', 20),
(45, 14, '01', 20),
(46, 15, '04', 10),
(47, 15, '03', 10),
(48, 15, '02', 20),
(49, 15, '01', 19),
(50, 16, '03', 20),
(51, 16, '02', 19),
(52, 16, '01', 15),
(53, 17, '04', 10),
(54, 17, '03', 10),
(55, 17, '02', 10),
(56, 17, '01', 9),
(57, 18, '03', 10),
(58, 18, '02', 10),
(59, 18, '01', 6),
(60, 19, '04', 20),
(61, 19, '03', 20),
(62, 19, '02', 18),
(63, 19, '01', 20),
(64, 20, '04', 5),
(65, 20, '03', 9),
(66, 20, '02', 8),
(67, 21, '03', 20),
(68, 21, '02', 15),
(69, 21, '01', 13),
(70, 22, '03', 20),
(71, 22, '02', 19),
(72, 22, '01', 11),
(73, 23, '02', 20),
(74, 23, '01', 20),
(75, 24, '02', 19),
(76, 24, '01', 3),
(77, 25, '04', 10),
(78, 25, '03', 17),
(79, 25, '02', 7),
(80, 25, '01', 6),
(81, 26, '03', 10),
(82, 26, '02', 9),
(83, 26, '01', 4),
(84, 27, '03', 20),
(85, 27, '02', 18),
(86, 27, '01', 17);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` varchar(11) NOT NULL,
  `name` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
('01', 'S'),
('02', 'M'),
('03', 'L'),
('04', 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_link` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'slide1.jpg', 'http://barbershop.com/barberproduct/', 1, '2022-01-02 15:24:43'),
(2, '2', 'slide2.jpg', 'http://barbershop.com/barberproduct/', 2, '2022-01-02 15:36:41'),
(3, '3', 'slide3.jpg', 'http://barbershop.com/barberproduct/', 3, '2022-01-02 13:47:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vnpay`
--

CREATE TABLE `tbl_vnpay` (
  `id_vnpay` int(11) NOT NULL,
  `vnp_amount` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `vnp_bankCode` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `vnp_banktranno` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `vnp_cardtype` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `vnp_orderinfo` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `vnp_paydate` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `vnp_tmncode` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `vnp_transactionno` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `code_cart` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_vnpay`
--

INSERT INTO `tbl_vnpay` (`id_vnpay`, `vnp_amount`, `vnp_bankCode`, `vnp_banktranno`, `vnp_cardtype`, `vnp_orderinfo`, `vnp_paydate`, `vnp_tmncode`, `vnp_transactionno`, `code_cart`) VALUES
(11, '44200000', 'NCB', 'VNP13881211', 'ATM', 'Thanh toan don hang tai web', '20221118102332', '7GXD782M', '13881211', 'HANDEE85');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(55, 0, 0, 'nguyen manh hung', 'admin@gmail.com', '0393939393', 'Sơn La, Huyện Yên Châu, Xã Phiêng Khoài - mahaf', ' Phí Ship: 44,000VNĐ', '394000.00', 'cash', 1668677973),
(56, 0, 0, 'nguyen cong phuong', 'admin@gmail.com', '0393939393', 'Lào Cai, Huyện Văn Bàn, Xã Khánh Yên Trung - tan binh', ' Phí Ship: 44,000VNĐ', '442000.00', 'vnpay', 1668741818);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(1, 'Hoàng Ngọc Nguyên', 'ngocnguyen@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456001', '', 1638830911),
(2, 'Trần Thanh Nam', 'namthanh@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456002', '', 1638830911),
(3, 'Trần Văn Tới', 'tranvantoi@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456003', '', 1638830911),
(4, 'Hồ Duy Ninh', 'ninhho@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456004', '', 1641509311),
(5, 'Trần Ngọc Sang', 'sangtran12@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456005', '', 1625525311),
(6, 'Đào Nguyễn Phương Hoa', 'hoadao@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456006', '', 1625525311),
(7, 'Lê Trần Công', 'congtran23@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456007', '', 1625525311),
(8, 'Nguyễn Đức Mạnh', 'manhduc@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456008', '', 1625525311),
(9, 'Đỗ Trung Nhân', 'dotrungnhan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456009', '', 1625525311),
(10, 'Bùi Tấn Khoa', 'khoatanbui123@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456010', '', 1625525311);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userID` (`user_id`),
  ADD KEY `fk_productID` (`product_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`product_id`),
  ADD KEY `fk_size` (`size_id`) USING BTREE,
  ADD KEY `fk_transation` (`transaction_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catalog` (`catalog_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizedetail`
--
ALTER TABLE `sizedetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sizes` (`size_id`),
  ADD KEY `fk_sizedelta_product` (`product_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_vnpay`
--
ALTER TABLE `tbl_vnpay`
  ADD PRIMARY KEY (`id_vnpay`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sizedetail`
--
ALTER TABLE `sizedetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_vnpay`
--
ALTER TABLE `tbl_vnpay`
  MODIFY `id_vnpay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_productID` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_size` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  ADD CONSTRAINT `fk_transation` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_catalog_product` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`);

--
-- Constraints for table `sizedetail`
--
ALTER TABLE `sizedetail`
  ADD CONSTRAINT `fk_sizedelta_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_sizes` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

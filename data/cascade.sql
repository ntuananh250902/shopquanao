-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 13, 2023 at 10:17 PM
-- Server version: 8.0.35-0ubuntu0.20.04.1
-- PHP Version: 7.4.3-4ubuntu2.19
-- USE yameshop
-- USE foody1;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Khởi tạo các table

CREATE TABLE `datmon` (
  `id` int NOT NULL AUTO_INCREMENT ,
  `idnguoidung` int NOT NULL,
  `idmonan` int NOT NULL,
  `soluong` int NOT NULL,
  `gia` int NOT NULL,
  `thanhtien` int NOT NULL,
  `thanhtoan` int ,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `monan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iddanhmuc` int not null,
  `tenmonan` varchar(255) NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `gia` int NOT NULL,
  `trangthai` int not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `nguoidung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tendangnhap` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `loaiquyen` varchar(255) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

Create table `danhmuc`(
 `id` int not null AUTO_INCREMENT,
 `tendanhmuc` varchar(255) not null,
 `trangthai` int not null,
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- Thêm dữ liệu table
-- Table datmon
INSERT INTO `datmon` ( `idnguoidung`, `idmonan`, `soluong`, `gia`, `thanhtien`,`thanhtoan`) VALUES
(1, 1, 2, 25000, 50000,0);
INSERT INTO `datmon` ( `idnguoidung`, `idmonan`, `soluong`, `gia`, `thanhtien`,`thanhtoan`) VALUES
(1, 5, 2, 25000, 50000,0);
-- Table monan
INSERT INTO `monan` (`iddanhmuc`, `tenmonan`, `hinhanh`, `gia`,`trangthai`) VALUES
-- Áo khoác
(1, 'Áo Khoác Có Nón Vải Thun Chống Nắng Biểu Tượng Dáng Vừa Đơn Giản Sekhmet Ver3', 'Áo Khoác Có Nón Vải Thun Chống Nắng Biểu Tượng Dáng Vừa Đơn Giản Sekhmet Ver3.jpg', 399000,1),
(1, 'Áo Khoác Có Nón Vải Thun Giữ Ấm Phối Màu Dáng Rộng BST Thiết Kế Y2010 Originals Ver25', 'Áo Khoác Có Nón Vải Thun Giữ Ấm Phối Màu Dáng Rộng BST Thiết Kế Y2010 Originals Ver25.jpg.jpg', 250000,1),
(1, 'Áo Khoác Không Nón Vải Denim Chống Nắng Phối Màu Dáng Rộng BST Thiết Kế Space Ver3', 'Áo Khoác Không Nón Vải Denim Chống Nắng Phối Màu Dáng Rộng BST Thiết Kế Space Ver3.jpg', 300000,1),
(1, 'Áo Khoác Không Nón Vải Dù Chống Nắng Biểu Tượng Dáng Rộng BST Thiết Kế Y2010 Originals 01', 'Áo Khoác Không Nón Vải Dù Chống Nắng Biểu Tượng Dáng Rộng BST Thiết Kế Y2010 Originals 01.jpg', 289000,1),
(1, 'Áo Khoác Không Nón Vải Dù Chống Nắng Phối Màu Dáng Rộng BST Thiết Kế Y2010 Originals Ver39', 'Áo Khoác Không Nón Vải Dù Chống Nắng Phối Màu Dáng Rộng BST Thiết Kế Y2010 Originals Ver39.jpg', 349000,1),
-- Áo thun
(2, 'Áo Khoác Không Nón Vải Dù Chống Nắng Phối Màu Dáng Rộng BST Thiết Kế Y2010 Originals Ver39', 'Áo Khoác Không Nón Vải Dù Chống Nắng Phối Màu Dáng Rộng BST Thiết Kế Y2010 Originals Ver39.jpg', 349000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Rộng BST Thiết Kế ONE PIECE 01', 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Rộng BST Thiết Kế ONE PIECE 01.jpg', 230000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 01', 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 01.jpg', 220000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 02', 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 02.jpg', 250000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 03', 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 03.jpg', 299000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 04', 'Áo Thun Cổ Tròn Tay Ngắn Biểu Tượng Dáng Vừa BST Thiết Kế ONE PIECE 04.jpg', 349000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Cá Sấu Biểu Tượng Dáng Vừa Đơn Giản No Style 1', 'Áo Thun Cổ Tròn Tay Ngắn Cá Sấu Biểu Tượng Dáng Vừa Đơn Giản No Style 1.jpg', 210000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Cá Sấu Biểu Tượng Dáng Vừa Đơn Giản No Style 2', 'Áo Thun Cổ Tròn Tay Ngắn Cá Sấu Biểu Tượng Dáng Vừa Đơn Giản No Style 2.jpg', 210000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Cá Sấu Biểu Tượng Dáng Vừa Đơn Giản No Style 3', 'Áo Thun Cổ Tròn Tay Ngắn Cá Sấu Biểu Tượng Dáng Vừa Đơn Giản No Style 3.jpg', 210000,1),
(2, 'Áo Thun Cổ Tròn Tay Ngắn Seventy Seven 04 Trắng', 'Áo Thun Cổ Tròn Tay Ngắn Seventy Seven 04 Trắng.jpg', 199000,1),
-- Áo Polo
(3, 'Áo Polo Cổ Bẻ Tay Ngắn Cá Sấu 4 Chiều Thoáng Mát Trơn Dáng Vừa Đơn Giản Gu Tối Giản M4', 'Áo Polo Cổ Bẻ Tay Ngắn Cá Sấu 4 Chiều Thoáng Mát Trơn Dáng Vừa Đơn Giản Gu Tối Giản M4.jpg', 290000,1),
(3, 'Áo Polo Cổ Bẻ Tay Ngắn Sợi Nhân Tạo Thoáng Mát Trơn Dáng Vừa Đơn Giản Gu Tối Giản M18', 'Áo Polo Cổ Bẻ Tay Ngắn Sợi Nhân Tạo Thoáng Mát Trơn Dáng Vừa Đơn Giản Gu Tối Giản M18.jpg', 319000,1),
(3, 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút Biểu Tượng Dáng Rộng Đơn Giản Khepri Ver3', 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút Biểu Tượng Dáng Rộng Đơn Giản Khepri Ver3.jpg', 219000,1),
(3, 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút Biểu Tượng Dáng Rộng Đơn Giản Space Ver19', 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút Biểu Tượng Dáng Rộng Đơn Giản Space Ver19.jpg', 229000,1),
(3, 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút Trơn Dáng Vừa Đơn Giản Gu Tối Giản M15', 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút Trơn Dáng Vừa Đơn Giản Gu Tối Giản M15.jpg', 190000,1),
-- Quần dài
(4, 'Quần Dài Lưng Thun Ống Ôm Vải Thun Co Giãn Trơn Dáng Vừa Đơn Giản Y2010 Originals Ver9', 'Quần Dài Lưng Thun Ống Ôm Vải Thun Co Giãn Trơn Dáng Vừa Đơn Giản Y2010 Originals Ver9.jpg', 400000,1),
(4, 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Cấp Độ 2 Trơn Dáng Vừa Đơn Giản Gu Tối Giản B39', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Cấp Độ 2 Trơn Dáng Vừa Đơn Giản Gu Tối Giản B39.jpg', 379000,1),
(4, 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Trung Bình Trơn Dáng Vừa Đơn Giản Y2010 Originals B36', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Trung Bình Trơn Dáng Vừa Đơn Giản Y2010 Originals B36.jpg', 419000,1),
(4, 'Quần Tây Sợi Tự Nhiên Co Giãn Cấp Độ 2 Trơn Dáng Vừa Đơn Giản Gu Tối Giản HG11', 'Quần Tây Sợi Tự Nhiên Co Giãn Cấp Độ 2 Trơn Dáng Vừa Đơn Giản Gu Tối Giản HG11.jpg', 350000,1),
-- Quần Short
(5, 'Quần Short Lưng Gài Trên Gối Vải Denim Co Giãn Trơn Dáng Rộng Đơn Giản Y2010 Originals Ver23', 'Quần Short Lưng Gài Trên Gối Vải Denim Co Giãn Trơn Dáng Rộng Đơn Giản Y2010 Originals Ver23.jpg', 270000,1),
(5, 'Quần Short Lưng Thun Dưới Gối Vải Dù Nhanh Khô Biểu Tượng Dáng Vừa Đơn Giản Long Vận Thiên Đô Ver1', 'Quần Short Lưng Thun Dưới Gối Vải Dù Nhanh Khô Biểu Tượng Dáng Vừa Đơn Giản Long Vận Thiên Đô Ver1.jpg', 380000,1),
(5, 'Quần Short Lưng Thun Dưới Gối Vải Thun Thoáng Mát Trơn Dáng Vừa Đơn Giản Y2010 Originals Ver33', 'Quần Short Lưng Thun Dưới Gối Vải Thun Thoáng Mát Trơn Dáng Vừa Đơn Giản Y2010 Originals Ver33.jpg', 400000,1);


-- Table danhmuc
insert into  `danhmuc` (`tendanhmuc`,`trangthai`) values
('Áo Khoác',1),
('Áo Thun',1),
('Áo Polo',1),
('Quần Dài',1),
('Quần Short',1);

-- Table nguoidung
INSERT INTO `nguoidung` (`tendangnhap`, `matkhau`, `loaiquyen`) VALUES
('nd1', 'e10adc3949ba59abbe56e057f20f883e', 'khach'),
('admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin');
    
-- Thiết lập khóa ngoại
ALTER TABLE `datmon`
  ADD CONSTRAINT `fk_datmon_nguoidung` FOREIGN KEY (`idnguoidung`) REFERENCES `nguoidung` (`id`),
  ADD CONSTRAINT `fk_datmon_monan` FOREIGN KEY (`idmonan`) REFERENCES `monan` (`id`);
COMMIT;
ALTER TABLE `monan`
  ADD CONSTRAINT `fk_monan_danhmuc` FOREIGN KEY (`iddanhmuc`) REFERENCES `danhmuc` (`id`);
Commit;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2025 at 11:51 AM
-- Server version: 8.0.42-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medingen`
--

-- --------------------------------------------------------

--
-- Table structure for table `description`
--

CREATE TABLE `description` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `section` varchar(100) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `description`
--

INSERT INTO `description` (`id`, `product_id`, `section`, `content`) VALUES
(1, 1, 'About', 'Paracetamol is a pain reliever and a fever reducer.'),
(2, 1, 'How it Works', 'It works by inhibiting prostaglandin synthesis in the brain.');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `image_url`) VALUES
(1, 'Paracetamol', 25.5, 'https://example.com/images/paracetamol.png'),
(2, 'Ibuprofen', 45, 'https://example.com/images/ibuprofen.png'),
(3, 'Paracetamol', 25.5, 'https://example.com/images/paracetamol.png'),
(4, 'Ibuprofen', 45, 'https://example.com/images/ibuprofen.png'),
(5, 'Paracetamol', 25.5, 'https://example.com/images/paracetamol.png'),
(6, 'Ibuprofen', 45, 'https://example.com/images/ibuprofen.png'),
(7, 'Paracetamol', 25.5, 'https://example.com/images/paracetamol.png'),
(8, 'Ibuprofen', 45, 'https://example.com/images/ibuprofen.png'),
(9, 'Paracetamol', 25.5, 'https://example.com/images/paracetamol.png'),
(10, 'Ibuprofen', 45, 'https://example.com/images/ibuprofen.png');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` float DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `product_id`, `rating`, `text`) VALUES
(1, 1, 4.5, 'Effective for mild fever and headaches.'),
(2, 2, 4, 'Good pain relief but may upset stomach.');

-- --------------------------------------------------------

--
-- Table structure for table `salt_content`
--

CREATE TABLE `salt_content` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `salt_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salt_content`
--

INSERT INTO `salt_content` (`id`, `product_id`, `salt_name`) VALUES
(1, 1, 'Paracetamol'),
(2, 2, 'Ibuprofen'),
(3, 1, 'Paracetamol'),
(4, 2, 'Ibuprofen');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(7, 'gopi', 'pbkdf2:sha256:600000$w3v9Qw...$...'),
(8, 'maria', '12345'),
(9, 'gopinath', 'scrypt:32768:8:1$Lfknf1DL976HvpZ5$de9228856e458d233980e7ec138e73034c486e3244e0040c0b4c41e5e19045c4eb9609e67850b917002e978b0e59f8fc8c2ba03751ae55a2058a2ee68e2c4fc3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `salt_content`
--
ALTER TABLE `salt_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `description`
--
ALTER TABLE `description`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salt_content`
--
ALTER TABLE `salt_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `description_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `salt_content`
--
ALTER TABLE `salt_content`
  ADD CONSTRAINT `salt_content_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 03:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seatselect`
--

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `adminname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL,
  `age` int(11) NOT NULL,
  `cnic` varchar(255) NOT NULL,
  `phoneno` varchar(12) NOT NULL,
  `adminid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`adminname`, `email`, `password`, `age`, `cnic`, `phoneno`, `adminid`) VALUES
('rohail', 'rohail1@gmail.com', 'roni7777', 28, '36603-6374988-8', '0320-4300737', 1),
('zj', 'zj@gmail.com', 'meow1111', 21, '35555-5555555-5', '0333-3333333', 4);

--
-- Triggers `admininfo`
--
DELIMITER $$
CREATE TRIGGER `agetrigger` BEFORE INSERT ON `admininfo` FOR EACH ROW BEGIN
    IF NEW.age <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Age must be greater than 0';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cnictrigger` BEFORE INSERT ON `admininfo` FOR EACH ROW BEGIN
    DECLARE cnic_prefix CHAR(5);
    DECLARE cnic_suffix CHAR(7);
    SET cnic_prefix = SUBSTRING(NEW.cnic, 1, 5);
    SET cnic_suffix = SUBSTRING(NEW.cnic, 7, 7);
    IF LENGTH(NEW.cnic) != 15 OR SUBSTRING(NEW.cnic, 6, 1) != '-' OR SUBSTRING(NEW.cnic, 14, 1) != '-' OR SUBSTRING(NEW.cnic, 15, 1) NOT IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') OR cnic_prefix NOT REGEXP '^[0-9]+$' OR cnic_suffix NOT REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid CNIC number';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `passwordtrigger` BEFORE INSERT ON `admininfo` FOR EACH ROW BEGIN
    IF LENGTH(NEW.password) < 8 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Password must have at least 8 characters';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `phonetrigger` BEFORE INSERT ON `admininfo` FOR EACH ROW BEGIN
    DECLARE phone_prefix CHAR(4);
    DECLARE phone_suffix CHAR(7);
    SET phone_prefix = SUBSTRING(NEW.phoneno, 1, 4);
    SET phone_suffix = SUBSTRING(NEW.phoneno, 6, 7);
    IF LENGTH(NEW.phoneno) != 12 OR SUBSTRING(NEW.phoneno, 5, 1) != '-' OR phone_prefix NOT REGEXP '^[0-9]+$' OR phone_suffix NOT REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid phone number';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blocked`
--

CREATE TABLE `blocked` (
  `blocked_userid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `showtime_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `Ticket_type` varchar(50) DEFAULT NULL,
  `Ticket_cost` int(11) DEFAULT NULL,
  `Tickets_available` int(11) DEFAULT NULL,
  `Tickets_sold` int(11) DEFAULT NULL,
  `Ticket_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `showtime_id`, `user_id`, `seat_number`, `booking_date`, `Ticket_type`, `Ticket_cost`, `Tickets_available`, `Tickets_sold`, `Ticket_status`) VALUES
(12345, 1, 20, 3, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12346, 1, 20, 10, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12347, 1, 20, 4, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12345, 1, 20, 3, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12346, 1, 20, 10, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12347, 1, 20, 4, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12345, 1, 20, 3, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12346, 1, 20, 10, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12347, 1, 20, 4, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12345, 1, 20, 3, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12346, 1, 20, 10, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12347, 1, 20, 4, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12345, 1, 20, 3, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12346, 1, 20, 10, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12347, 1, 20, 4, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12345, 1, 20, 3, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12346, 1, 20, 10, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid'),
(12347, 1, 20, 4, '2023-04-29', 'Premium', 3000, 200, 500, 'Valid');

-- --------------------------------------------------------

--
-- Table structure for table `booking_payment`
--

CREATE TABLE `booking_payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booksite`
--

CREATE TABLE `booksite` (
  `Ticket_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Movie_id` int(11) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Day` date NOT NULL,
  `Time` time NOT NULL,
  `paymentmethod` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cinepoints`
--

CREATE TABLE `cinepoints` (
  `user_id` int(11) NOT NULL,
  `cinepoints` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cinepoints`
--

INSERT INTO `cinepoints` (`user_id`, `cinepoints`) VALUES
(1, 999999),
(2, 944999),
(3, 0),
(1, 999999),
(2, 944999),
(1, 999999),
(2, 944999),
(3, 0),
(1, 999999),
(2, 944999),
(1, 999999),
(2, 944999),
(3, 0),
(1, 999999),
(2, 944999),
(4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comingsoon`
--

CREATE TABLE `comingsoon` (
  `Movie_iD` int(255) NOT NULL,
  `Movie_Name` varchar(255) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Duration` varchar(255) NOT NULL,
  `Genre` varchar(255) NOT NULL,
  `Showtimes` varchar(255) NOT NULL,
  `AvgRating` varchar(255) NOT NULL,
  `ImageURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comingsoon`
--

INSERT INTO `comingsoon` (`Movie_iD`, `Movie_Name`, `ReleaseDate`, `Duration`, `Genre`, `Showtimes`, `AvgRating`, `ImageURL`) VALUES
(1, 'Cars 2', '2023-05-05', '114', 'racing', '1:30, 4:30, 7:30, 11:30, 2:30', '0', 'cars.jpeg'),
(29, 'One piece Red', '2023-05-05', '122', 'Shounen,Action', '1:30, 4:30, 7:30, 11:30, 2:30', '8', 'img20.webp');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `user_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `reply` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`user_id`, `description`, `complaint_id`, `reply`) VALUES
(2, 'Please fix the Application not working :( >-<', 1, 'Fixed my guy'),
(2, 'Gandi Application :(', 2, 'Im sorry');

-- --------------------------------------------------------

--
-- Table structure for table `giftshop`
--

CREATE TABLE `giftshop` (
  `Giftid` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giftshop`
--

INSERT INTO `giftshop` (`Giftid`, `Name`, `Description`, `Cost`) VALUES
(1, 'Laptop', 'New Dell Macbook pro bruh', 20000),
(2, 'PS5', 'New Sony Playstation Gaming console', 25000),
(3, 'Macbook Pro', 'Apple Macbook pro new model', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `movieadmin`
--

CREATE TABLE `movieadmin` (
  `Movie_iD` int(255) NOT NULL,
  `MovieName` varchar(255) NOT NULL,
  `Genre` varchar(255) DEFAULT NULL,
  `Showtimes` varchar(255) NOT NULL,
  `AvgRating` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movieadmin`
--

INSERT INTO `movieadmin` (`Movie_iD`, `MovieName`, `Genre`, `Showtimes`, `AvgRating`) VALUES
(27, 'Oppenheimer', 'Drama/War', '11:00 AM, 3:00 PM, 7:00 PM,11:00 PM', '9.2'),
(28, 'Interstellar', 'Sci-Fi/Adventure', '11:00 AM, 3:00 PM, 7:00 PM,11:00 PM', '9.5'),
(29, 'Avatar 2:The Way of Water', 'Sci-Fi/Adventure', '1:30, 3:30, 5:30, 7:30', '8.1'),
(30, 'Demon Slayer:To The Swordsmith Village', 'Shounen,Action', '1:00, 4:00, 8:00', '8.1'),
(31, 'One piece Red', 'Shounen,Action', '1:00, 4:00, 8:00', '8.2'),
(40, 'Ant Man and the Wasp', 'Drama/War', '1:30, 4:30, 7:30, 11:30, 2:30', '8');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentdate` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cardnum` varchar(22) NOT NULL,
  `expdate` date NOT NULL,
  `cvc` int(4) NOT NULL,
  `userid` int(11) NOT NULL,
  `paymentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentdate`, `name`, `email`, `cardnum`, `expdate`, `cvc`, `userid`, `paymentid`) VALUES
('2023-04-26', 'rohail', 'rohail@gmail.com', '1234 1234 1234 1234,', '2024-07-01', 123, 1, 1),
('2023-12-10', 'zj', 'zj@gmail.com', '1234567890123456', '2030-12-12', 123, 2, 2),
('2023-12-10', 'zj', 'zj@gmail.com', '1234567890123456', '2030-10-10', 123, 2, 3),
('2023-12-10', 'zj', 'zj@gmail.com', '1234567890123456', '2030-10-10', 123, 2, 4),
('2023-12-10', 'zj', 'zj@gmail.com', '1234567890123456', '2030-10-10', 123, 2, 5),
('2023-12-10', 'zain', 'zain@gmail.com', '1234567890123456', '2030-10-10', 123, 2, 6),
('2023-12-10', 'zain', 'zain@gmail.com', '1234567890123456', '2030-10-10', 123, 2, 7),
('2023-12-10', 'zain', 'abc@abc.com', '1234567890123456', '2030-10-10', 123, 2, 8),
('2023-12-10', 'zain', 'abc@abc.com', '1234567890123456', '2030-10-10', 123, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rateid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `rating` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rateid`, `userid`, `movieid`, `review`, `rating`) VALUES
(1, 2, 29, 'Meow	', 10),
(2, 2, 28, 'Meh', 10),
(3, 2, 28, 'meh	', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `ticket_id` int(11) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `Show_iD` int(11) NOT NULL,
  `tickettype` varchar(50) NOT NULL,
  `ticketprice` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`ticket_id`, `seat_number`, `Show_iD`, `tickettype`, `ticketprice`, `status`, `user_id`) VALUES
(123, 4, 7, 'Premium', 3500, 'Valid', 2),
(124, 9, 7, 'Premium', 3500, 'Valid', 2),
(125, 6, 7, 'Premium', 3500, 'Valid', 2),
(126, 8, 7, 'Premium', 3500, 'Valid', 2),
(127, 25, 7, 'Gold', 2000, 'Valid', 2);

-- --------------------------------------------------------

--
-- Table structure for table `screen`
--

CREATE TABLE `screen` (
  `Show_iD` int(11) NOT NULL,
  `Screen_iD` int(11) NOT NULL,
  `Movie_iD` int(11) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `screen`
--

INSERT INTO `screen` (`Show_iD`, `Screen_iD`, `Movie_iD`, `Location`, `Date`, `Time`) VALUES
(1, 1, 28, 'Islamabad', '2023-05-11', '18:45:00'),
(4, 2, 28, 'Karachi', '2023-05-18', '04:30:00'),
(5, 1, 30, 'Lahore', '2023-05-17', '02:30:00'),
(7, 2, 28, 'Lahore', '2023-12-17', '14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `screenexist`
--

CREATE TABLE `screenexist` (
  `Screen_iD` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `screenexist`
--

INSERT INTO `screenexist` (`Screen_iD`, `Name`, `Location`) VALUES
(1, 'Maximus', 'Lahore'),
(2, 'ROHALA', 'Lahore'),
(4, 'NewCue', 'Islamabad');

-- --------------------------------------------------------

--
-- Table structure for table `trending`
--

CREATE TABLE `trending` (
  `Movie_iD` int(255) NOT NULL,
  `Movie_Name` varchar(255) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Duration` varchar(255) NOT NULL,
  `Genre` varchar(255) NOT NULL,
  `Showtimes` varchar(255) NOT NULL,
  `AvgRating` varchar(255) NOT NULL,
  `ImageURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trending`
--

INSERT INTO `trending` (`Movie_iD`, `Movie_Name`, `ReleaseDate`, `Duration`, `Genre`, `Showtimes`, `AvgRating`, `ImageURL`) VALUES
(27, 'Oppenheimer', '2023-05-05', '145', 'pata nai', '11:00 AM, 3:00 PM, 7:00 PM,11:00 PM', '9.5', 'img19.jpg');

--
-- Triggers `trending`
--
DELIMITER $$
CREATE TRIGGER `prevent_insert` BEFORE INSERT ON `trending` FOR EACH ROW BEGIN
    IF (SELECT COUNT(*) FROM table_name) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot insert more than one record in this table';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `username` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL,
  `confirm_password` varchar(8) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`username`, `password`, `confirm_password`, `email`, `age`, `name`, `phone_no`, `user_id`, `Status`) VALUES
('rohail10', 'roni10', 'roni10', 'rohail@gmail.com', 21, '36603-6375607-6', '0321-1111111', 1, 'unblocked'),
('zjx', 'Meow', 'Meow', 'abc@abc.com', 21, 'zain', '03333333333', 2, 'unblocked'),
('javed115', '123456', '123456', 'gaved@gmail.com', 21, 'javed123', '03244737155', 3, 'unblocked'),
('madoinfinity', 'Bhow', 'Bhow', 'Md@gmail.com', 21, 'mado', '03333333333', 4, 'unblocked');

-- --------------------------------------------------------

--
-- Table structure for table `user_review`
--

CREATE TABLE `user_review` (
  `rating` int(11) NOT NULL,
  `review` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `blocked`
--
ALTER TABLE `blocked`
  ADD PRIMARY KEY (`blocked_userid`),
  ADD KEY `fk_admin` (`adminid`);

--
-- Indexes for table `booksite`
--
ALTER TABLE `booksite`
  ADD PRIMARY KEY (`Ticket_id`),
  ADD KEY `fkuser` (`User_id`);

--
-- Indexes for table `cinepoints`
--
ALTER TABLE `cinepoints`
  ADD KEY `fk0231` (`user_id`);

--
-- Indexes for table `comingsoon`
--
ALTER TABLE `comingsoon`
  ADD PRIMARY KEY (`Movie_iD`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `fk0935` (`user_id`);

--
-- Indexes for table `giftshop`
--
ALTER TABLE `giftshop`
  ADD PRIMARY KEY (`Giftid`);

--
-- Indexes for table `movieadmin`
--
ALTER TABLE `movieadmin`
  ADD PRIMARY KEY (`Movie_iD`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `FK_PAYMENT` (`userid`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rateid`),
  ADD KEY `fk09350` (`movieid`),
  ADD KEY `fk01150` (`userid`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `fk_show` (`Show_iD`),
  ADD KEY `fk_userf` (`user_id`);

--
-- Indexes for table `screen`
--
ALTER TABLE `screen`
  ADD PRIMARY KEY (`Show_iD`),
  ADD KEY `Fk_con` (`Movie_iD`),
  ADD KEY `Fk_ciner` (`Screen_iD`);

--
-- Indexes for table `screenexist`
--
ALTER TABLE `screenexist`
  ADD PRIMARY KEY (`Screen_iD`);

--
-- Indexes for table `trending`
--
ALTER TABLE `trending`
  ADD PRIMARY KEY (`Movie_iD`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_review`
--
ALTER TABLE `user_review`
  ADD PRIMARY KEY (`userid`,`movie_id`),
  ADD KEY `fk_movieid` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admininfo`
--
ALTER TABLE `admininfo`
  MODIFY `adminid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blocked`
--
ALTER TABLE `blocked`
  MODIFY `blocked_userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booksite`
--
ALTER TABLE `booksite`
  MODIFY `Ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `comingsoon`
--
ALTER TABLE `comingsoon`
  MODIFY `Movie_iD` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `giftshop`
--
ALTER TABLE `giftshop`
  MODIFY `Giftid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movieadmin`
--
ALTER TABLE `movieadmin`
  MODIFY `Movie_iD` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rateid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `screen`
--
ALTER TABLE `screen`
  MODIFY `Show_iD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `screenexist`
--
ALTER TABLE `screenexist`
  MODIFY `Screen_iD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocked`
--
ALTER TABLE `blocked`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`adminid`) REFERENCES `admininfo` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`blocked_userid`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booksite`
--
ALTER TABLE `booksite`
  ADD CONSTRAINT `fkuser` FOREIGN KEY (`User_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cinepoints`
--
ALTER TABLE `cinepoints`
  ADD CONSTRAINT `fk0231` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`);

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fk0935` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_PAYMENT` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`user_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk01150` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk09350` FOREIGN KEY (`movieid`) REFERENCES `movieadmin` (`Movie_iD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_show` FOREIGN KEY (`Show_iD`) REFERENCES `screen` (`Show_iD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userf` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `screen`
--
ALTER TABLE `screen`
  ADD CONSTRAINT `Fk_ciner` FOREIGN KEY (`Screen_iD`) REFERENCES `screenexist` (`Screen_iD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_con` FOREIGN KEY (`Movie_iD`) REFERENCES `movieadmin` (`Movie_iD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trending`
--
ALTER TABLE `trending`
  ADD CONSTRAINT `Fk_constraint1` FOREIGN KEY (`Movie_iD`) REFERENCES `movieadmin` (`Movie_iD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_review`
--
ALTER TABLE `user_review`
  ADD CONSTRAINT `fk_movieid` FOREIGN KEY (`movie_id`) REFERENCES `movieadmin` (`Movie_iD`),
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

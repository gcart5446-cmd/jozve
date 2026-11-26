-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 26, 2026 at 11:37 PM
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
-- Database: `poay`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddStudent` (IN `p_FirstName` VARCHAR(50), IN `p_LastName` VARCHAR(50), IN `p_Gender` VARCHAR(10), IN `p_Age` INT, IN `p_City` VARCHAR(50))   BEGIN
    INSERT INTO Students(
        FirstName, LastName, Gender, Age, City)
    VALUES(
        p_FirstName,
        p_LastName,
        p_Gender,
        p_Age,
        p_City
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddStudentWithValidation` (IN `p_FirstName` VARCHAR(50), IN `p_LastName` VARCHAR(50), IN `p_Gender` VARCHAR(10), IN `p_Age` INT, IN `p_City` VARCHAR(50))   BEGIN
    IF p_Age < 18 THEN
        SELECT 'Invalid Age' AS Message;
    ELSE
        INSERT INTO Students ( FirstName, LastName, Gender, Age, City)
        VALUES
        (
            p_FirstName,
            p_LastName,
            p_Gender,
            p_Age,
            p_City );
        SELECT 'Student Added Successfully' AS Message;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CountStudents` (OUT `p_Total` INT)   BEGIN
    SELECT COUNT(*)
    INTO p_Total
    FROM Students;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DoubleNumber` (INOUT `p_Number` INT)   BEGIN
    SET p_Number = p_Number * 2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentByID` (IN `p_StudentID` INT)   BEGIN
    SELECT *
    FROM Students
    WHERE StudentID = p_StudentID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Courses`
--

CREATE TABLE `Courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `Units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Courses`
--

INSERT INTO `Courses` (`CourseID`, `CourseName`, `Units`) VALUES
(1, 'Database', 3),
(2, 'Programming', 4),
(3, 'Artificial Intelligence', 3),
(4, 'Computer Networks', 3),
(5, 'Operating Systems', 3),
(6, 'Web Design', 2),
(7, 'Data Structures', 3),
(8, 'Software Engineering', 3),
(9, 'Mathematics', 2),
(10, 'Machine Learning', 3);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `EmployeeName` varchar(100) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `EmployeeName`, `ManagerID`) VALUES
(1, 'مدیر دانشگاه', NULL),
(2, 'مدیر آموزش', 1),
(3, 'مدیر مالی', 1),
(4, 'کارشناس ثبت نام', 2),
(5, 'کارشناس امتحانات', 2),
(6, 'کارشناس حسابداری', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Enrollments`
--

CREATE TABLE `Enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Enrollments`
--

INSERT INTO `Enrollments` (`EnrollmentID`, `StudentID`, `CourseID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 6),
(6, 3, 2),
(7, 3, 3),
(8, 3, 4),
(9, 4, 1),
(10, 4, 5),
(11, 5, 2),
(12, 5, 7),
(13, 6, 3),
(14, 6, 6),
(15, 7, 4),
(16, 7, 8),
(17, 8, 5),
(18, 8, 9),
(19, 9, 7),
(20, 10, 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `StudentBasicInfo`
-- (See below for the actual view)
--
CREATE TABLE `StudentBasicInfo` (
`StudentID` int(11)
,`FirstName` varchar(20)
,`LastName` varchar(20)
,`City` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `StudentCourseView`
-- (See below for the actual view)
--
CREATE TABLE `StudentCourseView` (
`StudentID` int(11)
,`FirstName` varchar(20)
,`LastName` varchar(20)
,`CourseName` varchar(100)
,`Units` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE `Students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Age` int(11) NOT NULL,
  `City` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`StudentID`, `FirstName`, `LastName`, `Gender`, `Age`, `City`) VALUES
(1, 'کوروش', 'محمدی', 'Male', 22, 'Shiraz'),
(2, 'سارا', 'احمدی', 'Female', 19, 'Shiraz'),
(3, 'رضا', 'کریمی', 'Male', 25, 'Tehran'),
(4, 'مینا', 'حسینی', 'Female', 21, 'Tabriz'),
(5, 'محمد', 'رضایی', 'Male', 23, 'Isfahan'),
(6, 'نگار', 'اکبری', 'Female', 20, 'Tehran'),
(7, 'امیر', 'جعفری', 'Male', 24, 'Shiraz'),
(8, 'زهرا', 'موسوی', 'Female', 18, 'Mashhad'),
(9, 'حسین', 'صادقی', 'Male', 26, 'Isfahan'),
(10, 'فاطمه', 'نوری', 'Female', 22, 'Tabriz'),
(11, 'Ali', 'Ahmadi', 'Male', 22, 'Tehran');

-- --------------------------------------------------------

--
-- Stand-in structure for view `StudentUnitsReport`
-- (See below for the actual view)
--
CREATE TABLE `StudentUnitsReport` (
`FirstName` varchar(20)
,`units` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `StudentBasicInfo`
--
DROP TABLE IF EXISTS `StudentBasicInfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `StudentBasicInfo`  AS SELECT `Students`.`StudentID` AS `StudentID`, `Students`.`FirstName` AS `FirstName`, `Students`.`LastName` AS `LastName`, `Students`.`City` AS `City` FROM `Students` ;

-- --------------------------------------------------------

--
-- Structure for view `StudentCourseView`
--
DROP TABLE IF EXISTS `StudentCourseView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `StudentCourseView`  AS SELECT `s`.`StudentID` AS `StudentID`, `s`.`FirstName` AS `FirstName`, `s`.`LastName` AS `LastName`, `c`.`CourseName` AS `CourseName`, `c`.`Units` AS `Units` FROM ((`Students` `s` join `Enrollments` `e` on(`s`.`StudentID` = `e`.`StudentID`)) join `Courses` `c` on(`e`.`CourseID` = `c`.`CourseID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `StudentUnitsReport`
--
DROP TABLE IF EXISTS `StudentUnitsReport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `StudentUnitsReport`  AS SELECT `Students`.`FirstName` AS `FirstName`, sum(`Courses`.`Units`) AS `units` FROM ((`Enrollments` join `Students` on(`Enrollments`.`StudentID` = `Students`.`StudentID`)) join `Courses` on(`Enrollments`.`CourseID` = `Courses`.`CourseID`)) GROUP BY `Students`.`FirstName` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `ManagerID` (`ManagerID`);

--
-- Indexes for table `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`StudentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Enrollments`
--
ALTER TABLE `Enrollments`
  MODIFY `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Students`
--
ALTER TABLE `Students`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`ManagerID`) REFERENCES `employees` (`EmployeeID`);

--
-- Constraints for table `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD CONSTRAINT `Enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`),
  ADD CONSTRAINT `Enrollments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

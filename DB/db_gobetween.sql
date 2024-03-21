-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2024 at 01:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gobetween`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(50) DEFAULT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'admin@gmail.com', 'Admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(3, 'Corporate'),
(4, 'Personal'),
(5, 'Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `company_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_contact` varchar(50) NOT NULL,
  `company_email` varchar(50) NOT NULL,
  `company_address` varchar(50) NOT NULL,
  `company_doj` varchar(50) NOT NULL,
  `company_since` varchar(50) NOT NULL,
  `company_proof` varchar(50) NOT NULL,
  `company_logo` varchar(50) NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `owner_email` varchar(50) NOT NULL,
  `owner_contact` varchar(50) NOT NULL,
  `owner_password` varchar(50) NOT NULL,
  `company_status` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`company_id`, `company_name`, `company_contact`, `company_email`, `company_address`, `company_doj`, `company_since`, `company_proof`, `company_logo`, `location_id`, `owner_name`, `owner_email`, `owner_contact`, `owner_password`, `company_status`) VALUES
(8, 'Global Share', '9783456713', 'globalshare@gmail.com', 'KKP Building 2nd street Gandhinagar', '2024-03-19', '1998-12-25', 'proof_1816.jpg', 'logo_1690.jpg', 9, 'Rakesh Nair', 'rakesh@gmail.com', '8756433214', 'Global@123', 1),
(9, 'Delivery.co', '9783456713', 'deliveryco@gmail.com', 'RKP Road 3rd Building ', '2024-03-19', '1995-08-15', 'proof_1016.jpg', 'logo_1881.png', 10, 'Akhilesh P', 'akhilesh@gmail.com', '8756433214', 'Deliveryco@123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_driver`
--

CREATE TABLE `tbl_company_driver` (
  `company_driver_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `company_driver_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `company_driver_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_company_driver`
--

INSERT INTO `tbl_company_driver` (`company_driver_id`, `company_id`, `driver_id`, `company_driver_status`, `company_driver_date`) VALUES
(9, 8, 9, 0, '2024-03-19'),
(10, 8, 10, 0, '2024-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(10) UNSIGNED NOT NULL,
  `complaint_content` varchar(50) NOT NULL,
  `complainttype_id` int(10) UNSIGNED NOT NULL,
  `complaint_date` varchar(50) NOT NULL,
  `complaint_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `complaint_reply` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `driver_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `complaint_reply_date` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint_content`, `complainttype_id`, `complaint_date`, `complaint_status`, `complaint_reply`, `user_id`, `company_id`, `driver_id`, `complaint_reply_date`) VALUES
(10, 'bad behavior ', 16, '2024-03-19', 1, 'sorry for the inconvenience', 5, 0, 0, '2024-03-19'),
(11, 'The parcel was damaged', 7, '2024-03-19', 0, '0', 5, 0, 0, '0'),
(12, 'delivery not at time', 10, '2024-03-19', 0, '0', 5, 0, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complainttype`
--

CREATE TABLE `tbl_complainttype` (
  `complainttype_id` int(10) UNSIGNED NOT NULL,
  `complainttype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_complainttype`
--

INSERT INTO `tbl_complainttype` (`complainttype_id`, `complainttype_name`) VALUES
(7, 'Damaged or incorrect items'),
(8, 'Missing or incomplete orders'),
(9, 'Poor customer service'),
(10, 'Long wait times'),
(11, 'Automated phone loops'),
(12, 'Unsupportive agents'),
(13, 'Service Related'),
(14, 'Company Related'),
(15, 'User Related'),
(16, 'Driver related');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`, `state_id`) VALUES
(19, 'Thiruvanathapuram', 22),
(20, 'Kollam', 22),
(21, 'Alappuzha', 22),
(22, 'Pathanamthitta', 22),
(23, 'Kottayam', 22),
(24, 'Idukki', 22),
(25, 'Eranakulam', 22),
(26, 'Thrissur', 22),
(27, 'Palakkad', 22),
(28, 'Malappuram', 22),
(29, 'Kozhikode', 22),
(30, 'Wayanad', 22),
(31, 'Kannur', 22),
(32, 'Kasaragod', 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver`
--

CREATE TABLE `tbl_driver` (
  `driver_id` int(10) UNSIGNED NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `driver_primary_contact` varchar(50) NOT NULL,
  `driver_secondary_contact` varchar(50) NOT NULL,
  `driver_email` varchar(50) NOT NULL,
  `driver_proof` varchar(50) NOT NULL,
  `driver_photo` varchar(50) NOT NULL,
  `driver_dob` varchar(50) NOT NULL,
  `driver_doj` varchar(50) NOT NULL,
  `driver_password` varchar(50) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_expirence` varchar(50) NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `driver_status` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_driver`
--

INSERT INTO `tbl_driver` (`driver_id`, `driver_name`, `driver_primary_contact`, `driver_secondary_contact`, `driver_email`, `driver_proof`, `driver_photo`, `driver_dob`, `driver_doj`, `driver_password`, `driver_address`, `driver_expirence`, `location_id`, `driver_status`) VALUES
(9, 'Krishna S', '8756096734', '9056872358', 'krishna@gmail.com', 'proof_1309.jpg', 'photo_1769.jpg', '1999-04-23', '2024-03-19', 'Krishna@123', 'thekkedathu', '2years at an export company as driver', 9, 1),
(10, 'Ramesh P', '8756096734', '9056872358', 'ramesh@gmail.com', 'proof_1568.jpg', 'photo_1843.jpg', '2000-09-16', '2024-03-19', 'Ramesh@123', 'thazhathe', '2years at an export company as assistant driver', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_license`
--

CREATE TABLE `tbl_driver_license` (
  `driver_license_front_photo` varchar(50) NOT NULL,
  `driver_license_back_photo` varchar(50) NOT NULL,
  `driver_license_date` varchar(50) NOT NULL,
  `driver_license_exp_date` varchar(50) NOT NULL,
  `driver_license_badge_exp_date` varchar(50) NOT NULL,
  `driver_license_class` varchar(50) NOT NULL,
  `driver_license_number` varchar(50) NOT NULL,
  `driver_license_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_driver_license`
--

INSERT INTO `tbl_driver_license` (`driver_license_front_photo`, `driver_license_back_photo`, `driver_license_date`, `driver_license_exp_date`, `driver_license_badge_exp_date`, `driver_license_class`, `driver_license_number`, `driver_license_id`, `driver_id`) VALUES
('front_1648.jpg', 'back_1702.jpg', '2005-04-21', '2025-04-21', '2010-04-21', 'C1', '12345678900', 13, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_request`
--

CREATE TABLE `tbl_driver_request` (
  `request_id` int(11) NOT NULL,
  `request_date` varchar(50) NOT NULL,
  `request_status` varchar(10) NOT NULL DEFAULT 'Pending',
  `company_id` int(10) NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_driver_request`
--

INSERT INTO `tbl_driver_request` (`request_id`, `request_date`, `request_status`, `company_id`, `driver_id`) VALUES
(17, '2024-03-19', 'Accepted', 8, 9),
(18, '2024-03-19', 'Accepted', 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(10) UNSIGNED NOT NULL,
  `feedback_content` varchar(50) NOT NULL,
  `feedback_date` varchar(50) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `driver_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_content`, `feedback_date`, `user_id`, `company_id`, `driver_id`) VALUES
(1, 'good application ', '2024-03-19', 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `location_longitude` varchar(50) NOT NULL,
  `location_latitude` varchar(50) NOT NULL,
  `location_pincode` varchar(50) NOT NULL,
  `district_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`location_id`, `location_name`, `location_longitude`, `location_latitude`, `location_pincode`, `district_id`) VALUES
(9, 'Chirayinkeezhu', '76.7832° E', '8.6559° N', '695304', 19),
(10, 'Thiruvalla', '76.5750° E', '9.3853° N', '689101', 22),
(11, 'Changanassery', '76.5402° E', '9.4465° N', '686101', 23),
(12, 'Muvattupuzha', '76.5790° E', '9.9894° N', '686661', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `state_id` int(10) UNSIGNED NOT NULL,
  `state_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`state_id`, `state_name`) VALUES
(1, 'Andhra Pradesh'),
(12, 'Arunachal Pradesh'),
(13, 'Assam'),
(14, 'Bihar'),
(15, 'Chhattisgarh'),
(16, 'Goa'),
(17, 'Gujarat'),
(18, 'Haryana'),
(19, 'Himachal Pradesh'),
(20, 'Jharkhand'),
(21, 'Karnataka'),
(22, 'Kerala'),
(23, 'Madhya Pradesh'),
(24, 'Maharashtra'),
(25, 'Manipur'),
(26, 'Meghalaya'),
(27, 'Mizoram'),
(28, 'Nagaland'),
(29, 'Odisha'),
(30, 'Punjab'),
(31, 'Rajasthan'),
(32, 'Sikkim'),
(33, 'Tamil Nadu'),
(34, 'Telangana'),
(35, 'Tripura'),
(36, 'Uttarakhand'),
(37, 'Uttar Pradesh'),
(38, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transport_request`
--

CREATE TABLE `tbl_transport_request` (
  `transport_request_id` int(10) UNSIGNED NOT NULL,
  `transport_request_description` varchar(50) NOT NULL,
  `transport_request_date` varchar(50) NOT NULL,
  `transport_request_qty` varchar(50) NOT NULL,
  `transport_request_for_date` varchar(50) NOT NULL,
  `transport_request_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_location_id` int(10) UNSIGNED NOT NULL,
  `to_location_id` int(10) UNSIGNED NOT NULL,
  `transport_request_reply` varchar(50) NOT NULL DEFAULT 'Pending',
  `company_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `delivery_time` varchar(50) NOT NULL,
  `delivery_date` varchar(50) NOT NULL,
  `transport_request_time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transport_request`
--

INSERT INTO `tbl_transport_request` (`transport_request_id`, `transport_request_description`, `transport_request_date`, `transport_request_qty`, `transport_request_for_date`, `transport_request_status`, `user_id`, `from_location_id`, `to_location_id`, `transport_request_reply`, `company_id`, `category_id`, `delivery_time`, `delivery_date`, `transport_request_time`) VALUES
(16, '100 chairs and tables', '2024-03-19', '100', '2024-03-21', 3, 5, 9, 10, 'Please Contact With us', 8, 3, '10:00', '2024-03-22', '15:23:40'),
(17, '10 boxes of apple', '2024-03-19', '10 box', '2024-03-23', 3, 5, 11, 9, 'Please Contact With us', 8, 4, '12:00', '2024-03-24', '15:44:01'),
(18, '10 boxes of switch and other electrical items', '2024-03-19', '25', '2024-03-25', 3, 5, 10, 9, 'Please Contact With us', 8, 5, '13:00', '2024-03-26', '15:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transport_shedule`
--

CREATE TABLE `tbl_transport_shedule` (
  `transport_shedule_id` int(10) UNSIGNED NOT NULL,
  `transport_shedule_date` varchar(50) NOT NULL,
  `transport_request_id` int(10) UNSIGNED NOT NULL,
  `transport_shedule_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `driver_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `driver_id2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `transport_amount` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transport_shedule`
--

INSERT INTO `tbl_transport_shedule` (`transport_shedule_id`, `transport_shedule_date`, `transport_request_id`, `transport_shedule_status`, `driver_id`, `driver_id2`, `vehicle_id`, `transport_amount`) VALUES
(16, '2024-03-19', 16, 6, 9, 10, 7, 11500),
(17, '2024-03-19', 17, 4, 9, 10, 7, 12500),
(18, '2024-03-19', 18, 0, 0, 0, 7, 11500);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transport_update`
--

CREATE TABLE `tbl_transport_update` (
  `transport_update_id` int(10) UNSIGNED NOT NULL,
  `transport_update_datetime` varchar(50) NOT NULL,
  `transport_update_location` varchar(50) NOT NULL,
  `transport_update_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `transport_shedule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_contact` varchar(50) NOT NULL,
  `user_dob` varchar(50) NOT NULL,
  `user_doj` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_aadhar_number` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `location_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_contact`, `user_dob`, `user_doj`, `user_address`, `user_password`, `user_aadhar_number`, `user_email`, `user_status`, `location_id`) VALUES
(5, 'Raju', '9834657842', '1995-03-30', '2024-03-19', 'vadakkedathu house', 'Raju@123', '18093792781028', 'raju@gmail.com', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicle`
--

CREATE TABLE `tbl_vehicle` (
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `vehicle_chase_no` varchar(50) NOT NULL,
  `vehicle_reg_no` varchar(50) NOT NULL,
  `vehicle_insurance_date` varchar(50) NOT NULL,
  `vehicle_insurance_exp` varchar(50) NOT NULL,
  `vehicle_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehiclesubtype_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `vehicle_detailes` varchar(100) NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `vehicle_amount` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_vehicle`
--

INSERT INTO `tbl_vehicle` (`vehicle_id`, `vehicle_chase_no`, `vehicle_reg_no`, `vehicle_insurance_date`, `vehicle_insurance_exp`, `vehicle_status`, `vehiclesubtype_id`, `company_id`, `vehicle_detailes`, `vehicle_name`, `vehicle_amount`) VALUES
(7, '1234567890', 'Kl03D4576', '2024-03-14', '2025-03-14', 0, 9, 8, 'white color truck with black bumber', 'Kripa', '11500');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehiclesubtype`
--

CREATE TABLE `tbl_vehiclesubtype` (
  `vehiclesubtype_id` int(11) NOT NULL,
  `vehiclesubtype_name` varchar(50) NOT NULL,
  `vehicletype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_vehiclesubtype`
--

INSERT INTO `tbl_vehiclesubtype` (`vehiclesubtype_id`, `vehiclesubtype_name`, `vehicletype_id`) VALUES
(8, 'Isuzu NPR', 6),
(9, 'Ford F-750', 6),
(10, 'Chevrolet Silverado 3500HD', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicletype`
--

CREATE TABLE `tbl_vehicletype` (
  `vehicletype_id` int(10) UNSIGNED NOT NULL,
  `vehicletype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_vehicletype`
--

INSERT INTO `tbl_vehicletype` (`vehicletype_id`, `vehicletype_name`) VALUES
(6, 'Box truck'),
(7, 'Refrigerator truck'),
(8, ' Flatbed Trucks'),
(9, 'Trailer trucks'),
(10, 'Container truck'),
(11, ' Liftgate trucks'),
(12, 'Tank'),
(13, 'Tank Trucks');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `tbl_company_driver`
--
ALTER TABLE `tbl_company_driver`
  ADD PRIMARY KEY (`company_driver_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  ADD PRIMARY KEY (`complainttype_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_driver`
--
ALTER TABLE `tbl_driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `tbl_driver_license`
--
ALTER TABLE `tbl_driver_license`
  ADD PRIMARY KEY (`driver_license_id`);

--
-- Indexes for table `tbl_driver_request`
--
ALTER TABLE `tbl_driver_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `tbl_transport_request`
--
ALTER TABLE `tbl_transport_request`
  ADD PRIMARY KEY (`transport_request_id`);

--
-- Indexes for table `tbl_transport_shedule`
--
ALTER TABLE `tbl_transport_shedule`
  ADD PRIMARY KEY (`transport_shedule_id`);

--
-- Indexes for table `tbl_transport_update`
--
ALTER TABLE `tbl_transport_update`
  ADD PRIMARY KEY (`transport_update_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_vehicle`
--
ALTER TABLE `tbl_vehicle`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `tbl_vehiclesubtype`
--
ALTER TABLE `tbl_vehiclesubtype`
  ADD PRIMARY KEY (`vehiclesubtype_id`);

--
-- Indexes for table `tbl_vehicletype`
--
ALTER TABLE `tbl_vehicletype`
  ADD PRIMARY KEY (`vehicletype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `company_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_company_driver`
--
ALTER TABLE `tbl_company_driver`
  MODIFY `company_driver_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  MODIFY `complainttype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_driver`
--
ALTER TABLE `tbl_driver`
  MODIFY `driver_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_driver_license`
--
ALTER TABLE `tbl_driver_license`
  MODIFY `driver_license_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_driver_request`
--
ALTER TABLE `tbl_driver_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `state_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_transport_request`
--
ALTER TABLE `tbl_transport_request`
  MODIFY `transport_request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_transport_shedule`
--
ALTER TABLE `tbl_transport_shedule`
  MODIFY `transport_shedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_transport_update`
--
ALTER TABLE `tbl_transport_update`
  MODIFY `transport_update_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_vehicle`
--
ALTER TABLE `tbl_vehicle`
  MODIFY `vehicle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_vehiclesubtype`
--
ALTER TABLE `tbl_vehiclesubtype`
  MODIFY `vehiclesubtype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_vehicletype`
--
ALTER TABLE `tbl_vehicletype`
  MODIFY `vehicletype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

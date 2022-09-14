-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 13, 2022 at 07:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs_gap`
--

-- --------------------------------------------------------

--
-- Table structure for table `cs_men`
--

CREATE TABLE `cs_men` (
  `year` int(11) NOT NULL,
  `num_employees_bls` int(11) DEFAULT NULL,
  `num_employees_nsf` int(11) DEFAULT NULL,
  `salary_bls` int(11) DEFAULT NULL,
  `salary_nsf` int(11) DEFAULT NULL,
  `num_recent_grad_employees` int(11) DEFAULT NULL,
  `num_recent_grad_nonstem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cs_men`
--

INSERT INTO `cs_men` (`year`, `num_employees_bls`, `num_employees_nsf`, `salary_bls`, `salary_nsf`, `num_recent_grad_employees`, `num_recent_grad_nonstem`) VALUES
(2000, NULL, 1058300, NULL, NULL, NULL, NULL),
(2001, NULL, NULL, NULL, NULL, 41100, 15900),
(2002, 1259000, NULL, 60580, NULL, NULL, NULL),
(2003, 2013000, 1363700, 58760, 74000, 38400, 25500),
(2004, 2037000, NULL, 60060, NULL, NULL, NULL),
(2005, 2164000, NULL, 61048, NULL, NULL, NULL),
(2006, 2178000, 1461000, 64012, 80000, 101400, 35100),
(2007, 2326000, NULL, 67288, NULL, NULL, NULL),
(2008, 2516000, 1354000, 68640, 86000, 69000, 12000),
(2009, 2369000, NULL, 67808, NULL, NULL, NULL),
(2010, 2395000, 1687000, 70148, 84000, 49000, 18000),
(2011, 2509000, NULL, 71188, NULL, NULL, NULL),
(2012, 2544000, NULL, 73528, NULL, NULL, NULL),
(2013, 2693000, 1812000, 75504, 90000, 154000, 33000),
(2014, 2900000, NULL, 74620, NULL, NULL, NULL),
(2015, 3036000, 2148000, 78156, 96000, 214000, 24000),
(2016, 3068000, NULL, 78936, NULL, NULL, NULL),
(2017, 3240000, 2332000, 80704, 100000, 225000, 28000),
(2018, 3571000, NULL, 83408, NULL, NULL, NULL),
(2019, 3668000, 2589000, 86216, 105000, 260000, 53000);

-- --------------------------------------------------------

--
-- Table structure for table `cs_women`
--

CREATE TABLE `cs_women` (
  `year` int(11) NOT NULL,
  `num_employees_bls` int(11) DEFAULT NULL,
  `num_employees_nsf` int(11) DEFAULT NULL,
  `salary_bls` int(11) DEFAULT NULL,
  `salary_nsf` int(11) DEFAULT NULL,
  `num_recent_grad_employees` int(11) DEFAULT NULL,
  `num_recent_grad_nonstem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cs_women`
--

INSERT INTO `cs_women` (`year`, `num_employees_bls`, `num_employees_nsf`, `salary_bls`, `salary_nsf`, `num_recent_grad_employees`, `num_recent_grad_nonstem`) VALUES
(2000, NULL, 426700, NULL, NULL, NULL, NULL),
(2001, NULL, NULL, NULL, NULL, 11600, 8000),
(2002, 549000, NULL, 49140, NULL, NULL, NULL),
(2003, 777000, 519700, 47112, 63000, 13700, 13000),
(2004, 757000, NULL, 50544, NULL, NULL, NULL),
(2005, 760000, NULL, 52364, NULL, NULL, NULL),
(2006, 756000, 502000, 54236, 71000, 29900, 14600),
(2007, 790000, NULL, 54444, NULL, NULL, NULL),
(2008, 828000, 446000, 56576, 79000, 15000, 4000),
(2009, 782000, NULL, 59748, NULL, NULL, NULL),
(2010, 807000, 517000, 59020, 76000, 11000, 7000),
(2011, 787000, NULL, 58552, NULL, NULL, NULL),
(2012, 872000, NULL, 59592, NULL, NULL, NULL),
(2013, 928000, 575000, 61048, 80000, 25000, 17000),
(2014, 979000, NULL, 60580, NULL, NULL, NULL),
(2015, 973000, 698000, 64740, 80000, 34000, 23000),
(2016, 1035000, NULL, 68900, NULL, NULL, NULL),
(2017, 1110000, 796000, 64220, 84000, 53000, 9000),
(2018, 1184000, NULL, 69940, NULL, NULL, NULL),
(2019, 1279000, 820000, 70356, 90000, 77000, 16000);

-- --------------------------------------------------------

--
-- Table structure for table `recent_grad_years`
--

CREATE TABLE `recent_grad_years` (
  `year` int(11) NOT NULL,
  `grad_years` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recent_grad_years`
--

INSERT INTO `recent_grad_years` (`year`, `grad_years`) VALUES
(2001, '1999, 2000'),
(2003, '2001, 2002'),
(2006, '2003, 2004, 2005'),
(2008, '2006, 2007'),
(2010, '2008, 2009'),
(2013, '2008, 2009, 2010, 2011');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `year` int(11) NOT NULL,
  `num_employees_bls_source` varchar(255) DEFAULT NULL,
  `num_employees_nsf_source` varchar(255) DEFAULT NULL,
  `salary_bls_source` varchar(255) DEFAULT NULL,
  `salary_nsf_source` varchar(255) DEFAULT NULL,
  `num_recent_grad_employees_source` varchar(255) DEFAULT NULL,
  `num_recent_grad_nonstem_source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Sources for each column of the main tables';

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`year`, `num_employees_bls_source`, `num_employees_nsf_source`, `salary_bls_source`, `salary_nsf_source`, `num_recent_grad_employees_source`, `num_recent_grad_nonstem_source`) VALUES
(2000, NULL, 'nsf 2004 tabh-1', NULL, NULL, NULL, NULL),
(2001, NULL, NULL, NULL, NULL, 'nsf 2004 tabh-13 & 2004 tabh-14', 'nsf 2004 tabh-13 & 2004 tabh-14'),
(2002, 'https://www.bls.gov/cps/aa2002/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2002/cpsaat39.pdf', NULL, NULL, NULL),
(2003, 'https://www.bls.gov/cps/aa2003/cpsaat39.pdf', 'nsf 2007 tabh-5', 'https://www.bls.gov/cps/aa2003/cpsaat39.pdf', NULL, 'nsf 2007 tabh-13 & 2007 tabh-14', 'nsf 2007 tabh-13 & 2007 tabh-14'),
(2004, 'https://www.bls.gov/cps/aa2004/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2004/cpsaat39.pdf', NULL, NULL, NULL),
(2005, 'https://www.bls.gov/cps/aa2005/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2005/cpsaat39.pdf', NULL, NULL, NULL),
(2006, 'https://www.bls.gov/cps/aa2006/cpsaat39.pdf', 'nsf 2009 tabh-5', 'https://www.bls.gov/cps/aa2006/cpsaat39.pdf', 'nsf 2009 tabh-17', 'nsf 2009 tabh-13 & 2009 tabh-14', 'nsf 2009 tabh-13 & 2009 tabh-14'),
(2007, 'https://www.bls.gov/cps/aa2007/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2007/cpsaat39.pdf', NULL, NULL, NULL),
(2008, 'https://www.bls.gov/cps/aa2008/cpsaat39.pdf', 'nsf 2011 tab9-5', 'https://www.bls.gov/cps/aa2008/cpsaat39.pdf', 'nsf 2011 tab9-16', 'nsf 2011 tab9-13 & 2011 tab9-14', 'nsf 2011 tab9-13 & 2011 tab9-14'),
(2009, 'https://www.bls.gov/cps/aa2009/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2009/cpsaat39.pdf', NULL, NULL, NULL),
(2010, 'https://www.bls.gov/cps/aa2010/cpsaat39.pdf', 'nsf 2013 tab9-5', 'https://www.bls.gov/cps/aa2010/cpsaat39.pdf', 'nsf 2013 tab9-16', 'nsf 2013 tab9-13 & 2013 tab9-14', 'nsf 2013 tab9-13 & 2013 tab9-14'),
(2011, 'https://www.bls.gov/cps/aa2011/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2011/cpsaat39.pdf', NULL, NULL, NULL),
(2012, 'https://www.bls.gov/cps/aa2012/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2012/cpsaat39.pdf', NULL, NULL, NULL),
(2013, 'https://www.bls.gov/cps/aa2013/cpsaat39.pdf', 'nsf 2015 tab9-5', 'https://www.bls.gov/cps/aa2013/cpsaat39.pdf', 'nsf 2015 tab9-16', 'nsf 2015 tab9-13 & 2015 tab9-14', 'nsf 2015 tab9-13 & 2015 tab9-14'),
(2014, 'https://www.bls.gov/cps/aa2014/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2014/cpsaat39.pdf', NULL, NULL, NULL),
(2015, 'https://www.bls.gov/cps/aa2015/cpsaat39.pdf', 'https://www.nsf.gov/statistics/2017/nsf17310/static/data/tab9-5.pdf', 'https://www.bls.gov/cps/aa2015/cpsaat39.pdf', 'https://www.nsf.gov/statistics/2017/nsf17310/static/data/tab9-16.pdf', 'https://www.nsf.gov/statistics/2017/nsf17310/static/data/tab9-13-updated-2019-02.pdf & https://www.nsf.gov/statistics/2017/nsf17310/static/data/tab9-14-updated-2019-02.pdf', 'https://www.nsf.gov/statistics/2017/nsf17310/static/data/tab9-13-updated-2019-02.pdf & https://www.nsf.gov/statistics/2017/nsf17310/static/data/tab9-14-updated-2019-02.pdf'),
(2016, 'https://www.bls.gov/cps/aa2016/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2016/cpsaat39.pdf', NULL, NULL, NULL),
(2017, 'https://www.bls.gov/cps/aa2017/cpsaat39.pdf', 'https://ncses.nsf.gov/pubs/nsf19304/data 9-5', 'https://www.bls.gov/cps/aa2017/cpsaat39.pdf', 'https://ncses.nsf.gov/pubs/nsf19304/data 9-17', 'nsf 2019 tab9-13 & 2019 tab9-14', 'nsf 2019 tab9-13 & 2019 tab9-14'),
(2018, 'https://www.bls.gov/cps/aa2018/cpsaat39.pdf', NULL, 'https://www.bls.gov/cps/aa2018/cpsaat39.pdf', NULL, NULL, NULL),
(2019, 'https://www.bls.gov/cps/aa2019/cpsaat39.pdf', 'https://ncses.nsf.gov/pubs/nsf21321/data-tables 9-5', 'https://www.bls.gov/cps/aa2019/cpsaat39.pdf', 'https://ncses.nsf.gov/pubs/nsf21321/data-tables 9-16', 'https://ncses.nsf.gov/pubs/nsf21321/data-tables 9-13 & 9-14', 'https://ncses.nsf.gov/pubs/nsf21321/data-tables 9-13 & 9-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_men`
--
ALTER TABLE `cs_men`
  ADD PRIMARY KEY (`year`);

--
-- Indexes for table `cs_women`
--
ALTER TABLE `cs_women`
  ADD PRIMARY KEY (`year`);

--
-- Indexes for table `recent_grad_years`
--
ALTER TABLE `recent_grad_years`
  ADD PRIMARY KEY (`year`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`year`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cs_men`
--
ALTER TABLE `cs_men`
  ADD CONSTRAINT `cs_men_ibfk_1` FOREIGN KEY (`year`) REFERENCES `cs_women` (`year`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

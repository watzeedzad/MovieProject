-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2016 at 04:30 AM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `int203_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `Award`
--

CREATE TABLE IF NOT EXISTS `Award` (
  `awardId` int(11) NOT NULL,
  `awardName` varchar(45) NOT NULL,
  `awardType` int(11) NOT NULL,
  PRIMARY KEY (`awardId`),
  KEY `fk_Award_AwardType1_idx` (`awardType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AwardType`
--

CREATE TABLE IF NOT EXISTS `AwardType` (
  `awardTypeId` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`awardTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Director`
--

CREATE TABLE IF NOT EXISTS `Director` (
  `directorId` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`directorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DirectorAward`
--

CREATE TABLE IF NOT EXISTS `DirectorAward` (
  `directorId` int(11) NOT NULL,
  `awardId` int(11) DEFAULT NULL,
  KEY `fk_DirectorAward_Award_idx` (`awardId`),
  KEY `fk_DirectorAward_Director1_idx` (`directorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Movie`
--

CREATE TABLE IF NOT EXISTS `Movie` (
  `movieId` int(11) NOT NULL,
  `movieName` varchar(50) DEFAULT NULL,
  `boxOffice` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `soundtrackId` int(11) NOT NULL,
  `directorId` int(11) NOT NULL,
  `studioId` int(11) NOT NULL,
  `typeMovie` int(11) NOT NULL,
  PRIMARY KEY (`movieId`),
  KEY `fk_Movie_Director1_idx` (`directorId`),
  KEY `fk_Movie_Studio1_idx` (`studioId`),
  KEY `fk_Movie_TypeMovie1_idx` (`typeMovie`),
  KEY `fk_Movie_Soundtrack1_idx` (`soundtrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MovieActor`
--

CREATE TABLE IF NOT EXISTS `MovieActor` (
  `movieId` int(11) NOT NULL,
  `starringId` int(11) NOT NULL,
  `stuntManId` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieId`,`starringId`),
  KEY `fk_MovieActor_Starring1_idx` (`starringId`),
  KEY `fk_MovieActor_StuntMan1_idx` (`stuntManId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MovieAward`
--

CREATE TABLE IF NOT EXISTS `MovieAward` (
  `movieId` int(11) NOT NULL,
  `awardId` int(11) DEFAULT NULL,
  KEY `fk_MovieAward_Movie1_idx` (`movieId`),
  KEY `fk_MovieAward_Award1_idx` (`awardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Soundtrack`
--

CREATE TABLE IF NOT EXISTS `Soundtrack` (
  `soundtrackId` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `genreId` int(11) NOT NULL,
  `composerId` int(11) NOT NULL,
  PRIMARY KEY (`soundtrackId`),
  KEY `fk_Soundtrack_SoundtrackGenre1_idx` (`genreId`),
  KEY `fk_Soundtrack_SoundtrackCompressor1_idx` (`composerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SoundtrackComposer`
--

CREATE TABLE IF NOT EXISTS `SoundtrackComposer` (
  `composerId` int(11) NOT NULL,
  `composerName` varchar(50) NOT NULL,
  PRIMARY KEY (`composerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SoundtrackGenre`
--

CREATE TABLE IF NOT EXISTS `SoundtrackGenre` (
  `genreId` int(11) NOT NULL,
  `genreType` varchar(45) NOT NULL,
  PRIMARY KEY (`genreId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Starring`
--

CREATE TABLE IF NOT EXISTS `Starring` (
  `starringId` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`starringId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `StarringAward`
--

CREATE TABLE IF NOT EXISTS `StarringAward` (
  `starringId` int(11) NOT NULL,
  `awardId` int(11) DEFAULT NULL,
  KEY `fk_StarringAward_Starring1_idx` (`starringId`),
  KEY `fk_StarringAward_Award1_idx` (`awardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Studio`
--

CREATE TABLE IF NOT EXISTS `Studio` (
  `studioId` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studioId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `StuntMan`
--

CREATE TABLE IF NOT EXISTS `StuntMan` (
  `stuntManId` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stuntManId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Trailer`
--

CREATE TABLE IF NOT EXISTS `Trailer` (
  `trailerId` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `movieId` int(11) NOT NULL,
  PRIMARY KEY (`trailerId`),
  KEY `fk_Trailer_Movie1_idx` (`movieId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TypeMovie`
--

CREATE TABLE IF NOT EXISTS `TypeMovie` (
  `typeMovieId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`typeMovieId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Award`
--
ALTER TABLE `Award`
  ADD CONSTRAINT `fk_Award_AwardType1` FOREIGN KEY (`awardType`) REFERENCES `AwardType` (`awardTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DirectorAward`
--
ALTER TABLE `DirectorAward`
  ADD CONSTRAINT `fk_DirectorAward_Award` FOREIGN KEY (`awardId`) REFERENCES `Award` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DirectorAward_Director1` FOREIGN KEY (`directorId`) REFERENCES `Director` (`directorId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Movie`
--
ALTER TABLE `Movie`
  ADD CONSTRAINT `fk_Movie_Director1` FOREIGN KEY (`directorId`) REFERENCES `Director` (`directorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Movie_Studio1` FOREIGN KEY (`studioId`) REFERENCES `Studio` (`studioId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Movie_TypeMovie1` FOREIGN KEY (`typeMovie`) REFERENCES `TypeMovie` (`typeMovieId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Movie_Soundtrack1` FOREIGN KEY (`soundtrackId`) REFERENCES `Soundtrack` (`soundtrackId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MovieActor`
--
ALTER TABLE `MovieActor`
  ADD CONSTRAINT `fk_MovieActor_Movie1` FOREIGN KEY (`movieId`) REFERENCES `Movie` (`movieId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MovieActor_Starring1` FOREIGN KEY (`starringId`) REFERENCES `Starring` (`starringId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MovieActor_StuntMan1` FOREIGN KEY (`stuntManId`) REFERENCES `StuntMan` (`stuntManId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MovieAward`
--
ALTER TABLE `MovieAward`
  ADD CONSTRAINT `fk_MovieAward_Movie1` FOREIGN KEY (`movieId`) REFERENCES `Movie` (`movieId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MovieAward_Award1` FOREIGN KEY (`awardId`) REFERENCES `Award` (`awardId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Soundtrack`
--
ALTER TABLE `Soundtrack`
  ADD CONSTRAINT `fk_Soundtrack_SoundtrackGenre1` FOREIGN KEY (`genreId`) REFERENCES `SoundtrackGenre` (`genreId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Soundtrack_SoundtrackCompressor1` FOREIGN KEY (`composerId`) REFERENCES `SoundtrackComposer` (`composerId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `StarringAward`
--
ALTER TABLE `StarringAward`
  ADD CONSTRAINT `fk_StarringAward_Starring1` FOREIGN KEY (`starringId`) REFERENCES `Starring` (`starringId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_StarringAward_Award1` FOREIGN KEY (`awardId`) REFERENCES `Award` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Trailer`
--
ALTER TABLE `Trailer`
  ADD CONSTRAINT `fk_Trailer_Movie1` FOREIGN KEY (`movieId`) REFERENCES `Movie` (`movieId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

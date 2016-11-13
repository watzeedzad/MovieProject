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

--
-- Dumping data for table `Award`
--

INSERT INTO `Award` (`awardId`, `awardName`, `awardType`) VALUES
(1, 'BestActor2014', 1),
(2, 'BestActor2015', 1),
(3, 'BestActor2016', 1),
(4, 'BestActor2017', 1),
(5, 'BestActress2014', 3),
(6, 'BestActress2015', 3),
(7, 'BestActress2016', 3),
(8, 'BestActress2017', 3),
(9, 'Best Film2014', 14),
(10, 'Best Film2015', 14),
(11, 'Best Film2016', 14),
(12, 'Best Film2017 ', 14),
(13, 'Best Director 2014', 11),
(14, 'Best Director 2015', 11),
(15, 'Best Director 2016', 11),
(16, 'Best Director 2017', 11);

--
-- Dumping data for table `AwardType`
--

INSERT INTO `AwardType` (`awardTypeId`, `type`) VALUES
(1, 'Best Actor in a Leading Role'),
(2, 'Best Actor in a Supporting Role'),
(3, 'Best Actress in a Leading Role'),
(4, 'Best Actress in a Supporting Role'),
(5, 'Best Adapted Screenplay'),
(6, 'Best Animated Feature'),
(7, 'Best Animated Short Film'),
(8, 'Best Art Direction'),
(9, 'Best Cinematography'),
(10, 'Best Costume Design'),
(11, 'Best Director'),
(12, 'Best Documentary Feature'),
(13, 'Best Documentary Short Subject'),
(14, 'Best Film Editing'),
(15, 'Best Foreign Language Film'),
(16, 'Best Makeup'),
(17, 'Best Original Score'),
(18, 'Best Original Screenplay'),
(19, 'Best Sound Editing'),
(20, 'Best Sound Mixing');

--
-- Dumping data for table `Director`
--

INSERT INTO `Director` (`directorId`, `firstname`, `lastname`, `age`, `street`, `state`, `zip`, `city`, `bio`, `dob`, `nationality`, `sex`) VALUES
(1, 'Steven', 'Spielberg', 70, 'I Street', 'Ohio', '12458', 'Cincinnati', 'Undoubtedly one of the most influential film personalities in the history of film, Steven Spielberg is perhaps Hollywood''s best known director and one of the wealthiest filmmakers in the world. Spielberg has countless big-grossing, critically acclaimed credits to his name, as producer, director and writer', '1946-12-18', 'USA', 'Male'),
(2, 'Martin ', 'Scorsese', 74, 'J Street', 'NewYork', '12479', 'Queens', 'Martin Charles Scorsese was born on November 17, 1942 in Queens, New York City, to Catherine Scorsese (n?e Cappa) and Charles Scorsese, who both worked in Manhattan''s garment district, and whose families both came from Palermo, Sicily. He was raised in the neighborhood of Little Italy, which later provided the inspiration for several of his films.', '1942-11-17', 'USA', 'Male'),
(3, 'Ridley', 'Scott ', 79, 'K Street', 'England', '69523', ' South Shields', 'Ridley Scott was born in South Shields, Tyne and Wear (then County Durham) on 30 November 1937. His father was an officer in the Royal Engineers and the family followed him as his career posted him throughout the UK and Europe before they eventually returned to Teesside. Scott wanted to join Army ', NULL, 'United Kingdom', 'Male'),
(4, 'John', 'Woo', 70, 'L Street', 'Guangzhou', '74563', 'Guangzhou', 'Born in southern China, John Woo grew up in Hong Kong, where he began his film career as an assistant director in 1969, working for Shaw Brothers Studios. He directed his first feature in 1973 and has been a prolific director ever since, working in a wide variety of genres before A Better Tomorrow (1986) established his reputation as a master', '1946-09-23', 'China', 'Male'),
(5, 'Christopher', 'Nolan', 46, 'M Street', 'EngLand', '12306', 'London', 'Best known for his cerebral, often nonlinear story-telling, acclaimed writer-director Christopher Nolan was born on July 30, 1970 in London, England. Over the course of 15 years of film-making, Nolan has gone from low-budget independent films to working on some of the biggest blockbusters ever made. At 7 years old, Nolan began making short movies', '1970-07-30', 'United Kingdom', 'Male'),
(6, 'Ryuichi', 'Yagi', 69, 'Z Street', 'Tokyo', '60312', 'Hokkaido', 'Ryuichi Yagi is known for his work on Stand by Me Doraemon (2014), Biohazard Ø (2002) and Clock Tower 3 (2002).', '1947-08-19', 'Japan', 'Male');

--
-- Dumping data for table `DirectorAward`
--

INSERT INTO `DirectorAward` (`directorId`, `awardId`) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, 15);

--
-- Dumping data for table `Movie`
--

INSERT INTO `Movie` (`movieId`, `movieName`, `boxOffice`, `duration`, `rating`, `releaseDate`, `soundtrackId`, `directorId`, `studioId`, `typeMovie`) VALUES
(1, 'The Wolverine?', 5, 2.6, 6.7, '2013-07-26', 7, 1, 1, 2),
(2, 'Logan', 5, 2.3, 7.6, '2017-03-03', 6, 2, 1, 2),
(3, 'Batman v Superman: Dawn of Justice?', 5, 2.31, 6.8, '2016-03-25', 6, 2, 3, 3),
(4, 'Deadpool', 5, 1.48, 8.1, '2016-02-12', 5, 1, 3, 2),
(5, 'Star Wars: The Force Awakens?', 5, 2.18, 8.2, '2015-12-18', 5, 4, 3, 1),
(6, 'Stand by Me Doraemon', 5, 1.35, 7.4, '2014-12-31', 6, 6, 7, 16),
(7, 'Insidious: Chapter 2', 5, 1.46, 6.6, '2013-09-13', 1, 2, 6, 9),
(8, 'Life of Pi ', 5, 2.07, 8, '2012-12-20', 2, 3, 4, 6),
(9, 'Real Steel', 5, 2.07, 7.1, '2011-12-29', 3, 4, 3, 2),
(10, 'Inception', 5, 2.28, 8.8, '2012-07-16', 4, 5, 1, 14);

--
-- Dumping data for table `MovieActor`
--

INSERT INTO `MovieActor` (`movieId`, `starringId`, `stuntManId`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL);

--
-- Dumping data for table `MovieAward`
--

INSERT INTO `MovieAward` (`movieId`, `awardId`) VALUES
(1, NULL),
(2, NULL),
(3, 9),
(4, 10),
(5, 11);

--
-- Dumping data for table `Soundtrack`
--

INSERT INTO `Soundtrack` (`soundtrackId`, `name`, `genreId`, `composerId`) VALUES
(1, 'A song', 1, 1),
(2, 'B song', 6, 2),
(3, 'C song', 7, 2),
(4, 'D song', 8, 2),
(5, 'E song', 5, 3),
(6, 'F song', 7, 5),
(7, 'G song', 4, 4);

--
-- Dumping data for table `SoundtrackComposer`
--

INSERT INTO `SoundtrackComposer` (`composerId`, `composerName`) VALUES
(1, 'Rod Abernethy'),
(2, 'Amanda Abizaid'),
(3, 'J. J. Abrams'),
(4, 'Andr? Abujamra '),
(5, 'Bojan Adami? '),
(6, 'John Adams'),
(7, 'Barry Adamson');

--
-- Dumping data for table `SoundtrackGenre`
--

INSERT INTO `SoundtrackGenre` (`genreId`, `genreType`) VALUES
(1, 'Carnatic'),
(2, 'film score '),
(3, 'classical music composers '),
(4, 'major opera '),
(5, ' acousmatic'),
(6, 'pop'),
(7, 'Jazz'),
(8, 'Rock'),
(9, 'Alternative-Rock'),
(10, 'Ragge');

--
-- Dumping data for table `Starring`
--

INSERT INTO `Starring` (`starringId`, `firstname`, `lastname`, `age`, `street`, `state`, `zip`, `city`, `bio`, `dob`, `nationality`, `sex`) VALUES
(1, 'Hugh', 'Jackman', 48, 'Acacia Hills', 'New South Wales', '15000', 'Sydney', 'Hugh Michael Jackman is an Australian actor, singer, multi-instrumentalist, dancer and producer. Jackman has won international recognition for his roles in major films, notably as superhero, period, and romance characters. He is best known for his long-running role as Wolverine in the X-Men film series', '1968-10-12', 'Australia', 'Male'),
(2, 'James', 'McAvoy', 37, 'Canal Street', 'Scotland', '17568', 'Glasgow', 'McAvoy was born on 21 April 1979 in Glasgow, Scotland, to Elizabeth (n?e Johnstone), a nurse, and James McAvoy senior, a bus driver. He was raised on a housing estate in Drumchapel, Glasgow by his maternal grandparents (James, a butcher, and Mary) after his parents divorced when James was 7. He went to St Thomas Aquinas Secondary in Jordanhill', '1979-04-21', 'United Kingdom', 'Male'),
(3, 'Michael', 'Fassbender', 27, 'A Street', 'England', '12564', 'Bershire', 'Nicholas Hoult was born on December 7, 1989 in Wokingham, Berkshire, England as Nicholas Caradoc Hoult. He is an actor, known for Mad Max: Fury Road (2015), Warm Bodies (2013) and X-Men: Days of Future Past (2014', '1989-12-07', 'United Kingdom', 'Male'),
(4, 'Jennifer', 'Lawrence', 26, 'B Street', 'Kentucky', '20165', 'Louisville', 'Academy Award-winning actress Jennifer Lawrence is best known for playing Katniss Everdeen in The Hunger Games (2012), Tiffany Maxwell in Silver Linings Playbook (2012), and Rosalyn Rosenfeld in American Hustle (2013). Jennifer Shrader Lawrence was born on August 15, 1990 in Louisville, Kentucky, to Karen (Koch), who manages a children''s camp', '1990-08-15', 'USA', 'Female'),
(5, 'Nicholas ', 'Hoult', 39, 'C Street', 'England', '12564', 'Bershire', 'Nicholas Hoult was born on December 7, 1989 in Wokingham, Berkshire, England as Nicholas Caradoc Hoult. He is an actor, known for Mad Max: Fury Road (2015), Warm Bodies (2013) and X-Men: Days of Future Past (2014). ', '1977-04-02', 'United Kingdom', 'Male');

--
-- Dumping data for table `StarringAward`
--

INSERT INTO `StarringAward` (`starringId`, `awardId`) VALUES
(1, 1),
(1, 1),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL);

--
-- Dumping data for table `Studio`
--

INSERT INTO `Studio` (`studioId`, `name`, `street`, `state`, `zip`, `city`) VALUES
(1, 'Warner Bros Studios', 'H Street', 'Ohio', '12369', 'A City'),
(2, '20th Century Fox Studios', 'J Street', 'NewYork', '54639', 'B City'),
(3, 'Walt Disney Studios', 'I Street', 'NewYork', '45987', 'C City'),
(4, 'Universal Studios', 'C Street', 'Miami', '96320', 'D City'),
(5, 'Marvel Studios', 'B Street', 'Chicago', '52360', 'E City'),
(6, 'FilmDistrict', 'R Street', 'NewYork', '96321', 'F City'),
(7, 'Toho', 'P Street', 'Ohio', '49859', 'H City');

--
-- Dumping data for table `StuntMan`
--

INSERT INTO `StuntMan` (`stuntManId`, `firstname`, `lastname`, `age`, `street`, `state`, `zip`, `city`, `bio`, `dob`, `sex`, `nationality`) VALUES
(1, 'Peter', 'O''Toole', 25, 'D street', 'England', '12356', 'Yorkshire', 'A leading man of prodigious talents, Peter O''Toole was raised in Leeds, England, the son of Constance Jane Eliot (Ferguson), a Scottish nurse, and Patrick Joseph O''Toole, an Irish bookie. As a boy, he decided to become a journalist, beginning as a newspaper copy boy. Although he succeeded in becoming a reporter, he discovered the theater ', '1991-08-02', 'Male', 'United Kingdom'),
(2, 'Steve', 'Railsback ', 26, 'E Street', 'Texas', '65984', 'Dallas', 'Noted for his dangerous, chameleon-like portrayals while possessing the scariest-looking pair of eyes in the business, leathery-looking Steve Railsback has mesmerized us over the years with a number of weird, often warped roles both on film and television. While never achieving the degree of stardom deserved, he, like the equally infamous ', '1990-11-16', 'Male', 'USA'),
(3, 'Barbara', 'Hershey', 27, 'F Street', 'Los Angeles', '45632', 'Hollywood', 'Barbara Hershey was born Barbara Lynn Herzstein in Hollywood, California, to Melrose (Moore) and Arnold Nathan Herzstein, a horse racing columnist. Her father, born in Manhattan, was from a Jewish family (from Hungary and Russia), and her mother, originally from Arkansas, had English and Scots-Irish ancestry. Hershey was raised in a small bungalow', '1989-02-05', 'Female', 'USA'),
(4, 'Allen', 'Garfield', 30, 'G Street', 'New Jersey', '45633', 'Newark', 'New Jersey-born Allen Garfield was trained at the Actors Studio in New York City. He had a prolific career on the stage before making his film debut in 1968. His stocky build and nervous, jumpy mannerisms fit well with the weaselly criminals, lecherous villains and corrupt businessmen and politicians he excels in playing', '1986-11-22', 'Male', 'USA'),
(5, 'Alex ', 'Rocco', 31, 'H Street', 'Cambridge', '51233', 'Massachusetts', 'Tough and volatile-looking Italianate character actor Alex Rocco was born in Boston and spent time training with such notable teachers as Leonard Nimoy and Jeff Corey to curb his thick Boston accent. In Hollywood from 1963, he worked as a bartender during the lean years and began his TV career in the late 60s. Slowly, he came to show sly', '1987-02-02', 'Male', 'USA');

--
-- Dumping data for table `Trailer`
--

INSERT INTO `Trailer` (`trailerId`, `link`, `movieId`) VALUES
(1, 'https://www.youtube.com/watch?v=th1NTVIhUQU', 1),
(2, 'https://www.youtube.com/watch?v=ny3hScFgCIQ', 2),
(3, 'https://www.youtube.com/watch?v=0WWzgGyAH6Y', 3),
(4, 'https://www.youtube.com/watch?v=E04mRYAe3T8', 4),
(5, 'https://www.youtube.com/watch?v=sGbxmsDFVnE', 5),
(6, 'https://www.youtube.com/watch?v=rWF0f183tSA', 5);

--
-- Dumping data for table `TypeMovie`
--

INSERT INTO `TypeMovie` (`typeMovieId`, `type`) VALUES
(1, 'Absurdist/surreal/whimsical'),
(2, 'Action'),
(3, 'Adventure'),
(4, 'Comedy'),
(5, 'Crime'),
(6, 'Drama'),
(7, 'Fantasy'),
(8, 'Historical'),
(9, 'Horror'),
(10, 'Magical realism'),
(11, 'Mystery'),
(12, 'Paranoid'),
(13, 'Romance'),
(14, 'Science fiction'),
(15, 'Thriller'),
(16, 'Animation');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

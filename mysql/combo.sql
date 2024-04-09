DROP DATABASE IF EXISTS db3;
CREATE DATABASE db3;
USE db3;

CREATE TABLE `availability` (
  `av_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `av_date` date DEFAULT NULL,
  `av_description` text COLLATE utf8_unicode_ci
) ;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`av_id`, `fk_car_id`, `av_date`, `av_description`) VALUES
(1, 1, '2019-01-01', 'Available'),
(2, 2, '2019-01-01', 'Available'),
(3, 3, '2019-01-01', 'Available'),
(4, 4, '2019-01-01', 'Available'),
(5, 5, '2019-01-01', 'Available'),
(6, 6, '2019-01-01', 'Available'),
(7, 7, '2019-01-01', 'Available'),
(8, 8, '2019-01-01', 'Available'),
(9, 9, '2019-01-01', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(11) NOT NULL,
  `fk_inv_id` int(11) DEFAULT NULL,
  `pick_point` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drop_point` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_date` date DEFAULT NULL,
  `drop_date` date DEFAULT NULL
) ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `fk_inv_id`, `pick_point`, `drop_point`, `pick_date`, `drop_date`) VALUES
(1, NULL, 'Fo utca 8 Budapest ', 'Budai ut 89 Debrecen ', '2019-07-23', '2019-08-06'),
(2, NULL, 'Soproni ut Gyor 12', 'Budai ut 89 Debrecen ', '2019-08-01', '2019-08-13'),
(3, NULL, 'Fo utca 8 Budapest ', 'Gyori ut 98 Sopron', '2019-05-19', '2019-05-28'),
(4, NULL, 'Vamhaz ut 43 Pecs ', 'Gyori ut 98 Sopron', '2019-07-23', '2019-08-13'),
(5, NULL, 'Vamhaz ut 43 Pecs ', 'Budai ut 89 Debrecen ', '2019-07-13', '2019-08-13'),
(6, NULL, 'Gyori ut 98 Sopron', 'Gyori ut 98 Sopron', '2019-05-23', '2019-07-02'),
(7, NULL, 'Soproni ut Gyor 12', 'Petofi ut 46 Siofok ', '2019-06-13', '2018-06-21'),
(8, NULL, 'Fo utca 8 Budapest ', 'Vamhaz ut 43 Pecs ', '2019-08-13', '2019-08-23'),
(9, NULL, 'Soproni ut Gyor 12', 'Budai ut 89 Debrecen ', '2019-07-23', '2019-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `fk_rental_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `fk_model_id` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `fk_book_id`, `fk_rental_id`, `price`, `fk_model_id`) VALUES
(1, 1, 1, 220, 2),
(2, 2, 2, 420, 4),
(3, 3, 3, 130, 7),
(4, 4, 4, 240, 9),
(5, 5, 5, 150, 9),
(6, 6, 6, 150, 6),
(7, 7, 7, 160, 11),
(8, 8, 8, 670, 14),
(9, 9, 9, 180, 16);

-- --------------------------------------------------------

--
-- Table structure for table `car_rental`
--

CREATE TABLE `car_rental` (
  `rental_id` int(11) NOT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `address` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `r_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ;

--
-- Dumping data for table `car_rental`
--

INSERT INTO `car_rental` (`rental_id`, `fk_book_id`, `address`, `city`, `r_email`) VALUES
(1, 1, 'Fo utca 8  ', 'Budapest', 'buda@gmail.com'),
(2, 2, 'Soproni ut  12', 'Gyor', 'gyor@gmail.com'),
(3, 3, 'Fo utca 8  ', 'Budapest', 'buda@gmail.com'),
(4, 4, 'Vamhaz ut 43  ', 'Pecs', 'pecs@gmail.com'),
(5, 5, 'Vamhaz ut 43  ', 'Pecs', 'pecs@gmail.com'),
(6, 6, 'Gyori ut 98', ' Sopron', 'sopron@gmail.com'),
(7, 7, 'Soproni ut  12', 'Gyor', 'gyor@gmail.com'),
(8, 8, 'Fo utca 8  ', 'Budapest', 'buda@gmail.com'),
(9, 9, 'Soproni ut  12', 'Gyor', 'gyor@gmail.com');

DROP DATABASE IF EXISTS db2;
CREATE DATABASE db2;
USE db2;

CREATE TABLE recordLabel(
	label_name VARCHAR (40),
	year_founded YEAR,
	type VARCHAR (20),
	PRIMARY KEY (label_name)
);

CREATE TABLE album(
	title VARCHAR (30),
	group_name VARCHAR (30),
	year_founded YEAR,
	label_name VARCHAR (40),
	PRIMARY KEY (title, group_name),
	FOREIGN KEY (label_name) REFERENCES recordLabel (label_name)
);

CREATE TABLE song(
	title VARCHAR (20),
	year_written YEAR,
	PRIMARY KEY (title)
);

CREATE TABLE musicTrack(
	date_recorded DATE,
	track_name VARCHAR (30),
	PRIMARY KEY (track_name),
	FOREIGN KEY (track_name) REFERENCES song (title)
);

CREATE TABLE musicArtist(
	artist_name VARCHAR (40),
	birth_year YEAR,
	PRIMARY KEY (artist_name)
);

CREATE TABLE musicGroup(
	group_name VARCHAR (30),
	year_formed YEAR,
	PRIMARY KEY (group_name)
);

CREATE TABLE associated(
	genre_type VARCHAR (20),
	music_group VARCHAR (30),
	PRIMARY KEY (genre_type, music_group),
	FOREIGN KEY (music_group) REFERENCES musicGroup (group_name)
);

CREATE TABLE influenced(
	group_influencing VARCHAR (30),
	group_influenced_by VARCHAR (30),
	PRIMARY KEY (group_influencing, group_influenced_by),
	FOREIGN KEY (group_influencing) REFERENCES musicGroup (group_name),
	FOREIGN KEY (group_influenced_by) REFERENCES musicGroup (group_name)
);

CREATE TABLE members(
	member_name VARCHAR (40),
	group_name VARCHAR (30),
	range_start DATE,
	range_end DATE,
	PRIMARY KEY (member_name, group_name),
	FOREIGN KEY (member_name) REFERENCES musicArtist (artist_name),
	FOREIGN KEY (group_name) REFERENCES musicGroup (group_name)
);

CREATE TABLE writtenBy(
	song_name VARCHAR (20),
	artist_name VARCHAR (40),
	PRIMARY KEY (song_name, artist_name),
	FOREIGN KEY (song_name) REFERENCES song (title),
	FOREIGN KEY (artist_name) REFERENCES musicArtist (artist_name)
);

CREATE TABLE producers(
	artist_name VARCHAR (40),
	track_name VARCHAR (30),
	PRIMARY KEY (artist_name, track_name),
	FOREIGN KEY (artist_name) REFERENCES musicArtist (artist_name),
	FOREIGN KEY (track_name) REFERENCES musicTrack (track_name)
);

CREATE TABLE consistsOf(
	album_name VARCHAR (30),
	track_name VARCHAR (30),
	PRIMARY KEY (album_name, track_name),
	FOREIGN KEY (album_name) REFERENCES album (title),
	FOREIGN KEY (track_name) REFERENCES musicTrack (track_name)
);

-- To View Tables: select * from recordLabel;
INSERT INTO recordLabel VALUES
       ("Sony Music Entertainment", 1929, "Various"),
       ("Universal Music Publishing Group", 1934, "Various"),
       ("Warner Music Group", 1958, "Various"),
       ("Island Records", 1959, "Pop/Rock"),
       ("BMG Rights Management", 2008, "Various");

INSERT INTO album VALUES
       ("Error in the System", "Peter Schilling", 1983, "Warner Music Group"),
       ("California", "Blink-182", 2016, "BMG Rights Management"),
       ("Unbreakable", "Janet Jackson", 2015, "BMG Rights Management"),
       ("Burnin", "The Wailers", 1973, "Island Records"),
       ("Legends Never Die", "Juice WRLD", 2020, "Universal Music Publishing Group"),
       ("As I Am", "Alicia Keys", 2007, "Sony Music Entertainment"),
       ("Stankonia", "OutKast", 2000, "Sony Music Entertainment");

INSERT INTO song VALUES
       ("Hello World", 1983),
       ("No More", 2000),
       ("Research", 2005),
       ("Took 2 Long", 1996),
       ("Sorry Mrs Jackson", 2000);

INSERT INTO musicTrack VALUES
       ('1983-9-3', "Hello World"),
       ('2000-10-13', "No More"),
       ('2005-7-24', "Research"),
       ('1996-4-9', "Took 2 Long"),
       ('2000-5-7', "Sorry Mrs Jackson");

INSERT INTO musicArtist VALUES
       ("Kanye West", 1977),
       ("Janet Jackson", 1966),
       ("Andre 3000", 1975),
       ("Big Boi", 1975);

INSERT INTO musicGroup VALUES
       ("OutKast", 1991),
       ("The Wailers", 1963),
       ("Blink-182", 1992);

INSERT INTO associated VALUES
       ("Hip-Hop", "OutKast"),
       ("Punk Rock", "Blink-182"),
       ("Pop-Punk", "Blink-182"),
       ("Reggae", "The Wailers"),
       ("Rocksteady", "The Wailers"),
       ("Ska", "The Wailers");

INSERT INTO influenced VALUES
       ("The Wailers", "OutKast"),
       ("The Wailers", "Blink-182");

INSERT INTO members VALUES
       ("Andre 3000", "OutKast", '1991-4-13', '2006-7-3'),
       ("Big Boi", "OutKast", '1991-4-13', '2006-7-4');
       
INSERT INTO writtenBy VALUES
       ("Sorry Mrs Jackson", "Andre 3000"),
       ("Sorry Mrs Jackson", "Big Boi");

INSERT INTO producers VALUES
       ("Andre 3000", "Sorry Mrs Jackson");

INSERT INTO consistsOf VALUES
       ("Stankonia", "Sorry Mrs Jackson");

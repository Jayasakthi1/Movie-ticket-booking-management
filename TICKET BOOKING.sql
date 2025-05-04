create database ticket_booking;
use ticket_booking;
-- User Table
-- TO CREATE THE USER TABLE --
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Password VARCHAR(100));
select * from Users;

-- TO CREATE THE MOVIE TABLE --
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT, -- in minutes
    Language VARCHAR(50),
    Rating DECIMAL(2,1));
select * from Movies;

-- TO CREATE THE THEATERS TABLE --
CREATE TABLE Theaters (
    TheaterID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100));
    select * from Theaters;

-- TO CREATE THE SCREENS TABLE --
CREATE TABLE Screens (
    ScreenID INT PRIMARY KEY AUTO_INCREMENT,
    TheaterID INT,
    ScreenNumber INT,
    SeatCapacity INT,
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID) ON DELETE CASCADE);
    select * from Screens;
-- TO CREATE THE SEATS TABLE --
CREATE TABLE Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT,
    ScreenID INT,
    SeatNumber VARCHAR(10),
    Type VARCHAR(20),
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID) ON DELETE CASCADE);
    select * from Seats;

-- TO CREATE THE SHOWS TABLE --
CREATE TABLE Shows (
    ShowID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    ScreenID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE,
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID) ON DELETE CASCADE);
    select * from shows;
-- TO CREATE THE BOOKING TABLE --
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ShowID INT,
    BookingTime DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID) ON DELETE CASCADE);
    select * from Bookings;
-- TO CREATE THE BOOKED SEATS --
CREATE TABLE BookedSeats (
    BookedSeatID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    SeatID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE,
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID) ON DELETE CASCADE);
    select * from BookedSeats;
-- TO CREATE THE PAYMENTS TABLE --
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(20),
    PaymentDate DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE);
    select * from Payments;
    drop table payments;
    
    -- TO INSERT THE USER TABLE --
INSERT INTO Users (Name, Email, Phone, Password) VALUES
('Steve Wilson', 'derek41@yahoo.com', '4547883574', 'o@5QNxtbZl'),
('Elizabeth Nguyen', 'karenhoward@martinez.com', '1099099852', '_ogDnU)x7g'),
('Charles Jones', 'sandersjoseph@caldwell-thompson.com', '5598911701', '8FQ7*FHt_b'),
('Mrs. Alyssa Lewis', 'nicholas93@watts.com', '7581292681', '!557fOYz_s'),
('Kathryn Floyd', 'mpatel@gmail.com', '9464279157', 'oTw#6)2&&5'),
('Eric Hanson', 'ruizsean@reilly.com', '3960949259', '8u&BWdf#(q'),
('Thomas Prince', 'nicholas44@yahoo.com', '1163337043', '&xPfZ@swj6'),
('Casey Burns', 'valdezkelly@estes.com', '1872627483', 'Qg#5o)Om%M'),
('Kevin Casey', 'thomas00@gomez.net', '4591661281', '_6BXTfn2Dj'),
('Lisa Bradford', 'josephlopez@hotmail.com', '3882638356', ')0aVauJw#L'),
('Joel Price', 'carrolldebra@wood.com', '2532017217', '6cDOpto0!L'),
('Larry Williams', 'ykennedy@yahoo.com', '3889000987', 'Po*10VTb^W'),
('Steven Lopez', 'jmiranda@harris.org', '0632267094', 'V&B7Gaaj4r'),
('Kenneth Richards', 'morrisjay@rivers.com', '8417532997', 'UBT9SHTg*C'),
('Nicole Valenzuela', 'pamelashort@yahoo.com', '6568262100', '+8zLuMYgeq'),
('Pamela Ashley', 'xhawkins@miles-frazier.com', '5866620792', '(^fl7BOi+N'),
('William Jones', 'cody01@brewer.info', '3184118419', '$7sCdzqxFY'),
('Rachel Griffin', 'danielrodriguez@carter.com', '7278226017', '&&d&w0WsjZ'),
('Jonathon Jackson', 'ujoseph@garcia.com', '7326791335', '!5Kza5l1QB'),
('Terry Lowe', 'coxdawn@thomas.org', '1726190669', '_H0xA76ao_'),
('Jeremy George', 'john83@flores.com', '4397756255', 'oF8H%)Sh#G'),
('Jennifer Stone', 'mary69@smith-nunez.com', '6439341060', '+9l&SQjz$8'),
('Joshua Estes', 'amanda83@gmail.com', '8655403842', 'hwHd1IxjY!'),
('Gabriel Fry', 'paul63@garcia-watson.com', '2872445015', '@+Z#oQAW&9'),
('Julia Myers', 'kimberlysmith@gmail.com', '2669069214', '+*!HqOFa77'),
('Becky Fernandez', 'pwilkerson@mcdaniel-lopez.com', '2935195073', '+2YUW1)6Bp'),
('William Bell', 'michellerichards@harris.net', '7500620951', '0ie10Qxl9*'),
('John Solis', 'michael58@white-anderson.com', '6405673262', '2!e9LKXp@a'),
('Tyler Rojas', 'john61@hotmail.com', '6184832882', '!lT3$Xef6z'),
('Brian Rodriguez', 'tanyamoran@yahoo.com', '0440610870', '0lLe+noh%U');
select * from Users;

  -- TO INSERT THE MOVIES TABLE --   
INSERT INTO Movies (Title, Genre, Duration, Language, Rating) VALUES
('Floor may cold sense.', 'Action', 122, 'Telugu', 2.2),
('True collection learn.', 'Horror', 178, 'Tamil', 4.0),
('People money.', 'Thriller', 114, 'Malayalam', 3.0),
('Good power author.', 'Drama', 122, 'Malayalam', 4.2),
('Maybe up why.', 'Thriller', 139, 'Telugu', 2.8),
('Soldier government artist.', 'Comedy', 174, 'Telugu', 1.6),
('On spring.', 'Drama', 116, 'Tamil', 1.3),
('Item art include.', 'Comedy', 169, 'Telugu', 2.4),
('Group.', 'Drama', 118, 'Telugu', 2.8),
('These bit heart enjoy.', 'Action', 114, 'English', 3.9),
('Yard.', 'Thriller', 137, 'Tamil', 3.8),
('Home ago listen.', 'Action', 157, 'Malayalam', 1.6),
('Institution card.', 'Drama', 130, 'Hindi', 3.4),
('Consider example best.', 'Drama', 161, 'Telugu', 1.4),
('Pay each catch.', 'Thriller', 92, 'Hindi', 1.9),
('Yet.', 'Thriller', 173, 'Malayalam', 4.6),
('Newspaper.', 'Horror', 152, 'Hindi', 2.1),
('Herself response million.', 'Drama', 100, 'Hindi', 1.4),
('Visit course.', 'Action', 170, 'Tamil', 1.5),
('Area sense accept.', 'Comedy', 134, 'Malayalam', 2.3),
('Once political police rich.', 'Action', 124, 'Hindi', 3.9),
('Whatever strong.', 'Horror', 165, 'Hindi', 3.0),
('Lot kind.', 'Action', 149, 'Malayalam', 4.1),
('Born name.', 'Action', 114, 'English', 3.5),
('Exactly citizen.', 'Drama', 128, 'Tamil', 4.4),
('Place carry early.', 'Thriller', 104, 'Malayalam', 4.7),
('Fish say population.', 'Horror', 123, 'English', 2.0),
('Receive her not.', 'Comedy', 131, 'Malayalam', 4.5),
('Lay discussion.', 'Thriller', 151, 'English', 4.9),
('Such evidence.', 'Horror', 165, 'English', 4.9);
select * from Movies;

 -- TO INSERT THE MOVIES TABLE --   
INSERT INTO Theaters (Name, Location) VALUES
('Theater 1', 'Tiffanyfort'),
('Theater 2', 'Lake Leahshire'),
('Theater 3', 'Pricefort'),
('Theater 4', 'West Gabrielle'),
('Theater 5', 'Carterborough'),
('Theater 6', 'Lake Danielleland'),
('Theater 7', 'Davidport'),
('Theater 8', 'Salinasville'),
('Theater 9', 'Reesefurt'),
('Theater 10', 'New Brad'),
('Theater 11', 'Lake Stacychester'),
('Theater 12', 'South Billy'),
('Theater 13', 'West Hollystad'),
('Theater 14', 'Brightton'),
('Theater 15', 'Elizabethland'),
('Theater 16', 'Stephenmouth'),
('Theater 17', 'Ashleyhaven'),
('Theater 18', 'North Briannastad'),
('Theater 19', 'North Paula'),
('Theater 20', 'Port Erinchester'),
('Theater 21', 'North Allenside'),
('Theater 22', 'Smithton'),
('Theater 23', 'Sonyaview'),
('Theater 24', 'Davidshire'),
('Theater 25', 'Davidshire'),
('Theater 26', 'Barbarahaven'),
('Theater 27', 'Navarrobury'),
('Theater 28', 'Matthewville'),
('Theater 29', 'Port Hannah'),
('Theater 30', 'Lake Mauricefurt');
select * from Theaters;

-- TO INSERT THE SCREENS TABLE --
 INSERT INTO Screens (TheaterID, ScreenNumber, SeatCapacity) VALUES
(1, 1, 139),
(2, 3, 66),
(3, 4, 59),
(4, 4, 79),
(5, 1, 143),
(6, 1, 74),
(7, 4, 71),
(8, 4, 77),
(9, 2, 143),
(10, 4, 139),
(11, 5, 105),
(12, 1, 117),
(13, 4, 113),
(14, 5, 106),
(15, 4, 67),
(16, 3, 69),
(17, 4, 144),
(18, 3, 137),
(19, 3, 106),
(20, 3, 56),
(21, 3, 98),
(22, 4, 114),
(23, 3, 113),
(24, 4, 87),
(25, 4, 125),
(26, 5, 90),
(27, 3, 132),
(28, 1, 87),
(29, 2, 50),
(30, 5, 105);
select * from Screens;

-- TO INSERT THE SEAT TABLE --
INSERT INTO Seats (ScreenID, SeatNumber, Type) VALUES
(1, 'S1', 'Premium'),
(1, 'S2', 'Premium'),
(1, 'S3', 'Premium'),
(1, 'S4', 'Regular'),
(1, 'S5', 'Regular'),
(1, 'S6', 'Premium'),
(1, 'S7', 'Regular'),
(1, 'S8', 'Premium'),
(1, 'S9', 'Premium'),
(1, 'S10', 'Regular'),
(2, 'S1', 'Regular'),
(2, 'S2', 'Premium'),
(2, 'S3', 'Premium'),
(2, 'S4', 'Regular'),
(2, 'S5', 'Regular'),
(2, 'S6', 'Regular'),
(2, 'S7', 'Regular'),
(2, 'S8', 'Premium'),
(2, 'S9', 'Premium'),
(2, 'S10', 'Regular'),
(3, 'S1', 'Regular'),
(3, 'S2', 'Regular'),
(3, 'S3', 'Premium'),
(3, 'S4', 'Premium'),
(3, 'S5', 'Regular'),
(3, 'S6', 'Premium'),
(3, 'S7', 'Regular'),
(3, 'S8', 'Regular'),
(3, 'S9', 'Premium'),
(3, 'S10', 'Premium'),
(4, 'S1', 'Regular'),
(4, 'S2', 'Premium'),
(4, 'S3', 'Regular'),
(4, 'S4', 'Premium'),
(4, 'S5', 'Premium'),
(4, 'S6', 'Premium'),
(4, 'S7', 'Regular'),
(4, 'S8', 'Premium'),
(4, 'S9', 'Regular'),
(4, 'S10', 'Regular'),
(5, 'S1', 'Regular'),
(5, 'S2', 'Regular'),
(5, 'S3', 'Regular'),
(5, 'S4', 'Premium'),
(5, 'S5', 'Regular'),
(5, 'S6', 'Premium'),
(5, 'S7', 'Premium'),
(5, 'S8', 'Regular'),
(5, 'S9', 'Premium'),
(5, 'S10', 'Premium'),
(6, 'S1', 'Premium'),
(6, 'S2', 'Premium'),
(6, 'S3', 'Premium'),
(6, 'S4', 'Regular'),
(6, 'S5', 'Regular'),
(6, 'S6', 'Regular'),
(6, 'S7', 'Regular'),
(6, 'S8', 'Regular'),
(6, 'S9', 'Premium'),
(6, 'S10', 'Regular'),
(7, 'S1', 'Premium'),
(7, 'S2', 'Premium'),
(7, 'S3', 'Regular'),
(7, 'S4', 'Premium'),
(7, 'S5', 'Regular'),
(7, 'S6', 'Premium'),
(7, 'S7', 'Premium'),
(7, 'S8', 'Premium'),
(7, 'S9', 'Premium'),
(7, 'S10', 'Premium'),
(8, 'S1', 'Regular'),
(8, 'S2', 'Regular'),
(8, 'S3', 'Regular'),
(8, 'S4', 'Regular'),
(8, 'S5', 'Premium'),
(8, 'S6', 'Premium'),
(8, 'S7', 'Regular'),
(8, 'S8', 'Premium'),
(8, 'S9', 'Premium'),
(8, 'S10', 'Premium'),
(9, 'S1', 'Regular'),
(9, 'S2', 'Premium'),
(9, 'S3', 'Regular'),
(9, 'S4', 'Premium'),
(9, 'S5', 'Premium'),
(9, 'S6', 'Premium'),
(9, 'S7', 'Regular'),
(9, 'S8', 'Regular'),
(9, 'S9', 'Premium'),
(9, 'S10', 'Premium'),
(10, 'S1', 'Premium'),
(10, 'S2', 'Regular'),
(10, 'S3', 'Premium'),
(10, 'S4', 'Regular'),
(10, 'S5', 'Premium'),
(10, 'S6', 'Premium'),
(10, 'S7', 'Regular'),
(10, 'S8', 'Premium'),
(10, 'S9', 'Premium'),
(10, 'S10', 'Premium'),
(11, 'S1', 'Regular'),
(11, 'S2', 'Regular'),
(11, 'S3', 'Regular'),
(11, 'S4', 'Premium'),
(11, 'S5', 'Premium'),
(11, 'S6', 'Premium'),
(11, 'S7', 'Premium'),
(11, 'S8', 'Premium'),
(11, 'S9', 'Regular'),
(11, 'S10', 'Regular'),
(12, 'S1', 'Regular'),
(12, 'S2', 'Premium'),
(12, 'S3', 'Regular'),
(12, 'S4', 'Regular'),
(12, 'S5', 'Premium'),
(12, 'S6', 'Premium'),
(12, 'S7', 'Regular'),
(12, 'S8', 'Premium'),
(12, 'S9', 'Regular'),
(12, 'S10', 'Regular'),
(13, 'S1', 'Regular'),
(13, 'S2', 'Premium'),
(13, 'S3', 'Regular'),
(13, 'S4', 'Premium'),
(13, 'S5', 'Premium'),
(13, 'S6', 'Regular'),
(13, 'S7', 'Regular'),
(13, 'S8', 'Regular'),
(13, 'S9', 'Premium'),
(13, 'S10', 'Regular'),
(14, 'S1', 'Premium'),
(14, 'S2', 'Regular'),
(14, 'S3', 'Premium'),
(14, 'S4', 'Regular'),
(14, 'S5', 'Regular'),
(14, 'S6', 'Premium'),
(14, 'S7', 'Premium'),
(14, 'S8', 'Premium'),
(14, 'S9', 'Premium'),
(14, 'S10', 'Premium'),
(15, 'S1', 'Regular'),
(15, 'S2', 'Premium'),
(15, 'S3', 'Regular'),
(15, 'S4', 'Premium'),
(15, 'S5', 'Premium'),
(15, 'S6', 'Regular'),
(15, 'S7', 'Premium'),
(15, 'S8', 'Regular'),
(15, 'S9', 'Regular'),
(15, 'S10', 'Premium'),
(16, 'S1', 'Premium'),
(16, 'S2', 'Regular'),
(16, 'S3', 'Premium'),
(16, 'S4', 'Regular'),
(16, 'S5', 'Regular'),
(16, 'S6', 'Regular'),
(16, 'S7', 'Premium'),
(16, 'S8', 'Regular'),
(16, 'S9', 'Premium'),
(16, 'S10', 'Regular'),
(17, 'S1', 'Premium'),
(17, 'S2', 'Regular'),
(17, 'S3', 'Premium'),
(17, 'S4', 'Regular'),
(17, 'S5', 'Premium'),
(17, 'S6', 'Regular'),
(17, 'S7', 'Regular'),
(17, 'S8', 'Premium'),
(17, 'S9', 'Premium'),
(17, 'S10', 'Regular'),
(18, 'S1', 'Regular'),
(18, 'S2', 'Premium'),
(18, 'S3', 'Regular'),
(18, 'S4', 'Regular'),
(18, 'S5', 'Regular'),
(18, 'S6', 'Premium'),
(18, 'S7', 'Regular'),
(18, 'S8', 'Premium'),
(18, 'S9', 'Regular'),
(18, 'S10', 'Premium'),
(19, 'S1', 'Premium'),
(19, 'S2', 'Premium'),
(19, 'S3', 'Premium'),
(19, 'S4', 'Premium'),
(19, 'S5', 'Premium'),
(19, 'S6', 'Premium'),
(19, 'S7', 'Regular'),
(19, 'S8', 'Regular'),
(19, 'S9', 'Premium'),
(19, 'S10', 'Regular'),
(20, 'S1', 'Regular'),
(20, 'S2', 'Premium'),
(20, 'S3', 'Premium'),
(20, 'S4', 'Regular'),
(20, 'S5', 'Premium'),
(20, 'S6', 'Regular'),
(20, 'S7', 'Regular'),
(20, 'S8', 'Regular'),
(20, 'S9', 'Regular'),
(20, 'S10', 'Regular'),
(21, 'S1', 'Premium'),
(21, 'S2', 'Premium'),
(21, 'S3', 'Premium'),
(21, 'S4', 'Regular'),
(21, 'S5', 'Premium'),
(21, 'S6', 'Regular'),
(21, 'S7', 'Premium'),
(21, 'S8', 'Premium'),
(21, 'S9', 'Premium'),
(21, 'S10', 'Regular'),
(22, 'S1', 'Premium'),
(22, 'S2', 'Premium'),
(22, 'S3', 'Premium'),
(22, 'S4', 'Regular'),
(22, 'S5', 'Regular'),
(22, 'S6', 'Premium'),
(22, 'S7', 'Premium'),
(22, 'S8', 'Premium'),
(22, 'S9', 'Premium'),
(22, 'S10', 'Premium'),
(23, 'S1', 'Regular'),
(23, 'S2', 'Premium'),
(23, 'S3', 'Regular'),
(23, 'S4', 'Premium'),
(23, 'S5', 'Premium'),
(23, 'S6', 'Premium'),
(23, 'S7', 'Regular'),
(23, 'S8', 'Premium'),
(23, 'S9', 'Premium'),
(23, 'S10', 'Premium'),
(24, 'S1', 'Premium'),
(24, 'S2', 'Regular'),
(24, 'S3', 'Regular'),
(24, 'S4', 'Premium'),
(24, 'S5', 'Premium'),
(24, 'S6', 'Regular'),
(24, 'S7', 'Regular'),
(24, 'S8', 'Premium'),
(24, 'S9', 'Premium'),
(24, 'S10', 'Regular'),
(25, 'S1', 'Premium'),
(25, 'S2', 'Premium'),
(25, 'S3', 'Premium'),
(25, 'S4', 'Regular'),
(25, 'S5', 'Regular'),
(25, 'S6', 'Regular'),
(25, 'S7', 'Regular'),
(25, 'S8', 'Premium'),
(25, 'S9', 'Premium'),
(25, 'S10', 'Regular'),
(26, 'S1', 'Premium'),
(26, 'S2', 'Premium'),
(26, 'S3', 'Premium'),
(26, 'S4', 'Regular'),
(26, 'S5', 'Premium'),
(26, 'S6', 'Premium'),
(26, 'S7', 'Premium'),
(26, 'S8', 'Regular'),
(26, 'S9', 'Premium'),
(26, 'S10', 'Premium'),
(27, 'S1', 'Regular'),
(27, 'S2', 'Regular'),
(27, 'S3', 'Regular'),
(27, 'S4', 'Regular'),
(27, 'S5', 'Regular'),
(27, 'S6', 'Premium'),
(27, 'S7', 'Premium'),
(27, 'S8', 'Premium'),
(27, 'S9', 'Regular'),
(27, 'S10', 'Regular'),
(28, 'S1', 'Premium'),
(28, 'S2', 'Premium'),
(28, 'S3', 'Premium'),
(28, 'S4', 'Premium'),
(28, 'S5', 'Premium'),
(28, 'S6', 'Regular'),
(28, 'S7', 'Regular'),
(28, 'S8', 'Regular'),
(28, 'S9', 'Regular'),
(28, 'S10', 'Regular'),
(29, 'S1', 'Premium'),
(29, 'S2', 'Premium'),
(29, 'S3', 'Regular'),
(29, 'S4', 'Premium'),
(29, 'S5', 'Premium'),
(29, 'S6', 'Premium'),
(29, 'S7', 'Premium'),
(29, 'S8', 'Premium'),
(29, 'S9', 'Regular'),
(29, 'S10', 'Premium'),
(30, 'S1', 'Regular'),
(30, 'S2', 'Premium'),
(30, 'S3', 'Premium'),
(30, 'S4', 'Regular'),
(30, 'S5', 'Premium'),
(30, 'S6', 'Regular'),
(30, 'S7', 'Premium'),
(30, 'S8', 'Premium'),
(30, 'S9', 'Premium'),
(30, 'S10', 'Regular');
select * from Seats;

-- TO INSERT THE SCREENS TABLE --
INSERT INTO Shows (MovieID, ScreenID, StartTime, EndTime) VALUES
(1, 1, '2025-01-07 21:02:37', '2025-02-13 16:27:06'),
(2, 2, '2025-03-13 05:25:11', '2025-01-17 23:06:42'),
(3, 3, '2025-04-14 05:24:30', '2025-01-12 06:10:33'),
(4, 4, '2025-04-01 05:36:47', '2025-04-25 11:20:39'),
(5, 5, '2025-04-07 03:19:22', '2025-04-05 21:00:33'),
(6, 6, '2025-04-16 00:35:05', '2025-01-12 05:33:37'),
(7, 7, '2025-04-25 10:15:34', '2025-02-21 09:58:53'),
(8, 8, '2025-01-26 01:26:54', '2025-01-14 15:19:03'),
(9, 9, '2025-01-03 16:42:21', '2025-03-19 10:28:21'),
(10, 10, '2025-02-05 17:05:58', '2025-02-07 11:58:30'),
(11, 11, '2025-01-19 14:56:21', '2025-04-16 01:35:35'),
(12, 12, '2025-04-15 22:53:56', '2025-04-24 18:16:05'),
(13, 13, '2025-02-03 21:39:04', '2025-01-08 19:07:08'),
(14, 14, '2025-03-18 19:02:59', '2025-01-17 19:49:19'),
(15, 15, '2025-02-01 06:22:12', '2025-01-17 12:03:23'),
(16, 16, '2025-01-02 07:50:36', '2025-04-19 09:47:33'),
(17, 17, '2025-03-16 14:19:07', '2025-04-26 05:13:19'),
(18, 18, '2025-03-11 08:38:29', '2025-05-01 19:14:39'),
(19, 19, '2025-03-12 21:58:07', '2025-04-12 02:46:53'),
(20, 20, '2025-02-18 09:59:22', '2025-01-12 02:44:35'),
(21, 21, '2025-04-09 04:56:55', '2025-04-01 20:34:21'),
(22, 22, '2025-01-06 14:55:10', '2025-02-14 22:53:04'),
(23, 23, '2025-04-23 07:17:39', '2025-02-16 00:16:50'),
(24, 24, '2025-01-27 12:59:50', '2025-02-13 02:51:47'),
(25, 25, '2025-03-09 11:36:18', '2025-03-17 13:29:48'),
(26, 26, '2025-03-21 16:44:31', '2025-01-16 02:30:51'),
(27, 27, '2025-02-20 05:07:22', '2025-03-13 16:30:18'),
(28, 28, '2025-02-09 13:00:46', '2025-03-19 19:07:23'),
(29, 29, '2025-04-03 18:01:58', '2025-01-12 12:26:46'),
(30, 30, '2025-01-12 16:37:00', '2025-03-23 19:16:35');
select * from Shows;

-- TO INSERT THE BOOKINGS TABLE --
INSERT INTO Bookings (UserID, ShowID, BookingTime, TotalAmount) VALUES
(1, 1, '2025-01-28 01:40:35', 996.68),
(2, 2, '2025-04-02 07:24:58', 223.8),
(3, 3, '2025-01-02 23:59:40', 198.98),
(4, 4, '2025-02-02 19:22:17', 673.54),
(5, 5, '2025-01-22 20:34:27', 948.4),
(6, 6, '2025-01-04 15:39:29', 632.87),
(7, 7, '2025-03-21 18:28:17', 740.27),
(8, 8, '2025-03-17 00:06:27', 848.29),
(9, 9, '2025-04-12 05:29:55', 835.99),
(10, 10, '2025-03-20 19:03:30', 150.18),
(11, 11, '2025-01-09 17:25:43', 348.03),
(12, 12, '2025-02-07 16:30:25', 836.16),
(13, 13, '2025-04-22 14:24:50', 824.25),
(14, 14, '2025-01-21 01:33:47', 731.8),
(15, 15, '2025-01-22 15:52:30', 676.82),
(16, 16, '2025-03-15 14:13:36', 244.77),
(17, 17, '2025-02-05 00:18:07', 935.18),
(18, 18, '2025-03-12 09:19:57', 370.51),
(19, 19, '2025-03-02 05:45:48', 526.46),
(20, 20, '2025-02-16 16:24:27', 694.82),
(21, 21, '2025-04-16 01:47:02', 194.9),
(22, 22, '2025-03-20 15:46:22', 762.52),
(23, 23, '2025-03-25 13:12:51', 876.16),
(24, 24, '2025-02-27 09:16:48', 965.43),
(25, 25, '2025-01-13 11:56:17', 287.1),
(26, 26, '2025-01-04 08:27:49', 324.38),
(27, 27, '2025-02-04 12:37:00', 504.86),
(28, 28, '2025-01-19 04:46:54', 210.08),
(29, 29, '2025-02-22 15:31:10', 783.77),
(30, 30, '2025-05-02 04:05:47', 513.9);
select * from Bookings;

-- TO INSERT THE BOOKEDSEATS TABLE --
INSERT INTO Bookings (UserID, ShowID, BookingTime, TotalAmount) VALUES
(1, 1, '2025-05-04 12:00:00', 15.00),
(2, 1, '2025-05-04 12:10:00', 15.00),
(3, 2, '2025-05-04 14:00:00', 20.00),
(4, 2, '2025-05-04 14:15:00', 20.00),
(5, 3, '2025-05-04 16:00:00', 18.00),
(6, 3, '2025-05-04 16:30:00', 18.00),
(7, 4, '2025-05-04 18:00:00', 22.00),
(8, 4, '2025-05-04 18:20:00', 22.00),
(9, 5, '2025-05-04 20:00:00', 25.00),
(10, 5, '2025-05-04 20:10:00', 25.00),
(11, 6, '2025-05-05 12:00:00', 17.00),
(12, 6, '2025-05-05 12:30:00', 17.00),
(13, 7, '2025-05-05 14:00:00', 21.00),
(14, 7, '2025-05-05 14:20:00', 21.00),
(15, 8, '2025-05-05 16:00:00', 19.00),
(16, 8, '2025-05-05 16:30:00', 19.00),
(17, 9, '2025-05-05 18:00:00', 23.00),
(18, 9, '2025-05-05 18:30:00', 23.00),
(19, 10, '2025-05-05 20:00:00', 26.00),
(20, 10, '2025-05-05 20:10:00', 26.00),
(21, 11, '2025-05-06 12:00:00', 15.50),
(22, 11, '2025-05-06 12:20:00', 15.50),
(23, 12, '2025-05-06 14:00:00', 18.50),
(24, 12, '2025-05-06 14:30:00', 18.50),
(25, 13, '2025-05-06 16:00:00', 20.50),
(26, 13, '2025-05-06 16:20:00', 20.50),
(27, 14, '2025-05-06 18:00:00', 22.50),
(28, 14, '2025-05-06 18:30:00', 22.50),
(29, 15, '2025-05-06 20:00:00', 24.50),
(30, 15, '2025-05-06 20:10:00', 24.50);
select * from Bookings;

-- TO INSERT THE BOOKEDSEATS TABLE --
INSERT INTO Payments(PaymentID,BookingID, PaymentMethod, PaymentStatus, PaymentDate) 
VALUES(1,31, 'Credit Card', 'Success', '2025-02-25'),
(2,61, 'UPI', 'Success', '2025-04-14 08:13:32'),
(3,32, 'Net Banking', 'Success', '2025-01-03 '),
(4,62, 'Net Banking', 'Failed', '2025-02-20 '),
(5,33, 'UPI', 'Failed', '2025-01-28 '),
(6,63,'UPI', 'Success', '2025-03-06'),
(7,34, 'UPI', 'Failed', '2025-03-11 '),
(8,64, 'Debit Card', 'Failed', '2025-04-14 '),
(9,35, 'Net Banking', 'Failed', '2025-02-10 '),
(10,65, 'Net Banking', 'Pending', '2025-01-14'),
(11,36, 'Net Banking', 'Failed', '2025-01-31 '),
(12,66, 'Net Banking', 'Failed', '2025-02-28'),
(13,37,'UPI', 'Failed', '2025-01-27 '),
(14,67,'Net Banking', 'Pending', '2025-03-05'),
(15,38, 'UPI', 'Failed', '2025-02-22 '),
(16,68, 'Debit Card', 'Success', '2025-04-09'),
(17,39, 'Credit Card', 'Pending', '2025-02-27'),
(18,69,'Debit Card', 'Success', '2025-02-27'),
(19,40,'UPI', 'Failed', '2025-02-19 '),
(20,70, 'Credit Card', 'Success', '2025-03-25'),
(21,41, 'Debit Card', 'Success', '2025-02-07'),
(22,71, 'Net Banking', 'Pending', '2025-02-05'),
(23,42, 'UPI', 'Success', '2025-02-12'),
(24,72,'Net Banking', 'Failed', '2025-02-23 '),
(25,43, 'Credit Card', 'Failed', '2025-03-12'),
(26,73, 'Debit Card', 'Success', '2025-04-24 '),
(27,44, 'Credit Card', 'Pending', '2025-02-28 '),
(28,45, 'Debit Card', 'Success', '2025-03-12 '),
(29,75, 'Debit Card', 'Success', '2025-02-20 '),
(30,46, 'Credit Card', 'Success', '2025-03-01 ');
select * from Payments;

INSERT INTO BookedSeats (BookedSeatID, BookingID, SeatID) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15),
(16, 6, 16),
(17, 6, 17),
(18, 6, 18),
(19, 7, 19),
(20, 7, 20),
(21, 7, 21),
(22, 8, 22),
(23, 8, 23),
(24, 8, 24),
(25, 9, 25),
(26, 9, 26),
(27, 9, 27),
(28, 10, 28),
(29, 10, 29),
(30, 10, 30);
select * from BookedSeats;

INSERT INTO Bookings (BookingID, UserID, ShowID, BookingTime, TotalAmount) VALUES
(1, 1, 1, NOW(), 500.00),
(2, 2, 1, NOW(), 450.00),
(3, 3, 2, NOW(), 600.00),
(4, 4, 2, NOW(), 700.00),
(5, 5, 3, NOW(), 550.00),
(6, 6, 3, NOW(), 480.00),
(7, 7, 4, NOW(), 620.00),
(8, 8, 4, NOW(), 660.00),
(9, 9, 5, NOW(), 510.00),
(10, 10, 5, NOW(), 730.00);
select * from Bookings;

-- views1--
CREATE VIEW UserBookingDetails AS
SELECT 
    u.UserID,
    u.Name AS UserName,
    u.Email,
    m.Title AS MovieTitle,
    s.StartTime AS ShowTime,
    b.TotalAmount
FROM Bookings b
JOIN Users u ON b.UserID = u.UserID
JOIN Shows s ON b.ShowID = s.ShowID
JOIN Movies m ON s.MovieID = m.MovieID;
SELECT * FROM UserBookingDetails;

-- views2--
CREATE VIEW BookedSeatInfo AS
SELECT 
    bs.BookedSeatID,
    b.BookingID,
    u.Name AS UserName,
    t.Name AS TheaterName,
    t.Location,
    sc.ScreenNumber,
    se.SeatNumber
FROM BookedSeats bs
JOIN Bookings b ON bs.BookingID = b.BookingID
JOIN Users u ON b.UserID = u.UserID
JOIN Seats se ON bs.SeatID = se.SeatID
JOIN Screens sc ON se.ScreenID = sc.ScreenID
JOIN Theaters t ON sc.TheaterID = t.TheaterID;
SELECT * FROM BookedSeatInfo WHERE BookingID = '2';

-- TO CREATE STORED PROCEDURES IN ADD USERS --

DELIMITER //

CREATE PROCEDURE AddUser (
    IN p_Name VARCHAR(100),
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(15),
    IN p_Password VARCHAR(100)
)
BEGIN
    INSERT INTO Users (Name, Email, Phone, Password)
    VALUES (p_Name, p_Email, p_Phone, p_Password);
END //

DELIMITER ;

CALL AddUser('John Doe', 'john@example.com', '9876543210', 'password123');

-- TO CREATE THE STORED PROCEDURES IN ADD PAYMENTS --

DELIMITER //

CREATE PROCEDURE AddPayment (
    IN p_BookingID INT,
    IN p_PaymentMethod VARCHAR(50),
    IN p_PaymentStatus VARCHAR(20),
    IN p_PaymentDate DATETIME
)
BEGIN
    INSERT INTO Payments (BookingID, PaymentMethod, PaymentStatus, PaymentDate)
    VALUES (p_BookingID, p_PaymentMethod, p_PaymentStatus, p_PaymentDate);
END //

DELIMITER ;

CALL AddPayment(1, 'Credit Card', 'Success', NOW()); 

-- TO CREATE THE STORED PROCEDURE IN THE ADD BOOKED SEAT --

DELIMITER //

CREATE PROCEDURE AddBookedSeat (
    IN p_BookingID INT,
    IN p_SeatID INT
)
BEGIN
    INSERT INTO BookedSeats (BookingID, SeatID)
    VALUES (p_BookingID, p_SeatID);
END //

DELIMITER ;

CALL AddBookedSeat(1, 1); 

DELIMITER //

CREATE PROCEDURE AddScreen (
    IN p_TheaterID INT,
    IN p_ScreenNumber INT,
    IN p_SeatCapacity INT
)
BEGIN
    INSERT INTO Screens (TheaterID, ScreenNumber, SeatCapacity)
    VALUES (p_TheaterID, p_ScreenNumber, p_SeatCapacity);
END //

DELIMITER ;

CALL AddScreen(1, 1, 120); 

-- TO CREATE THE STORED PROCEDURE IN ADD SHOW --

DELIMITER //

CREATE PROCEDURE AddShow (
    IN p_MovieID INT,
    IN p_ScreenID INT,
    IN p_StartTime DATETIME,
    IN p_EndTime DATETIME
)
BEGIN
    INSERT INTO Shows (MovieID, ScreenID, StartTime, EndTime)
    VALUES (p_MovieID, p_ScreenID, p_StartTime, p_EndTime);
END //

DELIMITER ;

CALL AddShow(1, 1, '2025-05-04 18:00:00', '2025-05-04 20:30:00');

-- TO CREATE STORED PROCEDURES IN ADD THEATER -- 

DELIMITER //

CREATE PROCEDURE AddTheater (
    IN p_Name VARCHAR(100),
    IN p_Location VARCHAR(100)
)
BEGIN
    INSERT INTO Theaters (Name, Location)
    VALUES (p_Name, p_Location);
END //

DELIMITER ;

CALL AddTheater('PVR Cinemas', 'Chennai');















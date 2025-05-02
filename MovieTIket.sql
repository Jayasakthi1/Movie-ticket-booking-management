create database movie_ticket;
use movie_ticket;
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Password VARCHAR(100)
);
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT, -- in minutes
    Language VARCHAR(50),
    Rating DECIMAL(2,1)
);
CREATE TABLE Theaters (
    TheaterID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100)
);
CREATE TABLE Screens (
    ScreenID INT PRIMARY KEY AUTO_INCREMENT,
    TheaterID INT,
    ScreenNumber INT,
    SeatCapacity INT,
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);
CREATE TABLE Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT,
    ScreenID INT,
    SeatNumber VARCHAR(10),
    Type VARCHAR(20),
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
);
CREATE TABLE Shows (
    ShowID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    ScreenID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
);
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ShowID INT,
    BookingTime DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID)
);
CREATE TABLE BookedSeats (
    BookedSeatID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    SeatID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(20),
    PaymentDate DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);








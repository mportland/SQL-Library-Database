CREATE DATABASE LibraryManagementSystem 
GO

USE LibraryManagementSystem
GO

CREATE TABLE Publisher
([Name] VARCHAR(30) Primary Key,
[Address] VARCHAR(50),
Phone INT 
)
GO

CREATE TABLE Book
(BookID INT Primary Key, 
Title VARCHAR(50), 
Name VARCHAR(30) Foreign Key References Publisher(Name) NULL
)
GO

CREATE TABLE Book_Author
(BookID INT Foreign Key References Book(BookID) NULL,
AuthorName VARCHAR(30)
)
GO

CREATE TABLE Library_Branch
(BranchID INT Primary Key,
BranchName VARCHAR(30),
[Address] VARCHAR(50)
)
GO

CREATE TABLE Borrower 
(CardNo INT Primary Key,
[Name] VARCHAR(30),
[Address] VARCHAR(50)
)
GO

CREATE TABLE Book_Copies
(BookID INT Foreign Key References Book(BookID) NULL,
BranchID INT Foreign Key References Library_Branch(BranchID) NULL,
No_Of_Copies INT
)
GO

CREATE TABLE Book_Loans
(BookID INT Foreign Key References Book(BookID) NULL,
BranchID INT Foreign Key References Library_Branch(BranchID) NULL,
CardNo INT Foreign Key References Borrower(CardNo) NULL,
DateOut Datetime,
DueDate Datetime
)
GO


 INSERT INTO Publisher
 VALUES ('Marcus', '256 Flangey St.', NULL),
 ('Terry and Co','Homer Simpson Way', NULL),
 ('Some stuck-up guys', 'Wormwood', NULL),
 ('Blue Collar Publishers', 'Moria Way ', NULL),
 ('Most Interesting Man', '345 Griswald Way', NULL)
 GO

 INSERT INTO Book
VALUES (1, 'The Lost Tribe', 'Marcus'),
(2, 'Pride and Prejudice', 'Blue Collar Publishers'),
(3, 'The Da Vinci Code', NULL),
(4, 'Life of Pi', 'Blue Collar Publishers'),
(5, 'The Catcher in the Rye', NULL),
(6, 'Slaughterhouse-Five', 'Marcus'),
(7, 'Of Mice And Men', 'Most Interesting Man'),
(8, 'Catch22', 'Most Interesting Man'),
(9, 'Jane Eyre', 'Most Interesting Man'),
(10, 'The Illiad', 'Some stuck-up guys'),
(11, 'The Giver', 'Marcus'),
(12, 'American Gods', 'Marcus'),
(13, 'The Golden Compass', 'Marcus'),
(14, 'The Stranger', 'Marcus'),
(15, 'Emma', 'Blue Collar Publishers'),
(16, 'The Road', 'Some stuck-up guys'),
(17, 'The Chronicles of Narnia', 'Terry and Co'),
(18, 'The Grapes of Wrath', 'Blue Collar Publishers'),
(19, 'A Wrinkle in Time', 'Most Interesting Man'),
(20, 'Dune', 'Terry and Co'),
(21, 'The Shining', 'Most Interesting Man')
 GO

INSERT INTO Book_Author 
VALUES (1, 'Stephen King'),
(2, 'Jane Austen'),
(3, 'Dan Brown'),
(4, 'Yann Martel'),
(5, 'J.D. Salinger'),
(6, 'Kurt Vonnegut'),
(7, 'John Steinbeck'),
(8, 'Joseph Heller'),
(9, 'Charlotte Bronte'),
(10, 'Homer'),
(11, 'Lois Lowry'),
(12, 'Neil Gaiman'),
(13, 'Philip Pullman'),
(14, 'Albert Camus'),
(15, 'Jane Austin'),
(16, 'Cormac McCarthy'),
(17, 'C.S. Lewis'),
(18, 'John Steinbeck'),
(19, 'Madeleine L Engle'),
(20, 'Frank Herbert')
GO

INSERT INTO Library_Branch
VALUES (1, 'Sharpstown', NULL),
(2, 'Central', NULL),
(3, 'Beaverton', NULL),
(4, 'Hawthorne', NULL)
GO

INSERT INTO Borrower
VALUES (111, 'Garfunkle Michaels', '5th Ave Times Square'),
(222, 'Silly Bear', NULL),
(333, 'Evin Roberts', '432 Maddison Ave'),
(444, 'Haribo Gold Bears', '103 NW 20th Ave'),
(555, 'Stinky Bear', '493 sw North St'),
(666, 'Brown Bear', 'North pole'),
(777, 'Pink Bear', NULL),
(888, 'Red Bear', 'MARS'),
(999, 'Purple Bear', NULL)
GO

INSERT INTO Book_Copies
VALUES (1, 2, 4),
(1,1, 3),
(1, 3, 2),
(1, 4, 4),
(2, 4, 2),
(2, 3, 2),
(2, 1, 7),
(2, 2, 2),
(3, 1, 2),
(3, 3, 6),
(3, 2, 3),
(4, 2, 5),
(4, 1, 2),
(5, 1, 2),
(5, 2, 2),
(5, 4, 4),
(5, 3, 3),
(6, 1, 3),
(6, 3, 3),
(7, 2, 4),
(7, 1, 3),
(7, 4, 2),
(8, 2, 4),
(8, 4, 4),
(8, 1, 2),
(9, 4, 1),
(10, 3, 2),
(10, 2, 3),
(10, 1, 2),
(11, 3, 2),
(11, 1, 3),
(11, 4, 2),
(11, 2, 5),
(12, 1, 2),
(13, 3, 2),
(13, 1, 4),
(13, 2, 7),
(14, 2, 4),
(15, 1, 2),
(15, 3, 4),
(15, 2, 5),
(16, 1, 4),
(16, 2, 2),
(16, 4, 5),
(16, 3, 3),
(17, 1, 4),
(17, 4, 4),
(17, 3, 2),
(17, 2, 2),
(18, 1, 3),
(18, 2, 5),
(18, 4, 2),
(18, 3, 3),
(19, 2, 2),
(19, 1, 4),
(19, 3, 5),
(20, 2, 3),
(20, 4, 4),
(20, 1, 3),
(20, 3, 5),
(21, 2, 2),
(21, 4, 3),
(21, 1, 5)
GO

INSERT INTO Book_Loans
VALUES (1, 2, 222, '04-09-16', '04-19-16'),
(1, 3, 222, '01-08-14', '01-15-14'),
(1, 4, 333, '02-13-16', '02-14-16'),
(2, 4, 444, '02-14-16', '02-19-16'),
(2, 3, 333, '04-08-16', '04-15-16'),
(2, 1, 444, '01-19-16', '01-28-16'),
(2, 2, 333, '02-14-16', '02-22-16'),
(3, 1, 666, '09-18-16', '09-29-16'),
(3, 3, 111, '10-31-15', '11-06-15'),
(3, 2, 777, '11-18-16', '11-27-16'),
(4, 2, 555, '05-07-16', '05-15-16'),
(4, 1, 333, '04-09-16', '04-16-16'),
(5, 1, 444, '03-05-16', '03-18-16'),
(5, 2, 111, '01-08-87', '01-08-16'),
(5, 4, 222, '01-08-87', '01-08-16'),
(5, 3, 777, '01-08-87', '01-08-16'),
(6, 1, 222, '01-08-87', '01-08-16'),
(6, 3, 333, '01-08-87', '01-08-16'),
(7, 2, 111, '01-08-87', '01-08-16'),
(7, 1, 111, '01-08-87', '01-08-16'),
(7, 4, 444, '01-19-16', '01-28-16'),
(8, 2, 777, '01-08-87', '01-08-16'),
(8, 4, 111, '01-08-87', '01-08-16'),
(8, 1, 666, '09-18-16', '09-29-16'),
(9, 4, 555, '05-07-16', '05-15-16'),
(10, 3, 555, '05-07-16', '05-15-16'),
(10, 2, 111, '01-08-87', '01-08-16'),
(10, 1, 777, '01-08-87', '01-08-16'),
(11, 3, 666, '09-18-16', '09-29-16'),
(11, 1, 444, '01-19-16', '01-28-16'),
(11, 4, 777, '01-08-87', '01-08-16'),
(11, 2, 333, '01-08-87', '01-08-16'),
(12, 1, 222, '01-08-87', '01-08-16'),
(13, 3, 333, '10-31-15', '11-06-15'),
(13, 1, 888, '01-19-16', '01-28-16'),
(13, 2, 888, '01-19-16', '01-28-16'),
(14, 2, 666, '10-31-15', '11-06-15'),
(15, 1, 444, '01-19-16', '01-28-16'),
(15, 3, 333, '01-08-87', '01-08-16'),
(15, 2, 222, '01-08-87', '01-08-16'),
(16, 1, 777, '01-08-87', '01-08-16'),
(16, 2, 444, '01-19-16', '01-28-16'),
(16, 4, 888, '01-19-16', '01-28-16'),
(16, 3, 777, '10-31-15', '11-06-15'),
(17, 1, 444, '01-19-16', '01-28-16'),
(17, 4, 888, '01-19-16', '01-28-16'),
(17, 3, 222, '01-08-87', '01-08-16'),
(17, 2, 444, '01-19-16', '01-28-16'),
(18, 1, 888, '01-19-16', '01-28-16'),
(18, 2, 333, '01-08-87', '01-08-16'),
(18, 4, 888, '01-19-16', '01-28-16'),
(18, 3, 444, '10-31-15', '11-06-15'),
(19, 2, 444, '01-19-16', '01-28-16'),
(19, 1, 222, '01-08-87', '01-08-16'),
(19, 3, 777, '01-08-87', '01-08-16'),
(20, 2, 777, '01-08-87', '01-08-16'),
(20, 4, 888, '01-19-16', '01-28-16'),
(20, 1, 888, '01-19-16', '01-28-16'),
(20, 3, 333, '01-08-87', '01-08-16'),
(21, 2, 222, '01-08-87', '01-08-16'),
(21, 4, 666, '10-31-15', '11-06-15'),
(21, 1, 444, '01-19-16', '01-28-16')



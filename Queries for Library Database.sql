-- Question 1 --
SELECT COUNT(*)
FROM Book INNER JOIN Book_Loans 
ON Book.BookID = Book_Loans.BookID
INNER JOIN Book_Copies 
ON Book.BookID = Book_Copies.BookID
WHERE Book.Title =  'The Lost Tribe' AND
Book_Copies.BranchID = (1) 



-- Question 2 --
SELECT COUNT(Library_branch.BranchID) AS Remaining_Copies, Library_Branch.BranchName
FROM Book INNER JOIN Book_Loans 
ON Book.BookID = Book_Loans.BookID
INNER JOIN Book_Copies 
ON Book.BookID = Book_Copies.BookID
INNER JOIN Library_Branch
ON Book_Loans.BranchID = Library_Branch.BranchID
WHERE Book.Title =  'The Lost Tribe' 
GROUP BY Library_Branch.BranchName



-- Question 3 -- 
SELECT Borrower.Name, COUNT (Book_Loans.CardNo) AS BooksChkedOut
FROM Book_Loans RIGHT OUTER JOIN Borrower 
ON Book_Loans.CardNo = Borrower.CardNo 
GROUP BY Borrower.Name 
HAVING COUNT (Book_Loans.CardNo) = (0)



-- Question 4 --
SELECT Book.Title, Borrower.Name, Borrower.[Address]
FROM Book_Loans INNER JOIN Book
ON Book_Loans.BookID = Book.BookID
INNER JOIN Borrower
ON Borrower.CardNo = Book_Loans.CardNo
WHERE Book_Loans.BranchID = (1) AND Book_Loans.DueDate = '01-08-16'


-- Question 5 --
SELECT COUNT(Book_Loans.CardNo) AS Books_Loaned
FROM Library_Branch INNER JOIN Book_Loans 
ON Library_Branch.BranchID = Book_Loans.BranchID
GROUP BY Library_Branch.BranchID
SELECT Library_Branch.BranchName
FROM Library_Branch


-- Question 6 --
SELECT COUNT(Book_Loans.CardNo) AS TimesChkedOut, Borrower.Name 
FROM Book_Loans RIGHT OUTER JOIN Borrower
ON Borrower.CardNo = Book_Loans.CardNo 
GROUP BY Borrower.Name
HAVING COUNT(Borrower.CardNo) > (5)



--Question 7 -- 
SELECT Book.Title, Book_Author.AuthorName, Library_Branch.BranchName, Book_Copies.No_Of_Copies
FROM Book_Copies INNER JOIN Book_Author
ON Book_Copies.BookID = Book_Author.BookID
INNER JOIN Library_Branch
ON Library_Branch.BranchID = Book_Copies.BranchID
INNER JOIN Book
ON Book.BookID = Book_Copies.BookID
WHERE Book_Author.AuthorName = 'Stephen King' AND Library_Branch.BranchID = (2)


--Procedure Creation --

CREATE PROC FindBookAtBranch @book_author VARCHAR(30), @branch INT = '%'
AS
SELECT Book.Title, Book_Author.AuthorName, Library_Branch.BranchName, Book_Copies.No_Of_Copies
FROM Book_Copies INNER JOIN Book_Author
ON Book_Copies.BookID = Book_Author.BookID
INNER JOIN Library_Branch
ON Library_Branch.BranchID = Book_Copies.BranchID
INNER JOIN Book
ON Book.BookID = Book_Copies.BookID
WHERE Book_Author.AuthorName LIKE @book_author AND Library_Branch.BranchID = @branch 

EXEC FindBookAtBranch 'Stephen King', 1


DROP PROC FindBookAtBranch



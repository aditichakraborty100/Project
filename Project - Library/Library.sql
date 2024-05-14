-- Create Database Library_db
Create Database Library_db;
Use Library_db;


-- Create table Books
Create table Books(Book_ID int auto_increment primary Key, Title varchar(200),
Author varchar(200), Genre varchar(200), Publication_Year year);

Insert into Books(Title,Author,Genre,Publication_Year) Values("400 minutes of danger","Jack","Danger Series", 2016),
("Across the wall", "Nix","Adventure",2005),
("Books that made me", "Ridge","Personal Stories",2016),
("Burnt","Anthony"," Horror", 2002),
("300 minutes of danger","Heath","Danger Series",2015),
("Allergic","Megan","Graphic Novels",2021),
("Cream buns and crime","Robin","Mystery Series", 2004),
("Dragon legends", "David","Mythology",2012);
 Select * from books;
 
 -- Create table Members
 Create table Members(Member_id int primary key,First_name varchar(100),Last_name varchar(100),Email Varchar(200),Phone_Number Char (10));
 Insert into Members(Member_Id, First_name,Last_name,Email,Phone_Number) values(1,"Aditya","Chakraborty","Aditya@gmail.com",9831310978),
 (2,"Manshi","Shigh","Manshi@gmail.com",9821212245),
 (3,"Antara","Ghosh","Antara@gmail.com",9756459867),
 (4,"Priyanka","Saha","Priyanka@gmail.com",9865763421),
 (5,"Raj","Sharma","Raj@gmail.com",9865453254),
 (6,"Riya","Majumder","Ria@gmail.com",9865453421),
 (7,"Akash","Nayak","Akash@gmail.com",9765345423),
 (8,"Mousumi","Gangopadhya","Mousumi@gmail.com",9756453432),
 (9,"Ananya","Dey","Ananya@gmail.com",9854342314),
 (10,"Abir","Choudhury","Abir@gmail.com",9728287645);
 
 Select* from Members;
 -- Create table Borrowings 
 
 Create table Borrowings(Borrowing_ID int,Book_Id int,Member_Id int,Borrowed_Date Date,Due_Date date,Returned_Date date,
 primary key(Borrowing_ID),
 foreign key Fk1 (Book_Id) references Books (Book_Id),
 Foreign Key Fk2 (Member_Id) References Members(Member_Id));
 

 
 
 
 -- Insert record into Borrowings
 Insert into Borrowings (Borrowing_ID,Book_Id,Member_Id,Borrowed_Date,Due_Date,Returned_Date) Values
 (1,1,1,'2023-01-11','2023-03-01','2023-02-26');
 
 Insert into Borrowings (Borrowing_ID,Book_Id,Member_Id,Borrowed_Date,Due_Date,Returned_Date) Values
 
 (2,2,1,'2022-02-24','2022-05-24','2022-04-12'),
 (3,1,2,'2022-05-12','2022-06-12','2022-05-11'),
 (4,3,4,'2021-06-23','2021-08-21','2021-09-10');
 Insert into Borrowings (Borrowing_ID,Book_Id,Member_Id,Borrowed_Date,Due_Date,Returned_Date) Values
 (5,7,6,'2020-07-21','2020-09-25','2020-09-12'),
 (6,8,9,'2023-05-24','2023-07-27','2023-06-26'),
 (7,6,3,'2021-09-21','2021-11-23','2021-10-20'),
 (8,4,5,'2023-07-26','2023-09-07','2023-09-01'),
 (9,5,10,'2022-09-11','2022-11-08','2022-11-07'),
 (10,8,7,'2020-02-21','2020-05-24','2020-04-22');
 
 -- 1.How can we retrive all the books from library?
Select * from books;

-- 2.How can we find menbers with a specific last name? 

Select * from members where Last_name like'%a';
 -- 3. how can we add a new book to the library's collection?
Insert into Books (Book_ID,Title,Author,Genre,Publication_Year) values
(9,"Harry Potter and Chamber of Secrets","J.K.Rowling","Fantasy Novel",1998);


-- 4. How can we update a member's email address?
Update Members set Email="Antara500@gmail.com" where Member_id = 3;


-- 5. How can we remove a book from a library's collection ?
Delete from books where Book_ID = 9;

-- 6. How can we retrive Borrowing details,including member's name, Book title,Borrowed date and Due date? 
Select * from Books;
Select * from Borrowings;
Select * from Members;

Select M.First_Name, M.Last_name,Books.Title, B.Borrowed_Date,B.Due_Date from Members M
Left join Borrowings B
on M.Member_Id = B.Member_Id
Left join Books 
On B.Book_Id = Books.Book_Id;

-- 7. How can we determine the number of books borrowed my each member?
Select * from Borrowings;
Select* from Members;

SELECT m.first_name, m.last_name, COUNT(br.borrowing_id) AS books_borrowed
FROM Members m
LEFT JOIN Borrowings br ON m.member_id = br.member_id
GROUP BY m.member_id;


-- 8. How can we identify members who have overdue books? 

Select * from Borrowings;
Select* from Members;
Select * from books;


SELECT m.Member_Id, m.first_name, m.last_name, b.title, br.due_date
FROM Members m
JOIN Borrowings br ON m.member_id = br.member_id
JOIN Books b ON br.book_id = b.book_id
where Returned_Date > Due_Date;


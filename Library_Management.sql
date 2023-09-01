CREATE DATABASE library;
USE library;
CREATE TABLE Branch(Branch_no INT PRIMARY KEY,Manager_id INT,Branch_address VARCHAR(40),Contact_no INT);
CREATE TABLE Employee(Emp_Id INT PRIMARY KEY,Emp_name varchar(40),Position VARCHAR(40),Salary INT);
CREATE TABLE Customer(Customer_Id INT PRIMARY KEY,Customer_name VARCHAR(40),Customer_address VARCHAR(40),Reg_date DATE);
CREATE TABLE Books(ISBN INT PRIMARY KEY,Book_tittle VARCHAR(40),Category VARCHAR(40),Rental_price INT,astatus VARCHAR(10),Author VARCHAR(40),Publisher VARCHAR(40));
CREATE TABLE IssueStatus(Issue_Id INT PRIMARY KEY,Issued_cust INT,Issued_book_name varchar(40),Issue_date DATE,Isbn_book INT,FOREIGN KEY (Issued_cust)REFERENCES Customer(Customer_Id),FOREIGN KEY (Isbn_book)REFERENCES Books(ISBN));
CREATE TABLE ReturnStatus(Return_Id INT PRIMARY KEY,Return_Cust VARCHAR(40),Return_Book_name VARCHAR(40),Return_date DATE,Isbn_book2 INT,FOREIGN KEY(Isbn_book2)REFERENCES Books(ISBN));
INSERT INTO Branch VALUES
(100,01,'AB Plaza Thiruvalla',984736789),
(101,02,'BC Tower Kollam',987586239),
(102,03,'ABB Arcade Thrissur',988569878),
(103,04,'ABC Building Aluva',847358745),
(104,05,'CK Center Kottayam',980256789),
(105,06,'KC Office Tower Kochi',21568959),
(106,07,'TKR Avenue Pala',984587486);
SELECT*FROM Branch;
INSERT INTO Employee VALUES
(200,'Anu','Manager',55000),
(201,'Santhosh','Specialist',45000),
(202,'Arun','Specialist',51000),
(203,'Sara','Engineer',52000),
(204,'Elise','Controller',48000),
(205,'Akash','Supervisor',53000),
(206,'Shyju','Technician',46000);
SELECT*FROM Employee;
INSERT INTO Customer VALUES
(300,'Abhilash','Palakkad','2021-05-24'),
(301,'Salu','Thiruvalla','2021-04-15'),
(302,'Rajesh','Kannur','2021-12-24'),
(303,'Liam','Pala','2022-05-14'),
(304,'Don','Kottayam','2023-01-12'),
(305,'Ram','Thrissur','2022-06-13'),
(306,'Sai','Calicur','2023-11-20');
INSERT INTO Customer VALUES
(307,'Anu','Cochin','2021-11-12');
SELECT*FROM Customer;

INSERT INTO Books VALUES
(12345678,'The God of Small Things','Fiction',200,'YES','Arundhati Roy','Random House'),
(12345679,'Train to pakistan','Novel',150,'NO','Kushwant Singh','Ravi Dayal'),
(34567801,'Wings of Fires','Biography',180,'YES','Abdul Kalam','Universities press'),
(12347778,'The Discovery of India','History',175,'YES','Jawaharlal Nehru','Penguin Books'),
(52348778,'My Experiments with truth','Biography',180,'YES','Mahathma Gandhi','Navajivan House'),
(42345878,'Collected poems','Poetry',165,'NO','Kamala Das','Penguin Books'),
(42386678,'Interpreter of Maladies','Short Story',150,'YES','Jumpha Lahiri','Mariner Books');
SELECT*FROM Books;
INSERT INTO IssueStatus VALUES
(400,300,'The God of Small Things','2023-06-12',12345678),
(401,301,'Train to pakistan','2023-06-15',12345679),
(402,302,'Wings of Fires','2023-06-17',34567801),
(403,303,'The Discovery of India','2023-06-12',12347778),
(404,304,'My Experiments with truth','2023-03-11',52348778),
(405,305,'Collected poems','2023-01-15',42345878),
(406,306,'Interpreter of Maladies','2023-08-13',42386678);
SELECT*FROM IssueStatus;
INSERT INTO ReturnStatus VALUES
(500,300,'The God of Small Things','2023-08-13',12345678),
(501,301,'Train to pakistan','2023-07-25',12345679),
(502,302,'Wings of Fires','2023-07-25',34567801),
(503,305,'Collected poems','2023-03-25',42345878),
(504,304,'My Experiments with truth','2023-05-25',52348778);
SELECT*FROM ReturnStatus;

SELECT Book_tittle,Category,Rental_price from books WHERE astatus='YES';

SELECT Emp_name,Salary from Employee
ORDER BY Salary DESC;

SELECT Issued_book_name AS Book_Name,Customer_name AS Name
FROM IssueStatus,Customer
WHERE IssueStatus.Issued_cust=Customer.Customer_id;

SELECT Category,count(*) AS Count FROM Books
GROUP BY Category;

SELECT Emp_name AS Employee,Position,Salary FROM Employee
WHERE Salary >50000;

SELECT Customer_name AS Name,Reg_date FROM Customer WHERE Reg_date <'2022-01-01'
AND Customer_id NOT IN(SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no,count(*) AS Total_Employees
FROM Branch
GROUP BY Branch_no;

SELECT Customer_name,Issued_book_name,Issue_date
FROM Customer AS C,IssueStatus AS I
WHERE C.Customer_id=I.Issued_cust
AND year(Issue_date)=2023 AND month(Issue_date)=6;

SELECT Book_tittle,Category from Books WHERE Category='History';

SELECT Branch_no,count(*) AS Total_Employees
FROM Branch
GROUP BY Branch_no
HAVING count(*)>5;







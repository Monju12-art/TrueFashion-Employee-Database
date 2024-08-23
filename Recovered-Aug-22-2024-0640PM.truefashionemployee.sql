--DATABASE CREATION (NAME)
CREATE DATABASE TrueFashionEmployeeDB;


--Employee table
CREATE TABLE Employee(
EmployeeID NVARCHAR (30) PRIMARY KEY NOT NULL,
FirstName NVARCHAR (50),
LastName NVARCHAR (50),   
Gender NVARCHAR(10),
PhoneNumber NVARCHAR (50),
EmailAddress NVARCHAR (100),
);

--employee details
INSERT INTO Employee
VALUES( 'EMP001', 'Blessing','Joe','Female','+233 532 463 884', 'blessing@mail.com'),
      ( 'EMP002', 'Thelma','Brown','Female','+233 222 463 884', 'brown@mail.com'),
	  ( 'EMP003', 'Prince','Kollie','Male','+233 925 540 002', 'kollie@mail.com'),
	  ( 'EMP004', 'Andrew', 'Gaye','Male','+233 532 463 884', 'andrew@mail.com'),
	  ( 'EMP005', 'Ernestine','Cooper','Female','+233 532 463 884','Ernestine@mail.com'),
	  ( 'EMP006', 'Theresa','Bleede','Female','+233  542 884 799','theresa@mail.com'),
	  ( 'EMP007', 'Stephen','Jelleh','Male','+233 925 770 102', 'stephen@mail.com'),
	  ( 'EMP008', 'Justice','Paintsil','Male','+233 925 225 509', 'justice@mail.com'),
	  ( 'EMP009', 'Emmanuel','Payne','Male','+233 925 230 711', 'emmanuel@mail.com'),
	  ( 'EMP010', 'Irene','Jelleh','Female','+233 925 225 509', 'irene@mail.com');

	  SELECT* FROM Employee;
	  ------------------------------------------------------------------------------------------------
	  --Address table

	   CREATE TABLE AdressTable (
    AddressID  INT  IDENTITY(100,1) PRIMARY KEY NOT NULL,
	EmployeeID NVARCHAR (30),
    Zipcode INT,
    CityTown NVARCHAR (50),
    Country NVARCHAR (50),
    Region NVARCHAR (50),
	 );

	 ALTER TABLE AdressTable
 ADD CONSTRAINT FK_InfoID
 FOREIGN KEY ([EmployeeID]) REFERENCES
 Employee ([EmployeeID]);

   INSERT INTO AdressTable
   VALUES ('EMP001' ,67233, 'Accra','Ghana', 'Greater Accra Region'),
    ('EMP002' ,18233, 'Accra','Ghana', 'Greater Accra Region'),
   ( 'EMP003' ,88233, 'Kasoa','Ghana', 'Central Region'),
   ( 'EMP004' ,56230, 'Suhun','Ghana', 'Eastern Region' ),
   ( 'EMP005' ,23129, 'Teshie','Ghana', 'Greater Accra Region'),
   ( 'EMP006',70233 ,'Cape','Ghana', 'Cental Region'),
   ( 'EMP007',12231, 'Accra','Ghana', 'Greater Accra Region'),
   ( 'EMP008',20232, 'Accra','Ghana', 'Greater Accra Region' ),
   ( 'EMP009',10234, 'Kasoa','Ghana', 'Central Region'),
   ( 'EMP010',90233, 'Adenta','Ghana', 'Greater Accra Region');

SELECT* FROM AdressTable;
-------------------------------------------------------------------------------------------------
	  --Department table
CREATE TABLE Department (
    DepartmentID NVARCHAR (20) PRIMARY KEY NOT NULL,
	EmployeeID NVARCHAR (30),
    DepartmentName NVARCHAR(80),
    DepartmentHead NVARCHAR(80) ,
	Dept_Description NVARCHAR (200),
	Location NVARCHAR (100),
	 FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
);

INSERT INTO Department ( DepartmentID,DepartmentName,DepartmentHead, Dept_Description,Location)
VALUES ( 'Dept1', 'Marketing department', ' Blessing Joe', 'The marketing department is responsible for promoting True fasion company brand, products, and services to targeted audiences', 'Showrooms'),
 ( 'Dept2', 'Finanace department', ' Irene Jelleh', 'The finance department is responsible for managing True fashion financial activities, ensuring the accuracy and transparency of finanacial reporting', 'Accounting department'),
  ( 'Dept3', 'Customer service', ' Justice Paintsil', 'The customer service department is responsible for providing exceptional support and services to customers and ensuring that their needs are met', 'Call center'),
   ( 'Dept4', 'Human resource', ' Prince Kollie', 'The human resource department is responsible for managing True fashion workforce, from recruitment and hiring', 'HR office'),
   ( 'Dept5', 'Production', 'Thema Brown', 'The production department is responsible for planning, coordination, and execution of the production process', 'Warehouse');

   select*from Department;


   ---Department transfer--
   CREATE TABLE DepartmentTransfer(
   TransferID INT IDENTITY (200,1) PRIMARY KEY NOT NULL,
   EmployeeID NVARCHAR (30),
   FromDepartment NVARCHAR (50),
   ToDepartment NVARCHAR (50),
   DepartmentID NVARCHAR (20),
   TransferType NVARCHAR (50),
 );
    --employment forign key-----
   ALTER TABLE DepartmentTransfer
 ADD CONSTRAINT FK_EmpID
 FOREIGN KEY ([EmployeeID]) REFERENCES
 Employee ([EmployeeID]);
 -----department forign key------
  ALTER TABLE DepartmentTransfer
 ADD CONSTRAINT FK_DepID
 FOREIGN KEY (DepartmentID) REFERENCES
 Department (DepartmentID);


INSERT INTO  DepartmentTransfer
    VALUES   ( 'EMP001', 'Human resource', 'Marketing Department','Dept2','Permanent transfer'),
             ( 'EMP004' ,'Customer service', 'Marketing Department', 'Dept2',' Permanent transfer'),
			 ( 'EMP006', 'Production', 'Customer service', 'Dept3','Temporary transfer'),
			 ( 'EMP008', ' Human resource', 'Customer service', 'Dept3','Temporary transfer'),
			 ( 'EMP010', 'Production', 'Finance department', 'Dept3','Permanent transfer');
			  
   select * from DepartmentTransfer;
  

--JOb history table
CREATE TABLE JobHistory (
    JobHistoryID INT IDENTITY (50,1) PRIMARY KEY,
	EmployeeID NVARCHAR (30),
    JobTitle NVARCHAR(100) ,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
     );
	  ---- ALTER THE FORIGN KEY IN EMPLOYMENT ID----
	 INSERT INTO JobHistory ( EmployeeID,JobTitle, StartDate)
	 VALUES ('EMP001','Marketing Manager','2023-03-02'),
	       ( 'EMP002', 'Production manager','2024-06-11'),
		   ( 'EMP003', 'Designer', '2022-04-22'),
		   ( 'EMP004', 'Sales head', '2020-02-12' ),
		   ( 'EMP005', 'Call center agent', '2024-01-12' ),
		   ( 'EMP006', 'Recruitor', '2024-11-12' ),
		   ( 'EMP007', 'Designer', '2024-09-12' ),
		   ( 'EMP008', 'Social media manager', '2023-01-12'),
		   ( 'EMP009', 'Financial analyst', '2022-08-12'),
		   ( 'EMP010','Chief financial officer', '2024-12-12');

		   select*from JobHistory;
	----------------------------------------------------------------------------------------------

	---------Salary table---

	CREATE TABLE Salary(
   SalaryID INT IDENTITY (200,1) PRIMARY KEY NOT NULL,
   EmployeeID NVARCHAR (30),
   SalaryAmount DECIMAL (10,2),
   EffectiveDate DATE,
   JobTitle NVARCHAR (30),
   FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
   );
   

INSERT INTO Salary 
    VALUES ( 'EMP001', 2200.00, '2023-03-02','Marketing Manager' ),
	       ( 'EMP002', 1200.00, '2024-06-11', 'Production manager'),
		   ( 'EMP003', 1200.00, '2022-04-22', 'Designer'),
		   ( 'EMP004', 2000.00, '2020-02-12',  'Sales head' ),
		   ( 'EMP005', 2100.00, '2024-01-12', 'Call center agent'),
		   ( 'EMP006', 2100.00, '2024-11-12', 'Recruitor'),
		   ( 'EMP007', 2100.00, '2024-09-12', 'Designer'),
		   ( 'EMP008', 2100.00, '2023-01-12', ' Social media manager' ),
		   ( 'EMP009', 2100.00, '2022-08-12' , 'Financial analyst'),
		   ( 'EMP010', 2100.00, '2024-12-12', 'Chief financial officer' );

SELECT * from Salary;

--------Job Promotion Table

CREATE TABLE JobHistoryPromo (
 JobHistoryPromoID INT IDENTITY(2,2) PRIMARY KEY NOT NULL,
 EmployeeID NVARCHAR (30),
 JobHistoryID INT,
 PromotionDate DATE,
 OldSalary DECIMAL (10,2),
 NewSalary DECIMAL (10,2),
 FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
 FOREIGN KEY(JobHistoryID) REFERENCES  JobHistory(JobHistoryID),
 );

 INSERT INTO JobHistoryPromo
 VALUES ('EMP001',50, '2024-06-17', 2200.00, 3500.00),
   ('EMP002',51, '2024-11-02', 1200.00, 1250.00),
   ('EMP003',52, '2024-06-17', 1200.00, 1300.00),
   ('EMP005',54, '2024-11-10', 2100.00, 2500.00),
   ('EMP007',56, '2024-06-17', 2100.00, 2500.00);

   SELECT*FROM JobHistoryPromo;

   ---CRUD OPERATIONS---

   -- Create(insert)
INSERT INTO Employee(EmployeeID, FirstName, LastName, Gender, PhoneNumber, EmailAddress)
VALUES ('EMP011', 'Mary', 'Owusu','Female', '+233-565-123-4562','mary@email.com');
SELECT*FROM Employee;

INSERT INTO Department ( DepartmentName,DepartmentHead, Location)
                 VALUES('Production', 'Thelma Brown', 'Warehouse');

-- Read (Select)
SELECT*FROM Salary 
WHERE JobTitle='Marketing manager';

SELECT  DISTINCT DepartmentName
FROM Department;

SELECT COUNT(DISTINCT TransferType) FROM  DepartmentTransfer;

SELECT TOP 4* FROM Salary;

SELECT NewSalary AS NewPosition
FROM JobHistoryPromo;

-- Update (Update)
UPDATE Employee
SET LastName='Addai'
WHERE EmployeeID='EMP010';

SELECT * FROM Employee;

-- Delete (delete)
DELETE FROM employee
WHERE employeeID = 11;


----JOINS--

-- Inner Join
SELECT *
FROM Employee e
INNER JOIN JobHistory j ON e.EmployeeID = j.EmployeeID;


-- Left Join
SELECT *
FROM Employee e
LEFT JOIN JobHistory j ON e.EmployeeID = j.EmployeeID;

-- Right Join
SELECT *
FROM Employee e
RIGHT JOIN JobHistory j ON e.EmployeeID = j.EmployeeID;

-- Full Outer Join
SELECT *
FROM Employee e
FULL OUTER JOIN JobHistory j ON e.EmployeeID = j.EmployeeID;

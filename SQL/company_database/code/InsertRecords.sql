USE TestDB;

EXEC xp_fileexist 'C:\Users\Omer.Shehzad\Documents\SQL Dev\Raw_data\Salary.csv';


BULK INSERT Salary
FROM 'C:\Users\Omer.Shehzad\Documents\SQL Dev\Raw_data\Salary.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Department
FROM 'C:\Users\Omer.Shehzad\Documents\SQL Dev\Raw_data\Department.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


CREATE TABLE Employee_Staging (
   EmployeeID INT,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   DateOfBirth VARCHAR(20),
   Gender VARCHAR(10),
   HireDate VARCHAR(20),
   DepartmentID INT,
   SalaryID INT
);

BULK INSERT Employee_Staging
FROM 'C:\Users\Omer.Shehzad\Documents\SQL Dev\Raw_data\Employee1.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n'
);

INSERT INTO Employee (
   EmployeeID, FirstName, LastName, DateOfBirth, Gender, HireDate, DepartmentID, SalaryID
)
SELECT
   EmployeeID,
   FirstName,
   LastName,
   CONVERT(DATE, DateOfBirth, 103),  -- 103 = DD/MM/YYYY
   Gender,
   CONVERT(DATE, HireDate, 103),
   DepartmentID,
   SalaryID
FROM Employee_Staging;

CREATE TABLE Payment_Staging ( 
    PaymentID INT,
    EmployeeID INT,
    PaymentDate VARCHAR(20),
    Amount DECIMAL(18, 2),
    PaymentMethod NVARCHAR(50),
    PaymentStatus NVARCHAR(50),
);

BULK INSERT Payment_Staging
FROM 'C:\Users\Omer.Shehzad\Documents\SQL Dev\Raw_data\Payment.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n'
);

INSERT INTO Payment (
   PaymentID, EmployeeID, PaymentDate, Amount, PaymentMethod, PaymentStatus
)
SELECT
   PaymentID,
   EmployeeID,
   CONVERT(DATE, PaymentDate, 103),  -- 103 = DD/MM/YYYY
   Amount,
   PaymentMethod,
   PaymentStatus
FROM Payment_Staging;





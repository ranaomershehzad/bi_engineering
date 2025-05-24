
USE TestDB;


CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,
    BaseSalary DECIMAL(18, 2),
    Bonus DECIMAL(18, 2)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    HireDate DATE,
    DepartmentID INT,
    SalaryID INT,
    FOREIGN KEY (DepartmentID)  REFERENCES Department(DepartmentID),
    FOREIGN KEY (SalaryID)      REFERENCES Salary(SalaryID)
);


CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    EmployeeID INT,
    PaymentDate DATE,
    Amount DECIMAL(18, 2),
    PaymentMethod NVARCHAR(50),
    PaymentStatus NVARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

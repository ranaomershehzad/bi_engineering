USE TestDB;
/*
SELECT * FROM Employee;
SELECT * FROM [dbo].[Department];
SELECT * FROM [dbo].[Salary];
SELECT * FROM [dbo].[Payment];*/



WITH RankedSalaries AS (
    SELECT 
        d.DepartmentName,
        e.FirstName,
        e.LastName,
        s.BaseSalary,
        DENSE_RANK() OVER (PARTITION BY d.DepartmentName ORDER BY s.BaseSalary DESC) AS rn
    FROM Employee e
    LEFT JOIN Department d ON e.DepartmentID = d.DepartmentID
    LEFT JOIN Salary s ON e.SalaryID = s.SalaryID
)
SELECT DepartmentName, FirstName, LastName, BaseSalary,rn
FROM RankedSalaries
WHERE rn = 1
ORDER BY DepartmentName;


SELECT 
    d.DepartmentName,
    e.FirstName,
    e.LastName,
    s.BaseSalary
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID
JOIN Salary s ON e.SalaryID = s.SalaryID
WHERE s.BaseSalary = (
    SELECT MAX(s2.BaseSalary)
    FROM Employee e2
    JOIN Salary s2 ON e2.SalaryID = s2.SalaryID
    WHERE e2.DepartmentID = e.DepartmentID
)
ORDER BY d.DepartmentName;

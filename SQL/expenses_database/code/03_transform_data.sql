USE ExpensesDB;
SET DATEFORMAT dmy;

-- Insert into the CommBank table
TRUNCATE TABLE CommBank;
INSERT INTO CommBank (tran_date, tran_details,amount)
SELECT
    TRY_CAST(tran_date AS DATE) AS tran_date,
    tran_details,
    amount
FROM CommBankStaging
WHERE 
    amount < 0
ORDER BY tran_date;

-- Insert into the Amex table
TRUNCATE TABLE Amex;
INSERT INTO Amex (tran_date, tran_details,amount)
SELECT
    TRY_CAST(tran_date AS DATE) AS tran_date,
    tran_description,
    amount
FROM AmexStaging
WHERE 
    amount > 0
ORDER BY tran_date; 

-- Insert all the expenses in one master table - PersonalExpenses
TRUNCATE TABLE PersonalExpenses;
INSERT INTO PersonalExpenses (tran_date, tran_details, amount,payment_method,category)
(
SELECT 
    tran_date,
    tran_details,
    amount,
    'Amex'          AS payment_method,
    category 
FROM Amex
UNION
SELECT 
    tran_date,
    tran_details,
    ABS(amount)     AS amount, -- adding ABS as the expenses in commbank comes through as negative
    'CommBank'      AS payment_method,
    category
FROM CommBank
);

-- Clear out the records from the staging tables
TRUNCATE TABLE CommBankStaging;
TRUNCATE TABLE AmexStaging;

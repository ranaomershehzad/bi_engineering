USE ExpensesDB;
SET DATEFORMAT dmy;

-- -- Insert into the CommBank table
-- TRUNCATE TABLE CommBank;
-- INSERT INTO CommBank (tran_date, tran_details,amount)
-- SELECT
--     TRY_CAST(tran_date AS DATE) AS tran_date,
--     tran_details,
--     amount
-- FROM CommBankStaging
-- WHERE 
--     amount < 0
-- ORDER BY tran_date;

-- -- Insert into the Amex table
-- TRUNCATE TABLE Amex;
-- INSERT INTO Amex (tran_date, tran_details,amount)
-- SELECT
--     TRY_CAST(tran_date AS DATE) AS tran_date,
--     tran_description,
--     amount
-- FROM AmexStaging
-- WHERE 
--     amount > 0
-- ORDER BY tran_date; 

-- Insert all the expenses in one master table - PersonalExpenses

TRUNCATE TABLE PersonalExpenses;

WITH filterted_expenses AS (
    SELECT 
    tran_date,
    tran_details,
    amount,
    'Amex'          AS payment_method
FROM Amex
UNION
SELECT 
    tran_date,
    tran_details,
    ABS(amount)     AS amount, -- adding ABS as the expenses in commbank comes through as negative
    'CommBank'      AS payment_method
FROM CommBank
)

INSERT INTO PersonalExpenses (tran_date, tran_details, amount,payment_method,cat_id)
SELECT 
    fe.tran_date, 
    fe.tran_details, 
    fe.amount,
    fe.payment_method,
    c.cat_id
FROM filterted_expenses fe
OUTER APPLY (
    SELECT TOP 1 cat_id
    FROM ExpenseCategory c
    WHERE fe.tran_details LIKE '%' + c.exp_name + '%'
) c;

-- Clear out the records from the staging tables
TRUNCATE TABLE CommBankStaging;
TRUNCATE TABLE AmexStaging;
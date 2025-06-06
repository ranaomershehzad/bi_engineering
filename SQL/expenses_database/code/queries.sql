USE ExpensesDB;
SET DATEFORMAT dmy;

-- Update the CommBank table
INSERT INTO CommBank (tran_date, tran_details,amount)
SELECT
    TRY_CAST(tran_date AS DATE) AS tran_date,
    tran_details,
    amount
FROM CommBankStaging
WHERE 
    amount < 0
ORDER BY tran_date;



SELECT * FROM CommBankStaging;
SELECT * FROM AmexStaging;
SELECT * FROM Amex;
SELECT * FROM CommBank;







-- SELECT  
--     TRY_CAST(PARSE(tran_date AS DATE USING 'en-GB') AS DATE) AS tran_date,
--     tran_details,
--     amount
-- FROM CommBankStaging
-- ORDER BY tran_date;
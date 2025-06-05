USE ExpensesDB;
TRUNCATE TABLE CommBankStaging;
TRUNCATE TABLE AmexStaging;

BULK INSERT CommBankStaging
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\comm_bank_jan_apr_25.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

BULK INSERT CommBankStaging
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\comm_bank_may25.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

BULK INSERT AmexStaging
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\amex_jan_may_25.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM CommBankStaging;
SELECT *FROM AmexStaging;
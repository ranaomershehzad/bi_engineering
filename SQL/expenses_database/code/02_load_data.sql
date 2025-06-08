USE ExpensesDB;
TRUNCATE TABLE CommBankStaging;
TRUNCATE TABLE AmexStaging;
TRUNCATE TABLE Categories;

-- CommBank Staging (Jan-Apr)
BULK INSERT CommBankStaging
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\comm_bank_jan_apr_25.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

-- CommBank Staging (May)
BULK INSERT CommBankStaging
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\comm_bank_may25.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

-- Amex Staging
BULK INSERT AmexStaging
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\amex_jan_may_25.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Category
BULK INSERT Categories
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\category_master.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Expense Category
BULK INSERT ExpenseCategory
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\expense_categories.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Categories;
SELECT * FROM CommBankStaging;
SELECT *FROM AmexStaging;
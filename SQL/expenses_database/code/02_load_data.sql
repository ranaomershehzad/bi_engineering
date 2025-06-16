TRUNCATE TABLE CommBank;
TRUNCATE TABLE Amex;
-- TRUNCATE TABLE Categories;

-- CommBank (Jan-May)
BULK INSERT CommBank
FROM 'C:\Users\Omer.Shehzad\Documents\bi_engineering\SQL\expenses_database\raw_data\commbank_jan_may_25.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

-- Amex
BULK INSERT Amex
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
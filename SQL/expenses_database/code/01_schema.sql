
USE ExpensesDB;

-- DROP TABLE PersonalExpenses;
-- DROP TABLE Amex;
-- DROP TABLE CommBank; 
-- DROP TABLE Categories;
-- DROP TABLE ExpenseCategory

-- PersonalExpenses

CREATE TABLE PersonalExpenses (
   tran_id          INT IDENTITY(1,1) PRIMARY KEY,
   tran_date        DATE NOT NULL,
   tran_details     NVARCHAR(255),
   amount           DECIMAL(10,2) NOT NULL,
   cat_id           INT,
   payment_method   NVARCHAR(8)
);

-- tran_date,tran_details,amount,category
-- Amex
CREATE TABLE Amex (
   tran_date        NVARCHAR(10),
   tran_details     NVARCHAR(255),
   amount           DECIMAL(10,2) NOT NULL,
   category         NVARCHAR(100)
);

-- Amex Staging
CREATE TABLE AmexStaging (
   tran_date        NVARCHAR(10),
   date_processed   NVARCHAR(10),
   tran_description NVARCHAR(100),
   amount           DECIMAL(10,2) NOT NULL
);

-- tran_date,tran_details,amount,category
-- CommBank
CREATE TABLE CommBank (
   tran_date    NVARCHAR(10),
   tran_details NVARCHAR(255),
   amount       DECIMAL(10,2) NOT NULL,
   category     NVARCHAR(100)
);

-- CommBank Staging
CREATE TABLE CommBankStaging (
   tran_date    NVARCHAR(10),
   amount       DECIMAL(10,2) NOT NULL,
   tran_details NVARCHAR(255),
   total_amount NVARCHAR(10),
);

-- Categories
CREATE TABLE Categories (
   cat_id      INT PRIMARY KEY,
   cat_type    NVARCHAR(20),
   cat_filter  NVARCHAR(3)
);

-- Expense Categories
CREATE TABLE ExpenseCategory (
   exp_name    NVARCHAR(50),
   cat_id      INT
   FOREIGN KEY (cat_id) REFERENCES Categories(cat_id)
);
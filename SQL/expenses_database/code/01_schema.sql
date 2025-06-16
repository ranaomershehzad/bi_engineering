
-- DROP TABLE Categories;
-- DROP TABLE ExpenseCategory;
-- DROP TABLE PersonalExpenses;
-- DROP TABLE Amex;
-- DROP TABLE CommBank;

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

-- Amex
CREATE TABLE Amex (
   tran_date        NVARCHAR(10),
   date_processed   NVARCHAR(10),
   tran_details     NVARCHAR(255),
   amount           DECIMAL(10,2) NOT NULL
);

-- CommBank
CREATE TABLE CommBank (
   tran_date    NVARCHAR(10),
   amount       DECIMAL(10,2) NOT NULL,
   tran_details NVARCHAR(255),
   total_amount DECIMAL(10,2)
);

-- PersonalExpenses
CREATE TABLE PersonalExpenses (
   expense_id       INT IDENTITY(1,1) PRIMARY KEY,
   tran_date        DATE NOT NULL,
   tran_details     NVARCHAR(255),
   amount           DECIMAL(10,2) NOT NULL,
   payment_method   NVARCHAR(8),
   cat_id           INT 
   FOREIGN KEY (cat_id) REFERENCES Categories(cat_id)
);
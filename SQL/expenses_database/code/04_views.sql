USE ExpensesDB
GO
-- exclude a number of keywords (making a scalable solution so further words can be added)
-- filter using NOT EXISTS

DROP VIEW dbo.v_filtered_personal_expenses; 
GO

CREATE VIEW v_filtered_personal_expenses AS (
SELECT pe.*
FROM PersonalExpenses pe
INNER JOIN Categories c ON pe.cat_id = c.cat_id
WHERE c.cat_filter = 'Yes'
);
GO

DROP VIEW dbo.v_total_monthly_expense; 
GO

CREATE VIEW v_total_monthly_expense AS (
SELECT 
    DATEPART(YEAR, tran_date)  AS tran_year,
    DATENAME(MONTH, tran_date) AS month_name,
    SUM(amount) as total_monthly_expense
FROM PersonalExpenses pe
WHERE category NOT IN ('Personal','Car Expenses','Visa','Remmitance','Savings','Visa')
GROUP BY DATEPART(MONTH, tran_date),DATEPART(YEAR, tran_date), DATENAME(MONTH, tran_date)
-- ORDER BY DATEPART(YEAR, tran_date), DATEPART(MONTH, tran_date)
);
GO
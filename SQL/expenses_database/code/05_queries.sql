USE ExpensesDB;

-- Find the top 20 most expensive purchases excluding 'Rent' and 'Tax'
SELECT 
    TOP 20 * 
FROM v_filtered_personal_expenses
WHERE category <>  ('Rent')
ORDER BY amount DESC;

-- Highest transaction each month - only display month name and amount
WITH highest_monthly_tran AS (
SELECT 
    DATEPART(MONTH, tran_date) AS month_num, -- to keep the order of the month right
    DATENAME(MONTH, tran_date) AS month_name,
    MAX(amount) AS max_amount
FROM 
    v_filtered_personal_expenses
GROUP BY 
    DATENAME(MONTH, tran_date),
    DATEPART(MONTH, tran_date)
)
SELECT hmt.month_name, pe.tran_details, hmt.max_amount
FROM highest_monthly_tran hmt
INNER JOIN v_filtered_personal_expenses pe ON hmt.max_amount = pe.amount;


-- Top 3 transactions from each month (can solve this in two ways)

-- 1. CTE query
WITH three_monthly_tran AS (
SELECT 
    tran_ID,
    DATENAME(MONTH, tran_date) AS month_name,
    tran_details,
    amount,
    RANK() OVER(PARTITION BY DATEPART(MONTH, tran_date) ORDER BY amount DESC) Rank
FROM 
    PersonalExpenses
)
SELECT tran_ID, month_name, tran_details, amount 
FROM three_monthly_tran
WHERE Rank <= 3;

-- 2. Sub-query
SELECT tran_ID, DATENAME(MONTH,tran_date) AS month_name, tran_details, amount
FROM (
    SELECT tran_ID, tran_date, tran_details, amount,
           ROW_NUMBER() OVER (
               PARTITION BY DATEPART(YEAR, tran_date), DATEPART(MONTH, tran_date)
               ORDER BY amount DESC
           ) as row_num
    FROM PersonalExpenses
) as ranked_transactions
WHERE row_num <= 3
ORDER BY tran_date;



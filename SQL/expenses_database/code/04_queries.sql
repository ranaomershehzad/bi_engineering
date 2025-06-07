USE ExpensesDB;

-- Find the top 20 most expensive purchases
SELECT 
    TOP 20 * 
FROM PersonalExpenses
ORDER BY amount DESC;

-- Highest transaction each month - only display month name and amount
WITH highest_monthly_tran AS (
SELECT 
    DATEPART(MONTH, tran_date) AS month_num,
    DATENAME(MONTH, tran_date) AS month_name,
    MAX(amount) AS max_amount
FROM 
    PersonalExpenses
GROUP BY 
    DATENAME(MONTH, tran_date),
    DATEPART(MONTH, tran_date)
)
SELECT month_name, max_amount 
FROM highest_monthly_tran;






/* Filter Expenses

WHERE   tran_details NOT LIKE '%bobby%'
    AND tran_details NOT LIKE '%american express%'
    AND tran_details NOT LIKE '%transfer to Omer%'
    AND tran_details NOT LIKE '%mahant guru%'
    AND tran_details NOT LIKE '%worldremit%'
    AND tran_details NOT LIKE '%committee%'
    AND tran_details NOT LIKE '%u 21 55 fl%'

    -- temp table of excluded keywords
CREATE TABLE #exclude_keywords (keyword VARCHAR(100));
INSERT INTO #exclude_keywords VALUES ('fuel'), ('coffee'), ('uber');

-- filter using NOT EXISTS
SELECT *
FROM your_table t
WHERE NOT EXISTS (
    SELECT 1
    FROM #exclude_keywords e
    WHERE t.description LIKE '%' + e.keyword + '%'
);

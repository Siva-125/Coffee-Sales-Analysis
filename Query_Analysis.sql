-- ----------------
-- Query Analysis
-- ----------------

-- 1. How many Cash and Card Payments?
SELECT 
	cash_type,
	COUNT(cash_type) AS Total_Sales
FROM Sales
GROUP BY cash_type;

-- 2. On which months Sales are high?
SELECT 
	TO_CHAR(purchase_Date,'Month') AS High_Sales_Month, 
	COUNT(purchase_Date) AS Total_Sales
FROM Sales
GROUP BY High_Sales_Month
ORDER BY Total_Sales DESC
LIMIT 3;

-- 3. Which item Sales most?
SELECT 
	coffee_name AS Item_name, 
	COUNT(coffee_name) AS Total_Sales
FROM Sales
GROUP BY Item_name
ORDER BY Total_Sales DESC
LIMIT 3;

-- 4. Average Income(Monthly)
SELECT 
	ROUND(AVG(income):: numeric,2) AS avg_income_per_month
FROM (
	SELECT 
		TO_CHAR(purchase_Date,'Month') AS month, SUM(money_paid) AS income
	FROM Sales
	GROUP BY month
) AS Monthly_income;

-- 5. Most Sales Timing
SELECT
	CASE
		WHEN EXTRACT( HOUR FROM time) BETWEEN 6 AND 11 THEN 'Morning'
		WHEN EXTRACT( HOUR FROM time) BETWEEN 12 AND 16 THEN 'Afternoon'
		WHEN EXTRACT( HOUR FROM time) BETWEEN 17 AND 22 THEN 'Evening'
	END AS time_period,
	COUNT(time) AS total_sales
FROM Sales
GROUP BY time_period
ORDER BY total_sales DESC
LIMIT 1;

-- 6. Which Coffees Dominates Our Menu?
SELECT 
	coffee_label,
	COUNT(money_paid) AS total_sales
FROM (
	SELECT 
		CASE
			WHEN coffee_name IN(
				SELECT coffee_name
				FROM Sales
				GROUP BY  coffee_name
				ORDER BY COUNT(money_paid) DESC
				LIMIT 5
			)
			THEN coffee_name
			ELSE 'Others'
		END AS coffee_label,
		money_paid
	FROM Sales
) AS labeled_sales
GROUP BY coffee_label
ORDER BY total_sales DESC;
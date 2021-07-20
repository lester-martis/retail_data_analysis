/*1. Exploring entire data set (only for 2020)*/
SELECT
	*
FROM
	retailsale;

/*2. Top performing days on average in a year 2020 and 2021.*/
-- Query to retrieve the data to find out the top performing days in 2020
SELECT
	day,
    ROUND(AVG(day_sale), 2) AS avgsale_day
FROM
	retailsale
WHERE date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY day
ORDER BY avgsale_day DESC;

/*3. Month wise sales in year 2020*/
-- Note : There was no any business in the month of April and May due to covid lockdown
SELECT 
	MONTHNAME(date) AS sales_2020,
    ROUND(SUM(day_sale),2) AS Total_Sale
FROM
	retailsale
    WHERE date BETWEEN '2020-01-01' AND '2020-12-31' 
    GROUP BY sales_2020;

/*4. Target Vs Achievement in 2020
Note : There was no any business in the month of April and May due to covid lockdown*/
SELECT
	MONTHNAME(date) AS Month_2020,
    SUM(day_target) AS Month_Target,
    ROUND(SUM(day_sale), 2) AS Achieved,
    ROUND((SUM(day_sale) / SUM(day_target) * 100), 2) AS Achievement_Rate
FROM
	retailsale
WHERE date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY Month_2020;

/*5. Main Business Insights of Store in year 2020. (To be displayed in dash board in numbers format as a main KPIs)*/
SELECT
	ROUND(SUM(day_sale), 2) AS 2020_Turnover,
    SUM(trans_unit) AS Total_Customers,
    SUM(sold_qty) AS Sold_Items_Quanity,
    ROUND((SUM(day_sale) / SUM(trans_unit)), 2) AS Avg_Trans_Value,
    ROUND((SUM(day_sale) / SUM(sold_qty)), 2) AS Single_Sold_Item_Value,
    ROUND(SUM(sold_qty) / SUM(trans_unit), 2) AS Avg_Purchase_Rate
FROM
	retailsale
WHERE date BETWEEN '2020-01-01' AND '2020-12-31';
  

-- 6. How customer prefers to make the payment (Donut chart can be used to visualize)
SELECT
YEAR(date) AS Year,
	ROUND((SUM(cash_pay) / SUM(day_sale)) * 100, 0) AS CashPayRate,
    ROUND((SUM(card_pay) / SUM(day_sale)) * 100, 0) AS cardPayRate
FROM
	retailsale
GROUP BY Year;

/* 7. Trend in customers' payment choices monthwise in 2020.
(This is to analyze how covid panedemic has affected the customers' payment preferences)*/
SELECT
	MONTHNAME(date) AS Month,
    ROUND((SUM(cash_pay) / SUM(day_sale) * 100), 1) AS cashPay,
    ROUND((SUM(card_pay) / SUM(day_sale) * 100), 1) AS cardPay
FROM
	retailsale
WHERE date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY Month;


/* 8. Monthwise APR (Average Purchase Rate) in the year 2020 */
SELECT
	MONTHNAME(date) AS Month_2020,
    ROUND((sold_qty / trans_unit), 2) AS Avg_Purch_Rate
FROM
	retailsale
WHERE date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY Month_2020
ORDER BY Month_2020 ASC;

/* 9. Monthwise ATV (Average Transaction Value) in the year 2020 */
SELECT
    MONTHNAME(date) AS Month_2020,
    ROUND((day_sale / trans_unit), 2) AS Avg_Trans_Value
FROM
	retailsale
WHERE DATE between '2020-01-01' AND '2020-12-31'
GROUP BY Month_2020;



    

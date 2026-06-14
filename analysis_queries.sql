-- 1. Total Sales and Profit by Region
-- Insight: Central region has a NEGATIVE avg profit margin (-10.41%)
SELECT region, 
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(AVG(profit_margin), 2) AS avg_profit_margin
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- 2. Top 10 Customers by Sales
SELECT customer_name,
       ROUND(SUM(sales), 2) AS total_sales,
       COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- 3. Monthly Sales Trend
SELECT order_year, order_month,
       ROUND(SUM(sales), 2) AS monthly_sales
FROM sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- 4. Product Sub-Categories with Negative Profit
-- Note: column name uses hyphen, so it's quoted as "sub-category"
SELECT category, "sub-category",
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY category, "sub-category"
HAVING total_profit < 0
ORDER BY total_profit ASC;

-- 5. Shipping Performance by Mode
SELECT ship_mode,
       ROUND(AVG(shipping_days), 1) AS avg_shipping_days,
       COUNT(*) AS total_orders
FROM sales
GROUP BY ship_mode
ORDER BY avg_shipping_days;

-- 6. Top 5 Products by Profit Margin (min $1000 sales)
SELECT product_name, category,
       ROUND(AVG(profit_margin), 2) AS avg_margin,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY product_name, category
HAVING total_sales > 1000
ORDER BY avg_margin DESC
LIMIT 5;
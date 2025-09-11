-- 1. Find all orders where the unit price is missing or invalid.

SELECT *
FROM sales4
WHERE unit_price IS NULL OR unit_price <= 0;

-- 2. Count how many customers are from India.

SELECT COUNT(DISTINCT customer_id) AS indian_customers
FROM sales4
WHERE country = 'India';

--3. Which product category generates the highest average revenue per order?
SELECT product_category,
       ROUND(AVG(quantity * unit_price), 2) AS avg_order_revenue
FROM sales4
GROUP BY product_category
ORDER BY avg_order_revenue DESC
LIMIT 1;

--4. Find the top 3 cities with the highest total sales.
SELECT city, 
       SUM(quantity * unit_price) AS total_sales
FROM sales4
GROUP BY city
ORDER BY total_sales DESC
LIMIT 3;


-- Data Cleaning & Preparation:

-- 1. Find NULL values in the table
SELECT * FROM sales4
WHERE customer_name IS NULL OR city IS NULL OR unit_price IS NULL;
--Insight: Ensures data completeness. No null values → dataset is clean.

-- 2. Find duplicate orders (same customer, same product, same date)
SELECT customer_id, product_id, order_date, COUNT(*) AS dup_count
FROM sales4
GROUP BY customer_id, product_id, order_date
HAVING COUNT(*) > 1;
--Insight: Duplicate orders (if any) could mean data entry issues or repeat purchases.

-- 3. Detect invalid ages (less than 10 or greater than 90)
SELECT * FROM sales4
WHERE age < 10 OR age > 90;
--Insight: Validates customer demographic data.

-- 4. Clean up city names (example: trim spaces & standardize case)
SELECT DISTINCT city, UPPER(TRIM(city)) AS cleaned_city
FROM sales4;
--Insight: Prevents inconsistencies like “new york” vs “New York”.

-- Descriptive Business Insights:

-- 5. Total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM sales4;
--Insight: Provides overall business performance (e.g., ₹X million revenue).

-- 6. Revenue by product category
SELECT product_category, SUM(quantity * unit_price) AS revenue
FROM sales4
GROUP BY product_category
ORDER BY revenue DESC;
--Insight: Identifies top-performing product categories.

-- 7. Top 5 customers by total spend
SELECT customer_name, SUM(quantity * unit_price) AS total_spent
FROM sales4
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;
--Insight: Shows key customers driving revenue.

-- 8. Orders by gender
SELECT gender, COUNT(order_id) AS total_orders
FROM sales4
GROUP BY gender;
-- Insight: Helps understand gender-based buying behavior.

-- 9. Revenue by country
SELECT country, SUM(quantity * unit_price) AS revenue
FROM sales4
GROUP BY country
ORDER BY revenue DESC;
--Insight: Highlights top markets geographically.

-- Time-Based Trends:

-- 10. Monthly revenue trend
SELECT DATE_TRUNC('month', order_date) AS month, 
       SUM(quantity * unit_price) AS revenue
FROM sales4
GROUP BY month
ORDER BY month;
--Insight: Shows seasonal or monthly revenue fluctuations.

-- 11. Best-selling product each year
SELECT EXTRACT(YEAR FROM order_date) AS year, 
       product_category, 
       SUM(quantity) AS total_qty
FROM sales4
GROUP BY year, product_category
ORDER BY year, total_qty DESC;
--Insight: Identifies annual category leaders.

-- 12. Average order value over time
SELECT DATE_TRUNC('month', order_date) AS month,
       AVG(quantity * unit_price) AS avg_order_value
FROM sales4
GROUP BY month
ORDER BY month;
--Insight: Helps track customer purchasing power.

-- Customer Segmentation & Patterns:

-- 13. Revenue by age group
SELECT CASE 
          WHEN age BETWEEN 18 AND 25 THEN '18-25'
          WHEN age BETWEEN 26 AND 35 THEN '26-35'
          WHEN age BETWEEN 36 AND 50 THEN '36-50'
          ELSE '51+'
       END AS age_group,
       SUM(quantity * unit_price) AS revenue
FROM sales4
GROUP BY age_group
ORDER BY revenue DESC;
--Insight: Identifies most valuable customer age segment.

-- 14. Average spend by gender
SELECT gender, AVG(quantity * unit_price) AS avg_spend
FROM sales4
GROUP BY gender;
--Insight: Compares average purchase size across genders.

-- 15. Customers with repeat purchases
SELECT customer_id, COUNT(DISTINCT order_id) AS total_orders
FROM sales4
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;
--Insight: Recognizes loyal/repeat customers.

--Case Study Question: If Google wants to target ads, which age group and product category generate the highest revenue?

SELECT CASE 
          WHEN age BETWEEN 18 AND 25 THEN '18-25'
          WHEN age BETWEEN 26 AND 35 THEN '26-35'
          WHEN age BETWEEN 36 AND 50 THEN '36-50'
          ELSE '51+'
       END AS age_group,
       product_category,
       SUM(quantity * unit_price) AS revenue
FROM sales4
GROUP BY age_group, product_category
ORDER BY revenue DESC
LIMIT 1;
--Insight: This query directly translates into a marketing strategy — showing the most profitable customer segment for ad targeting.


Sales Data Analysis with SQL:

This repository contains a comprehensive SQL project analyzing a fictional sales dataset (sales4). The project demonstrates data cleaning, exploration, descriptive analytics, trend analysis, and customer segmentation using SQL queries. All the queries ware written in PostgreSQL and saved.

The goal is to extract actionable business insights and identify key patterns in sales data.

Dataset Overview:

The sales4 table contains transactional sales data with the following fields:

| Column            | Description                                    |
| ----------------- | ---------------------------------------------- |
| order\_id         | Unique identifier for each order               |
| customer\_id      | Unique identifier for each customer            |
| customer\_name    | Name of the customer                           |
| age               | Age of the customer                            |
| gender            | Gender of the customer                         |
| city              | Customer’s city                                |
| country           | Customer’s country                             |
| product\_id       | Unique identifier for the product              |
| product\_category | Product category (e.g., Electronics, Clothing) |
| quantity          | Number of units purchased                      |
| unit\_price       | Price per unit                                 |
| order\_date       | Date of the order                              |


Project Objectives:

1. Data Cleaning & Validation – Ensure dataset completeness, remove duplicates, and standardize inconsistent entries.

2. Descriptive Analytics – Understand total revenue, top customers, and product performance.

3. Time-Based Trends – Identify revenue trends over months and years.

4. Customer Segmentation – Analyze revenue by age, gender, repeat purchase behavior, and geography.

5. Strategic Insights – Highlight high-value customer segments for targeted marketing.

* Data Cleaning & Preparation:

1. Identify missing or invalid values:
Insight: Detects incomplete or incorrect pricing information.

2. Check for NULL values in important columns:
Insight: Ensures dataset completeness for accurate analysis.

3. Detect duplicate orders:
Insight: Identifies data entry issues or repeated purchases.

4. Validate customer age:
Insight: Ensures demographic data accuracy.

5. Standardize city names:
Insight: Prevents inconsistencies like “new york” vs “New York”.

* Descriptive Business Insights:

6. Total Revenue:
Insight: Provides overall business performance (e.g., ₹X million revenue).

7.Revenue by product category:
Insight: Identifies top-performing product categories.

8. Top 5 customers by total spend:
Insight: Shows key customers driving revenue.

9. Orders by gender:
Insight: Helps understand gender-based buying behavior.

10. Revenue by country:
Insight: Highlights top markets geographically.

* Time-Based Trends:

 11. Monthly revenue trend:
 Insight: Shows seasonal or monthly revenue fluctuations.

 12.  Best-selling product each year:
 Insight: Identifies annual category leaders.

13. Average order value over time:
Insight: Helps track customer purchasing power.

* Customer Segmentation & Patterns:

14. Revenue by age group:
Insight: Identifies most valuable customer age segment.

15. Average spend by gender:
Insight: Compares average purchase size across genders.

16. Customers with repeat purchases:
Insight: Recognizes loyal/repeat customers.

* Case Study Question: If Google wants to target ads, which age group and product category generate the highest revenue?
  
Insight: This query directly translates into a marketing strategy — showing the most profitable customer segment for ad targeting.



Key SQL Skills Demonstrated:

* Data cleaning & validation

* Aggregate functions (SUM, AVG, COUNT)

* Grouping & filtering (GROUP BY, HAVING)

* Date/time manipulation (DATE_TRUNC, EXTRACT)

* Ranking & ordering (ORDER BY, LIMIT)

* Conditional logic (CASE WHEN)


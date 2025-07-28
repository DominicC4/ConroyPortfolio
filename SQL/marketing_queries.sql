-- 1. Total revenue by product category
SELECT 
    category,
    ROUND(SUM(price * quantity), 2) AS total_revenue
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC;

-- 2. Top 5 selling products by volume
SELECT 
    product_name,
    SUM(quantity) AS total_units_sold
FROM sales_data
GROUP BY product_name
ORDER BY total_units_sold DESC
LIMIT 5;

-- 3. Monthly sales trends
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(price * quantity), 2) AS monthly_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- 4. Repeat customers vs one-time buyers
SELECT
    CASE 
        WHEN COUNT(DISTINCT order_id) > 1 THEN 'Repeat Customer'
        ELSE 'One-time Buyer'
    END AS customer_type,
    COUNT(DISTINCT customer_id) AS customer_count
FROM sales_data
GROUP BY customer_id;

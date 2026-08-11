/* Retail Sales Portfolio Project
File 3: Data Analysis

sales_base: used for revenues, units, invoice counts, dates


Business Questions:
1. What dates does the usable data cover? 
2. What is the overall scale of sales?
3. How does revenue vary month by month?
4. What drives revenue?
5. How do customer types vary?
6. Which days have the highest sales? */


-- 1. What dates are covered?
SELECT 
	MIN(invoice_date) AS first_invoice_date,
    MAX(invoice_date) AS last_invoice_date,
    COUNT(DISTINCT invoiceid) AS invoices_in_date_range
FROM sales_base;


-- 2. What is the overall scale of sales
SELECT 
	SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    COUNT(DISTINCT invoiceid) AS total_invoices,
    ROUND(SUM(revenue) / COUNT(DISTINCT invoiceid), 2) AS avg_revenue_per_invoice
FROM sales_base;


-- 3. How does revenue vary by month?
-- monthly trends can help identify growth, decline, and seasonality
SELECT 
	DATE_FORMAT(invoice_date, '%Y-%m') AS sales_month,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
	COUNT(DISTINCT invoiceid) AS total_invoices
FROM sales_base
GROUP BY DATE_FORMAT(invoice_date, '%Y-%m')
ORDER BY sales_month;

-- 4. What drives revenue?
-- revenue by category
SELECT 
	COALESCE(category, 'Unknown') AS category,
    SUM(revenue) AS category_revenue,
    SUM(units) AS category_units,
    COUNT(DISTINCT invoiceid) AS invoices_per_cat
FROM sales_base_extra
GROUP BY COALESCE(category, 'Unknown')
ORDER BY category_revenue DESC;

-- top revenue products
SELECT
    product_id,
    COALESCE(item, 'Unknown') AS item,
    COALESCE(category, 'Unknown') AS category,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units
FROM sales_base_extra
GROUP BY
    product_id,
    COALESCE(item, 'Unknown'),
    COALESCE(category, 'Unknown')
ORDER BY total_revenue DESC
LIMIT 10;


-- 5. How do customer types vary?
SELECT 
    COALESCE(customer_type, 'Unknown') AS customer_type,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    COUNT(DISTINCT invoiceid) AS total_invoices
FROM sales_base_extra
GROUP BY 
    COALESCE(customer_type, 'Unknown')
ORDER BY total_revenue DESC
LIMIT 10;

-- highest revenue customers
SELECT 
	customerid,
    COALESCE(customer_type, 'Unknown') AS customer_type,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    COUNT(DISTINCT invoiceid) AS total_invoices
FROM sales_base_extra
GROUP BY 
	customerid,
    COALESCE(customer_type, 'Unknown')
ORDER BY total_revenue DESC
LIMIT 10;

-- highest revenue private customers
SELECT 
	customerid,
    COALESCE(customer_type, 'Unknown') AS customer_type,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    COUNT(DISTINCT invoiceid) AS total_invoices
FROM sales_base_extra
WHERE customer_type = 'private'
GROUP BY 
	customerid,
    COALESCE(customer_type, 'Unknown')
ORDER BY total_revenue DESC
LIMIT 10;

-- 6. Which days are the highest earning
-- can help with staffing/shift patterns
SELECT 
	DAYNAME(invoice_date) AS weekday,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units
FROM sales_base
GROUP BY DAYNAME(invoice_date)
ORDER BY total_revenue DESC;




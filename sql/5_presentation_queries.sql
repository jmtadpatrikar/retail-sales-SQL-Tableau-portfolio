/* Retail Sales Portfolio Project
File 5: Presentation Queries */

-- Screenshot 1 - Headline KPIs
SELECT 
	total_revenue,
    total_units,
    total_invoices,
    avg_invoice_value
FROM kpi_dashboard;

-- Screenshot 2 - Monthly Sales Trends
SELECT 
	sales_month,
    total_revenue,
    total_units,
    total_invoices
FROM monthly_trends_dash
ORDER BY sales_month;

-- Screenshot 3 - Category Performance
SELECT 
	category,
    category_revenue,
    category_units,
    invoices_per_cat
FROM category_performance_dash
ORDER BY category_revenue DESC;

-- Screenshot 4 - Product Performance
SELECT 
	product_id,
    item,
    category,
    total_revenue,
    total_units
FROM product_performance_dash
ORDER BY total_revenue DESC;

-- Screenshot 5 - Customer Type Comparison
SELECT 
	customer_type,
    total_revenue,
    total_units,
    total_invoices
FROM customer_type_dash
ORDER BY total_revenue DESC;

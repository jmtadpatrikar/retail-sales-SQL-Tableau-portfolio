/* Retail Sales Portfolio Project
File 4: Dashboard Views

These views would feed Tableau, however the public version does not allow for MySQLWorkbench servers to be connected
The Tableau dashboard uses a modified version of sales_base_extra, without the customerid column. */

-- KPI view
-- total revenue, total units sold, total invoices, and avg invoice values
CREATE OR REPLACE VIEW kpi_dashboard AS
SELECT 
	SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    COUNT(DISTINCT invoiceid) AS total_invoices,
    SUM(revenue) / COUNT(DISTINCT invoiceid) AS avg_invoice_value
FROM sales_base;

-- Monthly Trends View
CREATE OR REPLACE VIEW monthly_trends_dash AS
SELECT 
	DATE_FORMAT(invoice_date, '%Y-%m') AS sales_month,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
	COUNT(DISTINCT invoiceid) AS total_invoices
FROM sales_base
GROUP BY DATE_FORMAT(invoice_date, '%Y-%m')
ORDER BY sales_month;

-- Category comparison View
CREATE OR REPLACE VIEW category_performance_dash AS
SELECT 
	COALESCE(category, 'Unknown') AS category,
    SUM(revenue) AS category_revenue,
    SUM(units) AS category_units,
    COUNT(DISTINCT invoiceid) AS invoices_per_cat
FROM sales_base_extra
GROUP BY COALESCE(category, 'Unknown')
ORDER BY category_revenue DESC;

-- Product performance view
CREATE OR REPLACE VIEW product_performance_dash AS
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
ORDER BY total_revenue DESC;

-- Customer type dashboard
CREATE OR REPLACE VIEW customer_type_dash AS
SELECT 
    COALESCE(customer_type, 'Unknown') AS customer_type,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    COUNT(DISTINCT invoiceid) AS total_invoices
FROM sales_base_extra
GROUP BY 
    COALESCE(customer_type, 'Unknown')
ORDER BY total_revenue DESC;


-- Preview for each dashboard veiw
SELECT * FROM kpi_dashboard;
SELECT * FROM monthly_trends_dash;
SELECT * FROM category_performance_dash;
SELECT * FROM product_performance_dash; 
SELECT * FROM customer_type_dash; 

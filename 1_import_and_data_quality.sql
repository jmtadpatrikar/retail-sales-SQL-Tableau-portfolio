/* Retail Sales Portfolio Project
File 1: Import notes and data quality checks


IMPORT NOTES

1. retail_project schema was created
2. Four raw data files were downloaded from Kaggle
and imported into MySQL Workbench using the Table Import Wizard

Required Tables:
- customers (customerid, customer_type)
- invoice_items (invoiceid, product_id, quantity, price, line_total_
- products (product_id, item, category, price)
- purchases (invoiceid, date, customerid, product_id, quantity)


Modelling Rules:
- Primary key were not applied too invoiceid
- One invoiceid can have multiple rows containing the same product

Source tables will remain raw, cleaning and analysis will utilise views. */

-- Ensure all required tables exist
SHOW TABLES LIKE 'customers';
SHOW TABLES LIKE 'products';
SHOW TABLES LIKE 'purchases';
SHOW TABLES LIKE 'invoice_items';

-- Column names and types
SELECT
    table_name,
    column_name,
    column_type
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name IN ('customers', 'products', 'purchases', 'invoice_items')
ORDER BY
    FIELD(table_name, 'customers', 'products', 'purchases', 'invoice_items'),
    ordinal_position;
    
    
    
/* DATA QUALITY CHECKS */
-- these checks should be ran against raw tables
-- problems and solutions will be recorded where applicable


-- sample of data from each table

SELECT * 
FROM customers
LIMIT 10;
SELECT * 
FROM invoice_items
LIMIT 10;
SELECT * 
FROM products
LIMIT 10;
SELECT * 
FROM purchases
LIMIT 10;

-- compare row counts to intended counts from source
SELECT 
	'customers' AS source_table,
    COUNT(*) AS row_count
FROM customers
UNION
SELECT 
	'invoice_items' AS source_table,
    COUNT(*) AS row_count
FROM invoice_items
UNION
SELECT 
	'products' AS source_table,
    COUNT(*) AS row_count
FROM products
UNION
SELECT 
	'purchases' AS source_table,
    COUNT(*) AS row_count
FROM purchases;
-- row counts match, import is noted as successful

-- duplicate check 
-- customerid should be unique in the customer table
-- product_id should be unique in the product table

SELECT 
	customerid,
    COUNT(*)
FROM customers
GROUP BY customerid
HAVING COUNT(*) > 1;

SELECT 
	product_id,
    COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- both queries returned no results, product_id and customerid are unique


-- VALIDATION
-- each invoice must have
	-- non null with one customerid
	-- non null with one date

SELECT
    invoiceid,
    COUNT(*) AS purchase_rows,
    COUNT(DISTINCT customerid) AS distinct_customers,
    COUNT(DISTINCT date) AS distinct_dates,
    SUM(customerid IS NULL) AS missing_customer_rows,
    SUM(date IS NULL) AS missing_date_rows
FROM purchases
GROUP BY invoiceid
HAVING invoiceid IS NULL
    OR COUNT(DISTINCT customerid) != 1
    OR COUNT(DISTINCT date) != 1
    OR SUM(customerid IS NULL) > 0
    OR SUM(date IS NULL) > 0;
    

-- an exact duplicate is not allowed in the cleaned data
-- duplicates where only invoiceid and product_id match
-- are allowed, and are treated as seperate purchases
		-- refered to as an invoice/product pair

-- check for duplicates where only
	-- invoiceid and product_id match
SELECT 
	invoiceid,
    product_id,
    COUNT(*) AS invoice_product_pair_count
FROM invoice_items
GROUP BY 
	invoiceid, product_id
HAVING COUNT(*) > 1;

-- check for exact duplicates in invoice_items
SELECT 
	invoiceid,
    product_id,
    quantity,
    price,
    line_total,
    COUNT(*) AS exact_duplicate_count
FROM invoice_items
GROUP BY
	invoiceid,
    product_id,
    quantity,
    price,
    line_total
HAVING COUNT(*) > 1;
-- these duplicates will be removed when cleaning and creating views

-- review for missing values or negatives
SELECT
    InvoiceID,
    product_id,
    quantity,
    price,
    line_total
FROM invoice_items
WHERE InvoiceID IS NULL
   OR product_id IS NULL
   OR quantity IS NULL
   OR price IS NULL
   OR line_total IS NULL
   OR quantity = 0
   OR price < 0
   OR line_total < 0;
   
   
-- comparison of raw line_total is a true representation
	-- line_total = quantity * price
SELECT 
	invoiceid,
    product_id,
    quantity,
    price,
    line_total,
	ROUND(quantity * price, 2) AS calculated_line_total
FROM invoice_items
WHERE ROUND(line_total, 2) != ROUND(quantity * price, 2)

    
    


/* Retail Sales Portfolio Project

File 2: Creating views of cleaned data
maintains raw data in the original tables */

-- 1. Removal of exact duplicates from invoice_items
		-- only exact duplicates removed
			-- invoiceid and product_id can appear on multiple rows


CREATE OR REPLACE VIEW c_invoice_items AS
SELECT
	DISTINCT invoiceid,
    product_id,
    quantity,
    price,
    line_total
FROM invoice_items;

-- check exact duplicates have been removed
SELECT
    InvoiceID,
    product_id,
    quantity,
    price,
    line_total,
    COUNT(*) AS occurrences
FROM c_invoice_items
GROUP BY InvoiceID, product_id, quantity, price, line_total
HAVING COUNT(*) > 1;

-- check row counts of raw and cleaned table
SELECT 
	COUNT(*) AS raw_rows,
    (
		SELECT COUNT(*)
        FROM c_invoice_items
	) AS cleaned_rows,
    COUNT(*) - (
		SELECT COUNT(*)
        FROM c_invoice_items
	) AS rows_removed
FROM invoice_items;


-- 2. Create a view for invoice_headers
		-- contains one row per invoiceid
        -- includes (invoiceid, customerid, date)
        -- creates one row per invoice
CREATE OR REPLACE VIEW invoice_headers AS
SELECT 
	invoiceid,
	customerid,
    MIN(date) AS invoice_date
FROM purchases
WHERE invoiceid IS NOT NULL
GROUP BY invoiceid, customerid
ORDER BY invoiceid;

-- using both c_invoice_items and invoice_headers
-- create one view for all information

CREATE OR REPLACE VIEW sales_base AS
SELECT 
	h.invoiceid,
    h.customerid,
    h.invoice_date,
    ii.product_id,
    ii.quantity AS units,
    ii.price AS unit_price,
    ii.line_total AS revenue
FROM invoice_headers h
JOIN c_invoice_items ii
	USING(invoiceid);
    
    
-- addtional view created to include customer and product information
CREATE OR REPLACE VIEW sales_base_extra AS
SELECT
    s.invoiceid,
    s.invoice_date,
    s.customerid,
    c.customer_type,
    s.product_id,
    pr.item,
    pr.category,
    s.units,
    s.unit_price,
    s.revenue
FROM sales_base s
LEFT JOIN customers c
    USING(customerid)
LEFT JOIN products pr
	USING(product_id);
    
    
-- checks for each view
SELECT 'invoice_items' AS view_name,
	COUNT(*)
FROM c_invoice_items
UNION
SELECT 'invoice_headers', COUNT(*)
FROM invoice_headers
UNION
SELECT 'sales_base', COUNT(*)
FROM sales_base
UNION
SELECT 'sales_base_extra', COUNT(*)
FROM sales_base_extra;

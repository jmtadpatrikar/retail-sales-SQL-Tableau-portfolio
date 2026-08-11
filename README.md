# MySQL Retail Sales Analysis

A SQL portfolio project that analyzes retail sales data using MySQL.

## Project overview

This project demonstrates practical SQL skills through a retail sales dataset. It covers data cleaning, exploratory analysis, and business-focused queries.

## Dataset

This project uses the [Retail Dataset on Kaggle](https://www.kaggle.com/datasets/matteo2002/retail-dataset).

- **Source:** Kaggle
- **Accessed:** 11 August 2026
- **Tables used:** `customers`, `products`, `purchases`, and `invoice_items`
- **Data availability:** The raw dataset is not included in this repository. Download it from Kaggle, then import the files into MySQL before running the SQL scripts.
- **License:** Refer to the dataset page for its usage terms.

## Tools used

- MySQL
- MySQL Workbench
- Tableau Public

## Repository structure

- `sql/` — five SQL scripts used in this project
- `screenshots/` - dashboard query screenshots

## SQL workflow

What each script covers:

[1_import_and_data_quality.sql](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/ce986df232bf3bcc7d2244f125de7dac74f6df45/sql/1_import_and_data_quality.sql)

Documents the raw imported tables and performs data-quality checks, including table and column validation, row counts, duplicate checks, invoice consistency, missing or invalid values, and line-total verification.
 
[2_creating_usable_views.sql](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/ce986df232bf3bcc7d2244f125de7dac74f6df45/sql/2_creating_usable_views.sql)

Creates cleaned analytical views while preserving the original raw tables. It removes exact invoice-item duplicates, builds invoice-level headers, and combines sales, customer, and product information into reusable views.

[3_business_analysis.sql](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/9d6fc280b965baa8b59fc3d1e12c1221d98d5738/sql/3_business_analysis.sql)

Answers key retail business questions: sales date coverage, overall revenue and invoice scale, monthly trends, category and product performance, customer analysis, and highest-revenue weekdays.

[4_dashboard_queries.sql](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/9d6fc280b965baa8b59fc3d1e12c1221d98d5738/sql/4_dashboard_queries.sql)

Creates Tableau-ready dashboard views for headline KPIs, monthly trends, category performance, product performance, and customer-type comparisons.

[5_presentation_queries.sql](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/9d6fc280b965baa8b59fc3d1e12c1221d98d5738/sql/5_presentation_queries.sql)

Retrieves the five presentation-ready result sets used Tableau Public Dashboard: headline KPIs, monthly sales trends, category performance, product performance, and customer-type comparisons.

## Skills demonstrated

- Data cleaning
- Aggregations and grouping
- Joins
- Business analysis
- MySQL

## 📊 Explore the interactive Tableau dashboard

> Explore retail revenue, monthly trends, category and product performance, and customer-type comparisons.

[**Open the interactive Tableau dashboard →**](https://public.tableau.com/views/retail_sales_dashboard_17864661943300/RetailSalesPerformanceDashboard?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


## Key insights

- The cleaned dataset covers 1 January 2014 to 30 December 2015, with 33,499 invoices.

- Exact duplicate invoice-item rows were removed during cleaning: 5,426 rows were excluded while valid repeated invoice/product purchases were retained.

- Total revenue was 9,307,314.40 in the dataset’s currency, from 5,261,943 units, with an average invoice value of 277.84.

- November 2015 was the strongest sales month, generating 1,176,130.79 in revenue.

- Kitchen & Dining was the highest-revenue category, contributing 2,253,891.45 in revenue.

- Wholesale customers generated 73.6% of total revenue, making them the largest customer segment by sales value.

- Tuesday was the highest-revenue weekday, generating 2,033,255.64 in revenue.


## Supporting SQL Results
### Headline KPIs

[View the highlighted SQL query](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/main/sql/5_presentation_queries.sql#L5-L10)

[Open the Headline KPI screenshot](Screenshots/1-headline-kpis.png)


### Monthly sales trends

[View the highlighted SQL query](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/main/sql/5_presentation_queries.sql#L13-L19)

[Open the Monthly Sales Trends screenshot](Screenshots/2-monthly-sales-trends.png)


### Category performance

[View the highlighted SQL query](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/main/sql/5_presentation_queries.sql#L22-L28)

[Open the Category Performance screenshot](Screenshots/3-category-performance.png)


### Product performance

[View the highlighted SQL query](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/main/sql/5_presentation_queries.sql#L31-L38)

[Open the Product Performance screenshot](Screenshots/4-product-performance.png)


### Customer-type comparison

[View the highlighted SQL query](https://github.com/jmtadpatrikar/retail-sales-SQL-portfolio/blob/main/sql/5_presentation_queries.sql#L41-L47)

[Open the Customer-Type Comparison screenshot](Screenshots/5-customer-type-comparison.png)

## How to run the project

1. Import the raw CSV files into MySQL Workbench as the four required tables.
2. Run 1_import_and_data_quality.sql.
3. Run 2_creating_usable_views.sql.
4. Run 3_business_analysis.sql.
5. Run 4_dashboard_queries.sql.
6. Run 5_presentation_queries.sql to produce the results used in the presentation screenshots.

## Author

jmtadpatrikar

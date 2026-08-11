# MySQL Retail Sales Analysis

A SQL portfolio project that analyzes retail sales data using MySQL.

## Project overview

This project demonstrates practical SQL skills through a retail sales dataset. It covers data cleaning, exploratory analysis, and business-focused queries.

## Tools used

- MySQL
- MySQL Workbench
- Tableau Public

## Repository structure

- `sql/` — five SQL scripts used in this project
- `screenshots/` - dashboard query screenshots

## SQL workflow

The scripts cover:

1. [Documents the raw imported tables and performs data-quality checks, including table and column validation, row counts, duplicate checks, invoice consistency, missing or invalid values, and line-total verification.]
2. 
3. 
4. 
5.
6. 


## Skills demonstrated

- Data cleaning
- Aggregations and grouping
- Joins
- Business analysis
- MySQL

## Key insights

- The cleaned dataset covers 1 January 2014 to 30 December 2015, with 33,499 invoices.

- Exact duplicate invoice-item rows were removed during cleaning: 5,426 rows were excluded while valid repeated invoice/product purchases were retained.

- Total revenue was 9,307,314.40 in the dataset’s currency, from 5,261,943 units, with an average invoice value of 277.84.

- November 2015 was the strongest sales month, generating 1,176,130.79 in revenue.

- Kitchen & Dining was the highest-revenue category, contributing 2,253,891.45 in revenue.

- Wholesale customers generated 73.6% of total revenue, making them the largest customer segment by sales value.

- Tuesday was the highest-revenue weekday, generating 2,033,255.64 in revenue.

## Presentation Queries and Screenshots
1. Headline KPIs
   [View the SQL query](sql/5_presentation_queries.sql#L5-L10)

[View the matching screenshot](screenshots/01-headline-kpis.png)

## Tableau dashboard

[https://public.tableau.com/views/retail_sales_dashboard_17864661943300/RetailSalesPerformanceDashboard?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link]

## Author

jmtadpatrikar

# Mobile-Manufacturer-SQL-Analysis
Advanced SQL analysis of cellphone sales data using complex queries to analyze customers, manufacturers, models, locations, transactions, pricing, and yearly sales performance.


##  Project Overview

This project is an **Advanced SQL Case Study** based on cellphone sales and transaction data.

The objective of the project is to analyze cellphone transactions and answer different business questions related to **customers, manufacturers, models, locations, pricing, quantities, and yearly sales performance** using SQL Server.

The project includes a database creation script and a separate SQL analysis script containing solutions to 10 business-oriented SQL questions.

---

##  Database Structure

The database used in this project is:

`db_SQLCaseStudies`

The database contains the following tables:

### Dimension Tables

* `DIM_MANUFACTURER` – Stores manufacturer information.
* `DIM_MODEL` – Stores cellphone model and unit price information.
* `DIM_CUSTOMER` – Stores customer information.
* `DIM_LOCATION` – Stores location information such as country, state, city, and ZIP code.
* `DIM_DATE` – Stores transaction dates and derived year, quarter, and month information.

### Fact Table

* `FACT_TRANSACTIONS` – Stores cellphone transaction information including model, customer, location, date, total price, and quantity.

### Database Relationship

```text
DIM_MANUFACTURER
        │
        │
        ▼
    DIM_MODEL
        │
        │
        ▼
FACT_TRANSACTIONS
   │       │       │
   ▼       ▼       ▼
CUSTOMER LOCATION  DATE
```

---

##  Business Questions

The project answers the following 10 questions:

1. List all the states in which customers purchased cellphones from 2005 onwards.

2. Find the US state that purchased the highest number of Samsung cellphones.

3. Show the number of transactions for each cellphone model by ZIP code and state.

4. Find the cheapest cellphone and display its price.

5. Find the average price for each model belonging to the top 5 manufacturers based on sales quantity.

6. List customers whose average spending in 2009 was greater than 500.

7. Find models that were simultaneously among the top 5 models by quantity in 2008, 2009, and 2010.

8. Find the manufacturer with the second-highest sales in 2009 and the second-highest sales in 2010.

9. Find manufacturers that sold cellphones in 2010 but did not sell any in 2009.

10. Find the top customers, their yearly average spending and quantity, and the percentage change in spending.

---

##  Technologies Used

* **SQL Server**
* **T-SQL**
* **SSMS (SQL Server Management Studio)**

---

##  SQL Concepts Used

This project provides practical experience with:

* `SELECT`
* `DISTINCT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `TOP`
* Aggregate Functions

  * `SUM()`
  * `AVG()`
  * `COUNT()`
  * `MIN()`
* `JOIN`
* Subqueries
* `INTERSECT`
* `EXCEPT`
* `UNION`
* `YEAR()`
* Window Functions
* `LAG()`
* `PARTITION BY`
* Common analytical SQL techniques
* Filtering and ranking
* Year-wise analysis

---

##  Project Files

```text
Mobile-Manufacturer-SQL-Analysis/
│
├── README.md
│
├── Database/
│   └── SQL_Case_Study_Create_Database.sql
│
├── Analysis/
│   └── Mobile_Manufacturer_Data_Analysis.sql
│
└── Questions/
    └── Advanced_SQL_Case_Study_Questions.md
```

### Database Script

`SQL_Case_Study_Create_Database.sql`

This script:

* Creates the database
* Creates the required tables
* Defines primary and foreign keys
* Inserts the manufacturer, model, customer, location, date, and transaction data

### Analysis Script

`Mobile_Manufacturer_Data_Analysis.sql`

This script contains the SQL queries used to solve all 10 business questions.

---

##  How to Run the Project

### Step 1 – Open SQL Server Management Studio

Open **SSMS** and connect to your SQL Server instance.

### Step 2 – Create the Database

Open:

```text
Database/
└── SQL_Case_Study_Create_Database.sql
```

Execute the script.

This will create the database:

```sql
db_SQLCaseStudies
```

along with the required tables and data.

### Step 3 – Run the Analysis

Open:

```text
Analysis/
└── Mobile_Manufacturer_Data_Analysis.sql
```

Make sure the database is selected:

```sql
USE db_SQLCaseStudies;
```

Then execute the queries to view the analysis results.

---

## 📊 Analysis Areas

The project focuses on several business analysis areas:

| Analysis Area         | Business Objective                               |
| --------------------- | ------------------------------------------------ |
| Customer Analysis     | Understand customer purchasing behavior          |
| Geographic Analysis   | Analyze purchases by state, city and ZIP code    |
| Manufacturer Analysis | Compare manufacturer sales performance           |
| Model Analysis        | Analyze cellphone models and pricing             |
| Sales Analysis        | Analyze transaction quantity and revenue         |
| Yearly Analysis       | Compare performance across different years       |
| Customer Spending     | Analyze average customer spending                |
| Ranking Analysis      | Identify top manufacturers, models and customers |

---

##  Key Learning Outcomes

Through this case study, I practiced using SQL to solve real-world business problems rather than working only with basic database queries.

The project helped strengthen my understanding of:

* Relational database design
* Table relationships
* Multi-table joins
* Aggregation and grouping
* Subqueries
* Set operators
* Ranking and analytical functions
* Year-wise business analysis
* Customer and sales analysis
* Writing structured SQL queries

---

##  Author

**Haris Khan**

Aspiring Data Analyst | SQL | Excel | Power BI | Python

---

##  Project Purpose

This project is part of my SQL and Data Analytics learning journey and demonstrates my ability to use SQL Server to transform transaction data into meaningful business insights.

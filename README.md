# Olist E-Commerce Analysis

This project explores product performance in the Olist Brazilian e-commerce dataset, focusing on how the top revenue-generating products differ from the rest. Using SQL for data preparation and Tableau for visualization, the analysis compares product ordering trends, review score distributions, and product category revenue shares between high-performing products and the rest of the catalog.

🔗 **View the Dashboard:**  
[The Top Products vs The Rest – Tableau Public](https://public.tableau.com/app/profile/zane.sorenson/viz/olist-ecommerce/Dashboard1)

---

## 📊 Dashboard Overview

The interactive dashboard allows users to toggle between the top 1%, 5%, or 10% of products based on total revenue and compare them to all other products. It includes:

- **Monthly Ordering Trends:** Seasonal performance differences across cohorts.
- **Review Score Distributions:** How customer satisfaction varies between high- and lower-revenue products.
- **Category Revenue Distribution:** Which product categories contribute most to revenue within each cohort.

---

## 🧮 SQL Analysis

SQL was used to transform and analyze the dataset prior to visualization. Key techniques include:

- **Joins** across multiple tables (orders, order_items, reviews, products, etc.)
- **Window functions** (`NTILE`) for assigning percentile rankings based on revenue
- **Aggregation** using `SUM`, `AVG`, and `GROUP BY`
- **Subqueries** for organizing data into clean staging tables

All SQL queries are included in the `e-commerce-sql-queries.sql` file. The project uses a SQLite database version of the Olist dataset, available in this repository.

---

## 📁 Repository Contents

- `e-commerce-sql-queries.sql` - SQL scripts used for cleaning and transforming the data
- `olist.sqlite` - SQLite version of the database used in the analysis
- `olist_db_schema.png` - Diagram of the database schema

---

## 📦 Data Source

- Original dataset published by [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- SQLite database version republished by [terencicp on Kaggle](https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database)

---

## 📬 Contact

- **Zane Sorenson**  
  [LinkedIn](https://www.linkedin.com/in/zane-sorenson/)  
  📧 zanesorenson@gmail.com
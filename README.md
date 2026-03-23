E-Commerce Sales & Operations Analytics Dashboard

📌 Project Overview

E-commerce businesses often struggle with limited visibility into sales performance, customer demand patterns, and delivery efficiency, making it difficult to identify growth opportunities and operational issues.

This project builds an end-to-end analytics solution to transform raw transactional data into actionable business insights, enabling stakeholders to monitor performance, detect inefficiencies, and support data-driven decision-making.

🎯 Business Objective

The goal of this project is to enable:

Monitoring of revenue, orders, and customer behavior trends
Identification of high-performing and underperforming product categories
Detection of logistics inefficiencies (delays, late deliveries)
Evaluation of customer satisfaction and experience drivers
Support for trend forecasting and operational planning


📊 Dataset
Source: Brazilian E-Commerce Public Dataset by Olist (Kaggle)
Size: ~100,000 orders (2016–2018)
Coverage:
Orders, payments, customers, sellers
Product categories and attributes
Delivery timelines and logistics
Customer reviews and ratings
Geolocation data (state/city level)


🏗️ Data Architecture

🔹 Data Pipeline
Data ingestion from CSV files into PostgreSQL
Creation of raw tables (orders, customers, products, payments, reviews, etc.)
Data validation (row counts, null checks, key integrity)
Indexing on key fields (order_id, customer_id, product_id, etc.)
Creation of optimized BI views (fact + dimensions)
Integration with Power BI (DirectQuery mode)

🔹 Data Modeling
Fact Table: bi_fact_sales
Dimensions:
Date (DimDate)
Customers (state, city)
Products (category)
Sellers
Payments

Designed for:

Efficient querying
Scalable reporting
Real-time analysis via DirectQuery


📈 Key KPIs & Metrics
Revenue
Orders
Customers
Average Order Value (AOV)
On-time Delivery %
Late Orders / Delay %
Customer Rating (Avg, Positive %, Negative %)
YoY Growth, YTD, Rolling Metrics


📊 Dashboard Structure

1️⃣ Overview (Executive Dashboard)
KPI Cards: Revenue, Orders, Customers, AOV, On-time %, Avg Rating, YoY %
Revenue trend (monthly)
Orders trend
Top categories by revenue
Revenue by state (map)
Order status distribution

2️⃣ Sales Trends
Revenue vs Last Year (YoY)
Rolling 30-day revenue
Year-to-date (YTD) performance
Category × Month performance matrix

3️⃣ Category & Product Analysis
Category revenue share (treemap)
Orders vs AOV (scatter)
Category ratings comparison
Top categories performance table

4️⃣ Customer Geography
Revenue by state (map)
Top states & cities
State × Category performance matrix

5️⃣ Delivery & Logistics
On-time delivery %
Late orders trend
Delay % by state
Average delivery time by category

6️⃣ Reviews & Customer Experience
Average rating
Positive vs negative reviews
Rating distribution
Impact of delays on ratings

7️⃣ Payments
Payment type distribution
Installment behavior
Payment trends over time

8️⃣ Sellers
Seller count
Revenue per seller
Top-performing sellers
Seller geography analysis

9️⃣ Drillthrough (Advanced)
Deep-dive into category/state/seller
KPI-level breakdown
Time-based performance trends


🔍 Analytical Approach
Time-Series Analysis: YoY, YTD, rolling metrics
Segmentation: Category, geography, customer behavior
Performance Analysis: Revenue, orders, AOV
Operational Analysis: Delivery performance, delays
Customer Experience Analysis: Ratings, satisfaction drivers


🛠️ Tools & Technologies
PostgreSQL
Data ingestion & storage
Indexing & optimization
BI views creation
Power BI
DirectQuery for real-time analysis
DAX for KPI calculations
Interactive dashboard design


💡 Key Insights Enabled
Identification of high-revenue categories and growth drivers
Detection of delivery delays impacting customer satisfaction
Visibility into regional demand patterns
Understanding of payment behavior and installment trends
Data-backed support for operational and strategic decisions


🚀 Business Impact (Decision Enablement)

This project demonstrates how analytics can:

Improve operational efficiency by identifying delays
Enhance customer experience through satisfaction tracking
Support revenue growth strategies via category insights
Enable data-driven planning and forecasting


<img width="775" height="439" alt="Dashbaord Overview" src="https://github.com/user-attachments/assets/d38e3c10-2e15-4ed1-b91d-f9ab6ddefcb5" />

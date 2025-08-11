# 📖 Project Overview

This project demonstrates the design and implementation of a **Modern Data Warehouse** using the **Medallion Architecture** (**Bronze**, **Silver**, and **Gold** layers).  
It is built entirely with **SQL Server** and showcases both **Data Engineering** and **Data Analytics** skills.

---

## 🎯 Objectives

- **Data Architecture**: Build a scalable, layered data warehouse to store and process structured data.
- **ETL Pipelines**: Extract, transform, and load data from multiple sources into the warehouse.
- **Data Modeling**: Design fact and dimension tables optimized for analytics (Star Schema).
- **Analytics & Reporting**: Create SQL-based reports to generate actionable insights.

---

## 🛠 Tools & Technologies

- **SQL Server Express** – Lightweight SQL database server.
- **SQL Server Management Studio (SSMS)** – GUI for database development and administration.
- **Draw.io** – For architecture, data flow, and data model diagrams.
- **Notion** – Project planning and documentation.
- **GitHub** – Version control and code sharing.

---

## 📂 Repository Structure

data-warehouse-project/
│
├── datasets/ # Raw datasets (CSV files)
├── docs/ # Documentation and diagrams
│ ├── etl.drawio # ETL pipeline diagram
│ ├── data_architecture.drawio
│ ├── data_flow.drawio
│ ├── data_models.drawio
│ ├── data_catalog.md # Dataset descriptions
│
├── scripts/ # SQL ETL and transformation scripts
│ ├── bronze/ # Raw data load
│ ├── silver/ # Data cleaning and transformation
│ ├── gold/ # Analytical data models
│
├── tests/ # Data validation and quality checks
├── README.md # Project documentation
├── LICENSE # License information
└── requirements.txt # Dependencies


---

## 🚀 Implementation Steps

### 1. **Data Ingestion (Bronze Layer)**
- Load raw CSV datasets from ERP and CRM systems.
- Maintain original format for traceability.

### 2. **Data Transformation (Silver Layer)**
- Cleanse and standardize datasets.
- Resolve duplicates and missing values.
- Apply consistent naming conventions.

### 3. **Data Modeling (Gold Layer)**
- Create a Star Schema for analytical queries.
- Build fact tables (Sales, Transactions).
- Build dimension tables (Customers, Products, Dates).

### 4. **Analytics & Reporting**
- Develop SQL reports for:
  - Customer behavior
  - Product performance
  - Sales trends

---

## 📊 Example Insights
- **Top 10 best-selling products** by revenue.
- **Monthly sales trends** with YoY growth.
- **Customer segmentation** based on purchase frequency.

---

## 🛡 License
This project is released under the **MIT License**.  
Feel free to use, modify, and share with proper attribution.

---

## 👤 Author
**Mirigil Kumar** – Data Analyst | SQL Developer | Analytics Enthusiast  
📧 Email: mirigilkumar@gmail.com  
🔗 LinkedIn:   
💻 Portfolio:

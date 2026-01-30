/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Purpose:
    - Creates raw ingestion tables in the bronze schema
    - Drops existing tables to allow re-runs (DEV / TEST only)
    - Stores data exactly as received from source systems

Note:
    - No business rules or transformations applied in bronze layer
===============================================================================
*/

USE DataWarehouse;
GO

BEGIN TRY

/* =========================
   CRM – Customer Info
========================= */
IF OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id            INT,
    cst_key           VARCHAR(50),
    cst_firstname     VARCHAR(50),
    cst_lastname      VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gender        VARCHAR(50),
    cst_create_date   DATE,
    ingestion_dt      DATETIME DEFAULT GETDATE(),
    source_system     VARCHAR(50)
);
GO

/* =========================
   CRM – Product Info
========================= */
IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id        INT,
    prd_key       VARCHAR(50),
    prd_name      VARCHAR(50),
    prd_cost      INT,
    prd_line      VARCHAR(50),
    prd_start_dt  DATE,
    prd_end_dt    DATE,
    ingestion_dt  DATETIME DEFAULT GETDATE(),
    source_system VARCHAR(50)
);
GO

/* =========================
   CRM – Sales Details
   Note: Dates are stored as INT as received from source
========================= */
IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num   VARCHAR(50),
    sls_prd_key   VARCHAR(50),
    sls_cust_id   INT,
    sls_order_dt  INT,   -- YYYYMMDD from source
    sls_ship_dt   INT,
    sls_due_dt    INT,
    sls_sales     INT,
    sls_quantity  INT,
    sls_price     INT,
    ingestion_dt  DATETIME DEFAULT GETDATE(),
    source_system VARCHAR(50)
);
GO

/* =========================
   ERP – Customer
========================= */
IF OBJECT_ID('bronze.erp_cust_az12','U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
    cust_id       VARCHAR(50),
    birth_date    DATE,
    gender        VARCHAR(50),
    ingestion_dt  DATETIME DEFAULT GETDATE(),
    source_system VARCHAR(50)
);
GO

/* =========================
   ERP – Location
========================= */
IF OBJECT_ID('bronze.erp_loc_a101','U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
    cust_id       VARCHAR(50),
    country       VARCHAR(50),
    ingestion_dt  DATETIME DEFAULT GETDATE(),
    source_system VARCHAR(50)
);
GO

/* =========================
   ERP – Product Category
========================= */
IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2 (
    prd_id        VARCHAR(50),
    category      VARCHAR(50),
    sub_category  VARCHAR(50),
    maintenance   VARCHAR(50),
    ingestion_dt  DATETIME DEFAULT GETDATE(),
    source_system VARCHAR(50)
);
GO

END TRY
BEGIN CATCH
    PRINT 'Error occurred while creating bronze tables';
    THROW;
END CATCH;
GO

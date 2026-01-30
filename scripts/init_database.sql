/*
=============================================================
Create DataWarehouse Database and Schemas
=============================================================
Script Purpose:
    - Creates a DataWarehouse database for analytics.
    - Drops and recreates the database if it already exists (DEV/TEST only).
    - Creates bronze, silver, and gold schemas to support Medallion Architecture.

WARNING:
    - This script DROPS the entire DataWarehouse database.
    - All existing data will be permanently deleted.
    - Use ONLY in development or test environments.
=============================================================
*/

USE master;
GO

BEGIN TRY
    -- Check if database exists
    IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
    BEGIN
        ALTER DATABASE DataWarehouse 
        SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

        DROP DATABASE DataWarehouse;
    END;

    -- Create DataWarehouse database
    CREATE DATABASE DataWarehouse;
END TRY
BEGIN CATCH
    PRINT 'Error occurred while creating DataWarehouse database';
    THROW;
END CATCH;
GO

-- Switch to DataWarehouse
USE DataWarehouse;
GO

-- Create schemas if not exists
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO

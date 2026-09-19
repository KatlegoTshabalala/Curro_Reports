/* ============================================
   Create databases and medallion schemas
   ============================================ */

-- Staging database (bronze layer)-------------------------------------------------------------
CREATE DATABASE stg_Curro;
GO

USE stg_Curro;
GO

CREATE SCHEMA bronze_Curro;
GO


-- Data warehouse database (silver + gold layers) -----------------------------------------------
CREATE DATABASE Curro_dwh;
GO

USE Curro_dwh;
GO

CREATE SCHEMA silver_Curro;
GO

CREATE SCHEMA gold_Curro;
GO
-- ============================================================================
-- EXPERIMENT 10: Query Optimization, Multi-Condition Indexing, and EXPLAIN
-- Format: Executable .sql script (MySQL 8.0+)
-- Source: DBMS Practical Experiments (Atharva435)
-- ============================================================================
-- Aim: Generate at least 10,000 sales records, analyze five distinct query types 
--      (filtering, aggregation, range, and grouped HAVING) using EXPLAIN, and 
--      compare query execution plans before and after creating optimal indexes.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- STEP 1: Database Initialization & Safe Reset
-- ----------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS QueryOptimizationDB;
USE QueryOptimizationDB;

DROP TABLE IF EXISTS Sales_Records;

-- ----------------------------------------------------------------------------
-- STEP 2: Table Creation
-- ----------------------------------------------------------------------------
CREATE TABLE Sales_Records (
    Record_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Region VARCHAR(30),
    Sale_Date DATE,
    Quantity INT,
    Amount DECIMAL(10,2)
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- STEP 3: Dataset Generation (10,000 Records via Cartesian Product)
-- ----------------------------------------------------------------------------
INSERT INTO Sales_Records
SELECT 
    n,
    MOD(n, 1000) + 1,
    MOD(n, 200) + 1,
    CASE MOD(n, 4) 
        WHEN 0 THEN 'North' 
        WHEN 1 THEN 'South' 
        WHEN 2 THEN 'East' 
        ELSE 'West' 
    END,
    DATE_ADD('2025-01-01', INTERVAL MOD(n, 365) DAY),
    MOD(n, 10) + 1,
    (MOD(n, 10) + 1) * (100 + MOD(n, 500))
FROM (
    SELECT a.n + b.n * 10 + c.n * 100 + d.n * 1000 + 1 AS n 
    FROM (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    CROSS JOIN (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    CROSS JOIN (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
    CROSS JOIN (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d
) numbers 
WHERE n <= 10000;

-- Verification of record count
SELECT COUNT(*) AS Total_Records FROM Sales_Records;

-- ----------------------------------------------------------------------------
-- STEP 4: Query Execution Plans BEFORE Indexing (Full Table Scans)
-- ----------------------------------------------------------------------------

-- Query 1: Filter on Customer_ID
EXPLAIN SELECT * FROM Sales_Records WHERE Customer_ID = 150;

-- Query 2: Filter on Product_ID
EXPLAIN SELECT * FROM Sales_Records WHERE Product_ID = 50;

-- Query 3: Aggregation on Region
EXPLAIN SELECT Region, SUM(Amount) FROM Sales_Records WHERE Region = 'North' GROUP BY Region;

-- Query 4: Range Query on Sale_Date
EXPLAIN SELECT * FROM Sales_Records WHERE Sale_Date BETWEEN '2025-03-01' AND '2025-03-31';

-- Query 5: Group By with HAVING on Aggregated Amount
EXPLAIN SELECT Customer_ID, SUM(Amount) FROM Sales_Records GROUP BY Customer_ID HAVING SUM(Amount) > 5000;

-- ----------------------------------------------------------------------------
-- STEP 5: Index Creation (Targeted Single & Composite Indexes)
-- ----------------------------------------------------------------------------
CREATE INDEX idx_customer ON Sales_Records(Customer_ID);
CREATE INDEX idx_product ON Sales_Records(Product_ID);
CREATE INDEX idx_region_amount ON Sales_Records(Region, Amount);
CREATE INDEX idx_sale_date ON Sales_Records(Sale_Date);
CREATE INDEX idx_customer_amount ON Sales_Records(Customer_ID, Amount);

-- ----------------------------------------------------------------------------
-- STEP 6: Query Execution Plans AFTER Indexing (Optimized Execution)
-- ----------------------------------------------------------------------------

-- Query 1: Filter on Customer_ID (Uses idx_customer)
EXPLAIN SELECT * FROM Sales_Records WHERE Customer_ID = 150;

-- Query 2: Filter on Product_ID (Uses idx_product)
EXPLAIN SELECT * FROM Sales_Records WHERE Product_ID = 50;

-- Query 3: Aggregation on Region (Uses idx_region_amount)
EXPLAIN SELECT Region, SUM(Amount) FROM Sales_Records WHERE Region = 'North' GROUP BY Region;

-- Query 4: Range Query on Sale_Date (Uses idx_sale_date)
EXPLAIN SELECT * FROM Sales_Records WHERE Sale_Date BETWEEN '2025-03-01' AND '2025-03-31';

-- Query 5: Group By with HAVING (Uses idx_customer_amount)
EXPLAIN SELECT Customer_ID, SUM(Amount) FROM Sales_Records GROUP BY Customer_ID HAVING SUM(Amount) > 5000;

-- ============================================================================
-- Output (expected; run the SQL to capture your actual result):
-- Expected result: Sales_Records contains 10000 records. Five EXPLAIN plans 
-- are compared before/after indexes; query plan details and runtime vary 
-- by environment.
-- ============================================================================


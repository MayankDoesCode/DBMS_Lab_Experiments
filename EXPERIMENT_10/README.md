# Experiment 10: Query Optimization, Multi-Condition Indexing, and EXPLAIN

> **Format**: This experiment is written and provided in executable `.sql` format ([experiment_10.sql](experiment_10.sql)).

## Aim
To generate a sales dataset of at least 10,000 records, analyze five distinct query types (exact match filtering, product grouping, regional aggregation, date range filtering, and grouped aggregation with `HAVING`) using MySQL's `EXPLAIN` statement, and compare execution plans before and after creating optimal indexes.

---

## Concepts Demonstrated

### 1. High-Volume Synthetic Dataset Generation
- Generates 10,000 relational tuples using 4-way Cartesian cross joins of single-digit derived tables `(0..9)`.
- Models a realistic e-commerce sales ledger with distinct customer cohorts, product catalogs, four geographical regions, dates spanning a 1-year timeline, and randomized quantities and price points.

### 2. Five Query Optimization Patterns
1. **Single-Column Lookup (`WHERE Customer_ID = ?`)**:
   - Transitions from `ALL` (full table scan over 10,000 rows) to `ref` (exact index lookup examining ~10 rows).
2. **Catalog Filtering (`WHERE Product_ID = ?`)**:
   - Uses `idx_product` to isolate transactions associated with a particular product SKU.
3. **Covering Index for Aggregation (`SELECT Region, SUM(Amount) ... GROUP BY Region`)**:
   - Uses composite index `idx_region_amount(Region, Amount)` satisfying both the `WHERE` filter and `SUM` computation purely out of the B-Tree index without accessing table rows (`Using index`).
4. **Date Range Scans (`WHERE Sale_Date BETWEEN ...`)**:
   - Transitions from full table scan to a bounded index range scan (`type: range`) using `idx_sale_date`.
5. **Grouped Aggregation with Filtering (`GROUP BY Customer_ID HAVING SUM(Amount) > ?`)**:
   - Employs composite index `idx_customer_amount(Customer_ID, Amount)` to avoid temporary tables and filesort operations.

---

## Relational Schema: `Sales_Records`

| Column Name | Data Type | Constraints | Description |
|---|---|---|---|
| `Record_ID` | `INT` | `PRIMARY KEY` | Unique transaction ID |
| `Customer_ID` | `INT` | `NOT NULL` | Customer ID (1 to 1,000) |
| `Product_ID` | `INT` | `NOT NULL` | Product ID (1 to 200) |
| `Region` | `VARCHAR(30)` | | Sales territory (`North`, `South`, `East`, `West`) |
| `Sale_Date` | `DATE` | | Transaction timestamp date |
| `Quantity` | `INT` | | Units purchased (1 to 10) |
| `Amount` | `DECIMAL(10,2)` | | Total billed sales amount |

---

## Indexes Created

1. `idx_customer`: Single-column index on `Customer_ID`
2. `idx_product`: Single-column index on `Product_ID`
3. `idx_region_amount`: Composite index on `(Region, Amount)`
4. `idx_sale_date`: Single-column index on `Sale_Date`
5. `idx_customer_amount`: Composite index on `(Customer_ID, Amount)`

---

## Query Optimization Comparison

| Query | Target Predicate / Operation | Plan Before Index | Plan After Index | Index Utilized |
|---|---|---|---|---|
| **Query 1** | `WHERE Customer_ID = 150` | `ALL` (~10,000 rows) | `ref` (~10 rows) | `idx_customer` |
| **Query 2** | `WHERE Product_ID = 50` | `ALL` (~10,000 rows) | `ref` (~50 rows) | `idx_product` |
| **Query 3** | `WHERE Region='North' GROUP BY Region` | `ALL` (~10,000 rows, filesort) | `ref` (~2,500 rows, `Using index`) | `idx_region_amount` |
| **Query 4** | `WHERE Sale_Date BETWEEN ...` | `ALL` (~10,000 rows) | `range` (~800-900 rows) | `idx_sale_date` |
| **Query 5** | `GROUP BY Customer_ID HAVING SUM(Amount) > 5000` | `ALL` (temporary table, filesort) | `index` (index scan without filesort) | `idx_customer_amount` |

---

## How to Execute the Script

### Using MySQL Command-Line Client
```bash
mysql -u your_username -p < experiment_10.sql
```

### Using MySQL Workbench
1. Open MySQL Workbench and connect to your database server.
2. Open `experiment_10.sql`.
3. Execute the script (`Ctrl+Shift+Enter`).
4. Compare execution plans in the result pane.


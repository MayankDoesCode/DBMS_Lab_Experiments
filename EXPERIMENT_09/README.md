# Experiment 9: Railway Booking Dataset & Index Performance Analysis (EXPLAIN)

> **Format**: This experiment is written and provided in executable `.sql` format ([experiment_09.sql](experiment_09.sql)).

## Aim
To create a railway booking dataset of at least 5,000 records, compare query execution plans before and after adding single-column and composite indexes, and analyze performance improvements using MySQL's `EXPLAIN` statement.

---

## Concepts Demonstrated

### 1. High-Volume Data Generation using Cartesian Products
- Uses cross joins of ten-digit derived tables `(0..9)` to generate numbers from 1 to 5,000 without requiring procedural loops or external CSV imports.
- Synthetic attributes (`Passenger_Name`, `Train_No`, `Journey_Date`, `Fare`) are deterministically computed using mathematical expressions (`MOD`, `CONCAT`, `DATE_ADD`).

### 2. Full Table Scan vs. Index Lookup
- **Before Indexing (`type: ALL`)**: The database engine must scan every single row (all 5,000 records) to evaluate predicate filters.
- **After Indexing (`type: ref` / `range`)**: The B-Tree index structure enables direct traversal to matching leaf nodes, reducing scanned rows from 5,000 down to a small subset.

### 3. Single-Column vs. Composite Indexes
- **Single-Column Index**: `idx_train_no` and `idx_passenger_name` speed up exact equality filters on individual attributes.
- **Composite Index**: `idx_train_date (Train_No, Journey_Date)` optimizes multi-attribute queries, leveraging the leftmost prefix rule.

### 4. Interpreting `EXPLAIN` Metrics
- `type`: Indicates access type (`ALL` for full scan, `ref` for non-unique index lookups, `range` for range scans).
- `possible_keys`: Indexes MySQL could choose from.
- `key`: The actual index chosen by the optimizer.
- `key_len`: Length of the key chosen in bytes.
- `rows`: Estimated number of rows MySQL believes it must examine.
- `Extra`: Additional processing details (e.g., `Using where`, `Using index`).

---

## Relational Schema: `Railway_Booking`

| Column Name | Data Type | Constraints | Description |
|---|---|---|---|
| `Booking_ID` | `INT` | `PRIMARY KEY` | Unique ticket booking identifier |
| `Passenger_Name` | `VARCHAR(50)` | | Name of passenger (`Passenger_1` to `Passenger_5000`) |
| `Train_No` | `INT` | | Train number (`12000` to `12019`) |
| `Train_Name` | `VARCHAR(50)` | | Name of train (`Express_0` to `Express_19`) |
| `Source_Station` | `VARCHAR(50)` | | Origin station (e.g., Lucknow, Delhi, Kanpur) |
| `Destination_Station` | `VARCHAR(50)` | | Destination station |
| `Journey_Date` | `DATE` | | Date of scheduled travel |
| `Seat_No` | `INT` | | Seat number (1 to 72) |
| `Fare` | `DECIMAL(10,2)` | | Ticket fare amount |

---

## Indexes Created

1. `idx_train_no`: Index on `Railway_Booking(Train_No)`
2. `idx_passenger_name`: Index on `Railway_Booking(Passenger_Name)`
3. `idx_train_date`: Composite index on `Railway_Booking(Train_No, Journey_Date)`

---

## Query Analysis Summary

| Query | Filter Condition | Plan Before Index | Plan After Index | Index Utilized |
|---|---|---|---|---|
| **Query 1** | `WHERE Train_No = 12005` | `ALL` (~5,000 rows scanned) | `ref` (~250 rows scanned) | `idx_train_no` |
| **Query 2** | `WHERE Passenger_Name = 'Passenger_2500'` | `ALL` (~5,000 rows scanned) | `ref` (1 row scanned) | `idx_passenger_name` |
| **Query 3** | `WHERE Train_No = 12005 AND Journey_Date = '2026-05-15'` | `ALL` (~5,000 rows scanned) | `ref` (~1-2 rows scanned) | `idx_train_date` |

---

## How to Execute the Script

### Using MySQL Command-Line Client
```bash
mysql -u your_username -p < experiment_09.sql
```

### Using MySQL Workbench
1. Open MySQL Workbench and connect to your local MySQL instance.
2. Open `experiment_09.sql`.
3. Execute the entire script (`Ctrl+Shift+Enter`).
4. Review the returned Execution Plans in the **Result Grid** and **Execution Plan** viewer.


<div align="center">

# 🗄️ Database Management Systems (DBMS)
### Comprehensive Laboratory Experiments, Optimization Benchmarks & SQL Certifications

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![SQL](https://img.shields.io/badge/SQL-Advanced_Certified-CC292B?style=for-the-badge&logo=sqlite&logoColor=white)](certification/)
[![HackerRank](https://img.shields.io/badge/HackerRank-3x_Certified-2EC866?style=for-the-badge&logo=hackerrank&logoColor=white)](certification/hackerrank/)
[![Infosys Springboard](https://img.shields.io/badge/Infosys_Springboard-FSD_SQL-007ACC?style=for-the-badge&logo=infosys&logoColor=white)](certification/infosys%20springboard/)
[![Status](https://img.shields.io/badge/Experiments-10%2F10_Completed-brightgreen?style=for-the-badge)](.)

<p align="center">
  A production-grade, academic and practical portfolio of relational database engineering using MySQL 8.0+.
  <br>
  Covering conceptual E-R modeling, integrity constraints, recursive CTEs, stored procedures, triggers, audit logging,
  lossless normalization, ACID transaction concurrency, and high-volume index optimization using EXPLAIN.
</p>

</div>

---

## 📑 Table of Contents

- [Repository Architecture](#-repository-architecture)
- [Lab Experiments Directory (01 – 10)](#-lab-experiments-directory-01--10)
  - [Experiment 01: E-Commerce E-R Modeling & Relational Schema](#experiment-01-e-commerce-e-r-modeling--relational-schema)
  - [Experiment 02: College DB Schema & Referential Integrity](#experiment-02-college-db-schema--referential-integrity)
  - [Experiment 03: Employee-Department-Project Queries & Aggregations](#experiment-03-employee-department-project-queries--aggregations)
  - [Experiment 04: Advanced Joins, Subqueries & EXPLAIN Plans](#experiment-04-advanced-joins-subqueries--explain-plans)
  - [Experiment 05: Views, Updatability & Recursive CTE Hierarchies](#experiment-05-views-updatability--recursive-cte-hierarchies)
  - [Experiment 06: Stored Procedures, Triggers & Audit Logging](#experiment-06-stored-procedures-triggers--audit-logging)
  - [Experiment 07: Normalization to 3NF/BCNF & Lossless Join Proofs](#experiment-07-normalization-to-3nfbcnf--lossless-join-proofs)
  - [Experiment 08: Transactions, Savepoints & Concurrency Isolation Levels](#experiment-08-transactions-savepoints--concurrency-isolation-levels)
  - [Experiment 09: Railway Booking High-Volume Dataset & Index Tuning](#experiment-09-railway-booking-high-volume-dataset--index-tuning)
  - [Experiment 10: Query Optimization, Multi-Condition Indexing & EXPLAIN](#experiment-10-query-optimization-multi-condition-indexing--explain)
- [Verified Professional Certifications](#-verified-professional-certifications)
- [Prerequisites & Execution Guide](#-prerequisites--execution-guide)
- [Author & Academic Attribution](#-author--academic-attribution)

---

## 🏛️ Repository Architecture

```
DBMs/
├── EXPERIMENT_01/               # E-Commerce E-R Model, Relational Schema & MySQL Scripts
│   ├── experiment_01.sql        # Executable SQL (9 relational tables & constraints)
│   ├── exp1.png                 # Conceptual Draw.io E-R Diagram
│   ├── ER_Diagram.png           # Relational Entity Diagram
│   └── README.md                # Detailed Experiment 01 Report
├── EXPERIMENT_02/               # College DB Schemas, Referential Actions & Integrity
│   ├── experiment_02.sql        # PRIMARY KEY, UNIQUE, CASCADE, SET NULL rules
│   ├── WhatsApp Image...jpeg    # Lab notebook handwritten journal scans
│   └── README.md                # Detailed Experiment 02 Report
├── EXPERIMENT_03/               # Employee-Department-Project Schema & Analytics
│   ├── experiment_03.sql        # 30 Employees, 5 Depts, 8 Projects & Aggregations
│   └── README.md                # Detailed Experiment 03 Report
├── EXPERIMENT_04/               # Relational Joins, Correlated Subqueries & EXPLAIN
│   ├── experiment_04.sql        # INNER, LEFT, Self, 3-way Joins, EXISTS & INTERSECT
│   └── README.md                # Detailed Experiment 04 Report
├── EXPERIMENT_05/               # Views, Updatability Enforcement & Recursive CTEs
│   ├── experiment_05.sql        # View updates, CHECK OPTION & Employee Org Hierarchy
│   └── README.md                # Detailed Experiment 05 Report
├── EXPERIMENT_06/               # Stored Procedures, Custom Exceptions & Audit Triggers
│   ├── experiment_06.sql        # transfer_employee(), SIGNAL 45000, Salary_Audit
│   └── README.md                # Detailed Experiment 06 Report
├── EXPERIMENT_07/               # Normalization Engineering (UNF -> 1NF -> 2NF -> 3NF/BCNF)
│   ├── output.gif               # Execution Terminal Demonstration
│   └── README.md                # Mathematical Decomposition Proofs & SQL
├── EXPERIMENT_08/               # ACID Transactions, Savepoints & Concurrency
│   ├── output.gif               # Two-Session Concurrency Demonstration
│   └── README.md                # Dirty/Non-repeatable reads & Isolation Levels
├── EXPERIMENT_09/               # Railway Booking High-Volume Dataset (5,000 Records)
│   ├── experiment_09.sql        # Cartesian dataset generation & B-Tree Index benchmarks
│   └── README.md                # EXPLAIN access type transition analysis (ALL -> ref)
├── EXPERIMENT_10/               # Enterprise Query Optimization & EXPLAIN (10,000 Records)
│   ├── experiment_10.sql        # Covering indexes, range scans & GROUP BY optimizations
│   └── README.md                # Detailed 5-Scenario EXPLAIN Benchmark Matrix
└── certification/               # Industry Certifications Portfolio
    ├── README.md                # Certification Overview & Verification Matrix
    ├── hackerrank/              # HackerRank SQL Series (Basic, Intermediate, Advanced)
    │   ├── README.md            # HackerRank Progression Report
    │   ├── sql_basic_certificate.pdf
    │   ├── sql_intermediate_certificate.pdf
    │   └── sql_advanced_certificate.pdf
    └── infosys springboard/     # Infosys Springboard SQL in Full Stack Development
        ├── README.md            # Course Summary & Verification Report
        └── sql_in_fsd_development_certificate.pdf
```

---

## 🔬 Lab Experiments Directory (01 – 10)

| Exp # | Experiment Title | Primary Topics & Relational Concepts | Artifacts & Scripts | Status |
|:---:|:---|:---|:---:|:---:|
| **01** | **E-Commerce E-R Modeling** | Conceptual E-R design, 9 relational entities, cardinality, foreign keys | [SQL](EXPERIMENT_01/experiment_01.sql) • [Docs](EXPERIMENT_01/README.md) | ✅ Completed |
| **02** | **College DB Constraints** | Domain constraints, `CASCADE`, `SET NULL`, referential enforcement | [SQL](EXPERIMENT_02/experiment_02.sql) • [Docs](EXPERIMENT_02/README.md) | ✅ Completed |
| **03** | **Queries & Aggregations** | Enterprise filtering, `GROUP BY`, `HAVING`, `CASE` expressions, sorting | [SQL](EXPERIMENT_03/experiment_03.sql) • [Docs](EXPERIMENT_03/README.md) | ✅ Completed |
| **04** | **Joins & Set Operations** | Inner/Outer joins, self joins, correlated subqueries, `EXPLAIN` plans | [SQL](EXPERIMENT_04/experiment_04.sql) • [Docs](EXPERIMENT_04/README.md) | ✅ Completed |
| **05** | **Views & Recursive CTEs** | View updatability, `WITH CHECK OPTION`, recursive organizational trees | [SQL](EXPERIMENT_05/experiment_05.sql) • [Docs](EXPERIMENT_05/README.md) | ✅ Completed |
| **06** | **Routines & Triggers** | Stored procedures, `SIGNAL SQLSTATE`, audit logging triggers, DELIMITER | [SQL](EXPERIMENT_06/experiment_06.sql) • [Docs](EXPERIMENT_06/README.md) | ✅ Completed |
| **07** | **Relational Normalization** | UNF → 1NF → 2NF → 3NF/BCNF, lossless join decomposition proofs | [GIF](EXPERIMENT_07/output.gif) • [Docs](EXPERIMENT_07/README.md) | ✅ Completed |
| **08** | **Transactions & Isolation** | `COMMIT`, `ROLLBACK`, `SAVEPOINT`, isolation levels (`REPEATABLE READ`) | [GIF](EXPERIMENT_08/output.gif) • [Docs](EXPERIMENT_08/README.md) | ✅ Completed |
| **09** | **Index Performance** | 5,000 synthetic records, B-Tree indexes, full table scans vs index ref | [SQL](EXPERIMENT_09/experiment_09.sql) • [Docs](EXPERIMENT_09/README.md) | ✅ Completed |
| **10** | **Query Optimization** | 10,000 records, covering indexes, range scans, multi-condition indexing | [SQL](EXPERIMENT_10/experiment_10.sql) • [Docs](EXPERIMENT_10/README.md) | ✅ Completed |

---

### Experiment 01: E-Commerce E-R Modeling & Relational Schema
- **Objective**: Design a comprehensive E-R model for an e-commerce platform and convert it into normalized tables.
- **Tables Implemented**: `Customer`, `Address`, `Seller`, `Category`, `Product`, `Orders`, `OrderItem`, `Payment`, `Delivery`.
- **Key Concepts**: Weak entities, composite primary keys, cardinality constraints, cascading deletes.
- 📁 **Files**: [experiment_01.sql](EXPERIMENT_01/experiment_01.sql) | [README.md](EXPERIMENT_01/README.md) | [Draw.io Diagram](EXPERIMENT_01/exp1.png)

### Experiment 02: College DB Schema & Referential Integrity
- **Objective**: Implement a college relational database enforcing domain and referential integrity constraints.
- **Key Concepts**: `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `ON DELETE CASCADE` (purging enrollments when students/courses are deleted), `ON DELETE SET NULL` (preserving student rows when departments are dropped).
- 📁 **Files**: [experiment_02.sql](EXPERIMENT_02/experiment_02.sql) | [README.md](EXPERIMENT_02/README.md) | [Lab Notebook Scans](EXPERIMENT_02/)

### Experiment 03: Employee-Department-Project Queries & Aggregations
- **Objective**: Model an enterprise organizational structure (30 employees, 5 departments, 8 projects) and perform deep business analytics.
- **Key Concepts**: Predicate filtering (`WHERE`), multi-attribute projection, aggregates (`AVG`, `COUNT`), `GROUP BY`, post-aggregation filtering (`HAVING`), conditional classification (`CASE`), and ordering.
- 📁 **Files**: [experiment_03.sql](EXPERIMENT_03/experiment_03.sql) | [README.md](EXPERIMENT_03/README.md)

### Experiment 04: Advanced Joins, Subqueries & EXPLAIN Plans
- **Objective**: Formulate complex multi-table queries and evaluate their execution plans using `EXPLAIN`.
- **Key Concepts**: `INNER JOIN`, `LEFT JOIN`, `SELF JOIN`, 3-way joins, correlated subqueries (`EXISTS`), simulated `INTERSECT` and `EXCEPT`, execution plan cost analysis.
- 📁 **Files**: [experiment_04.sql](EXPERIMENT_04/experiment_04.sql) | [README.md](EXPERIMENT_04/README.md)

### Experiment 05: Views, Updatability & Recursive CTE Hierarchies
- **Objective**: Encapsulate business logic via views and compute organizational reporting structures recursively.
- **Key Concepts**: Single-table updatable views, multi-table aggregate non-updatable views, recursive Common Table Expressions (`WITH RECURSIVE`) resolving supervisor-subordinate chains.
- 📁 **Files**: [experiment_05.sql](EXPERIMENT_05/experiment_05.sql) | [README.md](EXPERIMENT_05/README.md)

### Experiment 06: Stored Procedures, Triggers & Audit Logging
- **Objective**: Implement business rules at the database engine tier via procedural routines and event triggers.
- **Key Concepts**: Stored procedure `transfer_employee()` with parameter validation and custom `SIGNAL SQLSTATE '45000'`, `BEFORE UPDATE` trigger for salary bounds checking, `AFTER UPDATE` trigger for immutable audit trail generation (`Salary_Audit`), client delimiter switching (`DELIMITER $$`).
- 📁 **Files**: [experiment_06.sql](EXPERIMENT_06/experiment_06.sql) | [README.md](EXPERIMENT_06/README.md)

### Experiment 07: Normalization to 3NF/BCNF & Lossless Join Proofs
- **Objective**: Eliminate anomalies from an unnormalized sales dataset by decomposing it into 3NF/BCNF tables.
- **Key Concepts**: Functional dependency analysis, removal of partial dependencies (2NF), removal of transitive dependencies (3NF/BCNF), formal SQL verification of lossless join decomposition and dependency preservation.
- 📁 **Files**: [README.md](EXPERIMENT_07/README.md) | [Execution GIF](EXPERIMENT_07/output.gif)

### Experiment 08: Transactions, Savepoints & Concurrency Isolation Levels
- **Objective**: Guarantee ACID properties under financial debit/credit workflows and evaluate transaction isolation anomalies.
- **Key Concepts**: `START TRANSACTION`, `COMMIT`, `ROLLBACK`, intermediate checkpoints (`SAVEPOINT`, `ROLLBACK TO`), multi-session concurrency testing under `READ COMMITTED`, `REPEATABLE READ`, and `SERIALIZABLE`.
- 📁 **Files**: [README.md](EXPERIMENT_08/README.md) | [Execution GIF](EXPERIMENT_08/output.gif)

### Experiment 09: Railway Booking High-Volume Dataset & Index Tuning
- **Objective**: Generate a 5,000-record dataset via Cartesian cross joins and evaluate query execution plans before and after B-Tree indexing.
- **Key Concepts**: Mathematical generation of large datasets, B-Tree single-column (`idx_train_no`, `idx_passenger_name`) and composite indexes (`idx_train_date`), execution plan transition from full table scan (`ALL`, 5,000 rows) to index lookup (`ref`, ~1-2 rows).
- 📁 **Files**: [experiment_09.sql](EXPERIMENT_09/experiment_09.sql) | [README.md](EXPERIMENT_09/README.md)

### Experiment 10: Query Optimization, Multi-Condition Indexing & EXPLAIN
- **Objective**: Populate a 10,000-record sales ledger and benchmark 5 distinct query optimization scenarios using `EXPLAIN`.
- **Key Concepts**: Exact match lookups, catalog filtering, covering indexes eliminating disk lookups (`Using index`), date range scans (`type: range`), and sorted index traversal eliminating temporary tables and filesort operations.
- 📁 **Files**: [experiment_10.sql](EXPERIMENT_10/experiment_10.sql) | [README.md](EXPERIMENT_10/README.md)

---

## 🏆 Verified Professional Certifications

<div align="center">

| Issuer | Certification Title | Level | Issue Date | Credential ID / Verification | Official Document |
|:---:|:---|:---:|:---:|:---:|:---:|
| <img src="https://upload.wikimedia.org/wikipedia/commons/4/40/HackerRank_Icon-1000px.png" width="28"/> **HackerRank** | **SQL (Basic)** | Basic | Nov 18, 2026 | `09D8D5E120B7` | [View PDF Certificate](certification/hackerrank/sql_basic_certificate.pdf) |
| <img src="https://upload.wikimedia.org/wikipedia/commons/4/40/HackerRank_Icon-1000px.png" width="28"/> **HackerRank** | **SQL (Intermediate)** | Intermediate | Nov 18, 2026 | `AF221311A088` | [View PDF Certificate](certification/hackerrank/sql_intermediate_certificate.pdf) |
| <img src="https://upload.wikimedia.org/wikipedia/commons/4/40/HackerRank_Icon-1000px.png" width="28"/> **HackerRank** | **SQL (Advanced)** | Advanced | Nov 18, 2026 | `914D66ED9DB0` | [View PDF Certificate](certification/hackerrank/sql_advanced_certificate.pdf) |
| <img src="https://upload.wikimedia.org/wikipedia/commons/9/95/Infosys_logo.svg" width="40"/> **Infosys Springboard** | **SQL in FSD Development** | Professional | Nov 21, 2026 | [verify.onwingspan.com](https://verify.onwingspan.com) | [View PDF Certificate](certification/infosys%20springboard/sql_in_fsd_development_certificate.pdf) |

</div>

> Complete credential details and progression paths are available in the [Certifications Portfolio](certification/README.md).

---

## ⚙️ Prerequisites & Execution Guide

### Software Requirements
- **MySQL Server 8.0+** (Community or Enterprise edition)
- **MySQL Workbench 8.0+** or MySQL Command-Line Client (`mysql`)

### Execution via MySQL Command-Line Client
Navigate to any experiment directory and pipe the executable script into MySQL:
```bash
# Example: Executing Experiment 01
cd EXPERIMENT_01
mysql -u your_username -p < experiment_01.sql

# Example: Executing Experiment 10 (High-Volume Optimization Benchmark)
cd ../EXPERIMENT_10
mysql -u your_username -p < experiment_10.sql
```

### Execution via MySQL Workbench
1. Launch **MySQL Workbench** and connect to your local MySQL Server instance.
2. Select **File ➔ Open SQL Script...** (or press `Ctrl+O`).
3. Select any desired experiment script (e.g., `EXPERIMENT_06/experiment_06.sql`).
4. Execute using the **Execute (Lightning Bolt)** icon or press `Ctrl+Shift+Enter`.
5. Review query results, constraint validations, and `EXPLAIN` execution plans in the result grid.

---

## 👤 Author & Academic Attribution

- **Developer / Student**: Mayank Awasthi
- **Domain**: Database Management Systems (DBMS) & Enterprise Relational Engineering
- **Platform**: MySQL 8.0+ Engine
- **License**: MIT Open Source Academic License

# Grade-Split Results Tables — Bronze Layer

## Overview

This script splits the combined prelim science marks data in the **bronze layer** into separate per-grade results tables. It reads from a single bronze source table and creates/populates three grade-specific tables (Grade 10, 11, 12), all within the `bronze_Curro` schema of the `stg_Curro` staging database.

## Layer Context

This is a **bronze-layer** operation within the Curro medallion architecture:

| Layer  | Database    | Status                                   |
|--------|-------------|-------------------------------------------|
| Bronze | `stg_Curro` | This script operates here                 |
| Silver | `Curro_dwh` | Already created (not populated by this script) |
| Gold   | `Curro_dwh` | Already created (not populated by this script) |

The grade tables created here are filtered copies of raw bronze data, kept within the bronze schema alongside the source table — they have not been cleaned, conformed, or moved into the silver layer. Promoting this data into `Curro_dwh.silver` is a separate, later step.

## Source

```
stg_Curro.bronze_Curro.prelim_science_students_marks
```

## Output Tables

Created in `stg_Curro.bronze_Curro`:

- `Grade10_Results` — rows where `grade` IN ('10A', '10B')
- `Grade11_Results` — rows where `grade` IN ('11A', '11B')
- `Grade12_Results` — rows where `grade` IN ('12A', '12B')

Each table has the same structure:

| Column                          | Type          |
|----------------------------------|---------------|
| student_id                       | NVARCHAR(50)  |
| student_name                     | NVARCHAR(200) |
| grade                            | NVARCHAR(10)  |
| mathematics_mark                 | INT           |
| physical_science_mark            | INT           |
| life_sciences_mark               | INT           |
| english_home_language_mark       | INT           |
| life_orientation_mark            | INT           |
| information_technology_mark      | INT           |
| agricultural_science_mark        | INT           |
| total_mark                       | INT           |
| average_mark                     | FLOAT         |

## How It Works

For each grade:

1. **Existence check** — queries `sys.tables` joined to `sys.schemas` to check whether the target table already exists in the `bronze_Curro` schema.
2. **Conditional create** — if the table doesn't exist, it's created with explicit column widths (avoiding the default `NVARCHAR(1)` truncation trap).
3. **Insert** — filtered rows from the bronze source table are inserted into the new/existing grade table, matched on the relevant grade-class codes (e.g. `10A`, `10B`).

## Usage

Run the full script in SSMS against the `stg_Curro` database. It's idempotent for the create step — re-running won't recreate tables that already exist — but the `INSERT` step is **not** idempotent: running it twice will duplicate rows. If re-running after the tables already exist and are populated, either:

- `TRUNCATE TABLE bronze_Curro.Grade10_Results;` (and 11/12) before re-inserting, or
- Drop and recreate:
  ```sql
  DROP TABLE IF EXISTS bronze_Curro.Grade10_Results;
  DROP TABLE IF EXISTS bronze_Curro.Grade11_Results;
  DROP TABLE IF EXISTS bronze_Curro.Grade12_Results;
  ```
  then re-run the full script.


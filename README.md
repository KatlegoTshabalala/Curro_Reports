# Grade-Split Results Tables — Bronze Layer

## Overview

This script splits the combined prelim science marks data in the **bronze layer** into separate per-grade results tables. It reads from a single bronze source table and creates/populates three grade-specific tables (Grade 10, 11, 12) in the `stg_Curro` staging database.

## Layer Context
This is a **bronze-layer** operation within the Curro medallion architecture:

| Layer  | Database    | Status                                   |
|--------|-------------|-------------------------------------------|
| Bronze | `stg_Curro` | This script operates here                 |
| Silver | `Curro_dwh` | Already created (not populated by this script) |
| Gold   | `Curro_dwh` | Already created (not populated by this script) |

The grade tables created here (`Grade10_Results`, `Grade11_Results`, `Grade12_Results`) are filtered copies of raw bronze data — they have not yet been cleaned, conformed, or moved into the silver layer. Promoting this data into `Curro_dwh.silver` is a separate, later step.

## Source

```
stg_Curro.bronze_Curro.prelim_science_students_marks
```

## Output Tables

Created in `stg_Curro.dbo`:

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

1. **Existence check** — queries `sys.tables` joined to `sys.schemas` to check whether the target table already exists in the `dbo` schema.
2. **Conditional create** — if the table doesn't exist, it's created with explicit column widths (avoiding the default `NVARCHAR(1)` truncation trap).
3. **Insert** — filtered rows from the bronze source table are inserted into the new/existing grade table, matched on the relevant grade-class codes (e.g. `10A`, `10B`).

## Usage

Run the full script (`grade_split.sql`) in SSMS against the `stg_Curro` database. It's idempotent for the create step — re-running won't recreate tables that already exist — but the `INSERT` step is **not** idempotent: running it twice will duplicate rows. If re-running after the tables already exist and are populated, either:

- `TRUNCATE TABLE dbo.Grade10_Results;` (and 11/12) before re-inserting, or
- Drop and recreate:
  ```sql
  DROP TABLE IF EXISTS dbo.Grade10_Results;
  DROP TABLE IF EXISTS dbo.Grade11_Results;
  DROP TABLE IF EXISTS dbo.Grade12_Results;
  ```
  then re-run the full script.

## Known Limitations / Next Steps

- Grade values are matched against hardcoded class codes (`10A`, `10B`, etc.) — if new class codes are added to the source data (e.g. `10C`), the `WHERE` clauses need to be updated manually.
- These tables live in `dbo`, not a dedicated bronze-output schema — consider whether a `bronze_Curro` (or similar) location is more consistent with the rest of the medallion structure.
- No transformation, cleaning, or deduplication has been applied — this is raw filtered bronze data, not silver.
- Promoting this data to `Curro_dwh.silver` (with any cleaning/conforming logic) is a separate step not covered by this script.
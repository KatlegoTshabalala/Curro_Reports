/* ==========================================================
   SILVER LAYER LOAD: Curro Grade 10-12 Results
   ========================================================== */

/* ---------------------------------------------------------
   Grade 10 Results
   --------------------------------------------------------- */
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name = 'silver_Curro'
      AND t.name = 'Grade10_Results'
)
BEGIN
    CREATE TABLE silver_Curro.Grade10_Results (
        [student_id]                  NVARCHAR(50),
        [student_name]                NVARCHAR(200),
        [grade]                       NVARCHAR(10),
        [mathematics_mark]            INT,
        [physical_science_mark]       INT,
        [life_sciences_mark]          INT,
        [english_home_language_mark]  INT,
        [life_orientation_mark]       INT,
        [information_technology_mark] INT,
        [agricultural_science_mark]   INT,
        [total_mark]                  INT,
        [average_mark]                FLOAT
    );
END;

INSERT INTO silver_Curro.Grade10_Results
SELECT DISTINCT
    A.[student_id],
    A.[student_name],
    A.[grade],
    A.[mathematics_mark],
    A.[physical_science_mark],
    A.[life_sciences_mark],
    A.[english_home_language_mark],
    A.[life_orientation_mark],
    A.[information_technology_mark],
    A.[agricultural_science_mark],
    A.[total_mark],
    A.[average_mark]
FROM stg_Curro.bronze_Curro.Grade10_Results AS A
WHERE NOT EXISTS (
    SELECT 1
    FROM silver_Curro.Grade10_Results AS B
    WHERE A.student_id = B.student_id
);


/* ---------------------------------------------------------
   Grade 11 Results
   --------------------------------------------------------- */
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name = 'silver_Curro'
      AND t.name = 'Grade11_Results'
)
BEGIN
    CREATE TABLE silver_Curro.Grade11_Results (
        [student_id]                  NVARCHAR(50),
        [student_name]                NVARCHAR(200),
        [grade]                       NVARCHAR(10),
        [mathematics_mark]            INT,
        [physical_science_mark]       INT,
        [life_sciences_mark]          INT,
        [english_home_language_mark]  INT,
        [life_orientation_mark]       INT,
        [information_technology_mark] INT,
        [agricultural_science_mark]   INT,
        [total_mark]                  INT,
        [average_mark]                FLOAT
    );
END;

INSERT INTO silver_Curro.Grade11_Results
SELECT DISTINCT
    A.[student_id],
    A.[student_name],
    A.[grade],
    A.[mathematics_mark],
    A.[physical_science_mark],
    A.[life_sciences_mark],
    A.[english_home_language_mark],
    A.[life_orientation_mark],
    A.[information_technology_mark],
    A.[agricultural_science_mark],
    A.[total_mark],
    A.[average_mark]
FROM stg_Curro.bronze_Curro.Grade11_Results AS A
WHERE NOT EXISTS (
    SELECT 1
    FROM silver_Curro.Grade11_Results AS B
    WHERE A.student_id = B.student_id
);


/* ---------------------------------------------------------
   Grade 12 Results
   --------------------------------------------------------- */
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name = 'silver_Curro'
      AND t.name = 'Grade12_Results'
)
BEGIN
    CREATE TABLE silver_Curro.Grade12_Results (
        [student_id]                  NVARCHAR(50),
        [student_name]                NVARCHAR(200),
        [grade]                       NVARCHAR(10),
        [mathematics_mark]            INT,
        [physical_science_mark]       INT,
        [life_sciences_mark]          INT,
        [english_home_language_mark]  INT,
        [life_orientation_mark]       INT,
        [information_technology_mark] INT,
        [agricultural_science_mark]   INT,
        [total_mark]                  INT,
        [average_mark]                FLOAT
    );
END;

INSERT INTO silver_Curro.Grade12_Results
SELECT DISTINCT
    A.[student_id],
    A.[student_name],
    A.[grade],
    A.[mathematics_mark],
    A.[physical_science_mark],
    A.[life_sciences_mark],
    A.[english_home_language_mark],
    A.[life_orientation_mark],
    A.[information_technology_mark],
    A.[agricultural_science_mark],
    A.[total_mark],
    A.[average_mark]
FROM stg_Curro.bronze_Curro.Grade12_Results AS A
WHERE NOT EXISTS (
    SELECT 1
    FROM silver_Curro.Grade12_Results AS B
    WHERE A.student_id = B.student_id
);
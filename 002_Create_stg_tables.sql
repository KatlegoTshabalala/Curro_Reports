USE stg_Curro;

----- Grade 10 results
IF NOT EXISTS (
    SELECT 1 FROM sys.tables t JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name = 'dbo' AND t.name = 'Grade10_Results'
)
BEGIN
    CREATE TABLE dbo.Grade10_Results(
         [student_id] NVARCHAR(50)
        ,[student_name] NVARCHAR(200)
        ,[grade] NVARCHAR(10)
        ,[mathematics_mark] INT
        ,[physical_science_mark] INT
        ,[life_sciences_mark] INT
        ,[english_home_language_mark] INT
        ,[life_orientation_mark] INT
        ,[information_technology_mark] INT
        ,[agricultural_science_mark] INT
        ,[total_mark] INT
        ,[average_mark] FLOAT
    );
END

INSERT INTO dbo.Grade10_Results
    ([student_id],[student_name],[grade],[mathematics_mark],[physical_science_mark],
     [life_sciences_mark],[english_home_language_mark],[life_orientation_mark],
     [information_technology_mark],[agricultural_science_mark],[total_mark],[average_mark])
SELECT
     [student_id],[student_name],[grade],[mathematics_mark],[physical_science_mark],
     [life_sciences_mark],[english_home_language_mark],[life_orientation_mark],
     [information_technology_mark],[agricultural_science_mark],[total_mark],[average_mark]
FROM [stg_Curro].[bronze_Curro].[prelim_science_students_marks]
WHERE [grade] IN ('10A','10B');


----- Grade 11 results
IF NOT EXISTS (
    SELECT 1 FROM sys.tables t JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name = 'dbo' AND t.name = 'Grade11_Results'
)
BEGIN
    CREATE TABLE dbo.Grade11_Results(
         [student_id] NVARCHAR(50)
        ,[student_name] NVARCHAR(200)
        ,[grade] NVARCHAR(10)
        ,[mathematics_mark] INT
        ,[physical_science_mark] INT
        ,[life_sciences_mark] INT
        ,[english_home_language_mark] INT
        ,[life_orientation_mark] INT
        ,[information_technology_mark] INT
        ,[agricultural_science_mark] INT
        ,[total_mark] INT
        ,[average_mark] FLOAT
    );
END

INSERT INTO dbo.Grade11_Results
    ([student_id],[student_name],[grade],[mathematics_mark],[physical_science_mark],
     [life_sciences_mark],[english_home_language_mark],[life_orientation_mark],
     [information_technology_mark],[agricultural_science_mark],[total_mark],[average_mark])
SELECT
     [student_id],[student_name],[grade],[mathematics_mark],[physical_science_mark],
     [life_sciences_mark],[english_home_language_mark],[life_orientation_mark],
     [information_technology_mark],[agricultural_science_mark],[total_mark],[average_mark]
FROM [stg_Curro].[bronze_Curro].[prelim_science_students_marks]
WHERE [grade] IN ('11A','11B');


----- Grade 12 results
IF NOT EXISTS (
    SELECT 1 FROM sys.tables t JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name = 'dbo' AND t.name = 'Grade12_Results'
)
BEGIN
    CREATE TABLE dbo.Grade12_Results(
         [student_id] NVARCHAR(50)
        ,[student_name] NVARCHAR(200)
        ,[grade] NVARCHAR(10)
        ,[mathematics_mark] INT
        ,[physical_science_mark] INT
        ,[life_sciences_mark] INT
        ,[english_home_language_mark] INT
        ,[life_orientation_mark] INT
        ,[information_technology_mark] INT
        ,[agricultural_science_mark] INT
        ,[total_mark] INT
        ,[average_mark] FLOAT
    );
END

INSERT INTO dbo.Grade12_Results
    ([student_id],[student_name],[grade],[mathematics_mark],[physical_science_mark],
     [life_sciences_mark],[english_home_language_mark],[life_orientation_mark],
     [information_technology_mark],[agricultural_science_mark],[total_mark],[average_mark])
SELECT
     [student_id],[student_name],[grade],[mathematics_mark],[physical_science_mark],
     [life_sciences_mark],[english_home_language_mark],[life_orientation_mark],
     [information_technology_mark],[agricultural_science_mark],[total_mark],[average_mark]
FROM [stg_Curro].[bronze_Curro].[prelim_science_students_marks]
WHERE [grade] IN ('12A','12B');
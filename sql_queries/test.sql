select
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
FROM
    stg_Curro.bronze_Curro.Grade10_Results as A
WITH AverageData AS (
    SELECT
        YEAR,
        ROUND(AVG(CASE WHEN year = 2008 THEN payroll_value END), 2) AS avg_salary_2008,
        ROUND(AVG(CASE WHEN year = 2008 AND food_category = 'Mléko polotučné pasterované' THEN avg_value_food END), 2) AS avg_milk_price_2008,
        ROUND(AVG(CASE WHEN year = 2018 THEN payroll_value END), 2) AS avg_salary_2018,
        ROUND(AVG(CASE WHEN year = 2018 AND food_category = 'Mléko polotučné pasterované' THEN avg_value_food END), 2) AS avg_milk_price_2018,
        ROUND(AVG(CASE WHEN year = 2008 AND food_category = 'Chléb konzumní kmínový' THEN avg_value_food END), 2) AS avg_bread_price_2008,
        ROUND(AVG(CASE WHEN year = 2018 AND food_category = 'Chléb konzumní kmínový' THEN avg_value_food END), 2) AS avg_bread_price_2018
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE year IN (2008, 2018)
    GROUP BY YEAR
)
SELECT DISTINCT
    btpt.year,
    'mléko' AS product,
    COALESCE(asalary.avg_salary_2008, bsalary.avg_salary_2018) AS avg_salary,
    COALESCE(amilk.avg_milk_price_2008, bmilk.avg_milk_price_2018) AS avg_milk_price,
    ROUND(COALESCE(asalary.avg_salary_2008, bsalary.avg_salary_2018) / COALESCE(amilk.avg_milk_price_2008, bmilk.avg_milk_price_2018), 2) AS quantity
FROM t_Blanka_Toboláková_project_SQL_primary_final AS btpt
LEFT JOIN AverageData AS asalary ON btpt.year = asalary.YEAR AND asalary.YEAR = 2008
LEFT JOIN AverageData AS bsalary ON btpt.year = bsalary.YEAR AND bsalary.YEAR = 2018
LEFT JOIN AverageData AS amilk ON btpt.year = amilk.YEAR AND amilk.YEAR = 2008 AND btpt.food_category = 'Mléko polotučné pasterované'
LEFT JOIN AverageData AS bmilk ON btpt.year = bmilk.YEAR AND bmilk.YEAR = 2018 AND btpt.food_category = 'Mléko polotučné pasterované'
WHERE btpt.year IN (2008, 2018) AND btpt.food_category = 'Mléko polotučné pasterované'
UNION
SELECT DISTINCT
    btpt.year,
    'chléb' AS product,
    COALESCE(asalary.avg_salary_2008, bsalary.avg_salary_2018) AS avg_salary,
    COALESCE(abread.avg_bread_price_2008, bbread.avg_bread_price_2018) AS avg_bread_price,
    ROUND(COALESCE(asalary.avg_salary_2008, bsalary.avg_salary_2018) / COALESCE(abread.avg_bread_price_2008, bbread.avg_bread_price_2018), 2) AS quantity
FROM t_Blanka_Toboláková_project_SQL_primary_final AS btpt
LEFT JOIN AverageData AS asalary ON btpt.year = asalary.YEAR AND asalary.YEAR = 2008
LEFT JOIN AverageData AS bsalary ON btpt.year = bsalary.YEAR AND bsalary.YEAR = 2018
LEFT JOIN AverageData AS abread ON btpt.year = abread.YEAR AND abread.YEAR = 2008 AND btpt.food_category = 'Chléb konzumní kmínový'
LEFT JOIN AverageData AS bbread ON btpt.year = bbread.YEAR AND bbread.YEAR = 2018 AND btpt.food_category = 'Chléb konzumní kmínový'
WHERE btpt.year IN (2008, 2018) AND btpt.food_category = 'Chléb konzumní kmínový';

SELECT DISTINCT
    btpt.year,
    asalary.avg_salary_2008,
    'mléko' AS product,
    amilk.avg_milk_price_2008,
    ROUND(asalary.avg_salary_2008 / amilk.avg_milk_price_2008, 2) AS quantity
FROM
    t_Blanka_Toboláková_project_SQL_primary_final AS btpt
JOIN (
    SELECT
        YEAR,
        ROUND(AVG(payroll_value), 2) AS avg_salary_2008
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE year = 2008
    GROUP BY YEAR
) AS asalary ON btpt.year = asalary.YEAR
JOIN (
    SELECT 
        YEAR,
        ROUND(AVG(avg_value_food), 2) AS avg_milk_price_2008
    FROM t_BlankaT_primary_table
    WHERE food_category = 'Mléko polotučné pasterované'
    GROUP BY YEAR
) AS amilk ON btpt.year = amilk.YEAR
UNION 
SELECT DISTINCT
    btpt.year,
    bsalary.avg_salary_2018,
    'mléko' AS product,
    bmilk.avg_milk_price_2018,
    ROUND(bsalary.avg_salary_2018 / bmilk.avg_milk_price_2018, 2) AS milk_quantity
FROM
    t_Blanka_Toboláková_project_SQL_primary_final AS btpt
JOIN (
    SELECT
        YEAR,
        ROUND(AVG(payroll_value), 2) AS avg_salary_2018
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE year = 2018
    GROUP BY YEAR
) AS bsalary ON btpt.year = bsalary.YEAR
JOIN (
    SELECT 
        YEAR,
        ROUND(AVG(avg_value_food), 2) AS avg_milk_price_2018
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE food_category = 'Mléko polotučné pasterované'
    GROUP BY YEAR
) AS bmilk ON btpt.year = bmilk.YEAR
UNION
SELECT DISTINCT
    btpt.year,
    asalary.avg_salary_2008,
    'chléb' AS product,
    abread.avg_bread_price_2008,
    ROUND(asalary.avg_salary_2008 / abread.avg_bread_price_2008, 2) AS quantity
FROM
    t_Blanka_Toboláková_project_SQL_primary_final AS btpt
JOIN (
    SELECT
        YEAR,
        ROUND(AVG(payroll_value), 2) AS avg_salary_2008
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE year = 2008
    GROUP BY YEAR
) AS asalary ON btpt.year = asalary.YEAR
JOIN (
    SELECT 
        YEAR,
        ROUND(AVG(avg_value_food), 2) AS avg_bread_price_2008
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE food_category = 'Chléb konzumní kmínový'
    GROUP BY YEAR
) AS abread ON btpt.year = abread.YEAR
UNION 
SELECT DISTINCT
    btpt.year,
    bsalary.avg_salary_2018,
    'chléb' AS product,
    bbread.avg_bread_price_2018,
    ROUND(bsalary.avg_salary_2018 / bbread.avg_bread_price_2018, 2) AS quantity
FROM
    t_Blanka_Toboláková_project_SQL_primary_final AS btpt
JOIN (
    SELECT
        YEAR,
        ROUND(AVG(payroll_value), 2) AS avg_salary_2018
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE year = 2018
    GROUP BY YEAR
) AS bsalary ON btpt.year = bsalary.YEAR
JOIN (
    SELECT 
        YEAR,
        ROUND(AVG(avg_value_food), 2) AS avg_bread_price_2018
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    WHERE food_category = 'Chléb konzumní kmínový'
    GROUP BY YEAR
) AS bbread ON btpt.year = bbread.YEAR;

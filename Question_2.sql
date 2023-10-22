SELECT
    YEAR,
    food_category,
    avg(avg_value_food) AS avg_food_price,
    avg(payroll_value) AS avg_salary,
    round(avg(payroll_value) / avg(avg_value_food)) AS quantity
FROM t_Blanka_Toboláková_project_SQL_primary_final
WHERE 
    year IN (2008, 2018)
    AND food_category IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY YEAR, food_category;

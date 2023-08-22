/*Rozdíl meziročního nárustu cen potravin a mezd v procentech*/

SELECT DISTINCT
    f.YEAR,
    ROUND((f.avg_value_food - f2.avg_value_food) / f2.avg_value_food * 100, 2) AS avg_value_food_growth,
    ROUND((f.avg_payroll - f2.avg_payroll) / f2.avg_payroll * 100, 2) AS avg_payroll_value_growth,
    ROUND(((f.avg_value_food - f2.avg_value_food) / f2.avg_value_food * 100) - ((f.avg_payroll - f2.avg_payroll) / f2.avg_payroll * 100), 2) AS difference
FROM (
    SELECT 
        YEAR,
        AVG(avg_value_food) AS avg_value_food,
        AVG(payroll_value) AS avg_payroll
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    GROUP BY YEAR
	 ) AS f
 JOIN (
    SELECT 
        YEAR,
        AVG(avg_value_food) AS avg_value_food,
        AVG(payroll_value) AS avg_payroll
    FROM t_Blanka_Toboláková_project_SQL_primary_final
    GROUP BY YEAR
	) AS f2 
 ON f.year = f2.year + 1
 AND f.year < 2019
ORDER BY difference DESC ;

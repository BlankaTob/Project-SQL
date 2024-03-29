/* Meziroční percentuální nárůst u * kategorií potravin.*/

SELECT DISTINCT 
	f.food_category,
	f.YEAR,
	f2.year + 1 as year_prev,
	round( ( f.avg_value_food - f2.avg_value_food ) / f2.avg_value_food * 100, 2 ) as avg_value_food_growth
	FROM t_Blanka_Toboláková_project_SQL_primary_final AS f
JOIN t_Blanka_Toboláková_project_SQL_primary_final AS f2
    ON f.food_category = f2.food_category
    AND f.year = f2.year + 1
    AND f.year < 2019
ORDER BY avg_value_food_growth ASC; 

/*dlouhodobý trend*/

SELECT
    food_category,
    AVG(CASE WHEN year = 2006 THEN avg_value_food END) AS avg_value_food_2006,
    AVG(CASE WHEN year = 2018 THEN avg_value_food END) AS avg_value_food_2018,
    ROUND(((AVG(CASE WHEN year = 2018 THEN avg_value_food END) - AVG(CASE WHEN year = 2006 THEN avg_value_food END)) / AVG(CASE WHEN year = 2006 THEN avg_value_food END)) * 100, 2) AS percentage_change,
    CASE
        WHEN AVG(avg_value_food) > AVG(CASE WHEN year = 2006 THEN avg_value_food END) THEN 'growth'
        WHEN AVG(avg_value_food) < AVG(CASE WHEN year = 2006 THEN avg_value_food END) THEN 'decline'
        ELSE 'Stability'
    END AS trend
FROM
     t_Blanka_Toboláková_project_SQL_primary_final
WHERE
    year BETWEEN 2006 AND 2018
GROUP BY 
    food_category ;

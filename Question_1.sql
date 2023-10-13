/*příklad.1*/
/*dlouhodobý trend*/

SELECT
   industry_name,
    AVG(CASE WHEN year = 2006 THEN payroll_value END) AS avg_payroll_2006,
    AVG(CASE WHEN year = 2018 THEN payroll_value END) AS avg_payroll_2018,
    ROUND(((AVG(CASE WHEN year = 2018 THEN payroll_value END) - AVG(CASE WHEN year = 2006 THEN payroll_value END)) / AVG(CASE WHEN year = 2006 THEN payroll_value END)) * 100, 2) AS percentage_change,
    CASE
        WHEN AVG(payroll_value) > AVG(CASE WHEN year = 2006 THEN payroll_value END) THEN 'growth'
        WHEN AVG(payroll_value) < AVG(CASE WHEN year = 2006 THEN payroll_value END) THEN 'decline'
        ELSE 'Stability'
    END AS trend
FROM
     t_Blanka_Toboláková_project_SQL_primary_final
WHERE
    year BETWEEN 2006 AND 2018
GROUP BY 
    industry_name ;

 /*podrobnější analýza*/

WITH CTE AS (
    SELECT
        industry_name,
        year,
        ROUND(AVG(payroll_value), 0) AS avg_payroll,    
        ROUND(AVG(payroll_value) / LAG(ROUND(AVG(payroll_value), 0)) OVER (PARTITION BY industry_name ORDER BY industry_name, year) * 100 - 100, 2) AS salary_difference
    FROM
        t_Blanka_Toboláková_project_SQL_primary_final
    WHERE
        year BETWEEN 2006 AND 2018
    GROUP BY 
        industry_name, year
)
SELECT
    industry_name,
    year,
    avg_payroll,
    salary_difference
FROM
    CTE
WHERE
    salary_difference IS NOT NULL
ORDER BY
 salary_difference, year;   

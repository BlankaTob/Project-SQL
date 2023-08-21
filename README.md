#  Project SQL Engeto Academy

Discord:

Tento project zpracovává předem definovné výzkumné otázky, které adresují dostupnost základních potravin široké veřejnosti.
Připravila jsem datové podklady, ve kterých je možné vidět porovnání dostupnosti potravin na základě průměrných příjmů
během časového období pro roky 2008 - 2018.

## Výzkumné otázky:
1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a 
   mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na 
   cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

## Finální tabulky
Vytvořila jsem **primární tabulku t_Blanka_Toboláková_project_SQL_primary_final**. Která zpracovává data mezd a cen potravin za 
Českou republiku sjednocených na totožné porovnatelné období -společné roky. 
Tato tabulka obsahuje sloupce:
  + **category_code**
  + **food_category**
  + **year**
  + **avg_value_food**
  + **food_price**
  + **code**
  + **industry_name**
  + **payroll_value**

 Dále jsem vytvořila **sekundární tabulku t_Blanka_Toboláková_project_SQL_secondary_table**.
 Tato tabulka obsahuje sloupce:
   + **cauntry**
   + **year**
   + **GDP**
   + **gini**
   + **population**

   






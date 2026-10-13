USE global_development;
CREATE TABLE development_data (
    country_name VARCHAR(100),
    country_code VARCHAR(10),
    year INT,
    gdp_per_capita DECIMAL(15,2),
    inflation DECIMAL(10,2),
    unemployment DECIMAL(10,2),
    population BIGINT
);
SELECT COUNT(*) AS total_records
FROM development_data;

SELECT
    country_name,
    gdp_per_capita
FROM development_data
WHERE year = 2024
ORDER BY gdp_per_capita DESC;

SELECT
    country_name,
    ROUND(AVG(gdp_per_capita), 2) AS avg_gdp_per_capita
FROM development_data
GROUP BY country_name
ORDER BY avg_gdp_per_capita DESC;

SELECT
    country_name,
    ROUND(AVG(inflation), 2) AS avg_inflation
FROM development_data
GROUP BY country_name
ORDER BY avg_inflation DESC;

SELECT
    country_name,
    ROUND(AVG(unemployment), 2) AS avg_unemployment
FROM development_data
GROUP BY country_name
ORDER BY avg_unemployment DESC;

SELECT
    country_name,
    ROUND(AVG(population), 0) AS avg_population
FROM development_data
GROUP BY country_name
ORDER BY avg_population DESC;

SELECT
    year,
    gdp_per_capita
FROM development_data
WHERE country_name = 'India'
ORDER BY year;

SELECT
    ROUND(
        (MAX(CASE WHEN year = 2024 THEN gdp_per_capita END) -
         MAX(CASE WHEN year = 2000 THEN gdp_per_capita END))
        / MAX(CASE WHEN year = 2000 THEN gdp_per_capita END) * 100,
        2
    ) AS india_gdp_growth_percent
FROM development_data
WHERE country_name = 'India';

SELECT
    country_name,
    ROUND(
        (MAX(CASE WHEN year = 2024 THEN gdp_per_capita END) -
         MAX(CASE WHEN year = 2000 THEN gdp_per_capita END))
        / MAX(CASE WHEN year = 2000 THEN gdp_per_capita END) * 100,
        2
    ) AS gdp_growth_percent
FROM development_data
GROUP BY country_name
ORDER BY gdp_growth_percent DESC;

SELECT
    country_name,
    COUNT(DISTINCT year) AS years_available,
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM development_data
GROUP BY country_name
ORDER BY country_name;

SELECT
    COUNT(*) AS total_records,
    SUM(gdp_per_capita IS NULL) AS missing_gdp,
    SUM(inflation IS NULL) AS missing_inflation,
    SUM(unemployment IS NULL) AS missing_unemployment,
    SUM(population IS NULL) AS missing_population
FROM development_data;

SELECT
    country_name,
    ROUND(gdp_per_capita, 2) AS gdp_per_capita
FROM development_data
WHERE year = 2024
ORDER BY gdp_per_capita DESC;

SELECT
    country_name,
    ROUND(inflation, 2) AS inflation_percent
FROM development_data
WHERE year = 2024
ORDER BY inflation DESC;

SELECT
    country_name,
    ROUND(unemployment, 2) AS unemployment_percent
FROM development_data
WHERE year = 2024
ORDER BY unemployment DESC;

SELECT
    country_name,
    population
FROM development_data
WHERE year = 2024
ORDER BY population DESC;

SELECT
    country_name,
    year,
    COUNT(*) AS record_count
FROM development_data
GROUP BY country_name, year
HAVING COUNT(*) > 1;

SELECT
    country_name,
    COUNT(DISTINCT year) AS years_available
FROM development_data
GROUP BY country_name
ORDER BY country_name;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT country_name) AS total_countries,
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM development_data;

SELECT
    country_name,
    ROUND(AVG(unemployment), 2) AS avg_unemployment
FROM development_data
GROUP BY country_name
ORDER BY avg_unemployment DESC
LIMIT 1;

SELECT
    country_name,
    ROUND(AVG(gdp_per_capita), 2) AS avg_gdp_per_capita
FROM development_data
GROUP BY country_name
ORDER BY avg_gdp_per_capita DESC
LIMIT 1;

SELECT
    country_name,
    ROUND(AVG(inflation), 2) AS avg_inflation
FROM development_data
GROUP BY country_name
ORDER BY avg_inflation DESC
LIMIT 1;

SELECT
    country_name,
    ROUND(AVG(gdp_per_capita), 2) AS avg_gdp_per_capita,
    ROUND(AVG(inflation), 2) AS avg_inflation,
    ROUND(AVG(unemployment), 2) AS avg_unemployment,
    ROUND(AVG(population), 0) AS avg_population
FROM development_data
GROUP BY country_name
ORDER BY avg_gdp_per_capita DESC;
-- Average PM2.5 by country
SELECT country, AVG(value) AS avg_pm25
FROM air_quality_measurements
WHERE parameter = 'pm25'
GROUP BY country
ORDER BY avg_pm25 DESC;

-- Join air quality with health metrics to analyze correlation potential
SELECT a.country, 
       ROUND(AVG(a.value), 2) AS avg_pm25,
       h.life_expectancy,
       h.respiratory_deaths_per_100k
FROM air_quality_measurements a
JOIN country_health_metrics h ON a.country = h.country
WHERE a.parameter = 'pm25' AND h.year = 2023
GROUP BY a.country, h.life_expectancy, h.respiratory_deaths_per_100k
ORDER BY avg_pm25 DESC;

-- Find countries with high pollution but low hospital infrastructure
SELECT h.country, AVG(a.value) AS avg_pm25, h.hospital_beds_per_1000
FROM air_quality_measurements a
JOIN country_health_metrics h ON a.country = h.country
WHERE a.parameter = 'pm25' AND h.year = 2023
GROUP BY h.country, h.hospital_beds_per_1000
HAVING AVG(a.value) > 100 AND h.hospital_beds_per_1000 < 1
ORDER BY avg_pm25 DESC;

-- Urbanization vs Pollution
SELECT d.country, d.urban_population_pct, ROUND(AVG(a.value), 2) AS avg_pm25
FROM country_demographics d
JOIN air_quality_measurements a ON a.country = d.country
WHERE a.parameter = 'pm25' AND d.year = 2023
GROUP BY d.country, d.urban_population_pct
ORDER BY avg_pm25 DESC;

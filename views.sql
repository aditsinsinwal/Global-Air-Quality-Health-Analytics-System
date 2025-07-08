-- View: Average PM2.5 by country and month
CREATE VIEW avg_pm25_by_country_month AS
SELECT
    country,
    DATE_TRUNC('month', measurement_time) AS month,
    ROUND(AVG(value), 2) AS avg_pm25
FROM air_quality_measurements
WHERE parameter = 'pm25'
GROUP BY country, DATE_TRUNC('month', measurement_time);

-- View: Health risk summary per country
CREATE VIEW country_health_risk_summary AS
SELECT
    h.country,
    h.year,
    h.life_expectancy,
    h.respiratory_deaths_per_100k,
    d.urban_population_pct,
    ROUND(AVG(a.value), 2) AS avg_pm25
FROM country_health_metrics h
JOIN country_demographics d ON h.country = d.country AND h.year = d.year
JOIN air_quality_measurements a ON h.country = a.country
WHERE a.parameter = 'pm25'
GROUP BY h.country, h.year, h.life_expectancy, h.respiratory_deaths_per_100k, d.urban_population_pct;

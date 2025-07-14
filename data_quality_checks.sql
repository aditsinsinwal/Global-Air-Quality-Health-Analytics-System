-- Find missing coordinates in air_quality_measurements
SELECT * FROM air_quality_measurements
WHERE latitude IS NULL OR longitude IS NULL;
-- Detect inconsistent country names between datasets
SELECT DISTINCT a.country
FROM air_quality_measurements a
LEFT JOIN country_health_metrics h ON a.country = h.country
WHERE h.country IS NULL;
-- Check for negative or nonsensical pollution values
SELECT * FROM air_quality_measurements
WHERE value < 0;
-- Ensure each country has at least one health record for the latest year
SELECT country
FROM country_demographics
WHERE year = 2023
EXCEPT
SELECT country
FROM country_health_metrics
WHERE year = 2023;

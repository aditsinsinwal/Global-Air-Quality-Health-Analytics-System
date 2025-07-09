-- Stored procedure: Flag countries with hazardous pollution
CREATE OR REPLACE FUNCTION flag_high_pollution_countries(threshold NUMERIC DEFAULT 100.0)
RETURNS TABLE(country VARCHAR, avg_pm25 NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT
        country,
        ROUND(AVG(value), 2)
    FROM air_quality_measurements
    WHERE parameter = 'pm25'
    GROUP BY country
    HAVING AVG(value) > threshold;
END;
$$ LANGUAGE plpgsql;

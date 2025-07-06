-- Table: Air Quality Measurements from OpenAQ
CREATE TABLE air_quality_measurements (
    id SERIAL PRIMARY KEY,
    city VARCHAR(100),
    country VARCHAR(50),
    location VARCHAR(100),
    parameter VARCHAR(20), -- PM2.5, PM10, NO2, etc.
    value NUMERIC,
    unit VARCHAR(10),
    measurement_time TIMESTAMP,
    latitude NUMERIC,
    longitude NUMERIC
);

-- Table: Country-level Health Metrics (World Bank)
CREATE TABLE country_health_metrics (
    id SERIAL PRIMARY KEY,
    country VARCHAR(100),
    year INT,
    life_expectancy NUMERIC,
    respiratory_deaths_per_100k NUMERIC,
    hospital_beds_per_1000 NUMERIC
);

-- Table: Demographics and Economic Data
CREATE TABLE country_demographics (
    id SERIAL PRIMARY KEY,
    country VARCHAR(100),
    year INT,
    population BIGINT,
    gdp_per_capita NUMERIC,
    urban_population_pct NUMERIC
);

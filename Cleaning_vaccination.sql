-- Select all records ordered by specific columns
SELECT *
FROM COVID..Covidvaccinations
ORDER BY 3, 4;

-- Delete a specific record by ID
DELETE FROM COVID..CovidVaccinations
WHERE ID = 1;

-- Drop the ID column if it's not needed
ALTER TABLE COVID..CovidVaccinations
DROP COLUMN ID;

-- Format the date column (assuming date is in MM/DD/YYYY format)
UPDATE COVID..CovidVaccinations
SET date = SUBSTRING(date, 4, 2) + '-' + LEFT(date, 2) + '-' + RIGHT(date, 4)
WHERE date IS NOT NULL;

-- Alter the date column to the DATE data type
ALTER TABLE COVID..CovidVaccinations
ALTER COLUMN date DATE;

-- Update numeric columns, setting them to NULL if conversion fails
UPDATE COVID..CovidVaccinations
SET 
    new_tests = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), new_tests) IS NULL THEN NULL ELSE new_tests END,
    total_tests = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), total_tests) IS NULL THEN NULL ELSE total_tests END,
    total_tests_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), total_tests_per_thousand) IS NULL THEN NULL ELSE total_tests_per_thousand END,
    new_tests_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), new_tests_per_thousand) IS NULL THEN NULL ELSE new_tests_per_thousand END,
    new_tests_smoothed = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), new_tests_smoothed) IS NULL THEN NULL ELSE new_tests_smoothed END,
    new_tests_smoothed_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), new_tests_smoothed_per_thousand) IS NULL THEN NULL ELSE new_tests_smoothed_per_thousand END,
    positive_rate = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), positive_rate) IS NULL THEN NULL ELSE positive_rate END,
    tests_per_case = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), tests_per_case) IS NULL THEN NULL ELSE tests_per_case END,
    total_vaccinations = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), total_vaccinations) IS NULL THEN NULL ELSE total_vaccinations END,
    people_vaccinated = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), people_vaccinated) IS NULL THEN NULL ELSE people_vaccinated END,
    people_fully_vaccinated = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), people_fully_vaccinated) IS NULL THEN NULL ELSE people_fully_vaccinated END,
    new_vaccinations = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), new_vaccinations) IS NULL THEN NULL ELSE new_vaccinations END,
    new_vaccinations_smoothed = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), new_vaccinations_smoothed) IS NULL THEN NULL ELSE new_vaccinations_smoothed END,
    total_vaccinations_per_hundred = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), total_vaccinations_per_hundred) IS NULL THEN NULL ELSE total_vaccinations_per_hundred END,
    people_vaccinated_per_hundred = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), people_vaccinated_per_hundred) IS NULL THEN NULL ELSE people_vaccinated_per_hundred END,
    people_fully_vaccinated_per_hundred = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), people_fully_vaccinated_per_hundred) IS NULL THEN NULL ELSE people_fully_vaccinated_per_hundred END,
    new_vaccinations_smoothed_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), new_vaccinations_smoothed_per_million) IS NULL THEN NULL ELSE new_vaccinations_smoothed_per_million END,
    stringency_index = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), stringency_index) IS NULL THEN NULL ELSE stringency_index END,
    population_density = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), population_density) IS NULL THEN NULL ELSE population_density END,
    median_age = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), median_age) IS NULL THEN NULL ELSE median_age END,
    aged_65_older = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), aged_65_older) IS NULL THEN NULL ELSE aged_65_older END,
    aged_70_older = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), aged_70_older) IS NULL THEN NULL ELSE aged_70_older END,
    gdp_per_capita = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), gdp_per_capita) IS NULL THEN NULL ELSE gdp_per_capita END,
    extreme_poverty = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), extreme_poverty) IS NULL THEN NULL ELSE extreme_poverty END,
    cardiovasc_death_rate = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), cardiovasc_death_rate) IS NULL THEN NULL ELSE cardiovasc_death_rate END,
    diabetes_prevalence = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), diabetes_prevalence) IS NULL THEN NULL ELSE diabetes_prevalence END,
    female_smokers = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), female_smokers) IS NULL THEN NULL ELSE female_smokers END,
    male_smokers = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), male_smokers) IS NULL THEN NULL ELSE male_smokers END,
    handwashing_facilities = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), handwashing_facilities) IS NULL THEN NULL ELSE handwashing_facilities END,
    hospital_beds_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), hospital_beds_per_thousand) IS NULL THEN NULL ELSE hospital_beds_per_thousand END,
    life_expectancy = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), life_expectancy) IS NULL THEN NULL ELSE life_expectancy END,
    human_development_index = CASE WHEN TRY_CONVERT(NUMERIC(15, 6), human_development_index) IS NULL THEN NULL ELSE human_development_index END;

-- Alter column data types as required
ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN iso_code VARCHAR(255);

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN continent VARCHAR(255);

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN location VARCHAR(255);

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN new_tests INT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN total_tests INT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN total_tests_per_thousand FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN new_tests_per_thousand FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN new_tests_smoothed FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN new_tests_smoothed_per_thousand FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN positive_rate FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN tests_per_case FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN tests_units VARCHAR(255);

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN total_vaccinations INT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN people_vaccinated INT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN people_fully_vaccinated INT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN new_vaccinations INT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN new_vaccinations_smoothed FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN total_vaccinations_per_hundred FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN people_vaccinated_per_hundred FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN people_fully_vaccinated_per_hundred FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN new_vaccinations_smoothed_per_million FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN stringency_index FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN population_density FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN median_age FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN aged_65_older FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN aged_70_older FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN gdp_per_capita FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN extreme_poverty FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN cardiovasc_death_rate FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN diabetes_prevalence FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN female_smokers FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN male_smokers FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN handwashing_facilities FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN hospital_beds_per_thousand FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN life_expectancy FLOAT;

ALTER TABLE COVID..CovidVaccinations 
ALTER COLUMN human_development_index FLOAT;

-- Set empty strings to NULL for specific columns
UPDATE COVID..CovidVaccinations
SET tests_units = NULL
WHERE tests_units = '';

UPDATE COVID..CovidVaccinations
SET continent = NULL
WHERE continent = '';

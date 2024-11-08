-- Imported the data as a flat file (.csv) then modified the data types for each column

SELECT *
FROM COVID..COVIDDEATHS
ORDER BY 3,4;

DELETE FROM COVID..CovidDeaths
WHERE ID = 1;

ALTER TABLE COVID..CovidDeaths
DROP COLUMN ID;

UPDATE covid..CovidDeaths
SET date = SUBSTRING(date, 4, 2) + '-' + LEFT(date, 2) + '-' + RIGHT(date, 4)
WHERE date IS NOT NULL;

ALTER TABLE covid..CovidDeaths
ALTER COLUMN date DATE;

UPDATE covid..CovidDeaths
SET 
    total_cases = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_cases) IS NULL THEN NULL ELSE total_cases END,
    new_cases = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_cases) IS NULL THEN NULL ELSE new_cases END,
    new_cases_smoothed = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_cases_smoothed) IS NULL THEN NULL ELSE new_cases_smoothed END,
    total_deaths = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_deaths) IS NULL THEN NULL ELSE total_deaths END,
    new_deaths = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_deaths) IS NULL THEN NULL ELSE new_deaths END,
    new_deaths_smoothed = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_deaths_smoothed) IS NULL THEN NULL ELSE new_deaths_smoothed END,
    total_cases_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_cases_per_million) IS NULL THEN NULL ELSE total_cases_per_million END,
    new_cases_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_cases_per_million) IS NULL THEN NULL ELSE new_cases_per_million END,
    new_cases_smoothed_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_cases_smoothed_per_million) IS NULL THEN NULL ELSE new_cases_smoothed_per_million END,
    total_deaths_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_deaths_per_million) IS NULL THEN NULL ELSE total_deaths_per_million END,
    new_deaths_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_deaths_per_million) IS NULL THEN NULL ELSE new_deaths_per_million END,
    new_deaths_smoothed_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_deaths_smoothed_per_million) IS NULL THEN NULL ELSE new_deaths_smoothed_per_million END,
    reproduction_rate = CASE WHEN TRY_CONVERT(NUMERIC(15,6), reproduction_rate) IS NULL THEN NULL ELSE reproduction_rate END,
    icu_patients = CASE WHEN TRY_CONVERT(NUMERIC(15,6), icu_patients) IS NULL THEN NULL ELSE icu_patients END,
    icu_patients_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), icu_patients_per_million) IS NULL THEN NULL ELSE icu_patients_per_million END,
    hosp_patients = CASE WHEN TRY_CONVERT(NUMERIC(15,6), hosp_patients) IS NULL THEN NULL ELSE hosp_patients END,
    hosp_patients_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), hosp_patients_per_million) IS NULL THEN NULL ELSE hosp_patients_per_million END,
    weekly_icu_admissions = CASE WHEN TRY_CONVERT(NUMERIC(15,6), weekly_icu_admissions) IS NULL THEN NULL ELSE weekly_icu_admissions END,
    weekly_icu_admissions_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), weekly_icu_admissions_per_million) IS NULL THEN NULL ELSE weekly_icu_admissions_per_million END,
    weekly_hosp_admissions = CASE WHEN TRY_CONVERT(NUMERIC(15,6), weekly_hosp_admissions) IS NULL THEN NULL ELSE weekly_hosp_admissions END,
    weekly_hosp_admissions_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), weekly_hosp_admissions_per_million) IS NULL THEN NULL ELSE weekly_hosp_admissions_per_million END,
    new_tests = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_tests) IS NULL THEN NULL ELSE new_tests END,
    total_tests = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_tests) IS NULL THEN NULL ELSE total_tests END,
    total_tests_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_tests_per_thousand) IS NULL THEN NULL ELSE total_tests_per_thousand END,
    new_tests_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_tests_per_thousand) IS NULL THEN NULL ELSE new_tests_per_thousand END,
    new_tests_smoothed = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_tests_smoothed) IS NULL THEN NULL ELSE new_tests_smoothed END,
    new_tests_smoothed_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_tests_smoothed_per_thousand) IS NULL THEN NULL ELSE new_tests_smoothed_per_thousand END,
    positive_rate = CASE WHEN TRY_CONVERT(NUMERIC(15,6), positive_rate) IS NULL THEN NULL ELSE positive_rate END,
    tests_per_case = CASE WHEN TRY_CONVERT(NUMERIC(15,6), tests_per_case) IS NULL THEN NULL ELSE tests_per_case END,
    total_vaccinations = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_vaccinations) IS NULL THEN NULL ELSE total_vaccinations END,
    people_vaccinated = CASE WHEN TRY_CONVERT(NUMERIC(15,6), people_vaccinated) IS NULL THEN NULL ELSE people_vaccinated END,
    people_fully_vaccinated = CASE WHEN TRY_CONVERT(NUMERIC(15,6), people_fully_vaccinated) IS NULL THEN NULL ELSE people_fully_vaccinated END,
    new_vaccinations = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_vaccinations) IS NULL THEN NULL ELSE new_vaccinations END,
    new_vaccinations_smoothed = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_vaccinations_smoothed) IS NULL THEN NULL ELSE new_vaccinations_smoothed END,
    total_vaccinations_per_hundred = CASE WHEN TRY_CONVERT(NUMERIC(15,6), total_vaccinations_per_hundred) IS NULL THEN NULL ELSE total_vaccinations_per_hundred END,
    people_vaccinated_per_hundred = CASE WHEN TRY_CONVERT(NUMERIC(15,6), people_vaccinated_per_hundred) IS NULL THEN NULL ELSE people_vaccinated_per_hundred END,
    people_fully_vaccinated_per_hundred = CASE WHEN TRY_CONVERT(NUMERIC(15,6), people_fully_vaccinated_per_hundred) IS NULL THEN NULL ELSE people_fully_vaccinated_per_hundred END,
    new_vaccinations_smoothed_per_million = CASE WHEN TRY_CONVERT(NUMERIC(15,6), new_vaccinations_smoothed_per_million) IS NULL THEN NULL ELSE new_vaccinations_smoothed_per_million END,
    stringency_index = CASE WHEN TRY_CONVERT(NUMERIC(15,6), stringency_index) IS NULL THEN NULL ELSE stringency_index END,
    population = CASE WHEN TRY_CONVERT(NUMERIC(15,6), population) IS NULL THEN NULL ELSE population END,
    population_density = CASE WHEN TRY_CONVERT(NUMERIC(15,6), population_density) IS NULL THEN NULL ELSE population_density END,
    median_age = CASE WHEN TRY_CONVERT(NUMERIC(15,6), median_age) IS NULL THEN NULL ELSE median_age END,
    aged_65_older = CASE WHEN TRY_CONVERT(NUMERIC(15,6), aged_65_older) IS NULL THEN NULL ELSE aged_65_older END,
    aged_70_older = CASE WHEN TRY_CONVERT(NUMERIC(15,6), aged_70_older) IS NULL THEN NULL ELSE aged_70_older END,
    gdp_per_capita = CASE WHEN TRY_CONVERT(NUMERIC(15,6), gdp_per_capita) IS NULL THEN NULL ELSE gdp_per_capita END,
    extreme_poverty = CASE WHEN TRY_CONVERT(NUMERIC(15,6), extreme_poverty) IS NULL THEN NULL ELSE extreme_poverty END,
    cardiovasc_death_rate = CASE WHEN TRY_CONVERT(NUMERIC(15,6), cardiovasc_death_rate) IS NULL THEN NULL ELSE cardiovasc_death_rate END,
    diabetes_prevalence = CASE WHEN TRY_CONVERT(NUMERIC(15,6), diabetes_prevalence) IS NULL THEN NULL ELSE diabetes_prevalence END,
    female_smokers = CASE WHEN TRY_CONVERT(NUMERIC(15,6), female_smokers) IS NULL THEN NULL ELSE female_smokers END,
    male_smokers = CASE WHEN TRY_CONVERT(NUMERIC(15,6), male_smokers) IS NULL THEN NULL ELSE male_smokers END,
    handwashing_facilities = CASE WHEN TRY_CONVERT(NUMERIC(15,6), handwashing_facilities) IS NULL THEN NULL ELSE handwashing_facilities END,
    hospital_beds_per_thousand = CASE WHEN TRY_CONVERT(NUMERIC(15,6), hospital_beds_per_thousand) IS NULL THEN NULL ELSE hospital_beds_per_thousand END,
    life_expectancy = CASE WHEN TRY_CONVERT(NUMERIC(15,6), life_expectancy) IS NULL THEN NULL ELSE life_expectancy END,
    human_development_index = CASE WHEN TRY_CONVERT(NUMERIC(15,6), human_development_index) IS NULL THEN NULL ELSE human_development_index END;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN iso_code VARCHAR(255);

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN continent VARCHAR(255);

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN location VARCHAR(255);

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_cases FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_cases FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_cases_smoothed FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_deaths FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_deaths FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_deaths_smoothed FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_cases_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_cases_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_cases_smoothed_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_deaths_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_deaths_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_deaths_smoothed_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN reproduction_rate FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN icu_patients FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN icu_patients_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN hosp_patients FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN hosp_patients_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN weekly_icu_admissions FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN weekly_icu_admissions_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN weekly_hosp_admissions FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN weekly_hosp_admissions_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_tests FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_tests FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_tests_per_thousand FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_tests_per_thousand FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_tests_smoothed FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_tests_smoothed_per_thousand FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN positive_rate FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN tests_per_case FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN tests_units VARCHAR(255);

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_vaccinations FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN people_vaccinated FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN people_fully_vaccinated FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_vaccinations FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_vaccinations_smoothed FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN total_vaccinations_per_hundred FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN people_vaccinated_per_hundred FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN people_fully_vaccinated_per_hundred FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN new_vaccinations_smoothed_per_million FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN stringency_index FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN population FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN population_density FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN median_age FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN aged_65_older FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN aged_70_older FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN gdp_per_capita FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN extreme_poverty FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN cardiovasc_death_rate FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN diabetes_prevalence FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN female_smokers FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN male_smokers FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN handwashing_facilities FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN hospital_beds_per_thousand FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN life_expectancy FLOAT;

ALTER TABLE covid..CovidDeaths 
ALTER COLUMN human_development_index FLOAT;

UPDATE COVID..COVIDDEATHS
SET tests_units = NULL
WHERE tests_units = '';

UPDATE COVID..COVIDDEATHS
SET continent = NULL
WHERE continent = '';
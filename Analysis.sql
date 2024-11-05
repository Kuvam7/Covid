-- Total Cases vs Total deaths (FATALITY RATE OF COVID)

Select location, SUM(total_cases) AS total_cases, SUM(total_deaths) AS total_deaths, ROUND(AVG((total_deaths/total_CASES)*100),2) as fatality_rate
from covid..coviddeaths
WHERE ROUND((total_deaths/total_CASES)*100,2) IS NOT NULL
GROUP BY LOCATION
order by 4 DESC;

-- Population affected i.e. COVID INFECTION RATE
-- Total cases vs population

SELECT location, date, total_cases, population, ROUND((total_cases/population)*100,2) as infection_rate
FROM covid..CovidDeaths
WHERE (total_cases/population)*100 is not null
ORDER BY 2;

-- Highest Infection Rates grouped by countries

SELECT location,MAX(total_cases) as total_cases, AVG(population)as popln, MAX(ROUND((total_cases/population)*100,2)) as infection_rate
FROM covid..CovidDeaths
WHERE ROUND((total_cases/population)*100,2) is not null
GROUP BY location
ORDER BY 4 desc;

-- Countries with Highest Death rate

SELECT location, MAX(total_deaths) as total_deaths, population, MAX(ROUND((total_deaths/population)*100,2)) as death_rate
FROM covid..CovidDeaths
WHERE ROUND((total_deaths/population)*100,2) is not null
GROUP BY location,population
ORDER BY Death_rate desc;

-- Countries with highest death count

SELECT location, MAX(total_deaths) as TotalDeaths
from covid..CovidDeaths
WHERE total_deaths is not null
GROUP BY location
ORDER BY TotalDeaths DESC;

-- location includes Continents which we do not want as we already have another column for continent
-- Therefore, the query needs to be modified

SELECT location, MAX(total_deaths) as TotalDeaths
from covid..CovidDeaths
WHERE total_deaths is not null AND continent is not null
GROUP BY location
ORDER BY TotalDeaths DESC;

-- Breaking it down by continent

SELECT continent, MAX(total_deaths) as TotalDeaths
from covid..CovidDeaths
WHERE total_deaths is not null AND continent is not null
GROUP BY continent
ORDER BY TotalDeaths DESC;

-- Other way of doing it (Better insights)

SELECT location, MAX(total_deaths) as TotalDeaths
from covid..CovidDeaths
WHERE total_deaths is not null AND continent is null
GROUP BY location
ORDER BY TotalDeaths DESC;

-- Global Numbers

Select 
	date,
	SUM(new_cases) as total_cases,
	SUM(new_deaths) as Total_Deaths,
	ROUND((SUM(new_deaths)/SUM(new_cases))*100,2) as fatality_rate
from
	covid..CovidDeaths
where continent is not null
group by date
order by 1,2;

-- Joins

-- CTE's, Temp tables and subqueries

-- TEMP table with only relevant columns

CREATE TABLE #covid (
    continent VARCHAR(255),
    location VARCHAR(255),
    date DATE,
    total_cases FLOAT,
    new_cases FLOAT,
    total_deaths FLOAT,
    new_deaths FLOAT,
    reproduction_rate FLOAT,
    icu_patients FLOAT,
    hosp_patients FLOAT,
    weekly_icu_admissions FLOAT,
    weekly_hosp_admissions FLOAT,
    new_tests FLOAT,
    total_tests FLOAT,
    positive_rate FLOAT,
    tests_per_case FLOAT,
    tests_units VARCHAR(50),
    total_vaccinations INT,
    people_vaccinated INT,
    people_fully_vaccinated INT,
    new_vaccinations INT,
    population FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    gdp_per_capita FLOAT,
    extreme_poverty FLOAT,
    cardiovasc_death_rate FLOAT,
    diabetes_prevalence FLOAT,
    female_smokers FLOAT,
    male_smokers FLOAT,
    handwashing_facilities FLOAT,
    life_expectancy FLOAT,
    human_development_index FLOAT
);

-- Insert data into the temp table
INSERT INTO #covid
SELECT 
    dt.continent,
    dt.location,
    dt.date,
    dt.total_cases,
    dt.new_cases,
    dt.total_deaths,
    dt.new_deaths,
    dt.reproduction_rate,
    dt.icu_patients,
    dt.hosp_patients,
    dt.weekly_icu_admissions,
    dt.weekly_hosp_admissions,
    dt.new_tests,
    dt.total_tests,
    dt.positive_rate,
    dt.tests_per_case,
    dt.tests_units,
    cv.total_vaccinations,
    cv.people_vaccinated,
    cv.people_fully_vaccinated,
    cv.new_vaccinations,
    dt.population,
    cv.aged_65_older,
    cv.aged_70_older,
    cv.gdp_per_capita,
    cv.extreme_poverty,
    cv.cardiovasc_death_rate,
    cv.diabetes_prevalence,
    cv.female_smokers,
    cv.male_smokers,
    cv.handwashing_facilities,
    cv.life_expectancy,
    cv.human_development_index
FROM covid..CovidDeaths AS dt
JOIN covid..CovidVaccinations AS cv
    ON cv.location = dt.location AND cv.date = dt.date;

-- Total Populations vs Vaccinations (with a rolling count for total vaccinations)

SELECT 
	continent,
	location,
	date,
	population,
	new_vaccinations,
	sum(new_vaccinations) OVER (PARTITION BY location ORDER BY location,date) as Total_Vaccinations
FROM #covid
WHERE continent is not null
ORDER BY 2,3;

-- USE CTE to calculate Rolling Vaccination rate

WITH popvac (continent,location,date,population,new_vaccinations,Total_Vaccinations)
as
(SELECT 
	continent,
	location,
	date,
	population,
	new_vaccinations,
	sum(new_vaccinations) OVER (PARTITION BY location ORDER BY location,date) as Total_Vaccinations
FROM #covid
WHERE continent is not null
)
SELECT *, (Total_Vaccinations/population)*100 as Rolling_Vaccination_rate
FROM popvac
ORDER BY 2,3;

-- USING TEMP TABLE to do the same

DROP TABLE IF EXISTS #rolling -- if you need to make any changes to the temp table
CREATE TABLE #rolling 
(
continent VARCHAR(255),
location VARCHAR(255),
date DATE,
population FLOAT,
new_vaccinations FLOAT,
Total_Vaccinations FLOAT
);
INSERT INTO #rolling
SELECT 
	continent,
	location,
	date,
	population,
	new_vaccinations,
	sum(new_vaccinations) OVER (PARTITION BY location ORDER BY location,date) as Total_Vaccinations
FROM #covid
WHERE continent is not null;

-- Calculating Rolling Vaccination Rate

SELECT *, (Total_Vaccinations/population)*100 as Rolling_vaccination_rate
FROM #rolling
ORDER BY 2,3;

-- CREATING A VIEW FOR LATER VISUALIZATION

CREATE VIEW rollingstones AS 
SELECT 
	dt.continent,
	dt.location,
	dt.date,
	dt.population,
	cv.new_vaccinations,
	sum(cv.new_vaccinations) OVER (PARTITION BY dt.location ORDER BY dt.location,dt.date) as Total_Vaccinations
FROM covid..CovidDeaths as dt
JOIN covid..CovidVaccinations as cv
	ON dt.date = cv.date and dt.location = cv.location
WHERE dt.continent is not null;

GO

SELECT *
FROM rollingstones;
SELECT * 
FROM CovidProject..covid_deaths
WHERE continent is not null
ORDER BY location, date

SELECT * 
FROM CovidProject..covid_vacciniations
WHERE continent is not null
ORDER BY location, date

-- Selecting Data that I will be using 

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidProject..covid_deaths
WHERE continent is not null
ORDER BY location, date


-- Total Cases vs Total Deaths in the United Kingdom (Likelihood of dying from contracting COVID in the United Kingdom)

SELECT location, date, total_cases, total_deaths, (total_deaths / total_cases) * 100 AS death_percentage
FROM CovidProject..covid_deaths
WHERE Location = 'United Kingdom'
and continent is not null
ORDER BY location, date

-- Total Cases vs Population in the United Kingdom (Percentage of population that got COVID)
SELECT location, date, population, total_cases, (total_cases / population) * 100 AS PopulationInfected_percentage
FROM CovidProject..covid_deaths
WHERE Location = 'United Kingdom'
ORDER BY location, date

-- Countries with the Highest Infection Rate Compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfection_Count,  MAX((total_cases/population))*100 AS PercentPopulation_Infected
FROM CovidProject..covid_deaths
Group by location, population
order by PercentPopulation_Infected DESC

-- Countries with the Highest Death Count Per Population
SELECT location, MAX(cast(Total_deaths as int)) AS TotalDeathCount
FROM CovidProject..covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

-- Continents with the Highest Death Count Per Population
SELECT continent, MAX(cast(Total_deaths as int)) AS TotalDeathCount
FROM CovidProject..covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

-- World Numbers
SELECT SUM(new_cases) AS world_cases, SUM(cast(new_deaths AS int)) AS world_deaths, SUM(cast(new_deaths AS int))/SUM(new_Cases)*100 AS DeathPercentage
FROM CovidProject..covid_deaths
WHERE continent IS NOT NULL
ORDER BY 1,2



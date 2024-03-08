select *
from PortfolioProjectCovid..CovidDeaths
where continent is not null
order by 3,4

--select *
--from PortfolioProjectCovid..CovidVaccination
--order by 3,4

select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioProjectCovid..CovidDeaths
order by 1,2

---Looking at Total cases v Total Deaths
---shows likelyhood of dying if you contact covid in your country

select Location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProjectCovid..CovidDeaths
where location like '%states%'
order by 1,2

---looking at the Total cases vs Population
---shows what percentage of population got Covid

select Location, date, total_cases, total_deaths,Population, (total_cases/Population)*100 as PopulationPercentage
from PortfolioProjectCovid..CovidDeaths
where location like '%states%'
order by 1,2

---Looking Country with highst infection rate compared to Population

select Location,Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/Population))*100 as PopulationPercentage
from PortfolioProjectCovid..CovidDeaths
---where location like '%states%'
group by Location,Population
order by PopulationPercentage desc

---showing Countries with highest death count per population

select Location, MAX(Total_deaths) as TotalDeathCount
from PortfolioProjectCovid..CovidDeaths
---where location like '%states%'
where continent is not null
group by Location
order by TotalDeathCount desc

---let break things down by continent

select Location, MAX(Total_deaths) as TotalDeathCount
from PortfolioProjectCovid..CovidDeaths
---where location like '%states%'
where continent is  null
group by Location
order by TotalDeathCount desc

--- showing continent with the hifgest death count per population

select continent, MAX(Total_deaths) as TotalDeathCount
from PortfolioProjectCovid..CovidDeaths
---where location like '%states%'
where continent is not null
group by continent
order by TotalDeathCount desc


---looking at Total Population vs Vaccinations

select dea.continent,dea.location, dea.date, dea.population, vac.new_vaccinations
,sum(vac.new_vaccinations) over(partition by dea.location order by dea.location)
from portfolioProjectCovid..CovidDeaths dea
join portfolioProjectCovid..CovidVaccination vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3





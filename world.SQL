
-- 1)
SELECT gdp FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2)
SELECT name FROM world
where (gdp/population) >
  (select (gdp/population) FROM world 
    where name = 'United Kingdom')
AND continent = 'Europe';

-- 3)
select name, continent from world
where continent = 
		(select continent from world where name = 'Argentina')
	OR continent = 
		(select continent from world where name = 'Australia')
ORDER BY name;

-- 4 )
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population from world 
where population > (select population from world where name = 'Canada')
	AND 
	population < (select population from world where name ='Poland')

-- 5)
SELECT name,  
	CONCAT(ROUND(100*(population / (select population from world where name = 'Germany'))), '%') AS percentage_of_Germany
FROM world
WHERE continent	= 'Europe';

-- 6)
SELECT name, gdp FROM world
where gdp > (select max(gdp) FROM world WHERE continent = 'Europe');

-- 7)
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
/* compare 2 tables where some id are the same; */
--  Define table as some name x;

SELECT continent, name, (area) FROM world 
group by continent;

-- 9)
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL(select population from world y 
			WHERE y.continent = x.continent
			AND population>0);

-- 10)
SELECT name, continent, population FROM world x
WHERE population > ALL(select population*3 from world y 
			WHERE y.continent = x.continent
			AND y.name != x.name
			AND population>=0);






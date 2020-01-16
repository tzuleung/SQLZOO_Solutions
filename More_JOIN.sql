
-- 1)
SELECT id, title
 FROM movie
 WHERE yr=1962;

-- 2) Give year of 'Citizen Kane'.
SELECT yr FROM movie
 WHERE title = 'Citizen Kane';

-- 3)
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr ASC;

-- 4)
SELECT id FROM actor
WHERE name = 'Glenn Close';

-- 5)
SELECT id FROM movie
WHERE title = 'Casablanca';

-- 6) 
-- casting (Many) : actor (1) relationship
SELECT actor.name 
FROM casting
JOIN actor ON (casting.actorid = actor.id)
WHERE movieid = ( SELECT id FROM movie
					WHERE title = 'Casablanca');

-- 7)
SELECT actor.name 
FROM casting
JOIN actor ON (casting.actorid = actor.id)
WHERE movieid = ( SELECT id FROM movie
					WHERE title = 'Alien');

-- 8)
SELECT title
FROM movie 
	LEFT JOIN casting ON (movie.id = casting.movieid)
	JOIN actor on (casting.actorid = actor.id)
WHERE actor.name = 'Harrison Ford';

-- 9)
SELECT title
FROM movie 
	LEFT JOIN casting ON (movie.id = casting.movieid)
	JOIN actor on (casting.actorid = actor.id)
WHERE actor.name = 'Harrison Ford'
AND casting.ord != 1;

-- 10)
SELECT title, actor.name
FROM movie 
	LEFT JOIN casting ON (movie.id = casting.movieid)
	JOIN actor on (casting.actorid = actor.id)
WHERE movie.yr = 1962
AND casting.ord = 1;

-- 11)
SELECT yr, COUNT(title) 
FROM movie 
	JOIN casting ON movie.id=movieid
	JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12)
-- Step 1) Select movie where Julie played in 
-- Step 2) Make sure ord = 1 
SELECT movie.title, actor.name
FROM movie 
	JOIN casting ON movie.id=movieid
	JOIN actor   ON actorid=actor.id
WHERE casting.movieid IN 
			(SELECT movieid FROM casting
				WHERE actorid IN (
				  SELECT id FROM actor
				  WHERE name='Julie Andrews'))
AND casting.ord = 1;

-- 13)
SELECT actor.name, COUNT(movieid)
FROM movie 
	JOIN casting ON movie.id=movieid
	JOIN actor   ON actorid=actor.id
WHERE ord = 1
GROUP BY actor.name 
HAVING COUNT(ord) >= 30;

-- 14)
SELECT movie.title, COUNT(casting.actorid)
FROM movie 
	JOIN casting ON movie.id=movieid
	JOIN actor   ON actorid=actor.id
WHERE yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title;

-- 15)  
SELECT actor.name
FROM movie 
	JOIN casting ON movie.id=movieid
	JOIN actor   ON actorid=actor.id
WHERE casting.movieid IN 
			(SELECT movieid FROM casting
				WHERE actorid IN (
				  SELECT id FROM actor
				  WHERE name='Art Garfunkel'))
AND actor.name != 'Art Garfunkel';







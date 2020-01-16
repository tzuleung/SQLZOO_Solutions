
-- 1)
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2)
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 3)
SELECT yr, subject
FROM nobel
	WHERE winner = 'Albert Einstein';

-- 4)
SELECT winner
FROM nobel
	WHERE yr >= 2000
	AND subject LIKE 'Peace';

-- 5)
SELECT * FROM nobel
WHERE yr BETWEEN 1980 AND 1989
AND subject LIKE 'Literature';

-- 6)
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
	'Woodrow Wilson',
	'Jimmy Carter',
	'Barack Obama')
-- 7)
SELECT winner FROM nobel
	WHERE winner LIKE 'John%'

-- 8)
SELECT * FROM nobel
	WHERE (yr = 1980 AND subject = 'Physics')
	OR (yr = 1984 AND subject = 'Chemistry')

-- 9)
SELECT * FROM nobel
	WHERE yr = 1980 
	AND subject NOT IN ('Chemistry', 'Medicine');

-- 10) 
/* 
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
*/
SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
OR (subject = 'Literature' AND yr >= 2004);

-- 11)
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';

-- 12)
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL';

-- 13)
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;

-- 14)
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;


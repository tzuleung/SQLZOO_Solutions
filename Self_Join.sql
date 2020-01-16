/*
Tables:
stops(id, name)
route(num, company, pos, stop)
*/

-- 1)
SELECT COUNT(name) FROM stops;

-- 2)
SELECT id FROM stops
WHERE name = 'Craiglockhart';

-- 3)
SELECT stops.id, stops.name
FROM stops 
JOIN route ON (stops.id = route.stop)
WHERE (route.num = 4 AND route.company = 'LRT')
ORDER BY stops.name;

-- 4)
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) != 1;

-- 5)
-- From Craiglockhart to London Road
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 
AND b.stop = 149;

-- 6)
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road';

-- 7)
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.id = 115
AND stopb.id = 137;

-- 8)
SELECT a.company, a.num, a.stop, b.stop
FROM route AS a 
JOIN route AS b ON (a.num = b.num AND a.company = b.company)
JOIN stops AS stopa ON (a.stop = stopa.id)
JOIN stops AS stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'Tollcross';

-- 9)
-- Starting at Craig, list the destination
SELECT stopb.name, a.company, a.num
FROM route AS a 
JOIN route AS b ON (a.num = b.num AND a.company = b.company)
JOIN stops AS stopa ON (a.stop = stopa.id)
JOIN stops AS stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'

-- 10)
-- a -> b -> c
--53 'Craiglockhart'
--147 'Lochend'
SELECT a.company, a.num, stopb.name, b.company, b.num
FROM route AS a 
JOIN route AS b ON (a.num = b.num AND a.company = b.company)
JOIN route AS c ON (a.num = c.num AND a.company = c.company)
JOIN stops AS stopa ON (a.stop = stopa.id)
JOIN stops AS stopb ON (b.stop = stopb.id)
JOIN stops AS stopc ON (c.stop = stopc.id)
WHERE stopa.id = 53 
AND stopb.id != 147
AND stopc.id = 147; 


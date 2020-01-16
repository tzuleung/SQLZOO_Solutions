
-- 1)
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- 2)
SELECT DISTINCT id,stadium,team1,team2
  FROM game
  JOIN goal ON (game.id = goal.matchid)
 WHERE game.id = 1012;

-- 3)
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 4)
SELECT team1, team2, player
	FROM game JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'

-- 5)
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid = id
 WHERE gtime<=10;

 -- 6)
SELECT mdate, teamname 
	FROM game JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos'

-- 7)
SELECT player
	FROM game JOIN goal ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw';

-- 8)
-- Make sure that GER is playing and player does NOT belong to GER
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'GER' or team2 = 'GER')
AND (goal.teamid != 'GER')

-- 9)
-- For each team, count the number of goals
SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

-- 10) Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(matchid) AS 'Total Goals in Each Stadium'
	FROM game JOIN goal ON (game.id = goal.matchid)
GROUP BY stadium;

-- 11)
-- For each match, count all goals made by either team
SELECT matchid, mdate, COUNT(matchid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid, mdate;

-- 12) For every match where 'GER' scored, show matchid, match date 
--		and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON (game.id = goal.matchid)
 WHERE teamid = 'GER'
 GROUP BY matchid, mdate;

-- 13)
  -- CASE WHEN condition1 THEN value1 
  --      WHEN condition2 THEN value2  
  --      ELSE def_value 
  -- END

-- Need to use LEFT JOIN b/c there could be games where there is a tie; 
-- i.e., 0-0, which would not be in the table goal
SELECT mdate,
  team1,
  SUM(CASE 	WHEN teamid=team1 THEN 1 
	  		ELSE 0 
	  END) AS score1,
  team2,
  SUM(CASE 	WHEN teamid=team2 THEN 1 
	  		ELSE 0 
	  END) AS score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, matchid, team1, team2
  ORDER BY mdate, matchid, team1, team2;

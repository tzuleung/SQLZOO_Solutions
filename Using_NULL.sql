
-- 1)
SELECT name FROM teacher
WHERE dept IS NULL;

-- 2)
SELECT teacher.name, dept.name
 FROM teacher 
 INNER JOIN dept
           ON (teacher.dept=dept.id);

-- 3)
-- Use LEFT JOIN to keep all teachers (those with no dept)
SELECT teacher.name, dept.name
 FROM teacher 
 LEFT JOIN dept
           ON (teacher.dept=dept.id);

-- 4)
-- Keep all dept
SELECT teacher.name, dept.name
 FROM teacher 
 RIGHT JOIN dept
           ON (teacher.dept=dept.id);

-- 5)
-- COALESCE takes any number of arguments and returns the first value that is not null.
-- COALESCE(mobile, default #) => If mobile IS NULL, then print default #
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- 6)
SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher 
 LEFT JOIN dept
           ON (teacher.dept=dept.id);

-- 7)
SELECT COUNT(name), COUNT(mobile)
FROM teacher
GROUP BY id;

-- 8)
SELECT dept.name, COUNT(teacher.name)
 FROM teacher 
 RIGHT JOIN dept
           ON (teacher.dept=dept.id)
GROUP BY dept.name;

-- 9)
SELECT teacher.name, teacher.dept,
		CASE WHEN teacher.dept IN (1,2) THEN 'Sci'
			ELSE 'Art'
		END
 FROM teacher 
 LEFT JOIN dept
           ON (teacher.dept=dept.id);

-- 10)
SELECT teacher.name, teacher.dept,
		CASE WHEN teacher.dept IN (1,2) THEN 'Sci'
			WHEN teacher.dept IN (3) THEN 'Art'
			ELSE 'None'
		END
 FROM teacher 
 LEFT JOIN dept
           ON (teacher.dept=dept.id);

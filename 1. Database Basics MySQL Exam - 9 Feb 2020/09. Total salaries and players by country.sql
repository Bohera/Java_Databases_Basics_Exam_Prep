SELECT 
	c.name, 
    COUNT(p.id) AS total_count_of_players,
    SUM(p.salary) AS total_sum_of_salaries
     
FROM countries AS c
LEFT JOIN 
	towns AS t1 ON t1.country_id = c.id
LEFT JOIN 
	stadiums AS s ON s.town_id = t1.id
LEFT JOIN
	teams AS t2 ON t2.stadium_id = s.id
LEFT JOIN
	players AS p ON p.team_id = t2.id

GROUP BY c.name
ORDER BY total_count_of_players DESC, c.name;
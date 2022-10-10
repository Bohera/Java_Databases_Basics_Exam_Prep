SELECT
	MAX(sd.speed) AS max_speed,
    t2.name AS town_name
FROM 
	skills_data AS sd
RIGHT JOIN
	players AS p ON p.skills_data_id = sd.id
RIGHT JOIN
	teams AS t1 ON p.team_id = t1.id
JOIN 
	stadiums AS s ON t1.stadium_id = s.id
JOIN
	towns AS t2 ON s.town_id = t2.id
WHERE 
	t1.name != "Devify"
GROUP BY t2.name
ORDER BY max_speed DESC, t2.name;
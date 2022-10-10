DELIMITER $$

CREATE FUNCTION udf_stadium_players_count (stadium_name VARCHAR(30))
RETURNS INT(255)
DETERMINISTIC
BEGIN
	RETURN (SELECT 
		COUNT(p.id) 
	FROM 
		players AS p
	RIGHT JOIN
		teams AS t ON p.team_id = t.id
	RIGHT JOIN
		stadiums AS s ON t.stadium_id = s.id
	WHERE s.name = stadium_name
	GROUP BY s.id);
END$$

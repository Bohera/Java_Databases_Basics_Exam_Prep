UPDATE coaches AS c
SET
	coach_level = coach_level + 1
WHERE
	c.id IN (SELECT
			coach_id
		FROM 
			players_coaches)
		AND first_name LIKE "A%";
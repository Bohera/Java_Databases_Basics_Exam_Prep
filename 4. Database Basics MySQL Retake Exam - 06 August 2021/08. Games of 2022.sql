SELECT
	g.name,
    g.release_date ,
    CONCAT(SUBSTR(g.description, 1, 10), "...") AS summary,
    (CASE 
		WHEN MONTH(g.release_date) IN (01, 02, 03) THEN "Q1"
		WHEN MONTH(g.release_date) IN (04, 05, 06) THEN "Q2"
        WHEN MONTH(g.release_date) IN (07, 08, 09) THEN "Q3"
		ELSE "Q4" 
	END) AS quarter,
    t.name AS team_name
FROM
	games AS g
JOIN teams AS t ON g.team_id = t.id
WHERE (MONTH(g.release_date) % 2) = 0 AND SUBSTR(g.name, -1) = 2 AND YEAR(g.release_date) = 2022
ORDER BY quarter;
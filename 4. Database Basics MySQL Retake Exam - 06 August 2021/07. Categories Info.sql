SELECT
	c.name,
    COUNT(g.name) AS games_count,
    ROUND(AVG(g.budget), 2) AS avg_budget,
    MAX(g.rating) AS max_rating
FROM 
	categories AS c
JOIN games_categories AS gc ON gc.category_id = c.id
JOIN games AS g ON gc.game_id = g.id
GROUP BY c.name
HAVING max_rating >= 9.5
ORDER BY games_count DESC, c.name;
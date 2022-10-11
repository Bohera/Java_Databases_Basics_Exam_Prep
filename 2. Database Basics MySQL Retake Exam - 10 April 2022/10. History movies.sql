DELIMITER $$
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
RETURNS INT(5)
DETERMINISTIC
BEGIN
	RETURN(SELECT 
		COUNT(g.id) 
	FROM genres AS g
	JOIN genres_movies AS gm ON g.id = gm.genre_id
    JOIN movies AS m ON gm.movie_id = m.id
    JOIN movies_actors AS ma ON ma.movie_id = m.id
    JOIN actors AS a ON ma.actor_id = a.id
    WHERE CONCAT(a.first_name, " ", a.last_name) = full_name AND g.name = "history"
    GROUP BY g.id);
END$$
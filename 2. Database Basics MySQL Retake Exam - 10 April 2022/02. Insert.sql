INSERT INTO actors (first_name, last_name, birthdate , height, awards, country_id) (
SELECT 
		REVERSE(first_name) AS first_name, 
		REVERSE(last_name) AS last_name, 
		TIMESTAMPADD(DAY, -2, birthdate) AS birthdate, 
        #DATE(birthdate - 2) #DATE_SUB(birthdate, INTERVAL 2 DAY)
		(height + 10) AS height,  
		(country_id) AS awards, 
		(3) AS country_id
FROM 
		actors
WHERE id <= 10
);
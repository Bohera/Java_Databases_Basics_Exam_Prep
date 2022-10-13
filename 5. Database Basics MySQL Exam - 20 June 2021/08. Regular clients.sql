SELECT
	cl.full_name,
	COUNT(co.car_id) AS count_of_cars,
	SUM(co.bill) AS total_sum
FROM
	clients AS cl
JOIN courses AS co ON co.client_id = cl.id
GROUP BY cl.id
HAVING count_of_cars > 1 AND SUBSTR(cl.full_name, 2, 1) = "a"
ORDER BY cl.full_name;
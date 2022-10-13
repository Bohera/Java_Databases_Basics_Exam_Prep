SELECT
	ca.id AS car_id,
	ca.make,
	ca.mileage,
	COUNT(co.id) AS count_of_courses,
	ROUND(AVG(co.bill), 2) AS avg_bill
FROM
	cars AS ca
LEFT JOIN courses AS co ON co.car_id = ca.id
GROUP BY ca.id
HAVING count_of_courses != 2
ORDER BY count_of_courses DESC, ca.id;
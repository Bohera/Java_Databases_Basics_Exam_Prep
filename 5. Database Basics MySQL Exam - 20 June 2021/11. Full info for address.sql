DELIMITER $$

CREATE PROCEDURE udp_courses_by_address(address_name VARCHAR(100))
BEGIN
	SELECT
	a.name,
		cl.full_name,
		(CASE
			WHEN co.bill <= 20 THEN "Low"
			WHEN co.bill <= 30 THEN "Medium"
			ELSE "High"
		END) AS level_of_bill,
		car.make,
		car.condition,
		cat.name AS cat_name
	FROM
		cars AS car
	JOIN categories AS cat ON car.category_id = cat.id
	JOIN courses AS co ON co.car_id = car.id
	JOIN addresses AS a ON co.from_address_id = a.id
	JOIN clients AS cl ON co.client_id = cl.id
	WHERE a.name = address_name
	ORDER BY car.make, cl.full_name;

END$$

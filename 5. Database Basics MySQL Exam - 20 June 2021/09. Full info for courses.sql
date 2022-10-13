SELECT
	a.name,
	(CASE
		WHEN HOUR(co.start) BETWEEN 6 AND 20 THEN "Day"
        ELSE "Night"
	END) AS day_time,
	co.bill,
	cl.full_name,
	car.make,
	car.model,
	cat.name
FROM courses AS co
JOIN cars AS car ON co.car_id = car.id
JOIN clients AS cl ON co.client_id = cl.id
JOIN addresses AS a ON co.from_address_id = a.id
JOIN categories AS cat ON car.category_id = cat.id
ORDER BY co.id;
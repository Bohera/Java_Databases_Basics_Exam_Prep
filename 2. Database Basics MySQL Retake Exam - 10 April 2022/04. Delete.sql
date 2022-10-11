DELETE c FROM countries AS c
LEFT JOIN movies AS m ON m.country_id = c.id
WHERE country_id IS NULL;
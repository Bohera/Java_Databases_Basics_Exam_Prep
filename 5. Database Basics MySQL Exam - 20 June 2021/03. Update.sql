UPDATE cars AS c
SET
	c.condition = "C"
WHERE
	c.mileage > 800000 
OR 
	c.mileage IS NULL
AND
	year <= 2010 
AND 
	c.make NOT IN("Mercedes-Benz"); 
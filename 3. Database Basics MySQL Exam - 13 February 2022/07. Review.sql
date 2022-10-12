SELECT * FROM reviews
WHERE SUBSTR(content, 1, 2) = "My" AND CHAR_LENGTH(content) > 61
ORDER BY rating DESC;
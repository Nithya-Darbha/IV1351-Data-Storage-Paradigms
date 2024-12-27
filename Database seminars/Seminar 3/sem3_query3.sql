SELECT 
    i.id AS instructor_id,
	p.first_name AS "first name",
	p.last_name AS "last name",
    COUNT(l.id) AS "number of lessons"
FROM 
    instructor i
JOIN 
    person p
ON 
    i.person_id = p.id
JOIN 
    lesson l
ON 
    i.id = l.instructor_id
WHERE 
    EXTRACT(YEAR FROM l.booked_at) = EXTRACT(YEAR FROM CURRENT_DATE) 
    AND EXTRACT(MONTH FROM l.booked_at) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY 
    i.id, p.first_name, p.last_name
HAVING 
    COUNT(l.id) >= 0
ORDER BY 
    "number of lessons" DESC;
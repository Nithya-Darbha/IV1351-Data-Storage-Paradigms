SELECT 
    e.genre,
    TO_CHAR(l.booked_at, 'Day') AS weekday,
    l.id AS lesson_id,
    e.min_students,
    e.max_students,
    COUNT(se.student_id) AS students_enrolled,
    (e.max_students - COUNT(se.student_id)) AS seats_left,
    CASE 
        WHEN (e.max_students - COUNT(se.student_id)) > 2 THEN 'More seats left'
        WHEN (e.max_students - COUNT(se.student_id)) BETWEEN 1 AND 2 THEN '1-2 seats left'
        ELSE 'Fully booked'
    END AS booking_status
FROM 
    ensembles e
JOIN 
    lesson l ON e.lesson_id = l.id
LEFT JOIN 
    student_ensembles se ON l.id = se.lesson_id
WHERE 
    l.booked_at BETWEEN CURRENT_DATE + INTERVAL '6 days' AND CURRENT_DATE + INTERVAL '12 days'  -- Next week
GROUP BY 
    e.genre, l.booked_at, l.id, e.min_students, e.max_students
ORDER BY 
    e.genre, TO_CHAR(l.booked_at, 'Day');
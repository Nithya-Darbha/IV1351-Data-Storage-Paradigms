SELECT 
    TO_CHAR(l.booked_at, 'Mon') AS Month,
    COUNT(l.id) AS Total,
    SUM(CASE WHEN l.type_name = 'Individual' THEN 1 ELSE 0 END) AS Individual,
    SUM(CASE WHEN l.type_name = 'Group' THEN 1 ELSE 0 END) AS "Group",
    SUM(CASE WHEN l.type_name = 'Ensemble' THEN 1 ELSE 0 END) AS Ensemble
FROM lesson l
WHERE EXTRACT(YEAR FROM l.booked_at) = 2024
GROUP BY TO_CHAR(l.booked_at, 'Mon')
ORDER BY TO_DATE(TO_CHAR(l.booked_at, 'Mon'), 'Mon');
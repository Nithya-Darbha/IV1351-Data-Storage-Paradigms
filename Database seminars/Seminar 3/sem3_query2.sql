SELECT 
    COALESCE(sibling_count.sibling_no, 0) AS "No of Siblings", 
    COUNT(DISTINCT s.id) AS "No of Students"
FROM student s
LEFT JOIN (
    SELECT 
        gs1.student_id, 
        COUNT(DISTINCT gs2.student_id) AS sibling_no
    FROM guardian_student gs1
    JOIN guardian_student gs2 ON gs1.guardian_id = gs2.guardian_id AND gs1.student_id != gs2.student_id
    GROUP BY gs1.student_id
) sibling_count ON s.id = sibling_count.student_id
GROUP BY sibling_count.sibling_no
ORDER BY "No of Siblings";
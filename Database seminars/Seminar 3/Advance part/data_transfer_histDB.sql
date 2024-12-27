CREATE EXTENSION IF NOT EXISTS dblink;
-- replace user and password with system specific details
INSERT INTO student (personal_number, first_name, last_name, email_address)
SELECT *
FROM 
    dblink(
        'dbname=sem3allqueries user=your_name password=your_password',
        'SELECT personal_number, first_name, last_name, email_address 
         FROM person 
         WHERE id BETWEEN 16 AND 40'
    ) AS external_person(personal_number VARCHAR, first_name VARCHAR, last_name VARCHAR, email_address VARCHAR);



INSERT INTO lesson (type_name, level_name, genre, instrument_type, price)
SELECT *
FROM 
    dblink(
        'dbname=sem3allqueries user=your_name password=your_password',
        'SELECT 
            l.type_name, 
            l.level_name, 
            e.genre, 
            COALESCE(il.instrument_type, gl.instrument_type) AS instrument_type,
            psh.price
         FROM lesson l
         LEFT JOIN ensembles e ON l.id = e.lesson_id
         LEFT JOIN individual_lessons il ON l.id = il.lesson_id
         LEFT JOIN group_lessons gl ON l.id = gl.lesson_id
         JOIN pricing_scheme_history psh ON l.id = psh.lesson_id'
    ) AS external_lesson(type_name VARCHAR, level_name VARCHAR, genre VARCHAR, instrument_type VARCHAR, price NUMERIC);


	CREATE EXTENSION IF NOT EXISTS dblink;

INSERT INTO student_lesson (student_id, lesson_id)
SELECT *
FROM 
    dblink(
        'dbname=sem3allqueries user=your_name password=your_password',
        'SELECT 
           s.id AS student_id, 
           COALESCE(il.lesson_id, sgl.lesson_id, se.lesson_id) AS lesson_id
         FROM student s
         LEFT JOIN individual_lessons il ON s.id = il.student_id
         LEFT JOIN student_group_lessons sgl ON s.id = sgl.student_id
         LEFT JOIN student_ensembles se ON s.id = se.student_id'
    ) AS external_student_lesson(student_id INT, lesson_id INT);
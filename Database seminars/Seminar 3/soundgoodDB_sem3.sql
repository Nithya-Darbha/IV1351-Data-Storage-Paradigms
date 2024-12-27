CREATE TABLE person
(
  id SERIAL PRIMARY KEY,
  personal_number varchar(500) UNIQUE NOT NULL,
  first_name varchar(500) NOT NULL,
  last_name varchar(500) NOT NULL,
  email_address varchar(500) NOT NULL
);

CREATE TABLE student
(
  id SERIAL PRIMARY KEY,
  person_id int NOT NULL REFERENCES person(id) ON DELETE CASCADE ,
  present_skill varchar(500) NOT NULL
);

CREATE TABLE enrollment
(
  id SERIAL PRIMARY KEY,
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  places_left int NOT NULL
);


CREATE TABLE instructor
(
  id SERIAL PRIMARY KEY,
  person_id int NOT NULL REFERENCES person(id) ON DELETE CASCADE,
  ensemble_eligibility BOOLEAN NOT NULL
);

CREATE TABLE guardian
(
  id SERIAL PRIMARY KEY,
  person_id int NOT NULL REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE address
(
  id SERIAL PRIMARY KEY,
  address varchar(500) UNIQUE NOT NULL
);

CREATE TABLE phone_number
(
  id SERIAL PRIMARY KEY,
  phone_no varchar(500) UNIQUE NOT NULL
);


CREATE TABLE schedule
(
  id SERIAL PRIMARY KEY,
  instructor_id int NOT NULL REFERENCES instructor(id) ON DELETE CASCADE,
  appointment_slot timestamp(6) UNIQUE NOT NULL
);

CREATE TABLE instruments
(
  id SERIAL PRIMARY KEY,
  instructor_id int NOT NULL REFERENCES instructor(id) ON DELETE CASCADE,
  instrument_type varchar(500) NOT NULL,
  brand varchar(500) NOT NULL,
  quantity int NOT NULL ,
  price_per_month numeric(10) NOT NULL
);


CREATE TABLE renting_instruments
(
  id SERIAL PRIMARY KEY,
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  instrument_id int NOT NULL REFERENCES instruments(id) ON DELETE CASCADE,
  start_rent date NOT NULL,
  end_rent date
);


CREATE TABLE instruments_to_learn
(
  id SERIAL PRIMARY KEY ,
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE, -- fk
  instrument_type varchar(500) NOT NULL
);

CREATE TABLE lesson
(
  id SERIAL PRIMARY KEY,
  instructor_id int NOT NULL REFERENCES instructor(id) ON DELETE CASCADE,
  level_name varchar(500) NOT NULL,
  type_name varchar(500) NOT NULL,
  booked_at date NOT NULL-- date it was booked at 
);



CREATE TABLE pricing_scheme_history
(
  id SERIAL PRIMARY KEY,
  lesson_id int NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
  price numeric(10) NOT NULL,
  valid_from date NOT NULL,
  valid_to date 
);

CREATE TABLE student_payment
( 
  id SERIAL PRIMARY KEY, 
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  pricing_scheme_history_id int NOT NULL REFERENCES pricing_scheme_history(id) ON DELETE CASCADE,
  rental_id int NOT NULL REFERENCES renting_instruments ON DELETE CASCADE,
  sibling_discount numeric(10),
  month date NOT NULL
  
); 

CREATE TABLE instructor_payment
(
  id SERIAL PRIMARY KEY,
  instructor_id int  NOT NULL REFERENCES instructor(id) ON DELETE CASCADE,
  pricing_scheme_history_id int  NOT NULL REFERENCES pricing_scheme_history(id) ON DELETE CASCADE,
  schedule_id int  NOT NULL REFERENCES schedule(id) ON DELETE CASCADE,
  month date NOT NULL
);

CREATE TABLE individual_lessons
(
  lesson_id int NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
  student_id int  NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  instrument_type varchar(500) NOT NULL,
  PRIMARY KEY(lesson_id)
);

CREATE TABLE group_lessons
(
  lesson_id int NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
  instrument_type varchar(500) NOT NULL,
  min_students int NOT NULL,
  max_students int NOT NULL,
  PRIMARY KEY(lesson_id)
);

CREATE TABLE ensembles
(
  lesson_id int NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
  genre varchar(500) NOT NULL,
  min_students int NOT NULL,
  max_students int NOT NULL,
  instrument_type varchar(500) NOT NULL,
  PRIMARY KEY(lesson_id)
);

--cross reference tables

CREATE TABLE person_phone
(
  phone_num_id int NOT NULL REFERENCES phone_number(id) ON DELETE CASCADE,
  person_id int NOT NULL REFERENCES person(id) ON DELETE CASCADE,
  PRIMARY KEY(phone_num_id, person_id)
);

CREATE TABLE person_address
(
  address_id int NOT NULL REFERENCES address(id) ON DELETE CASCADE,
  person_id int NOT NULL REFERENCES person(id) ON DELETE CASCADE,
  PRIMARY KEY(address_id, person_id)
);

--if 2 students have the same guardian they are siblings 
CREATE TABLE guardian_student
(
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  guardian_id int NOT NULL REFERENCES guardian(id) ON DELETE CASCADE,
  PRIMARY KEY(student_id, guardian_id)
);

CREATE TABLE student_group_lessons
(
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  lesson_id int NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
  PRIMARY KEY(student_id, lesson_id)
);

CREATE TABLE student_ensembles
(
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  lesson_id int NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
  PRIMARY KEY(student_id, lesson_id)
);


INSERT INTO person (personal_number, first_name, last_name, email_address) VALUES
-- instructors
('19900101-1234', 'Erik', 'Johansson', 'erik.johansson@gmail.com'),
('19850220-5678', 'Anna', 'Karlsson', 'anna.karlsson@gmail.com'),
('19780315-9101', 'Mats', 'Olsson', 'mats.olsson@gmail.com'),
('19950505-1122', 'Maria', 'Svensson', 'maria.svensson@gmail.com'),
('19891230-3456', 'Lena', 'Andersson', 'lena.andersson@gmail.com'),
('19840617-7890', 'Oskar', 'Larsson', 'oskar.larsson@gmail.com'),
('19920322-1357', 'Elin', 'Eriksson', 'elin.eriksson@gmail.com'),
('19770714-2468', 'Johan', 'Jonsson', 'johan.jonsson@gmail.com'),
('19931201-3690', 'Karin', 'Sjöberg', 'karin.sjoberg@gmail.com'),
('19870305-4812', 'Peter', 'Bergström', 'peter.bergstrom@gmail.com'),
('19801017-5924', 'Eva', 'Lindström', 'eva.lindstrom@gmail.com'),
('19960927-6345', 'Fredrik', 'Sundström', 'fredrik.sundstrom@gmail.com'),
('19850112-7543', 'Hanna', 'Nilsson', 'hanna.nilsson@gmail.com'),
('19921204-8765', 'David', 'Hansson', 'david.hansson@gmail.com'),
('19870521-9101', 'Sara', 'Hedlund', 'sara.hedlund@gmail.com'),

--students , guardians and siblings
('19980130-1022', 'Magnus', 'Persson', 'magnus.persson@gmail.com'),
('19970618-3344', 'Cecilia', 'Jansson', 'cecilia.jansson@gmail.com'),
('19821110-5566', 'Henrik', 'Gustafsson', 'henrik.gustafsson@gmail.com'),
('19941125-7788', 'Linda', 'Petersson', 'linda.petersson@gmail.com'),
('19890515-9900', 'Thomas', 'Bengtsson', 'thomas.bengtsson@gmail.com'),
('19960114-1123', 'Sofia', 'Olofsson', 'sofia.olofsson@gmail.com'),
('19870923-2334', 'Daniel', 'Fransson', 'daniel.fransson@gmail.com'),
('19940702-4556', 'Annika', 'Blomqvist', 'annika.blomqvist@gmail.com'),
('19830504-6789', 'Kalle', 'Mårtensson', 'kalle.martensson@gmail.com'),
('19910117-7890', 'Kristina', 'Hansson', 'kristina.hansson@gmail.com'),
('19981125-8901', 'Alexander', 'Olsson', 'alexander.olsson@gmail.com'),
('19861213-1234', 'Therese', 'Johansson', 'therese.johansson@gmail.com'),
('19971005-5678', 'Andreas', 'Lundberg', 'andreas.lundberg@gmail.com'),
('19870918-8765', 'Birgitta', 'Hellström', 'birgitta.hellstrom@gmail.com'),
('19990528-9999', 'Victor', 'Nyström', 'victor.nystrom@gmail.com'),
('19871121-1111', 'Amanda', 'Molin', 'amanda.molin@gmail.com'),
('19940408-2222', 'Björn', 'Karlsson', 'bjorn.karlsson@gmail.com'),
('19890202-3333', 'Caroline', 'Gustavsson', 'caroline.gustavsson@gmail.com'),
('19960209-4444', 'Jonathan', 'Persson', 'jonathan.persson@gmail.com'),
('19851223-5555', 'Lars', 'Olsson', 'lars.olsson@gmail.com'),
('19870207-6666', 'Frida', 'Lindberg', 'frida.lindberg@gmail.com'),
('19960611-7777', 'Sebastian', 'Sjögren', 'sebastian.sjogren@gmail.com'),
('19841104-8888', 'Emma', 'Hellström', 'emma.hellstrom@gmail.com'),
('19931225-9999', 'Jakob', 'Jönsson', 'jakob.jonsson@gmail.com'),
('19890310-1234', 'Nina', 'Hedström', 'nina.hedstrom@gmail.com'),
('19921105-2345', 'Gustav', 'Nilsson', 'gustav.nilsson@gmail.com'),
('19861112-3456', 'Frida', 'Magnusson', 'frida.magnusson@gmail.com'),
('19840406-4567', 'Martin', 'Berglund', 'martin.berglund@gmail.com'),
('19950723-5678', 'Julia', 'Blomqvist', 'julia.blomqvist@gmail.com'),
('19890217-6789', 'Pia', 'Sjöstrand', 'pia.sjostrand@gmail.com'),
('19831022-7890', 'Patrik', 'Andersson', 'patrik.andersson@gmail.com'),
('19950814-8901', 'Isabella', 'Sundström', 'isabella.sundstrom@gmail.com'),
('19900128-2345', 'Max', 'Johansson', 'max.johansson@gmail.com'),
('19860510-3456', 'Louise', 'Öberg', 'louise.oberg@gmail.com'),
('19931102-4567', 'Oscar', 'Bergström', 'oscar.bergstrom@gmail.com'),
('19920314-6789', 'Gabriel', 'Wikström', 'gabriel.wikstrom@gmail.com'), --51
('19871129-8901', 'Sophia', 'Norberg', 'sophia.norberg@gmail.com'),
('19980612-1122', 'Erika', 'Forslund', 'erika.forslund@gmail.com'),
('19840919-2233', 'Tobias', 'Ekström', 'tobias.ekstrom@gmail.com');



INSERT INTO address (address) VALUES
('Storgatan 10, 111 45, Stockholm'), -- address for person 1
('Västerlånggatan 5, 111 29, Stockholm'), -- address for person 2
('Drottninggatan 12, 51 111, Stockholm'), -- address for person 3
('Kungsportsavenyen 1, 37 114, Stockholm'), -- address for person 4
('Tullgatan 7, 29 115, Stockholm'), -- address for person 5
('Folkets Hus 22, 23 111, Stockholm'), -- address for person 6
('Östermalmstorg 3, 42 114, Stockholm'), -- address for person 7
('Sveavägen 48, 59 113, Stockholm'), -- address for person 8
('Lilla Varholmen 1, 35 115, Stockholm'), -- address for person 9
('Norra Allégatan 15, 21 114, Stockholm'), -- address for person 10
('Västervång 3, 24 114, Stockholm'), -- address for person 11
('Hamngatan 19, 47 111, Stockholm'), -- address for person 12
('Dänarovagen 45, 21 112, Stockholm'), -- address for person 13
('Bergsgatan 8, 34 112, Stockholm'), -- address for person 14
('Högalidsgatan 10, 30 117, Stockholm'), -- address for person 15
('Södra Vägen 21, 24 116, Stockholm'), -- address for person 16
('Götgatan 15, 21 116, Stockholm'), -- address for person 17
('Nybrogatan 25, 39 114, Stockholm'), -- address for person 18
('Hälsingegatan 5, 59 113, Stockholm'), -- address for person 19
('Rosenlundsgatan 10, 53 118, Stockholm'), -- address for person 20
('Handelsvägen 45, 21 112, Stockholm'), -- address for person 21
('Rinkeby Västra 7, 29 115, Stockholm'), -- address for person 22
('Edsberg 5, 29 111, Stockholm'), -- address for person 23
('Vasagatan 12, 45 113, Stockholm'), -- address for person 24
('Lundagatan 9, 22 112, Stockholm'), -- address for person 25
('Mariatorget 10, 34 117, Stockholm'), -- address for person 26
('Hötorget 11, 34 111, Stockholm'), -- address for person 27
('Odengatan 4, 23 113, Stockholm'), -- address for person 28
('Birger Jarlsgatan 7, 43 114, Stockholm'), -- address for person 29
('Kungsholmsgatan 8, 21 112, Stockholm'), -- address for person 30
('Götgatan 10, 24 116, Stockholm'), -- address for person 31
('Fleminggatan 6, 27 112, Stockholm'), -- address for person 32
('Fridhemsgatan 10, 44 112, Stockholm'), -- address for person 33
('Hantverkargatan 7, 25 112, Stockholm'), -- address for person 34
('Sankt Eriksgatan 10, 55 113, Stockholm'), -- address for person 35
('Hornsgatan 20, 23 118, Stockholm'), -- address for person 36
('Lidingövägen 8, 21 114, Stockholm'), -- address for person 37
('Tegnérgatan 5, 27 113, Stockholm'), -- address for person 38
('Surbrunnsgatan 12, 44 113, Stockholm'), -- address for person 39
('Karlavägen 11, 45 114, Stockholm'), -- address for person 40
('Brännkyrkagatan 19, 30 118, Stockholm'), -- address for 51
('Kungsgatan 3, 45 111, Stockholm'), -- address for 52
('Riddargatan 11, 41 114, Stockholm'), -- address for 53
('Västmannagatan 25, 36 113, Stockholm'); -- address for 54


INSERT INTO phone_number (phone_no) VALUES
('0701234567'), -- person 1
('0732345673'), -- person 2
('0702345679'), -- person 3
('0703456789'), -- person 4
('0733456780'), -- person 5
('0704567891'), -- person 6
('0705678902'), -- person 7
('0734567891'), -- person 8
('0721234568'), -- person 9
('0735678902'), -- person 10
('0722345679'), -- person 11
('0736789013'), -- person 12
('0706789013'), -- person 13
('0737890124'), -- person 14
('0724567891'), -- person 15
('0738901235'), -- person 16
('0707890124'), -- person 17
('0739012346'), -- person 18
('0725678902'), -- person 19
('0730123460'), -- person 20
('0708901235'), -- person 21
('0732345674'), -- person 22
('0726789013'), -- person 23
('0730123457'), -- person 24
('0709012346'), -- person 25
('0731234568'), -- person 26
('0727890124'), -- person 27
('0732345679'), -- person 28
('0702345671'), -- person 29
('0729012346'), -- person 30
('0733456781'), -- person 31
('0701234571'), -- person 32
('0734567898'), -- person 33
('0723456791'), -- person 34
('0735678908'), -- person 35
('0703456791'), -- person 36
('0722345681'), -- person 37
('0736789124'), -- person 38
('0704567898'), -- person 39
('0737890146'), -- person 40
('0724567802'), -- person 41
('0738901257'), -- person 42
('0705678903'), -- person 43
('0739012357'), -- person 44
('0707890125'), -- person 45
('0730123499'), -- person 46
('0726789122'), -- person 47
('0731234580'), -- person 48
('0727890131'), -- person 49
('0709876544'), -- person 50
('0723456782'), -- person 1 (2nd phone)
('0702345680'), -- person 2 (2nd phone)
('0734567881'), -- person 3 (2nd phone)
('0701234599'), -- person 4 (2nd phone)
('0732345690'), -- person 5 (2nd phone)
('0723456792'), -- person 6 (2nd phone)
('0734567879'), -- person 7 (2nd phone)
('0702345681'), -- person 8 (2nd phone)
('0736789024'), -- person 9 (2nd phone)
('0707890121'), -- person 10 (2nd phone)
('0731234579'), -- person 11 (2nd phone)
('0707890131'), -- person 12 (2nd phone)
('0739012361'), -- person 13 (2nd phone)
('0709876546'), -- person 14 (2nd phone)
('0738901261'), -- person 15 (2nd phone)
('0723456711'), -- person 51 (guardian 11)
('0735678922'), -- 52
('0702345699'), -- 53
('0738901277'); -- 54 (guardian 14)



INSERT INTO person_address (address_id, person_id) VALUES
-- Address for person 1 and person 2
(1, 1), 
(1, 2),

-- Address for person 3 and person 23
(2, 3),  -- Person 3
(2, 23), -- Person 23

-- Address for person 4 and person 24
(3, 4),  -- Person 4
(3, 24), -- Person 24

-- Address for person 5 and person 25
(4, 5),  -- Person 5
(4, 25), -- Person 25

-- Address for person 6 and person 26
(5, 6),  -- Person 6
(5, 26), -- Person 26

-- Address for person 7 and person 27
(6, 7),  -- Person 7
(6, 27), -- Person 27

-- Address for person 8 and person 28
(7, 8),  -- Person 8
(7, 28), -- Person 28

-- Address for person 9 and person 29
(8, 9),  -- Person 9
(8, 29), -- Person 29

-- Address for person 10
(9, 10), -- Person 10

-- Address for person 11
(10, 11), -- Person 11

-- Address for person 12
(11, 12), -- Person 12

-- Address for person 13
(12, 13), -- Person 13

-- Address for person 14
(13, 14), -- Person 14

-- Address for person 15
(14, 15), -- Person 15

-- Address for person 16
(15, 16), -- Person 16

-- Address for person 17 and person 45
(16, 17), -- Person 17
(16, 45), -- Person 45

-- Address for person 18 and person 46
(17, 18), -- Person 18
(17, 46), -- Person 46

-- Address for person 19 and person 47
(18, 19), -- Person 19
(18, 47), -- Person 47

-- Address for person 20 and person 48
(19, 20), -- Person 20
(19, 48), -- Person 48

-- Address for person 21 and person 49
(20, 21), -- Person 21
(20, 49), -- Person 49

-- Address for person 22
(21, 22), -- Person 22

-- Address for person 23
(22, 23), -- Person 23

-- Address for person 24 and person 50
(23, 24), -- Person 24
(23, 50), -- Person 50

-- Address for person 25
(24, 25), -- Person 25

-- Address for person 26
(25, 26), -- Person 26

-- Address for person 27
(26, 27), -- Person 27

-- Address for person 28
(27, 28), -- Person 28

-- Address for person 29
(28, 29), -- Person 29

-- Address for person 30
(29, 30), -- Person 30

-- Address for person 31
(30, 31), -- Person 31

-- Address for person 32
(31, 32), -- Person 32

-- Address for person 33
(32, 33), -- Person 33

-- Address for person 34
(33, 34), -- Person 34

-- Address for person 35
(34, 35), -- Person 35

-- Address for person 36
(35, 36), -- Person 36

-- Address for person 37
(36, 37), -- Person 37

-- Address for person 38
(37, 38), -- Person 38

-- Address for person 39
(38, 39), -- Person 39

-- Address for person 40
(39, 40), -- Person 40

-- Address for person 41
(40, 41), -- Person 41

(41, 51),
(42, 52),
(43, 53),
(44, 54);

INSERT INTO person_phone (phone_num_id, person_id)
VALUES
(1, 1),  -- Person 1
(51, 1), -- person 1 (2nd phone)
(2, 2),  -- Person 2
(3, 3),  -- Person 3
(4, 4),  -- Person 4
(64, 4),  -- person 4(2nd phone0)
(5, 5),  -- Person 5
(6, 6),  -- Person 6
(7, 7),  -- Person 7
(52, 7), -- person 7(2nd phone)
(8, 8),  -- Person 8
(9, 9),  -- Person 9
(53, 9),  -- person 9 (2nd phone)
(10, 10), -- Person 10
(11, 11), -- Person 11
(12, 12), -- Person 12
(13, 13), -- Person 13
(54, 13), -- Person 13(2nd phone)
(14, 14), -- Person 14
(15, 15), -- Person 15
(16, 16), -- Person 16
(65, 16), -- person 16(2nd phone)
(17, 17), -- Person 17
(18, 18), -- Person 18
(19, 19), -- Person 19
(55, 19), -- person 19(2nd phone)
(20, 20), -- Person 20
(21, 21), -- Person 21
(22, 22), -- Person 22
(23, 23), -- Person 23
(56 ,23), -- Person 23(2nd phone)
(24, 24), -- Person 24
(25, 25), -- Person 25
(26, 26), -- Person 26
(27, 27), -- Person 27
(28, 28), -- Person 28
(29, 29), -- Person 29
(30, 30), -- Person 30
(57, 30), -- person 30(2nd phone)
(31, 31), -- Person 31
(32, 32), -- Person 32
(33, 33), -- Person 33
(34, 34), -- Person 34
(63, 34), -- person 34(2nd phone)
(35, 35), -- Person 35
(36, 36), -- Person 36
(37, 37), -- Person 37
(38, 38), -- Person 38
(58, 38), -- person 38(2nd phone)
(39, 39), -- Person 39
(40, 40), -- Person 40
(59, 40), -- person 40(2nd phone)
(41, 41), -- Person 41
(42, 42), -- Person 42
(43, 43), -- Person 43
(44, 44), -- Person 44
(60, 44), -- person 44(2nd phone)
(45, 45), -- Person 45
(46, 46), -- Person 46
(61, 46), -- person 46(2nd phone)
(47, 47), -- Person 47
(48, 48), -- Person 48
(49, 49), -- Person 49
(50, 50), -- Person 50
(62, 50),-- person 50(2nd phone)
(66, 51),
(67, 52),
(68, 53),
(69, 54);


INSERT INTO student (person_id, present_skill) VALUES
(16, 'No prior experience'),
(17, 'Skilled'),
(18, 'Experienced'),
(19, 'Skilled'),
(20, 'Advanced'),
(21, 'Expert'),
(22, 'Skilled'),
(23, 'Advanced'),
(24, 'Experienced'),
(25, 'Skilled'),
(26, 'Skilled'),
(27, 'Experienced'),
(28, 'Skilled'),
(29, 'No prior experience'),
(30, 'Skilled'),
(31, 'Expert'),
(32, 'Experienced'),
(33, 'Skilled'),
(34, 'Skilled'),
(35, 'Expert'),
(36, 'Advanced'),
(37, 'No prior experience'),
(38, 'Skilled'),
(39, 'Advanced'),
(40, 'Expert');

-- Insert data for the enrollment table for students 1 to 25
INSERT INTO enrollment (student_id, places_left) VALUES
(1, 5),   -- student is person 16
(2, 10),  -- student for person 17
(3, 3),   -- student for person 18
(4, 7),   -- student for person 19
(5, 12),  -- student for person 20
(6, 2),   -- student for person 21
(7, 8),   -- student for person 22
(8, 15),  -- student for person 23
(9, 9),   -- student for person 24
(10, 4),  -- student for person 25
(11, 11), -- student for person 26
(12, 6),  -- student for person 27
(13, 13), -- student for person 28
(14, 14), -- student for person 29
(15, 1),  -- student for person 30
(16, 20), -- student for person 31
(17, 5),  -- student for person 32
(18, 8),  -- student for person 33
(19, 10), -- student for person 34
(20, 7),  -- student for person 35
(21, 3),  -- student for person 36
(22, 9),  -- student for person 37
(23, 12), -- student for person 38
(24, 6),  -- student for person 39
(25, 11); -- student for person 40


-- Insert data for the instructor table for persons 1-15
INSERT INTO instructor (person_id, ensemble_eligibility) VALUES
(1, TRUE),   -- instructor for person 1
(2, FALSE),  -- instructor for person 2
(3, TRUE),   -- instructor for person 3
(4, TRUE),   -- instructor for person 4
(5, FALSE),  -- instructor for person 5
(6, TRUE),   -- instructor for person 6
(7, FALSE),  -- instructor for person 7
(8, TRUE),   -- instructor for person 8
(9, FALSE),  -- instructor for person 9
(10, TRUE),  -- instructor for person 10
(11, TRUE),  -- instructor for person 11
(12, FALSE), -- instructor for person 12
(13, TRUE),  -- instructor for person 13
(14, FALSE), -- instructor for person 14
(15, TRUE);  -- instructor for person 15

-- Insert data for the guardian table for persons 41-50 (guardians)
INSERT INTO guardian (person_id) VALUES
(41), -- person 41 = guardian 1
(42), 
(43), 
(44), 
(45), 
(46), 
(47), 
(48), 
(49), 
(50), 
(51), 
(52), 
(53),
(54); -- person 54 = guardian 14

-- Mapping guardians to multiple students
--(1,2), (3,4), (5,6), (7,8), ()
INSERT INTO guardian_student (student_id, guardian_id) VALUES
--0 siblings - 6 students
(1, 1), 
(2, 2), 
(3, 3),
(4, 4),
(5, 5),
(25, 14),

--1 sibling - 10 students
(6, 6), 
(7, 6),
(8, 7), 
(9, 7), 
(10, 8), 
(11, 8), 
(12, 9), 
(13, 9), 
(14, 10), 
(15, 10),

--2 sibling - 9 student
(16, 11), 
(17, 11), 
(18, 11), 
(19, 12), 
(20, 12), 
(21, 12), 
(22, 13), 
(23, 13), 
(24, 13);



-- Insert data for the schedule table with 1 to 15 instructors and unique appointment slots
INSERT INTO schedule (instructor_id, appointment_slot) VALUES
(1, '2024-01-01 08:00:00'),  -- Lesson 1
(1, '2024-12-25 09:00:00'),  -- Lesson 27
(2, '2024-02-02 10:00:00'),  -- Lesson 2
(3, '2024-03-03 11:00:00'),  -- Lesson 3
(3, '2024-10-13 12:00:00'),  -- Lesson 28
(4, '2024-06-04 13:00:00'),  -- Lesson 4
(5, '2024-05-05 14:00:00'),  -- Lesson 5
(6, '2024-04-06 15:00:00'),  -- Lesson 6
(6, '2024-02-01 16:00:00'),  -- Lesson 16
(7, '2024-09-07 17:00:00'),  -- Lesson 7
(7, '2024-05-02 08:00:00'),  -- Lesson 17
(8, '2024-07-08 09:00:00'),  -- Lesson 8
(8, '2024-07-03 10:00:00'),  -- Lesson 18
(9, '2024-08-09 11:00:00'),  -- Lesson 9
(9, '2024-09-04 12:00:00'),  -- Lesson 19
(10, '2024-12-10 13:00:00'), -- Lesson 10
(10, '2024-06-05 14:00:00'), -- Lesson 20
(10, '2024-07-09 15:00:00'), -- Lesson 24
(11, '2024-10-11 16:00:00'), -- Lesson 11
(11, '2024-12-07 08:00:00'), -- Lesson 22
(11, '2024-04-10 09:00:00'), -- Lesson 25
(12, '2024-11-12 10:00:00'), -- Lesson 12
(12, '2024-12-07 11:00:00'), -- Lesson 22 (Group)
(13, '2024-12-13 12:00:00'), -- Lesson 13
(13, '2024-02-08 13:00:00'), -- Lesson 23
(13, '2024-06-11 14:00:00'), -- Lesson 26
(14, '2024-10-14 13:00:00'); -- Lesson 14


-- Insert lessons into the lesson table
INSERT INTO lesson (instructor_id, level_name, type_name, booked_at) VALUES
(1, 'Beginner', 'Individual', '2025-01-01'),
(2, 'Intermediate', 'Group', '2024-02-02'),
(3, 'Advanced', 'Ensemble', '2025-01-03'),
(4, 'Beginner', 'Group', '2024-06-04'),
(5, 'Advanced', 'Individual', '2024-05-05'),
(6, 'Beginner', 'Ensemble', '2025-01-05'),
(7, 'Intermediate', 'Group', '2024-09-07'),
(8, 'Advanced', 'Individual', '2024-01-08'),
(9, 'Beginner', 'Group', '2024-08-09'),
(10, 'Advanced', 'Ensemble', '2024-12-31'),
(11, 'Intermediate', 'Individual', '2024-10-11'),
(12, 'Beginner', 'Group', '2024-11-12'),
(13, 'Advanced', 'Ensemble', '2024-12-4'),
(14, 'Intermediate', 'Group', '2024-10-14'),
(15, 'Beginner', 'Individual', '2025-01-02'),
(6, 'Beginner', 'Individual', '2024-02-01'), -- For lesson_id 16
(7, 'Intermediate', 'Individual', '2024-05-02'), -- For lesson_id 17
(8, 'Advanced', 'Individual', '2024-07-03'), -- For lesson_id 18
(9, 'Beginner', 'Individual', '2024-09-04'), -- For lesson_id 19
(10, 'Advanced', 'Individual', '2024-12-05'), -- For lesson_id 20
(11, 'Intermediate', 'Group', '2024-04-06'), -- For lesson_id 21
(12, 'Beginner', 'Group', '2024-12-07'),    -- For lesson_id 22
(13, 'Advanced', 'Group', '2024-12-08'),    -- For lesson_id 23
(10, 'Advanced', 'Ensemble', '2024-12-30'), -- For lesson_id 24
(11, 'Intermediate', 'Ensemble', '2025-01-06'), -- For lesson_id 25
(13, 'Beginner', 'Ensemble', '2025-01-07'), -- For lesson_id 26
(1, 'Intermediate', 'Ensemble', '2025-01-09'), -- For lesson_id 27
(3, 'Advanced', 'Ensemble', '2025-01-10'); -- For lesson_id 28

-- Insert data into the individual_lessons table
INSERT INTO individual_lessons (lesson_id, student_id, instrument_type) VALUES
(1, 16, 'Piano'),
(5, 17, 'Violin'),
(8, 18, 'Guitar'),
(11, 19, 'Drums'),
(15, 20, 'Trumpet'),
(16, 21, 'Piano'),
(17, 22, 'Violin'),
(18, 23, 'Guitar'),
(19, 24, 'Drums'),
(20, 25, 'Trumpet');


-- Insert data into the group_lessons table
INSERT INTO group_lessons (lesson_id, instrument_type, min_students, max_students) VALUES
(2, 'Guitar', 3, 5),
(4, 'Drums', 2, 6),
(7, 'Piano', 4, 7),
(9, 'Trumpet', 5, 9),
(12, 'Guitar', 3, 5),
(14, 'Drums', 2, 6),
(21, 'Violin', 3, 8),
(22, 'Piano', 4, 7),
(23, 'Trumpet', 5, 9);


-- Insert data into the ensembles table
INSERT INTO ensembles (lesson_id, genre, min_students, max_students, instrument_type) VALUES
(3, 'Jazz', 2, 5, 'Trumpet'), --1
(6, 'Classical', 2, 3, 'Piano'), --0
(10, 'Rock', 2, 9, 'Guitar'), --many
(13, 'Folk', 2, 8, 'Violin'),
(24, 'Jazz', 2, 10, 'Trumpet'),
(25, 'Classical', 2, 12, 'Piano'),
(26, 'Rock', 2, 9, 'Guitar'),
(27, 'Folk', 2, 8, 'Violin'),
(28, 'Jazz', 2, 10, 'Trumpet');

-- Insert data into the student_group_lessons table
INSERT INTO student_group_lessons (student_id, lesson_id) VALUES
(1, 2),  -- Student 16 joins lesson 2 (Guitar)
(2, 2),  -- Student 17 joins lesson 2 (Guitar)
(3, 2),  -- Student 18 joins lesson 2 (Guitar)
(4, 4),  -- Student 19 joins lesson 4 (Drums)
(5, 4),  -- Student 20 joins lesson 4 (Drums)
(6, 4),  -- Student 21 joins lesson 4 (Drums)
(7, 7),  -- Student 22 joins lesson 7 (Piano)
(8, 7),  -- Student 23 joins lesson 7 (Piano)
(9, 9),  -- Student 24 joins lesson 9 (Trumpet)
(10, 9),  -- Student 25 joins lesson 9 (Trumpet)
(11, 9),  -- Student 26 joins lesson 9 (Trumpet)
(12, 12), -- Student 27 joins lesson 12 (Guitar)
(13, 12), -- Student 28 joins lesson 12 (Guitar)
(14, 12), -- Student 29 joins lesson 12 (Guitar)
(15, 14), -- Student 30 joins lesson 14 (Drums)
(16, 14), -- Student 31 joins lesson 14 (Drums)
(17, 14), -- Student 32 joins lesson 14 (Drums)
(18, 21), -- Student 33 joins lesson 21 (Violin)
(19, 21), -- Student 34 joins lesson 21 (Violin)
(20, 21), -- Student 35 joins lesson 21 (Violin)
(21, 22), -- Student 36 joins lesson 22 (Piano)
(22, 22), -- Student 37 joins lesson 22 (Piano)
(23, 22), -- Student 38 joins lesson 22 (Piano)
(24, 23), -- Student 39 joins lesson 23 (Trumpet)
(25, 23); -- Student 40 joins lesson 23 (Trumpet)

INSERT INTO student_ensembles (student_id, lesson_id) VALUES
(1, 3),  -- Student 16 joins lesson 3 (Jazz, Trumpet)
(2, 6),  -- Student 17 joins lesson 6 (Classical, Piano)
(3, 10), -- Student 18 joins lesson 10 (Rock, Guitar)
(4, 13), -- Student 19 joins lesson 13 (Folk, Violin)
(5, 24), -- Student 20 joins lesson 24 (Jazz, Trumpet)
(6, 25), -- Student 21 joins lesson 25 (Classical, Piano)
(7, 26), -- Student 22 joins lesson 26 (Rock, Guitar)
(8, 27), -- Student 23 joins lesson 27 (Folk, Violin)
(9, 28), -- Student 24 joins lesson 28 (Jazz, Trumpet)
(10, 3),  -- Student 25 joins lesson 3 (Jazz, Trumpet)
(11, 6),  -- Student 26 joins lesson 6 (Classical, Piano)
(12, 10), -- Student 27 joins lesson 10 (Rock, Guitar)
(13, 13), -- Student 28 joins lesson 13 (Folk, Violin)
(14, 24), -- Student 29 joins lesson 24 (Jazz, Trumpet)
(15, 25), -- Student 30 joins lesson 25 (Classical, Piano)
(16, 26), -- Student 31 joins lesson 26 (Rock, Guitar)
(17, 27), -- Student 32 joins lesson 27 (Folk, Violin)
(18, 28), -- Student 33 joins lesson 28 (Jazz, Trumpet)
(19, 3),  -- Student 34 joins lesson 3 (Jazz, Trumpet)
(20, 6),  -- Student 35 joins lesson 6 (Classical, Piano)
(21, 10), -- Student 36 joins lesson 10 (Rock, Guitar)
(22, 13), -- Student 37 joins lesson 13 (Folk, Violin)
(23, 24), -- Student 38 joins lesson 24 (Jazz, Trumpet)
(24, 25), -- Student 39 joins lesson 25 (Classical, Piano)
(25, 26); -- Student 40 joins lesson 26 (Rock, Guitar)


-- Insert data into the instruments table; quantity = numbber of instruments of that type left un-rented
INSERT INTO instruments (instructor_id, instrument_type, brand, quantity, price_per_month) VALUES
(1, 'Piano', 'Yamaha', 2, 50.00),
(1, 'Guitar', 'Fender', 4, 30.00),
(1, 'Violin', 'Stradivarius', 8, 40.00),
(2, 'Piano', 'Yamaha', 2, 50.00),
(2, 'Trumpet', 'Bach', 2, 45.00),
(3, 'Trumpet', 'Bach', 2, 45.00),
(3, 'Drums', 'Roland', 2, 60.00),
(3, 'Violin', 'Stradivarius', 2, 40.00),
(3, 'Piano', 'Yamaha', 2, 50.00),
(4, 'Trumpet', 'Bach', 2, 45.00),
(5, 'Drums', 'Roland', 2, 60.00),
(6, 'Trumpet', 'Bach', 2, 45.00),
(7, 'Guitar', 'Fender', 4, 30.00),
(7, 'Violin', 'Stradivarius', 2, 40.00),
(2, 'Violin', 'Stradivarius', 2, 40.00),
(8, 'Piano', 'Yamaha', 2, 50.00),
(8, 'Guitar', 'Fender', 4, 30.00),
(8, 'Trumpet', 'Bach', 2, 45.00),
(9, 'Violin', 'Stradivarius', 2, 40.00),
(9, 'Trumpet', 'Bach', 2, 45.00),
(9, 'Guitar', 'Fender', 4, 30.00),
(10, 'Guitar', 'Fender', 4, 30.00),
(10, 'Violin', 'Stradivarius', 2, 40.00),
(9, 'Piano', 'Yamaha', 2, 50.00),
(11, 'Violin', 'Stradivarius', 2, 40.00),
(10, 'Trumpet', 'Bach', 2, 45.00),
(11, 'Trumpet', 'Bach', 2, 45.00),
(10, 'Piano', 'Yamaha', 2, 50.00),
(11, 'Guitar', 'Fender', 4, 30.00),
(11, 'Piano', 'Yamaha', 2, 50.00),
(11, 'Drums', 'Roland', 2, 60.00),
(12, 'Violin', 'Stradivarius', 2, 40.00),
(13, 'Piano', 'Yamaha', 2, 50.00),
(14, 'Piano', 'Yamaha', 2, 50.00),
(15, 'Piano', 'Yamaha', 2, 50.00),
(12, 'Guitar', 'Fender', 4, 30.00),
(13, 'Guitar', 'Fender', 4, 30.00),
(14, 'Guitar', 'Fender', 4, 30.00),
(15, 'Guitar', 'Fender', 4, 30.00),
(13, 'Violin', 'Stradivarius', 2, 40.00),
(14, 'Violin', 'Stradivarius', 2, 40.00),
(14, 'Trumpet', 'Bach', 2, 45.00),
(15, 'Trumpet', 'Bach', 2, 45.00),
(14, 'Drums', 'Roland', 2, 60.00),
(15, 'Drums', 'Roland', 2, 60.00);


-- Insert data into the renting_instruments table
INSERT INTO renting_instruments (student_id, instrument_id, start_rent, end_rent) VALUES
(1, 1, '2024-01-27', '2024-08-24'), --piano
(2, 2, '2024-01-08', '2024-07-06'), --guitar
(3, 3, '2024-01-20', '2024-06-18'), --violin
(4, 4, '2024-01-01', '2024-03-31'), --piano
(4, 5, '2024-01-09', '2024-07-07'), -- trumpet
(5, 6, '2024-01-08', '2024-04-07'), --trumpet
(6, 7, '2024-01-27', '2025-01-21'), --drums
(7, 8, '2024-01-14', '2024-02-13'), -- violin
(8, 9, '2024-01-20', '2024-08-17'), -- piano
(8, 10, '2024-01-19', '2024-09-15'), -- trumpet
(9, 11, '2024-01-02', '2024-09-28'), -- drums
(10, 12, '2024-01-24', '2024-02-23'), -- trumpet
(10, 13, '2024-01-12', '2024-10-08'), -- guitar
(11, 14, '2024-01-03', '2024-08-30'), --violin
(12, 15, '2024-01-06', '2024-06-04'), --violin
(12, 16, '2024-01-06', '2024-12-01'), --piano
(13, 17, '2024-01-25', '2024-12-20'), --guitar
(14, 18, '2024-01-09', '2024-12-04'), --trumpet
(15, 19, '2024-01-17', '2025-01-11'), -- violin
(16, 20, '2024-01-22', '2024-07-20'), --trumpet
(16, 21, '2024-01-16', '2024-09-12'), --guitar
(17, 22, '2024-01-21', '2024-07-19'), --guitar
(17, 23, '2024-01-07', '2024-06-05'), --violin
(18, 24, '2024-01-10', '2024-12-05'), --piano
(18, 25, '2024-01-02', '2024-12-27'), --violin
(19, 26, '2024-01-01', '2024-11-26'), --trumpet
(20, 27, '2024-01-22', '2024-04-21'), --trumpet
(21, 28, '2024-01-17', '2024-04-16'), --piano
(22, 29, '2024-01-14', '2024-03-14'), --guitar
(23, 30, '2024-01-27', '2024-05-26'), --piano
(24, 31, '2024-01-22', '2024-10-18'), --drums
(24, 32, '2024-01-30', '2025-01-24'), --violin
(25, 33, '2024-01-16', '2024-08-13'); --piano



-- Insert data into the instruments_to_learn table
INSERT INTO instruments_to_learn (student_id, instrument_type) VALUES
(1, 'Piano'),    -- Student 1 wants to learn Piano
(1, 'Guitar'),   -- Student 1 also wants to learn Guitar
(2, 'Guitar'),   -- Student 2 wants to learn Guitar
(2, 'Violin'),   -- Student 2 also wants to learn Violin
(3, 'Violin'),   -- Student 3 wants to learn Violin
(4, 'Piano'),    -- Student 4 wants to learn Piano
(4, 'Trumpet'),  -- Student 4 also wants to learn Trumpet
(5, 'Trumpet'),  -- Student 5 wants to learn Trumpet
(6, 'Guitar'),   -- Student 6 wants to learn Guitar
(6, 'Drums'),    -- Student 6 also wants to learn Drums
(7, 'Violin'),   -- Student 7 wants to learn Violin
(8, 'Piano'),    -- Student 8 wants to learn Piano
(8, 'Trumpet'),  -- Student 8 also wants to learn Trumpet
(9, 'Drums'),    -- Student 9 wants to learn Drums
(9, 'Piano'),    -- Student 9 also wants to learn Piano
(10, 'Trumpet'), -- Student 10 wants to learn Trumpet
(10, 'Guitar'),  -- Student 10 also wants to learn Guitar
(11, 'Piano'),   -- Student 11 wants to learn Piano
(11, 'Violin'),  -- Student 11 also wants to learn Violin
(12, 'Violin'),  -- Student 12 wants to learn Violin
(12, 'Piano'),   -- Student 12 also wants to learn Piano
(13, 'Guitar'),  -- Student 13 wants to learn Guitar
(13, 'Drums'),   -- Student 13 also wants to learn Drums
(14, 'Piano'),   -- Student 14 wants to learn Piano
(14, 'Trumpet'), -- Student 14 also wants to learn Trumpet
(15, 'Drums'),   -- Student 15 wants to learn Drums
(15, 'Violin'),  -- Student 15 also wants to learn Violin
(16, 'Trumpet'), -- Student 16 wants to learn Trumpet
(16, 'Guitar'),  -- Student 16 also wants to learn Guitar
(17, 'Guitar'),  -- Student 17 wants to learn Guitar
(17, 'Violin'),  -- Student 17 also wants to learn Violin
(18, 'Violin'),  -- Student 18 wants to learn Violin
(18, 'Piano'),   -- Student 18 also wants to learn Piano
(19, 'Piano'),   -- Student 19 wants to learn Piano
(19, 'Trumpet'), -- Student 19 also wants to learn Trumpet
(20, 'Trumpet'), -- Student 20 wants to learn Trumpet
(20, 'Drums'),   -- Student 20 also wants to learn Drums
(21, 'Violin'),  -- Student 21 wants to learn Violin
(21, 'Piano'),   -- Student 21 also wants to learn Piano
(22, 'Guitar'),  -- Student 22 wants to learn Guitar
(22, 'Trumpet'), -- Student 22 also wants to learn Trumpet
(23, 'Piano'),   -- Student 23 wants to learn Piano
(23, 'Guitar'),  -- Student 23 also wants to learn Guitar
(24, 'Drums'),   -- Student 24 wants to learn Drums
(24, 'Violin'),  -- Student 24 also wants to learn Violin
(25, 'Trumpet'), -- Student 25 wants to learn Trumpet
(25, 'Piano');   -- Student 25 also wants to learn Piano


-- Insert pricing schemes for lessons
INSERT INTO pricing_scheme_history (lesson_id, price, valid_from, valid_to) VALUES
(1, 150.00, '2024-01-15', '2024-07-15'),
(2, 120.00, '2024-02-01', NULL),
(3, 180.00, '2024-03-10', '2024-09-10'),
(4, 130.00, '2024-01-12', '2024-07-12'),
(5, 110.00, '2024-04-05', '2024-10-05'),
(6, 160.00, '2024-05-01', NULL),
(7, 140.00, '2024-01-25', '2024-07-25'),
(8, 190.00, '2024-03-15', '2024-09-15'),
(9, 150.00, '2024-02-20', '2024-08-20'),
(10, 120.00, '2024-01-08', '2024-07-08'),
(11, 110.00, '2024-06-10', '2024-12-10'),
(12, 175.00, '2024-03-22', NULL),
(13, 160.00, '2024-02-11', '2024-08-11'),
(14, 130.00, '2024-01-18', '2024-07-18'),
(15, 140.00, '2024-05-30', '2024-11-30'),
(16, 180.00, '2024-03-05', '2024-09-05'),
(17, 160.00, '2024-02-17', '2024-08-17'),
(18, 150.00, '2024-06-01', '2024-12-01'),
(19, 130.00, '2024-04-12', NULL),
(20, 120.00, '2024-01-03', '2024-07-03'),
(21, 140.00, '2024-03-18', '2024-09-18'),
(22, 190.00, '2024-02-28', '2024-08-28'),
(23, 150.00, '2024-01-21', '2024-07-21'),
(24, 110.00, '2024-04-20', '2024-10-20'),
(25, 180.00, '2024-05-12', NULL),
(26, 160.00, '2024-02-05', '2024-08-05'),
(27, 130.00, '2024-03-25', '2024-09-25'),
(28, 140.00, '2024-01-30', NULL); -- No end date, valid indefinitely

-- Insert payment data for students
INSERT INTO student_payment (student_id, pricing_scheme_history_id, rental_id, sibling_discount, "month") VALUES
(1, 1, 1, 5, '2024-02-11'),
(2, 2, 2, 0, '2024-03-11'),
(3, 3, 3, 10, '2024-04-11'),
(4, 4, 4, 5, '2024-06-11'),
(4, 5, 5, 0, '2024-05-11'),
(5, 6, 6, 5, '2024-07-11'),
(6, 7, 7, 0, '2024-08-11'),
(7, 8, 8, 0, '2024-09-11'),
(8, 9, 9, 5, '2024-10-11'),
(8, 10, 10, 0, '2024-11-11'),
(9, 11, 11, 5, '2024-12-11'),
(10, 12, 12, 0, '2024-01-11'),
(10, 13, 13, 0, '2024-03--11'),
(11, 14, 14, 10, '2024-06-11'),
(12, 15, 15, 0, '2024-07-11'),
(12, 16, 16, 5, '2024-09-11'),
(13, 17, 17, 0, '2024-08-11'),
(14, 18, 18, 5, '2024-11-11'),
(15, 19, 19, 0, '2024-12-11'),
(16, 20, 20, 5, '2024-10-11'),
(16, 21, 21, 10, '2024-02-11'),
(17, 22, 22, 0, '2024-04-11'),
(17, 23, 23, 0, '2024-05-11'),
(18, 24, 24, 5, '2024-06-11'),
(18, 25, 25, 0, '2024-07-11'),
(19, 26, 26, 10, '2024-08-11'),
(20, 27, 27, 0, '2024-09-11'),
(21, 28, 28, 5, '2024-10-11');



-- Insert payment data for instructors
INSERT INTO instructor_payment (instructor_id, pricing_scheme_history_id, schedule_id, "month") VALUES
(1, 1, 1, '2024-01-11'), --1
(1, 2, 2, '2024-02-11'), --2
(2, 3, 3, '2024-02-11'),
(3, 4, 4, '2024-03-11'),
(3, 5, 5, '2024-04-11'),
(4, 6, 6, '2024-05-11'),
(5, 7, 7, '2024-05-11'),
(6, 8, 8, '2024-06-11'),
(6, 9, 9, '2024-07-11'),
(7, 10, 10, '2024-08-11'),
(7, 11, 11, '2024-09-11'),
(8, 12, 12, '2024-09-11'),
(8, 13, 13, '2024-10-11'),
(9, 14, 14, '2024-10-11'),
(9, 15, 15, '2024-11-11'),
(10, 16, 16, '2024-11-11'),
(10, 17, 17, '2024-12-11'),
(11, 18, 18, '2024-12-11'),
(11, 19, 19, '2024-01-11'),
(12, 20, 20, '2024-02-11'),
(12, 21, 21, '2024-03-11'),
(13, 22, 22, '2024-03-11'),
(13, 23, 23, '2024-04-11'),
(14, 24, 24, '2024-05-11');
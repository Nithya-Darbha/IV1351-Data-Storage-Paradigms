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
('19931102-4567', 'Oscar', 'Bergström', 'oscar.bergstrom@gmail.com');

-- Inserting addresses with ZIP codes and city (Stockholm) for all 50 people
INSERT INTO address (address) VALUES
('Storgatan 10, 111 45, Stockholm'), -- address for person 1 and person 2
('Västerlånggatan 5, 111 29, Stockholm'), -- address for person 3 and person 23
('Drottninggatan 12, 111 51, Stockholm'), -- address for person 4 and person 24
('Kungsportsavenyen 1, 114 37, Stockholm'), -- address for person 5 and person 25
('Tullgatan 7, 115 29, Stockholm'), -- address for person 6 and person 26
('Folkets Hus 22, 111 23, Stockholm'), -- address for person 7 and person 27
('Östermalmstorg 3, 114 42, Stockholm'), -- address for person 8 and person 28
('Sveavägen 48, 113 59, Stockholm'), -- address for person 9 and person 29
('Lilla Varholmen 1, 115 35, Stockholm'), -- address for person 10
('Norra Allégatan 15, 114 21, Stockholm'), -- address for person 11
('Västervång 3, 114 24, Stockholm'), -- address for person 12
('Hamngatan 19, 111 47, Stockholm'), -- address for person 13
('Kungsgatan 45, 112 21, Stockholm'), -- address for person 14
('Bergsgatan 8, 112 34, Stockholm'), -- address for person 15
('Högalidsgatan 10, 117 30, Stockholm'), -- address for person 16
('Södra Vägen 21, 116 24, Stockholm'), -- address for person 17 and person 45
('Götgatan 15, 116 21, Stockholm'), -- address for person 18 and person 46
('Nybrogatan 25, 114 39, Stockholm'), -- address for person 19 and person 47
('Hälsingegatan 5, 113 59, Stockholm'), -- address for person 20 and person 48
('Rosenlundsgatan 10, 118 53, Stockholm'), -- address for person 21 and person 49
('Kungsgatan 45, 112 21, Stockholm'), -- address for person 22
('Tullgatan 7, 115 29, Stockholm'), -- address for person 23
('Västerlånggatan 5, 111 29, Stockholm'), -- address for person 24 and person 50
('Hamngatan 19, 111 47, Stockholm'), -- address for person 25
('Södra Vägen 21, 116 24, Stockholm'), -- address for person 26
('Götgatan 15, 116 21, Stockholm'), -- address for person 27
('Hälsingegatan 5, 113 59, Stockholm'), -- address for person 28
('Nybroplan 10, 114 34, Stockholm'), -- address for person 29
('Rosenlundsgatan 10, 118 53, Stockholm'), -- address for person 30
('Kungsgatan 1, 112 21, Stockholm'), -- address for person 31
('Södra Vägen 1, 116 24, Stockholm'), -- address for person 32
('Drottninggatan 25, 111 51, Stockholm'), -- address for person 33
('Folkets Hus 22, 111 23, Stockholm'), -- address for person 34
('Västervång 10, 114 24, Stockholm'), -- address for person 35
('Kungsgatan 45, 112 21, Stockholm'), -- address for person 36
('Sveavägen 1, 113 59, Stockholm'), -- address for person 37
('Lilla Varholmen 5, 115 35, Stockholm'), -- address for person 38
('Lilla Varholmen 10, 115 35, Stockholm'), -- address for person 39
('Storgatan 5, 111 45, Stockholm'), -- address for person 40
('Kungsgatan 3, 112 21, Stockholm'); -- address for person 41



-- Insert phone numbers (total 65 phone numbers, 15 people with 2 numbers)
INSERT INTO phone_number (phone_no) VALUES
('0701234567'), -- person 1
('0732345678'), -- person 2
('0702345679'), -- person 3
('0703456789'), -- person 4
('0733456789'), -- person 5
('0704567890'), -- person 6
('0705678901'), -- person 7
('0734567890'), -- person 8
('0721234567'), -- person 9
('0735678901'), -- person 10
('0722345678'), -- person 11
('0736789012'), -- person 12
('0706789012'), -- person 13
('0737890123'), -- person 14
('0724567890'), -- person 15
('0738901234'), -- person 16
('0707890123'), -- person 17
('0739012345'), -- person 18
('0725678901'), -- person 19
('0730123456'), -- person 20
('0708901234'), -- person 21
('0732345679'), -- person 22
('0726789012'), -- person 23
('0730123456'), -- person 24
('0709012345'), -- person 25
('0731234567'), -- person 26
('0727890123'), -- person 27
('0732345678'), -- person 28
('0702345670'), -- person 29
('0729012345'), -- person 30
('0733456780'), -- person 31
('0701234570'), -- person 32
('0734567899'), -- person 33
('0723456790'), -- person 34
('0735678909'), -- person 35
('0703456790'), -- person 36
('0722345680'), -- person 37
('0736789123'), -- person 38
('0704567899'), -- person 39
('0737890145'), -- person 40
('0724567801'), -- person 41
('0738901256'), -- person 42
('0705678902'), -- person 43
('0739012356'), -- person 44
('0707890124'), -- person 45
('0730123498'), -- person 46
('0726789121'), -- person 47
('0731234579'), -- person 48
('0727890130'), -- person 49
('0709876543'), -- person 50
('0723456781'), -- person 1 (2nd phone)
('0702345679'), -- person 2 (2nd phone)
('0734567889'), -- person 3 (2nd phone)
('0701234598'), -- person 4 (2nd phone)
('0732345689'), -- person 5 (2nd phone)
('0723456799'), -- person 6 (2nd phone)
('0734567878'), -- person 7 (2nd phone)
('0702345689'), -- person 8 (2nd phone)
('0736789023'), -- person 9 (2nd phone)
('0707890120'), -- person 10 (2nd phone)
('0731234578'), -- person 11 (2nd phone)
('0707890130'), -- person 12 (2nd phone)
('0739012360'), -- person 13 (2nd phone)
('0709876545'), -- person 14 (2nd phone)
('0738901260'); -- person 15 (2nd phone)


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
(40, 41); -- Person 41

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
(53, 9)  -- person 9 (2nd phone)
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
(62, 50);-- person 50(2nd phone)

-- Insert student data for persons 16 to 40 with present skills (no prior experience, skilled, advanced, experienced, expert)
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
(41), -- guardian for person 41
(42), -- guardian for person 42
(43), -- guardian for person 43
(44), -- guardian for person 44
(45), -- guardian for person 45
(46), -- guardian for person 46
(47), -- guardian for person 47
(48), -- guardian for person 48
(49), -- guardian for person 49
(50); -- guardian for person 50

-- Mapping guardians to multiple students
INSERT INTO guardian_student (student_id, guardian_id) VALUES
(16, 41), -- Guardian 41 has Student 16
(17, 41), -- Guardian 41 also has Student 17
(18, 42), -- Guardian 42 has Student 18
(19, 42), -- Guardian 42 also has Student 19
(20, 43), -- Guardian 43 has Student 20
(21, 43), -- Guardian 43 also has Student 21
(22, 44), -- Guardian 44 has Student 22
(23, 44), -- Guardian 44 also has Student 23
(24, 45), -- Guardian 45 has Student 24
(25, 45), -- Guardian 45 also has Student 25
(26, 46), -- Guardian 46 has Student 26
(27, 46), -- Guardian 46 also has Student 27
(28, 47), -- Guardian 47 has Student 28
(29, 47), -- Guardian 47 also has Student 29
(30, 48), -- Guardian 48 has Student 30
(31, 48), -- Guardian 48 also has Student 31
(32, 49), -- Guardian 49 has Student 32
(33, 49), -- Guardian 49 also has Student 33
(34, 50), -- Guardian 50 has Student 34
(35, 50), -- Guardian 50 also has Student 35
(36, 50), -- Guardian 50 also has Student 36
(37, 50), -- Guardian 50 also has Student 37
(38, 50), -- Guardian 50 also has Student 38
(39, 50), -- Guardian 50 also has Student 39
(40, 50); -- Guardian 50 also has Student 40


-- Insert data for the schedule table with 1 to 15 instructors and unique appointment slots
INSERT INTO schedule (instructor_id, appointment_slot) VALUES
(1, '2024-12-25 08:00:00'),  -- Instructor 1
(2, '2024-12-25 09:00:00'),  -- Instructor 2
(3, '2024-12-25 10:00:00'),  -- Instructor 3
(4, '2024-12-25 11:00:00'),  -- Instructor 4
(5, '2024-12-25 12:00:00'),  -- Instructor 5
(6, '2024-12-25 13:00:00'),  -- Instructor 6
(7, '2024-12-25 14:00:00'),  -- Instructor 7
(8, '2024-12-25 15:00:00'),  -- Instructor 8
(9, '2024-12-25 16:00:00'),  -- Instructor 9
(10, '2024-12-25 17:00:00'), -- Instructor 10
(11, '2024-12-26 08:00:00'), -- Instructor 11
(12, '2024-12-26 09:00:00'), -- Instructor 12
(13, '2024-12-26 10:00:00'), -- Instructor 13
(14, '2024-12-26 11:00:00'), -- Instructor 14
(15, '2024-12-26 12:00:00'); -- Instructor 15


-- Insert lessons into the lesson table
INSERT INTO lesson (instructor_id, level_name, type_name, booked_at) VALUES
(1, 'Beginner', 'Individual', '2024-01-01'),
(2, 'Intermediate', 'Group', '2024-01-02'),
(3, 'Advanced', 'Ensemble', '2024-01-03'),
(4, 'Beginner', 'Group', '2024-01-04'),
(5, 'Advanced', 'Individual', '2024-01-05');


-- Insert data into the individual_lessons table
INSERT INTO individual_lessons (lesson_id, student_id, instrument_type) VALUES
(1, 16, 'Piano'),
(5, 17, 'Violin');

-- Insert data into the group_lessons table
INSERT INTO group_lessons (lesson_id, instrument_type, min_students, max_students) VALUES
(2, 'Guitar', 3, 5),
(4, 'Drums', 2, 6);

-- Insert data into the ensembles table
INSERT INTO ensembles (lesson_id, genre, min_students, max_students, instrument_type) VALUES
(3, 'Jazz', 5, 10, 'Trumpet');


-- Insert data into the student_group_lessons table
INSERT INTO student_group_lessons (student_id, lesson_id) VALUES
(18, 2),
(19, 2),
(20, 2),
(21, 4),
(22, 4),
(23, 4);

-- Insert data into the student_ensembles table
INSERT INTO student_ensembles (student_id, lesson_id) VALUES
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3);


-- Insert data into the instruments table
INSERT INTO instruments (instructor_id, instrument_type, brand, quantity, price_per_month) VALUES
(1, 'Piano', 'Yamaha', 5, 50.00),
(2, 'Guitar', 'Fender', 10, 30.00),
(3, 'Violin', 'Stradivarius', 8, 40.00),
(4, 'Drums', 'Roland', 4, 60.00),
(5, 'Trumpet', 'Bach', 6, 45.00);


-- Insert data into the renting_instruments table
INSERT INTO renting_instruments (student_id, instrument_id, start_rent, end_rent) VALUES
(16, 1, '2024-01-10', '2024-02-10'), -- Student 16 rents Piano
(17, 3, '2024-01-15', NULL),         -- Student 17 rents Violin indefinitely
(18, 2, '2024-01-20', '2024-03-20'), -- Student 18 rents Guitar
(19, 4, '2024-01-25', NULL),         -- Student 19 rents Drums indefinitely
(20, 5, '2024-02-01', '2024-03-01'); -- Student 20 rents Trumpet


-- Insert data into the instruments_to_learn table
INSERT INTO instruments_to_learn (student_id, instrument_type) VALUES
(1, 'Piano'),
(2, 'Violin'),
(3, 'Guitar'),
(4, 'Drums'),
(5, 'Trumpet'),
(6, 'Piano'),
(7, 'Guitar'),
(8, 'Violin'),
(9, 'Trumpet'),
(10, 'Drums'),
(11, 'Piano'),
(12, 'Guitar'),
(13, 'Violin'),
(14, 'Trumpet'),
(15, 'Drums'),
(16, 'Piano'),
(17, 'Guitar'),
(18, 'Violin'),
(19, 'Trumpet'),
(20, 'Drums'),
(21, 'Piano'),
(22, 'Guitar'),
(23, 'Violin'),
(24, 'Trumpet'),
(25, 'Drums');

-- Insert pricing schemes for lessons
INSERT INTO pricing_scheme_history (lesson_id, price, valid_from, valid_to) VALUES
(1, 100.00, '2023-01-01', '2023-12-31'),
(2, 120.00, '2023-01-01', '2023-12-31'),
(3, 150.00, '2023-01-01', '2023-12-31'),
(4, 200.00, '2023-01-01', NULL); -- No end date, valid indefinitely

-- Insert payment data for students
INSERT INTO student_payment (student_id, pricing_scheme_history_id, rental_id, sibling_discount, month, month_fee) VALUES
(1, 1, 1, 10.00, '2023-01-01', 90.00), -- Discount applied
(2, 2, NULL, NULL, '2023-01-01', 120.00), -- No rental, no discount
(3, 3, 2, 5.00, '2023-01-01', 145.00), -- Discount applied
(4, 4, NULL, NULL, '2023-01-01', 200.00); -- No discount

-- Insert payment data for instructors
INSERT INTO instructor_payment (instructor_id, pricing_scheme_history_id, schedule_id, month, month_fee) VALUES
(1, 1, 1, '2023-01-01', 500.00), -- Scheduled lesson with fixed fee
(2, 2, 2, '2023-01-01', 600.00), -- Scheduled lesson with fixed fee
(3, 3, 3, '2023-01-01', 700.00), -- Scheduled lesson with fixed fee
(4, 4, 4, '2023-01-01', 800.00); -- Scheduled lesson with fixed fee



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
  student_id int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  instrument_type varchar(500) NOT NULL,
  PRIMARY KEY(student_id)
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
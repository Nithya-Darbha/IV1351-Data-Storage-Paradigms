CREATE TABLE "person"
(
  "person_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "personal_number" varchar(500) UNIQUE NOT NULL,
  "first_name" varchar(500) NOT NULL,
  "last_name" varchar(500) NOT NULL,
  "email_address" varchar(500) NOT NULL
);

CREATE TABLE "student"
(
  "student_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "person_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "person",
  "present_skill" varchar(500) NOT NULL
);

CREATE TABLE "enrollment"
(
  "enrollment_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "student_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "student",
  "places_left" int NOT NULL
);



CREATE TABLE "instructor"
(
  "instructor_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "person_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "person",
  "ensemble_eligibility" BOOLEAN NOT NULL
);

CREATE TABLE "guardian"
(
  "guardian_id_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "person_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "person"
);

CREATE TABLE "sibling"
(
  "student_id" int GENERATED ALWAYS AS IDENTITY REFERENCES "student",
  "enrollment_id" int GENERATED ALWAYS AS IDENTITY REFERENCES "enrollment",
  PRIMARY KEY("student_id" ,"enrollment_id")
);

CREATE TABLE "address"
(
  "address_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "address" varchar(500) UNIQUE NOT NULL
);

CREATE TABLE "phone_number"
(
  "phone_num_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "phone_no" varchar(500) UNIQUE NOT NULL
);


CREATE TABLE "schedule"
(
  "schedule_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "instructor_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "instructor",
  "appointment_slot" timestamp(6) UNIQUE NOT NULL
);

CREATE TABLE "rent_eligibility"
(
  "rent_eligibility_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "student_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "student"
 -- "rental_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "renting_instruments"
);

CREATE TABLE "renting_instruments"
(
  "rental_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "student_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "student",
  "rental_eligibility_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "rent_eligibility",
  "start_rent" date NOT NULL,
  "end_rent" date
);


CREATE TABLE "instruments"
(
  "instrument_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "rental_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "renting_instruments",
  "instructor_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "instructor",
  "instrument_type" varchar(500) NOT NULL,
  "brand" varchar(500) NOT NULL,
  "quantity" int NOT NULL ,
  "price_per_month" numeric(10) NOT NULL
);

CREATE TABLE "instruments_to_learn"
(
  "student_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "student",
  "instrument_type" varchar(500) NOT NULL,
  PRIMARY KEY("student_id")
);

CREATE TABLE "lesson"
(
  "lesson_id" int  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "instructor_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "instructor",
  "level_name" varchar(500) NOT NULL,
  "type_name" varchar(500) NOT NULL,
  "booked_at" date NOT NULL
);



CREATE TABLE "pricing_scheme_history"
(
  "pricing_scheme_histor_id" int  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "lesson_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "lesson",
  "price" numeric(10) NOT NULL,
  "valid_from" date NOT NULL,
  "valid_to" date 
);

CREATE TABLE "student_payment"
(
  "student_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "student",
  "pricing_scheme_history_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "pricing_scheme_history",
  "rental_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "renting_instruments",
  "sibling_discount" numeric(10),
  "month" date NOT NULL,
  "month_fee" numeric(10) NOT NULL
); 

CREATE TABLE "instructor_payment"
(
  "instructor_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "instructor",
  "pricing_scheme_history_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "pricing_scheme_history",
  "schedule_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "schedule",
  "month" date NOT NULL,
  "month_fee" numeric(10) NOT NULL
);





CREATE TABLE "individual_lessons"
(
  "lesson_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "lesson",
  "student_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "student",
  "instrument_type" varchar(500) NOT NULL,
  PRIMARY KEY("lesson_id")
);

CREATE TABLE "group_lessons"
(
  "lesson_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "lesson",
  "instrument_type" varchar(500) NOT NULL,
  "min_students" int NOT NULL,
  "max_students" int NOT NULL,
  PRIMARY KEY("lesson_id")
);

CREATE TABLE "ensembles"
(
  "lesson_id" int  GENERATED ALWAYS AS IDENTITY REFERENCES "lesson",
  "genre" varchar(500) NOT NULL,
  "min_students" int NOT NULL,
  "max_students" int NOT NULL,
  "instrument_type" varchar(500) NOT NULL,
  PRIMARY KEY("lesson_id")
);

--cross reference tables

CREATE TABLE "person_phone"
(
  "phone_num_id" int NOT NULL REFERENCES "phone_number" ON DELETE CASCADE,
  "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
  PRIMARY KEY("phone_num_id", "person_id")
);

CREATE TABLE "person_address"
(
  "address_id" int NOT NULL REFERENCES "address" ON DELETE CASCADE,
  "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
  PRIMARY KEY("address_id", "person_id")
);

CREATE TABLE "guardian_student"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "guardian_id" int NOT NULL REFERENCES "guardian" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "guardian_id")
);

CREATE TABLE "guardian_sibling"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "guardian_id" int NOT NULL REFERENCES "guardian" ON DELETE CASCADE,
  "enrollment_id" int NOT NULL REFERENCES "enrollment" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "guardian_id","enrollment_id")
);

CREATE TABLE "student_group_lessons"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "lesson_id")
);

CREATE TABLE "student_ensembles"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "lesson_id")
);





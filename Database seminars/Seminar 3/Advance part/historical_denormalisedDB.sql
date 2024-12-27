CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    personal_number VARCHAR(500) UNIQUE NOT NULL,
    first_name VARCHAR(500) NOT NULL,
    last_name VARCHAR(500) NOT NULL,
    email_address VARCHAR(500) UNIQUE NOT NULL
);

CREATE TABLE lesson (
    id SERIAL PRIMARY KEY,
    type_name VARCHAR(500) NOT NULL,
    level_name VARCHAR(500) NOT NULL,
    genre VARCHAR(500),
    instrument_type VARCHAR(500),
    price numeric(10) NOT NULL
);

CREATE TABLE student_lesson (
    student_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
    lesson_id  INT NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
    PRIMARY KEY(student_id, lesson_id)
);
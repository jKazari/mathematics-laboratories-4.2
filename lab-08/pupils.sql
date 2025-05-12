-- Task 18
CREATE TABLE pupils (
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    grade NUMBER
);

-- Task 19
ALTER TABLE pupils
ADD CONSTRAINT check_grade CHECK (grade BETWEEN 1 AND 6 AND grade = FLOOR(grade));

-- Task 20
-- INSERT INTO pupils (first_name, last_name, grade)
-- VALUES ('Michał', 'Kowalski', 7);

-- Task 21
ALTER TABLE pupils
ADD CONSTRAINT pk_pupils PRIMARY KEY (first_name, last_name);

-- Task 22
ALTER TABLE pupils
ADD average_grade NUMBER(3,2);

-- Task 23
INSERT INTO pupils (first_name, last_name, grade, average_grade)
VALUES ('Anna', 'Nowak', 3, 4.25);

INSERT INTO pupils (first_name, last_name, grade, average_grade)
VALUES ('Piotr', 'Zieliński', 5, 3.80);

SELECT * FROM pupils;

-- Task 24
-- ALTER TABLE pupils DROP COLUMN last_name;

ALTER TABLE pupils DROP CONSTRAINT pk_pupils;
ALTER TABLE pupils DROP COLUMN last_name;

-- Task 25
UPDATE pupils
SET average_grade = average_grade + 0.5;

SELECT * FROM pupils;

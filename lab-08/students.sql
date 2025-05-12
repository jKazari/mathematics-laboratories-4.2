-- Task 1
CREATE TABLE students (
    index_number NUMBER(6),
    last_name VARCHAR2(30),
    first_name VARCHAR2(30),
    grade NUMBER(3,2),
    pass_date DATE
);

COMMENT ON COLUMN students.index_number IS 'Students index number';
COMMENT ON COLUMN students.pass_date IS 'Date of course completion';

-- Task 2
INSERT INTO students (index_number, last_name, first_name, grade, pass_date) VALUES (100001, 'Kowalski', 'Jan', 4.5, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO students (index_number, last_name, first_name, grade, pass_date) VALUES (100002, 'Nowak', 'Anna', 3.0, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO students (index_number, last_name, first_name, grade, pass_date) VALUES (100003, 'Wiśniewski', 'Marek', 5.0, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO students (index_number, last_name, first_name, grade, pass_date) VALUES (100004, 'Zielińska', 'Karolina', 4.0, TO_DATE('2024-01-18', 'YYYY-MM-DD'));
INSERT INTO students (index_number, last_name, first_name, grade, pass_date) VALUES (100005, 'Wójcik', 'Piotr', 2.5, TO_DATE('2024-01-25', 'YYYY-MM-DD'));

-- Task 3
INSERT INTO students (index_number, last_name, first_name) VALUES (100006, 'Kaczmarek', 'Ewa');
INSERT INTO students (index_number, last_name, first_name) VALUES (100007, 'Mazur', 'Tomasz');

-- Task 4
-- INSERT INTO students (index_number, last_name, first_name, grade)
-- VALUES (100008, 'Testowy', 'Error', 'Invalid_grade');

-- Task 5
SELECT first_name, last_name FROM students
WHERE grade >= 4
ORDER BY last_name ASC;

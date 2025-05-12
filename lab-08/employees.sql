-- Task 6
CREATE TABLE employees (
    employee_id NUMBER(5) PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department NUMBER DEFAULT 1
);

-- Task 7
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10001, 'Anna', 'Kowalska', 1);
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10002, 'Jan', 'Nowak', 2);
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10003, 'Ewa', 'Wiśniewska', 3);
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10004, 'Piotr', 'Mazur', 1);
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10005, 'Kamil', 'Krawczyk', 2);
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10006, 'Magda', 'Dąbrowska', 3);

-- Task 8
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10001, 'Tomasz', 'Wójcik', 1);
INSERT INTO employees (employee_id, first_name, last_name, department) VALUES (10001, 'Marta', 'Zając', 2);

-- Task 9
ALTER TABLE employees MODIFY last_name VARCHAR2(50) NOT NULL;

-- Task 10
ALTER TABLE employees RENAME COLUMN department TO department_number;

-- Task 11
DELETE FROM employees WHERE department_number > 2;

-- Task 12
ALTER TABLE employees
ADD CONSTRAINT check_dept CHECK (department_number IN (1, 2));

-- Task 13
ALTER TABLE employees
ADD phone_number NUMBER(9);

ALTER TABLE employees
ADD CONSTRAINT unique_phone UNIQUE (phone_number);

-- Task 14
INSERT INTO employees (employee_id, first_name, last_name, department_number, phone_number)
VALUES (10007, 'Karolina', 'Lis', 1, 123456789);

INSERT INTO employees (employee_id, first_name, last_name, department_number, phone_number)
VALUES (10008, 'Rafał', 'Kaczmarek', 2, 987654321);

SELECT * FROM employees;

-- Task 15
ALTER TABLE employees RENAME TO company_x_employees;

-- Task 16
SELECT first_name, last_name
FROM company_x_employees
WHERE department_number = 1 AND (first_name LIKE '%a' OR last_name LIKE '%a');

-- Task 17
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'employees';

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'company_x_employees';

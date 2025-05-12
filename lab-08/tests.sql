-- Task 38
CREATE TABLE tests (
    brand              VARCHAR2(30),
    vehicle_type       VARCHAR2(30),
    practical_test     NUMBER(6,2),
    reliability_test   NUMBER(6,2),
    safety_test        NUMBER(6,2),
    test_date          DATE
);

INSERT INTO tests VALUES ('Toyota', 'car', 8.49, 6.55, 3.77, TO_DATE('23-01-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Audi', 'car', 9.99, 7.45, 6.79, TO_DATE('23-02-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Honda', 'car', 9.89, 6.59, 5.97, TO_DATE('03-03-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Volvo', 'car', 9.89, 5.89, 7.99, TO_DATE('24-01-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Kawasaki', 'motorcycle', 4.39, 5.85, 3.88, TO_DATE('24-02-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('BMW', 'motorcycle', 4.99, 5.78, 3.77, TO_DATE('05-03-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Kawasaki', 'motorcycle', 3.99, NULL, 2.59, TO_DATE('05-01-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Honda', 'motorcycle', 4.99, NULL, 3.69, TO_DATE('25-02-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Honda', 'motorcycle', 3.99, NULL, 3.89, TO_DATE('06-01-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Seat', 'car', 8.99, 6.69, 5.89, TO_DATE('06-02-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Ford', 'car', 7.89, 6.61, 6.19, TO_DATE('06-03-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('BMW', 'car', 9.49, 7.31, 7.23, TO_DATE('05-01-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Toyota', 'car', 8.59, 5.47, 5.26, TO_DATE('05-02-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('Honda', 'car', 7.49, 4.59, 4.47, TO_DATE('05-03-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('BMW', 'car', 8.79, 4.69, 6.59, TO_DATE('15-01-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('BMW', 'motorcycle', 5.49, 4.17, 3.69, TO_DATE('15-02-2010', 'DD-MM-YYYY'));
INSERT INTO tests VALUES ('BMW', 'motorcycle', 6.89, 3.98, 4.88, TO_DATE('15-03-2010', 'DD-MM-YYYY'));

-- Task 39
SELECT * FROM tests;

-- Task 40
SELECT 
    MEDIAN(practical_test) AS median_practical_test,
    MAX(practical_test) AS max_practical_test
FROM tests
WHERE brand = 'Honda' AND vehicle_type = 'motorcycle';

-- Task 41
SELECT 
    brand,
    vehicle_type,
    reliability_test
FROM tests
ORDER BY reliability_test DESC;

-- Task 42
SELECT 
    vehicle_type,
    TO_CHAR(test_date, 'MM') AS month,
    MIN(practical_test) AS min_practical,
    MEDIAN(practical_test) AS median_practical,
    MIN(reliability_test) AS min_reliability,
    MEDIAN(reliability_test) AS median_reliability,
    MIN(safety_test) AS min_safety,
    MEDIAN(safety_test) AS median_safety
FROM tests
GROUP BY vehicle_type, TO_CHAR(test_date, 'MM')
ORDER BY vehicle_type, month;

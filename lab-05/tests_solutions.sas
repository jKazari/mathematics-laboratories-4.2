/* Task 13 */
PROC SQL;
    CREATE TABLE tests (
        brand                VARCHAR(30), 
        vehicle_type         VARCHAR(30), 
        practical_test       NUM(6,2), 
        reliability_test     NUM(6,2), 
        safety_test          NUM(6,2), 
        test_date            NUM FORMAT=DDMMYYP10.
    );

    INSERT INTO tests VALUES ('Toyota', 'car', 8.49, 6.55, 3.77, '23Jan2010'd);
    INSERT INTO tests VALUES ('Audi', 'car', 9.99, 7.45, 6.79, '23Feb2010'd);
    INSERT INTO tests VALUES ('Honda', 'car', 9.89, 6.59, 5.97, '03Mar2010'd);
    INSERT INTO tests VALUES ('Volvo', 'car', 9.89, 5.89, 7.99, '24Jan2010'd);
    INSERT INTO tests VALUES ('Kawasaki', 'motorcycle', 4.39, 5.85, 3.88, '24Feb2010'd);
    INSERT INTO tests VALUES ('BMW', 'motorcycle', 4.99, 5.78, 3.77, '05Mar2010'd);
    INSERT INTO tests VALUES ('Kawasaki', 'motorcycle', 3.99, NULL, 2.59, '05Jan2010'd);
    INSERT INTO tests VALUES ('Honda', 'motorcycle', 4.99, NULL, 3.69, '25Feb2010'd);
    INSERT INTO tests VALUES ('Honda', 'motorcycle', 3.99, NULL, 3.89, '06Jan2010'd);
    INSERT INTO tests VALUES ('Seat', 'car', 8.99, 6.69, 5.89, '06Feb2010'd);
    INSERT INTO tests VALUES ('Ford', 'car', 7.89, 6.61, 6.19, '06Mar2010'd);
    INSERT INTO tests VALUES ('BMW', 'car', 9.49, 7.31, 7.23, '05Jan2010'd);
    INSERT INTO tests VALUES ('Toyota', 'car', 8.59, 5.47, 5.26, '05Feb2010'd);
    INSERT INTO tests VALUES ('Honda', 'car', 7.49, 4.59, 4.47, '05Mar2010'd);
    INSERT INTO tests VALUES ('BMW', 'car', 8.79, 4.69, 6.59, '15Jan2010'd);
    INSERT INTO tests VALUES ('BMW', 'motorcycle', 5.49, 4.17, 3.69, '15Feb2010'd);
    INSERT INTO tests VALUES ('BMW', 'motorcycle', 6.89, 3.98, 4.88, '15Mar2010'd);
RUN;

/* Task 14 */
PROC SQL;
    SELECT * FROM tests;
RUN;

/* Task 15 */
PROC SQL;
    SELECT 
        MEDIAN(practical_test) AS median_practical_test,
        MAX(practical_test) AS max_practical_test
    FROM tests
    WHERE brand = 'Honda' AND vehicle_type = 'motorcycle';
RUN;

/* Task 16 */
PROC SQL;
    SELECT brand, vehicle_type, reliability_test
    FROM tests
    WHERE reliability_test IS NOT NULL
    ORDER BY reliability_test DESC;
RUN;

/* Task 17 */
PROC SQL;
    SELECT 
        vehicle_type, 
        MONTH(test_date) AS month,
        MIN(practical_test) AS min_practical, 
        MEDIAN(practical_test) AS median_practical,
        MIN(reliability_test) AS min_reliability, 
        MEDIAN(reliability_test) AS median_reliability,
        MIN(safety_test) AS min_safety, 
        MEDIAN(safety_test) AS median_safety
    FROM tests
    GROUP BY vehicle_type, month
    ORDER BY vehicle_type, month;
QUIT;
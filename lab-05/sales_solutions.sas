/* Task 1 */
PROC SQL;
    CREATE TABLE sales (
        id          NUM	PRIMARY KEY, 
        brand       VARCHAR(10)	NOT NULL, 
        product     VARCHAR(15)	NOT NULL, 
        quarter     CHAR(3),
        quantity    NUM
    );

    INSERT INTO sales VALUES (10, 'Bosch', 'microwave', 'I', 4);
    INSERT INTO sales VALUES (11, 'Amica', 'washing machine', 'I', 3);
    INSERT INTO sales VALUES (12, 'Amica', 'dishwasher', 'I', 3);
    INSERT INTO sales VALUES (13, 'Whirlpool', 'fridge', 'I', 2);
    INSERT INTO sales VALUES (14, 'Bosch', 'fridge', 'II', 4);
    INSERT INTO sales VALUES (15, 'Whirlpool', 'stove', 'II', 1);
    INSERT INTO sales VALUES (16, 'Amica', 'fridge', 'II', NULL);
    INSERT INTO sales VALUES (17, 'Siemens', 'microwave', 'II', 8);
    INSERT INTO sales VALUES (18, 'Bosch', 'dishwasher', 'II', 7);
    INSERT INTO sales VALUES (19, 'Whirlpool', 'washing machine', 'III', 5);
    INSERT INTO sales VALUES (20, 'Bosch', 'washing machine', 'III', 1);
    INSERT INTO sales VALUES (21, 'Whirlpool', 'fridge', 'III', 4);
    INSERT INTO sales VALUES (22, 'Whirlpool', 'stove', 'III', 7);
    INSERT INTO sales VALUES (23, 'Siemens', 'washing machine', 'IV', 2);
    INSERT INTO sales VALUES (24, 'Bosch', 'fridge', 'IV', 6);
    INSERT INTO sales VALUES (25, 'Amica', 'fridge', 'IV', 5);
    INSERT INTO sales VALUES (26, 'Amica', 'dishwasher', 'IV', 2);
    INSERT INTO sales VALUES (27, 'Bosch', 'washing machine', NULL, NULL);
    INSERT INTO sales VALUES (28, 'Whirlpool', 'washing machine', 'IV', 5);
RUN;

PROC SQL;
    SELECT * FROM sales;
RUN;

/* Task 2 */
PROC SQL;
    SELECT COUNT(*) AS row_count, 
           ROUND(AVG(quantity), 2) AS avg_quantity
    FROM sales;
RUN;

/* Task 3 */
PROC SQL;
    SELECT brand, 
           AVG(quantity) AS avg_quantity, 
           SUM(quantity) AS total_quantity
    FROM sales
    GROUP BY brand
    ORDER BY brand;
RUN;

/* Task 4 */
PROC SQL;
    SELECT brand, 
           AVG(quantity) AS avg_quantity, 
           SUM(quantity) AS total_quantity
    FROM sales
    GROUP BY brand
    HAVING SUM(quantity) > 10
    ORDER BY brand;
RUN;

/* Task 5 */
PROC SQL;
    SELECT brand, 
           AVG(quantity) AS avg_quantity
    FROM sales
    WHERE quarter = 'IV'
    GROUP BY brand
    ORDER BY avg_quantity ASC;
RUN;

/* Task 6 */
PROC SQL;
    SELECT brand, 
           AVG(quantity) AS avg_quantity
    FROM sales
    WHERE quarter = 'IV'
    GROUP BY brand
    HAVING AVG(quantity) > 4
    ORDER BY avg_quantity ASC;
RUN;

/* Task 7 */
PROC SQL;
    SELECT product, COUNT(*) AS occurrences
    FROM sales
    GROUP BY product
    ORDER BY occurrences DESC;
RUN;

/* Task 8 */
PROC SQL;
    SELECT product, SUM(quantity) AS total_quantity
    FROM sales
    GROUP BY product
    ORDER BY total_quantity DESC;
RUN;

/* Task 9 */
PROC SQL;
    SELECT brand, product, 
           AVG(quantity) AS avg_quantity, 
           MIN(quantity) AS min_quantity, 
           MAX(quantity) AS max_quantity
    FROM sales
    GROUP BY brand, product
    ORDER BY brand, product;
RUN;

/* Task 10 */
PROC SQL;
    SELECT brand, product, 
           AVG(quantity) AS avg_quantity, 
           MIN(quantity) AS min_quantity, 
           MAX(quantity) AS max_quantity
    FROM sales
    WHERE brand = 'Siemens'
    GROUP BY brand, product;
RUN;

/* Task 11 */
PROC SQL;
    SELECT quarter, brand, COUNT(*) AS occurrences
    FROM sales
    WHERE quarter IS NOT NULL
    GROUP BY quarter, brand
    HAVING COUNT(*) >= 2
    ORDER BY quarter, occurrences DESC;
RUN;

/* Task 12 */
PROC SQL;
    SELECT brand, COUNT(DISTINCT product) AS available_products
    FROM sales
    GROUP BY brand;
QUIT;
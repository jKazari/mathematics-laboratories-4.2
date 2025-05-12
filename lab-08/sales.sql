-- Task 26
CREATE TABLE sales (
    id         NUMBER(5) PRIMARY KEY,
    brand      VARCHAR2(30),
    product    VARCHAR2(30),
    quantity   NUMBER(5),
    quarter    VARCHAR2(2)
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

SELECT * FROM sales;

-- Task 27
SELECT 
    COUNT(*) AS row_count,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM sales;

-- Task 28
SELECT 
    brand,
    ROUND(AVG(quantity), 2) AS avg_quantity,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY brand
ORDER BY brand;

-- Task 29
SELECT 
    brand,
    ROUND(AVG(quantity), 2) AS avg_quantity,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY brand
HAVING SUM(quantity) > 10
ORDER BY brand;

-- Task 30
SELECT 
    brand,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM sales
WHERE quarter = 'IV'
GROUP BY brand
ORDER BY avg_quantity;

-- Task 31
SELECT 
    brand,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM sales
WHERE quarter = 'IV'
GROUP BY brand
HAVING AVG(quantity) > 4
ORDER BY avg_quantity;

-- Task 32
SELECT 
    product,
    COUNT(*) AS occurrences
FROM sales
GROUP BY product
ORDER BY occurrences DESC;

-- Task 33
SELECT 
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
ORDER BY total_quantity;

-- Task 34
SELECT 
    brand,
    product,
    ROUND(AVG(quantity), 2) AS avg_quantity,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity
FROM sales
GROUP BY brand, product
ORDER BY brand, product;

-- Task 35
SELECT 
    brand,
    product,
    ROUND(AVG(quantity), 2) AS avg_quantity,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity
FROM sales
WHERE brand = 'Siemens'
GROUP BY brand, product
ORDER BY product;

-- Task 36
SELECT 
    brand,
    quarter,
    COUNT(*) AS occurrences
FROM sales
GROUP BY brand, quarter
HAVING COUNT(*) >= 2
ORDER BY quarter;

-- Task 37
SELECT 
    brand,
    COUNT(DISTINCT product) AS available_products
FROM sales
GROUP BY brand;

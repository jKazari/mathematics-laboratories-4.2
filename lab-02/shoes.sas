/* Task 1 */
PROC SQL;
	SELECT * FROM sashelp.shoes WHERE Region LIKE 'A%';
RUN;

/* Task 2 */
PROC SQL;
	SELECT * FROM sashelp.shoes WHERE Stores > 25;
RUN;

/* Task 3 */
PROC SQL;
	SELECT * FROM sashelp.shoes WHERE Subsidiary BETWEEN 'T' AND 'X';
RUN;

/* Task 4 */
PROC SQL;
	SELECT * FROM sashelp.shoes
	WHERE Subsidiary IN ('Tel Aviv', 'Dubai', 'Warsaw', 'Addis Ababa', 'Calgary')
	ORDER BY Subsidiary;
RUN;

/* Task 5 */
PROC SQL;
    SELECT Region, Product, Subsidiary, 
           SUM(SIN(Sales)) AS Sum_Sin_Sales, 
           SUM(COS(Inventory)) AS Sum_Cos_Inventory, 
           SUM(TAN(Returns)) AS Sum_Tan_Returns
    FROM sashelp.shoes;
RUN;

/* Task 6 */
PROC SQL;
    SELECT Subsidiary FROM sashelp.shoes
    WHERE Region = 'Pacific';
RUN;

/* Task 7 */
PROC SQL;
    SELECT DISTINCT Subsidiary FROM sashelp.shoes
    WHERE Region = 'Pacific';
RUN;

/* Task 8 */
PROC SQL;
    SELECT Subsidiary, Returns FROM sashelp.shoes
    ORDER BY Returns DESC;
RUN;

/* Task 26 */
PROC CONTENTS DATA = sashelp.shoes;
RUN;

/* Task 27 */
PROC SQL;
    CREATE TABLE Work.Buty LIKE sashelp.shoes;
    INSERT INTO Work.Buty
    VALUES ('Europe',	'Sneakers',	'Adidas',	50, 2000, 500, 30)
    VALUES ('Asia',		'Boots',	'Nike',		40, 1500, 300, 25);
RUN;

/* Task 28 */
PROC SQL;
    INSERT INTO Work.Buty
    SELECT * FROM sashelp.shoes
    WHERE Region = 'Asia' AND SUBSTR(Product, 2, 1) = 'o';
RUN;

/* Task 29 */
PROC SQL;
    CREATE TABLE Work.Buty1 AS
    SELECT Region, Product, Stores
    FROM sashelp.shoes
    WHERE Stores BETWEEN 1 AND 10;
RUN;
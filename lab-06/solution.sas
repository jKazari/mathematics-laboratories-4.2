PROC SQL;
	CREATE TABLE table1 (
		id NUM,
		name CHAR(20)
	);
	INSERT INTO table1 VALUES (1, 'Alice');
	INSERT INTO table1 VALUES (2, 'Bob');
	INSERT INTO table1 VALUES (3, 'Charlie');
	INSERT INTO table1 VALUES (4, 'David');

	CREATE TABLE table2 (
		id NUM,
		age NUM
	);
	INSERT INTO table2 VALUES (2, 25);
	INSERT INTO table2 VALUES (3, 30);
	INSERT INTO table2 VALUES (4, 35);
	INSERT INTO table2 VALUES (5, 40);
RUN;

PROC SQL;
	/* INNER JOIN */
	CREATE TABLE inner_join AS
	SELECT a.id, a.name, b.age FROM table1 AS a
	INNER JOIN table2 AS b
	ON a.id = b.id;
	/* Comment: Only rows with matching 'id' values in both tables are included. */

	/* LEFT JOIN */
	CREATE TABLE left_join AS
	SELECT a.id, a.name, b.age FROM table1 AS a
	LEFT JOIN table2 AS b
	ON a.id = b.id;
	/* Comment: All rows from 'table1' are included. If no match is found in 'table2', 'age' is set to missing. */

	/* RIGHT JOIN */
	CREATE TABLE right_join AS
	SELECT a.id, a.name, b.age FROM table1 AS a
	RIGHT JOIN table2 AS b
	ON a.id = b.id;
	/* Comment: All rows from 'table2' are included. If no match is found in 'table1', 'name' is set to missing. */

	/* FULL JOIN */
	CREATE TABLE full_join AS
	SELECT a.id, a.name, b.age FROM table1 AS a
	FULL JOIN table2 AS b
	ON a.id = b.id;
	/* Comment: All rows from both tables are included. If no match is found, missing values are used for non-matching columns. */
RUN;
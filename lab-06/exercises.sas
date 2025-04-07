/* Exercise 1 */
PROC SQL;
    CREATE TABLE sport AS
    SELECT name, team FROM sashelp.baseball
    WHERE logsalary IS NULL AND name > "A" AND name < "D"
    ORDER BY name;
    
    SELECT * FROM sport;
RUN;

PROC SQL;
    DESCRIBE TABLE sashelp.baseball;
    
    CREATE TABLE sport (KEEP=name AND KEEP=logsalary) LIKE sashelp.baseball;
    
    CREATE TABLE sport1 AS SELECT name, logsalary FROM sashelp.baseball
    WHERE logsalary IS NULL AND name > "A" AND name < "D"
    ORDER BY name;
    
    INSERT INTO sport
    SELECT * FROM sport1;
    SELECT * FROM sport;
RUN;

/* Exercise 2 */
PROC SQL;
    CREATE TABLE A (
        start VARCHAR(1) PRIMARY KEY,
        number NUM
    );

    CREATE TABLE B (
        end VARCHAR(1) PRIMARY KEY,
        number NUM
    );

    INSERT INTO A VALUES ('A', 1);
    INSERT INTO A VALUES ('B', 2);
    INSERT INTO A VALUES ('C', 1);
    INSERT INTO A VALUES ('D', 4);

    INSERT INTO B VALUES ('W', NULL);
    INSERT INTO B VALUES ('X', 1);
    INSERT INTO B VALUES ('Y', 2);
    INSERT INTO B VALUES ('Z', 5);

    SELECT * FROM A;
    SELECT * FROM B;
RUN;

PROC SQL;
    SELECT * FROM A FULL JOIN B
    ON A.number = B.number;
RUN;

PROC SQL;
    SELECT * FROM A INNER JOIN B
    ON A.number = B.number;
RUN;

PROC SQL;
    SELECT A.start, B.end, A.number FROM A INNER JOIN B
    ON A.number = B.number;
RUN;

PROC SQL;
    SELECT * FROM A LEFT JOIN B
    ON A.number = B.number;
RUN;

PROC SQL;
    SELECT * FROM A LEFT JOIN B
    ON A.number = B.number
    WHERE B.number IS NULL;
RUN;

PROC SQL;
    SELECT * FROM A RIGHT JOIN B
    ON A.number = B.number;
RUN;

PROC SQL;
    SELECT * FROM A RIGHT JOIN B
    ON A.number = B.number
    WHERE A.number IS NULL;
RUN;

PROC SQL;
    SELECT * FROM A
    UNION ALL
    SELECT * FROM B;
RUN;

/* Exercise 3 */
PROC SQL NOPRINT;
    CREATE TABLE full AS SELECT t.*, n.* FROM sashelp.stocks t 
    FULL JOIN sashelp.snacks n
    ON t.DATE = n.DATE;

    CREATE TABLE inner AS SELECT t.*, n.* FROM sashelp.stocks t 
    INNER JOIN sashelp.snacks n
    ON t.DATE = n.DATE;

    CREATE TABLE left AS SELECT t.*, n.* FROM sashelp.stocks t 
    LEFT JOIN sashelp.snacks n
    ON t.DATE = n.DATE;

    CREATE TABLE right AS SELECT t.*, n.* FROM sashelp.stocks t 
    RIGHT JOIN sashelp.snacks n
    ON t.DATE = n.DATE;

    SELECT COUNT(*) AS no_stocks FROM sashelp.stocks;
    SELECT COUNT(*) AS no_snacks FROM sashelp.snacks;
    SELECT COUNT(*) AS no_left FROM left;
    SELECT COUNT(*) AS no_right FROM right;
    SELECT COUNT(*) AS no_inner FROM inner;
    SELECT COUNT(*) AS no_full FROM full;
RUN;

/* Exercise 4 */
PROC SQL;
    CREATE TABLE dmtools AS SELECT * FROM sashelp.dmtools;
    CREATE TABLE emtool AS SELECT * FROM sashelp.emtool;
RUN;

PROC SQL;
    SELECT COUNT(*) AS all_dmtools FROM sashelp.dmtools;
    SELECT COUNT(*) AS all_emtool FROM sashelp.emtool;
    SELECT COUNT(DISTINCT class) AS distinct_class_dmtools FROM sashelp.dmtools;
    SELECT COUNT(DISTINCT class) AS distinct_class_emtool FROM sashelp.emtool;
RUN;

/* Exercise 5 */
PROC SQL;
    CREATE TABLE class_all AS
		SELECT class FROM dmtools
		UNION ALL
		SELECT class FROM emtool;

    CREATE TABLE class_distinct AS
		SELECT DISTINCT class FROM dmtools
		UNION ALL
		SELECT DISTINCT class FROM emtool;

    SELECT COUNT(*) AS no_class_all FROM class_all;
    SELECT COUNT(*) AS no_class_distinct FROM class_distinct;
RUN;
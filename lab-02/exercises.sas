/* Exercise 1 */
proc sql;
	DESCRIBE TABLE sashelp.fish;
run;

/* Exercise 2 */
proc sql outobs = 10;
	SELECT * FROM sashelp.fish;
run;

/* Exercise 3 */
proc sql;
	SELECT Weight, Height FROM sashelp.fish
	WHERE Width >= 7 ORDER BY Height;
run;

/* Exercise 4 */
proc sql;
	SELECT * FROM sashelp.fish
	WHERE Weight BETWEEN 500 AND 600 ORDER BY Weight;
run;

/* Exercise 5 */
proc sql;
	SELECT * FROM sashelp.fish
	WHERE (Species = 'Whitefish' OR Species = 'Smelt')
	AND Weight > 500;
run;

/* Exercise 6 */
proc sql;
	SELECT * FROM sashelp.fish WHERE Weight IS NULL;
run;

/* Exercise 7 */
proc sql;
	SELECT Species, Weight,
	 round(Length1, .01) "Lenght1",
	 round(Length2, .01) "Length2",
	 round(Length3, .01) "Length2",
	 round(Height, .01) "Height",
	 round(Width, .01)
	 FROM sashelp.fish WHERE Weight IS NULL;
run;

/* Exercise 8 */
proc sql;
	SELECT Species, Weight, Length1 + Length2 + Length3 "Length sum"
	FROM sashelp.fish
	WHERE Length1 + Length2 + Length3 < 33;
run;

/* Exercise 9 */
proc sql;
	SELECT Species, round(Weight, 1) "Weight",
	round(Length1 + Length2 + Length3, 10) "Length sum" 
	FROM sashelp.fish
	WHERE Length1 + Length2 + Length3 < 33;
run;

/* Exercise 10 */
proc sql;
	CREATE TABLE Sequences (Sequence char(25));
		INSERT INTO Sequences VALUES ('A');
		INSERT INTO Sequences VALUES ('Aa');
		INSERT INTO Sequences VALUES ('a');
		INSERT INTO Sequences VALUES ('aa');
		INSERT INTO Sequences VALUES ('abc');
		INSERT INTO Sequences VALUES ('AaA');
		INSERT INTO Sequences VALUES ('b');
		INSERT INTO Sequences VALUES ('Z');
		INSERT INTO Sequences VALUES ('B');
		INSERT INTO Sequences VALUES ('Bb');
		INSERT INTO Sequences VALUES ('bB');
	SELECT * FROM Sequences ORDER BY Sequence;
run;
	SELECT * FROM Sequences
	WHERE Sequences BETWEEN 'A' AND 'B'
	OR Sequence BETWEEN 'a' AND 'b';
	
	SELECT * FROM Sequences
	WHERE Sequence LIKE 'A%'
	OR Sequence LIKE 'a%';
quit;

/* Exercise 11 */
proc sql;
	CREATE TABLE Studenci (
		Nr_albumu	NUM(6),
		Imie		VARCHAR(20),
		Nazwisko	VARCHAR(30),
		Ocena		NUM(2,1),
		Data		DATE
	);
run;

proc sql;
	INSERT INTO work.Studenci
		VALUES (123001, 'Adam', 'Sawicki', 3.5, '04May2007'd)
		VALUES (123002, 'Mikołaj', 'Lewandowski', 4, '03Jun2008'd)
		VALUES (123003, 'Aleksandra', 'Kaźmierczak', 4.5, '02May2009'd);
run;

proc sql;
	SELECT * FROM Studenci;
run;

/* Exercise 12 */
proc sql;
	SELECT * FROM Studenci WHERE month(Data) = 5;
run;

/* Exercise 13 */
proc sql;
	CREATE TABLE Rybki AS
	SELECT * FROM sashelp.fish WHERE Weight IS NULL;
	SELECT * FROM Rybki;
run;

/* Exercise 14 */
proc sql;
	CREATE TABLE Ryby LIKE sashelp.fish;
	DESCRIBE TABLE Ryby;
run;

/* Exercise 15 */
proc sql;
	CREATE TABLE Ryby (drop = Length2 Length3) 
	LIKE sashelp.fish;
	DESCRIBE TABLE ryby;
run;

/* Exercise 16 */
proc sql;
	CREATE TABLE Ryby (keep = Species Weight Length1 Height) 
	LIKE sashelp.fish;
	DESCRIBE TABLE Ryby;
run;

/* Exercise 17 */
proc sql;
	CREATE TABLE Retail AS SELECT * FROM sashelp.retail;
	SELECT r.*, 
	(CASE 
		WHEN r.month = 1 AND r.day BETWEEN 1 AND 31 THEN 1 
		ELSE 0 
	END) AS Quarter_todo,
	qtr(Date) AS Quarter_check
	FROM Retail r;
quit;
/* Task 21 */
PROC SQL;
    CREATE TABLE Work.Studenci (
        Indeks		INT LABEL = 'Numer Indeksu',
        Nazwisko	CHAR(50),
        Imie		CHAR(50),
        Ocena		NUMERIC,
        Data_zal	DATE LABEL = 'Data zaliczenia'
    );
RUN;

/* Task 22 */
PROC SQL;
    INSERT INTO Work.Studenci (Indeks, Nazwisko, Imie, Ocena, Data_zal)
    VALUES (100000, 'Kowalski',		'Jan',		4.5, '01JAN2024'D)
    VALUES (100001, 'Nowak',		'Anna',		5.0, '02JAN2024'D)
    VALUES (100002, 'Wiśniewski',	'Piotr',	3.0, '03JAN2024'D)
    VALUES (100003, 'Dąbrowska',	'Ewa',		4.0, '04JAN2024'D)
    VALUES (100004, 'Lewandowski',	'Tomasz',	3.5, '05JAN2024'D);
RUN;

/* Task 23 */
PROC SQL;
    INSERT INTO Work.Studenci (Indeks, Nazwisko, Imie)
    VALUES (100005, 'Mazur',		'Karolina')
    VALUES (100006, 'Zieliński',	'Marek');
RUN;

/* Task 24 */
PROC SQL;
    INSERT INTO Work.Studenci (Indeks, Nazwisko, Imie, Ocena, Data_zal)
    VALUES ('ABC', 'Kowal', 'Janek', 'TrzyPlus', '32FEB2024'D);
RUN;

/* Task 25 */
PROC SQL;
    SELECT Imie, Nazwisko
    FROM Work.Studenci
    WHERE Ocena >= 4
    ORDER BY Nazwisko;
RUN;
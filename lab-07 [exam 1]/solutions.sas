/* Zadanie 1 */
PROC SQL;
	CREATE TABLE Klienci (
		Id_Klienta NUM(4) PRIMARY KEY,
		Imie CHAR(15) NOT NULL,
		Nazwisko CHAR(20) NOT NULL,
		Data_Urodzenia DATE FORMAT = DATE9.,
		Miasto CHAR(20)
	);
	
	ALTER TABLE Klienci
    MODIFY ID_Klienta LABEL='Kod Klienta';
RUN;

/* Zadanie 2 */
PROC SQL;
    INSERT INTO Klienci (Id_Klienta, Imie, Nazwisko, Data_Urodzenia, Miasto)
    VALUES (1, 'Anna', 'Nowak', '15MAR1990'D, 'Warszawa')
    VALUES (2, 'Jan', 'Kowalski', '10OCT1993'D, 'Wrocław')
    VALUES (3, 'Piotr', 'Wiśniewski', '07JAN2000'D, 'Warszawa')
    VALUES (4, 'Maria', 'Dąbrowska', '23FEB1998'D, 'Kraków');
RUN;

/* Zadanie 3 */
PROC SQL;
    ALTER TABLE Klienci
    ADD Wiek NUM;
RUN;

PROC SQL;
    UPDATE Klienci
    SET Wiek = CASE 
        WHEN Id_Klienta = 1 THEN 35
        WHEN Id_Klienta = 2 THEN 31
        WHEN Id_Klienta = 3 THEN 25
        WHEN Id_Klienta = 4 THEN 27
    END;
RUN;

/* Zadanie 4 */
PROC SQL;
	SELECT * FROM Klienci
	WHERE Wiek BETWEEN 30 AND 40
	ORDER BY Wiek DESC;
RUN;

/* Zadanie 5 */
PROC SQL;
	SELECT Imie 'Imię', Nazwisko, Miasto 'Miasto zamieszkania' FROM Klienci
	WHERE (Miasto = 'Warszawa' OR Miasto = 'Kraków');
RUN;

/* Zadanie 6 */
PROC SQL;
    CREATE TABLE DorosliKlienci AS
    SELECT * FROM Klienci
    WHERE Wiek >= 18;
RUN;

/* Zadanie 7 */
PROC SQL;
	SELECT * FROM DorosliKlienci
	WHERE MONTH(Data_Urodzenia) IN (3, 4);
RUN;

/* Zadanie 8 */
PROC SQL;
	CREATE TABLE Zamowienia (
		Id_Zamowienia NUM PRIMARY KEY,
		Id_Klienta NUM,
		Kwota DECIMAl,
		Data_Zamowienia DATE FORMAT = DATE9.
	);
RUN;

PROC SQL;
    INSERT INTO Zamowienia (Id_Zamowienia, Id_Klienta, Kwota, Data_Zamowienia)
    VALUES (10, 2, 1000.00, '04FEB2025'D)
    VALUES (20, 1, 750.00, '15MAR2025'D)
    VALUES (30, 4, 298.00, '24MAR2025'D)
    VALUES (40, 3, 1600.00, '05APR2025'D)
    VALUES (50, 2, 200.00, '10APR2025'D);
RUN;

/* Zadanie 9 */
PROC SQL;
	SELECT * FROM Zamowienia
	WHERE (Kwota > 500 AND TODAY() - Data_Zamowienia <= 60);
RUN;

/* Zadanie 10 */
PROC SQL;
	SELECT Miasto, AVG(Wiek) 'Średni wiek' FROM Klienci
	GROUP BY Miasto;
RUN;

/* Zadanie 11 */
PROC SQL;
	SELECT Id_Klienta, SUM(Kwota) 'Suma zamówień', COUNT(*) 'Liczba zamówień' FROM Zamowienia
	GROUP BY Id_Klienta
	HAVING SUM(Kwota) > 1000;
RUN;

/* Zadanie 12 */
PROC SQL;
    CREATE TABLE Kody (
        Litera VARCHAR(1) PRIMARY KEY,
        Wartosc NUM
    );

    CREATE TABLE Dodatki (
        Litera2 VARCHAR(1) PRIMARY KEY,
        Wartosc NUM
    );

    INSERT INTO Kody VALUES ('A', 1);
    INSERT INTO Kody VALUES ('B', 2);
    INSERT INTO Kody VALUES ('C', 1);

    INSERT INTO Dodatki VALUES ('X', 3);
    INSERT INTO Dodatki VALUES ('Y', 1);
    INSERT INTO Dodatki VALUES ('Z', 2);
RUN;

PROC SQL;
    SELECT * FROM Kody FULL JOIN Dodatki
    ON Kody.Wartosc = Dodatki.Wartosc;
RUN;

PROC SQL;
    SELECT * FROM Kody LEFT JOIN Dodatki
    ON Kody.Wartosc = Dodatki.Wartosc;
RUN;

/* Zadanie 13 */
PROC SQL;
	CREATE TABLE ListaMiast AS
	SELECT Id_Klienta, Miasto FROM Klienci
	WHERE Miasto LIKE 'W%';
RUN;

/* Zadanie 14 */
PROC SQL;
	SELECT Id_Klienta, SUM(Kwota) 'Suma kwot', AVG(Kwota) 'Średnia kwota' FROM Zamowienia
	GROUP BY Id_Klienta
	HAVING AVG(Kwota) > 300;
RUN;

/* Zadanie 15 */
PROC SQL;
    SELECT Miasto, Zamowienia.Id_Klienta, SUM(Kwota) 'Łączna kwota zamówień' FROM Zamowienia LEFT JOIN Klienci
    ON Zamowienia.Id_Klienta = Klienci.Id_Klienta
    GROUP BY Miasto, Zamowienia.Id_Klienta
    HAVING SUM(Kwota) > 700;
RUN;

/* Zadanie 16 */
PROC SQL;
	SELECT DISTINCT Imie FROM Klienci
	UNION ALL
	SELECT DISTINCT Litera2 FROM Dodatki;
RUN;

/* Zadanie 17 */
PROC SQL;
	SELECT DISTINCT Imie FROM Klienci
	INTERSECT ALL
	SELECT DISTINCT Litera2 FROM Dodatki;
RUN;




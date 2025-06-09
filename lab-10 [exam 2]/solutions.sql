-- Zadanie 1
CREATE TABLE pojazdy (
	id_pojazdu NUMBER(3) PRIMARY KEY,
    marka VARCHAR2(50),
    model VARCHAR2(50),
    typ VARCHAR2(50),
    rok_produkcji NUMBER(4)
);

CREATE TABLE klienci (
	id_klienta NUMBER(3) PRIMARY KEY,
    imie VARCHAR2(50),
    nazwisko VARCHAR2(50),
    data_rejestracji DATE
);

CREATE TABLE naprawy (
	id_naprawy NUMBER(5),
    id_pojazdu NUMBER(3),
    id_klienta NUMBER(3),
    koszt NUMBER(10),
    data_naprawy DATE,
    CONSTRAINT naprawy_pojazdy_fk 
		FOREIGN KEY (id_pojazdu) REFERENCES pojazdy (id_pojazdu) ON DELETE SET NULL,
    CONSTRAINT naprawy_klienci_fk 
        FOREIGN KEY (id_klienta) REFERENCES klienci (id_klienta) ON DELETE SET NULL
);

-- Zadanie 2
INSERT ALL
    INTO pojazdy VALUES (100, 'Toyota', 'Corolla', 'Kombi', 2005)
    INTO pojazdy VALUES (101, 'Volkswagen', 'Golf', 'Hatchback', 2009)
    INTO pojazdy VALUES (102, 'Mercedes', 'W123', 'Sedan', 1985)
SELECT * FROM dual;

INSERT ALL
    INTO klienci VALUES (100, 'Jan', 'Kowalski', TO_DATE('28-10-2021', 'DD-MM-YYYY'))
    INTO klienci VALUES (101, 'Maria', 'Nowacka', TO_DATE('04-06-2023', 'DD-MM-YYYY'))
    INTO klienci VALUES (102, 'Piotr', 'Wiśniecki', TO_DATE('21-05-2025', 'DD-MM-YYYY'))
SELECT * FROM dual;

INSERT ALL
    INTO naprawy VALUES (10000, 100, 100, 6000, TO_DATE('05-05-2024', 'DD-MM-YYYY'))
    INTO naprawy VALUES (10001, 101, 101, 4000, TO_DATE('17-05-2025', 'DD-MM-YYYY'))
    INTO naprawy VALUES (10002, 102, 102, 12000, TO_DATE('24-05-2025', 'DD-MM-YYYY'))
	INTO naprawy VALUES (10003, 102, 102, 500, TO_DATE('01-06-2025', 'DD-MM-YYYY'))
SELECT * FROM dual;

-- Zadanie 3
SELECT
	p.marka,
	p.model,
	k.imie,
	k.nazwisko,
	n.data_naprawy,
	n.koszt
FROM
	naprawy n
	JOIN pojazdy p ON n.id_pojazdu = p.id_pojazdu
	JOIN klienci k ON n.id_klienta = k.id_klienta;

-- Zadanie 4
DELETE FROM klienci WHERE id_klienta = 101;

SELECT * FROM naprawy;
-- Po usunięciu klienta o id_klienta = 101, w tabeli naprawy kolumna id_klienta dla powiązanych napraw została ustawiona na NULL (ze względu na ON DELETE SET NULL w definicji klucza obcego).

-- Zadanie 5
CREATE OR REPLACE VIEW naprawy_widok AS
SELECT * FROM naprawy
WHERE koszt > 1000;

CREATE OR REPLACE VIEW naprawy_widok_spr AS
SELECT * FROM naprawy
WHERE koszt > 1000
WITH CHECK OPTION CONSTRAINT naprawy_widok_ck;

INSERT INTO naprawy_widok VALUES (10004, 101, 101, 3000, TO_DATE('01-06-2025', 'DD-MM-YYYY'));
INSERT INTO naprawy_widok VALUES (10005, 102, 102, 100, TO_DATE('03-06-2025', 'DD-MM-YYYY')); -- nie spełnia warunku

-- Dodanie obu recordów się udało ponieważ perspektywa `naprawy_widok` 
-- nie zawiera opcji `with check`

INSERT INTO naprawy_widok_spr VALUES (10006, 100, 100, 350, TO_DATE('04-06-2025', 'DD-MM-YYYY')); -- nie spełnia warunku
INSERT INTO naprawy_widok_spr VALUES (10007, 101, 101, 4000, TO_DATE('07-06-2025', 'DD-MM-YYYY'));

-- Dodanie pierwszego recordu się nie udało ponieważ naprawa
-- nie spełnia warunku `koszt > 1000`

SELECT * FROM naprawy_widok;
SELECT * FROM naprawy_widok_spr;
SELECT * FROM naprawy;

-- Zadanie 6
SELECT
	k.imie,
	k.nazwisko,
	COUNT(*) AS liczba_napraw
FROM
	naprawy n
	JOIN klienci k ON n.id_klienta = k.id_klienta
GROUP BY
	k.imie,
	k.nazwisko
HAVING
	COUNT(*) > 1;

-- Zadanie 7
SELECT
	p.marka,
	p.model,
	k.imie,
	k.nazwisko,
	n.data_naprawy,
	n.koszt
FROM
	naprawy n
	JOIN pojazdy p ON n.id_pojazdu = p.id_pojazdu
	JOIN klienci k ON n.id_klienta = k.id_klienta
WHERE
	p.marka = 'Toyota'
	AND EXTRACT(YEAR FROM n.data_naprawy) = 2024;

SELECT
	SUM(n.koszt) AS laczny_koszt
FROM
	naprawy n
	JOIN pojazdy p ON n.id_pojazdu = p.id_pojazdu
WHERE
	p.marka = 'Toyota'
	AND EXTRACT(YEAR FROM n.data_naprawy) = 2024;
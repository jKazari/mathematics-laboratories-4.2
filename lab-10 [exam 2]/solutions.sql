-- Zadanie 1
CREATE TABLE ksiazki (
    id_ksiazki           NUMBER(3) PRIMARY KEY,
    tytul                VARCHAR2(50),
    autor                VARCHAR2(50),
    liczba_egzemplarzy   NUMBER(3)
);

CREATE TABLE czytelnicy (
    id_czytelnika   NUMBER(3) PRIMARY KEY,
    imie            VARCHAR2(50),
    nazwisko        VARCHAR2(50),
    data_zapisu     DATE
);

CREATE TABLE wypozyczenia (
    id_wypozyczenia     NUMBER(3) PRIMARY KEY,
    id_ksiazki          NUMBER(3),
    id_czytelnika       NUMBER(3),
    data_wypozyczenia   DATE,
    CONSTRAINT wypozyczenia_ksiazki_fk 
        FOREIGN KEY (id_ksiazki) REFERENCES ksiazki (id_ksiazki) ON DELETE SET NULL,
    CONSTRAINT wypozyczenia_czytelnicy_fk 
        FOREIGN KEY (id_czytelnika) REFERENCES czytelnicy (id_czytelnika) ON DELETE SET NULL
);


-- Zadanie 2
INSERT ALL
    INTO ksiazki VALUES (100, 'Opowieść 1', 'XY ZZ', 10)
    INTO ksiazki VALUES (101, 'Opowieść 2', 'YY ZY', 7)
    INTO ksiazki VALUES (102, 'Opowieść 3', 'YZY XZY', 30)
SELECT * FROM dual;

INSERT ALL
    INTO czytelnicy VALUES (200, 'Jan', 'Kowalski', TO_DATE('05-05-2024', 'DD-MM-YYYY'))
    INTO czytelnicy VALUES (201, 'Piotr', 'Adamczyk', TO_DATE('06-05-2024', 'DD-MM-YYYY'))
    INTO czytelnicy VALUES (202, 'Tomasz', 'Rozenek', TO_DATE('07-05-2024', 'DD-MM-YYYY'))
SELECT * FROM dual;

INSERT ALL
    INTO wypozyczenia VALUES (300, 100, 200, TO_DATE('15-05-2024', 'DD-MM-YYYY'))
    INTO wypozyczenia VALUES (301, 100, 201, TO_DATE('17-05-2024', 'DD-MM-YYYY'))
    INTO wypozyczenia VALUES (302, 101, 200, TO_DATE('23-05-2024', 'DD-MM-YYYY'))
SELECT * FROM dual;


-- Zadanie 3
SELECT k.tytul, COUNT(w.id_wypozyczenia) AS liczba_wypozyczen
FROM ksiazki k
JOIN wypozyczenia w ON k.id_ksiazki = w.id_ksiazki
GROUP BY k.tytul
HAVING COUNT(w.id_wypozyczenia) >= 2;


-- Zadanie 4
SELECT autor, COUNT(*) AS liczba_ksiazek
FROM ksiazki
GROUP BY autor
ORDER BY liczba_ksiazek DESC;


-- Zadanie 5
CREATE OR REPLACE VIEW ksiazki_popularne AS
SELECT * FROM ksiazki
WHERE liczba_egzemplarzy > 2;

CREATE OR REPLACE VIEW ksiazki_popularne_spr AS
SELECT * FROM ksiazki
WHERE liczba_egzemplarzy > 2
WITH CHECK OPTION CONSTRAINT ksiazki_popularne_ck;

INSERT INTO ksiazki_popularne VALUES (10, 'Cień Wiatru', 'Zafón', 5);
INSERT INTO ksiazki_popularne VALUES (11, 'Bezsenność', 'King', 1);       -- za mało egzemplarzy
INSERT INTO ksiazki_popularne VALUES (12, 'Rok 1984', 'Orwell', 4);
INSERT INTO ksiazki_popularne VALUES (13, 'Opowieść podręcznej', 'Atwood', 1); -- za mało egzemplarzy

INSERT INTO ksiazki_popularne_spr VALUES (14, 'YTY', 'YZYT', 6);
INSERT INTO ksiazki_popularne_spr VALUES (15, 'XYZ', 'YTXX', 1); -- nie spełnia warunku widoku

SELECT * FROM ksiazki;
SELECT * FROM ksiazki_popularne;
SELECT * FROM ksiazki_popularne_spr;


-- Zadanie 6
CREATE OR REPLACE VIEW aktywni_czytelnicy AS
SELECT 
    r.imie, 
    r.nazwisko, 
    COUNT(w.id_wypozyczenia) AS liczba_wypozyczen
FROM czytelnicy r
JOIN wypozyczenia w ON r.id_czytelnika = w.id_czytelnika
GROUP BY r.imie, r.nazwisko
HAVING COUNT(w.id_wypozyczenia) > 3;

SELECT * FROM aktywni_czytelnicy;


-- Zadanie 7
CREATE OR REPLACE VIEW wypozyczenia_czytelnikow AS
SELECT 
    r.imie, 
    r.nazwisko, 
    k.tytul, 
    w.data_wypozyczenia AS wypozyczone_ksiazki
FROM czytelnicy r
JOIN wypozyczenia w ON r.id_czytelnika = w.id_czytelnika
JOIN ksiazki k ON w.id_ksiazki = k.id_ksiazki;

SELECT tytul 
FROM wypozyczenia_czytelnikow
WHERE imie = 'Jan' 
  AND nazwisko = 'Kowalski' 
  AND EXTRACT(YEAR FROM wypozyczone_ksiazki) = 2024;

SELECT COUNT(*) 
FROM wypozyczenia
WHERE EXTRACT(YEAR FROM data_wypozyczenia) = 2025;

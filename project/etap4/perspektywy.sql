CREATE OR REPLACE VIEW VIEW_AKTYWNI_CZLONKOWIE_STARTUPU AS
SELECT 
    cs.czlonek_id,
    s.imie,
    s.nazwisko,
    s.email,
    cs.rola,
    st.nazwa AS nazwa_startupu
FROM CZLONKOWIE_STARTUPU cs
JOIN STUDENCI s ON cs.student_id = s.student_id
JOIN STARTUPY st ON cs.startup_id = st.startup_id
WHERE cs.rola IS NOT NULL;

CREATE OR REPLACE VIEW VIEW_STARTUPY_FINANSOWANIE_SUMY AS
SELECT 
    s.startup_id,
    s.nazwa,
    SUM(f.kwota) AS laczna_kwota_finansowania
FROM STARTUPY s
LEFT JOIN FINANSOWANIE f ON s.startup_id = f.startup_id
GROUP BY s.startup_id, s.nazwa;

CREATE OR REPLACE VIEW VIEW_MENTORING_INFO AS
SELECT 
    m.mentoring_id,
    s.nazwa AS startup,
    me.imie || ' ' || me.nazwisko AS mentor,
    me.specjalizacja,
    m.data_rozpoczecia
FROM MENTORING m
JOIN STARTUPY s ON m.startup_id = s.startup_id
JOIN MENTORZY me ON m.mentor_id = me.mentor_id;

CREATE OR REPLACE VIEW VIEW_COWORKING_REZERWACJE AS
SELECT 
    c.coworking_id,
    s.nazwa AS startup,
    c.nr_sali,
    c.data_rezerwacji
FROM COWORKING c
JOIN STARTUPY s ON c.startup_id = s.startup_id;

CREATE OR REPLACE VIEW VIEW_UCZESTNICY_WYDARZEN AS
SELECT 
    uw.uczestnik_id,
    s.imie,
    s.nazwisko,
    w.nazwa AS wydarzenie,
    w.data
FROM UCZESTNICY_WYDARZEN uw
JOIN STUDENCI s ON uw.student_id = s.student_id
JOIN WYDARZENIA w ON uw.wydarzenie_id = w.wydarzenie_id;

CREATE OR REPLACE VIEW VIEW_STUDENCI_BEZ_STARTUPU AS
SELECT 
    s.student_id,
    s.imie,
    s.nazwisko,
    s.email
FROM STUDENCI s
WHERE NOT EXISTS (
    SELECT 1 
    FROM CZLONKOWIE_STARTUPU cs 
    WHERE cs.student_id = s.student_id
);

CREATE OR REPLACE VIEW VIEW_LICZBA_WYDARZEN_NA_MIESIAC AS
SELECT 
    TO_CHAR(data, 'YYYY-MM') AS miesiac,
    COUNT(*) AS liczba_wydarzen
FROM WYDARZENIA
GROUP BY TO_CHAR(data, 'YYYY-MM');

CREATE OR REPLACE VIEW VIEW_STARTUPY_BEZ_MENTORA AS
SELECT 
    s.startup_id,
    s.nazwa
FROM STARTUPY s
WHERE NOT EXISTS (
    SELECT 1 
    FROM MENTORING m 
    WHERE m.startup_id = s.startup_id
);
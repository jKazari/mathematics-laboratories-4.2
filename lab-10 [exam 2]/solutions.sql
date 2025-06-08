drop table ksiazki cascade constraints;

drop table czytelnicy cascade constraints;

drop table wypozyczenia cascade constraints;

/* Zad 1 */
create table ksiazki(
    id_ksiazki NUMBER(3) primary key,
    tytul VARCHAR2(50),
    autor VARCHAR2(50),
    liczba_egzemplarzy NUMBER(3)
);

create table czytelnicy(
    id_czytelnika NUMBER(3) primary key,
    imie VARCHAR2(50),
    nazwisko VARCHAR2(50),
    data_zapisu DATE
);

create table wypozyczenia(
    id_wypozyczenia NUMBER(3) primary key,
    id_ksiazki NUMBER(3),
    id_czytelnika NUMBER(3),
    data_wypozyczenia DATE,
    constraint wypozyczenia_ksiazki_fk foreign key (id_ksiazki)
        references ksiazki (id_ksiazki) on delete set null,
    constraint wypozyczenia_czytelnicy_fk foreign key (id_czytelnika)
        references czytelnicy (id_czytelnika) on delete set null
);


/* Zad 2 */
insert all
    into ksiazki values(100, 'Opowieść 1', 'XY ZZ', 10)
    into ksiazki values(101, 'Opowieść 2', 'YY ZY', 7)
    into ksiazki values(102, 'Opowieść 3', 'YZY XZY', 30)
select * from dual;


insert all
    into czytelnicy values(200, 'Jan', 'Kowalski', to_date('05-05-2024', 'DD-MM-YYYY'))
    into czytelnicy values(201, 'Piotr', 'Adamczyk', to_date('06-05-2024', 'DD-MM-YYYY'))
    into czytelnicy values(202, 'Tomasz', 'Rozenek', to_date('07-05-2024', 'DD-MM-YYYY'))
select * from dual;


insert all
    into wypozyczenia values(300, 100, 200, to_date('15-05-2024', 'DD-MM-YYYY'))
    into wypozyczenia values(301, 100, 201, to_date('17-05-2024', 'DD-MM-YYYY'))
    into wypozyczenia values(302, 101, 200, to_date('23-05-2024', 'DD-MM-YYYY'))
select * from dual;


/* Zad 3 */
select k.tytul, count(w.id_wypozyczenia) as liczba_wypozyczen
from ksiazki k
join wypozyczenia w on k.id_ksiazki = w.id_ksiazki
group by k.tytul
having count(w.id_wypozyczenia) >= 2;

/* Zad 4 */
select autor, count() as liczba_ksiazek
from ksiazki
group by autor
order by liczba_ksiazek desc;

/* Zad 5 */
create or replace view ksiazki_popularne as
select * from ksiazki
where liczba_egzemplarzy > 2;


create or replace view ksiazki_popularne_spr as
select * from ksiazki
where liczba_egzemplarzy > 2
with check option constraint ksiazki_popularne_ck;

-- insert all nie działa z jakiegoś powodu
insert into ksiazki_popularne values (10, 'Cień Wiatru', 'Zafón', 5);
insert into ksiazki_popularne values (11, 'Bezsenność', 'King', 1);
insert into ksiazki_popularne values (12, 'Rok 1984', 'Orwell', 4);
insert into ksiazki_popularne values (13, 'Opowieść podręcznej', 'Atwood', 1);


insert into ksiazki_popularne_spr values (14, 'YTY', 'YZYT', 6);
insert into ksiazki_popularne_spr values (15, 'XYZ', 'YTXX', 1); -- nie spełnia warunku widoku


select * from ksiazki;
select * from ksiazki_popularne;
select * from ksiazki_popularne_spr;


/* Zad 6 */
create or replace view aktywni_czytelnicy as
select r.imie, r.nazwisko, count(w.id_wypozyczenia) as liczba_wypozyczen
from czytelnicy r
join wypozyczenia w on r.id_czytelnika = w.id_czytelnika
group by r.imie, r.nazwisko
having count(w.id_wypozyczenia) > 3;


select * from aktywni_czytelnicy;

/* Zad 7 */
create or replace view wypozyczenia_czytelnikow as
select r.imie, r.nazwisko, k.tytul, w.data_wypozyczenia as wypozyczone_ksiazki
from czytelnicy r
join wypozyczenia w on r.id_czytelnika = w.id_czytelnika
join ksiazki k on w.id_ksiazki = k.id_ksiazki;

select tytul from wypozyczenia_czytelnikow
where imie = 'Jan' and nazwisko = 'Kowalski' and year(data_wypozyczenia) = 2024;

select count(w.data_wypozyczenia) from wypozyczenia czytelnikow
where year(data_wypozyczenia) = 2025;
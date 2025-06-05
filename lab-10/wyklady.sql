CREATE TABLE studenci (indeks NUMBER(6) PRIMARY KEY, 
                       imie_stud VARCHAR2(20) NOT NULL,
                       nazwisko_stud VARCHAR2(30) NOT NULL,
                       dlug_stud NUMBER(3) DEFAULT 0);
CREATE TABLE wyklady (id_wykladu NUMBER(3) PRIMARY KEY,
                      nazwa_wykladu VARCHAR2(30) NOT NULL,
                      ects NUMBER(3) NOT NULL);
CREATE TABLE zajecia (id_wykladu NUMBER(3) NOT NULL REFERENCES wyklady,
                      indeks NUMBER(6) NOT NULL REFERENCES studenci,
                      semestr NUMBER(2) NOT NULL,
                      PRIMARY KEY(id_wykladu,indeks));

INSERT INTO studenci VALUES(10000,'Kubuœ','Puchatek',0);
INSERT INTO studenci VALUES(10001,'Sowa','Przem¹drza³a',0);
INSERT INTO studenci VALUES(10002,'Osio³','K³apouchy',2);
INSERT INTO studenci VALUES(10003,'Mama','Kangurzyca',3);
INSERT INTO studenci VALUES(10004,'Tygrys','Brykaj¹cy',1);
INSERT INTO studenci VALUES(10005,'Franklin','¯ó³w',0);

INSERT INTO wyklady VALUES(1,'Botanika',4);
INSERT INTO wyklady VALUES(2,'Warzywnictwo',5);
INSERT INTO wyklady VALUES(3,'Fizyka atomowa',3);
INSERT INTO wyklady VALUES(4,'Bazy danych',4);
INSERT INTO wyklady VALUES(5,'Biologia molekularna',6);
INSERT INTO wyklady VALUES(6,'Biomatematyka',6);

INSERT INTO zajecia VALUES(1,10000,1);
INSERT INTO zajecia VALUES(2,10000,1);
INSERT INTO zajecia VALUES(4,10000,1);
INSERT INTO zajecia VALUES(5,10000,1);
INSERT INTO zajecia VALUES(6,10000,2);
INSERT INTO zajecia VALUES(1,10001,3);
INSERT INTO zajecia VALUES(3,10001,1);
INSERT INTO zajecia VALUES(5,10001,1);
INSERT INTO zajecia VALUES(6,10001,2);
INSERT INTO zajecia VALUES(2,10002,1);
INSERT INTO zajecia VALUES(3,10002,1);
INSERT INTO zajecia VALUES(4,10002,2);
INSERT INTO zajecia VALUES(6,10002,2);
INSERT INTO zajecia VALUES(6,10003,2);
INSERT INTO zajecia VALUES(3,10003,3);
INSERT INTO zajecia VALUES(2,10003,2);
INSERT INTO zajecia VALUES(2,10004,2);
INSERT INTO zajecia VALUES(1,10004,3);
INSERT INTO zajecia VALUES(6,10004,1);
INSERT INTO zajecia VALUES(3,10004,2);
INSERT INTO zajecia VALUES(5,10005,1);
INSERT INTO zajecia VALUES(3,10005,2);
INSERT INTO zajecia VALUES(4,10005,2);
INSERT INTO zajecia VALUES(6,10005,3);
INSERT INTO zajecia VALUES(1,10005,1);
CREATE TABLE rola(
    id      INTEGER NOT NULL PRIMARY KEY, 
	nazwa   VARCHAR2(50) NOT NULL UNIQUE
);
INSERT INTO rola VALUES(1, 'Admin');
INSERT INTO rola VALUES(2, 'User');
/
CREATE TABLE konto(
    id      INTEGER NOT NULL PRIMARY KEY,
    login   VARCHAR2(50) NOT NULL UNIQUE,
    haslo   VARCHAR2(100) NOT NULL,
    rola_id INTEGER NOT NULL
);
-- Ze wzgledow dydaktycznych hasla przechowujemy jawnie. Jak powinny byc przechowywane hasla?
INSERT INTO konto VALUES(1, 'admin', 'haslotrudne',1);
INSERT INTO konto VALUES(2, 'user1', 'haslo',2);
INSERT INTO konto VALUES(3, 'user2', 'abc',2);
INSERT INTO konto VALUES(4, 'user3', '1234',2);
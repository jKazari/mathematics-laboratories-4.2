CREATE SEQUENCE startupy_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_startupy_bi
BEFORE INSERT ON startupy
FOR EACH ROW
BEGIN
  :NEW.startup_id := startupy_seq.NEXTVAL;
END;
/ 



CREATE SEQUENCE finansowanie_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_finansowanie_bi
BEFORE INSERT ON finansowanie
FOR EACH ROW
BEGIN
  :NEW.finansowanie_id := finansowanie_seq.NEXTVAL;
END;
/



CREATE SEQUENCE coworking_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_coworking_bi
BEFORE INSERT ON coworking
FOR EACH ROW
BEGIN
  :NEW.coworking_id := coworking_seq.NEXTVAL;
END;
/



CREATE SEQUENCE mentorzy_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_mentorzy_bi
BEFORE INSERT ON mentorzy
FOR EACH ROW
BEGIN
  :NEW.mentor_id := mentorzy_seq.NEXTVAL;
END;
/



CREATE SEQUENCE mentoring_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_mentoring_bi
BEFORE INSERT ON mentoring
FOR EACH ROW
BEGIN
  :NEW.mentoring_id := mentoring_seq.NEXTVAL;
END;
/



CREATE SEQUENCE czlonkowie_startupu_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_czlonkowie_startupu_bi
BEFORE INSERT ON czlonkowie_startupu
FOR EACH ROW
BEGIN
  :NEW.czlonek_id := czlonkowie_startupu_seq.NEXTVAL;
END;
/



CREATE SEQUENCE studenci_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_studenci_bi
BEFORE INSERT ON studenci
FOR EACH ROW
BEGIN
  :NEW.student_id := studenci_seq.NEXTVAL;
END;
/



CREATE SEQUENCE uczestnicy_wydarzen_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_uczestnicy_wydarzen_bi
BEFORE INSERT ON uczestnicy_wydarzen
FOR EACH ROW
BEGIN
  :NEW.uczestnik_id := uczestnicy_wydarzen_seq.NEXTVAL;
END;
/


CREATE SEQUENCE wydarzenia_seq 
  START WITH 11  
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_wydarzenia_bi
BEFORE INSERT ON wydarzenia
FOR EACH ROW
BEGIN
  :NEW.wydarzenie_id := wydarzenia_seq.NEXTVAL;
END;
/


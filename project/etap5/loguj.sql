CREATE OR REPLACE FUNCTION loguj (p_username IN VARCHAR2, p_password in VARCHAR2)
RETURN BOOLEAN
AS
    tmp VARCHAR(1);
BEGIN 
    SELECT 1 INTO tmp
        FROM konto
        WHERE UPPER(login) = UPPER(p_username) AND haslo = p_password;
    RETURN TRUE;
    EXCEPTION
    WHEN NO_DATA_FOUND
    THEN   
            RETURN FALSE;
END loguj;
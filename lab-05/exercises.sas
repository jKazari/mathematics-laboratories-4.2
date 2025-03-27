/* Exercise 1 */
PROC SQL;
    SELECT AVG(Height) AS avg_height, 
           AVG(Weight) AS average_weight
    FROM sashelp.heart;
RUN;

/* Exercise 2 */
PROC SQL;
    SELECT Sex, 
           AVG(Height) AS avg_height, 
           AVG(Weight) AS avg_weight
    FROM sashelp.heart
    GROUP BY Sex;
RUN;

/* Exercise 3 */
PROC SQL;
    SELECT Status, 
           MAX(Cholesterol) AS max_cholesterol,
           MIN(AgeAtStart) AS min_age_at_disease_onset
    FROM sashelp.heart
    GROUP BY Status;
RUN;

/* Exercise 4 */
PROC SQL;
    SELECT AVG(Cholesterol) AS avg_cholesterol, 
           MIN(Cholesterol) AS min_cholesterol,
           MAX(Cholesterol) AS max_cholesterol, 
           DeathCause AS cause_of_death
    FROM sashelp.heart
    GROUP BY cause_of_death;
RUN;

/* Exercise 5 */
DATA work.cars;
    SET sashelp.cars;
RUN;

PROC SQL;
    SELECT Origin, 
           Make,
           SUM(EngineSize) AS sum_engine_size,
           SUM(Cylinders) AS sum_cylinders
    FROM work.cars
    GROUP BY Origin, Make
    ORDER BY Origin, sum_cylinders;
RUN;

/* Exercise 6 */
PROC SQL OUTOBS=10;
    SELECT Origin, 
           Type,
           SUM(EngineSize) AS sum_engine_size,
           SUM(Cylinders) AS sum_cylinders
    FROM work.cars
    GROUP BY Origin, Type
    HAVING sum_cylinders > 100
    ORDER BY Origin, sum_cylinders;
RUN;

/* Exercise 7 */
PROC SQL;
    CREATE TABLE stocks AS
    SELECT * FROM sashelp.stocks;
    
    CREATE TABLE snacks AS
    SELECT * FROM sashelp.snacks;
RUN;

PROC SQL;
    SELECT COUNT(*) FROM stocks;
    SELECT COUNT(*) FROM snacks;
QUIT;

/* Task 9 */
PROC CONTENTS DATA = sashelp.heart;
RUN;

/* Task 10 */
PROC SQL;
    SELECT Status, Sex, Systolic, Diastolic
    FROM sashelp.heart
    WHERE Cholesterol >= 300
    ORDER BY Systolic DESC, Diastolic DESC;
RUN;

/* Task 11 */
PROC SQL;
    SELECT Cholesterol, Smoking
    FROM sashelp.heart
    WHERE Status = 'Alive' AND Sex = 'Male' AND Systolic > 135
    ORDER BY Cholesterol;
RUN;

/* Task 12 */
PROC SQL;
    SELECT Sex, AgeCHDdiag, AgeAtDeath
    FROM sashelp.heart
    WHERE Status = 'Dead';
RUN;

/* Task 13 */
PROC SQL;
    SELECT Sex, (AgeAtDeath - AgeCHDdiag) AS Years_Lived_After_Diagnosis
    FROM sashelp.heart
    WHERE Status = 'Dead';
RUN;

/* Task 14 */
PROC SQL;
    SELECT DISTINCT DeathCause
    FROM sashelp.heart;
RUN;

/* Task 15 */
PROC SQL;
    SELECT * FROM sashelp.heart
    WHERE NOT MISSING(AgeCHDdiag);
RUN;

/* Task 16 */
PROC SQL;
    SELECT Height, Weight, Sex
    FROM sashelp.heart
    WHERE DeathCause = 'Cancer'
    ORDER BY AgeAtStart DESC;
RUN;

/* Task 17 */
PROC SQL;
    SELECT * FROM sashelp.heart
    WHERE (Sex = 'Female' AND Weight > 180)
       OR (Sex = 'Male' AND Weight > 200);
RUN;

/* Task 18 */
PROC SQL;
    SELECT Sex, AgeAtStart, (Weight / Height) AS Weight_Height_Ratio
    FROM sashelp.heart
    ORDER BY Weight_Height_Ratio;
RUN;

/* Task 19 */
PROC SQL;
    SELECT DeathCause
    FROM sashelp.heart
    WHERE Status = 'Dead'
      AND BP_Status IN ('Normal', 'Optimal')
      AND Smoking = 0;
RUN;

/* Task 20 */
PROC SQL;
    SELECT * FROM sashelp.heart
    WHERE DeathCause = 'Cerebral Vascular Disease'
      AND Chol_Status = 'Desirable'
      AND BP_Status IN ('Normal', 'Optimal');
RUN;
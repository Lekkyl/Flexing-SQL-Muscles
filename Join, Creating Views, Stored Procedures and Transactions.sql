--1.1. Write and execute a SQL query to list the school names,
---- community names and average attendance for communities with a hardship index of 98.

SELECT CPS.NAME_OF_SCHOOL, CPS.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE
FROM CHICAGO_PUBLIC_SCHOOLS CPS
LEFT OUTER JOIN CENSUS_DATA CD
ON CPS.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE CD.HARDSHIP_INDEX = 98;


--1.2. Write and execute a SQL query to list all crimes that took place at a school.
----- Include case number, crime type and community name.

SELECT CPS.NAME_OF_SCHOOL, CCD.CASE_NUMBER, CCD.PRIMARY_TYPE, CPS.COMMUNITY_AREA_NAME
FROM CHICAGO_PUBLIC_SCHOOLS CPS
FULL OUTER JOIN CHICAGO_CRIME_DATA CCD
ON CPS.COMMUNITY_AREA_NUMBER = CCD.COMMUNITY_AREA_NUMBER;


--2. Write and execute a SQL statement to create a view showing the columns listed in the following table,
---- with new column names as shown in the second column.

CREATE VIEW SCHOOL_NAME_AND_ICON_FIELDS AS
SELECT NAME_OF_SCHOOL School_Name,
Safety_Icon	Safety_Rating,
Family_Involvement_Icon	Family_Rating,
Environment_Icon Environment_Rating,
Instruction_Icon Instruction_Rating,
Leaders_Icon Leaders_Rating,
Teachers_Icon Teachers_Rating
FROM CHICAGO_PUBLIC_SCHOOLS;

--2.1 RETURN ALL COLUMNS FROM SCHOOL_NAME_AND_ICON_FIELDS VIEW
SELECT * FROM SCHOOL_NAME_AND_ICON_FIELDS;

--2.2 RETURN SCHOOL NAMES AND LEADERS RATINGS FROM SCHOOL_NAME_AND_ICON_FIELDS VIEW
SELECT School_Name, Leaders_Rating FROM SCHOOL_NAME_AND_ICON_FIELDS;


--3.1 Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE
-- that takes a in_School_ID parameter as an integer and a in_Leader_Score parameter as an integer.
-- Don’t forget to use the #SET TERMINATOR statement to use the @ for the CREATE statement terminator.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (
IN School_ID INT, IN Leader_Score INT)

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN

END
@


--3.2 Inside your stored procedure, write a SQL statement to update the Leaders_Score field
-- in the CHICAGO_PUBLIC_SCHOOLS table for the school identified
-- by in_School_ID to the value in the in_Leader_Score parameter.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (
IN School_ID INT, IN Leader_Score INT)

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN

        UPDATE CHICAGO_PUBLIC_SCHOOLS CPS
        SET CPS.Leaders_Score = Leaders_Score
        WHERE CPS.School_ID = School_ID;
        
END
@


--3.3 Inside your stored procedure, write a SQL IF statement to update
-- the Leaders_Icon field in the CHICAGO_PUBLIC_SCHOOLS table for the school_name_and_icon
-- identified by in_School_ID using the following information.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (
IN School_ID INT, IN Leader_Score INT)

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN

    IF Leader_Score BETWEEN 0 AND 19 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS CPS
        SET CPS.Leaders_Icon = 'Very Weak'
        WHERE CPS.School_ID = School_ID;
        
    ELSEIF Leader_Score BETWEEN 20 AND 39 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS CPS
        SET CPS.Leaders_Icon = 'Weak'
        WHERE CPS.School_ID = School_ID;
        
    ELSEIF Leader_Score BETWEEN 40 AND 59 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS CPS
        SET CPS.Leaders_Icon = 'Average'
        WHERE CPS.School_ID = School_ID;
        
    ELSEIF Leader_Score BETWEEN 60 AND 79 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS CPS
        SET CPS.Leaders_Icon = 'Strong'
        WHERE CPS.School_ID = School_ID;
        
    ELSE
        UPDATE CHICAGO_PUBLIC_SCHOOLS CPS
        SET Leaders_Icon = 'Very Strong'
        WHERE CPS. School_ID = School_ID;
        
    END IF;
        
END
@



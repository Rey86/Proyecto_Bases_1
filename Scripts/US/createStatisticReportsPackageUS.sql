CREATE OR REPLACE PACKAGE USStatisticReports IS 
    PROCEDURE getAgeRangePercentageUsers;
END USStatisticReports;


CREATE OR REPLACE PACKAGE BODY USStatisticReports IS 
    --Function that gets the percentage of users per age range 
    PROCEDURE getAgeRangePercentageUsers AS 
    CURSOR AgeRangePercentageUsers IS
        SELECT  round(100*ratio_to_report(count(*)) over (), 2) percentage FROM 
        (SELECT username FROM userapp WHERE SYSDATE - Birthdate <= 18 AND SYSDATE - BIRTHDATE >= 0) UNION
        (SELECT username FROM userapp WHERE SYSDATE - Birthdate <= 30 AND SYSDATE - BIRTHDATE >= 19) UNION
        (SELECT username FROM userapp WHERE SYSDATE - Birthdate <= 45 AND SYSDATE - BIRTHDATE >= 31) UNION
        (SELECT username FROM userapp WHERE SYSDATE - Birthdate <= 55 AND SYSDATE - BIRTHDATE >= 46) UNION
        (SELECT username FROM userapp WHERE SYSDATE - Birthdate <= 65 AND SYSDATE - BIRTHDATE >= 56) UNION
        (SELECT username FROM userapp WHERE SYSDATE - Birthdate <= 75 AND SYSDATE - BIRTHDATE >= 66) UNION
        (SELECT username FROM userapp WHERE SYSDATE - Birthdate <= 85 AND SYSDATE - BIRTHDATE >= 76) UNION
        (SELECT username FROM userapp WHERE SYSDATE - BIRTHDATE >= 86);
        ORDER BY Birthdate;
    BEGIN 
        FOR i IN AgeRangePercentageUsers LOOP
            dbms_output.put_line(i.percentage);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');  
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAgeRangePercentageUsers;
END USStatisticReports;
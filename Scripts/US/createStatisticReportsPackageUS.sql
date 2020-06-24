CREATE OR REPLACE PACKAGE USStatisticReports IS 
    PROCEDURE getAgeRangePercentageUsers;
END USStatisticReports;


CREATE OR REPLACE PACKAGE BODY USStatisticReports IS 
    --Function that gets the percentage of users per age range 
    PROCEDURE getAgeRangePercentageUsers AS 
    vmenError VARCHAR2(100);
    CURSOR AgeRangePercentageUsers IS
        SELECT u.user_age_range user_age_range, round(100*ratio_to_report(count(*)) over (), 2) percentage FROM 
        (SELECT CASE WHEN (SYSDATE-p.birthdate) >= 0 and (SYSDATE-p.birthdate) <= 18 then '0-18'
        WHEN (SYSDATE-p.birthdate) >= 19 and (SYSDATE-p.birthdate) <= 30 then '19-30'
        WHEN (SYSDATE-p.birthdate) >= 31 and (SYSDATE-p.birthdate) <= 45 then '31-45'
        WHEN (SYSDATE-p.birthdate) >= 46 and (SYSDATE-p.birthdate) <= 55 then '46-55'
        WHEN (SYSDATE-p.birthdate) >= 56 and (SYSDATE-p.birthdate) <= 65 then '56-65'
        WHEN (SYSDATE-p.birthdate) >= 66 and (SYSDATE-p.birthdate) <= 75 then '66-75'
        WHEN (SYSDATE-p.birthdate) >= 76 and (SYSDATE-p.birthdate) <= 85 then '76-85'
        ELSE '85+' end as accused_age_range
        FROM userapp u INNER JOIN PRSN.person p ON p.id_person = u.id_user
        ORDER BY p.birthdate) t
        GROUP BY u.user_age_range;
    BEGIN 
        FOR i IN AgeRangePercentageUsers LOOP
            dbms_output.put_line(i.user_age_range);
            dbms_output.put_line(i.percentage);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');  
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAgeRangePercentageUsers;
END USStatisticReports;
CREATE OR REPLACE PACKAGE USStatisticReports IS 
    FUNCTION getAgeRangePercentageUsers RETURN SYS_REFCURSOR;
END USStatisticReports;


CREATE OR REPLACE PACKAGE BODY USStatisticReports IS 
    --Function that gets the percentage of users per age range 
    FUNCTION getAgeRangePercentageUsers RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    AgeRangePercentageUsers SYS_REFCURSOR ;
    BEGIN
    OPEN agerangepercentageusers FOR
        SELECT u.user_age_range user_age_range, round(100*ratio_to_report(count(*)) over (), 2) percentage FROM 
        (SELECT CASE WHEN (SYSDATE-p.birthdate)/365 >= 0 and (SYSDATE-p.birthdate)/365 <= 18 then '0-18'
        WHEN (SYSDATE-p.birthdate)/365 >= 19 and (SYSDATE-p.birthdate)/365 <= 30 then '19-30'
        WHEN (SYSDATE-p.birthdate)/365 >= 31 and (SYSDATE-p.birthdate)/365 <= 45 then '31-45'
        WHEN (SYSDATE-p.birthdate)/365 >= 46 and (SYSDATE-p.birthdate)/365 <= 55 then '46-55'
        WHEN (SYSDATE-p.birthdate)/365 >= 56 and (SYSDATE-p.birthdate)/365 <= 65 then '56-65'
        WHEN (SYSDATE-p.birthdate)/365 >= 66 and (SYSDATE-p.birthdate)/365 <= 75 then '66-75'
        WHEN (SYSDATE-p.birthdate)/365 >= 76 and (SYSDATE-p.birthdate)/365 <= 85 then '76-85'
        ELSE '85+' end as user_age_range
        FROM userapp u INNER JOIN PRSN.person p ON p.id_person = u.id_user
        ORDER BY p.birthdate) u
        GROUP BY u.user_age_range;
    RETURN agerangepercentageusers;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');  
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAgeRangePercentageUsers;
END USStatisticReports;
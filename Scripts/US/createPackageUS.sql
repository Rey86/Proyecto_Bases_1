CREATE OR REPLACE PACKAGE USTables IS
    -- UserApp Table
    PROCEDURE getUserApp (pcUserName VARCHAR2);
    PROCEDURE setUserApp (pcUserName VARCHAR2, pnBanDays NUMBER, pnBanned NUMBER, pnIdUserType NUMBER, pcIdUser VARCHAR2);
    PROCEDURE deleteUserApp (pcUserName VARCHAR2);
    PROCEDURE insertUserApp (pcUserName VARCHAR2, pcUserPassword VARCHAR2, pnBanDays NUMBER, pnBanned NUMBER, pnIdUserType NUMBER, 
        pcIdUser VARCHAR2);
    -- UserType Table
    PROCEDURE getUserType (pnIdUserType NUMBER);
    PROCEDURE setUserType (pnIdUserType NUMBER, pcUserTypeDescription VARCHAR2);
    PROCEDURE deleteUserType (pnIdUserType NUMBER);
    PROCEDURE insertUserType (pcUserTypeDescription VARCHAR2);
    -- BanReason Table 
    PROCEDURE getBanReason (pnIdBanReason NUMBER);
    PROCEDURE setBanReason (pnIdBanReason NUMBER, pcBanReasonDescription VARCHAR2);
    PROCEDURE deleteBanReason (pnIdBanReason NUMBER);
    PROCEDURE insertBanReason (pcBanReasonDescription VARCHAR2);
    -- BanReasonxUserApp Table 
    PROCEDURE deleteBanReasonxUserApp (pnIdBanReason NUMBER, pcUserName VARCHAR2);
    PROCEDURE insertBanReasonxUserApp (pnIdBanReason NUMBER, pcUserName VARCHAR2);
END USTables;

CREATE OR REPLACE PACKAGE BODY USTables AS
-- Table UserApp
-- Function to get a user app with specific name to show it in the screen      
    PROCEDURE getUserApp (pcUserName IN VARCHAR2) AS
    vmenError VARCHAR2(100);
    CURSOR userapp(pcUserName IN VARCHAR2)
    IS
        SELECT ua.username user_name, ua.ban_days ban_days, ua.banned banned, ut.usertype_description usertype_description, ua.id_user id_user,
            p.first_name first_name, p.last_name last_name, p.second_last_name second_last_name, 
            p.birthdate birthdate, g.gender_name gender_name, c.company_name company_name
        FROM USERAPP ua
        INNER JOIN PRSN.PERSON p
        ON ua.id_user = p.id_person
        INNER JOIN USERTYPE ut
        ON ua.id_usertype = ut.id_usertype 
        INNER JOIN PRSN.COMPANY c
        ON p.id_company = c.id_company 
        INNER JOIN PRSN.GENDER g
        ON p.id_gender = g.id_gender
        WHERE ua.username = NVL(pcUserName, ua.username);
    BEGIN 
        FOR i in userapp(pcUserName) LOOP
            dbms_output.put_line(i.user_name);
            dbms_output.put_line(i.ban_days);
            dbms_output.put_line(i.banned);
            dbms_output.put_line(i.usertype_description);
            dbms_output.put_line(i.id_user);
            dbms_output.put_line(i.first_name);
            dbms_output.put_line(i.last_name);
            dbms_output.put_line(i.second_last_name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.gender_name);
            dbms_output.put_line(i.company_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pcUserName');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getUserApp;

-- Procedure to set a user app with specific name and the new values wrote by the user  
    PROCEDURE setUserApp (pcUserName IN VARCHAR2, pnBanDays IN NUMBER, pnBanned IN NUMBER, pnIdUserType IN NUMBER, pcIdUser IN VARCHAR2) IS
        vmenError VARCHAR2(100);
    BEGIN
        UPDATE USERAPP
        SET ban_days = pnBanDays,
        banned = pnBanned,
        id_usertype = pnIdUserType,
        id_user = pcIdUser
        WHERE username = pcUserName;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcUsername');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setUserApp;

-- Procedure to delete a specific user app  
    PROCEDURE deleteUserApp (pcUserName IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN 
        DELETE FROM USERAPP
        WHERE username = pcUserName;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcUserName');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteUserApp;

-- Procedure to insert a new user app
    PROCEDURE insertUserApp (pcUserName IN VARCHAR2, pcUserPassword VARCHAR2, pnBanDays IN NUMBER, pnBanned IN NUMBER, pnIdUserType IN NUMBER, 
        pcIdUser IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN 
        INSERT INTO USERAPP (username, user_password, ban_days, banned, id_usertype, id_user)
        VALUES (pcUserName, pcUserPassword, pnBanDays, pnBanned, pnIdUserType, pcIdUser);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertUserApp;

-- Table UserType
-- Function to get a user type with specific id to show it in the screen      
    PROCEDURE getUserType (pnIdUserType IN NUMBER) AS
    vmenError VARCHAR2(100);
    CURSOR usertype(pnIdUserType IN NUMBER)
    IS
        SELECT id_usertype id_usertype, usertype_description usertype_description
        FROM USERTYPE 
        WHERE id_usertype = NVL(pnIdUserType, id_usertype);
    BEGIN 
        FOR i in usertype(pnIdUserType) LOOP
            dbms_output.put_line(i.id_usertype);
            dbms_output.put_line(i.usertype_description);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdUserType');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getUserType;

-- Procedure to set a user type with specific id and the new values wrote by the user  
    PROCEDURE setUserType (pnIdUserType IN NUMBER, pcUserTypeDescription IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN
        UPDATE USERTYPE
        SET usertype_description = pcUserTypeDescription
        WHERE id_usertype = pnIdUserType;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdUserType');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setUserType;

-- Procedure to delete a specific user type 
    PROCEDURE deleteUserType (pnIdUserType IN NUMBER) IS
    vmenError VARCHAR2(100);
    BEGIN 
        DELETE FROM USERTYPE
        WHERE id_usertype = pnIdUserType;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdUserType');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred'); 
    END deleteUserType;

-- Procedure to insert a new user type
    PROCEDURE insertUserType (pcUserTypeDescription IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN 
        INSERT INTO USERTYPE (id_usertype, usertype_description)
        VALUES (s_usertype.nextval, pcUserTypeDescription);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertUserType;
    
-- Table BanReason
-- Function to get a ban reason with specific id to show it in the screen      
    PROCEDURE getBanReason (pnIdBanReason IN NUMBER) AS
    vmenError VARCHAR2(100);
    CURSOR banreason(pnIdBanReason IN NUMBER)
    IS
        SELECT id_banreason id_banreason, banreason_description banreason_description
        FROM BANREASON
        WHERE id_banreason = NVL(pnIdBanReason, id_banreason);
    BEGIN 
        FOR i in banreason(pnIdBanReason) LOOP
            dbms_output.put_line(i.id_banreason);
            dbms_output.put_line(i.banreason_description);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdBanReason');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getBanReason;

-- Procedure to set a ban reason with specific id and the new values wrote by the user  
    PROCEDURE setBanReason (pnIdBanReason IN NUMBER, pcBanReasonDescription IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN
        UPDATE BANREASON
        SET banreason_description = pcBanReasonDescription
        WHERE id_banreason = pnIdBanReason;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdBanReason');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setBanReason;

-- Procedure to delete a specific ban reason 
    PROCEDURE deleteBanReason (pnIdBanReason IN NUMBER) IS
    vmenError VARCHAR2(100);
    BEGIN 
        DELETE FROM BANREASON
        WHERE id_banreason = pnIdBanReason;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdBanReason');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteBanReason;

-- Procedure to insert a new ban reason
    PROCEDURE insertBanReason (pcBanReasonDescription IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN 
        INSERT INTO BANREASON (id_banreason, banreason_description)
        VALUES (s_banreason.nextval, pcBanReasonDescription);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertBanReason;
    
-- Table BanReasonxUserApp
-- Procedure to delete a specific ban reason x user app
    PROCEDURE deleteBanReasonxUserApp (pnIdBanReason IN NUMBER, pcUserName IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN 
        DELETE FROM BANREASONXUSERAPP
        WHERE id_banreason = pnIdBanReason and username = pcUserName;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdBanReason');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteBanReasonxUserApp;

-- Procedure to insert a new ban reason x user app
    PROCEDURE insertBanReasonxUserApp (pnIdBanReason IN NUMBER, pcUserName IN VARCHAR2) IS
    vmenError VARCHAR2(100);
    BEGIN 
        INSERT INTO BANREASONXUSERAPP (id_banreason, username)
        VALUES (pnIdBanReason, pcUserName);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertBanReasonxUserApp;
    
END USTables;
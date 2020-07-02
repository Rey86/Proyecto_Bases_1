CREATE OR REPLACE PACKAGE USTables IS
    -- UserApp Table
    FUNCTION getUserApp (pcUserName VARCHAR2) RETURN SYS_REFCURSOR;
    PROCEDURE setUserApp (pcUserName VARCHAR2, pcUserPassword VARCHAR2, pnBanDays NUMBER, pnBanned NUMBER, pnIdUserType NUMBER, pcIdUser VARCHAR2);
    PROCEDURE deleteUserApp (pcUserName VARCHAR2);
    PROCEDURE insertUserApp (pcUserName VARCHAR2, pcUserPassword VARCHAR2, pnBanDays NUMBER, pnBanned NUMBER, pnIdUserType NUMBER, 
        pcIdUser VARCHAR2);
    FUNCTION getUserPassword (pcUserName VARCHAR2) RETURN VARCHAR2;
    FUNCTION isBannedUser (pcUserName VARCHAR2) RETURN NUMBER;
    FUNCTION getCurrentUserType (pcUserName VARCHAR2) RETURN VARCHAR2;
    
    -- UserType Table
    FUNCTION getUserType (pnIdUserType NUMBER) RETURN SYS_REFCURSOR;
    PROCEDURE setUserType (pnIdUserType NUMBER, pcUserTypeDescription VARCHAR2);
    PROCEDURE deleteUserType (pnIdUserType NUMBER);
    PROCEDURE insertUserType (pcUserTypeDescription VARCHAR2);
    -- BanReason Table 
    FUNCTION getBanReason (pnIdBanReason NUMBER) RETURN SYS_REFCURSOR;
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
    FUNCTION getUserApp (pcUserName IN VARCHAR2) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    userapp SYS_REFCURSOR;
    BEGIN 
    OPEN userapp FOR
        SELECT ua.username user_name, ua.ban_days ban_days, ua.banned banned, ua.id_usertype id_usertype,ut.usertype_description usertype_description, ua.id_user id_user,
            ua.user_password user_password, p.first_name first_name, p.last_name last_name, p.second_last_name second_last_name, 
            p.birthdate birthdate, p.id_gender id_gender, g.gender_name gender_name, p.id_company id_company, c.company_name company_name
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
    RETURN userapp; 
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pcUserName');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getUserApp;

-- Procedure to set a user app with specific name and the new values wrote by the user  
    PROCEDURE setUserApp (pcUserName IN VARCHAR2, pcUserPassword VARCHAR2, pnBanDays IN NUMBER, pnBanned IN NUMBER, pnIdUserType IN NUMBER, pcIdUser IN VARCHAR2) IS
        vmenError VARCHAR2(100);
    BEGIN
        UPDATE USERAPP
        SET user_password = pcUserPassword,
        ban_days = pnBanDays,
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

-- Function that returns the password of the user if it exists or throw an error else.
    FUNCTION getUserPassword (pcUserName VARCHAR2) RETURN VARCHAR2 IS
    vcUserPassword VARCHAR2(20);
    vmenError VARCHAR2(100);
    BEGIN
        SELECT user_password
        INTO vcUserPassword
        FROM USERAPP
        WHERE username = pcUserName;
        RETURN vcUserPassword;
    Exception      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pcUserName and pcUserPassword');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getUserPassword;
    
-- Funtion that returns 0 if the the user is banned or 1 else.   
    FUNCTION isBannedUser (pcUserName VARCHAR2) RETURN NUMBER IS
    vnBanned NUMBER;
    vmenError VARCHAR2(100);
    BEGIN
        SELECT banned
        INTO vnBanned
        FROM USERAPP
        WHERE username = pcUserName;
        RETURN (vnBanned);
    Exception      
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END isBannedUser;

-- Function that returns the type of the current user.
    FUNCTION getCurrentUserType (pcUserName VARCHAR2) RETURN VARCHAR2 IS
    vmenError VARCHAR2(100);
    vcUserTypeName VARCHAR2(30);
    BEGIN
        SELECT usertype_description
        INTO vcUserTypeName
        FROM USERAPP ua
        INNER JOIN USERTYPE ut
        ON ua.id_usertype = ut.id_usertype
        WHERE ua.username = pcUserName;
        RETURN (vcUserTypeName);
    Exception      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pcUserName and pcUserPassword');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getCurrentUserType;
    
-- Table UserType
-- Function to get a user type with specific id to show it in the screen      
    FUNCTION getUserType (pnIdUserType IN NUMBER) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    usertype SYS_REFCURSOR;
    BEGIN 
    OPEN usertype FOR
        SELECT id_usertype id_usertype, usertype_description usertype_description
        FROM USERTYPE 
        WHERE id_usertype = NVL(pnIdUserType, id_usertype);
    RETURN usertype;
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
    FUNCTION getBanReason (pnIdBanReason IN NUMBER) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    banreason SYS_REFCURSOR;
    BEGIN
    OPEN banreason FOR
        SELECT id_banreason id_banreason, banreason_description banreason_description
        FROM BANREASON
        WHERE id_banreason = NVL(pnIdBanReason, id_banreason);
    RETURN banreason;
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
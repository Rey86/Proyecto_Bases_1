CREATE OR REPLACE PACKAGE USTables IS
    -- UserApp Table
    PROCEDURE getUserApp (pcUserName VARCHAR2);
    PROCEDURE setUserApp (pcUserName VARCHAR2, pnBanDays NUMBER, pnBanned NUMBER, pnIdUserType NUMBER, pcIdUser VARCHAR2,
        pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, pdBirthdate DATE, pnIdGender NUMBER, 
        pnIdCompany NUMBER);
    PROCEDURE deleteUserApp (pcUserName VARCHAR2);
    PROCEDURE insertUserApp (pcUserName VARCHAR2, pcUserPassword VARCHAR2, pnBanDays NUMBER, pnBanned NUMBER, pnIdUserType NUMBER, 
        pcIdUser VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, pdBirthdate DATE, pnIdGender NUMBER, 
        pnIdCompany NUMBER);
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
    PROCEDURE deleteBanReasonxUserApp (pcIdBanReason NUMBER, pcUserName VARCHAR2);
    PROCEDURE insertBanReasonxUserApp (pcIdBanReason NUMBER, pcUserName VARCHAR2);
END USTables;

CREATE OR REPLACE PACKAGE BODY USTables AS
-- Table UserApp
-- Function to get a user app with specific id to show it in the screen      
    PROCEDURE getUserApp (pcUserName IN VARCHAR2) AS
    CURSOR userapp(pcUserName IN VARCHAR2)
    IS
        SELECT ua.user_name user_name, ua.ban_days ban_days, ua.banned banned, ut.usertype_name usertype_name, ua.id_user id_user,
            ua.first_name first_name, ua.last_name last_name, ua.second_last_name second_last_name, 
            ua.birthdate birthdate, g.gender_name gender_name, c.company_name company_name
        FROM USERAPP ua
        INNER JOIN USERTYPE ut
        ON ua.id_usertype = ut.id_usertype 
        INNER JOIN COMPANY c
        ON ua.id_company = c.id_company 
        INNER JOIN GENDER g
        ON ua.id_gender = g.id_gender
        WHERE ua.id_user_name = NVL(pcUserName, ua.user_name);
    BEGIN 
        FOR i in userapp(pcUserName) LOOP
            dbms_output.put_line(i.user_name);
            dbms_output.put_line(i.ban_days);
            dbms_output.put_line(i.banned);
            dbms_output.put_line(i.usertype_name);
            dbms_output.put_line(i.id_user);
            dbms_output.put_line(i.first_name);
            dbms_output.put_line(i.last_name);
            dbms_output.put_line(i.second_last_name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.gender_name);
            dbms_output.put_line(i.company_name);
        END LOOP;
    END getUserApp;

-- Procedure to set a user app with specific id and the new values wrote by the user  
    PROCEDURE setUserApp (pcUserName IN VARCHAR2, pcUserPassword VARCHAR2, pnBanDays IN NUMBER, pnBanned IN NUMBER, pnIdUserType IN NUMBER, 
        pcIdUser IN VARCHAR2, pcFirstName IN VARCHAR2, pcLastName VARCHAR2, pcSecondLastName IN VARCHAR2, pdBirthdate IN DATE, 
        pnIdGender IN NUMBER, pnIdCompany IN NUMBER) IS
    BEGIN
        UPDATE USERAPP
        SET user_password = pcUserPassword,
        ban_days = pnBanDays,
        banned = pnBanned,
        id_usertype = pnIdUserType,
        id_user = pcIdUser,
        first_name = pcFirstName,
        last_name = pcLastName,
        second_last_name = pcSecondLastName,
        birthdate = pdBirthdate,
        id_gender = pnIdGender,
        id_company = pnIdCompany
        WHERE user_name = pcUserName;
        Commit;
    END setUserApp;

-- Procedure to delete a specific user app  
    PROCEDURE deleteUserApp (pcUserName IN VARCHAR2) IS
    BEGIN 
        DELETE FROM USERAPP
        WHERE user_name = pcUserName;
        Commit;
    END deleteUserApp;

-- Procedure to insert a new user app
    PROCEDURE insertUserApp (pcUserName IN VARCHAR2, pcUserPassword VARCHAR2, pnBanDays IN NUMBER, pnBanned IN NUMBER, pnIdUserType IN NUMBER, 
        pcIdUser IN VARCHAR2, pcFirstName IN VARCHAR2, pcLastName VARCHAR2, pcSecondLastName IN VARCHAR2, pdBirthdate IN DATE, 
        pnIdGender IN NUMBER, pnIdCompany IN NUMBER) IS
    BEGIN 
        INSERT INTO USERAPP (user_name, user_password, ban_days, banned, id_usertype, id_user, 
            first_name, lat_name, second_last_name, birthdate, id_gender, id_company)
        VALUES (pcUserName, pcUserPassword, pnBanDays, pnBanned, pnIdUserType, pcIdUser, pcFirstName, pcLastName, 
            pcSecondLastName, pdBirthdate, pnIdGender, pnIdCompany);
        Commit;
    END insertUserApp;

-- Table UserType
-- Function to get a user type with specific id to show it in the screen      
    PROCEDURE getUserType (pnIdUserType IN NUMBER) AS
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
    END getUserType;

-- Procedure to set a user type with specific id and the new values wrote by the user  
    PROCEDURE setUserType (pnIdUserType IN NUMBER, pcUserTypeDescription IN VARCHAR2) IS
    BEGIN
        UPDATE USERTYPE
        SET usertype_description = pcUserTypeDescription
        WHERE id_usertype = pnIdUserType;
        Commit;
    END setUserType;

-- Procedure to delete a specific user type 
    PROCEDURE deleteUserType (pnIdUserType IN NUMBER) IS
    BEGIN 
        DELETE FROM USERTYPE
        WHERE id_usertype = pnIdUserType;
        Commit;
    END deleteUserType;

-- Procedure to insert a new user type
    PROCEDURE insertUserType (pcUserTypeDescription IN VARCHAR2) IS
    BEGIN 
        INSERT INTO USERTYPE (id_usertype, usertype_description)
        VALUES (s_usertype.nextval, pcUserTypeDescription);
        Commit;
    END insertUserType;
    
-- Table BanReason
-- Function to get a ban reason with specific id to show it in the screen      
    PROCEDURE getBanReason (pnIdBanReason IN NUMBER) AS
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
    END getBanReason;

-- Procedure to set a ban reason with specific id and the new values wrote by the user  
    PROCEDURE setBanReason (pnIdBanReason IN NUMBER, pcBanReasonDescription IN VARCHAR2) IS
    BEGIN
        UPDATE BANREASON
        SET banreason_description = pcBanReasonDescription
        WHERE id_banreason = pnIdBanReason;
        Commit;
    END setBanReason;

-- Procedure to delete a specific ban reason 
    PROCEDURE deleteBanReason (pnIdBanReason IN NUMBER) IS
    BEGIN 
        DELETE FROM BANREASON
        WHERE id_banreason = pnIdBanReason;
        Commit;
    END deleteBanReason;

-- Procedure to insert a new ban reason
    PROCEDURE insertBanReason (pcBanReasonDescription IN VARCHAR2) IS
    BEGIN 
        INSERT INTO BANREASON (id_banreason, banreason_description)
        VALUES (s_banreason.nextval, pcBanReasonDescription);
        Commit;
    END insertBanReason;
    
-- Table BanReasonxUserApp
-- Procedure to delete a specific ban reason x user app
    PROCEDURE deleteBanReasonxUserApp (pnIdBanReason IN NUMBER, pcUserName IN VARCHAR2) IS
    BEGIN 
        DELETE FROM BANREASONXUSERAPP
        WHERE id_banreason = pnIdBanReason and user_name = pcUserName;
        Commit;
    END deleteBanReasonxUserApp;

-- Procedure to insert a new ban reason x user app
    PROCEDURE insertBanReasonxUserApp (pnIdBanReason IN NUMBER, pcUserName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO BANREASONXUSERAPP (id_banreason, user_name)
        VALUES (pnIdBanReason, pcUserName);
        Commit;
    END insertBanReasonxUserApp;
    
END USTables;
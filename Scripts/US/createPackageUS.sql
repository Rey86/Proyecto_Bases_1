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
        SELECT utc.user_name user_name, utc.ban_days ban_days, utc.banned banned, utc.usertype_name usertype_name, utc.id_user id_user,
            utc.first_name first_name, utc.last_name last_name, utc.second_last_name second_last_name, 
            utc.birthdate birthdate, g.gender_name gender_name, utc.company_name company_name
        FROM (SELECT ut.user_name user_name, ut.ban_days ban_days, ut.banned banned, ut.usertype_name usertype_name, ut.id_user id_user,
                ut.first_name first_name, ut.last_name last_name, ut.second_last_name second_last_name, 
                ut.birthdate birthdate, ut.id_gender id_gender, c.company_name company_name
              FROM (SELECT ua.user_name user_name, ua.ban_days ban_days, ua.banned banned, ust.usertype_name usertype_name, 
                      ua.id_user id_user, ua.first_name first_name, ua.last_name last_name, ua.second_last_name second_last_name, 
                      ua.birthdate birthdate, ua.id_gender id_gender, ua.id_company id_company
                    FROM USERAPP ua
                    INNER JOIN USERTYPE ust
                    ON ua.id_usertype = ust.id_usertype) ut
              INNER JOIN COMPANY c
              ON ut.id_company = c.id_company) utc
        INNER JOIN GENDER g
        ON uct.id_gender = g.id_gender
        WHERE uct.id_user_name = NVL(pcUserName, uct.user_name);
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
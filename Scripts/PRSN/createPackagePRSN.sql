-- Package to PRSN procedures and functions.
CREATE OR REPLACE PACKAGE PRSNTables IS
    -- Person Table
    PROCEDURE getPerson (pnIdPerson NUMBER);
    PROCEDURE setPerson (pnIdPerson NUMBER, pcFirstName VARCHAR2, pcLastName VARCHAR2, 
        pcSecondLastName VARCHAR2, pdBirthdate DATE, pnIdGender NUMBER, pnIdCompany NUMBER);
    PROCEDURE deletePerson (pnIdPerson NUMBER);
    PROCEDURE insertPerson (pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, 
        pdBirthdate DATE, pnIdGender NUMBER, pnIdCompany NUMBER);
    -- Company Table
    PROCEDURE getCompany (pnIdCompany NUMBER);
    PROCEDURE setCompany (pnIdCompany NUMBER, pcCompanyName VARCHAR2);
    PROCEDURE deleteCompany (pnIdCompany NUMBER);
    PROCEDURE insertCompany (pcCompanyName VARCHAR2);
    -- Gender Table 
    PROCEDURE getGender (pnIdGender NUMBER);
    PROCEDURE setGender (pnIdGender NUMBER, pcGenderName VARCHAR2);
    PROCEDURE deleteGender (pnIdGender NUMBER);
    PROCEDURE insertGender (pcGenderName VARCHAR2);
END PlaceTables;

CREATE OR REPLACE PACKAGE BODY PlaceTables AS
-- Table Person
-- Function to get a person with specific id to show it in the screen      
    PROCEDURE getPerson (pnIdPerson IN NUMBER) AS
    CURSOR person(pnIdPerson IN NUMBER)
    IS
        SELECT pc.id_person id_person, pc.first_name first_name, pc.last_name last_name, pc.second_last_name second_last_name, 
            pc.birthdate birthdate, g.gender_name gender_name, pc.company_name company_name
        FROM (SELECT p.id_person, p.first_name, p.last_name, p.second_last_name, p.birthdate, p.id_gender, c.company_name
              FROM PERSON p
              INNER JOIN COMPANY c
              ON p.id_company = c.id_company) pc
        INNER JOIN GENDER g
        ON pc.id_gender = g.id_gender
        WHERE pc.id_person = NVL(pnIdPerson, pc.id_person);
    BEGIN 
        FOR i in person(pnIdPerson) LOOP
            dbms_output.put_line(i.id_person);
            dbms_output.put_line(i.first_name);
            dbms_output.put_line(i.last_name);
            dbms_output.put_line(i.second_last_name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.gender_name);
            dbms_output.put_line(i.company_name);
        END LOOP;
    END getPerson;

-- Procedure to set a person with specific id and the new values wrote by the user  
    PROCEDURE setPerson (pnIdPerson NUMBER, pcFirstName VARCHAR2, pcLastName VARCHAR2, 
        pcSecondLastName VARCHAR2, pdBirthdate DATE, pnIdGender NUMBER, pnIdCompany NUMBER) IS
    BEGIN
        UPDATE PERSON
        SET first_name = pcFirstName,
        last_name = pcLastName,
        second_last_name = pcSecondLastName,
        birthdate = pdBirthdate,
        id_gender = pnIdGender,
        id_company = pnIdCompany
        WHERE id_person = pnIdPerson;
        Commit;
    END setCommunity;

-- Procedure to delete a specific person  
    PROCEDURE deleteCommunity (pnIdCommunity IN NUMBER) IS
    BEGIN 
        DELETE FROM COMMUNITY
        WHERE id_community = pnIdCommunity;
        Commit;
    END deleteCommunity;

-- Procedure to insert a new person
    PROCEDURE insertCommunity (pcCommunityName IN VARCHAR2, pnIdDistict IN NUMBER) IS
    BEGIN 
        INSERT INTO COMMUNITY (id_community, community_name, id_district)
        VALUES (s_community, pcCommunityName, pnIdDistrict);
        Commit;
    END insertCommunity;
    
-- Table Company
-- Function to get a company with specific id to show it in the screen      
    PROCEDURE getCountry (pnIdCountry IN NUMBER) AS
    CURSOR country(pnIdCountry IN NUMBER)
    IS
        SELECT id_country, country_name
        FROM COUNTRY 
        WHERE id_country = NVL(pnIdCountry, id_country);
    BEGIN 
        FOR i in country(pnIdCountry) LOOP
            dbms_output.put_line(i.id_country);
            dbms_output.put_line(i.country_name);
        END LOOP;
    END getCountry;

-- Procedure to set a company with specific id and the new values wrote by the user  
    PROCEDURE setCountry (pnIdCountry IN NUMBER, pcCountryName IN VARCHAR2) IS
    BEGIN
        UPDATE COUNTRY
        SET country_name = pcCountryName
        WHERE id_country = pnIdCountry;
        Commit;
    END setCountry;

-- Procedure to delete a specific company  
    PROCEDURE deleteCountry (pnIdCountry IN NUMBER) IS
    BEGIN 
        DELETE FROM COUNTRY
        WHERE id_country = pnIdCountry;
        Commit;
    END deleteCountry;

-- Procedure to insert a new company
    PROCEDURE insertCountry (pcCountryName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO COUNTRY (id_country, country_name)
        VALUES (s_country, pcCountryName);
        Commit;
    END insertCountry;
    
-- Table Gender
-- Function to get a gender with specific id to show it in the screen      
    PROCEDURE getCountry (pnIdCountry IN NUMBER) AS
    CURSOR country(pnIdCountry IN NUMBER)
    IS
        SELECT id_country, country_name
        FROM COUNTRY 
        WHERE id_country = NVL(pnIdCountry, id_country);
    BEGIN 
        FOR i in country(pnIdCountry) LOOP
            dbms_output.put_line(i.id_country);
            dbms_output.put_line(i.country_name);
        END LOOP;
    END getCountry;

-- Procedure to set a gender with specific id and the new values wrote by the user  
    PROCEDURE setCountry (pnIdCountry IN NUMBER, pcCountryName IN VARCHAR2) IS
    BEGIN
        UPDATE COUNTRY
        SET country_name = pcCountryName
        WHERE id_country = pnIdCountry;
        Commit;
    END setCountry;

-- Procedure to delete a specific gender  
    PROCEDURE deleteCountry (pnIdCountry IN NUMBER) IS
    BEGIN 
        DELETE FROM COUNTRY
        WHERE id_country = pnIdCountry;
        Commit;
    END deleteCountry;

-- Procedure to insert a new gender
    PROCEDURE insertCountry (pcCountryName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO COUNTRY (id_country, country_name)
        VALUES (s_country, pcCountryName);
        Commit;
    END insertCountry;
END PRSNTables;
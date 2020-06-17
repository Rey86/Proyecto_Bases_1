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
    END setPerson;

-- Procedure to delete a specific person  
    PROCEDURE deletePerson (pnIdPerson NUMBER) IS
    BEGIN 
        DELETE FROM PERSON
        WHERE id_person = pnIdPerson;
        Commit;
    END deletePerson;

-- Procedure to insert a new person
    PROCEDURE insertPerson (pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, 
        pdBirthdate DATE, pnIdGender NUMBER, pnIdCompany NUMBER) IS
    BEGIN 
        INSERT INTO PERSON (id_person, first_name, lat_name, second_last_name, birthdate, id_gender, id_company)
        VALUES (s_person, pcFirstName, pcLastName, pcSecondLastName, pdBirthdate, pnIdGender, pnIdCompany);
        Commit;
    END insertPerson;
    
-- Table Company
-- Function to get a company with specific id to show it in the screen      
    PROCEDURE getCompany (pnIdCompany IN NUMBER) AS
    CURSOR company(pnIdCompany IN NUMBER)
    IS
        SELECT id_company, company_name
        FROM COMPANY 
        WHERE id_company = NVL(pnIdCompany, id_company);
    BEGIN 
        FOR i in company(pnIdCompany) LOOP
            dbms_output.put_line(i.id_company);
            dbms_output.put_line(i.company_name);
        END LOOP;
    END getCompany;

-- Procedure to set a company with specific id and the new values wrote by the user  
    PROCEDURE setCompany (pnIdCompany IN NUMBER, pcCompanyName IN VARCHAR2) IS
    BEGIN
        UPDATE COMPANY
        SET company_name = pcCompanyName
        WHERE id_company = pnIdCompany;
        Commit;
    END setCompany;

-- Procedure to delete a specific company  
    PROCEDURE deleteCompany (pnIdCompany IN NUMBER) IS
    BEGIN 
        DELETE FROM COMPANY
        WHERE id_company = pnIdCompany;
        Commit;
    END deleteCompany;

-- Procedure to insert a new company
    PROCEDURE insertCompany (pcCompanyName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO COMPANY (id_company, company_name)
        VALUES (s_company, pcCompanyName);
        Commit;
    END insertCompany;
    
-- Table Gender
-- Function to get a gender with specific id to show it in the screen      
    PROCEDURE getGender (pnIdGender IN NUMBER) AS
    CURSOR gender(pnIdGender IN NUMBER)
    IS
        SELECT id_gender, gender_name
        FROM GENDER 
        WHERE id_gender = NVL(pnIdGender, id_gender);
    BEGIN 
        FOR i in gender(pnIdGender) LOOP
            dbms_output.put_line(i.id_gender);
            dbms_output.put_line(i.gender_name);
        END LOOP;
    END getGender;

-- Procedure to set a gender with specific id and the new values wrote by the user  
    PROCEDURE setGender (pnIdGender IN NUMBER, pcGenderName IN VARCHAR2) IS
    BEGIN
        UPDATE GENDER
        SET gender_name = pcGenderName
        WHERE id_gender = pnIdGender;
        Commit;
    END setGender;

-- Procedure to delete a specific gender  
    PROCEDURE deleteGender (pnIdGender IN NUMBER) IS
    BEGIN 
        DELETE FROM GENDER
        WHERE id_gender = pnIdGender;
        Commit;
    END deleteGender;

-- Procedure to insert a new gender
    PROCEDURE insertGender (pcGenderName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO GENDER (id_gender, gender_name)
        VALUES (s_gender, pcGenderName);
        Commit;
    END insertGender;
END PRSNTables;
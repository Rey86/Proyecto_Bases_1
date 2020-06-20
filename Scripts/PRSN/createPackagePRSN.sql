-- Package to PRSN procedures and functions.
CREATE OR REPLACE PACKAGE PRSNTables IS
    -- Person Table
    PROCEDURE getPerson (pcIdPerson VARCHAR2);
    PROCEDURE setPerson (pcIdPerson VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, 
        pcSecondLastName VARCHAR2, pdBirthdate DATE, pnIdGender NUMBER, pnIdCompany NUMBER);
    PROCEDURE deletePerson (pcIdPerson VARCHAR2);
    PROCEDURE insertPerson (pcIdPerson VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, 
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

CREATE OR REPLACE PACKAGE BODY PRSNTables AS
-- Table Person
-- Function to get a person with specific id to show it in the screen      
    PROCEDURE getPerson (pcIdPerson IN VARCHAR2) AS
    CURSOR person(pnIdPerson IN VARCHAR2)
    IS
        SELECT p.id_person id_person, p.first_name first_name, p.last_name last_name, p.second_last_name second_last_name, 
            p.birthdate birthdate, g.gender_name gender_name, c.company_name company_name
        FROM PERSON p
        INNER JOIN COMPANY c
        ON p.id_company = c.id_company
        INNER JOIN GENDER g
        ON p.id_gender = g.id_gender
        WHERE p.id_person = NVL(pcIdPerson, p.id_person);
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
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pcIdPerson');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getPerson;

-- Procedure to set a person with specific id and the new values wrote by the user  
    PROCEDURE setPerson (pcIdPerson IN VARCHAR2, pcFirstName IN VARCHAR2, pcLastName IN VARCHAR2, 
        pcSecondLastName IN VARCHAR2, pdBirthdate IN DATE, pnIdGender IN NUMBER, pnIdCompany IN NUMBER) IS
    BEGIN
        UPDATE PERSON
        SET first_name = pcFirstName,
        last_name = pcLastName,
        second_last_name = pcSecondLastName,
        birthdate = pdBirthdate,
        id_gender = pnIdGender,
        id_company = pnIdCompany
        WHERE id_person = pcIdPerson;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcIdPerson');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setPerson;

-- Procedure to delete a specific person  
    PROCEDURE deletePerson (pcIdPerson IN VARCHAR2) IS
    BEGIN 
        DELETE FROM PERSON
        WHERE id_person = pcIdPerson;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcIdPerson');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deletePerson;

-- Procedure to insert a new person
    PROCEDURE insertPerson (pcIdPerson IN VARCHAR2, pcFirstName IN VARCHAR2, pcLastName IN VARCHAR2, pcSecondLastName IN VARCHAR2, 
        pdBirthdate IN DATE, pnIdGender IN NUMBER, pnIdCompany IN NUMBER) IS
    BEGIN 
        INSERT INTO PERSON (id_person, first_name, lat_name, second_last_name, birthdate, id_gender, id_company)
        VALUES (pcIdPerson, pcFirstName, pcLastName, pcSecondLastName, pdBirthdate, pnIdGender, pnIdCompany);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
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
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdCompany');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getCompany;

-- Procedure to set a company with specific id and the new values wrote by the user  
    PROCEDURE setCompany (pnIdCompany IN NUMBER, pcCompanyName IN VARCHAR2) IS
    BEGIN
        UPDATE COMPANY
        SET company_name = pcCompanyName
        WHERE id_company = pnIdCompany;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCompany');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setCompany;

-- Procedure to delete a specific company  
    PROCEDURE deleteCompany (pnIdCompany IN NUMBER) IS
    BEGIN 
        DELETE FROM COMPANY
        WHERE id_company = pnIdCompany;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCompany');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteCompany;

-- Procedure to insert a new company
    PROCEDURE insertCompany (pcCompanyName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO COMPANY (id_company, company_name)
        VALUES (s_company.nextval, pcCompanyName);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
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
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdGender');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getGender;

-- Procedure to set a gender with specific id and the new values wrote by the user  
    PROCEDURE setGender (pnIdGender IN NUMBER, pcGenderName IN VARCHAR2) IS
    BEGIN
        UPDATE GENDER
        SET gender_name = pcGenderName
        WHERE id_gender = pnIdGender;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdGender');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setGender;

-- Procedure to delete a specific gender  
    PROCEDURE deleteGender (pnIdGender IN NUMBER) IS
    BEGIN 
        DELETE FROM GENDER
        WHERE id_gender = pnIdGender;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdGender');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteGender;

-- Procedure to insert a new gender
    PROCEDURE insertGender (pcGenderName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO GENDER (id_gender, gender_name)
        VALUES (s_gender.nextval, pcGenderName);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertGender;
END PRSNTables;
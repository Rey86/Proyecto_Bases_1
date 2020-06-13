-- Table Person
CREATE TABLE PERSON(
    id_user VARCHAR2(20) CONSTRAINT userapp_id_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT person_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT person_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT person_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT person_birthdate_nn NOT NULL, 
    id_person VARCHAR2(20) CONSTRAINT person_id_nn NOT NULL,
    id_gender NUMBER(6) CONSTRAINT person_idgender_nn NOT NULL,
    id_company NUMBER(6) CONSTRAINT person_idcompany_nn NOT NULL
    );

-- Table Company
CREATE TABLE COMPANY(
    id_company NUMBER(6) CONSTRAINT company_id_nn NOT NULL,
    company_name VARCHAR2(30) CONSTRAINT company_name_nn NOT NULL
    );
    
--Table Gender
CREATE TABLE GENDER(
    id_gender NUMBER CONSTRAINT gender_id_nn not null,
    gender_name VARCHAR2(15) CONSTRAINT company_name_nn NOT NULL
);
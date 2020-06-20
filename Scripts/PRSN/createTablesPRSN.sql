-- Table Person
CREATE TABLE PERSON(
    first_name VARCHAR2(25) CONSTRAINT person_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT person_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT person_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT person_birthdate_nn NOT NULL, 
    id_person VARCHAR2(20) CONSTRAINT person_id_nn NOT NULL,
    id_gender NUMBER(8) CONSTRAINT person_idgender_nn NOT NULL,
    id_company NUMBER(8) CONSTRAINT person_idcompany_nn NOT NULL,
    date_creation DATE CONSTRAINT person_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT person_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE PERSON
    IS 'Table that stores data of people';
COMMENT ON COLUMN
    PERSON.first_name IS
    'First name of the person';
COMMENT ON COLUMN
    PERSON.last_name IS
    'Last name of the person';
COMMENT ON COLUMN
    PERSON.second_last_name IS
    'Second last name of the person';
COMMENT ON COLUMN
    PERSON.birthdate IS
    'Date of birth of the person';
COMMENT ON COLUMN
    PERSON.id_person IS
    'Identification number of the person';
COMMENT ON COLUMN
    PERSON.id_gender IS
    'Identification number of gender of the person';
COMMENT ON COLUMN
    PERSON.id_company IS
    'Identification number of company of the person';
COMMENT ON COLUMN
    PERSON.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    PERSON.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    PERSON.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    PERSON.user_last_modification IS
    'Last user who modified it';

-- Table Company
CREATE TABLE COMPANY(
    id_company NUMBER(8) CONSTRAINT company_id_nn NOT NULL,
    company_name VARCHAR2(30) CONSTRAINT company_name_nn NOT NULL,
    date_creation DATE CONSTRAINT company_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT company_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE COMPANY
    IS 'Table that stores data of companies';
COMMENT ON COLUMN
    COMPANY.id_company IS
    'Identification number of the company';
COMMENT ON COLUMN
    COMPANY.company_name IS
    'Name of the company';
COMMENT ON COLUMN
    COMPANY.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    COMPANY.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    COMPANY.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    COMPANY.user_last_modification IS
    'Last user who modified it';
    
--Table Gender
CREATE TABLE GENDER(
    id_gender NUMBER(8) CONSTRAINT gender_id_nn not null,
    gender_name VARCHAR2(15) CONSTRAINT gender_name_nn NOT NULL,
    date_creation DATE CONSTRAINT gender_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT gender_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
);
--Comments
COMMENT ON TABLE GENDER
    IS 'Table that stores data of genders';
COMMENT ON COLUMN
    GENDER.id_gender IS
    'Identification number of the gender';
COMMENT ON COLUMN
    GENDER.gender_name IS
    'Name of the gender';
COMMENT ON COLUMN
    GENDER.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    GENDER.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    GENDER.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    GENDER.user_last_modification IS
    'Last user who modified it';
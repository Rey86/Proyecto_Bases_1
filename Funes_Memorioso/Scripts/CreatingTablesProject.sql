-- Table Userapp
CREATE TABLE USERAPP(
    username VARCHAR2(30) CONSTRAINT userapp_username_nn NOT NULL,
    user_password VARCHAR2(20) CONSTRAINT userapp_userpassword_nn NOT NULL,
    ban_days NUMBER CONSTRAINT userapp_bandays_nn NOT NULL, 
        CONSTRAINT userapp_bandays_min CHECK (ban_days > 0),
    banned BOOLEAN DEFAULT FALSE,
    id_banreason NUMBER(6) CONSTRAINT userapp_idbanreason_nn NOT NULL,
    id_usertype NUMBER(6) CONSTRAINT userapp_idusertype_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT userapp_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT userapp_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT userapp_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT userapp_birthdate_nn NOT NULL, 
    identification_card VARCHAR2(20) CONSTRAINT userapp_id_nn NOT NULL,
        CONSTRAINT userapp_id_uk UNIQUE (identification_card),
    id_gender NUMBER(6) CONSTRAINT userapp_idgender_nn NOT NULL,
    id_company NUMBER(6) CONSTRAINT userapp_idcompany_nn NOT NULL
    );
    
-- Table Person
CREATE TABLE PERSON(
    first_name VARCHAR2(25) CONSTRAINT person_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT person_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT person_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT person_birthdate_nn NOT NULL, 
    identification_card VARCHAR2(20) CONSTRAINT person_id_nn NOT NULL,
    id_gender NUMBER(6) CONSTRAINT person_idgender_nn NOT NULL,
    id_company NUMBER(6) CONSTRAINT person_idcompany_nn NOT NULL
    );
    
CREATE TABLE PROCEEDING(
    valid BOOLEAN DEFAULT TRUE,
    proceedings 
    );
    
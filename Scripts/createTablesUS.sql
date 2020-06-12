-- Table Userapp
CREATE TABLE USERAPP(
    username VARCHAR2(30) CONSTRAINT userapp_username_nn NOT NULL,
    user_password VARCHAR2(20) CONSTRAINT userapp_userpassword_nn NOT NULL,
    ban_days NUMBER CONSTRAINT userapp_bandays_nn NOT NULL, 
        CONSTRAINT userapp_bandays_min CHECK (ban_days > 0),
    banned BOOLEAN DEFAULT FALSE,
    id_usertype NUMBER(6) CONSTRAINT userapp_idusertype_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT userapp_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT userapp_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT userapp_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT userapp_birthdate_nn NOT NULL, 
    id_user VARCHAR2(20) CONSTRAINT userapp_id_nn NOT NULL,
        CONSTRAINT userapp_iduser_uk UNIQUE (id_user),
    id_gender NUMBER(6) CONSTRAINT userapp_idgender_nn NOT NULL,
    id_company NUMBER(6) CONSTRAINT userapp_idcompany_nn NOT NULL
    );
    
-- Table UserType
CREATE TABLE USERTYPE(
    id_usertype NUMBER(6) CONSTRAINT usertype_id_nn NOT NULL,
    usertype_description VARCHAR2(30) CONSTRAINT usertype_description_nn NOT NULL
    );
    
-- Table BanReason
CREATE TABLE BANREASON(
    id_banreason NUMBER(6) CONSTRAINT banreason_id_nn NOT NULL,
    banreason_description VARCHAR2(30) CONSTRAINT banreason_description_nn NOT NULL
    );
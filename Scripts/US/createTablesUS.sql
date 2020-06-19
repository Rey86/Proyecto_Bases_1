-- Table Userapp
CREATE TABLE USERAPP(
    username VARCHAR2(30) CONSTRAINT userapp_username_nn NOT NULL,
    user_password VARCHAR2(20) CONSTRAINT userapp_userpassword_nn NOT NULL,
    ban_days NUMBER CONSTRAINT userapp_bandays_nn NOT NULL, 
        CONSTRAINT userapp_bandays_min CHECK (ban_days > 0),
    banned NUMBER CONSTRAINT userapp_banned_nn NOT NULL,
    id_usertype NUMBER(8) CONSTRAINT userapp_idusertype_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT userapp_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT userapp_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT userapp_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT userapp_birthdate_nn NOT NULL, 
    id_user VARCHAR2(20) CONSTRAINT userapp_id_nn NOT NULL,
        CONSTRAINT userapp_iduser_uk UNIQUE (id_user),
    id_gender NUMBER(8) CONSTRAINT userapp_idgender_nn NOT NULL,
    id_company NUMBER(8) CONSTRAINT userapp_idcompany_nn NOT NULL,
    date_creation DATE CONSTRAINT userapp_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT userapp_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
-- Table UserType
CREATE TABLE USERTYPE(
    id_usertype NUMBER(8) CONSTRAINT usertype_id_nn NOT NULL,
    usertype_description VARCHAR2(30) CONSTRAINT usertype_description_nn NOT NULL,
    date_creation DATE CONSTRAINT usertype_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT usertype_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
-- Table BanReason
CREATE TABLE BANREASON(
    id_banreason NUMBER(8) CONSTRAINT banreason_id_nn NOT NULL,
    banreason_description VARCHAR2(30) CONSTRAINT banreason_description_nn NOT NULL,
    date_creation DATE CONSTRAINT banreason_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT banreason_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
--Table BanReasonXUserapp
CREATE TABLE BANREASONXUSERAPP(
    id_banreason NUMBER(8) CONSTRAINT banreason_id_nn NOT NULL,
    username VARCHAR2(30) CONSTRAINT userapp_username_nn NOT NULL
);
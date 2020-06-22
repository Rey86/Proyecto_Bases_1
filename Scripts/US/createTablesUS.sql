-- Table Userapp
CREATE TABLE USERAPP(
    username VARCHAR2(30) CONSTRAINT userapp_username_nn NOT NULL,
    user_password VARCHAR2(20) CONSTRAINT userapp_userpassword_nn NOT NULL,
    ban_days NUMBER CONSTRAINT userapp_bandays_nn NOT NULL, 
        CONSTRAINT userapp_bandays_min CHECK (ban_days > 0),
    banned NUMBER CONSTRAINT userapp_banned_nn NOT NULL,
    id_usertype NUMBER(8) CONSTRAINT userapp_idusertype_nn NOT NULL,
    id_user VARCHAR2(20) CONSTRAINT userapp_id_nn NOT NULL,
        CONSTRAINT userapp_iduser_uk UNIQUE (id_user),
    date_creation DATE CONSTRAINT userapp_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT userapp_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE USERAPP
    IS 'Table that stores data of users';
COMMENT ON COLUMN
    USERAPP.username IS
    'Identification name of the user';
COMMENT ON COLUMN
    USERAPP.user_password IS
    'Password of the user';
COMMENT ON COLUMN
    USERAPP.ban_days IS
    'Number of days that the user will be bannned';
COMMENT ON COLUMN
    USERAPP.banned IS
    'Number that shows if the user is banned, 0 = false and 1 = true';
COMMENT ON COLUMN
    USERAPP.id_usertype IS
    'Identification number of user type of the user';
COMMENT ON COLUMN
    USERAPP.id_user IS
    'Identification number of the user';
COMMENT ON COLUMN
    USERAPP.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    USERAPP.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    USERAPP.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    USERAPP.user_last_modification IS
    'Last user who modified it';
    
-- Table UserType
CREATE TABLE USERTYPE(
    id_usertype NUMBER(8) CONSTRAINT usertype_id_nn NOT NULL,
    usertype_description VARCHAR2(30) CONSTRAINT usertype_description_nn NOT NULL,
    date_creation DATE CONSTRAINT usertype_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT usertype_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE USERTYPE
    IS 'Table that stores data of user types';
COMMENT ON COLUMN
    USERTYPE.id_usertype IS
    'Identification number of the user type';
COMMENT ON COLUMN
    USERTYPE.usertype_description IS
    'Description of the user type';
COMMENT ON COLUMN
    USERTYPE.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    USERTYPE.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    USERTYPE.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    USERTYPE.user_last_modification IS
    'Last user who modified it';
    
-- Table BanReason
CREATE TABLE BANREASON(
    id_banreason NUMBER(8) CONSTRAINT banreason_id_nn NOT NULL,
    banreason_description VARCHAR2(30) CONSTRAINT banreason_description_nn NOT NULL,
    date_creation DATE CONSTRAINT banreason_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT banreason_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE BANREASON
    IS 'Table that stores data of ban reasons';
COMMENT ON COLUMN
    BANREASON.id_banreason IS
    'Identification number of the ban reason';
COMMENT ON COLUMN
    BANREASON.banreason_description IS
    'Description of the ban reason';
COMMENT ON COLUMN
    BANREASON.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    BANREASON.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    BANREASON.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    BANREASON.user_last_modification IS
    'Last user who modified it';
    
--Table BanReasonXUserapp
CREATE TABLE BANREASONXUSERAPP(
    id_banreason NUMBER(8) CONSTRAINT brXu_idBan_nn NOT NULL,
    username VARCHAR2(30) CONSTRAINT brXu_username_nn NOT NULL,
    date_creation DATE CONSTRAINT brXu_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT brXu_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
);
--Comments
COMMENT ON TABLE BANREASONXUSERAPP
    IS 'Table that stores data of ban reason for each username';
COMMENT ON COLUMN
    BANREASONXUSERAPP.id_banreason IS
    'Identification number of the ban reason';
COMMENT ON COLUMN
    BANREASONXUSERAPP.username IS
    'Identification name of the user';
COMMENT ON COLUMN
    BANREASONXUSERAPP.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    BANREASONXUSERAPP.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    BANREASONXUSERAPP.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    BANREASONXUSERAPP.user_last_modification IS
    'Last user who modified it';
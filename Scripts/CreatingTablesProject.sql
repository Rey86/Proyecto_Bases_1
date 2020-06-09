--jaja

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
    
-- Table Proceedings
CREATE TABLE TRANSCRIPT(
    valid BOOLEAN DEFAULT TRUE,
    transcript_number VARCHAR2(15) CONSTRAINT transcript_number_nn NOT NULL,
    username VARCHAR2(30) CONSTRAINT transcript_username_nn NOT NULL, 
    id_accused VARCHAR2(20) CONSTRAINT transcript_idaccused_nn NOT NULL,
    id_proceedingstype NUMBER(6) CONSTRAINT transcript_idtranscripttype_nn NOT NULL,
    id_resolution NUMBER(6) CONSTRAINT transcript_idresolution_nn NOT NULL,
    id_community NUMBER(6) CONSTRAINT transcript_idcommunity_nn NOT NULL,
    id_sentence NUMBER(6) CONSTRAINT transcript_idsentence_nn NOT NULL,
    id_crime NUMBER(6) CONSTRAINT transcript_idcrime_nn NOT NULL,
    due_date DATE CONSTRAINT transcript_duedate_nn NOT NULL
    );
    
-- Table Accused
CREATE TABLE ACCUSED(
    id_accused VARCHAR2(20) CONSTRAINT accused_id_nn NOT NULL,
    id_company NUMBER(6) CONSTRAINT accused_idcompany_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT accused_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT accused_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT accused_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT accused_birthdate_nn NOT NULL, 
    id_gender NUMBER(6) CONSTRAINT accused_idgender_nn NOT NULL
    );

-- Table Company
CREATE TABLE COMPANY(
    id_company NUMBER(6) CONSTRAINT company_id_nn NOT NULL,
    company_name VARCHAR2(30) CONSTRAINT company_name_nn NOT NULL
    );

-- Table Resolution
CREATE TABLE VERDICT(
    id_resolution NUMBER(6) CONSTRAINT resolution_id_nn NOT NULL,
    resolution_name VARCHAR2(30) CONSTRAINT resolution_name_nn NOT NULL
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
    
-- Table ProceedingsType
CREATE TABLE TRANSCRIPTTYPE(
    id_proceedingstype NUMBER(6) CONSTRAINT proceedingstype_id_nn NOT NULL,
    proceedingstype_name VARCHAR2(30) CONSTRAINT proceedingstype_name_nn NOT NULL
    );

-- Table Community
CREATE TABLE COMMUNITY(
    id_community NUMBER(6) CONSTRAINT community_id_nn NOT NULL,
    community_name VARCHAR2(30) CONSTRAINT community_name_nn NOT NULL,
    id_district NUMBER(6) CONSTRAINT community_iddistrict_nn NOT NULL
    );
    
-- Table District
CREATE TABLE DISTRICT(
    id_district NUMBER(6) CONSTRAINT district_id_nn NOT NULL,
    district_name VARCHAR2(30) CONSTRAINT district_name_nn NOT NULL,
    id_canton NUMBER(6) CONSTRAINT district_idcanton_nn NOT NULL
    );
    
-- Table Canton
CREATE TABLE CANTON(
    id_canton NUMBER(6) CONSTRAINT canton_id_nn NOT NULL,
    canton_name VARCHAR2(30) CONSTRAINT canton_name_nn NOT NULL,
    id_province NUMBER(6) CONSTRAINT canton_idprovince_nn NOT NULL
    );
    
-- Table Province
CREATE TABLE PROVINCE(
    id_province NUMBER(6) CONSTRAINT province_id_nn NOT NULL,
    province_name VARCHAR2(30) CONSTRAINT province_name_nn NOT NULL,
    id_country NUMBER(6) CONSTRAINT province_idcountry_nn NOT NULL
    );
    
-- Table Country
CREATE TABLE COUNTRY(
    id_country NUMBER(6) CONSTRAINT country_id_nn NOT NULL,
    country_name VARCHAR2(30) CONSTRAINT country_name_nn NOT NULL
    );


    
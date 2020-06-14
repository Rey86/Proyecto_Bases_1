-- Table Community
CREATE TABLE COMMUNITY(
    id_community NUMBER(6) CONSTRAINT community_id_nn NOT NULL,
    community_name VARCHAR2(30) CONSTRAINT community_name_nn NOT NULL,
    id_district NUMBER(6) CONSTRAINT community_iddistrict_nn NOT NULL,
    date_creation DATE CONSTRAINT community_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT community_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification varchar2(15)
    );
    
-- Table District
CREATE TABLE DISTRICT(
    id_district NUMBER(6) CONSTRAINT district_id_nn NOT NULL,
    district_name VARCHAR2(30) CONSTRAINT district_name_nn NOT NULL,
    id_canton NUMBER(6) CONSTRAINT district_idcanton_nn NOT NULL,
    date_creation DATE CONSTRAINT district_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT district_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification varchar2(15)
    );
    
-- Table Canton
CREATE TABLE CANTON(
    id_canton NUMBER(6) CONSTRAINT canton_id_nn NOT NULL,
    canton_name VARCHAR2(30) CONSTRAINT canton_name_nn NOT NULL,
    id_province NUMBER(6) CONSTRAINT canton_idprovince_nn NOT NULL,
    date_creation DATE CONSTRAINT canton_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT canton_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification varchar2(15)
    );
    
-- Table Province
CREATE TABLE PROVINCE(
    id_province NUMBER(6) CONSTRAINT province_id_nn NOT NULL,
    province_name VARCHAR2(30) CONSTRAINT province_name_nn NOT NULL,
    id_country NUMBER(6) CONSTRAINT province_idcountry_nn NOT NULL,
    date_creation DATE CONSTRAINT province_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT province_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification varchar2(15)
    );
    
-- Table Country
CREATE TABLE COUNTRY(
    id_country NUMBER(6) CONSTRAINT country_id_nn NOT NULL,
    country_name VARCHAR2(30) CONSTRAINT country_name_nn NOT NULL,
    date_creation DATE CONSTRAINT country_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT country_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification varchar2(15)
    );
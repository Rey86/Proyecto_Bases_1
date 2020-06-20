-- Table Community
CREATE TABLE COMMUNITY(
    id_community NUMBER(8) CONSTRAINT community_id_nn NOT NULL,
    community_name VARCHAR2(30) CONSTRAINT community_name_nn NOT NULL,
    id_district NUMBER(8) CONSTRAINT community_iddistrict_nn NOT NULL,
    date_creation DATE CONSTRAINT community_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT community_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE COMMUNITY
    IS 'Table that stores data of communities';
COMMENT ON COLUMN
    COMMUNITY.id_community IS
    'Identification number of the community';
COMMENT ON COLUMN
    COMMUNITY.community_name IS
    'Name of the community';
COMMENT ON COLUMN
    COMMUNITY.id_district IS
    'Identification number of its district';
COMMENT ON COLUMN
    COMMUNITY.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    COMMUNITY.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    COMMUNITY.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    COMMUNITY.user_last_modification IS
    'Last user who modified it';
    
-- Table District
CREATE TABLE DISTRICT(
    id_district NUMBER(8) CONSTRAINT district_id_nn NOT NULL,
    district_name VARCHAR2(30) CONSTRAINT district_name_nn NOT NULL,
    id_canton NUMBER(8) CONSTRAINT district_idcanton_nn NOT NULL,
    date_creation DATE CONSTRAINT district_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT district_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE DISTRICT
    IS 'Table that stores data of districts';
COMMENT ON COLUMN
    DISTRICT.id_district IS
    'Identification number of the district';
COMMENT ON COLUMN
    DISTRICT.district_name IS
    'Name of the district';
COMMENT ON COLUMN
    DISTRICT.id_canton IS
    'Identification number of its canton';
COMMENT ON COLUMN
    DISTRICT.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    DISTRICT.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    DISTRICT.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    DISTRICT.user_last_modification IS
    'Last user who modified it';
    
-- Table Canton
CREATE TABLE CANTON(
    id_canton NUMBER(8) CONSTRAINT canton_id_nn NOT NULL,
    canton_name VARCHAR2(30) CONSTRAINT canton_name_nn NOT NULL,
    id_province NUMBER(8) CONSTRAINT canton_idprovince_nn NOT NULL,
    date_creation DATE CONSTRAINT canton_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT canton_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE CANTON
    IS 'Table that stores data of cantons';
COMMENT ON COLUMN
    CANTON.id_canton IS
    'Identification number of the canton';
COMMENT ON COLUMN
    CANTON.canton_name IS
    'Name of the canton';
COMMENT ON COLUMN
    CANTON.id_province IS
    'Identification number of its province';
COMMENT ON COLUMN
    CANTON.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    CANTON.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    CANTON.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    CANTON.user_last_modification IS
    'Last user who modified it';
    
-- Table Province
CREATE TABLE PROVINCE(
    id_province NUMBER(8) CONSTRAINT province_id_nn NOT NULL,
    province_name VARCHAR2(30) CONSTRAINT province_name_nn NOT NULL,
    id_country NUMBER(8) CONSTRAINT province_idcountry_nn NOT NULL,
    date_creation DATE CONSTRAINT province_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT province_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE PROVINCE
    IS 'Table that stores data of provinces';
COMMENT ON COLUMN
    PROVINCE.id_province IS
    'Identification number of the province';
COMMENT ON COLUMN
    PROVINCE.province_name IS
    'Name of the province';
COMMENT ON COLUMN
    PROVINCE.id_country IS
    'Identification number of its country';
COMMENT ON COLUMN
    PROVINCE.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    PROVINCE.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    PROVINCE.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    PROVINCE.user_last_modification IS
    'Last user who modified it';
    
-- Table Country
CREATE TABLE COUNTRY(
    id_country NUMBER(8) CONSTRAINT country_id_nn NOT NULL,
    country_name VARCHAR2(30) CONSTRAINT country_name_nn NOT NULL,
    date_creation DATE CONSTRAINT country_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT country_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE COUNTRY
    IS 'Table that stores data of countries';
COMMENT ON COLUMN
    COUNTRY.id_country IS
    'Identification number of the country';
COMMENT ON COLUMN
    COUNTRY.country_name IS
    'Name of the country';
COMMENT ON COLUMN
    COUNTRY.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    COUNTRY.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    COUNTRY.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    COUNTRY.user_last_modification IS
    'Last user who modified it';
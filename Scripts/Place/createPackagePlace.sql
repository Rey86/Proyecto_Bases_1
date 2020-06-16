-- Package to Place procedures and functions.
CREATE OR REPLACE PACKAGE PlaceTables IS
    -- Community Table
    PROCEDURE getCommunity (pnIdCommunity NUMBER);
    PROCEDURE setCommunityColumns (pnIdCommunity NUMBER, pcCommunityName VARCHAR2, pnIdDistrict NUMBER);
    PROCEDURE deleteCommunity (pnIdCommunity NUMBER);
    PROCEDURE insertCommunity (pcCommunityName VARCHAR2, pnIdDistrict NUMBER);
    -- District Table
    PROCEDURE getDistrict (pnIdDistrict NUMBER);
    PROCEDURE setDistrictColumns (pnIdDistrict NUMBER, pcDistrictName VARCHAR2, pnIdCanton NUMBER);
    PROCEDURE deleteDistrict (pnIdDistrict NUMBER);
    PROCEDURE insertDistrict (pcDistrictName VARCHAR2, pnIdCanton NUMBER);
    -- Canton Table 
    PROCEDURE getCanton (pnIdCanton NUMBER);
    PROCEDURE setCantonColumns (pnIdCanton NUMBER, pcCantonName VARCHAR2, pnIdProvince NUMBER);
    PROCEDURE deleteCanton (pnIdCanton NUMBER);
    PROCEDURE insertCanton (pcCantonName VARCHAR2, pnIdProvince NUMBER);
    -- Province Table 
    PROCEDURE getProvince (pnIdProvince NUMBER);
    PROCEDURE setProvinceColumns (pnIdProvince NUMBER, pcProvinceName VARCHAR2, pnIdCountry NUMBER);
    PROCEDURE deleteProvince (pnIdProvince NUMBER);
    PROCEDURE insertProvince (pcProvinceName VARCHAR2, pnIdCountry NUMBER);
    -- Country Table
    PROCEDURE getCountry (pnIdCountry NUMBER);
    PROCEDURE setCountryColumns (pnIdCountry NUMBER, pcCountryName VARCHAR2);
    PROCEDURE deleteCountry (pnIdCountry NUMBER);
    PROCEDURE insertCountry (pcCountryName VARCHAR2);
END PlaceTables;

CREATE OR REPLACE PACKAGE BODY PlaceTables AS
-- Table Community
-- Function to get a community with specific id to show it in the screen      
    PROCEDURE getCommunity (pnIdCommunity IN NUMBER) AS
    CURSOR community(pnIdCommunity IN NUMBER)
    IS
        SELECT c.id_community id_community, c.community_name community_name, d.district_name district_name
        FROM COMMUNITY c
        INNER JOIN DISTRICT d
        ON c.id_district = d.id_district
        WHERE c.id_community = NVL(pnIdCommunity, c.id_community);
    BEGIN 
        FOR i in community(pnIdCommunity) LOOP
            dbms_output.put_line(i.id_community);
            dbms_output.put_line(i.community_name);
            dbms_output.put_line(i.district_name);
        END LOOP;
    END getCommunity;

-- Procedure to set a community with specific id and the new values wrote by the user  
    PROCEDURE setCommunity (pnIdCommunity IN NUMBER, pcCommunityName IN VARCHAR2, pnIdDistict IN NUMBER) IS
    BEGIN
        UPDATE COMMUNITY
        SET community_name = pcCommunityName,
        id_district = pnIdDistict
        WHERE id_community = pnIdCommunity;
        Commit;
    END setCommunitys;

-- Procedure to delete a specific community  
    PROCEDURE deleteCommunity (pnIdCommunity IN NUMBER) IS
    BEGIN 
        DELETE FROM COMMUNITY
        WHERE id_community = pnIdCommunity;
        Commit;
    END deleteCommunity;

-- Procedure to insert a new community
    PROCEDURE insertCommunity (pcCommunityName IN VARCHAR2, pnIdDistict IN NUMBER) IS
    BEGIN 
        INSERT INTO COMMUNITY (id_community, community_name, id_district)
        VALUES (s_community, pcCommunityName, pnIdDistrict);
        Commit;
    END insertCommunity;

-- Table District
-- Function to get a district with specific id to show it in the screen      
    PROCEDURE getDistrict (pnIdDistrict IN NUMBER) AS
    CURSOR district(pnIdDistrict IN NUMBER)
    IS
        SELECT d.id_district id_district, d.district_name district_name, c.canton_name canton_name
        FROM DISTRICT d
        INNER JOIN CANTON c
        ON d.id_canton = c.id_canton
        WHERE d.id_district = NVL(pnIdDistrict, d.id_district);
    BEGIN 
        FOR i in district(pnIdDistrict) LOOP
            dbms_output.put_line(i.id_district);
            dbms_output.put_line(i.district_name);
            dbms_output.put_line(i.canton_name);
        END LOOP;
    END getDistrict;

-- Procedure to set a district with specific id and the new values wrote by the user  
    PROCEDURE setDistrict (pnIdDistrict IN NUMBER, pcDistrictName IN VARCHAR2, pnIdCanton IN NUMBER) IS
    BEGIN
        UPDATE DISTRICT
        SET district_name = pcDistrictName,
        id_canton = pnIdCanton
        WHERE id_district = pnIdDistrict;
        Commit;
    END setDistrict;

-- Procedure to delete a specific district  
    PROCEDURE deleteDistrict (pnIdDistrict IN NUMBER) IS
    BEGIN 
        DELETE FROM DISTRICT
        WHERE id_district = pnIdDistrict;
        Commit;
    END deleteDistrict;

-- Procedure to insert a new district
    PROCEDURE insertDistrict (pcDistrictName IN VARCHAR2, pnIdCanton IN NUMBER) IS
    BEGIN 
        INSERT INTO DISTRICT (id_district, district_name, id_canton)
        VALUES (s_district, pcDistrictName, pnIdCanton);
        Commit;
    END insertDistrict;

-- Table Canton
-- Function to get a canton with specific id to show it in the screen      
    PROCEDURE getCanton (pnIdCanton IN NUMBER) AS
    CURSOR canton(pnIdCanton IN NUMBER)
    IS
        SELECT c.id_canton id_canton, c.canton_name canton_name, p.province_name province_name
        FROM CANTON c
        INNER JOIN PROVINCE p
        ON c.id_province = p.id_province
        WHERE c.id_canton = NVL(pnIdCanton, c.id_canton);
    BEGIN 
        FOR i in canton(pnIdCanton) LOOP
            dbms_output.put_line(i.id_canton);
            dbms_output.put_line(i.canton_name);
            dbms_output.put_line(i.province_name);
        END LOOP;
    END getCanton;

-- Procedure to set a canton with specific id and the new values wrote by the user  
    PROCEDURE setCanton (pnIdCanton IN NUMBER, pcCantonName IN VARCHAR2, pnIdProvince IN NUMBER) IS
    BEGIN
        UPDATE CANTON
        SET canton_name = pcCantonName,
        id_province = pnIdProvince
        WHERE id_canton = pnIdCanton;
        Commit;
    END setCanton;

-- Procedure to delete a specific canton  
    PROCEDURE deleteCanton (pnIdCanton IN NUMBER) IS
    BEGIN 
        DELETE FROM CANTON
        WHERE id_canton = pnIdCanton;
        Commit;
    END deleteCanton;

-- Procedure to insert a new canton
    PROCEDURE insertCanton (pcCantonName IN VARCHAR2, pnIdProvince IN NUMBER) IS
    BEGIN 
        INSERT INTO CANTON (id_canton, canton_name, id_province)
        VALUES (s_canton, pcCantonName, pnIdProvince);
        Commit;
    END insertCanton;

END PlaceTables;
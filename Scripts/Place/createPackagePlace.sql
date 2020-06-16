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
        WHERE d.id_community = NVL(pnIdCommunity, d.id_community);
    BEGIN 
        FOR i in community(pnIdCommunity) LOOP
            dbms_output.put_line(i.id_community);
            dbms_output.put_line(i.community_name);
            dbms_output.put_line(i.district_name);
        END LOOP;
    END getCommunityColumns;

-- Procedure to set a community with specific id and the new values wrote by the user  
    PROCEDURE setCommunityColumns (pnIdCommunity NUMBER, pcCommunityName VARCHAR2, pnIdDistict NUMBER) IS
    BEGIN
        UPDATE COMMUNITY
        SET community_name = pcCommunityName,
        id_district = pnIdDistict
        WHERE id_community = pnIdCommunity;
        Commit;
    END setCommunityColumns;

-- Procedure to delete a specific community  
    PROCEDURE deleteCommunity (pnIdCommunity NUMBER) IS
    BEGIN 
        DELETE FROM COMMUNITY
        WHERE id_community = pnIdCommunity;
        Commit;
    END deleteCommunity;

-- Procedure to insert a new community
    PROCEDURE insertCommunity (pcCommunityName VARCHAR2, pnIdDistict NUMBER) IS
    BEGIN 
        INSERT INTO COMMUNITY (id_community, community_name, id_district)
        VALUES (s_community, pcCommunityName, pnIdDistict);
        Commit;
    END insertCommunity;

END PlaceTables;
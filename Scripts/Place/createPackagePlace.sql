-- Package to Place procedures and functions.
CREATE OR REPLACE PACKAGE PlaceTables IS
    -- Community Table
    FUNCTION getAllCommunities RETURN VARCHAR2; 
    FUNCTION getCommunityColumns (pnIdCommunity NUMBER) RETURN VARCHAR2;
    PROCEDURE setCommunityColumns (pnIdCommunity NUMBER, pcCommunityName VARCHAR2, pnIdDistrict NUMBER);
    PROCEDURE deleteCommunity (pnIdCommunity NUMBER);
    PROCEDURE insertCommunity (pcCommunityName VARCHAR2, pnIdDistrict NUMBER);
    -- District Table
    FUNCTION getAllDistricts RETURN VARCHAR2; 
    FUNCTION getDistrictColumns (pnIdDistrict NUMBER) RETURN VARCHAR2;
    PROCEDURE setDistrictColumns (pnIdDistrict NUMBER, pcDistrictName VARCHAR2, pnIdCanton NUMBER);
    PROCEDURE deleteDistrict (pnIdDistrict NUMBER);
    PROCEDURE insertDistrict (pcDistrictName VARCHAR2, pnIdCanton NUMBER);
    -- Canton Table
    FUNCTION getAllCantons RETURN VARCHAR2; 
    FUNCTION getCantonColumns (pnIdCanton NUMBER) RETURN VARCHAR2;
    PROCEDURE setCantonColumns (pnIdCanton NUMBER, pcCantonName VARCHAR2, pnIdProvince NUMBER);
    PROCEDURE deleteCanton (pnIdCanton NUMBER);
    PROCEDURE insertCanton (pcCantonName VARCHAR2, pnIdProvince NUMBER);
    -- Province Table
    FUNCTION getAllProvinces RETURN VARCHAR2; 
    FUNCTION getProvinceColumns (pnIdProvince NUMBER) RETURN VARCHAR2;
    PROCEDURE setProvinceColumns (pnIdProvince NUMBER, pcProvinceName VARCHAR2, pnIdCountry NUMBER);
    PROCEDURE deleteProvince (pnIdProvince NUMBER);
    PROCEDURE insertProvince (pcProvinceName VARCHAR2, pnIdCountry NUMBER);
    -- Country Table
    FUNCTION getAllCountries RETURN VARCHAR2; 
    FUNCTION getCountryColumns (pnIdCountry NUMBER) RETURN VARCHAR2;
    PROCEDURE setCountryColumns (pnIdCountry NUMBER, pcCountryName VARCHAR2);
    PROCEDURE deleteCountry (pnIdCountry NUMBER);
    PROCEDURE insertCountry (pcCountryName VARCHAR2);
END PlaceTables;

CREATE OR REPLACE PACKAGE BODY PlaceTables AS
-- Table Community
-- Function to get all communities to show them in the screen
    FUNCTION getAllCommunities RETURN VARCHAR2 IS
        vcCommunityName VARCHAR2(30);
    BEGIN 
        SELECT community_name
        INTO vcCommunityName
        FROM COMMUNITY;
        RETURN(vcCommunityName);    
    END getCommunityColumns;

-- Function to get a community with specific id to show it in the screen  
    FUNCTION getCommunityColumns (pnIdCommunity NUMBER) RETURN VARCHAR2 IS
        vcCommunityName VARCHAR2(30);
    BEGIN 
        SELECT community_name
        INTO vcCommunityName
        FROM COMMUNITY
        WHERE id_community = pnIdCommunity;
        RETURN(vcCommunityName);    
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
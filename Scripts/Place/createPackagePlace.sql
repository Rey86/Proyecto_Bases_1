-- Package to Place procedures and functions.
CREATE OR REPLACE PACKAGE PlaceTables IS
    -- Community Table
    PROCEDURE getCommunity (pnIdCommunity NUMBER);
    PROCEDURE setCommunity (pnIdCommunity NUMBER, pcCommunityName VARCHAR2, pnIdDistrict NUMBER);
    PROCEDURE deleteCommunity (pnIdCommunity NUMBER);
    PROCEDURE insertCommunity (pcCommunityName VARCHAR2, pnIdDistrict NUMBER);
    -- District Table
    PROCEDURE getDistrict (pnIdDistrict NUMBER);
    PROCEDURE setDistrict (pnIdDistrict NUMBER, pcDistrictName VARCHAR2, pnIdCanton NUMBER);
    PROCEDURE deleteDistrict (pnIdDistrict NUMBER);
    PROCEDURE insertDistrict (pcDistrictName VARCHAR2, pnIdCanton NUMBER);
    -- Canton Table 
    PROCEDURE getCanton (pnIdCanton NUMBER);
    PROCEDURE setCanton (pnIdCanton NUMBER, pcCantonName VARCHAR2, pnIdProvince NUMBER);
    PROCEDURE deleteCanton (pnIdCanton NUMBER);
    PROCEDURE insertCanton (pcCantonName VARCHAR2, pnIdProvince NUMBER);
    -- Province Table 
    PROCEDURE getProvince (pnIdProvince NUMBER);
    PROCEDURE setProvince (pnIdProvince NUMBER, pcProvinceName VARCHAR2, pnIdCountry NUMBER);
    PROCEDURE deleteProvince (pnIdProvince NUMBER);
    PROCEDURE insertProvince (pcProvinceName VARCHAR2, pnIdCountry NUMBER);
    -- Country Table
    PROCEDURE getCountry (pnIdCountry NUMBER);
    PROCEDURE setCountry (pnIdCountry NUMBER, pcCountryName VARCHAR2);
    PROCEDURE deleteCountry (pnIdCountry NUMBER);
    PROCEDURE insertCountry (pcCountryName VARCHAR2);
END PlaceTables;

CREATE OR REPLACE PACKAGE BODY PlaceTables AS
-- Table Community
-- Function to get a community with specific id to show it in the screen      
    PROCEDURE getCommunity (pnIdCommunity IN NUMBER) AS
    vmenError VARCHAR2(50);
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
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdCommunity');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getCommunity;

-- Procedure to set a community with specific id and the new values wrote by the user  
    PROCEDURE setCommunity (pnIdCommunity IN NUMBER, pcCommunityName IN VARCHAR2, pnIdDistrict IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN
        UPDATE COMMUNITY
        SET community_name = pcCommunityName,
        id_district = pnIdDistrict
        WHERE id_community = pnIdCommunity;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCommunity');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setCommunity;

-- Procedure to delete a specific community  
    PROCEDURE deleteCommunity (pnIdCommunity IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        DELETE FROM COMMUNITY
        WHERE id_community = pnIdCommunity;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCommunity');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteCommunity;

-- Procedure to insert a new community
    PROCEDURE insertCommunity (pcCommunityName IN VARCHAR2, pnIdDistrict IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        INSERT INTO COMMUNITY (id_community, community_name, id_district)
        VALUES (s_community.nextval, pcCommunityName, pnIdDistrict);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertCommunity;

-- Table District
-- Function to get a district with specific id to show it in the screen      
    PROCEDURE getDistrict (pnIdDistrict IN NUMBER) AS
    vmenError VARCHAR2(50);
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
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdDistrict');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getDistrict;

-- Procedure to set a district with specific id and the new values wrote by the user  
    PROCEDURE setDistrict (pnIdDistrict IN NUMBER, pcDistrictName IN VARCHAR2, pnIdCanton IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN
        UPDATE DISTRICT
        SET district_name = pcDistrictName,
        id_canton = pnIdCanton
        WHERE id_district = pnIdDistrict;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdDistrict');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setDistrict;

-- Procedure to delete a specific district  
    PROCEDURE deleteDistrict (pnIdDistrict IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        DELETE FROM DISTRICT
        WHERE id_district = pnIdDistrict;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdDistrict');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteDistrict;

-- Procedure to insert a new district
    PROCEDURE insertDistrict (pcDistrictName IN VARCHAR2, pnIdCanton IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        INSERT INTO DISTRICT (id_district, district_name, id_canton)
        VALUES (s_district.nextval, pcDistrictName, pnIdCanton);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertDistrict;

-- Table Canton
-- Function to get a canton with specific id to show it in the screen      
    PROCEDURE getCanton (pnIdCanton IN NUMBER) AS
    vmenError VARCHAR2(50);
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
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdCanton');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getCanton;

-- Procedure to set a canton with specific id and the new values wrote by the user  
    PROCEDURE setCanton (pnIdCanton IN NUMBER, pcCantonName IN VARCHAR2, pnIdProvince IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN
        UPDATE CANTON
        SET canton_name = pcCantonName,
        id_province = pnIdProvince
        WHERE id_canton = pnIdCanton;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCanton');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setCanton;

-- Procedure to delete a specific canton  
    PROCEDURE deleteCanton (pnIdCanton IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        DELETE FROM CANTON
        WHERE id_canton = pnIdCanton;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCanton');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteCanton;

-- Procedure to insert a new canton
    PROCEDURE insertCanton (pcCantonName IN VARCHAR2, pnIdProvince IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        INSERT INTO CANTON (id_canton, canton_name, id_province)
        VALUES (s_canton.nextval, pcCantonName, pnIdProvince);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertCanton;
    
-- Table Province
-- Function to get a province with specific id to show it in the screen      
    PROCEDURE getProvince (pnIdProvince IN NUMBER) AS
    vmenError VARCHAR2(50);
    CURSOR province(pnIdProvince IN NUMBER)
    IS
        SELECT p.id_province id_province, p.province_name province_name, c.country_name country_name
        FROM PROVINCE p
        INNER JOIN COUNTRY c
        ON p.id_country = c.id_country
        WHERE p.id_province = NVL(pnIdProvince, p.id_province);
    BEGIN 
        FOR i in province(pnIdProvince) LOOP
            dbms_output.put_line(i.id_province);
            dbms_output.put_line(i.province_name);
            dbms_output.put_line(i.country_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdProvince');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getProvince;

-- Procedure to set a province with specific id and the new values wrote by the user  
    PROCEDURE setProvince (pnIdProvince IN NUMBER, pcProvinceName IN VARCHAR2, pnIdCountry IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN
        UPDATE PROVINCE
        SET province_name = pcProvinceName,
        id_country = pnIdCountry
        WHERE id_province = pnIdProvince;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdProvince');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setProvince;

-- Procedure to delete a specific province 
    PROCEDURE deleteProvince (pnIdProvince IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        DELETE FROM PROVINCE
        WHERE id_province = pnIdProvince;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdProvince');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteProvince;

-- Procedure to insert a new province
    PROCEDURE insertProvince (pcProvinceName IN VARCHAR2, pnIdCountry IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        INSERT INTO PROVINCE (id_province, province_name, id_country)
        VALUES (s_province.nextval, pcProvinceName, pnIdCountry);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertProvince;
    
-- Table Country
-- Function to get a country with specific id to show it in the screen      
    PROCEDURE getCountry (pnIdCountry IN NUMBER) AS
    vmenError VARCHAR2(50);
    CURSOR country(pnIdCountry IN NUMBER)
    IS
        SELECT id_country, country_name
        FROM COUNTRY 
        WHERE id_country = NVL(pnIdCountry, id_country);
    BEGIN 
        FOR i in country(pnIdCountry) LOOP
            dbms_output.put_line(i.id_country);
            dbms_output.put_line(i.country_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdCountry');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getCountry;

-- Procedure to set a country with specific id and the new values wrote by the user  
    PROCEDURE setCountry (pnIdCountry IN NUMBER, pcCountryName IN VARCHAR2) IS
    vmenError VARCHAR2(50);
    BEGIN
        UPDATE COUNTRY
        SET country_name = pcCountryName
        WHERE id_country = pnIdCountry;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCountry');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setCountry;

-- Procedure to delete a specific country  
    PROCEDURE deleteCountry (pnIdCountry IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        DELETE FROM COUNTRY
        WHERE id_country = pnIdCountry;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCountry');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteCountry;

-- Procedure to insert a new country
    PROCEDURE insertCountry (pcCountryName IN VARCHAR2) IS
    vmenError VARCHAR2(50);
    BEGIN 
        INSERT INTO COUNTRY (id_country, country_name)
        VALUES (s_country.nextval, pcCountryName);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');  
    END insertCountry;
    
END PlaceTables;
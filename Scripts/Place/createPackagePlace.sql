-- Package to ADM procedures and functions.
CREATE OR REPLACE PACKAGE ADMTables IS
    FUNCTION getAllParameters RETURN VARCHAR2; 
    FUNCTION getParameterColumns (pnIdParameter NUMBER) RETURN VARCHAR2;
    PROCEDURE setParameterColumns (pnIdParameter NUMBER, pcParameterName VARCHAR2, pnParameterValue NUMBER);
    PROCEDURE deletePameter (pnIdParameter NUMBER);
    PROCEDURE insertParameter (pcParameterName VARCHAR2, pnParameterValue NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY ADMTables AS
-- Function to get all parameters to show them in the screen
    FUNCTION getAllParameters RETURN VARCHAR2 IS
        vcParameterName VARCHAR2(30);
    BEGIN 
        SELECT parameter_name
        INTO vcParameterName
        FROM PARAMETER_TABLE;
        RETURN(vcParameterName);    
    END getParameterColumns;

-- Function to get a parameter with specific id to show it in the screen  
    FUNCTION getParameterColumns (pnIdParameter NUMBER) RETURN VARCHAR2 IS
        vcParameterName VARCHAR2(30);
    BEGIN 
        SELECT parameter_name
        INTO vcParameterName
        FROM PARAMETER_TABLE
        WHERE id_parameter = pnIdParameter;
        RETURN(vcParameterName);    
    END getParameterColumns;

-- Procedure to set a parameter with specific id and the new values wrote by the user  
    PROCEDURE setParameterColumns (pnIdParameter NUMBER, pcParameterName VARCHAR2, pnParameterValue NUMBER) IS
    BEGIN
        UPDATE PARAMETER_TABLE
        SET parameter_name = pcParameterName,
        parameter_value = pcParameterName
        WHERE id_parameter = pnIdParameter;
        Commit;
    END setParameterColumns;

-- Procedure to delete a specific parameter  
    PROCEDURE deletePameter (pnIdParameter NUMBER) IS
    BEGIN 
        DELETE FROM PARAMETER_TABLE
        WHERE id_parameter = pnIdParameter;
        Commit;
    END deletePameter;

-- Procedure to insert a new parameter
    PROCEDURE insertParameter (pcParameterName VARCHAR2, pnParameterValue NUMBER) IS
    BEGIN 
        INSERT INTO PARAMETER_TABLE (id_parameter, parameter_name, parameter_value)
        VALUES (s_parameter, pcParameterName, pnParameterValue);
        Commit;
    END insertParameter;

END ADMTables;
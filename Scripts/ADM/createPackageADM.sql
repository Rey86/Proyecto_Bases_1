-- Package to ADM procedures and functions.
CREATE OR REPLACE PACKAGE ADMTables IS
    PROCEDURE getParameter (pnIdParameter NUMBER);
    PROCEDURE setParameterColumns (pnIdParameter NUMBER, pcParameterName VARCHAR2, pnParameterValue NUMBER);
    PROCEDURE deleteParameter (pnIdParameter NUMBER);
    PROCEDURE insertParameter (pcParameterName VARCHAR2, pnParameterValue NUMBER);
END ADMTables;

CREATE OR REPLACE PACKAGE BODY ADMTables AS
-- Procedure to get a parameter with specific id to show it in the screen  
    PROCEDURE getParameter (pnIdParameter IN NUMBER) AS
    CURSOR parameterTable(pnIdParameter IN NUMBER)
    IS
        SELECT id_parameter, parameter_name, parameter_value
        FROM PARAMETER_TABLE
        WHERE id_parameter = NVL(pnIdParameter, id_parameter);
    BEGIN 
        FOR i in parameterTable(pnIdParameter) LOOP
            dbms_output.put_line(i.id_parameter);
            dbms_output.put_line(i.parameter_name);
            dbms_output.put_line(i.parameter_value);
        END LOOP;
    END getParameterColumns;

-- Procedure to set a parameter with specific id and the new values wrote by the user  
    PROCEDURE setParameterColumns (pnIdParameter NUMBER, pcParameterName VARCHAR2, pnParameterValue NUMBER) IS
    BEGIN
        UPDATE PARAMETER_TABLE
        SET parameter_name = pcParameterName,
        parameter_value = pnParameterValue
        WHERE id_parameter = pnIdParameter;
        Commit;
    END setParameterColumns;

-- Procedure to delete a specific parameter  
    PROCEDURE deleteParameter (pnIdParameter NUMBER) IS
    BEGIN 
        DELETE FROM PARAMETER_TABLE
        WHERE id_parameter = pnIdParameter;
        Commit;
    END deleteParameter;

-- Procedure to insert a new parameter
    PROCEDURE insertParameter (pcParameterName VARCHAR2, pnParameterValue NUMBER) IS
    BEGIN 
        INSERT INTO PARAMETER_TABLE (id_parameter, parameter_name, parameter_value)
        VALUES (s_parameter, pcParameterName, pnParameterValue);
        Commit;
    END insertParameter;

END ADMTables;
        
        
        
        


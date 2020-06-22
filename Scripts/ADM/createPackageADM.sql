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
    vmenError VARCHAR2(50);
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
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdParameter');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getParameter;

-- Procedure to set a parameter with specific id and the new values wrote by the user  
    PROCEDURE setParameterColumns (pnIdParameter IN NUMBER, pcParameterName IN VARCHAR2, pnParameterValue IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN
        UPDATE PARAMETER_TABLE
        SET parameter_name = pcParameterName,
        parameter_value = pnParameterValue
        WHERE id_parameter = pnIdParameter;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdParameter');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setParameterColumns;

-- Procedure to delete a specific parameter  
    PROCEDURE deleteParameter (pnIdParameter IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        DELETE FROM PARAMETER_TABLE
        WHERE id_parameter = pnIdParameter;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdParameter');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteParameter;

-- Procedure to insert a new parameter
    PROCEDURE insertParameter (pcParameterName IN VARCHAR2, pnParameterValue IN NUMBER) IS
    vmenError VARCHAR2(50);
    BEGIN 
        INSERT INTO PARAMETER_TABLE (id_parameter, parameter_name, parameter_value)
        VALUES (s_parameter.nextval, pcParameterName, pnParameterValue);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertParameter;

END ADMTables;
        
        
        
        


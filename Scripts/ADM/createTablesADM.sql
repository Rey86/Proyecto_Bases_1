--Table GeneralLog
CREATE TABLE GENERALLOG(
    id_generallog NUMBER(6) CONSTRAINT generallog_id_nn NOT NULL,
    scheme_name VARCHAR2(30) CONSTRAINT generallog_schemename_nn NOT NULL,
    table_name VARCHAR2(30) CONSTRAINT generallog_tablename_nn NOT NULL,
    column_name VARCHAR2(30) CONSTRAINT generallog_columnname_nn NOT NULL,
    modification_date DATE CONSTRAINT generallog_modificationdate_nn NOT NULL,
    currentValue varchar2 CONSTRAINT generallog_currentValue_nn NOT NULL,
    previousValue varchar2
    );
    
--Table Parameter
CREATE TABLE PARAMETER_TABLE(
    id_parameter NUMBER(6) CONSTRAINT parameter_id_nn NOT NULL,
    parameter_name VARCHAR2(30) CONSTRAINT parameter_name_nn NOT NULL,
    parameter_value NUMBER CONSTRAINT parameter_value_nn NOT NULL,
    date_creation DATE CONSTRAINT parameter_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT parameter_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification varchar2(15)
    );
--Table GeneralLog
CREATE TABLE GENERALLOG(
    id_generallog NUMBER(8) CONSTRAINT generallog_id_nn NOT NULL,
    scheme_name VARCHAR2(30) CONSTRAINT generallog_schemename_nn NOT NULL,
    table_name VARCHAR2(30) CONSTRAINT generallog_tablename_nn NOT NULL,
    column_name VARCHAR2(30) CONSTRAINT generallog_columnname_nn NOT NULL,
    modification_date DATE CONSTRAINT generallog_modificationdate_nn NOT NULL,
    currentValue VARCHAR2(20) CONSTRAINT generallog_currentValue_nn NOT NULL,
    previousValue VARCHAR2(20)
    );
--Comments
COMMENT ON TABLE GENERALLOG
    IS 'Table that register every change of value in the database';
COMMENT ON COLUMN
    GENERALLOG.id_generallog IS
    'Log identification number';
COMMENT ON COLUMN
    GENERALLOG.scheme_name IS
    'Name of scheme that underwent change';
COMMENT ON COLUMN
    GENERALLOG.table_name IS
    'Name of table that underwent change';
COMMENT ON COLUMN
    GENERALLOG.column_name IS
    'Name of column that underwent change';
COMMENT ON COLUMN
    GENERALLOG.modification_date IS
    'Date of the modification';
COMMENT ON COLUMN
    GENERALLOG.currentValue IS
    'Actual value';
COMMENT ON COLUMN
    GENERALLOG.previousValue IS
    'Old value';
    
--Table Parameter
CREATE TABLE PARAMETER_TABLE(
    id_parameter NUMBER(8) CONSTRAINT parameter_id_nn NOT NULL,
    parameter_name VARCHAR2(30) CONSTRAINT parameter_name_nn NOT NULL,
    parameter_value NUMBER CONSTRAINT parameter_value_nn NOT NULL,
    date_creation DATE CONSTRAINT parameter_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT parameter_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE PARAMETER_TABLE
    IS 'Table that stores parameters for querys';
COMMENT ON COLUMN
    PARAMETER_TABLE.id_parameter IS
    'Parameter identification number';
COMMENT ON COLUMN
    PARAMETER_TABLE.parameter_name IS
    'Parameter name';
COMMENT ON COLUMN
    PARAMETER_TABLE.parameter_value IS
    'Parameter value';
COMMENT ON COLUMN
    PARAMETER_TABLE.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    PARAMETER_TABLE.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    PARAMETER_TABLE.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    PARAMETER_TABLE.user_last_modification IS
    'Last user who modified it';
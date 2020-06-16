-- Insert and Update Triggers of PARAMETER_TABLE table.

CREATE OR REPLACE TRIGGER TR.beforeInsertParameter
    BEFORE INSERT
    ON TR.PARAMETER_TABLE
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertParameter;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateParameter
    BEFORE UPDATE
    ON TR.PARAMETER_TABLE
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateParameter;
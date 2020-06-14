-- Insert and Update Triggers of PERSON table.

CREATE OR REPLACE TRIGGER PRSN.beforeInsertPerson
    BEFORE INSERT
    ON PRSN.PERSON
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertPerson;
    
CREATE OR REPLACE TRIGGER PRSN.beforeUpdatePerson
    BEFORE UPDATE
    ON PRSN.PERSON
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdatePerson;
    
-- Insert and Update Triggers of COMPANY table.

CREATE OR REPLACE TRIGGER PRSN.beforeInsertCompany
    BEFORE INSERT
    ON PRSN.COMPANY
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertCompany;
    
CREATE OR REPLACE TRIGGER PRSN.beforeUpdateCompany
    BEFORE UPDATE
    ON PRSN.COMPANY
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateCompany;
    
-- Insert and Update Triggers of GENDER table.

CREATE OR REPLACE TRIGGER PRSN.beforeInsertGender
    BEFORE INSERT
    ON PRSN.GENDER
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertGender;
    
CREATE OR REPLACE TRIGGER PRSN.beforeUpdateGender
    BEFORE UPDATE
    ON PRSN.GENDER
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateGender;
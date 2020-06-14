-- Insert and Update Triggers of USERAPP table.

CREATE OR REPLACE TRIGGER US.beforeInsertUserApp
    BEFORE INSERT
    ON US.USERAPP
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertUserApp;
    
CREATE OR REPLACE TRIGGER US.beforeUpdateUserApp
    BEFORE UPDATE
    ON US.USERAPP
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateUserApp;
    
-- Insert and Update Triggers of USERTYPE table.

CREATE OR REPLACE TRIGGER US.beforeInsertUserType
    BEFORE INSERT
    ON US.USERTYPE
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertUserType;
    
CREATE OR REPLACE TRIGGER US.beforeUpdateUserType
    BEFORE UPDATE
    ON US.USERTYPE
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateUserType;
    
-- Insert and Update Triggers of BANREASON table.

CREATE OR REPLACE TRIGGER US.beforeInsertBanReason
    BEFORE INSERT
    ON US.BANREASON
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertBanReason;
    
CREATE OR REPLACE TRIGGER US.beforeUpdateBanReason
    BEFORE UPDATE
    ON US.BANREASON
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateBanReason;
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
    
-- Insert and Update Triggers of BANREASONXUSERAPP table.

CREATE OR REPLACE TRIGGER US.beforeInsertBanReasonxUserApp
    BEFORE INSERT
    ON US.BANREASONXUSERAPP
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertBanReasonxUserApp;
    
CREATE OR REPLACE TRIGGER US.beforeUpdateBanReasonUserApp
    BEFORE UPDATE
    ON US.BANREASONXUSERAPP
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateBanReasonxUserApp;
    
-- Trigger to fill GENERALLOG table in admscheme.

CREATE OR REPLACE TRIGGER US.beforeUpdateUserPassword
    BEFORE INSERT OR UPDATE OF user_password
    ON USERAPP
    for each row
    BEGIN
        INSERT INTO GENERALLOG
        (id_generallog, scheme_name, table_name, column_name, modification_date, previous_value ,current_value)
        VALUES (s_generallog.nextval, 'US', 'USERAPP', 'USER_PASSWORD', SYSDATE, :old.user_password, :new.user_password);
    END beforeUpdateUserPassword;
        
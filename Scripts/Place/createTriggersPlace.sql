-- Insert and Update Triggers of COMMUNITY table.

CREATE OR REPLACE TRIGGER Place.beforeInsertCommunity
    BEFORE INSERT
    ON Place.COMMUNITY
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertCommunity;
    
CREATE OR REPLACE TRIGGER Place.beforeUpdateCommunity
    BEFORE UPDATE
    ON Place.COMMUNITY
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateCommunity;
    
-- Insert and Update Triggers of DISTRICT table.

CREATE OR REPLACE TRIGGER Place.beforeInsertDistrict
    BEFORE INSERT
    ON Place.DISTRICT
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertDistrict;
    
CREATE OR REPLACE TRIGGER Place.beforeUpdateDistrict
    BEFORE UPDATE
    ON Place.DISTRICT
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateDistrict;
    
-- Insert and Update Triggers of CANTON table.

CREATE OR REPLACE TRIGGER Place.beforeInsertCanton
    BEFORE INSERT
    ON Place.CANTON
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertCanton;
    
CREATE OR REPLACE TRIGGER Place.beforeUpdateCanton
    BEFORE UPDATE
    ON Place.CANTON
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateCanton;
    
-- Insert and Update Triggers of PROVINCE table.

CREATE OR REPLACE TRIGGER Place.beforeInsertProvince
    BEFORE INSERT
    ON Place.PROVINCE
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertProvince;
    
CREATE OR REPLACE TRIGGER Place.beforeUpdateProvince
    BEFORE UPDATE
    ON Place.PROVINCE
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateProvince;
    
-- Insert and Update Triggers of COUNTRY table.

CREATE OR REPLACE TRIGGER Place.beforeInsertCountry
    BEFORE INSERT
    ON Place.COUNTRY
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertCountry;
    
CREATE OR REPLACE TRIGGER Place.beforeUpdateCountry
    BEFORE UPDATE
    ON Place.COUNTRY
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateCountry;
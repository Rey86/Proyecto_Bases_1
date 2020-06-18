-- Insert and Update Triggers of TRANSCRIPT table.

CREATE OR REPLACE TRIGGER TR.beforeInsertTranscript
    BEFORE INSERT
    ON TR.TRANSCRIPT
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertTranscript;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateTranscript
    BEFORE UPDATE
    ON TR.TRANSCRIPT
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateTranscript;
    
-- Insert and Update Triggers of TRANSCRIPTTYPE table.

CREATE OR REPLACE TRIGGER TR.beforeInsertTranscriptType
    BEFORE INSERT
    ON TR.TRANSCRIPTTYPE
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertTranscriptType;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateTranscriptType
    BEFORE UPDATE
    ON TR.TRANSCRIPTTYPE
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateTranscriptType;
    
-- Insert and Update Triggers of ACCUSED table.

CREATE OR REPLACE TRIGGER TR.beforeInsertAccused
    BEFORE INSERT
    ON TR.ACCUSED
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertAccused;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateAccused
    BEFORE UPDATE
    ON TR.ACCUSED
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateAccused;
    
-- Insert and Update Triggers of VERDICT table.

CREATE OR REPLACE TRIGGER TR.beforeInsertVerdict
    BEFORE INSERT
    ON TR.VERDICT
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertVerdict;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateVerdict
    BEFORE UPDATE
    ON TR.VERDICT
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateVerdict;
    
-- Insert and Update Triggers of SENTENCE table.

CREATE OR REPLACE TRIGGER TR.beforeInsertSentence
    BEFORE INSERT
    ON TR.SENTENCE
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertSentence;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateSentence
    BEFORE UPDATE
    ON TR.SENTENCE
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateSentence;
    
-- Insert and Update Triggers of SENTENCETYPE table.

CREATE OR REPLACE TRIGGER TR.beforeInsertSentenceType
    BEFORE INSERT
    ON TR.SENTENCETYPE
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertSentenceType;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateSentenceType
    BEFORE UPDATE
    ON TR.SENTENCETYPE
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateSentenceType;
    
-- Insert and Update Triggers of CRIME table.

CREATE OR REPLACE TRIGGER TR.beforeInsertCrime
    BEFORE INSERT
    ON TR.CRIME
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertCrime;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdateCrime
    BEFORE UPDATE
    ON TR.CRIME
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdateCrime;
    
-- Insert and Update Triggers of PHOTO table.

CREATE OR REPLACE TRIGGER TR.beforeInsertPhoto
    BEFORE INSERT
    ON TR.PHOTO
    For each row
    BEGIN
        :new.user_creation:=USER;
        :new.date_creation:=SYSDATE;
    END beforeInsertPhoto;
    
CREATE OR REPLACE TRIGGER TR.beforeUpdatePhoto
    BEFORE UPDATE
    ON TR.PHOTO
    For each row
    BEGIN
        :new.user_last_modification:=USER;
        :new.date_last_modification:=SYSDATE;
    END beforeUpdatePhoto;
    
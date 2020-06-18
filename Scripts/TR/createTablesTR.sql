-- Table Transcript
CREATE TABLE TRANSCRIPT(
    valid NUMBER(1) CONSTRAINT transcript_valid_nn NOT NULL,
    transcript_number VARCHAR2(15) CONSTRAINT transcript_number_nn NOT NULL,
    username VARCHAR2(30) CONSTRAINT transcript_username_nn NOT NULL, 
    id_accused VARCHAR2(20) CONSTRAINT transcript_idaccused_nn NOT NULL,
    id_transcripttype NUMBER(8) CONSTRAINT transcript_idtranscripttype_nn NOT NULL,
    id_verdict NUMBER(8) CONSTRAINT transcript_idverdict_nn NOT NULL,
    id_community NUMBER(8) CONSTRAINT transcript_idcommunity_nn NOT NULL,
    id_sentence NUMBER(8) CONSTRAINT transcript_idsentence_nn NOT NULL,
    id_crime NUMBER(8) CONSTRAINT transcript_idcrime_nn NOT NULL,
    due_date DATE CONSTRAINT transcript_duedate_nn NOT NULL,
    date_creation DATE CONSTRAINT transcript_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT transcript_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
-- Table TranscriptType
CREATE TABLE TRANSCRIPTTYPE(
    id_transcripttype NUMBER(8) CONSTRAINT transcripttype_id_nn NOT NULL,
    transcripttype_name VARCHAR2(30) CONSTRAINT transcripttype_name_nn NOT NULL,
    date_creation DATE CONSTRAINT transcripttype_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT transcripttype_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
-- Table Accused
CREATE TABLE ACCUSED(
    id_accused VARCHAR2(20) CONSTRAINT accused_id_nn NOT NULL,
    id_company NUMBER(8) CONSTRAINT accused_idcompany_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT accused_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT accused_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT accused_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT accused_birthdate_nn NOT NULL, 
    id_gender NUMBER(8) CONSTRAINT accused_idgender_nn NOT NULL,
    date_creation DATE CONSTRAINT accused_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT accused_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );

-- Table Verdict
CREATE TABLE VERDICT(
    id_verdict NUMBER(8) CONSTRAINT verdict_id_nn NOT NULL,
    verdict_name VARCHAR2(30) CONSTRAINT verdict_name_nn NOT NULL,
    date_creation DATE CONSTRAINT verdict_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT verdict_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
--Table Sentence
CREATE TABLE SENTENCE(
    id_sentence NUMBER(8) CONSTRAINT sentence_id_nn NOT NULL,
    sentence_name VARCHAR2(30) CONSTRAINT sentence_name_nn NOT NULL,
    start_date DATE CONSTRAINT sentence_startdate_nn NOT NULL,
    end_date DATE CONSTRAINT sentence_enddate_nn NOT NULL,
    id_sentencetype NUMBER(8) CONSTRAINT sentence_typeid_nn NOT NULL,
    date_creation DATE CONSTRAINT sentence_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT sentence_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );  
    
--Table SentenceType
CREATE TABLE SENTENCETYPE(
    id_sentencetype NUMBER(8) CONSTRAINT sentencetype_id_nn NOT NULL,
    sentencetype_name VARCHAR2(30) CONSTRAINT sentencetype_name_nn NOT NULL,
    date_creation DATE CONSTRAINT sentencetype_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT sentencetype_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
--Table Crime
CREATE TABLE CRIME(
    id_crime NUMBER(8) CONSTRAINT crime_id_nn NOT NULL,
    crime_name VARCHAR2(30) CONSTRAINT crime_name_nn NOT NULL,
    date_creation DATE CONSTRAINT crime_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT crime_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
    
--Table Photo
CREATE TABLE PHOTO(
    id_photo NUMBER(8) CONSTRAINT photo_id_nn NOT NULL,
    direction VARCHAR2 CONSTRAINT photo_direction_nn NOT NULL,
    photo_description VARCHAR2 CONSTRAINT photo_description_nn NOT NULL,
    id_accused VARCHAR2(20) CONSTRAINT photo_accusedId_nn NOT NULL,
    date_creation DATE CONSTRAINT photo_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT photo_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
);
-- Table Transcript
CREATE TABLE TRANSCRIPT(
    valid BOOLEAN DEFAULT TRUE,
    transcript_number VARCHAR2(15) CONSTRAINT transcript_number_nn NOT NULL,
    username VARCHAR2(30) CONSTRAINT transcript_username_nn NOT NULL, 
    id_accused VARCHAR2(20) CONSTRAINT transcript_idaccused_nn NOT NULL,
    id_transcripttype NUMBER(6) CONSTRAINT transcript_idtranscripttype_nn NOT NULL,
    id_veredict NUMBER(6) CONSTRAINT transcript_idveredict_nn NOT NULL,
    id_community NUMBER(6) CONSTRAINT transcript_idcommunity_nn NOT NULL,
    id_sentence NUMBER(6) CONSTRAINT transcript_idsentence_nn NOT NULL,
    id_crime NUMBER(6) CONSTRAINT transcript_idcrime_nn NOT NULL,
    due_date DATE CONSTRAINT transcript_duedate_nn NOT NULL,
    date_creation DATE CONSTRAINT transcript_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT transcript_usercreation_nn NOT NULL,
    date_last_modification DATE CONSTRAINT transcript_datelastmod_nn NOT NULL,
    user_last_modification varchar2(15) CONSTRAINT transcript_userlastmod_nn NOT NULL
    );
    
-- Table ProceedingsType
CREATE TABLE TRANSCRIPTTYPE(
    id_transcripttype NUMBER(6) CONSTRAINT transcripttype_id_nn NOT NULL,
    transcripttype_name VARCHAR2(30) CONSTRAINT transcripttype_name_nn NOT NULL,
    date_creation DATE CONSTRAINT transcripttype_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT transcripttype_usercreation_nn NOT NULL,
    date_last_modification DATE CONSTRAINT transcripttype_datelastmod_nn NOT NULL,
    user_last_modification varchar2(15) CONSTRAINT transcripttype_userlastmod_nn NOT NULL
    );
    
-- Table Accused
CREATE TABLE ACCUSED(
    id_accused VARCHAR2(20) CONSTRAINT accused_id_nn NOT NULL,
    id_company NUMBER(6) CONSTRAINT accused_idcompany_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT accused_firstname_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT accused_lastname_nn NOT NULL,
    second_last_name VARCHAR2(25) CONSTRAINT accused_secondlastname_nn NOT NULL,
    birthdate DATE CONSTRAINT accused_birthdate_nn NOT NULL, 
    id_gender NUMBER(6) CONSTRAINT accused_idgender_nn NOT NULL,
    date_creation DATE CONSTRAINT accused_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT accused_usercreation_nn NOT NULL,
    date_last_modification DATE CONSTRAINT accused_datelastmod_nn NOT NULL,
    user_last_modification varchar2(15) CONSTRAINT accused_userlastmod_nn NOT NULL
    );

-- Table Veredict
CREATE TABLE VERDICT(
    id_veredict NUMBER(6) CONSTRAINT veredict_id_nn NOT NULL,
    veredict_name VARCHAR2(30) CONSTRAINT veredict_name_nn NOT NULL,
    date_creation DATE CONSTRAINT veredict_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT veredict_usercreation_nn NOT NULL,
    date_last_modification DATE CONSTRAINT veredict_datelastmod_nn NOT NULL,
    user_last_modification varchar2(15) CONSTRAINT veredict_userlastmod_nn NOT NULL
    );
    
--Table Sentence
CREATE TABLE SENTENCE(
    id_sentence NUMBER(6) CONSTRAINT sentence_id_nn NOT NULL,
    sentence_name VARCHAR2(30) CONSTRAINT sentence_name_nn NOT NULL,
    start_date DATE CONSTRAINT sentence_startdate_nn NOT NULL,
    end_date DATE CONSTRAINT sentence_enddate_nn NOT NULL,
    id_sentencetype NUMBER(6) CONSTRAINT sentence_typeid_nn NOT NULL,
    date_creation DATE CONSTRAINT sentence_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT sentence_usercreation_nn NOT NULL,
    date_last_modification DATE CONSTRAINT sentence_datelastmod_nn NOT NULL,
    user_last_modification varchar2(15) CONSTRAINT sentence_userlastmod_nn NOT NULL
    );  
    
--Table SentenceType
CREATE TABLE SENTENCETYPE(
    id_sentencetype NUMBER(6) CONSTRAINT sentencetype_id_nn NOT NULL,
    sentencetype_name VARCHAR2(30) CONSTRAINT sentencetype_name_nn NOT NULL,
    date_creation DATE CONSTRAINT sentencetype_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT sentencetype_usercreation_nn NOT NULL,
    date_last_modification DATE CONSTRAINT sentencetype_datelastmod_nn NOT NULL,
    user_last_modification varchar2(15) CONSTRAINT sentencetype_userlastmod_nn NOT NULL
    );
    
--Table Crime
CREATE TABLE CRIME(
    id_crime NUMBER(6) CONSTRAINT crime_id_nn NOT NULL,
    crime_name VARCHAR2(30) CONSTRAINT crime_name_nn NOT NULL,
    date_creation DATE CONSTRAINT crime_datecreation_nn NOT NULL,
    user_creation varchar2(15) CONSTRAINT crime_usercreation_nn NOT NULL,
    date_last_modification DATE CONSTRAINT crime_datelastmod_nn NOT NULL,
    user_last_modification varchar2(15) CONSTRAINT crime_userlastmod_nn NOT NULL
    );
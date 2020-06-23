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
--Comments
COMMENT ON TABLE TRANSCRIPT
    IS 'Table that stores data of transcripts';
COMMENT ON COLUMN
    TRANSCRIPT.valid IS
    'It shows if a transcript is valid';
COMMENT ON COLUMN
    TRANSCRIPT.transcript_number IS
    'Identification code of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.username IS
    'Identification name of the user who created the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.id_accused IS
    'Identification number of the accused of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.id_transcripttype IS
    'Identification number of the transcript type of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.id_verdict IS
    'Identification number of the verdict of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.id_community IS
    'Identification number of the community of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.id_sentence IS
    'Identification number of the sentence of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.id_crime IS
    'Identification number of the crime of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.due_date IS
    'Date of due of the transcript';
COMMENT ON COLUMN
    TRANSCRIPT.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    TRANSCRIPT.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    TRANSCRIPT.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    TRANSCRIPT.user_last_modification IS
    'Last user who modified it';
    
-- Table TranscriptType
CREATE TABLE TRANSCRIPTTYPE(
    id_transcripttype NUMBER(8) CONSTRAINT transcripttype_id_nn NOT NULL,
    transcripttype_name VARCHAR2(30) CONSTRAINT transcripttype_name_nn NOT NULL,
    date_creation DATE CONSTRAINT transcripttype_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT transcripttype_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE TRANSCRIPTTYPE
    IS 'Table that stores data of transcript types';
COMMENT ON COLUMN
    TRANSCRIPTTYPE.id_transcripttype IS
    'Identification number of the transcript type';
COMMENT ON COLUMN
    TRANSCRIPTTYPE.transcripttype_name IS
    'Name of the transcript type';
COMMENT ON COLUMN
    TRANSCRIPTTYPE.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    TRANSCRIPTTYPE.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    TRANSCRIPTTYPE.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    TRANSCRIPTTYPE.user_last_modification IS
    'Last user who modified it';
    
-- Table Accused
CREATE TABLE ACCUSED(
    id_accused VARCHAR2(20) CONSTRAINT accused_id_nn NOT NULL,
    date_creation DATE CONSTRAINT accused_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT accused_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE ACCUSED
    IS 'Table that stores data of accused';
COMMENT ON COLUMN
    ACCUSED.id_accused IS
    'Identification number of the accused';
COMMENT ON COLUMN
    ACCUSED.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    ACCUSED.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    ACCUSED.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    ACCUSED.user_last_modification IS
    'Last user who modified it';

-- Table Verdict
CREATE TABLE VERDICT(
    id_verdict NUMBER(8) CONSTRAINT verdict_id_nn NOT NULL,
    verdict_name VARCHAR2(30) CONSTRAINT verdict_name_nn NOT NULL,
    date_creation DATE CONSTRAINT verdict_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT verdict_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE VERDICT
    IS 'Table that stores data of verdicts';
COMMENT ON COLUMN
    VERDICT.id_verdict IS
    'Identification number of the verdict';
COMMENT ON COLUMN
    VERDICT.verdict_name IS
    'Name of the verdict';
COMMENT ON COLUMN
    VERDICT.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    VERDICT.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    VERDICT.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    VERDICT.user_last_modification IS
    'Last user who modified it';

--Table Sentence
CREATE TABLE SENTENCE(
    id_sentence NUMBER(8) CONSTRAINT sentence_id_nn NOT NULL,
    start_date DATE,
    end_date DATE,
    id_sentencetype NUMBER(8) CONSTRAINT sentence_typeid_nn NOT NULL,
    date_creation DATE CONSTRAINT sentence_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT sentence_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE SENTENCE
    IS 'Table that stores data of sentences';
COMMENT ON COLUMN
    SENTENCE.id_sentence IS
    'Identification number of the sentence';
COMMENT ON COLUMN
    SENTENCE.start_date IS
    'Date when sentence begins';
COMMENT ON COLUMN
    SENTENCE.end_date IS
    'Date when sentence ends';
COMMENT ON COLUMN
    SENTENCE.id_sentencetype IS
    'Identification number of sentence type of the sentence';
COMMENT ON COLUMN
    SENTENCE.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    SENTENCE.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    SENTENCE.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    SENTENCE.user_last_modification IS
    'Last user who modified it';  
    
--Table SentenceType
CREATE TABLE SENTENCETYPE(
    id_sentencetype NUMBER(8) CONSTRAINT sentencetype_id_nn NOT NULL,
    sentencetype_name VARCHAR2(30) CONSTRAINT sentencetype_name_nn NOT NULL,
    date_creation DATE CONSTRAINT sentencetype_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT sentencetype_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE SENTENCETYPE
    IS 'Table that stores data of sentence types';
COMMENT ON COLUMN
    SENTENCETYPE.id_sentencetype IS
    'Identification number of the sentence type';
COMMENT ON COLUMN
    SENTENCETYPE.sentencetype_name IS
    'Name of the sentence type';
COMMENT ON COLUMN
    SENTENCETYPE.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    SENTENCETYPE.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    SENTENCETYPE.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    SENTENCETYPE.user_last_modification IS
    'Last user who modified it';
    
--Table Crime
CREATE TABLE CRIME(
    id_crime NUMBER(8) CONSTRAINT crime_id_nn NOT NULL,
    crime_description VARCHAR2(100) CONSTRAINT crime_description_nn NOT NULL,
    crime_date DATE CONSTRAINT crime_date_nn NOT NULL, 
    date_creation DATE CONSTRAINT crime_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT crime_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
    );
--Comments
COMMENT ON TABLE CRIME
    IS 'Table that stores data of crimes';
COMMENT ON COLUMN
    CRIME.id_crime IS
    'Identification number of the crime';
COMMENT ON COLUMN
    CRIME.crime_description IS
    'Description of the crime';
COMMENT ON COLUMN
    CRIME.crime_date IS
    'Date of the crime';
COMMENT ON COLUMN
    CRIME.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    CRIME.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    CRIME.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    CRIME.user_last_modification IS
    'Last user who modified it';
    
--Table Photo
CREATE TABLE PHOTO(
    id_photo NUMBER(8) CONSTRAINT photo_id_nn NOT NULL,
    direction VARCHAR2(100) CONSTRAINT photo_direction_nn NOT NULL,
    photo_description VARCHAR2(30) CONSTRAINT photo_description_nn NOT NULL,
    id_accused VARCHAR2(20) CONSTRAINT photo_accusedId_nn NOT NULL,
    date_creation DATE CONSTRAINT photo_datecreation_nn NOT NULL,
    user_creation VARCHAR2(15) CONSTRAINT photo_usercreation_nn NOT NULL,
    date_last_modification DATE,
    user_last_modification VARCHAR2(15)
);
--Comments
COMMENT ON TABLE PHOTO
    IS 'Table that stores data of photos';
COMMENT ON COLUMN
    PHOTO.id_photo IS
    'Identification number of the photo';
COMMENT ON COLUMN
    PHOTO.direction IS
    'Direction of the photo';
COMMENT ON COLUMN
    PHOTO.photo_description IS
    'Description of the photo';
COMMENT ON COLUMN
    PHOTO.id_accused IS
    'Identification number of the accused in the photo';
COMMENT ON COLUMN
    PHOTO.date_creation IS
    'Date of creation';
COMMENT ON COLUMN
    PHOTO.user_creation IS
    'User who created it';
COMMENT ON COLUMN
    PHOTO.date_last_modification IS
    'Date of the last modification';
COMMENT ON COLUMN
    PHOTO.user_last_modification IS
    'Last user who modified it';
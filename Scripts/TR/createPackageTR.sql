-- Package to TR procedures and functions.
CREATE OR REPLACE PACKAGE TRTables IS
    -- Transcript Table
    PROCEDURE getTranscript (pcTranscriptNumber VARCHAR2);
    PROCEDURE setTranscript (pcTranscriptNumber VARCHAR2, pnValid NUMBER, pcUserName VARCHAR2, pcIdAccused VARCHAR2, 
        pnIdTranscriptType NUMBER, pnIdVerdict NUMBER, pnIdCommunity NUMBER, pnIdSentence NUMBER, pnIdCrime NUMBER, pdDueDate DATE);
    PROCEDURE deleteTranscript (pcTranscriptNumber VARCHAR2);
    PROCEDURE insertTranscript (pcTranscriptNumber VARCHAR2, pnValid NUMBER, pcUserName VARCHAR2, pcIdAccused VARCHAR2, 
        pnIdTranscriptType NUMBER, pnIdVerdict NUMBER, pnIdCommunity NUMBER, pnIdSentence NUMBER, pnIdCrime NUMBER, pdDueDate DATE);
    -- TranscriptType Table
    PROCEDURE getTranscriptType (pnIdTranscriptType NUMBER);
    PROCEDURE setTranscriptType (pnIdTranscriptType NUMBER, pcTranscriptTypeName VARCHAR2);
    PROCEDURE deleteTranscriptType (pnIdTranscriptType NUMBER);
    PROCEDURE insertTranscriptType (pcTranscriptTypeName VARCHAR2);
    -- Accused Table 
    PROCEDURE getAccused (pcIdAccused VARCHAR2);
    PROCEDURE setAccused (pcIdAccused VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, 
        pcSecondLastName VARCHAR2, pdBirthdate DATE, pnIdGender NUMBER, pnIdCompany NUMBER);
    PROCEDURE deleteAccused (pcIdAccused VARCHAR2);
    PROCEDURE insertAccused (pcIdAccused VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, 
        pdBirthdate DATE, pnIdGender NUMBER, pnIdCompany NUMBER);
    -- Verdict Table
    PROCEDURE getVerdict (pnIdVerdict NUMBER);
    PROCEDURE setVerdict (pnIdVerdict NUMBER, pcVerdictName VARCHAR2);
    PROCEDURE deleteVerdict (pnIdVerdict NUMBER);
    PROCEDURE insertVerdict (pcVerdictName VARCHAR2);
    -- Sentence Table
    PROCEDURE getSentence (pnIdSentence NUMBER);
    PROCEDURE setSentence (pnIdSentence NUMBER, pcSentenceName VARCHAR2, pdStartDate DATE, pdEndDate DATE, pnIdSentenceType NUMBER);
    PROCEDURE deleteSentence (pnIdSentence NUMBER);
    PROCEDURE insertSentence (pcSentenceName VARCHAR2, pdStartDate DATE, pdEndDate DATE, pnIdSentenceType NUMBER);
    -- SentenceType Table
    PROCEDURE getSentenceType (pnIdSentenceType NUMBER);
    PROCEDURE setSentenceType (pnIdSentenceType NUMBER, pcSentenceTypeName VARCHAR2);
    PROCEDURE deleteSentenceType (pnIdSentenceType NUMBER);
    PROCEDURE insertSentenceType (pcSentenceTypeName VARCHAR2);
    -- Crime Table
    PROCEDURE getCrime (pnIdCrime NUMBER);
    PROCEDURE setCrime (pnIdCrime NUMBER, pcCrimeName VARCHAR2, pdCrimeDate DATE);
    PROCEDURE deleteCrime (pnIdCrime NUMBER);
    PROCEDURE insertCrime (pcCrimeName VARCHAR2, pdCrimeDate DATE);
    -- Photo Table
    PROCEDURE getPhoto (pnIdPhoto NUMBER);
    PROCEDURE setPhoto (pnIdPhoto NUMBER, pcPhotoDescription VARCHAR2, pcDirection VARCHAR2, pcIdAccused VARCHAR2);
    PROCEDURE deletePhoto (pnIdPhoto NUMBER);
    PROCEDURE insertPhoto (pcPhotoDescription VARCHAR2, pcDirection VARCHAR2, pcIdAccused VARCHAR2);
END PlaceTables;

CREATE OR REPLACE PACKAGE BODY TRTables AS
-- TranscriptType Table
-- Function to get a transcript type with specific id to show it in the screen      
    PROCEDURE getTranscriptType (pnIdTranscriptType IN NUMBER) AS
    CURSOR transcripttype(pnIdTranscript IN NUMBER)
    IS
        SELECT id_transcripttype, transcripttype_name
        FROM TRANSCRIPTTYPE
        WHERE id_transcripttype = NVL(pnIdTranscriptType, id_transcripttype);
    BEGIN 
        FOR i in transcripttype(pnIdTranscriptType) LOOP
            dbms_output.put_line(i.id_transcripttype);
            dbms_output.put_line(i.transcripttype_name);
        END LOOP;
    END getTranscriptType;

-- Procedure to set a transcript type with specific id and the new values wrote by the user  
    PROCEDURE setTranscriptType (pnIdTranscriptType IN NUMBER, pcTranscriptTypeName IN VARCHAR2) IS
    BEGIN
        UPDATE TRANSCRIPTTYPE
        SET transcripttype_name = pcTranscriptTypeName
        WHERE id_transcripttype = pnIdTranscriptType;
        Commit;
    END setTranscriptType;

-- Procedure to delete a specific transcript type  
    PROCEDURE deleteTranscriptType (pnIdTranscriptType IN NUMBER) IS
    BEGIN 
        DELETE FROM TRANSCRIPTTYPE
        WHERE id_transcripttype = pnIdTranscriptType;
        Commit;
    END deleteTranscriptType;

-- Procedure to insert a new transcript type
    PROCEDURE insertTranscriptType (pcTranscriptTypeName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO TRANSCRIPTTYPE (id_transcripttype, transcripttype_name)
        VALUES (s_transcripttype, pcTranscriptTypeName);
        Commit;
    END insertTranscriptType;
END TRTables;
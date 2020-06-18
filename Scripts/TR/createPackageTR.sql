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
-- Table Transcript
-- Function to get a transcript with specific number to show it in the screen      
    PROCEDURE getTranscript (pcTranscriptNumber IN VARCHAR2) AS
    CURSOR transcript(pcTranscriptNumber IN VARCHAR2)
    IS
        SELECT valid valid, transcript_number transcript_number, username username, 
            first_name||' '||last_name||' '||second_last_name accused_name,  transcripttype_name transcripttype_name, 
            verdict_name verdict_name, community_name 
        FROM (SELECT p.id_person, p.first_name, p.last_name, p.second_last_name, p.birthdate, p.id_gender, c.company_name
              FROM PERSON p
              INNER JOIN COMPANY c
              ON p.id_company = c.id_company) pc
        INNER JOIN GENDER g
        ON pc.id_gender = g.id_gender
        WHERE pc.id_person = NVL(pcIdPerson, pc.id_person);
    BEGIN 
        FOR i in person(pnIdPerson) LOOP
            dbms_output.put_line(i.id_person);
            dbms_output.put_line(i.first_name);
            dbms_output.put_line(i.last_name);
            dbms_output.put_line(i.second_last_name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.gender_name);
            dbms_output.put_line(i.company_name);
        END LOOP;
    END getPerson;
END TRTables;
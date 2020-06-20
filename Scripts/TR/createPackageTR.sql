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
-- Transcript Table
    -- Function to get a transcript with specific number to show it in the screen      
    PROCEDURE getTranscript (pcTranscriptNumber IN VARCHAR2) AS
    CURSOR transcript(pcTranscriptNumber IN VARCHAR2)
    IS
        SELECT t.transcript_number transcript_number, t.valid valid, t.username username, 
            a.first_name||' '||a.last_name||' '||a.second_last_name accused_name, tt.transcripttype_name transcripttype_name, 
            v.verdict_name verdict_name, c.community_name community_name, s.sentence_name sentence_name, s.start_date sentence_start_date,
            s.end_date sentence_end_date, st.sentencetype_name sentencetype_name, cr.crime_name crime_name, cr.crime_date crime_date,
            t.due_date due_date
        FROM TRANSCRIPT t
        INNER JOIN ACCUSED a
        ON t.id_accused = a.id_accused 
        INNER JOIN TRANSCRIPTTYPE tt
        ON t.id_transcripttype = tt.id_transcripttype
        INNER JOIN VERDICT v
        ON t.id_verdict = v.id_verdict
        INNER JOIN COMMUNITY c
        ON t.id_community = c.id_community
        INNER JOIN SENTENCE s
        ON t.id_sentence = s.id_sentence
        INNER JOIN SENTENCETYPE st
        ON s.id_sentencetype = st.id_sentenceype 
        INNER JOIN CRIME cr
        ON t.id_crime = cr.id_crime
        WHERE t.transcript_number = NVL(pcTranscriptNumber , t.transcript_number);
    BEGIN 
        FOR i in transcript(pcTranscriptNumber) LOOP
            dbms_output.put_line(i.transcript_number);
            dbms_output.put_line(i.valid);
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.accused_name);
            dbms_output.put_line(i.transcripttype_name);
            dbms_output.put_line(i.verdict_name);
            dbms_output.put_line(i.community_name);
            dbms_output.put_line(i.sentence_name);
            dbms_output.put_line(i.sentence_start_date);
            dbms_output.put_line(i.sentence_end_date);
            dbms_output.put_line(i.sentencetype_name);
            dbms_output.put_line(i.crime_name);
            dbms_output.put_line(i.crime_date);
            dbms_output.put_line(i.due_date);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pcTranscriptNumber');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTranscript;

-- Procedure to set a transcript with specific number and the new values wrote by the user  
    PROCEDURE setTranscript (pcTranscriptNumber IN VARCHAR2, pnValid IN NUMBER, pcUserName IN VARCHAR2, pcIdAccused IN VARCHAR2, 
        pnIdTranscriptType IN NUMBER, pnIdVerdict IN NUMBER, pnIdCommunity IN NUMBER, pnIdSentence IN NUMBER, 
        pnIdCrime IN NUMBER, pdDueDate IN DATE) IS
    BEGIN
        UPDATE TRANSCRIPT
        SET valid = pnValid,
        username = pcUserName, 
        id_accused = pcIdAccused,
        id_transcripttype = pnIdtranscriptType,
        id_verdict = pnIdVerdict,
        id_community = pnIdCommunity,
        id_sentence = pnIdSentence,
        id_crime = pnIdCrime,
        due_date = pdDueDate;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcTranscriptNumber');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setTranscript;

-- Procedure to delete a specific transcript  
    PROCEDURE deleteTranscript (pcTranscriptNumber IN VARCHAR2) IS
    BEGIN 
        DELETE FROM TRANSCRIPT
        WHERE transcript_number = pcTranscriptNumber;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcTranscriptNumber');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteTranscript;

-- Procedure to insert a new transcript
    PROCEDURE insertTranscript (pcTranscriptNumber IN VARCHAR2, pnValid IN NUMBER, pcUserName IN VARCHAR2, pcIdAccused IN VARCHAR2, 
        pnIdTranscriptType IN NUMBER, pnIdVerdict IN NUMBER, pnIdCommunity IN NUMBER, pnIdSentence IN NUMBER, 
        pnIdCrime IN NUMBER, pdDueDate IN DATE) IS
    BEGIN 
        INSERT INTO TRANSCRIPT (transcript_number, valid, username, id_accused, id_transcripttype, id_verdict, id_community, id_sentence, 
        id_crime, due_date)
        VALUES (pcTranscriptNumber, pnValid, pcUserName, pcIdAccused, pnIdTranscriptType, pnIdVerdict, pnIdCommunity, pnIdSentence, 
        pnIdCrime, pdDueDate);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertTranscript;
    
-- TranscriptType Table
-- Function to get a transcript type with specific id to show it in the screen      
    PROCEDURE getTranscriptType (pnIdTranscriptType IN NUMBER) AS
    CURSOR transcripttype(pnIdTranscriptType IN NUMBER)
    IS
        SELECT id_transcripttype, transcripttype_name
        FROM TRANSCRIPTTYPE
        WHERE id_transcripttype = NVL(pnIdTranscriptType, id_transcripttype);
    BEGIN 
        FOR i in transcripttype(pnIdTranscriptType) LOOP
            dbms_output.put_line(i.id_transcripttype);
            dbms_output.put_line(i.transcripttype_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdTranscriptType');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTranscriptType;

-- Procedure to set a transcript type with specific id and the new values wrote by the user  
    PROCEDURE setTranscriptType (pnIdTranscriptType IN NUMBER, pcTranscriptTypeName IN VARCHAR2) IS
    BEGIN
        UPDATE TRANSCRIPTTYPE
        SET transcripttype_name = pcTranscriptTypeName
        WHERE id_transcripttype = pnIdTranscriptType;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdTranscriptType');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setTranscriptType;

-- Procedure to delete a specific transcript type  
    PROCEDURE deleteTranscriptType (pnIdTranscriptType IN NUMBER) IS
    BEGIN 
        DELETE FROM TRANSCRIPTTYPE
        WHERE id_transcripttype = pnIdTranscriptType;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdTranscriptType');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteTranscriptType;

-- Procedure to insert a new transcript type
    PROCEDURE insertTranscriptType (pcTranscriptTypeName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO TRANSCRIPTTYPE (id_transcripttype, transcripttype_name)
        VALUES (s_transcripttype.nextval, pcTranscriptTypeName);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertTranscriptType;
    
-- Table Accused
-- Function to get a accused with specific id to show it in the screen      
    PROCEDURE getAccused (pcIdAccused IN VARCHAR2) AS
    CURSOR accused(pnIdAccused IN VARCHAR2)
    IS
        SELECT a.id_accused id_accused, a.first_name first_name, a.last_name last_name, a.second_last_name second_last_name, 
            a.birthdate birthdate, g.gender_name gender_name, c.company_name company_name
        FROM ACCUSED a
        INNER JOIN COMPANY c
        ON a.id_company = c.id_company 
        INNER JOIN GENDER g
        ON a.id_gender = g.id_gender
        WHERE a.id_accused = NVL(pcIdAccused, a.id_accused);
    BEGIN 
        FOR i in accused(pnIdAccused) LOOP
            dbms_output.put_line(i.id_accused);
            dbms_output.put_line(i.first_name);
            dbms_output.put_line(i.last_name);
            dbms_output.put_line(i.second_last_name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.gender_name);
            dbms_output.put_line(i.company_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pcIdAccused');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAccused;

-- Procedure to set a accused with specific id and the new values wrote by the user  
    PROCEDURE setAccused (pcIdAccused IN VARCHAR2, pcFirstName IN VARCHAR2, pcLastName IN VARCHAR2, 
        pcSecondLastName IN VARCHAR2, pdBirthdate IN DATE, pnIdGender IN NUMBER, pnIdCompany IN NUMBER) IS
    BEGIN
        UPDATE ACCUSED
        SET first_name = pcFirstName,
        last_name = pcLastName,
        second_last_name = pcSecondLastName,
        birthdate = pdBirthdate,
        id_gender = pnIdGender,
        id_company = pnIdCompany
        WHERE id_accused = pcIdAccused;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcIdAccused');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setAccused;

-- Procedure to delete a specific accused  
    PROCEDURE deleteAccused (pcIdAccused IN VARCHAR2) IS
    BEGIN 
        DELETE FROM ACCUSED
        WHERE id_accused = pcIdAccused;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pcIdAccused');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteAccused;

-- Procedure to insert a new accused
    PROCEDURE insertAccused (pcIdAccused IN VARCHAR2, pcFirstName IN VARCHAR2, pcLastName IN VARCHAR2, pcSecondLastName IN VARCHAR2, 
        pdBirthdate IN DATE, pnIdGender IN NUMBER, pnIdCompany IN NUMBER) IS
    BEGIN 
        INSERT INTO ACCUSED (id_accused, first_name, lat_name, second_last_name, birthdate, id_gender, id_company)
        VALUES (pcIdAccused, pcFirstName, pcLastName, pcSecondLastName, pdBirthdate, pnIdGender, pnIdCompany);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertAccused;
    
--  Table Verdict
-- Function to get a verdict with specific id to show it in the screen      
    PROCEDURE getVerdict (pnIdVerdict IN NUMBER) AS
    CURSOR verdict(pnIdVerdict IN NUMBER)
    IS
        SELECT id_verdict, verdict_name
        FROM VERDICT
        WHERE id_verdict = NVL(pnIdVerdict, id_verdict);
    BEGIN 
        FOR i in verdict(pnIdVerdict) LOOP
            dbms_output.put_line(i.id_verdict);
            dbms_output.put_line(i.verdict_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdGVerdict');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getVerdict;

-- Procedure to set a verdict with specific id and the new values wrote by the user  
    PROCEDURE setVerdict (pnIdVerdict IN NUMBER, pcVerdictName IN VARCHAR2) IS
    BEGIN
        UPDATE VERDICT
        SET verdict_name = pcVerdictName
        WHERE id_verdict = pnIdVerdict;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdVerdict');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setVerdict;

-- Procedure to delete a specific verdict  
    PROCEDURE deleteVerdict (pnIdVerdict IN NUMBER) IS
    BEGIN 
        DELETE FROM VERDICT
        WHERE id_verdict = pnIdVerdict;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdVerdict');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteVerdict;

-- Procedure to insert a new verdict
    PROCEDURE insertVerdict (pcVerdictName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO VERDICT (id_verdict, verdict_name)
        VALUES (s_verdict.nextval, pcVerdictName);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertVerdict;
    
-- Table Sentence 
-- Function to get a sentence with specific id to show it in the screen      
    PROCEDURE getSentence (pnIdSentence IN NUMBER) AS
    CURSOR sentence(pnIdSentence IN NUMBER)
    IS
        SELECT s.id_sentence id_sentence, s.sentence_name sentence_name, s.start_date start_date, s.end_date end_date,  
            st.sentencetype_name sentencetype_name
        FROM SENTENCE s
        INNER JOIN SENTENCETYPE st
        ON s.id_sentencetype = st.id_sentencetype
        WHERE s.id_sentence = NVL(pnIdSentence, s.id_sentence);
    BEGIN 
        FOR i in sentence(pnIdSentence) LOOP
            dbms_output.put_line(i.id_sentence);
            dbms_output.put_line(i.sentence_name);
            dbms_output.put_line(i.start_date);
            dbms_output.put_line(i.end_date);
            dbms_output.put_line(i.sentencetype_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdSentence');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getSentence;

-- Procedure to set a sentence with specific id and the new values wrote by the user  
    PROCEDURE setSentence (pnIdSentence IN NUMBER, pcSentenceName IN VARCHAR2, pdStartDate IN DATE, 
        pdEndDate IN DATE, pnIdSentenceType IN NUMBER) IS
    BEGIN
        UPDATE SENTENCE
        SET sentence_name = pcSentenceName,
        start_date = pdStartDate,
        end_date = pdEndDate,
        id_sentencetype = pnIdSentenceType
        WHERE id_sentence = pnIdSentence;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdSentence');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setSentence;

-- Procedure to delete a specific sentence  
    PROCEDURE deleteSentence (pnIdSentence IN NUMBER) IS
    BEGIN 
        DELETE FROM SENTENCE
        WHERE id_sentence = pnIdSentence;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdSentence');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteSentence;

-- Procedure to insert a new sentence
    PROCEDURE insertSentence (pcSentenceName IN VARCHAR2, pdStartDate IN DATE, pdEndDate IN DATE, pnIdSentenceType IN NUMBER) IS
    BEGIN 
        INSERT INTO SENTENCE (id_sentence, sentence_name, start_date, end_date, id_sentencetype)
        VALUES (s_sentence.nextval, pdStartDate, pdEndDate, pcSentenceName, pnIdCanton);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertSentence;

-- Table SentenceType
-- Function to get a sentence type with specific id to show it in the screen      
    PROCEDURE getSentenceType (pnIdSentenceType IN NUMBER) AS
    CURSOR sentencetype(pnIdSentenceType IN NUMBER)
    IS
        SELECT id_sentencetype, sentencetype_name
        FROM SENTENCETYPE
        WHERE id_sentencetype = NVL(pnIdSentenceType, id_sentencetype);
    BEGIN 
        FOR i in sentencetype(pnIdSentenceType) LOOP
            dbms_output.put_line(i.id_sentencetype);
            dbms_output.put_line(i.sentencetype_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdSentenceType');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getSentenceType;

-- Procedure to set a sentence type with specific id and the new values wrote by the user  
    PROCEDURE setSentenceType (pnIdSentenceType IN NUMBER, pcSentenceTypeName IN VARCHAR2) IS
    BEGIN
        UPDATE SENTENCETYPE
        SET sentencetype_name = pcSentenceTypeName
        WHERE id_sentencetype = pnIdSentenceType;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdSentenceType');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setSentenceType;

-- Procedure to delete a specific sentence type  
    PROCEDURE deleteSentenceType (pnIdSentenceType IN NUMBER) IS
    BEGIN 
        DELETE FROM SENTENCETYPE
        WHERE id_sentencetype = pnIdSentenceType;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdSentenceType');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteSentenceType;

-- Procedure to insert a new sentence type
    PROCEDURE insertSentenceType (pcSentenceTypeName IN VARCHAR2) IS
    BEGIN 
        INSERT INTO SENTENCETYPE (id_sentencetype, sentencetype_name)
        VALUES (s_sentencetype.nextval, pcSentenceTypeName);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertSentenceType;

--  Table Crime
-- Function to get a crime with specific id to show it in the screen      
    PROCEDURE getCrime (pnIdCrime IN NUMBER) AS
    CURSOR crime(pnIdCrime IN NUMBER)
    IS
        SELECT id_crime, crime_name, crime_date
        FROM CRIME
        WHERE id_crime = NVL(pnIdCrime, id_crime);
    BEGIN 
        FOR i in crime(pnIdCrime) LOOP
            dbms_output.put_line(i.id_crime);
            dbms_output.put_line(i.crime_name);
            dbms_output.put_line(i.crime_date);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdCrime');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getCrime;

-- Procedure to set a crime with specific id and the new values wrote by the user  
    PROCEDURE setCrime (pnIdCrime IN NUMBER, pcCrimeName IN VARCHAR2, pdCrimeDate IN DATE) IS
    BEGIN
        UPDATE CRIME
        SET crime_name = pcCrimeName,
        crime_date = pdCrimeDate
        WHERE id_crime = pnIdCrime;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCrime');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setCrime;

-- Procedure to delete a specific crime  
    PROCEDURE deleteCrime (pnIdCrime IN NUMBER) IS
    BEGIN 
        DELETE FROM CRIME
        WHERE id_crime = pnIdCrime;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdCrime');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deleteCrime;

-- Procedure to insert a new crime
    PROCEDURE insertCrime (pcCrimeName IN VARCHAR2, pdCrimeDate IN DATE) IS
    BEGIN 
        INSERT INTO CRIME (id_crime, crime_name, crime_date)
        VALUES (s_crime.nextval, pcCrimeName, pdCrimeDate);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertCrime;

-- Table Photo
-- Function to get a photo with specific id to show it in the screen      
    PROCEDURE getPhoto (pnIdPhoto IN NUMBER) AS
    CURSOR photo(pnIdPhoto IN NUMBER)
    IS
        SELECT p.id_photo id_photo, p.photo_description photo_description, p.direction direction,  
        a.first_name||' '||a.last_name||' '||a.second_last_name accused_name
        FROM PHOTO p
        INNER JOIN ACCUSED a
        ON p.id_accused = a.id_accused
        WHERE a.id_photo = NVL(pnIdPhoto, a.id_photo);
    BEGIN 
        FOR i in photo(pnIdPhoto) LOOP
            dbms_output.put_line(i.id_photo);
            dbms_output.put_line(i.photo_description);
            dbms_output.put_line(i.direction);
            dbms_output.put_line(i.accused_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.');      
        when no_data_found then vmenError:= ('Couldn´t find register with the Index ||pnIdPhoto');
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getPhoto;

-- Procedure to set a photo with specific id and the new values wrote by the user  
    PROCEDURE setPhoto (pnIdPhoto IN NUMBER, pcPhotoDescription IN VARCHAR2, pcDirection IN VARCHAR2, pcIdAccused IN VARCHAR2) IS
    BEGIN
        UPDATE PHOTO
        SET photo_description = pcPhotoDescription,
        direction = pcDirection,
        id_accused = pdEndDate
        WHERE id_photo = pnIdPhoto;
        Commit;
    Exception
        WHEN ACCESS_INTO_NULL THEN vmenError:= ('Cannot assign value to unitialized object');  
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdPhoto');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END setPhoto;

-- Procedure to delete a specific photo 
    PROCEDURE deletePhoto (pnIdPhoto IN NUMBER) IS
    BEGIN 
        DELETE FROM PHOTO
        WHERE id_photo = pnIdPhoto;
        Commit;
    Exception
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with the index ||pnIdPhoto');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END deletePhoto;

-- Procedure to insert a new photo
    PROCEDURE insertPhoto (pcPhotoDescription IN VARCHAR2, pcDirection IN VARCHAR2, pcIdAccused IN VARCHAR2) IS
    BEGIN 
        INSERT INTO PHOTO (id_photo, photo_description, direction, id_accused)
        VALUES (s_photo.nextval, pcPhotoDescription, pcDirection, pcIdAccused);
        Commit;
    Exception
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END insertPhoto;
END TRTables;
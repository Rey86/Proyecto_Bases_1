CREATE OR REPLACE PACKAGE TRStatisticReports IS 
    PROCEDURE getTranscriptPercentagePerType;
    PROCEDURE getTranscriptPercentagePerZone(pnId_community NUMBER, pnId_Country NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER);
    PROCEDURE getUserTranscriptPercentagePerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER);
    PROCEDURE getAverageSentenceTimePerType;
    PROCEDURE getDueSentenceTranscripts;
    PROCEDURE getSentenceTimePerType;
    PROCEDURE getSentenceTypePerType;
END TRStatisticReport;

CREATE OR REPLACE PACKAGE BODY TRStatisticReports AS

    --Function that gets the percentage of transcripts per transcript type
    PROCEDURE getTranscriptPercentagePerType AS
    CURSOR TranscriptPercentagePerType IS
        SELECT tt.transcripttype_name transcripttype_name, round(100*ratio_to_report(count(*)) over (), 2) percentage
        FROM transcript t 
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        GROUP BY tt.transcripttype_name;
    BEGIN
        FOR i IN TranscriptPercentagePerType LOOP
            dbms_output.put_line(i.transcripttype_name);
            dbms_output.put_line(i.percentage);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTranscriptPercentagePerType;
    
    --Function that gets the percentage of transcripts per zone
    PROCEDURE getTranscriptPercentagePerZone(pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) AS
    CURSOR TranscriptPercentagePerZone(pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) IS 
        SELECT t.id_community id_community, round(100*ratio_to_report(count(*)) over (), 2) percentage
        FROM transcript t 
        INNER JOIN community c on c.id_community = t.id_community 
        INNER JOIN district d on d.id_district = c.id_district
        INNER JOIN canton ca on ca.id_canton = d.id_canton
        INNER JOIN province p on p.id_province = ca.id_province
        INNER JOIN country co on co.id_country = p.id_country
        WHERE d.id_disctrict = NVL(pnIdDistrict, d.id_disctrict)
        AND ca.id_canton = NVL(pnIdCanton, ca.id_canton)
        AND p.id_province = NVL(pnIdProvince, p.id_province)
        AND co.id_country = NVL(pnIdCountry, co.id_country)
        group by t.id_community;
    BEGIN
        FOR i IN TranscriptPercentagePerZone(pnIdCountry, pnIdProvince, pnIdCanton, pnIdDistrict) LOOP
            dbms_output.put_line(i.id_community);
            dbms_output.put_line(i.percentage);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTranscriptPercentagePerZone;
    
    --Function that gets the percentage of users per age range
    PROCEDURE getAgeRangePercentageUsers AS 
    CURSOR AgeRangePercentageUsers IS
        SELECT round(100*ratio_to_report(count(*)) over (), 2) percentage FROM 
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate <= 18 AND SYSDATE - u.Birthdate >= 0) UNION
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate <= 30 AND SYSDATE - u.Birthdate >= 19) UNION
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate <= 45 AND SYSDATE - u.Birthdate >= 31) UNION
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate <= 55 AND SYSDATE - u.Birthdate >= 46) UNION
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate <= 65 AND SYSDATE - u.Birthdate >= 56) UNION
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate <= 75 AND SYSDATE - u.Birthdate >= 66) UNION
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate <= 85 AND SYSDATE - u.Birthdate >= 76) UNION
        (SELECT * FROM transcript t INNER JOIN username u ON u.username =  t.username
        WHERE SYSDATE - u.Birthdate >= 86);
        GROUP BY u.Birthdate;
    BEGIN 
        FOR i IN AgeRangePercentageUsers LOOP
            dbms_output.put_line(i.percentage);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAgeRangePercentageUsers;
    
    --Function that gets the percentage of transcript users per zone
    PROCEDURE getUserTranscriptPercentagePerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) AS
    CURSOR UserTranscriptPercentagePerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) IS
        SELECT  t.id_community id_community , round(100*ratio_to_report(count(*)) over (), 2) percentage
        FROM (SELECT * FROM transcript t INNER JOIN accused a ON t.id_accused = a.id_accused)
        INNER JOIN community c on c.id_community = t.id_community 
        INNER JOIN district d on d.id_district = c.id_district
        INNER JOIN canton ca on ca.id_canton = d.id_canton
        INNER JOIN province p on p.id_province = ca.id_province
        INNER JOIN country co on co.id_country = p.id_country
        WHERE c.id_community = NVL(pnIdCommunity, id_community)
        AND d.id_disctrict = NVL(pnIdDistrict, d.id_disctrict)
        AND ca.id_canton = NVL(pnIdCanton, ca.id_canton)
        AND p.id_province = NVL(pnIdProvince, p.id_province)
        AND co.id_country = NVL(pnIdCountry, co.id_country) 
        group by t.id_community;
    BEGIN
        FOR i in UserTranscriptPercentagePerZone(pnIdCommunity, pnIdCountry, pnIdProvince, pnIdCanton, pnIdDistrict) LOOP
            dbms_output.put_line(i.id_community);
            dbms_output.put_line(i.percentage);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getUserTranscriptPercentagePerZone;
    
    --Function that gets the average sentence time per transcript type
    PROCEDURE getAverageSentenceTimePerType AS
    CURSOR AverageSentenceTimePerType IS 
        SELECT t.id_transcripttype id_transcripttype, avg(s.start_date-s.end_date) Average
        FROM transcript t
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        INNER JOIN sentence s on s.id_sentence = t.id_sentence
        GROUP BY t.id_transcripttype;
    BEGIN
        FOR i IN AverageSentenceTimePerType LOOP
            dbms_output.put_line(i.id_transcripttype);
            dbms_output.put_line(i.Average);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAverageSentenceTimePerType;
    
    --Function that gets the list of all expired or near due sentences 
    PROCEDURE getDueSentenceTranscripts AS 
    CURSOR DueSentenceTranscripts IS
        select t.id_transcript id_transcript ,tt.transcripttype_name transcripttype_name
        FROM transcript t 
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype 
        WHERE t.due_date <= sysdate;
    BEGIN
        FOR i IN DueSentenceTranscripts LOOP
            dbms_output.put_line(i.id_transcript);
            dbms_output.put_line(i.transcripttype_name);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getDueSentenceTranscripts;
    
    --Function that gets the list of sentence times per type
    PROCEDURE getSentenceTimePerType AS 
    CURSOR SentenceTimePerType IS
        SELECT s.start_date - s.end_date Sentence_Time
        FROM transcript t
        INNER JOIN sentence s on s.id_sentence = t.id_sentence
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        GROUP BY t.ID_TRANSCRIPTTYPE; 
    BEGIN
        FOR i IN SentenceTimePerType LOOP
            dbms_output.put_line(i.transcripttype_name);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getSentenceTimePerType;
    
    --Function that gets the list of transcripts per sentence types
    PROCEDURE getSentenceTypePerType AS
    CURSOR SentenceTypePerType IS 
        SELECT t.transcript_number transcript_number
        FROM transcript t
        INNER JOIN sentence s on s.id_sentence = t.id_sentence
        INNER JOIN sentencetype st on st.id_sentencetype  = s.id_sentencetype;
        GROUP BY s.id_sentencetype;
    BEGIN
        FOR i IN SentenceTypePerType LOOP
            dbms_output.put_line(i.transcript_number);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    
    END getSentenceTypePerType;
END TRStatisticReports;
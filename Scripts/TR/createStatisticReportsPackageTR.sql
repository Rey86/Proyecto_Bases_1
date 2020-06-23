CREATE OR REPLACE PACKAGE TRStatisticReports IS 
    PROCEDURE getTranscriptPercentagePerType;
    PROCEDURE getTrPercentagePerZone(pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER);
    PROCEDURE getAgeRangePercentageAccused;
    PROCEDURE getAccuTrPercentPerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER);
    PROCEDURE getAverageSentenceTimePerType;
    PROCEDURE getDueSentenceTranscripts;
    PROCEDURE getSentenceTimePerType;
    PROCEDURE getSentenceTypePerType;
END TRStatisticReports;

CREATE OR REPLACE PACKAGE BODY TRStatisticReports AS

    --Function that gets the percentage of transcripts per transcript type
    PROCEDURE getTranscriptPercentagePerType AS
    vmenError VARCHAR(100);
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
    PROCEDURE getTrPercentagePerZone(pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) AS
    vmenError VARCHAR(100);
    CURSOR TranscriptPercentagePerZone(pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) IS 
        SELECT t.id_community id_community, round(100*ratio_to_report(count(*)) over (), 2) percentage
        FROM transcript t 
        INNER JOIN Place.community c on c.id_community = t.id_community 
        INNER JOIN Place.district d on d.id_district = c.id_district
        INNER JOIN Place.canton ca on ca.id_canton = d.id_canton
        INNER JOIN Place.province p on p.id_province = ca.id_province
        INNER JOIN Place.country co on co.id_country = p.id_country
        WHERE d.id_district = NVL(pnIdDistrict, d.id_district)
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
    END getTrPercentagePerZone;
    
    --Function that gets the percentage of users per age range
    PROCEDURE getAgeRangePercentageAccused AS 
    vmenError VARCHAR(100);
    CURSOR AgeRangePercentageAccused IS
        SELECT t.accused_age_range accused_age_range, round(100*ratio_to_report(count(*)) over (), 2) percentage FROM 
        (SELECT CASE WHEN (SYSDATE-p.birthdate) >= 0 and (SYSDATE-p.birthdate) <= 18 then '0-18'
        WHEN (SYSDATE-p.birthdate) >= 19 and (SYSDATE-p.birthdate) <= 30 then '19-30'
        WHEN (SYSDATE-p.birthdate) >= 31 and (SYSDATE-p.birthdate) <= 45 then '31-45'
        WHEN (SYSDATE-p.birthdate) >= 46 and (SYSDATE-p.birthdate) <= 55 then '46-55'
        WHEN (SYSDATE-p.birthdate) >= 56 and (SYSDATE-p.birthdate) <= 65 then '56-65'
        WHEN (SYSDATE-p.birthdate) >= 66 and (SYSDATE-p.birthdate) <= 75 then '66-75'
        WHEN (SYSDATE-p.birthdate) >= 76 and (SYSDATE-p.birthdate) <= 85 then '76-85'
        ELSE '85+' end as accused_age_range
        FROM transcript t INNER JOIN accused a ON t.id_accused = a.id_accused INNER JOIN PRSN.person p ON a.id_accused = p.id_person 
        ORDER BY p.birthdate) t
        GROUP BY t.accused_age_range;
    BEGIN 
        FOR i IN AgeRangePercentageAccused LOOP
            dbms_output.put_line(i.accused_age_range);
            dbms_output.put_line(i.percentage);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAgeRangePercentageAccused;
    
    --Function that gets the percentage of transcript users per zone
    PROCEDURE getAccuTrPercentPerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) AS
    vmenError VARCHAR(100);
    CURSOR AccuTrPercentPerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) IS
        SELECT  t.id_community id_community , round(100*ratio_to_report(count(*)) over (), 2) percentage
        FROM transcript t 
        INNER JOIN accused a ON t.id_accused = a.id_accused
        INNER JOIN Place.community c on c.id_community = t.id_community 
        INNER JOIN Place.district d on d.id_district = c.id_district
        INNER JOIN Place.canton ca on ca.id_canton = d.id_canton
        INNER JOIN Place.province p on p.id_province = ca.id_province
        INNER JOIN Place.country co on co.id_country = p.id_country
        WHERE c.id_community = NVL(pnIdCommunity, c.id_community)
        AND d.id_district = NVL(pnIdDistrict, d.id_district)
        AND ca.id_canton = NVL(pnIdCanton, ca.id_canton)
        AND p.id_province = NVL(pnIdProvince, p.id_province)
        AND co.id_country = NVL(pnIdCountry, co.id_country) 
        group by t.id_community;
    BEGIN
        FOR i in AccuTrPercentPerZone(pnIdCommunity, pnIdCountry, pnIdProvince, pnIdCanton, pnIdDistrict) LOOP
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
    END getAccuTrPercentPerZone;
    
    --Function that gets the average sentence time per transcript type
    PROCEDURE getAverageSentenceTimePerType AS
    vmenError VARCHAR(100);
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
    vmenError VARCHAR(100);
    CURSOR DueSentenceTranscripts IS
        select t.transcript_number transcript_number ,tt.transcripttype_name transcripttype_name
        FROM transcript t 
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype 
        WHERE t.due_date <= sysdate;
    BEGIN
        FOR i IN DueSentenceTranscripts LOOP
            dbms_output.put_line(i.transcript_number);
            dbms_output.put_line(i.transcripttype_name);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getDueSentenceTranscripts;
    
    --Function that gets the list of sentence times per type
    PROCEDURE getSentenceTimePerType AS 
    vmenError VARCHAR(100);
    CURSOR SentenceTimePerType IS
        SELECT s.start_date - s.end_date Sentence_Time
        FROM transcript t
        INNER JOIN sentence s on s.id_sentence = t.id_sentence
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        GROUP BY t.ID_TRANSCRIPTTYPE; 
    BEGIN
        FOR i IN SentenceTimePerType LOOP
            dbms_output.put_line(i.Sentence_Time);
        END LOOP;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getSentenceTimePerType;
    
    --Function that gets the list of transcripts per sentence types
    PROCEDURE getSentenceTypePerType AS
    vmenError VARCHAR(100);
    CURSOR SentenceTypePerType IS 
        SELECT t.transcript_number transcript_number
        FROM transcript t
        INNER JOIN sentence s on s.id_sentence = t.id_sentence
        INNER JOIN sentencetype st on st.id_sentencetype  = s.id_sentencetype
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
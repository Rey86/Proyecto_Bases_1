CREATE OR REPLACE PACKAGE TRStatisticReports IS 
    FUNCTION getTranscriptPercentagePerType RETURN SYS_REFCURSOR;
    FUNCTION getTrPercentagePerZone(pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION getAgeRangePercentageAccused  RETURN SYS_REFCURSOR;
    FUNCTION getAccuTrPercentPerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER)  RETURN SYS_REFCURSOR;
    FUNCTION getAverageSentenceTimePerType  RETURN SYS_REFCURSOR;
    FUNCTION getDueSentenceTranscripts  RETURN SYS_REFCURSOR;
    FUNCTION getSentenceTimePerType RETURN SYS_REFCURSOR;
    FUNCTION getSentenceTypePerType RETURN SYS_REFCURSOR;
END TRStatisticReports;

CREATE OR REPLACE PACKAGE BODY TRStatisticReports AS

    --Function that gets the percentage of transcripts per transcript type
    FUNCTION getTranscriptPercentagePerType  RETURN SYS_REFCURSOR IS
    vmenError VARCHAR(100);
    TranscriptPercentagePerType SYS_REFCURSOR;
    BEGIN
    OPEN transcriptpercentagepertype FOR
        SELECT tt.transcripttype_name transcripttype_name, round(100*ratio_to_report(count(*)) over (), 2) percentage
        FROM transcript t 
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        GROUP BY tt.transcripttype_name;
    RETURN transcriptpercentagepertype;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTranscriptPercentagePerType;
    
    --Function that gets the percentage of transcripts per zone
    FUNCTION getTrPercentagePerZone(pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER)  RETURN SYS_REFCURSOR IS
    vmenError VARCHAR(100);
    TranscriptPercentagePerZone SYS_REFCURSOR;
    BEGIN
    OPEN transcriptpercentageperzone FOR
        SELECT c.community_name community_name, round(100*ratio_to_report(count(*)) over (), 2) percentage
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
        group by c.community_name;
    RETURN transcriptpercentageperzone;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTrPercentagePerZone;
    
    --Function that gets the percentage of users per age range
    FUNCTION getAgeRangePercentageAccused  RETURN SYS_REFCURSOR IS
    vmenError VARCHAR(100);
    AgeRangePercentageAccused SYS_REFCURSOR;
    BEGIN  
    OPEN AgeRangePercentageAccused FOR
        SELECT t.accused_age_range accused_age_range, round(100*ratio_to_report(count(*)) over (), 2) percentage FROM 
        (SELECT CASE WHEN (SYSDATE-p.birthdate)/365 >= 0 and (SYSDATE-p.birthdate)/365 <= 18 then '0-18'
        WHEN (SYSDATE-p.birthdate)/365 >= 19 and (SYSDATE-p.birthdate)/365 <= 30 then '19-30'
        WHEN (SYSDATE-p.birthdate)/365 >= 31 and (SYSDATE-p.birthdate)/365 <= 45 then '31-45'
        WHEN (SYSDATE-p.birthdate)/365 >= 46 and (SYSDATE-p.birthdate)/365 <= 55 then '46-55'
        WHEN (SYSDATE-p.birthdate)/365 >= 56 and (SYSDATE-p.birthdate)/365 <= 65 then '56-65'
        WHEN (SYSDATE-p.birthdate)/365 >= 66 and (SYSDATE-p.birthdate)/365 <= 75 then '66-75'
        WHEN (SYSDATE-p.birthdate)/365 >= 76 and (SYSDATE-p.birthdate)/365 <= 85 then '76-85'
        ELSE '85+' end as accused_age_range
        FROM transcript t INNER JOIN accused a ON t.id_accused = a.id_accused INNER JOIN PRSN.person p ON a.id_accused = p.id_person 
        ORDER BY p.birthdate) t
        GROUP BY t.accused_age_range;
    RETURN AgeRangePercentageAccused;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAgeRangePercentageAccused;
    
    --Function that gets the percentage of transcript users per zone
    FUNCTION getAccuTrPercentPerZone(pnIdCommunity NUMBER, pnIdCountry NUMBER, pnIdProvince NUMBER, pnIdCanton Number, pnIdDistrict NUMBER)  RETURN SYS_REFCURSOR IS
    vmenError VARCHAR(100);
    AccuTrPercentPerZone SYS_REFCURSOR;
    BEGIN 
    OPEN AccuTrPercentPerZone FOR
        SELECT  c.community_name community_name , round(100*ratio_to_report(count(*)) over (), 2) percentage
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
        group by c.community_name;
    RETURN AccuTrPercentPerZone;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned');   
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAccuTrPercentPerZone;
    
    --Function that gets the average sentence time per transcript type
    FUNCTION getAverageSentenceTimePerType RETURN SYS_REFCURSOR IS         
    vmenError VARCHAR(100);
    AverageSentenceTimePerType SYS_REFCURSOR;
    BEGIN
    OPEN AverageSentenceTimePerType FOR 
        SELECT tt.transcripttype_name transcripttype_name, avg((sentence_enddate-sentence_startdate)/365) Average
        FROM transcript t
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        GROUP BY tt.transcripttype_name;
    RETURN AverageSentenceTimePerType;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAverageSentenceTimePerType;
    
    --Function that gets the list of all expired or near due sentences 
    FUNCTION getDueSentenceTranscripts RETURN SYS_REFCURSOR IS
    vmenError VARCHAR(100);
    DueSentenceTranscripts SYS_REFCURSOR;
    BEGIN 
    OPEN duesentencetranscripts FOR
        select tt.transcripttype_name transcripttype_name , count(t.transcript_number) quantity_trasncripts
        FROM transcript t 
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype 
        WHERE t.due_date between sysdate-1 and sysdate+1
        GROUP BY tt.transcripttype_name;
    RETURN duesentencetranscripts;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getDueSentenceTranscripts;
    
    --Function that gets the list of sentence times per type
    FUNCTION getSentenceTimePerType RETURN SYS_REFCURSOR IS
    vmenError VARCHAR(100);
    SentenceTimePerType SYS_REFCURSOR;
    BEGIN
    OPEN sentencetimepertype FOR
        SELECT tt.transcripttype_name transcripttype_name, sum((sentence_enddate - sentence_startdate)/365) Sentence_Time
        FROM transcript t
        INNER JOIN transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        GROUP BY  tt.transcripttype_name; 
    RETURN sentencetimepertype;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getSentenceTimePerType;
    
    --Function that gets the list of transcripts per sentence types
    FUNCTION getSentenceTypePerType RETURN SYS_REFCURSOR IS
    vmenError VARCHAR(100);
    SentenceTypePerType SYS_REFCURSOR;
    BEGIN
    OPEN sentencetypepertype FOR
        SELECT st.sentencetype_name sentencetype_name, count(t.transcript_number) quantity_transcripts
        FROM transcript t
        INNER JOIN sentencetype st on st.id_sentencetype = t.id_sentencetype
        GROUP BY st.sentencetype_name;
    RETURN sentencetypepertype;
    EXCEPTION 
        WHEN no_data_found then vmenError:= ('No rows returned');
        WHEN PROGRAM_ERROR THEN vmenError:= ('An internal error has ocurred');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    
    END getSentenceTypePerType;
END TRStatisticReports;
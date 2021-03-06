CREATE OR REPLACE PACKAGE TRAdminReports IS 
    FUNCTION getNewTranscripts RETURN SYS_REFCURSOR;
    FUNCTION getValidTranscripts RETURN SYS_REFCURSOR;
END TRAdminReports;

CREATE OR REPLACE PACKAGE BODY TRAdminReports AS
    --Function to get the newest created transcripts
    FUNCTION getNewTranscripts RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    NewTranscripts SYS_REFCURSOR;
    BEGIN 
    OPEN NewTranscripts FOR
        select  tt.transcripttype_name transcripttype, t.transcript_number transcript_number, t.valid, t.id_community id_community, 
        t.id_transcripttype id_transcripttype, t.username username, p.first_name||' '||p.last_name||' '||p.second_last_name accused_name , 
        g.gender_name gender , c.community_name community_name, t.date_creation date_creation
        from transcript t 
        inner join accused a on a.id_accused = t.id_accused 
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        inner join Place.community c on c.id_community = t.id_community
        inner join PRSN.gender g on g.id_gender = p.id_gender 
        where t.date_creation between SYSDATE-1 and SYSDATE+1;
    RETURN NewTranscripts;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getNewTranscripts;
    
    FUNCTION getValidTranscripts RETURN SYS_REFCURSOR IS 
    vmenError VARCHAR2(100);
    ValidTranscripts SYS_REFCURSOR;
    BEGIN
    OPEN ValidTranscripts FOR
        select tt.transcripttype_name transcripttype, t.transcript_number transcript_number, t.valid,
        t.username username, p.first_name||' '||p.last_name||' '||p.second_last_name accused_name, 
        c.community_name community_name
        from transcript t 
        inner join accused a on a.id_accused = t.id_accused 
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        inner join Place.community c on c.id_community = t.id_community 
        where t.valid = 1;
    RETURN ValidTranscripts;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        when no_data_found then vmenError:= ('Couldn�t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
END TRAdminReports;

CREATE OR REPLACE PACKAGE TRUserReports IS 
    FUNCTION getTopTranscriptCommunity(n number) RETURN SYS_REFCURSOR;
    FUNCTION getTranscriptPerType(pnIdTranscriptType NUMBER, pdDateStartDate DATE,
    pdDateEndDate DATE, pnIdCommunity NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION getDueTranscripts(pdStartDate Date, pdEndDate DATE) RETURN SYS_REFCURSOR;
    FUNCTION getAccusedPerCompany RETURN SYS_REFCURSOR;
    FUNCTION getTopCrimes(n NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION getTopSentenceTime(n NUMBER) RETURN SYS_REFCURSOR;
END TRUserReports;

CREATE OR REPLACE PACKAGE BODY TRUserReports AS
    --Function to get the top n communities with the most transcripts
    FUNCTION getTopTranscriptCommunity(n number) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    topTranscriptCommunity SYS_REFCURSOR;
    BEGIN
    OPEN topTranscriptCommunity FOR
        select community_name, transcript_quantity from(Select c.community_name community_name , count(t.id_community) transcript_quantity
        from transcript t inner join Place.community c on t.id_community = c.id_community
        group by c.community_name
        order by transcript_quantity desc)where rownum <= n;
    RETURN toptranscriptcommunity;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTopTranscriptCommunity;
    --Function that gets the transcripts classified by type
    FUNCTION getTranscriptPerType(pnIdTranscriptType NUMBER, pdDateStartDate DATE, pdDateEndDate DATE, pnIdCommunity NUMBER)  RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    TranscriptPerType SYS_REFCURSOR;
    BEGIN 
    OPEN TranscriptPerType FOR
        select  tt.transcripttype_name transcripttype, t.transcript_number transcript_number, t.valid, t.id_community id_community, 
        t.id_transcripttype id_transcripttype, t.username username, p.first_name||' '||p.last_name||' '||p.second_last_name accused_name , 
        g.gender_name gender , c.community_name community_name, t.date_creation date_creation
        from transcript t 
        inner join accused a on a.id_accused = t.id_accused 
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        inner join Place.community c on c.id_community = t.id_community
        inner join PRSN.gender g on g.id_gender = p.id_gender 
        where t.id_transcripttype = NVL(pnIdTranscriptType, t.id_transcripttype)
        and t.date_creation between NVL(pdDateStartDate, t.date_creation) and NVL(pdDateEndDate, t.date_creation) 
        and t.id_community = NVL(pnIdCommunity, t.id_community)
        order by t.id_transcripttype;
    RETURN transcriptpertype;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        when no_data_found then vmenError:= ('Couldn�t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END gettranscriptPerType;
    --Function that gets the list of Due Transcripts
    FUNCTION getDueTranscripts(pdStartDate Date, pdEndDate DATE) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    DueTranscripts SYS_REFCURSOR;
    BEGIN
    OPEN duetranscripts FOR
        select t.transcript_number transcript_number, t.username username, c.company_name company_name,
        p.first_name||' '||p.last_name||' '||p.second_last_name accused_name, p.birthdate birthdate, g.gender_name gender, tt.transcripttype_name transcripttype_name 
        from transcript t 
        inner join accused a on t.id_accused = a.id_accused
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join PRSN.gender g on p.id_gender = g.id_gender
        inner join PRSN.company c on p.id_company = c.id_company
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        where t.due_date between sysdate-1 and sysdate+2
        and t.date_creation between NVL(pdStartDate, t.date_creation) and  NVL(pdEndDate, t.date_creation); 
    RETURN duetranscripts;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn�t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getDueTranscripts;
    
    FUNCTION getAccusedPerCompany RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    AccusedPerCompany  SYS_REFCURSOR;
    BEGIN 
    OPEN accusedpercompany FOR
        select c.company_name company_name, count(p.id_company) Accused_quantity
        from accused a
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join PRSN.company c on p.id_company = c.id_company
        group by c.company_name; 
    RETURN accusedpercompany;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn�t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAccusedPerCompany;
    
    FUNCTION getTopCrimes(n NUMBER) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    topCrimes SYS_REFCURSOR;
    BEGIN
    OPEN topcrimes FOR 
        select transcripttype_name, transcripttype_quantity from( select tt.transcripttype_name transcripttype_name, count(t.id_transcripttype) transcripttype_quantity
        from transcript t
        inner join transcripttype tt on t.id_transcripttype = tt.id_transcripttype 
        group by tt.transcripttype_name
        order by transcripttype_quantity desc) where rownum <=n ;
    RETURN topcrimes;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTopCrimes;
    
    --Function that gets the top sentence type
    FUNCTION getTopSentenceTime(n NUMBER) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    topSentenceTime SYS_REFCURSOR;
    BEGIN
    OPEN topsentencetime FOR
        select transcript_number, sentence_time
        from ( select transcript_number, (sentence_enddate -  sentence_startdate)/365 sentence_time 
        from transcript
        order by sentence_time desc) 
        where rownum <=n ;
    RETURN topsentencetime;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTopSentenceTime;
END TRUserReports;
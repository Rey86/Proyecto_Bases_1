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
        SELECT transcript_number FROM transcript where SYSDATE = date_creation;
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
        p.id_gender gender , c.community_name community_name
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
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
END TRAdminReports;

CREATE OR REPLACE PACKAGE TRUserReports IS 
    FUNCTION getTopTranscriptCommunity(n number) RETURN SYS_REFCURSOR;
    FUNCTION getTranscriptPerType(pnIdTranscriptType NUMBER, pdDateCreation DATE,
    pdDateLastModification DATE, pnIdCommunity NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION getDueTranscripts(pdDateCreation Date, pdDateLastModification DATE) RETURN SYS_REFCURSOR;
    FUNCTION getAccusedPerCompany(PnID_Company NUMBER) RETURN SYS_REFCURSOR;
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
        select c.community_name community_name , count(t.id_community) transcript_quantity
        from transcript t inner join Place.community c on t.id_community = c.id_community
        where rownum <=n group by c.community_name 
        order by t.id_community desc;
    RETURN toptranscriptcommunity;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTopTranscriptCommunity;
    --Function that gets the transcripts classified by type
    FUNCTION getTranscriptPerType(pnIdTranscriptType NUMBER, pdDateCreation DATE, pdDateLastModification DATE, pnIdCommunity NUMBER)  RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    TranscriptPerType SYS_REFCURSOR;
    BEGIN 
    OPEN TranscriptPerType FOR
        select  tt.transcripttype_name transcripttype, t.transcript_number transcript_number, t.valid,
        t.username username, p.first_name||' '||p.last_name||' '||p.second_last_name accused_name , 
        g.gender_name gender , c.community_name community_name, t.date_creation date_creation, t.date_last_modification date_last_modification
        from transcript t 
        inner join accused a on a.id_accused = t.id_accused 
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        inner join Place.community c on c.id_community = t.id_community
        inner join PRSN.gender g on g.id_gender = p.id_gender 
        where t.id_transcripttype = NVL(pnIdTranscriptType, t.id_transcripttype)
        and t.date_creation = NVL(pdDateCreation, t.date_creation)
        and t.date_last_modification =  NVL(pdDateLastModification, t.date_last_modification)
        and t.id_community = NVL(pnIdCommunity, t.id_community)
        order by t.id_transcripttype;
    RETURN transcriptpertype;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END gettranscriptPerType;
    
    FUNCTION getDueTranscripts(pdDateCreation Date, pdDateLastModification DATE) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    DueTranscripts SYS_REFCURSOR;
    BEGIN
    OPEN duetranscripts FOR
        select t.transcript_number transcript_number, t.username username, c.company_name company_name,
        p.first_name||' '||p.last_name||' '||p.second_last_name accused_name, p.birthdate birthdate, g.gender_name gender 
        from transcript t 
        inner join accused a on t.id_accused = a.id_accused
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join PRSN.gender g on p.id_gender = g.id_gender
        inner join PRSN.company c on p.id_company = c.id_company
        where t.due_date = sysdate
        and t.date_creation = NVL(pdDateCreation, t.date_creation)
        and t.date_last_modification = NVL(pdDateLastModification, t.date_last_modification);
    RETURN duetranscripts;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getDueTranscripts;
    
    FUNCTION getAccusedPerCompany(PnID_Company NUMBER) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    AccusedPerCompany  SYS_REFCURSOR;
    BEGIN 
    OPEN accusedpercompany FOR
        select a.id_accused id_accused,  p.first_name||' '||p.last_name||' '||p.second_last_name Name, p.birthdate birthdate, g.gender_name gender
        from accused a
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join PRSN.gender g on p.id_gender = g.id_gender
        where p.id_company = PnID_Company; 
    RETURN accusedpercompany;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAccusedPerCompany;
    
    FUNCTION getTopCrimes(n NUMBER) RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    topCrimes SYS_REFCURSOR;
    BEGIN
    OPEN topcrimes FOR 
        select tt.transcripttype_name transcripttype_name from transcript t 
        inner join transcripttype tt on t.id_transcripttype = tt.id_transcripttype 
        where rownum <=n order by t.id_transcripttype desc;
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
        select sentence_startdate - sentence_enddate sentence_time
        from transcript
        where rownum <= n order by sentence_time desc;
    RETURN topsentencetime;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getTopSentenceTime;
END TRUserReports;
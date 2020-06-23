CREATE OR REPLACE PACKAGE TRAdminReports IS 
    PROCEDURE getNewTranscripts;
    PROCEDURE getValidTranscripts;
END TRAdminReports;

CREATE OR REPLACE PACKAGE BODY TRAdminReports AS
    --Function to get the newest created transcripts
    PROCEDURE getNewTranscripts AS
    vmenError VARCHAR2(50);
    CURSOR NewTranscripts IS
        SELECT transcript_number FROM transcript where SYSDATE = date_creation;
    BEGIN 
        FOR i IN NewTranscripts LOOP
            dbms_output.put_line(i.transcript_number);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getNewTranscripts;
    
    PROCEDURE getValidTranscripts AS 
    vmenError VARCHAR2(50);
    CURSOR ValidTranscripts IS 
        select tt.transcripttype_name transcripttype, t.transcript_number transcript_number, t.valid,
        t.username username, p.first_name||' '||p.last_name||' '||p.second_last_name accused_name , 
        p.id_gender gender , c.community_name community_name
        from transcript t 
        inner join accused a on a.id_accused = t.id_accused 
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        inner join Place.community c on c.id_community = t.id_community 
        where t.valid = 1;
     BEGIN
        FOR i in ValidTranscripts LOOP
            dbms_output.put_line(i.transcripttype);
            dbms_output.put_line(i.transcript_number);
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.accused_name);
            dbms_output.put_line(i.gender);
            dbms_output.put_line(i.community_name);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
END TRAdminReports;

CREATE OR REPLACE PACKAGE TRUserReports IS 
    PROCEDURE topTranscriptCommunity(n number);
    PROCEDURE getTranscriptPerType(pnIdTranscriptType NUMBER, pdDateCreation DATE, pdDateLastModification DATE, pnIdCommunity NUMBER);
    PROCEDURE getDueTranscripts(pdDateCreation Date, pdDateLastModification DATE);
    PROCEDURE getAccusedPerCompany(PnID_Company NUMBER);
    PROCEDURE topCrimes(n NUMBER);
END TRUserReports;

CREATE OR REPLACE PACKAGE BODY TRUserReports AS
    --Function to get the top n communities with the most transcripts
    PROCEDURE topTranscriptCommunity(n number) AS
    vmenError VARCHAR2(50);
    CURSOR topTranscriptCommunity(n number) IS
        select c.community_name community_name , count(t.id_community) transcript_quantity
        from transcript t inner join Place.community c on t.id_community = c.id_community
        where rownum <=n group by c.community_name 
        order by t.id_community desc;
    BEGIN
        FOR i in topTranscriptCommunity(n) LOOP
            dbms_output.put_line(i.community_name);
            dbms_output.put_line(i.transcript_quantity);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END topTranscriptCommunity;
    --Function that gets the transcripts classified by type
    PROCEDURE getTranscriptPerType(pnIdTranscriptType NUMBER, pdDateCreation DATE, pdDateLastModification DATE, pnIdCommunity NUMBER)  AS
    vmenError VARCHAR2(50);
    CURSOR TranscriptPerType(pnIdTranscriptType NUMBER, pdDateCreation DATE, pdDateLastModification DATE, pnIdCommunity NUMBER) IS 
        select  tt.transcripttype_name transcripttype, t.transcript_number transcript_number, t.valid,
        t.username username, p.first_name||' '||p.last_name||' '||p.second_last_name accused_name , 
        p.id_gender gender , c.community_name community_name, t.date_creation date_creation, t.date_last_modification date_last_modification
        from transcript t 
        inner join accused a on a.id_accused = t.id_accused 
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        inner join Place.community c on c.id_community = t.id_community 
        where t.id_transcripttype = NVL(pnIdTranscriptType, t.id_transcripttype)
        and t.date_creation = NVL(pdDateCreation, t.date_creation)
        and t.date_last_modification =  NVL(pdDateLastModification, t.date_last_modification)
        and t.id_community = NVL(pnIdCommunity, t.id_community)
        order by t.id_transcripttype;
    BEGIN
        FOR i in TranscriptPerType(pnIdTranscriptType, pdDateCreation, pdDateLastModification, pnIdCommunity) LOOP
            dbms_output.put_line(i.transcripttype);
            dbms_output.put_line(i.transcript_number);
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.accused_name);
            dbms_output.put_line(i.gender);
            dbms_output.put_line(i.community_name);
            dbms_output.put_line(i.date_creation);
            dbms_output.put_line(i.date_last_modification);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END gettranscriptPerType;
    
    PROCEDURE getDueTranscripts(pdDateCreation Date, pdDateLastModification DATE) AS
    vmenError VARCHAR2(50);
    CURSOR DueTranscripts (pdDateCreation Date, pdDateLastModification DATE) IS
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
    BEGIN    
        FOR i in DueTranscripts(pdDateCreation, pdDateLastModification) LOOP
            dbms_output.put_line(i.transcript_number);
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.company_name);
            dbms_output.put_line(i.accused_name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.gender);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getDueTranscripts;
    
    PROCEDURE getAccusedPerCompany(PnID_Company NUMBER) AS
    vmenError VARCHAR2(50);
    CURSOR AccusedPerCompany(PnID_Company NUMBER) IS
        select a.id_accused id_accused,  p.first_name||' '||p.last_name||' '||p.second_last_name Name, p.birthdate birthdate, g.gender_name gender
        from accused a
        inner join PRSN.person p on a.id_accused = p.id_person
        inner join PRSN.gender g on p.id_gender = g.id_gender
        where p.id_company = PnID_Company; 
    BEGIN
         FOR i in AccusedPerCompany(PnID_Company) LOOP
            dbms_output.put_line(i.id_accused);
            dbms_output.put_line(i.Name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.gender);
         END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAccusedPerCompany;
    
    PROCEDURE topCrimes(n NUMBER) AS
    vmenError VARCHAR2(50);
    CURSOR topCrimes(n NUMBER) IS
        select c.crime_name crime from transcript t 
        inner join crime c on t.id_crime = c.id_crime 
        where rownum <=n order by t.id_crime desc;
    BEGIN
        FOR i in topCrimes(n) LOOP
            dbms_output.put_line(i.crime);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END topCrimes;
END TRUserReports;
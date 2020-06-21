CREATE OR REPLACE PACKAGE TRAdminReports IS 
    PROCEDURE getNewTranscripts;
END TRAdminReports;

CREATE OR REPLACE PACKAGE BODY TRAdminReports IS 
    --Function to get the newest created transcripts
    PROCEDURE getNewTranscripts AS
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
END TRAdminReports;

CREATE OR REPLACE PACKAGE TRUserReports IS 
    PROCEDURE topTranscriptCommunity(n number);
    PROCEDURE getTranscriptPerType(pnTranscriptType NUMBER, pdDateCreation DATE, pdDateLastModification DATE, pnIdCommunity NUMBER);
    PROCEDURE getDueTranscripts(pdDateCreation Date, pdDateLastModification DATE);
    PROCEDURE getAccusedPerCompany(PnID_Company NUMBER);
    PROCEDURE getAverageResolutionTime;
    PROCEDURE topCrimes(n NUMBER);
END TRUserReports;

CREATE OR REPLACE PACKAGE BODY TRUserReports IS
    --Function to get the top n communities with the most transcripts
    PROCEDURE topTranscriptCommunity(n number) AS
    CURSOR topTranscriptCommunity(n number) IS
        select c.community_name community_name , count(t.id_community) transcript_quantity
        from transcript t inner join community c on t.id_community = c.id_community
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
    CURSOR TranscriptPerType(pnIdTranscriptType NUMBER, pdDateCreation DATE, pdDateLastModification DATE, pnIdCommunity NUMBER) IS 
        select  tt.transcripttype_name transcripttype, t.transcript_number transcript_number, t.valid,
        t.username username, a.first_name||' '||a.last_name||' '||a.second_last_name accused_name , 
        a.id_gender gender , c.community_name community_name, t.date_creation date_creation, t.date_last_modification date_last_modification
        from transcript t 
        inner join accused a on a.id_accused = t.id_accused 
        inner join transcripttype tt on tt.id_transcripttype = t.id_transcripttype
        inner join community c on c.id_community = t.id_community 
        where t.id_transcripttypr = NVL(pnIdTranscriptType, t.id_transcript)
        and t.date_creation = NVL(pdDateCreation, t.date_creation)
        and t.date_last_modification =  NVL(pdDateLastModification, t.date_last_modification)
        and t.id_community = NVL(pnIdCommunity, t.id_community)
        order by t.trancripttype;
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
    CURSOR DueTranscripts (pdDateCreation Date, pdDateLastModification DATE) IS
        select t.transcript_number transcript_number, t.username username, a.id_company id_company,
        a.first_name||' '||a.last_name||' '||a.second_last_name accused_name, a.birthdate birthdate, a.id_gender gender 
        from transcript t 
        inner join accused a on t.id_accused = a.id_accused
        where t.due_date = sysdate
        and t.date_creation = NVL(pdDateCreation, date_creation)
        and t.date_last_modification = NVL(pdDateLastModification, date_last_modification);
    BEGIN    
        FOR i in DueTranscripts(pdDateCreation, pdDateLastModification) LOOP
            dbms_output.put_line(i.transcript_number);
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.id_company);
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
    CURSOR AccusedPerCompany(PnID_Company NUMBER) IS
        select id_accused ,  first_name||' '||last_name||' '||second_last_name Name, birthdate, id_gender
        from accused
        where id_company = PnID_Company and date_creation = sysdate;
    BEGIN
         FOR i in AccusedPerCompany(PnID_Company) LOOP
            dbms_output.put_line(i.id_accused);
            dbms_output.put_line(i.Name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.id_gender);
         END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getAccusedPerCompany;
    
    PROCEDURE getAverageResolutionTime IS
    BEGIN
        select AVG(Date_Creation - Date_last_Modification) from transcript;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
    
    PROCEDURE topCrimes(n NUMBER) AS
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
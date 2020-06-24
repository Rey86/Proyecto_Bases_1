CREATE OR REPLACE PACKAGE USAdminReports IS
    PROCEDURE getUserPasswordMod(pcUserName VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pnIdUser NUMBER);
END USAdminReports;

CREATE OR REPLACE PACKAGE BODY USAdminReports AS
    --Function that gets list of users whose passwords have been modified in the past 10 days
    PROCEDURE getUserPasswordMod(pcUserName VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pnIdUser NUMBER) 
    AS CURSOR UserPasswordMod(pcUserName VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pnIdUser NUMBER) IS
        select ua.username username , p.first_name||' '|| p.last_name name , id_user identification from userapp ua
        inner join generallog gl
        on ua.username = gl.username
        inner join PRSN.PERSON p
        on ua.id_user = p.id_person
        where sysdate - gl.modification_date < 10 
        and ua.username = NVL(pcUserName, ua.username)
        and ua.first_name = NVL(pcFirstName, ua.first_name)
        and ua.last_name = NVL(pcLastName, ua.last_name)
        and ua.id_user = NVL(pnIdUser, ua.id_user);
    BEGIN 
        FOR i in UserPasswordMod(pcUserName, pcFirstName , pcLastName , pnIdUser ) LOOP
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.name);
            dbms_output.put_line(i.identification);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        when no_data_found then vmenError:= ('Couldn´t find register with one of the sent parameters ');
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getUserPasswordMod;
END USAdminReports;

CREATE OR REPLACE PACKAGE USUserReports IS
    PROCEDURE getUserList;
    PROCEDURE getBannedUserList;
    PROCEDURE topSentenceTime(n NUMBER);
    PROCEDURE topBanReason(n NUMBER);
END USUserReports;

CREATE OR REPLACE PACKAGE BODY USUserReports AS
    --Function that gets the list of users
    PROCEDURE getUserList AS
    CURSOR UserList IS
        select username, first_name||' '|| last_name||' '|| second_last_name Name, birthdate,
        id_user, username, id_gender gender, id_company company
        from userapp;
    BEGIN 
        FOR i in UserList LOOP
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.Name);
            dbms_output.put_line(i.birthdate);
            dbms_output.put_line(i.id_user);
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.gender);
            dbms_output.put_line(i.company);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
    --Function that gets list of banned users and the reason 
    PROCEDURE getBannedUserList AS
    CURSOR BannedUserList IS
        Select u.id_user id_user, u.username username, b.banreason_description ban_reason From userapp u 
        inner join banreason b On u.id_banreason = b.id_banreason;
    BEGIN 
        FOR i IN BannedUserList LOOP
            dbms_output.put_line(i.id_user);
            dbms_output.put_line(i.username);
            dbms_output.put_line(i.ban_reason);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getBannedUserList;
    --Function that gets the top sentence type
    PROCEDURE topSentenceTime(n NUMBER) AS
    CURSOR SentenceTime(n NUMBER) IS
        select id_banreason, ban_days
        from banreason 
        where rownum <= n order by ban_days desc;
    BEGIN 
        FOR i IN SentenceTime(n) LOOP
            dbms_output.put_line(i.ban_reason);
            dbms_output.put_line(i.ban_days);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END topSentenceTime;
    --Function that gets the top reason for bans
    PROCEDURE topBanReason(n NUMBER)  AS
    CURSOR topBanReason(n NUMBER) IS
        select b.banreason_description banreason_description from userapp u 
        inner join banreason b on b.id_banreason = u.id_banreason 
        where rownum <=n order by b.banreason_description desc;
    BEGIN
        FOR i IN topBanReason(n) LOOP
            dbms_output.put_line(i.banreason_description);
        END LOOP;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
END USUserReports;
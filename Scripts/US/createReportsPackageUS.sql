CREATE OR REPLACE PACKAGE USAdminReports IS
    FUNCTION getUserPasswordMod(pcUserName VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, pnIdUser NUMBER) RETURN SYS_REFCURSOR;
END USAdminReports;

CREATE OR REPLACE PACKAGE BODY USAdminReports AS
    --Function that gets list of users whose passwords have been modified in the past 10 days
    FUNCTION getUserPasswordMod(pcUserName VARCHAR2, pcFirstName VARCHAR2, pcLastName VARCHAR2, pcSecondLastName VARCHAR2, pnIdUser NUMBER) RETURN SYS_REFCURSOR IS 
    vmenError VARCHAR2(100);
    UserPasswordMod SYS_REFCURSOR;
    BEGIN
    OPEN userpasswordmod FOR
        select ua.username username , p.first_name first_name, p.last_name last_name, p.second_last_name second_last_name, 
        id_user identification from userapp ua
        inner join ADM.generallog gl
        on ua.username = gl.username
        inner join PRSN.PERSON p
        on ua.id_user = p.id_person
        where sysdate - gl.modification_date <= 10 
        and ua.username = NVL(pcUserName, ua.username)
        and p.first_name = NVL(pcFirstName, p.first_name)
        and p.last_name = NVL(pcLastName, p.last_name)
        and p.second_last_name = NVL(pcSecondLastName, p.second_last_name)
        and ua.id_user = NVL(pnIdUser, ua.id_user);
    RETURN userpasswordmod;
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
    FUNCTION getUserList RETURN SYS_REFCURSOR;
    FUNCTION getBannedUserList RETURN SYS_REFCURSOR;
    FUNCTION topBanReason(n NUMBER) RETURN SYS_REFCURSOR;
END USUserReports;

CREATE OR REPLACE PACKAGE BODY USUserReports AS
    --Function that gets the list of users
    FUNCTION getUserList RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    UserList SYS_REFCURSOR;
    BEGIN
    OPEN userlist FOR
        select u.username username, p.first_name first_name, p.last_name last_name, p.second_last_name second_last_name, p.birthdate birthdate,
        u.id_user id_user, g.gender_name gender, c.company_name company_name, (SYSDATE-p.birthdate)/365 age from userapp u
        inner join PRSN.PERSON p
        on u.id_user = p.id_person 
        inner join PRSN.gender g
        on p.id_gender = g.id_gender
        inner join PRSN.company c
        on p.id_company = c.id_company;
    RETURN userlist;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
    --Function that gets list of banned users and the reason 
    FUNCTION getBannedUserList RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    BannedUserList SYS_REFCURSOR;
    BEGIN
    OPEN banneduserlist FOR
        Select u.id_user id_user, u.username username, b.banreason_description ban_reason From userapp u 
        inner join banreasonxuserapp bu on u.username = bu.username
        inner join banreason b On b.id_banreason = bu.id_banreason;
    RETURN banneduserlist;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END getBannedUserList;
    
    --Function that gets the top reason for bans
    FUNCTION topBanReason(n NUMBER)  RETURN SYS_REFCURSOR IS
    vmenError VARCHAR2(100);
    topBanReason SYS_REFCURSOR;
    BEGIN
    OPEN topbanreason FOR
        select b.banreason_description banreason_description from userapp u 
        inner join banreasonxuserapp bu on u.username = bu.username
        inner join banreason b On b.id_banreason = bu.id_banreason
        where rownum <=n order by b.banreason_description desc;
    RETURN topbanreason;
    Exception
        WHEN TOO_MANY_ROWS THEN vmenError:= ('Your SELECT statement retrived multiple rows.'); 
        WHEN ROWTYPE_MISMATCH THEN vmenError:= ('Incompatible value type cannot be assigned'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN vmenError:= ('Index is larger than the number of elements in the collection');  
        WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN vmenError:= ('Index is outside the legal range');  
        WHEN OTHERS THEN vmenError:= ('An unexpected error has ocurred');
    END;
END USUserReports;
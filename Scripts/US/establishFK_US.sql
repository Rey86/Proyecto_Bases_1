--Userapp's foreign keys
    --UserType
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_userType FOREIGN KEY
    (id_usertype) REFERENCES
    USERTYPE(id_usertype);

    --ID
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_id FOREIGN KEY
    (id_user) REFERENCES
    PRSN.PERSON(id_person);
    
--BanReasonXUserapp's foreign keys
    --Ban Reason
ALTER TABLE BANREASONXUSERAPP
    ADD CONSTRAINT fk_banXuser_banReason FOREIGN KEY
    (id_banreason) REFERENCES
    BANREASON(id_banreason);
    
    --User
ALTER TABLE BANREASONXUSERAPP
    ADD CONSTRAINT fk_banXuser_userapp FOREIGN KEY
    (username) REFERENCES
    USERAPP(username);
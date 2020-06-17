--Userapp's foreign keys
    --UserType
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_userType FOREIGN KEY
    (id_usertype) REFERENCES
    USERTYPE(id_usertype);
    
    --First Name
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_firstName FOREIGN KEY
    (first_name) REFERENCES
    PERSON(first_name);
    
    --Last Name
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_lastName FOREIGN KEY
    (last_name) REFERENCES
    PERSON(last_name);
    
    --Second Last Name
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_secondLastName FOREIGN KEY
    (second_last_name) REFERENCES
    PERSON(second_last_name);
    
    --Birthdate
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_birthdate FOREIGN KEY
    (birthdate) REFERENCES
    PERSON(birthdate); 
    
    --ID
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_id FOREIGN KEY
    (id_user) REFERENCES
    PERSON(id_person);
    
    --Company
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_company FOREIGN KEY
    (id_company) REFERENCES
    PERSON(id_company);

    --Gender
ALTER TABLE USERAPP
    ADD CONSTRAINT fk_userapp_gender FOREIGN KEY
    (id_gender) REFERENCES
    PERSON(id_gender);
    
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
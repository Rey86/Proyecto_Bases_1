--Person's foreign keys
    --Gender
ALTER TABLE PERSON
    ADD CONSTRAINT fk_person_gender FOREIGN KEY
    (id_gender) REFERENCES
    GENDER(id_gender);
    
    --Company
ALTER TABLE PERSON
    ADD CONSTRAINT fk_person_company FOREIGN KEY
    (id_company) REFERENCES
    COMPANY(id_company);
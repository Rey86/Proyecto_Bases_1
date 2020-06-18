ALTER TABLE COMMUNITY
    ADD CONSTRAINT pk_Community PRIMARY KEY (id_community)
    USING INDEX
    TABLESPACE Place_Ind PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);

ALTER TABLE DISTRICT
    ADD CONSTRAINT pk_District PRIMARY KEY (id_district)
    USING INDEX
    TABLESPACE Place_Ind PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);

ALTER TABLE CANTON
    ADD CONSTRAINT pk_Canton PRIMARY KEY (id_canton)
    USING INDEX
    TABLESPACE Place_Ind PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);

ALTER TABLE PROVINCE
    ADD CONSTRAINT pk_Province PRIMARY KEY (id_province)
    USING INDEX
    TABLESPACE Place_Ind PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);

ALTER TABLE COUNTRY
    ADD CONSTRAINT pk_Country PRIMARY KEY (id_country)
    USING INDEX
    TABLESPACE Place_Ind PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
--Community's foreign key
ALTER TABLE COMMUNITY
    ADD CONSTRAINT fk_community_district FOREIGN KEY
    (id_district) REFERENCES
    DISTRICT(id_district);

--District's foreign key
ALTER TABLE DISTRICT
    ADD CONSTRAINT fk_district_canton FOREIGN KEY
    (id_canton) REFERENCES
    CANTON(id_canton);

--Canton's foreign key
ALTER TABLE CANTON
    ADD CONSTRAINT fk_canton_province FOREIGN KEY
    (id_province) REFERENCES
    PROVINCE(id_province);

--Province's foreign key
ALTER TABLE PROVINCE
    ADD CONSTRAINT fk_province_country FOREIGN KEY
    (id_country) REFERENCES
    COUNTRY(id_country);
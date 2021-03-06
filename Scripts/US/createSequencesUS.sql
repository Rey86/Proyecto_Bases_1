-- Sequence to fill id GENERALLOG table.
CREATE SEQUENCE s_generallog
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
    
-- Sequence to fill id USERTYPE table.
CREATE SEQUENCE s_usertype
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
    
-- Sequence to fill id BANREASON table.
CREATE SEQUENCE s_banreason
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
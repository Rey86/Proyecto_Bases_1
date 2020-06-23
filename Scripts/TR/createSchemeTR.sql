CREATE TABLESPACE TR_Data
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\trData01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
	
CREATE TABLESPACE TR_Ind
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\trInd01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
    
CREATE USER TR
    IDENTIFIED BY TR
    DEFAULT TABLESPACE TR_Data
    QUOTA 10M ON TR_Data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system ;
    
GRANT CONNECT TO TR;

GRANT CREATE SESSION TO TR;

GRANT CREATE TABLE TO TR;

GRANT UNLIMITED TABLESPACE TO TR;

GRANT CREATE TRIGGER TO TR;

GRANT CREATE SEQUENCE TO TR;

GRANT CREATE PROCEDURE TO TR;

GRANT REFERENCES ON US.USERAPP TO TR;

GRANT REFERENCES ON Place.COMMUNITY TO TR;

GRANT REFERENCES ON PRSN.PERSON TO TR;

GRANT SELECT ON PRSN.PERSON TO TR;

GRANT SELECT ON Place.COMMUNITY TO TR;

GRANT SELECT ON PRSN.COMPANY TO TR;

GRANT SELECT ON PRSN.GENDER TO TR;

GRANT SELECT ON Place.DISTRICT TO TR;

GRANT SELECT ON Place.CANTON TO TR;

GRANT SELECT ON Place.PROVINCE TO TR;

GRANT SELECT ON Place TO TR;
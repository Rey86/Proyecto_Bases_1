CREATE TABLESPACE US_Data
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\usData01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
	
CREATE TABLESPACE US_Ind
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\usInd01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
    
CREATE USER US
    IDENTIFIED BY US
    DEFAULT TABLESPACE US_Data
    QUOTA 10M ON US_Data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system ;
    
GRANT CONNECT TO US;

GRANT CREATE SESSION TO US;

GRANT CREATE TABLE TO US;

GRANT UNLIMITED TABLESPACE TO US;

GRANT CREATE TRIGGER TO US;

GRANT CREATE SEQUENCE TO US;

GRANT CREATE PROCEDURE TO US;

GRANT REFERENCES ON PRSN.PERSON TO US; 

GRANT SELECT ON PRSN.PERSON TO US;

GRANT SELECT ON PRSN.COMPANY TO US;

GRANT SELECT ON PRSN.GENDER TO US;

GRANT INSERT ON ADM.GENERALLOG TO US;

GRANT SELECT ON ADM.GENERALLOG TO US;
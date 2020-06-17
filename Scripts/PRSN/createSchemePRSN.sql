CREATE TABLESPACE PRSN_Data
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\prsnData01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
	
CREATE TABLESPACE PRSN_Ind
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\prsnInd01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
    
CREATE USER PRSN
    IDENTIFIED BY PRSN
    DEFAULT TABLESPACE PRSN_Data
    QUOTA 10M ON PRSN_Data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system ;
    
GRANT CONNECT TO PRSN;

GRANT CREATE SESSION TO PRSN;

GRANT CREATE TABLE TO PRSN;

GRANT UNLIMITED TABLESPACE TO PRSN;

GRANT CREATE TRIGGER TO PRSN;

GRANT CREATE SEQUENCE TO PRSN;
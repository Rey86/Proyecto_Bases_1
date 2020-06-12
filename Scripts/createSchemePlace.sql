CREATE TABLESPACE Place_Data
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\placeData01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
	
CREATE TABLESPACE Place_Ind
    DATAFILE 'C:\app\Familia\oradata\DBPRUEBA\placeInd01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
    
CREATE USER Place
    IDENTIFIED BY Place
    DEFAULT TABLESPACE Place_Data
    QUOTA 10M ON Place_Data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system ;
    
GRANT CONNECT TO Place;

GRANT CREATE SESSION TO Place;

GRANT CREATE TABLE TO Place;
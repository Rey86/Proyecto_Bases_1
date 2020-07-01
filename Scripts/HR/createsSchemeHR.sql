CREATE TABLESPACE HR_Data
    DATAFILE 'C:\app\Reyner\oradata\DBPROJECT1\hrData01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
	
CREATE TABLESPACE HR_Ind
    DATAFILE 'C:\app\Reyner\oradata\DBPROJECT1\hrInd01.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
    
CREATE USER HR
    IDENTIFIED BY HR
    DEFAULT TABLESPACE HR_Data
    QUOTA 10M ON HR_Data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system ;
    
GRANT CONNECT TO HR;

GRANT CREATE SESSION TO HR;

GRANT EXECUTE ON Place.PlaceTables TO HR;

GRANT EXECUTE ON TR.TRUserReports TO HR;

GRANT EXECUTE ON US.USTables TO HR;

GRANT EXECUTE ON ADM.ADMTables TO HR;

GRANT EXECUTE ON PRSN.PRSNTables TO HR;

GRANT EXECUTE ON TR.TRTables TO HR;
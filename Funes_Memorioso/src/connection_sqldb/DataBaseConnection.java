package connection_sqldb;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Types;
import oracle.jdbc.OracleTypes;

public class DataBaseConnection {
    // Function that returns a connection with the data base
    public static Connection getConnectionDataBase() throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBPROJECT1";
        String uName = "HR";
        String uPass = "HR";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        return con;
    }
    
    // Parameter
    // Function to get all parameters of the system
    public static ResultSet getParameters() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call ADM.ADMTables.getParameter(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a parameter of the system
    public static ResultSet getParameter(Integer pnIdParameter) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call ADM.ADMTables.getParameter(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdParameter);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a parameter of the system
    public static void setParameter(Integer pnIdParameter, String pcParameterName, Integer pnParameterValue) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call ADM.ADMTables.setParameter(?,?,?)}");
        
        stmt.setInt(1, pnIdParameter);
        stmt.setString(2, pcParameterName);
        stmt.setInt(3, pnParameterValue);
        stmt.execute();
    }
    
    // Function to delete a parameter of the system
    public static void deleteParameter(Integer pnIdParameter) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call ADM.ADMTables.deleteParameter(?)}");
        
        stmt.setInt(1, pnIdParameter);
        stmt.execute();
    }
    
    // Function to insert a parameter of the system
    public static void insertParameter(String pcParameterName, Integer pnParameterValue) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call ADM.ADMTables.insertParamer(?,?)}");
        
        stmt.setString(1, pcParameterName);
        stmt.setInt(2, pnParameterValue);
        stmt.execute();
    }
    
    // Community
    // Function to get all communities of the system
    public static ResultSet getCommunities() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCommunity(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a community of the system
    public static ResultSet getCommunity(Integer pnIdCommunity) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCommunity(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdCommunity);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a community of the system
    public static void setCommunity(Integer pnIdCommunity, String pcCommunityName, Integer pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.setCommunity(?,?,?)}");
        
        stmt.setInt(1, pnIdCommunity);
        stmt.setString(2, pcCommunityName);
        stmt.setInt(3, pnIdDistrict);
        stmt.execute();
    }
    
    // Function to delete a community of the system
    public static void deleteCommunity(Integer pnIdCommunity) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.deleteCommunity(?)}");
        
        stmt.setInt(1, pnIdCommunity);
        stmt.execute();
    }
    
    // Procedure to insert a community in the system
    public static void insertCommunity(String pcCommunityName, Integer pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertCommunity(?,?)}");
        
        stmt.setString(1, pcCommunityName);
        stmt.setInt(2, pnIdDistrict);
        stmt.execute();
    }
    
    // District
    // Function to get all districts of the system
    public static ResultSet getDistricts() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getDistrict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a district of the system
    public static ResultSet getDistrict(Integer pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getDistrict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdDistrict);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a district of the system
    public static void setDistrict(Integer pnIdDistrict, String pcDistrictName, Integer pnIdCanton) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.setDistrict(?,?,?)}");
        
        stmt.setInt(1, pnIdDistrict);
        stmt.setString(2, pcDistrictName);
        stmt.setInt(3, pnIdCanton);
        stmt.execute();
    }
    
    // Function to delete a district of the system
    public static void deleteDistrict(Integer pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.deleteDistrict(?)}");
        
        stmt.setInt(1, pnIdDistrict);
        stmt.execute();
    }
    
    // Procedure to insert a district in the system
    public static void insertDistrict(String pcDistrictName, Integer pnIdCanton) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertDistrict(?,?)}");
        
        stmt.setString(1, pcDistrictName);
        stmt.setInt(2, pnIdCanton);
        stmt.execute();
    }
    
    // Canton
    // Function to get all cantons of the system
    public static ResultSet getCantons() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCanton(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a canton of the system
    public static ResultSet getCanton(Integer pnIdCanton) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCanton(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdCanton);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a canton of the system
    public static void setCanton(Integer pnIdCanton, String pcCantonName, Integer pnIdProvince) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.setCanton(?,?,?)}");
        
        stmt.setInt(1, pnIdCanton);
        stmt.setString(2, pcCantonName);
        stmt.setInt(3, pnIdProvince);
        stmt.execute();
    }
    
    // Function to delete a district of the system
    public static void deleteCanton(Integer pnIdCanton) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.deleteCanton(?)}");
        
        stmt.setInt(1, pnIdCanton);
        stmt.execute();
    }
    
    // Procedure to insert a district in the system
    public static void insertCanton(String pcCantonName, Integer pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertCanton(?,?)}");
        
        stmt.setString(1, pcCantonName);
        stmt.setInt(2, pnIdDistrict);
        stmt.execute();
    }
    
    // Province
    // Function to get all provinces of the system
    public static ResultSet getProvinces() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getProvince(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a province of the system
    public static ResultSet getProvince(Integer pnIdProvince) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getProvince(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdProvince);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a province of the system
    public static void setProvince(Integer pnIdProvince, String pcProvinceName, Integer pnIdCountry) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.setProvince(?,?,?)}");
        
        stmt.setInt(1, pnIdProvince);
        stmt.setString(2, pcProvinceName);
        stmt.setInt(3, pnIdCountry);
        stmt.execute();
    }
    
    // Function to delete a province of the system
    public static void deleteProvince(Integer pnIdProvince) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.deleteProvince(?)}");
        
        stmt.setInt(1, pnIdProvince);
        stmt.execute();
    }
    
    // Procedure to insert a province in the system
    public static void insertProvince(String pcProvinceName, Integer pnIdCountry) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertProvince(?,?)}");
        
        stmt.setString(1, pcProvinceName);
        stmt.setInt(2, pnIdCountry);
        stmt.execute();
    }
    
    // Country
    // Function to get all countries of the system
    public static ResultSet getCountries() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCountry(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a country of the system
    public static ResultSet getCountry(Integer pnIdCountry) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCountry(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdCountry);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a country of the system
    public static void setCountry(Integer pnIdCountry, String pcCountryName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.setCountry(?,?)}");
        
        stmt.setInt(1, pnIdCountry);
        stmt.setString(2, pcCountryName);
        stmt.execute();
    }
    
    // Function to delete a country of the system
    public static void deleteCountry(Integer pnIdCountry) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.deleteCountry(?)}");
        
        stmt.setInt(1, pnIdCountry);
        stmt.execute();
    }
    
    // Procedure to insert a country in the system
    public static void insertCountry(String pcCountryName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertCountry(?)}");
        
        stmt.setString(1, pcCountryName);
        stmt.execute();
    }
    
    //Person
    // Function to get all persons of the system
    public static ResultSet getPersons() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call PRSN.PRSNTables.getPerson(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.VARCHAR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a person of the system
    public static ResultSet getPerson(String pcIdPerson) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call PRSN.PRSNTables.getPerson(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setString(2, pcIdPerson);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a person of the system
    public static void setPerson(String pcIdPerson, String pcFirstName, String pcLastName, 
            String pcSecondLastName, String pdBirthdate, Integer pnIdGender, Integer pnIdCompany) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.setPerson(?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcIdPerson);
        stmt.setString(2, pcFirstName);
        stmt.setString(3, pcLastName);
        stmt.setString(4, pcSecondLastName);
        stmt.setString(5, pdBirthdate);
        stmt.setInt(6, pnIdGender);
        stmt.setInt(7, pnIdCompany);
        stmt.execute();
    }
    
    // Function to delete a person of the system
    public static void deletePerson(String pcIdPerson) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.deletePerson(?)}");
        
        stmt.setString(1, pcIdPerson);
        stmt.execute();
    }
    
    // Procedure to insert a person in the system
    public static void insertPerson(String pcIdPerson, String pcFirstName, String pcLastName, 
            String pcSecondLastName, String pdBirthdate, Integer pnIdGender, Integer pnIdCompany) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.insertPerson(?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcIdPerson);
        stmt.setString(2, pcFirstName);
        stmt.setString(3, pcLastName);
        stmt.setString(4, pcSecondLastName);
        stmt.setString(5, pdBirthdate);
        stmt.setInt(6, pnIdGender);
        stmt.setInt(7, pnIdCompany);
        stmt.execute();
    }
    
    // Company
    // Function to get all companies of the system
    public static ResultSet getCompanies() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call PRSN.PRSNTables.getCompany(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a company of the system
    public static ResultSet getCompany(Integer pnIdCompany) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call PRSN.PRSNTables.getCompany(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdCompany);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a company of the system
    public static void setCompany(Integer pnIdCompany, String pcCompanyName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.setCompany(?,?)}");
        
        stmt.setInt(1, pnIdCompany);
        stmt.setString(2, pcCompanyName);
        stmt.execute();
    }
    
    // Function to delete a company of the system
    public static void deleteCompany(Integer pnIdCompany) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.deleteCompany(?)}");
        
        stmt.setInt(1, pnIdCompany);
        stmt.execute();
    }
    
    // Procedure to insert a company in the system
    public static void insertCompany(String pcCompanyName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.insertCompany(?)}");
        
        stmt.setString(1, pcCompanyName);
        stmt.execute();
    }
    
    // Gender
    // Function to get all genders of the system
    public static ResultSet getGenders() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call PRSN.PRSNTables.getGender(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a gender of the system
    public static ResultSet getGender(Integer pnIdGender) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call PRSN.PRSNTables.getGender(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdGender);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a gender of the system
    public static void setGender(Integer pnIdGender, String pcGenderName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.setGender(?,?)}");
        
        stmt.setInt(1, pnIdGender);
        stmt.setString(2, pcGenderName);
        stmt.execute();
    }
    
    // Function to delete a gender of the system
    public static void deleteGender(Integer pnIdGender) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.deleteGender(?)}");
        
        stmt.setInt(1, pnIdGender);
        stmt.execute();
    }
    
    // Procedure to insert a gender in the system
    public static void insertGender(String pcGenderName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.insertGender(?)}");
        
        stmt.setString(1, pcGenderName);
        stmt.execute();
    }
    
    //Transcript 
    // Function to get all transcripts of the system
    public static ResultSet getTranscripts() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getTranscript(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.VARCHAR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a transcript of the system
    public static ResultSet getTranscript(String pcTranscriptNumber) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getTranscript(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setString(2, pcTranscriptNumber);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a transcript of the system
    public static void setTranscript(String pcTranscriptNumber, Integer pnValid, String pcIdAccused, 
            Integer pnIdTranscriptType, Integer pnIdVerdict, Integer pnIdCommunity, 
            String pnSentenceStartDate, String pnSentenceEndDate, Integer pnIdSentenceType, String pcCrimeDescription, 
            String pdCrimeDate, String pdDueDate) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.setTranscript(?,?,?,?,?,?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcTranscriptNumber);
        stmt.setInt(2, pnValid);
        stmt.setString(3, pcIdAccused);
        stmt.setInt(4, pnIdTranscriptType);
        stmt.setInt(5, pnIdVerdict);
        stmt.setInt(6, pnIdCommunity);
        stmt.setString(7, pnSentenceStartDate);
        stmt.setString(8, pnSentenceEndDate);
        stmt.setInt(9, pnIdSentenceType);
        stmt.setString(10, pcCrimeDescription);
        stmt.setString(11, pdCrimeDate);
        stmt.setString(12, pdDueDate);
        stmt.execute();
    }
    
    // Function to delete a transcript of the system
    public static void deleteTranscript(String pcTranscriptNumber) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.deleteTranscript(?)}");
        
        stmt.setString(1, pcTranscriptNumber);
        stmt.execute();
    }
    
    // Procedure to insert a transcript in the system
    public static void insertTranscript(String pcTranscriptNumber, Integer pnValid, String pcUserName, String pcIdAccused, 
            Integer pnIdTranscriptType, Integer pnIdVerdict, Integer pnIdCommunity, 
            String pnSentenceStartDate, String pnSentenceEndDate, Integer pnIdSentenceType, String pcCrimeDescription, 
            String pdCrimeDate, String pdDueDate) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertTranscript(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcTranscriptNumber);
        stmt.setInt(2, pnValid);
        stmt.setString(3, pcUserName);
        stmt.setString(4, pcIdAccused);
        stmt.setInt(5, pnIdTranscriptType);
        stmt.setInt(6, pnIdVerdict);
        stmt.setInt(7, pnIdCommunity);
        stmt.setString(8, pnSentenceStartDate);
        stmt.setString(9, pnSentenceEndDate);
        stmt.setInt(10, pnIdSentenceType);
        stmt.setString(11, pcCrimeDescription);
        stmt.setString(12, pdCrimeDate);
        stmt.setString(13, pdDueDate);
        stmt.execute();
    }
    
    // TranscriptType
    // Function to get all transcript types of the system
    public static ResultSet getTranscriptTypes() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getTranscriptType(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a transcript type of the system
    public static ResultSet getTranscriptType(Integer pnIdTranscriptType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getTranscriptType(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdTranscriptType);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a transcript type of the system
    public static void setTranscriptType(Integer pnIdTranscriptType, String pcTranscriptTypeName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.setTranscriptType(?,?)}");
        
        stmt.setInt(1, pnIdTranscriptType);
        stmt.setString(2, pcTranscriptTypeName);
        stmt.execute();
    }
    
    // Function to delete a transcript type of the system
    public static void deleteTranscriptType(Integer pnIdTranscriptType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.deleteTranscriptType(?)}");
        
        stmt.setInt(1, pnIdTranscriptType);
        stmt.execute();
    }
    
    // Procedure to insert a transcript type in the system
    public static void insertTranscriptType(String pcTranscriptTypeName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertTranscriptType(?)}");
        
        stmt.setString(1, pcTranscriptTypeName);
        stmt.execute();
    }
    
    // Accused
    // Function to get all accused of the system
    public static ResultSet getAllAccused() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getAccused(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.VARCHAR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a accused of the system
    public static ResultSet getAccused(String pcIdAccused) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getAccused(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setString(2, pcIdAccused);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to delete a accused of the system
    public static void deleteAccused(String pcIdAccused) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.deleteAccused(?)}");
        
        stmt.setString(1, pcIdAccused);
        stmt.execute();
    }
    
    // Procedure to insert a accused in the system
    public static void insertAccused(String pcIdAccused) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertAccused(?)}");
        
        stmt.setString(1, pcIdAccused);
        stmt.execute();
    }
    
    // Verdict
    // Function to get all verdicts of the system
    public static ResultSet getVerdicts() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getVerdict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a verdict of the system
    public static ResultSet getVerdict(Integer pnIdVerdict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getVerdict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdVerdict);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a verdict of the system
    public static void setVerdict(Integer pnIdVerdict, String pcVerdictName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.setVerdict(?,?)}");
        
        stmt.setInt(1, pnIdVerdict);
        stmt.setString(2, pcVerdictName);
        stmt.execute();
    }
    
    // Function to delete a verdict of the system
    public static void deleteVerdict(Integer pnIdVerdict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.deleteVerdict(?)}");
        
        stmt.setInt(1, pnIdVerdict);
        stmt.execute();
    }
    
    // Procedure to insert a verdict in the system
    public static void insertVerdict(String pcVerdictName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertVerdict(?)}");
        
        stmt.setString(1, pcVerdictName);
        stmt.execute();
    }
    
    // SentenceType
    // Function to get all sentence types of the system
    public static ResultSet getSentenceTypes() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getSentenceType(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a sentence type of the system
    public static ResultSet getSentenceType(Integer pnIdSentenceType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getSentenceType(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdSentenceType);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a sentence type of the system
    public static void setSentenceType(Integer pnIdSentenceType, String pcSentenceTypeName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.setSentenceType(?,?)}");
        
        stmt.setInt(1, pnIdSentenceType);
        stmt.setString(2, pcSentenceTypeName);
        stmt.execute();
    }
    
    // Function to delete a sentence type of the system
    public static void deleteSentenceType(Integer pnIdSentenceType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.deleteSentenceType(?)}");
        
        stmt.setInt(1, pnIdSentenceType);
        stmt.execute();
    }
    
    // Procedure to insert a sentence type in the system
    public static void insertSentenceType(String pcSentenceTypeName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertSentenceType(?)}");
        
        stmt.setString(1, pcSentenceTypeName);
        stmt.execute();
    }
    
    // Photo
    // Function to get all photos of the system
    public static ResultSet getPhotos() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getPhoto(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a photo of the system
    public static ResultSet getPhoto(Integer pnIdPhoto) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getPhoto(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdPhoto);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a photo of the system
    public static void setPhoto(Integer pnIdPhoto, String pcPhotoDescription, String pcDirection, 
            String pcIdAccused) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.setPhoto(?,?,?,?)}");
        
        stmt.setInt(1, pnIdPhoto);
        stmt.setString(2, pcPhotoDescription);
        stmt.setString(3, pcDirection);
        stmt.setString(4, pcIdAccused);
        stmt.execute();
    }
    
    // Function to delete a photo of the system
    public static void deletePhoto(Integer pnIdPhoto) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.deletePhoto(?)}");
        
        stmt.setInt(1, pnIdPhoto);
        stmt.execute();
    }
    
    // Procedure to insert a photo in the system
    public static void insertPhoto(String pcPhotoDescription, String pcDirection, String pcIdAccused) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertPhoto(?,?,?)}");
        
        stmt.setString(1, pcPhotoDescription);
        stmt.setString(2, pcDirection);
        stmt.setString(3, pcIdAccused);
        stmt.execute();
    }
    
    //UserApp
    // Function to get all users app of the system
    public static ResultSet getUsersApp() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USTables.getUserApp(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.VARCHAR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a user app of the system
    public static ResultSet getUserApp(String pcUserName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USTables.getUserApp(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setString(2, pcUserName);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Procedure to set a user app of the system
    public static void setUserApp(String pcUserName, Integer pnBanDays, Integer pnBanned, 
            Integer pnIdUserType, String pcIdUser) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.setUserApp(?,?,?,?,?)}");
        
        stmt.setString(1, pcUserName);
        stmt.setInt(2, pnBanDays);
        stmt.setInt(3, pnBanned);
        stmt.setInt(4, pnIdUserType);
        stmt.setString(5, pcIdUser);
        stmt.execute();
    }
    
    // Function to delete a user app of the system
    public static void deleteUserApp(String pcUserName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.deleteUserApp(?)}");
        
        stmt.setString(1, pcUserName);
        stmt.execute();
    }
    
    // Procedure to insert a user app in the system
    public static void insertUserApp(String pcUserName, String pcUserPassword, Integer pnBanDays, Integer pnBanned, 
            Integer pnIdUserType, String pcIdUser) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.insertUserApp(?,?,?,?,?,?)}");
        
        stmt.setString(1, pcUserName);
        stmt.setString(2, pcUserPassword);
        stmt.setInt(3, pnBanDays);
        stmt.setInt(4, pnBanned);
        stmt.setInt(5, pnIdUserType);
        stmt.setString(6, pcIdUser);
        stmt.execute();
    }
    
    public static String getUserPassword(String pcUserName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ ?= call US.USTables.getUserPassword(?)}");
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setString(2, pcUserName);
        stmt.executeQuery();
        String password = (String) stmt.getObject(1);
        return password;
    }
    
    public static Boolean isBannedUser(String pcUserName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ ?= call US.USTables.isBannedUser(?)}");
        
        stmt.registerOutParameter(1, Types.INTEGER);
        stmt.setString(2, pcUserName);
        stmt.executeQuery();
        Integer banned = (Integer) stmt.getObject(1);
        if (banned == 1) return true; 
        else return false;
    }
    
    public static String getCurrentUserType(String pcUserName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ ?= call US.USTables.getCurrentUserType(?)}");
        
        stmt.registerOutParameter(1, Types.VARCHAR);
        stmt.setString(2, pcUserName);
        stmt.executeQuery();
        String usertype_name = (String) stmt.getObject(1);  
        return usertype_name;
    }
    
    public static void setPassword(String pcUserName, String pcUserPassword) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.setPassword(?, ?)}");

        stmt.setString(1, pcUserName);
        stmt.setString(2, pcUserPassword);
        stmt.execute();
    }
    
    // UserType
    // Function to get all user types of the system
    public static ResultSet getUserTypes() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USTables.getUserType(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a user type of the system
    public static ResultSet getUserType(Integer pnIdUserType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USTables.getUserType(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdUserType);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a user type of the system
    public static void setUserType(Integer pnIdUserType, String pcUserTypeDescription) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.setUserType(?,?)}");
        
        stmt.setInt(1, pnIdUserType);
        stmt.setString(2, pcUserTypeDescription);
        stmt.execute();
    }
    
    // Function to delete a user type of the system
    public static void deleteUserType(Integer pnIdUserType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.deleteUserType(?)}");
        
        stmt.setInt(1, pnIdUserType);
        stmt.execute();
    }
    
    // Procedure to insert a user type in the system
    public static void insertUserType(String pcUserTypeDescription) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.insertUserType(?)}");
        
        stmt.setString(1, pcUserTypeDescription);
        stmt.execute();
    }
    
    // BanReason
    // Function to get all ban reasons of the system
    public static ResultSet getBanReasons() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USTables.getBanReason(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a ban reason of the system
    public static ResultSet getBanReason(Integer pnIdBanReason) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USTables.getBanReason(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdBanReason);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a ban reason of the system
    public static void setBanReason(Integer pnIdBanReason, String pcBanReasonDescription) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.setBanReason(?,?)}");
        
        stmt.setInt(1, pnIdBanReason);
        stmt.setString(2, pcBanReasonDescription);
        stmt.execute();
    }
    
    // Function to delete a ban reason of the system
    public static void deleteBanReason(Integer pnIdBanReason) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.deleteBanReason(?)}");
        
        stmt.setInt(1, pnIdBanReason);
        stmt.execute();
    }
    
    // Procedure to insert a ban reason in the system
    public static void insertBanReason(String pcBanReasonDescription) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.insertBanReason(?)}");
        
        stmt.setString(1, pcBanReasonDescription);
        stmt.execute();
    }
    
    // BanReasonxUserApp  
    // Function to delete a BanReasonxUserApp of the system
    public static void deleteBanReasonxUserApp(Integer pnIdBanReason, String pcUserName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.deleteBanReasonxUserApp(?,?)}");
        
        stmt.setInt(1, pnIdBanReason);
        stmt.setString(2, pcUserName);
        stmt.execute();
    }
    
    // Procedure to insert a BanReasonxUserApp in the system
    public static void insertBanReasonxUserApp(Integer pnIdBanReason, String pcUserName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call US.USTables.insertBanReasonxUserApp(?,?)}");
        
        stmt.setInt(1, pnIdBanReason);
        stmt.setString(2, pcUserName);
        stmt.execute();
    }
    
    // Reports
    // Function to get the new transcripts in the base's transcripts
    public static ResultSet getNewTranscripts() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRAdminReports.getNewTranscripts()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    // Function to get the valid transcripts in the base's transcripts
    public static ResultSet getValidTranscripts() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRAdminReports.getValidTranscripts()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the top communities with the most transcripts time in the base's transcripts
    public static ResultSet getTopTranscriptCommunity(Integer n) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRUserReports.getTopTranscriptCommunity(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, n);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the transcripts per transcript type in the base's transcripts
    public static ResultSet getTranscriptPerType(Integer pnIdTranscriptType, String pdStartDate, String pdEndDate, Integer pnIdCommunity) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRUserReports.getTranscriptPerType(?, ?, ?, ?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        if (pnIdTranscriptType > 0){
            stmt.setInt(2, pnIdTranscriptType);
        } else {
            stmt.setNull(2, Types.INTEGER);
        }
        
        if (!pdStartDate.equals("")) {
            String[] current_startdate = pdStartDate.split("-");
            String[] year = current_startdate[2].split(""); 
            stmt.setString(3, current_startdate[0] + "/" + current_startdate[1] + "/" + year[2] + year[3]);
        } else {
            stmt.setNull(3, Types.DATE);
        }
        
        if (!pdEndDate.equals("")) {
            String[] current_enddate = pdEndDate.split("-");
            String[] year = current_enddate[2].split(""); 
            stmt.setString(4, current_enddate[0] + "/" + current_enddate[1] + "/" + year[2] + year[3]);
        } else {
            stmt.setNull(4, Types.DATE);
        }
        
        if (pnIdCommunity > 0){
            stmt.setInt(5, pnIdCommunity);
        } else {
            stmt.setNull(5, Types.INTEGER);
        }
        
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the due transcripts in the base's transcripts
    public static ResultSet getDueSentenceTranscripts() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getDueSentenceTranscripts()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the accused users per comapny in the base's transcripts
    public static ResultSet getAccusedPerCompany() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRUserReports.getAccusedPerCompany()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the top crimes in the base's transcripts
    public static ResultSet getTopCrimes(Integer n) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRUserReports.getTopCrimes(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, n);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the top sentence time in the base's transcripts
    public static ResultSet getTopSentenceTime(Integer n) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRUserReports.getTopSentenceTime(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, n);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
   
    // Function to get the list of users whose password was modified in the last 10 days in the base's users
    public static ResultSet getUserPasswordMod(String pcUserName ,String pcFirstName,String pcLastName, String pcSecondLastName,String pnIdUser) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USAdminReports.getUserPasswordMod(?, ?, ?, ?, ?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        if (pcUserName.equals("")){
            stmt.setNull(2, Types.VARCHAR);
        }else{
            stmt.setString(2, pcUserName);
        }
        if (pcFirstName.equals("")){
            stmt.setNull(3, Types.VARCHAR);
        }else{
            stmt.setString(3, pcFirstName);
        }
        if (pcLastName.equals("")){
            stmt.setNull(4, Types.VARCHAR);
        }else{
            stmt.setString(4, pcLastName);
        }
        if (pcSecondLastName.equals("")){
            stmt.setNull(5, Types.VARCHAR);
        }else{
            stmt.setString(5, pcSecondLastName);
        }
        if (pnIdUser.equals("")){
            stmt.setNull(6, Types.VARCHAR);
        }else{
            stmt.setString(6, pnIdUser);
        }
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the list of all users in the base's users
    public static ResultSet getUserList() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USUserReports.getUserList()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the list of all banned users in the base's users
    public static ResultSet getBannedUserList() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USUserReports.getBannedUserList()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the top reasons for banning in the base's users
    public static ResultSet topBanReason(Integer n) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USUserReports.topBanReason(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, n);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the percentage of all transcripts organized by type in the base's transcript
    public static ResultSet getTranscriptPercentagePerType() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getTranscriptPercentagePerType()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the percentage of trancripts organized by zone in the base's transcript
    public static ResultSet getTrPercentagePerZone(Integer pnIdCountry,Integer pnIdProvince,Integer pnIdCanton,Integer pnIdDistrict) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getTrPercentagePerZone(?, ?, ?, ?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdCountry);
        stmt.setInt(3, pnIdProvince);
        stmt.setInt(4, pnIdCanton);
        stmt.setInt(5, pnIdDistrict);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the percentage of accused users organized by an age range in the base's transcript
    public static ResultSet getAgeRangePercentageAccused() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getAgeRangePercentageAccused()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the percentage of accused users organized by zone in the base's transcript
    public static ResultSet getAccuTrPercentPerZone(Integer pnIdCommunity, Integer pnIdCountry,Integer pnIdProvince,Integer pnIdCanton,Integer pnIdDistrict) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getTrPercentagePerZone(?, ?, ?, ?, ?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdCommunity);
        stmt.setInt(3, pnIdCountry);
        stmt.setInt(4, pnIdProvince);
        stmt.setInt(5, pnIdCanton);
        stmt.setInt(6, pnIdDistrict);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the average sentence time organized per type in the base's transcript
    public static ResultSet getAverageSentenceTimePerType() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getAverageSentenceTimePerType()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the list of due transcripts 
    public static ResultSet getDueTranscripts(String pdStartDate, String pdEndDate) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRUserReports.getDueTranscripts(?,?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        if (!pdStartDate.equals("")) {
            String[] current_startdate = pdStartDate.split("-");
            String[] year = current_startdate[2].split(""); 
            stmt.setString(2, current_startdate[0] + "/" + current_startdate[1] + "/" + year[2] + year[3]);
        } else {
            stmt.setNull(2, Types.DATE);
        }
        
        if (!pdEndDate.equals("")) {
            String[] current_enddate = pdEndDate.split("-");
            String[] year = current_enddate[2].split(""); 
            stmt.setString(3, current_enddate[0] + "/" + current_enddate[1] + "/" + year[2] + year[3]);
        } else {
            stmt.setNull(3, Types.DATE);
        }
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the sentence time organized by type in the base's transcript
    public static ResultSet getSentenceTimePerType() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getSentenceTimePerType()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the sentence type organized by transcript type in the base's transcript
    public static ResultSet getSentenceTypePerType() throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRStatisticReports.getSentenceTypePerType()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get the percentage of all users organized by an age range in the base's users
    public static ResultSet getAgeRangePercentageUsers () throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call US.USStatisticReports.getAgeRangePercentageUsers ()}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
}


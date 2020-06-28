package connection_sqldb;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Types;
import java.time.LocalDate;
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
            String pcSecondLastName, Date pdBirthdate, Integer pnIdGender, Integer pnIdCompany) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.setPerson(?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcIdPerson);
        stmt.setString(2, pcFirstName);
        stmt.setString(3, pcLastName);
        stmt.setString(4, pcSecondLastName);
        stmt.setDate(5, pdBirthdate);
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
            String pcSecondLastName, Date pdBirthdate, Integer pnIdGender, Integer pnIdCompany) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call PRSN.PRSNTables.insertPerson(?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcIdPerson);
        stmt.setString(2, pcFirstName);
        stmt.setString(3, pcLastName);
        stmt.setString(4, pcSecondLastName);
        stmt.setDate(5, pdBirthdate);
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
            Integer pnIdSentence, Integer pnIdCrime, Date pdDueDate) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.setTranscript(?,?,?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcTranscriptNumber);
        stmt.setInt(2, pnValid);
        stmt.setString(3, pcIdAccused);
        stmt.setInt(4, pnIdTranscriptType);
        stmt.setInt(5, pnIdVerdict);
        stmt.setInt(6, pnIdCommunity);
        stmt.setInt(7, pnIdSentence);
        stmt.setInt(8, pnIdCrime);
        stmt.setDate(9, pdDueDate);
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
    public static void insertTranscript(String pcTranscriptNumber, Integer pnValid, String pcIdAccused, 
            Integer pnIdTranscriptType, Integer pnIdVerdict, Integer pnIdCommunity, 
            Integer pnIdSentence, Integer pnIdCrime, Date pdDueDate) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertTranscript(?,?,?,?,?,?,?,?,?)}");
        
        stmt.setString(1, pcTranscriptNumber);
        stmt.setInt(2, pnValid);
        stmt.setString(3, pcIdAccused);
        stmt.setInt(4, pnIdTranscriptType);
        stmt.setInt(5, pnIdVerdict);
        stmt.setInt(6, pnIdCommunity);
        stmt.setInt(7, pnIdSentence);
        stmt.setInt(8, pnIdCrime);
        stmt.setDate(9, pdDueDate);
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
    
    // Sentence
    // Function to get all sentences of the system
    /*public static ResultSet getVerdicts() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getSentence(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to get a sentence of the system
    public static ResultSet getSentence(Integer pnIdSentence) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRTables.getSentence(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdSentence);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }*/
    
    // Function to set a sentence of the system
    public static void setSentence(Integer pnIdSentence, Date pdStartDate, Date pdEndDate, 
            Integer pnIdSentenceType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.setSentence(?,?)}");
        
        stmt.setInt(1, pnIdSentence);
        stmt.setDate(2, pdStartDate);
        stmt.setDate(3, pdEndDate);
        stmt.setInt(4, pnIdSentenceType);
        stmt.execute();
    }
    
    // Function to delete a sentence of the system
    public static void deleteSentence(Integer pnIdSentence) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.deleteSentence(?)}");
        
        stmt.setInt(1, pnIdSentence);
        stmt.execute();
    }
    
    // Procedure to insert a sentence in the system
    public static void insertSentence(Date pdStartDate, Date pdEndDate, Integer pnIdSentenceType) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call TR.TRTables.insertSentence(?)}");
        
        stmt.setDate(1, pdStartDate);
        stmt.setDate(2, pdEndDate);
        stmt.setInt(3, pnIdSentenceType);
        stmt.execute();
    }
    
    //Reports
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
}

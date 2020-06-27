package connection_sqldb;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    public static ArrayList<String> getParameters() throws SQLException{
        ArrayList<String> parameters = new ArrayList<String>();
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call ADM.ADMTables.getParameter(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            parameters.add("ID: " + Integer.toString(r.getInt("ID_PARAMETER")) + " Nombre: " + 
                r.getString("PARAMETER_NAME") + " Valor: " + Integer.toString(r.getInt("PARAMETER_VALUE")));
        }
        return parameters;
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
    public static ArrayList<String> getCommunities() throws SQLException{
        ArrayList<String> communities = new ArrayList<String>();
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCommunity(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            communities.add("ID: " + Integer.toString(r.getInt("ID_COMMUNITY")) + " Nombre: " + 
                r.getString("COMMUNITY_NAME") + " ID distrito: " + Integer.toString(r.getInt("ID_DISTRICT")));
        }
        return communities;
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
    // Function to get all communities of the system
    public static ArrayList<String> getDistricts() throws SQLException{
        ArrayList<String> districts = new ArrayList<String>();
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getDistrict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            districts.add("ID: " + Integer.toString(r.getInt("ID_DISTRICT")) + " Nombre: " + 
                r.getString("DISTRICT_NAME") + " ID canton: " + Integer.toString(r.getInt("ID_CANTON")));
        }
        return districts;
    }
    
    // Function to get a community of the system
    public static ResultSet getDistrict(Integer pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getDistrict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdDistrict);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a community of the system
    public static void setDistrict(Integer pnIdDistrict, String pcDistrictName, Integer pnIdCanton) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.setDistrict(?,?,?)}");
        
        stmt.setInt(1, pnIdDistrict);
        stmt.setString(2, pcDistrictName);
        stmt.setInt(3, pnIdCanton);
        stmt.execute();
    }
    
    // Function to delete a community of the system
    public static void deleteDistrict(Integer pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.deleteDistrict(?)}");
        
        stmt.setInt(1, pnIdDistrict);
        stmt.execute();
    }
    
    // Procedure to insert a community in the system
    public static void insertDistrict(String pcDistrictName, Integer pnIdCanton) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertDistrict(?,?)}");
        
        stmt.setString(1, pcDistrictName);
        stmt.setInt(2, pnIdCanton);
        stmt.execute();
    }
    
    // Canton
    // Function to get all cantons of the system
    public static ArrayList<String> getCantons() throws SQLException{
        ArrayList<String> cantons = new ArrayList<String>();
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCanton(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            cantons.add("ID: " + Integer.toString(r.getInt("ID_CANTON")) + " Nombre: " + 
                r.getString("CANTON_NAME") + " ID canton: " + Integer.toString(r.getInt("ID_PROVINCE")));
        }
        return cantons;
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
    public static ArrayList<String> getProvinces() throws SQLException{
        ArrayList<String> provinces = new ArrayList<String>();
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getProvince(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            provinces.add("ID: " + Integer.toString(r.getInt("ID_PROVINCE")) + " Nombre: " + 
                r.getString("PROVINCE_NAME") + " ID canton: " + Integer.toString(r.getInt("ID_COUNTRY")));
        }
        return provinces;
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
    // Function to get a country of the system
    public static ArrayList<String> getCountries() throws SQLException{
        ArrayList<String> countries = new ArrayList<String>();
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCountry(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            countries.add("ID: " + Integer.toString(r.getInt("ID_COUNTRY")) + " Nombre: " + r.getString("COUNTRY_NAME"));
        }
        return countries;
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
    public static void setCountry(Integer pnIdCountry, String pcProvinceName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.setCountry(?,?)}");
        
        stmt.setInt(1, pnIdCountry);
        stmt.setString(2, pcProvinceName);
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
    
    //Reports
    // Function to get the top sentence time in the base's transcripts
    public static void getTopSentenceTime(Integer n) throws SQLException {
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call TR.TRUserReports.topSentenceTime(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, n);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            System.out.println(r.getString("SENTENCE_TIME"));
        }
    }
}

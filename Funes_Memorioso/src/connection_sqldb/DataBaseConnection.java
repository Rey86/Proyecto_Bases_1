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
    
    // Function to get all parameters of the system
    public static ArrayList<String> getCommunities() throws SQLException{
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
    
    // Function to get all parameters of the system
    public static ResultSet getCommunity(Integer pnIdParameter) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call ADM.ADMTables.getParameter(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnIdParameter);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        return r;
    }
    
    // Function to set a parameter of the system
    public static void setCommunity(Integer pnIdParameter, String pcParameterName, Integer pnParameterValue) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call ADM.ADMTables.setParameter(?,?,?)}");
        
        stmt.setInt(1, pnIdParameter);
        stmt.setString(2, pcParameterName);
        stmt.setInt(3, pnParameterValue);
        stmt.execute();
    }
    
    // Function to delete a parameter of the system
    public static void deleteCommunity(Integer pnIdParameter) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call ADM.ADMTables.deleteParameter(?)}");
        
        stmt.setInt(1, pnIdParameter);
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
    
    // Procedure to insert a country in the system
    public static void insertCountry(String pcCountryName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertCountry(?)}");
        
        stmt.setString(1, pcCountryName);
        stmt.execute();
    }
    
    // Function to get a country of the system
    public static void getCountry() throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{?= call Place.PlaceTables.getCountry(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setNull(2, Types.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        while(r.next()){
            System.out.println(r.getString("COUNTRY_NAME"));
        }
    }
    
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

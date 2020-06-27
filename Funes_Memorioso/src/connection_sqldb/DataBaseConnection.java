package connection_sqldb;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;

public class DataBaseConnection {
    public static Connection getConnectionDataBase() throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBPROJECT1";
        String uName = "HR";
        String uPass = "HR";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        return con;
    }
    
    public static void insertCommunity(String pcCommunityName, int pnIdDistrict) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertCommunity(?,?)}");
        
        stmt.setString(1, pcCommunityName);
        stmt.setInt(2, pnIdDistrict);
        stmt.execute();
    }
    
    public static void insertCountry(String pcCountryName) throws SQLException{
        Connection con = getConnectionDataBase();
        CallableStatement stmt = con.prepareCall("{ call Place.PlaceTables.insertCountry(?)}");
        
        stmt.setString(1, pcCountryName);
        stmt.execute();
    }
}

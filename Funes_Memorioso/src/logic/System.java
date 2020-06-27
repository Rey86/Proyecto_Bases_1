package logic;

import connection_sqldb.DataBaseConnection;
import java.sql.SQLException;

public class System {
    public static void main(String[] args) throws SQLException {
        DataBaseConnection.getCountry(1);
    }
}
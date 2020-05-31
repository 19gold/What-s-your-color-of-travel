package board;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class DBconnection {
	public static Connection getConnection() throws SQLException, NamingException, CannotProceedException{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/mydb");
		Connection conn = ds.getConnection();

		return conn;
	}
}

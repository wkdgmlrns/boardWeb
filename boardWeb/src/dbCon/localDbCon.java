package dbCon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class localDbCon {
	String drv = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
	String user = "wkd123", passwd = "wkd123";

	/*public PreparedStatement getPstmt(String sql) {
	try {
	
		Class.forName(drv);
		con = (Connection)DriverManager.getConnection(url,user,passwd);
		pstmt = con.prepareStatement(sql);
	}catch(SQLException e) {e.printStackTrace();}
	catch(ClassNotFoundException e) {e.printStackTrace();}
	return pstmt;
	}*/

	public PreparedStatement getPstmt(String sql) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(drv);
			con = (Connection)DriverManager.getConnection(url,user,passwd);
			pstmt = con.prepareStatement(sql);
		}catch(SQLException e) {e.printStackTrace();}
		catch(ClassNotFoundException e) {e.printStackTrace();}
		return pstmt;
	}
}

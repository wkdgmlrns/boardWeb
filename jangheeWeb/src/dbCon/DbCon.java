package dbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbCon {
	private static DbCon instance = new DbCon();
	public static DbCon getInstance() {
		return instance;
	}
	public DbCon() {}
	public Connection getCon() {
		Connection con=null;
		try {
			Context iniCtx = new InitialContext();
			Context envCtx = (Context)iniCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/oracle");
			con = ds.getConnection();
		}catch(Exception e) {e.printStackTrace();}
		return con;
	}
	public PreparedStatement getPstmt(String sql) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
		}catch(SQLException e) {e.printStackTrace();}
		return pstmt;
	}
	public ResultSet getRs(String sql) {
		ResultSet rs = null;
		PreparedStatement pstmt=null;
		try {
			pstmt = getPstmt(sql);
			rs = pstmt.executeQuery();
		}catch(SQLException e) {e.printStackTrace();}
		return rs;
	}
}

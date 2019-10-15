package dbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class dbCon {
	private static dbCon instance = new dbCon();
	public static dbCon getInstance() {
		return instance;
	}
	
	private dbCon() {}
	
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
		PreparedStatement pstmtt = null;
		Connection con = null;
		try {
		con = getCon();
		pstmtt = con.prepareStatement(sql);
		}catch(SQLException e) {e.printStackTrace();}
		return pstmtt;
	}
	public ResultSet getRs(String sql) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = getPstmt(sql);
			rs = pstmt.executeQuery();
		}catch(SQLException e) {e.printStackTrace();}
		return rs;
	}
}

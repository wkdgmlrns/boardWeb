package dbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class dbCon {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public Connection getCon() {
		Connection conn=null;
		try {
		Context in = new InitialContext();
		Context en = (Context) in.lookup("java:comp/env");
		DataSource ds = (DataSource)en.lookup("jdbc/oracle");
		conn = ds.getConnection();
	}catch(Exception e) {}
		return conn;
	}
	public PreparedStatement getPstmt(String sql) {
		try {
		con = getCon();
		pstmt = con.prepareStatement(sql);
		}catch(SQLException e) {}
		return pstmt;
	}
	public ResultSet getRs(String sql) {
	try {
		con = getCon();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	}catch(SQLException e) {}
	return rs;
	}
}

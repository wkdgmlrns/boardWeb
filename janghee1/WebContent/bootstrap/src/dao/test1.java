package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.*;
import javax.sql.DataSource;

import work.crypt.BCrypt;

public class test1 {
	
	public static void main(String[] args) throws SQLException, NamingException, ClassNotFoundException {
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String url = "oracle.jdbc.OracleDriver";
		String drv = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
		String user = "wkd123", pass="wkd123";
		Class.forName(url);
		con = DriverManager.getConnection(drv,user,pass);
		pstmt = con.prepareStatement("select passwd from member where id=?");
		pstmt.setString(1, "qwer");
		rs = pstmt.executeQuery();
		rs.next();
		String dbPass = rs.getString("passwd");
		System.out.println(dbPass);
		transSha sha = transSha.getInstance();
		String shPass = sha.shaPasswd("1234");
		System.out.println(shPass);
		boolean in = BCrypt.checkpw(shPass, dbPass);
		System.out.println(in);
		
		
	}
}

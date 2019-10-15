import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Dao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Connection UserDAO() {
		try {
			Context iniCtx = new InitialContext();
			Context envCtx = (Context) iniCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("oracle/jdbc");
			con = ds.getConnection();
		}catch(Exception e) {e.printStackTrace();}
		return con;
	}
	public int login(String user_Id, String user_Passwd) {
		String sql="select user_Passwd from user where user_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_Id);
			if(rs.next()) {
				if(rs.getString("user_passwd").equals(user_Passwd))
					return 1; //로그인 성공
				else 
					return 0; //비밀번호 불일치
			}
			return -1; //아이디가 없음
		}catch(SQLException e){}
		return -2;//데이터베이스 오류
	} 
}

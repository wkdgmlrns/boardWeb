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
					return 1; //�α��� ����
				else 
					return 0; //��й�ȣ ����ġ
			}
			return -1; //���̵� ����
		}catch(SQLException e){}
		return -2;//�����ͺ��̽� ����
	} 
}

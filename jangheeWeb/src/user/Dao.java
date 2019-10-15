package user;
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

	public int login(String user_id, String user_Passwd) {
		String sql="SELECT user_passwd FROM use WHERE user_id=?";
		try {
			Context iniCtx = new InitialContext();
			Context envCtx = (Context) iniCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/oracle");
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("user_passwd").equals(user_Passwd))
					return 1; //�α��� ����
				else 
					return 0; //��й�ȣ ����ġ
			}
			return -1; //���̵� ����
		}catch(SQLException e) {e.printStackTrace();}
		catch(Exception e) {e.printStackTrace();}
		return -2;//�����ͺ��̽� ����
	} 
}

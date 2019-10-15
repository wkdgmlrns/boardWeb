package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.encryptionBean;
import dbCon.dbCon;
import work.crypt.BCrypt;
import work.crypt.SHA256;

public class encryptionDao {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	dbCon dbc = new dbCon();

	private static encryptionDao instance = new encryptionDao();

	public static encryptionDao getInstance() {
		return instance;
	}

	public List<encryptionBean> getMember() {
		List<encryptionBean> memberList = null;
		int x = 0;
		try {
			rs = dbc.getRs("select count(*) from member");
			if (rs.next())
				x = rs.getInt(1);

			rs = dbc.getRs("select id, password from member");
			while (rs.next()) {
				memberList = new ArrayList<encryptionBean>(x);
				encryptionBean eBean = new encryptionBean();
				eBean.setId(rs.getString("id"));
				eBean.setPassword(rs.getString("password"));
				memberList.add(eBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		return memberList;
	}

	public void updateMember() {
		SHA256 sha = SHA256.getInsatnce();
		try {
			rs = dbc.getRs("select id, password from member");
			while (rs.next()) {
				String id = rs.getString("id");
				String password = rs.getString("password");

				try {
					String shaPass = sha.getSha256(password.getBytes());
					String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
					pstmt = dbc.getPstmt("update member set password=? where id=?");
					pstmt.setString(1, bcPass);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
	}
}

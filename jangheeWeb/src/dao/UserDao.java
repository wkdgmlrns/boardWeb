package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.UserBean;
import dbCon.DbCon;
import work.crypt.BCrypt;
import work.crypt.SHA256;

public class UserDao {
	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	public void insetUser(UserBean user) {
		DbCon dbc = DbCon.getInstance();
		SHA256 sha = SHA256.getInsatnce();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			String orgPasswd = user.getUser_passwd();
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());
			String bcPasswd = BCrypt.hashpw(shaPasswd, BCrypt.gensalt());

			pstmt = dbc.getPstmt("insert into member values (?,?,?,?,?,?)");
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, bcPasswd);
			pstmt.setString(3, user.getUser_name());
			pstmt.setTimestamp(4, user.getM_date());
			pstmt.setString(5, user.getUser_address());
			pstmt.setString(6, user.getUser_tel());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	public int userCheck(String id, String passwd) {
		DbCon dbc = DbCon.getInstance();
		SHA256 sha = SHA256.getInsatnce();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int x = -1;
		try {
			String orgPasswd = passwd;
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());
			pstmt = dbc.getPstmt("select user_passwd from member where user_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbPasswd = rs.getString("user_passwd");
				if (BCrypt.checkpw(shaPasswd, dbPasswd))
					x = 1;
				else
					x = 0;
			} else
				x = -1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
	}

	public int confirmId(String id) {
		int x = -1;
		DbCon dbc = DbCon.getInstance();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			pstmt = dbc.getPstmt("select user_id from member where user_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				x = 1;
			else
				x = -1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
	}

	public UserBean getMember(String id, String passwd) {
		DbCon dbc = DbCon.getInstance();
		UserBean lBean = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		SHA256 sha = SHA256.getInsatnce();

		try {
			String orgPasswd = passwd;
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());
			pstmt = dbc.getPstmt("select * from member where user_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbPasswd = rs.getString("user_passwd");
				if (BCrypt.checkpw(shaPasswd, dbPasswd)) {
					lBean = new UserBean();
					lBean.setUser_id(rs.getString("id"));
					lBean.setUser_name(rs.getString("name"));
					lBean.setM_date(rs.getTimestamp("rdg_date"));
					lBean.setUser_address(rs.getString("address"));
					lBean.setUser_tel(rs.getString("tel"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return lBean;
	}

	public int updateMember(UserBean lBean) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		SHA256 sha = SHA256.getInsatnce();
		DbCon dbc = DbCon.getInstance();
		int x = -1;
		try {
			String orgPasswd = lBean.getUser_passwd();
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());

			pstmt = dbc.getPstmt("select user_passwd from member where user_id=?");
			pstmt.setString(1, lBean.getUser_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString("user_passwd");
				if (BCrypt.checkpw(shaPasswd, dbPasswd)) {
					pstmt = dbc.getPstmt("update member set user_name=?, user_address=?, user_tel=? where user_id=?");
					pstmt.setString(1, lBean.getUser_name());
					pstmt.setString(2, lBean.getUser_address());
					pstmt.setString(3, lBean.getUser_tel());
					pstmt.setString(4, lBean.getUser_id());
					pstmt.executeQuery();
					x = 1;
				} else
					x = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
	}

	public int deleteMember(String id, String passwd) {
		int x = -1;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		SHA256 sha = SHA256.getInsatnce();
		DbCon dbc = DbCon.getInstance();
		try {
			String orgPasswd = passwd;
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());

			pstmt = dbc.getPstmt("select user_passwd from member where user_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbPasswd = rs.getString("user_passwd");
				if (BCrypt.checkpw(shaPasswd, dbPasswd)) {
					pstmt = dbc.getPstmt("delete from memeber where user_id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;
				} else
					x = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
	}
}

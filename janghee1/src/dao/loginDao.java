package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.LoginBean;
import dbCon.dbCon;
import work.crypt.BCrypt;
import work.crypt.SHA256;

public class loginDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void insetMember(LoginBean member) {
		dbCon dbc = new dbCon();
		transSha sha = new transSha();
		try {
			String orgPasswd = member.getPasswd();
			String shaPasswd = sha.shaPasswd(orgPasswd);
			String bcPasswd = BCrypt.hashpw(shaPasswd, BCrypt.gensalt());

			pstmt = dbc.getPstmt("insert into member values (?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, bcPasswd);
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getReg_date());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getTel());
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
		dbCon dbc = new dbCon();
		transSha sha = new transSha();
		int x = -1;
		try {
			String shaPasswd = sha.shaPasswd(passwd);
			pstmt = dbc.getPstmt("select passwd from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
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
		dbCon dbc = new dbCon();
		try {
			pstmt = dbc.getPstmt("select id from member where id=?");
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

	public LoginBean getMember(String id, String passwd) {
		LoginBean lBean = null;
		dbCon dbc = new dbCon();
		SHA256 sha = new SHA256();

		try {
			String orgPasswd = passwd;
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());
			pstmt = dbc.getPstmt("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
				if (BCrypt.checkpw(shaPasswd, dbPasswd)) {
					lBean = new LoginBean();
					lBean.setId(rs.getString("id"));
					lBean.setName(rs.getString("name"));
					lBean.setReg_date(rs.getTimestamp("rdg_date"));
					lBean.setAddress(rs.getString("address"));
					lBean.setTel(rs.getString("tel"));
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

	public int updateMember(LoginBean lBean) {
		dbCon dbc = new dbCon();
		int x = -1;
		SHA256 sha =new SHA256();
		try {
			String orgPasswd = lBean.getPasswd();
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());

			pstmt = dbc.getPstmt("select passwd from member where id=?");
			pstmt.setString(1, lBean.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
				if (BCrypt.checkpw(shaPasswd, dbPasswd)) {
					pstmt = dbc.getPstmt("update member set name=?, address=?, tel=? where id=?");
					pstmt.setString(1, lBean.getName());
					pstmt.setString(2, lBean.getAddress());
					pstmt.setString(3, lBean.getTel());
					pstmt.setString(4, lBean.getId());
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
		dbCon dbc = new dbCon();
		SHA256 sha = new SHA256();
		try {
			String orgPasswd = passwd;
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());

			pstmt = dbc.getPstmt("select passwd from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
				if (BCrypt.checkpw(shaPasswd, dbPasswd)) {
					pstmt = dbc.getPstmt("delete from memeber where id=?");
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

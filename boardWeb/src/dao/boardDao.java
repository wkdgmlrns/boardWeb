package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.boardBean;
import dbCon.dbCon;

public class boardDao {
	private static boardDao instance = new boardDao();

	public static boardDao getInstance() {
		return instance;
	}

	private boardDao() {
	}

	dbCon dbc = dbCon.getInstance();
	boardBean boBean = new boardBean();

	public int insertAricle(boardBean article) {
		int x = 0;
		int number = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;

		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		try {
			pstmt = dbc.getPstmt("select max(num) from board");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else
				number = 1;
			if (num != 0) {
				sql = "update board set re_step=re_step+1 where ref=? and re_step> ?";
				pstmt = dbc.getPstmt(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step++;
				re_level++;
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			sql = "insert into board(writer,subject,content,passwd,reg_date,";
			sql += "ip,ref,re_step,re_level) values(?,?,?,?,?,?,?,?,?)";
			pstmt = dbc.getPstmt(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getContent());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setString(6, article.getIp());
			pstmt.setInt(7, ref);
			pstmt.setInt(8, re_step);
			pstmt.setInt(9, re_level);
			pstmt.executeUpdate();
			x = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return x;
	}

	public int getArticleCount() {
		int x = 0;
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;

		try {
			pstmt = dbc.getPstmt("select count(*) from board");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return x;
	}

	public List<boardBean> getArticle(int start, int end) {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		List<boardBean> articleList = null;
		try {
			pstmt = dbc.getPstmt("select * from board order by desc, re_step asc limit ?,? ");
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<boardBean>(end);
				do {
					boardBean article = new boardBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setSubject(rs.getString("subject"));
					article.setContent(rs.getString("content"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadCount(rs.getInt("readCount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return articleList;
	}

	public boardBean updateGetArticle(int num) {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		boardBean article = null;

		try {
			pstmt = dbc.getPstmt("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new boardBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setContent(rs.getString("content"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadCount(rs.getInt("readCount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return article;
	}

	public int updateAricle(boardBean article) {
		int x = -1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = dbc.getPstmt("select passwd from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
				if (dbPasswd.equals(article.getPasswd())) {
					String sql = "update board set subject=?,";
					sql += "content=? where num=?";
					pstmt = dbc.getPstmt(sql);
					pstmt.setString(1, article.getSubject());
					pstmt.setString(2, article.getContent());
					pstmt.setInt(3, article.getNum());
					pstmt.executeUpdate();
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
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	public int deleteArticle(int num, String passwd) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			pstmt = dbc.getPstmt("select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
				if (dbPasswd.equals(passwd)) {
					pstmt = dbc.getPstmt("delete from board where num=?");
					pstmt.setInt(1, num);
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
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

}

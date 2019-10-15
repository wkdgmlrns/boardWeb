import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.boardBean;
import dbCon.localDbCon;

public class test {
	//static dbCon dbc = dbCon.getInstance();
	
	public static void main(String[] args) {
		localDbCon dbc = new localDbCon();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		boardBean boBean=null;
		
		try {
		String sql = "select name from member where id=? ";
		pstmt = dbc.getPstmt(sql);
		pstmt.setString(1, "zxcv");
		rs=pstmt.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getString("name"));
		}else
			System.out.println("½ÇÇà");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}

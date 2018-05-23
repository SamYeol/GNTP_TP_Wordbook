package kr.or.gntp.db;

import java.sql.*;
import javax.naming.NamingException;
import kr.or.gntp.db.DBConnection;

public class DBConnectionUseBean {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public void getDBConnection() {
		try {
			con = DBConnection.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public void closeDBConnection() {
		try {
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

package kr.or.gntp.db;

import java.sql.SQLException;
import java.util.Vector;

public class ForHome {
	DBConnectionUseBean db;
	String userID;
	
	public DBConnectionUseBean getDb() {
		return db;
	}

	public void setDb(DBConnectionUseBean db) {
		this.db = db;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public Vector<String> showBookName(DBConnectionUseBean db) {
		this.setDb(db);
		Vector<String> bookname = new Vector<String>(3);
		try {
			
			String sql = "SELECT DISTINCT bookname FROM wordtotal WHERE id = ?";
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1,userID);
			db.rs = db.pstmt.executeQuery();
			
			while (db.rs.next()) {
				bookname.addElement(db.rs.getString("bookname"));
			}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return bookname;
	}
}

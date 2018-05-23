package kr.or.gntp.db;
import java.sql.*;
import java.util.Vector;

public class ForSearch {
	DBConnectionUseBean db;
	String userID;
	String searchInput;
	
	
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
	public String getSearchInput() {
		return searchInput;
	}
	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}
	
	public Vector<String> searchWord(DBConnectionUseBean db) {
		System.out.println(this.searchInput);
		System.out.println(this.userID);
		this.setDb(db);
		Vector<String> result = new Vector<String>();
		try {
			String sql = "SELECT jword, kword, bookname FROM wordtotal WHERE id=? AND( jword LIKE ? OR kword LIKE ?)";
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1,userID);
			db.pstmt.setString(2, "%" + searchInput + "%");
			db.pstmt.setString(3, "%" + searchInput + "%");

			db.rs = db.pstmt.executeQuery();
			
			while (db.rs.next()) {
				result.addElement(db.rs.getString("jword"));
				result.addElement(db.rs.getString("kword"));
				result.addElement(db.rs.getString("bookname"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	/*public String getResult(String column) {
		String result = "";
		try {
			if(db.rs.next()) {
			result = db.rs.getString(column);
			}else{
				result = "";
			
			}} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}*/
}

package kr.or.gntp.db;

import java.sql.SQLException;

public class ForLogin {
	DBConnectionUseBean db;
	String inputID;
	String inputPW;

	public DBConnectionUseBean getDb() {
		return db;
	}

	public void setDb(DBConnectionUseBean db) {
		this.db = db;
	}

	public String getInputID() {
		return inputID;
	}

	public void setInputID(String inputID) {
		this.inputID = inputID;
	}

	public String getInputPW() {
		return inputPW;
	}

	public void setInputPW(String inputPW) {
		this.inputPW = inputPW;
	}

	public boolean checkAdmin(DBConnectionUseBean db) {
		this.setDb(db);
		try{
			String sql = "SELECT * FROM admin WHERE id = ? and pw = ?";
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, inputID);
			db.pstmt.setString(2, inputPW);
			db.rs = db.pstmt.executeQuery();
			if(db.rs.next()) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkLogin() {
		try{
			String sql = "SELECT * FROM member WHERE id = ? and pw = ?";
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, inputID);
			db.pstmt.setString(2, inputPW);

			db.rs = db.pstmt.executeQuery();

			if(db.rs.next()) {

				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}

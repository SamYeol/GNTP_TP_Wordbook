package kr.or.gntp.db;

import java.sql.SQLException;

public class ForJoin {
	DBConnectionUseBean db;
	String inputID;
	String inputPW;
	String inputName;
	String inputPhone;
	String inputMail;

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

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public String getInputPhone() {
		return inputPhone;
	}

	public void setInputPhone(String inputPhone) {
		this.inputPhone = inputPhone;
	}

	public String getInputMail() {
		return inputMail;
	}

	public void setInputMail(String inputMail) {
		this.inputMail = inputMail;
	}


	public boolean joinMember(DBConnectionUseBean db){
		try {
			this.setDb(db);
			String sql = "INSERT INTO member (id,pw,name,phone,mail)VALUES (?,?,?,?,?)";

			db.pstmt = db.con.prepareStatement(sql);

			db.pstmt.setString(1, inputID);
			db.pstmt.setString(2, inputPW);
			db.pstmt.setString(3, inputName);
			db.pstmt.setString(4, inputPhone);
			db.pstmt.setString(5, inputMail);
			int count = db.pstmt.executeUpdate();

			if (count > 0) {
				sql = "SELECT userno FROM member WHERE id = ?";
				db.pstmt = db.con.prepareStatement(sql);
				db.pstmt.setString(1,inputID);
				db.rs=db.pstmt.executeQuery();
				db.rs.next();
				String userno= db.rs.getString("userno");

				sql = "INSERT INTO manage (userno, id) VALUES(?,?)";
				db.pstmt = db.con.prepareStatement(sql);
				db.pstmt.setString(1,userno);
				db.pstmt.setString(2,inputID);
				db.pstmt.executeUpdate();

				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkDouble(DBConnectionUseBean db) {
		this.setDb(db);
		String sql = "SELECT id FROM member WHERE id = ? ";

		try {
			db.pstmt = db.con.prepareStatement(sql);

			db.pstmt.setString(1, inputID);

			db.rs = db.pstmt.executeQuery();


			if(db.rs.next()) {
				return true;
			}} catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}

}


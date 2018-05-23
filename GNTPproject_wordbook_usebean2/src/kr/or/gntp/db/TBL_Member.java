package kr.or.gntp.db;

import java.sql.SQLException;

public class TBL_Member {
	DBConnectionUseBean db;
	String userno = null;
	String userID = null;
	String userPW = null;
	String userName = null;
	String Phone = "user PhoneNumber";
	String Mail = "user MailAdress";
	public DBConnectionUseBean getDb() {
		return db;
	}
	public void setDb(DBConnectionUseBean db) {
		this.db = db;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getMail() {
		return Mail;
	}
	public void setMail(String mail) {
		Mail = mail;
	}

	
	public boolean joinMember(DBConnectionUseBean db){
		try {
			this.setDb(db);
			String sql = "INSERT INTO member (id,pw,name,phone,mail)VALUES (?,?,?,?,?)";

			db.pstmt = db.con.prepareStatement(sql);

			db.pstmt.setString(1, userID);
			db.pstmt.setString(2, userPW);
			db.pstmt.setString(3, userName);
			db.pstmt.setString(4, Phone);
			db.pstmt.setString(5, Mail);
			int count = db.pstmt.executeUpdate();

			if (count > 0) {
				sql = "SELECT userno FROM member WHERE id = ?";
				db.pstmt = db.con.prepareStatement(sql);
				db.pstmt.setString(1,userID);
				db.rs=db.pstmt.executeQuery();
				db.rs.next();
				String userno= db.rs.getString("userno");

				sql = "INSERT INTO manage (userno, id) VALUES(?,?)";
				db.pstmt = db.con.prepareStatement(sql);
				db.pstmt.setString(1,userno);
				db.pstmt.setString(2,userID);
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

			db.pstmt.setString(1, userID);

			db.rs = db.pstmt.executeQuery();


			if(db.rs.next()) {
				return true;
			}} catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}

	public boolean checkAdmin(DBConnectionUseBean db) {
		this.setDb(db);
		try{
			String sql = "SELECT * FROM admin WHERE id = ? and pw = ?";
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, userID);
			db.pstmt.setString(2, userPW);
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
			db.pstmt.setString(1, userID);
			db.pstmt.setString(2, userPW);

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

package kr.or.gntp.db;

import java.sql.SQLException;
import java.util.Vector;

public class TBL_WordTotal {
	DBConnectionUseBean db;
	String wordno = null;
	String userno = null;
	String userID = null;
	String bookno = null;
	String BookName = null;
	String JWord = null;
	String KWord = null;
	String IMG = null;
	String searchInput;
	
	public DBConnectionUseBean getDb() {
		return db;
	}
	public void setDb(DBConnectionUseBean db) {
		this.db = db;
	}
	public String getWordno() {
		return wordno;
	}
	public void setWordno(String wordno) {
		this.wordno = wordno;
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
	public String getBookno() {
		return bookno;
	}
	public void setBookno(String bookno) {
		this.bookno = bookno;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public String getJWord() {
		return JWord;
	}
	public void setJWord(String jWord) {
		JWord = jWord;
	}
	public String getKWord() {
		return KWord;
	}
	public void setKWord(String kWord) {
		KWord = kWord;
	}
	public String getIMG() {
		return IMG;
	}
	public void setIMG(String iMG) {
		IMG = iMG;
	}
	public String getSearchInput() {
		return searchInput;
	}
	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
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
	}return result;
}
}
	
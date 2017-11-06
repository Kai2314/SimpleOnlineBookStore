package com.bitc.store;
import java.sql.*;
public class BookList {
	private Connection con = null;
	private Statement sta = null;
	private ResultSet bookRs = null;
	public BookList() {}
	public void InitBookRs(Connection con,String filter) {
		try {
			if(this.con != con)
				this.con = con;
			
		sta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		bookRs = sta.executeQuery("SELECT * FROM Book WHERE "+filter);
		}catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
	}
	
	public void CloseBookRs() {
		try {
			if(bookRs != null) {
				bookRs.close();
				bookRs = null;
			}
			if(sta != null) {
				sta.close();
				sta = null;
			}
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	//this method will move to next record
	public boolean next() {
		boolean result = false;
		
		try {
			result = bookRs.next();
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//to get the data of id column in record set
	public String getID() {
		String result = null;
		try {
			result = bookRs.getString("ID");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//
	public String getBookID() {
		String result = null;
		try {
			result = bookRs.getString("BookID");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//
	public String getBookNm() {
		String result = null;
		try {
			result = bookRs.getString("BookNm");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//
	public String getAuthor() {
		String result = null;
		try {
			result = bookRs.getString("Author");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//
	public String getPrice() {
		String result = null;
		try {
			result = bookRs.getString("Price");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//
	public String getAbstract() {
		String result = null;
		try {
			result = bookRs.getString("Abstract");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
}

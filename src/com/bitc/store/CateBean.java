package com.bitc.store;
import java.sql.*;
public class CateBean {
	private Connection con = null;
	private Statement sta = null;
	private ResultSet rs = null;
	public CateBean() {}
	
	public void InitCateRs(Connection con) {
		try {
			if(this.con != con)
				this.con = con;
			sta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		
			rs = sta.executeQuery("SELECT * FROM Category");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	
	public void CloseCateRs() {
		try {
			if(rs != null) {
				rs.close();
				rs=null;
			}
		
		if(sta != null) {
			sta.close();
			sta = null;
		}
	    
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	
	public boolean next() {
		boolean result = false;
		try {
			result = rs.next();
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}

	public String getCategory() {
		String result = null;
		try {
			result = rs.getString("Category");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	
	public String getCateID() {
		String result = null;
		try {
			result = rs.getString("ID");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
}

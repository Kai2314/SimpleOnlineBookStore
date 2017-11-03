package com.bitc.store;
import java.sql.*;
public class VoteBean {
	private Connection con = null;
	private Statement sta = null;
	private ResultSet rs = null;
	public VoteBean() {}
	
	public void InitBookRs(Connection con) {
		try {
			this.con = con;
			sta = this.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sta.executeQuery("SELECT ID,BookID,BookNm FROM Book");  //����SQL�ԭz�A�qBook��ƪ���o���
			
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	public void CloseBookRs() {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
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
	public String getID() {
		String result = null;
		try {
			result = rs.getString("ID");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	public String getBookID() {
		String result = null;
		try {
			result = rs.getString("BookID");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	public String getBookNm() {
		String result = null;
		try {
			result = rs.getString("BookNm");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	public void InsertChoice(Connection con,String choice) {
		int affect = 0;
		String strSQL = "INSERT INTO Vote(choice) VALUES ("+choice+")";
		try {
			this.con = con;
			sta = this.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			sta.executeQuery(strSQL);
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	public int VoteNum(Connection con,String filter) {
		String strSQL = "SELECT ID FROM Vote";
		int num = 0;
		//�P�_�ǤJ��filter�r��O�_���Ŧr��A�O�N�z�����W�[��SQL�ԭz
		if(!filter.equals("")) 
			strSQL = strSQL + "WHERE" +filter;
		
			try {
				this.con = con;
				Statement lsta = null;
				lsta = this.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				
				ResultSet rs = lsta.executeQuery(strSQL);
				rs.last();
				num = rs.getRow();
				
				rs.close();
				lsta.close();
			}catch(SQLException sqlex) {
				System.out.println(sqlex.toString());
			}
			return num;
	}
}

package com.bitc.store;

import java.sql.*;
import java.util.Date;
public class CartBean {
	private String BookList = ""; //BookList is left side of main page and it could show you the category 
	public CartBean() {}
	
	//if BookList has the data, it means cart had some books
	public boolean HaveBooks() {  
		boolean bookResult = false;
		if(!BookList.equals("")) {
			bookResult = true;
		}	
		return bookResult;
	}
	
	public void ClearCart() {
		BookList = "";
	}
	//If the book been selected and saved in cart
	public boolean isSelected(String BookID) {
		boolean selectResult = true;
		if(BookList.indexOf(BookID)== -1) {
			selectResult = false;
		}
		return selectResult;
	}
	//get the quantity of book
	public String getQuantity(String BookID) {
		String result = null;
		int index = 0;
		int start = 0;
		int end = 0;
		
		index = BookList.indexOf(BookID);
		if(index != -1) {
			start = BookList.indexOf(':',index);
			end = BookList.indexOf('&',index);
			
			result = BookList.substring(start + 1,end);
		}
		return result;
	}
	
	public void addBook(String BookID,String Quantity) {
		BookList = BookList + BookID + ":" + Quantity +"&";
	}
	
	public void setQuantity(String BookID,String Quantity) {
		int index = 0;
		index = BookList.indexOf(BookID); //Look for the book in String position
		
		if(index != -1) {
			String str1="",str2 ="";
			int start = BookList.indexOf(':',index);
			int end = BookList.indexOf('&',index);
			
			str1 = BookList.substring(0,start-1);
			str2 = BookList.substring(end);
			BookList = str1 + Quantity + str2;
		}
	}
	
	Connection con = null;
	Statement sta = null;
	ResultSet cartRs = null;
	
	//initial in the cart's query string of selected books
	public void InitCartRs(Connection con) {
		if(this.con != con)
			this.con = con;
		
		String BookID = BookID(); //to get all numbers of the ordered books in the cart
		
		try {
			sta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			String strSQL = "SELECT * FROM Book" + "WHERE BookID IN ("+BookID+")";
			cartRs = sta.executeQuery(strSQL);
		}catch(SQLException sex) {
			System.out.println(sex.toString());
		}
	}
	//Close ResultSet and Statement
	public void CloseCartRs() {
		try {
			if(cartRs != null) {
				cartRs.close();
				cartRs = null;
			}
			if(sta != null) {
				sta.close();
				sta = null;
			}
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	//ResultSet will move to next pointer
	public boolean next() {
		boolean nextResult = false;
		try {
			nextResult = cartRs.next();
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return nextResult;
	}
	
	//record id column
	public String getBookID() {
		String recResult = null;
		try {
			recResult = cartRs.getString("BoookID");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return recResult;
	}
	//get the column of BookNm
	public String getBookNm() {
		String result = null;
		try {
			result = cartRs.getString("BookNm");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//get the Price column 
	public double getPrice() {
		double result = 0.0;
		try {
			result = cartRs.getDouble("Price");
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return result;
	}
	//add the order into the database
	public void InsertOrder(Connection con,String Name,String Address,String Phone,String E_Mail) {
		if(this.con != con)
			this.con = con;
		
		String BookID = BookID(); //get all number of books in the cart
		try {
			String Time = Now();
			
			sta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			String strSQL = "INSERT INTO BookOrder" + "(OrderTime,Name,Phone,E_mail,Address)"+
			"VALUES ('" + Time + "','" + Name + "','" + Phone +"','" + E_Mail + "','" + Address +"')";
		
			sta.executeQuery(strSQL);
			
			strSQL = "SELECT ID¡@FROM BookOrder"+"WHERE OrderTime ='"+Time+"'";//get last time add new SQL data
			
			ResultSet IDRs = sta.executeQuery(strSQL);
			
			IDRs.next();
			String OrdID = IDRs.getString("ID"); //get the id column
			
			IDRs.close();
			
			int num = 0,i=0,end=0,start=0;
			
			end = BookList.indexOf(':'); //look for the ":" char
			
			while(end != -1) {
				String BID = BookList.substring(start, end);
				strSQL = "INSERT INTO OrderDetail" + "(OrderID,BookID,Quantity) VALUES"+"("+ OrdID +",'" + BID +"'," + getQuantity(BID)+")";
			
			    sta.executeUpdate(strSQL);
			    
			    end = BookList.indexOf(':',end+1);
			    start = BookList.indexOf('&',start);
			    start = start +1;
			}
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	//
	public String Now() {
		Date Now = new Date();
		String year = String.valueOf(Now.getYear()+1990);
		String month = String.valueOf(Now.getMonth()+1);
		String day = String.valueOf(Now.getDay());
		String hour = String.valueOf(Now.getHours());
		String minute = String.valueOf(Now.getMinutes());
		String second = String.valueOf(Now.getSeconds());
		
		return year+"/"+month+"/"+day+"/"+hour+":"+minute+":"+second;
	}
	
	public String BookID() {
		String BookID = "";
		int start = 0;
		int end = 0;
		int num = 0;
		
		end  =  BookList.indexOf(':');
		
		while(end != -1) {
			BookID = BookID + "'" +BookList.substring(start, end)+"',";
			
			end = BookList.indexOf(':',end+1);
			start = BookList.indexOf('&',start);
			start = start +1;
		}
		return BookID;
	}
}

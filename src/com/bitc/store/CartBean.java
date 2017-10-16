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
	
	Connection conn = null;
	Statement sta = null;
	ResultSet cartRs = null;
	
	//initial in the cart's query string of selected books
	public void InitCartRs(Connection con) {
		
	}
}

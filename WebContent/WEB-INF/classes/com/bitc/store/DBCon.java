package com.bitc.store;

import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class DBCon implements HttpSessionBindingListener{  
	private Connection con = null; // DataBase Connection
	
	public DBCon() {   
		BuildConnection();
	}
	
	private void BuildConnection() { //create a method of database connection
		try {
			//Context ic = new InitialContext();  //create InitialContext 
			//DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/StoreDB");//use lookup() to look for contact to jdbc/StoreDB(JNDI)'s object of DataSource
			
			//con = ds.getConnection();
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection("jdbc:odbc:StoreDB");
		}catch(Exception ex) {
			System.out.println(ex.toString());
		}
	}
	public Connection getConnection() {
		if(con == null) {
			BuildConnection();
		}
		return this.con;
	}
	public void close() {
		try {
			con.close();
			con = null;
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
	}
	
	public void valuedBound(HttpSessionBindingEvent event) {} //when object add session, it will to do this function
	
	public void valuedUnBound(HttpSessionBindingEvent event) {
		if(con != null) {
			close();
			con = null;
		}
	}

	@Override
	public void valueBound(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}

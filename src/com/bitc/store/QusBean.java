package com.bitc.store;
import java.sql.*;
public class QusBean {
	private String Title = "XML技術實務";
	private String SubTitle = "[XML/XSTL/XPath/XML Schema/SOAP/Web Service/與ASP、Java、Access、SQL Server之整合]";
	private int QusNum = 3;  //問題數目
	private String Qus[] = {"您滿意本書的內容嗎?","您滿意本書的版面編輯嗎?","您滿意本書的封面設計嗎?"};
	private String Color[] = {"Yellow","DeepPink","DarkCyan","DeepSkyBlue","Orange","LightSlateGray"};  //定義產生圖表的顏色
	private int OptNum = 5; //定義選項個數
	private String Opt[] = {"很滿意","滿意","尚可","不滿意","很不滿意"};
	
	public String getQus(int i) {
		return Qus[i];
	}
	public String getOpt(int i) {
		return Opt[i];
	}
	public String getColor(int i) {
		return Color[i];
	}
	public String getTitle() {
		return this.Title;
	}
	public String getSubTitle() {
		return this.SubTitle;
	}
	
	private Connection con = null;
	private Statement sta = null;
	
	public QusBean() {}
	
	//將問卷的答案新增資料庫，回傳值此動作所影響的紀錄筆數
	public int InsertAns(Connection con,String rad1,String rad2,String rad3) {
		int affect = 0;
		String strSQL = "INSERT INTO Qus(Qus1,Qus2,Qus3)"+"VALUES("+rad1+","+rad2+","+rad3+")";
		try {
			this.con=con;
			sta = this.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			affect = sta.executeUpdate(strSQL);
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return affect;
	}
	
	public int RecNum(Connection con,String filter) {
		String strSQL = "SELECT ID FROM Qus";
		int num = 0;
		//判斷filter字串是否為空白字串
		if(!filter.equals("")) {
			strSQL = strSQL +"WHERE"+filter;  //建立執行的SQL敘述
		}
		try {
			Statement lsta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			ResultSet rs = lsta.executeQuery(strSQL);
			rs.last();          //移至最後一筆紀錄
			num = rs.getRow();  //取得紀錄的列數
			
			rs.close();
			lsta.close();
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return num;
	}

}

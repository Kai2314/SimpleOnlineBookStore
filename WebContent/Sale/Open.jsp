<%@ page contentType="text/html; charset=Big5" 
	import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<CENTER>
<FONT SIZE = 5 COLOR = blue></FONT>
</CENTER>
<HR>
<P></P>

<CENTER>
<%
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");

String dbURL = "jdbc:ucanaccess://C:/StoreDB.mdb";
Connection con = DriverManager.getConnection(dbURL);
Statement stmt = con.createStatement();
//建立Statement物件

ResultSet rs;
//建立ResultSet(結果集)物件

rs = stmt.executeQuery("SELECT * FROM Book");
//執行SQL敘述
%>
<TABLE  bgcolor=DodgerBlue>
	<TR  bgcolor=SkyBlue>	
	<TD><B>書籍編號</B></TD><TD><B>書  名</B></TD><TD><B>作  者</B></TD>	
	</TR>	
	<%
	//利用while迴圈將資料表中的記錄列出
	while (rs.next())
	{
		%>
		<TR bgcolor=LightGoldenrodYellow>
		<TD><B><%= rs.getString("BookNm") %></B></TD>
		<TD><B><%= rs.getString("BookID") %></B></TD>
		<TD><B><%= rs.getString("Author") %></B></TD>			
		</TR>
		<%
	}

	if(rs != null) rs.close(); //關閉ResultSet物件
	if(stmt != null) stmt.close(); //關閉Statement物件
	if(con != null) con.close(); //關閉資料庫連結物件
	%>	
</TABLE>
</CENTER>

</BODY>
</HTML>

<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>投票區</title>
</head>
<body>
<center><h2><font color=blue>好書票選</font></h2></center>
<hr>
<jsp:useBean id="vote" scope="session" class="com.bitc.store.VoteBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<table bgcolor=DodgerBlue align=center>
<tr bgcolor=SkyBlue>
<td><b>書 號</b></td><td><b>書 名</b></td><td><b>得票數</b></td>
</tr>
<%
vote.InitBookRs(con.getConnection());  //起始VoteBean物件中的紀錄集
while(vote.next()){
	%>
	<tr>
	<td bgcolor=LightGoldenrodYellow>[<font color=Green><%=vote.getBookID() %></font>]</td>
	<td bgcolor=LightGoldenrodYellow><b><font color=Brown><%=vote.getBookNm() %></font></b></td>
	<!-- 取得投票給某書的紀錄筆數 -->
	<td bgcolor=LightGoldenrodYellow align=right><font size=5 color=red>
	<%=vote.VoteNum(con.getConnection(), "choice="+vote.getID()) %></font>票</td></tr>
	<% 
}
vote.CloseBookRs();
%>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�벼��</title>
</head>
<body>
<center><h2><font color=blue>�n�Ѳ���</font></h2></center>
<hr>
<jsp:useBean id="vote" scope="session" class="com.bitc.store.VoteBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<table bgcolor=DodgerBlue align=center>
<tr bgcolor=SkyBlue>
<td><b>�� ��</b></td><td><b>�� �W</b></td><td><b>�o����</b></td>
</tr>
<%
vote.InitBookRs(con.getConnection());  //�_�lVoteBean���󤤪�������
while(vote.next()){
	%>
	<tr>
	<td bgcolor=LightGoldenrodYellow>[<font color=Green><%=vote.getBookID() %></font>]</td>
	<td bgcolor=LightGoldenrodYellow><b><font color=Brown><%=vote.getBookNm() %></font></b></td>
	<!-- ���o�벼���Y�Ѫ��������� -->
	<td bgcolor=LightGoldenrodYellow align=right><font size=5 color=red>
	<%=vote.VoteNum(con.getConnection(), "choice="+vote.getID()) %></font>��</td></tr>
	<% 
}
vote.CloseBookRs();
%>
</table>
</body>
</html>
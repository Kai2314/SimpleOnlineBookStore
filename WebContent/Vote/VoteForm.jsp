<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.sql.*"%>
<%
Cookie Voted = null,temp = null;
Cookie cookies[] = request.getCookies();
int cookielen=0;
if(cookies != null){
	cookielen = cookies.length;  //���ocookies�}�C������
}
for(int i = 0;i<cookielen;i++){
	temp = cookies[i];
	if(temp.getName().equals("Voted")){ //�P�_�O�_���o�W��Voted��cookie���
		Voted = temp;
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�벼��</title>
</head>
<body>
<center>
<h2><font color = blue>�n�Ѳ���</font></h2>
</center>
<hr>
<%
//�P�_�O�_�i���oVoted�ܼơA�O�h��ܤw�g���벼�F
if(Voted != null){
	%>
	<h2>�w�g�벼�L�F�@!!</h2>
	<% 
}else{   //�|���벼�h�n��ܪ��ѨϥΪ̧벼
	%>
	<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
	<font size = 4 color=red>�z�̳��w���@���ѩO?</font>
	<jsp:useBean id="vote" scope="session" class="com.bitc.store.VoteBean"/>
	<br>
	<form action="Vote.jsp" method=post>
	<%
	vote.InitBookRs(con.getConnection());  //�_�l�]�wVoteBean���󤤪�������
	while(vote.next()){   //�Q��while�j����X������������ƫإߨѨϥΪ̧벼���ﶵ
		%>
		<p><input name=choice type=radio value=<%= vote.getID() %>>
		<font color=Brown><%= vote.getBookNm() %></font>
		<font color=Green>[�Ѹ��G<%= vote.getBookID() %>)]</font></p>
		<%
	}
	%>
	<p><input name=submit1 type=submit value=�벼></p>
	</form>
	<%
	vote.CloseBookRs();
}
%>
</body>
</html>
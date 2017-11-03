<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.sql.*"%>
<%
Cookie Voted = null,temp = null;
Cookie cookies[] = request.getCookies();
int cookielen=0;
if(cookies != null){
	cookielen = cookies.length;  //取得cookies陣列的長度
}
for(int i = 0;i<cookielen;i++){
	temp = cookies[i];
	if(temp.getName().equals("Voted")){ //判斷是否取得名為Voted的cookie資料
		Voted = temp;
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>投票區</title>
</head>
<body>
<center>
<h2><font color = blue>好書票選</font></h2>
</center>
<hr>
<%
//判斷是否可取得Voted變數，是則表示已經有投票了
if(Voted != null){
	%>
	<h2>已經投票過了哦!!</h2>
	<% 
}else{   //尚未投票則要顯示表單供使用者投票
	%>
	<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
	<font size = 4 color=red>您最喜歡哪一本書呢?</font>
	<jsp:useBean id="vote" scope="session" class="com.bitc.store.VoteBean"/>
	<br>
	<form action="Vote.jsp" method=post>
	<%
	vote.InitBookRs(con.getConnection());  //起始設定VoteBean物件中的紀錄集
	while(vote.next()){   //利用while迴圈取出紀錄集中的資料建立供使用者投票的選項
		%>
		<p><input name=choice type=radio value=<%= vote.getID() %>>
		<font color=Brown><%= vote.getBookNm() %></font>
		<font color=Green>[書號：<%= vote.getBookID() %>)]</font></p>
		<%
	}
	%>
	<p><input name=submit1 type=submit value=投票></p>
	</form>
	<%
	vote.CloseBookRs();
}
%>
</body>
</html>
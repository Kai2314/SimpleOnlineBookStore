<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>問卷調查</title>
</head>
<body>
<center>
<font size=5 color=blue>問卷調查</font>
</center>
<hr>
<p>
<%-- 起始Bean物件 --%>
<jsp:useBean id="qus" scope="session" class="com.bitc.store.QusBean"/>
<%
//若沒有傳遞表單資料則顯示問卷
if(request.getParameter("submit1") == null){
	%>
	<font size=4>請告訴我們您對<br></font><b>
	<font size=5 color=midnightblue>
	<jsp:getProperty name="qus" property="Title"/>    <%--取得Bean物件的title屬性值 --%>
	</font>
	<font size=4 color=green>-
	<jsp:getProperty name="qus" property="SubTitle"/>
	</font></b></p>
	<font size=4>一書的意見</font></p><br>
	<form action="QusForm.jsp" method=post>
	<%
	//第一層for迴圈用於輸出問卷題目
	for(int i=0;i<3;i++){
		%>
		<font size=4 color=Gray><b><%=qus.getQus(i) %></b></font><br><br>
		<% 
		//第二層for迴圈用於輸出問卷各題目的選項
		for(int j=0;j<5;j++){
			%>
			<input type="radio" name=radio<%=i+1 %> value=<%=j+1%>>
			<font size=4 color=Brown><%=qus.getOpt(j) %></font>
			<% 
		}
		%><br><br><br><% 
	}
	%>
	<br>
	<input type="submit" value="填答完畢" name=submit1/>
	<a href=QusRes.jsp>統計結果</a>
	</form>
	<%
}else{
	%>
	<%--建立連結資料庫的Bean物件 --%>
	<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
	<% 
	qus.InsertAns(con.getConnection(), request.getParameter("radio1"), 
			request.getParameter("radio2"), request.getParameter("radio3"));
	%>
	<p><font size=5 color=red>非常感謝您的意見</font></p>
	<a href=QusRes.jsp>統計結果</a>
	<% 
}
%>
</body>
</html>
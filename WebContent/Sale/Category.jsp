<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import = "java.net.URLEncoder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Online Shopping</title>
</head>
<body bgColor = PowderBlue>
<br><h2><FONT color=MediumSeaGreen>Category List</FONT></h2>
<hr>
<%--initial Bean object --%>
<jsp:useBean id="cate1" scope="page" class="com.bitc.store.CateBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>

<% cate1.InitCateRs(con.getConnection());  //record set of initial CateBean object  //URLEncoder it will change the String to URL

while(cate1.next()){
	%>
	<P><a href="BookList.jsp?CategoryID=<%=cate1.getCateID() + "&Category=" + URLEncoder.encode(cate1.getCategory()) %>" 
	target = Book><%=cate1.getCategory() %></a></P>
	<% 
}
cate1.CloseCateRs();  //close set of CateBean object  
%>
</body>
</html>
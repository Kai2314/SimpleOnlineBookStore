<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<jsp:useBean id="cart" scope="session" class="com.bitc.store.CartBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<%
if(cart.HaveBooks()==false){
%>  <jsp:forward page="Message.html"/><% 
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Online Shopping</title>
</head>
<body>
<% 
cart.InsertOrder(con.getConnection(), request.getParameter("Name"),
		request.getParameter("Address"), request.getParameter("Phone"),
		request.getParameter("Email"));

cart.ClearCart();
%>
<br><br><br><br><br><p align=center>
<font color=mediumblue size=7>您已完成產品的訂購</font></p>
</body>
</html>
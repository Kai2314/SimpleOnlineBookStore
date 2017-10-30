<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<jsp:useBean id="Cart" scope="session" class="com.bitc.store.CartBean" />
<%
Cart.ClearCart();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Online shopping</title>
</head>
<body>
<br><br><br>
<center><font size = 6 color=mediumseagreen>已清空購物車</font></center>
</body>
</html>
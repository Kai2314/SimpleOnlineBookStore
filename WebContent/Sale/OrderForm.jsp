<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<jsp:useBean id="cart" scope = "session" class="com.bitc.store.CartBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<%
if(cart.HaveBooks()==false){%>
	<jsp:forward page="Message.html"><%
	}%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Online Shopping</title>
</head>
<body><br>
<CENTER>
<h2><font color=mediumseagreen>請確認您所選購的產品</font></h2>
<hr><p></p>
<table Border=1>
<tr bgcolor=lightblue align=middle>
<td><font color=darkblue size=4><b>挑選</b></font></td>
	<td><font color=darkblue size=4><b>編號</b></font></td>
	<td><font color=darkblue size=4><b>書名</b></font></td>
	<td><font color=darkblue size=4><b>單價</b></font></td>
	<td><font color=darkblue size=4><b>訂購數量</b></font></td>
	<td><font color=darkblue size=4><b>小計</b></font></td>
</tr>
<%
double total=0.0,subTotal=0.0,price=0.0;
int OrdQty = 0;
String BID=null;
cart.InitCartRs(con.getConnection());
while(cart.next()){
	%>
	<tr bgcolor=LightYellow>
	<% 
	BID = cart.getBookID();
	OrdQty = Integer.parseInt(cart.getQuantity(BID));
	price = cart.getPrice();
	subTotal = OrdQty*price;
	total += subTotal;
	%>
	<td><font color=Maroon><%= BID %></font></td>
	<td><font color=Navy><%= cart.getBookNm() %></font></td>
	<td><%= OrdQty %></td>
	<td><font color=red><%= price %></font></td>
	<td><%= subTotal %></td>
	</tr><% 
}
cart.CloseCartRs();
%>
<tr bgcolor=lightgrey>
<th Colspan=4 align=right>總計：</th>
<td><font color=red><b><%= total %></b></font></td>
</tr>
</table>
<br><hr><br></center><p>
<font size=4 color=red>完成確認後請填寫您的基本資料</font></p>
<form action="Order.jsp">
<font color=blue>
<p><pre>姓 　名：<input name="Name"></pre>
<p></p>
<p><pre>送貨地點：<input name="Address"></pre>
<p></p>
<p><pre>電     話：<input name="Phone"></pre>
<p></p>
<p><pre>E-mail：<input name="Email"></pre>
<p></p>
</font>
<input type="submit" value="送出訂單" name=submit1>
</form>
</body>
</html>
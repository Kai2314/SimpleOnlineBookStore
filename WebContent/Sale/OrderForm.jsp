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
<h2><font color=mediumseagreen>�нT�{�z�ҿ��ʪ����~</font></h2>
<hr><p></p>
<table Border=1>
<tr bgcolor=lightblue align=middle>
<td><font color=darkblue size=4><b>�D��</b></font></td>
	<td><font color=darkblue size=4><b>�s��</b></font></td>
	<td><font color=darkblue size=4><b>�ѦW</b></font></td>
	<td><font color=darkblue size=4><b>���</b></font></td>
	<td><font color=darkblue size=4><b>�q�ʼƶq</b></font></td>
	<td><font color=darkblue size=4><b>�p�p</b></font></td>
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
<th Colspan=4 align=right>�`�p�G</th>
<td><font color=red><b><%= total %></b></font></td>
</tr>
</table>
<br><hr><br></center><p>
<font size=4 color=red>�����T�{��ж�g�z���򥻸��</font></p>
<form action="Order.jsp">
<font color=blue>
<p><pre>�m �@�W�G<input name="Name"></pre>
<p></p>
<p><pre>�e�f�a�I�G<input name="Address"></pre>
<p></p>
<p><pre>�q     �ܡG<input name="Phone"></pre>
<p></p>
<p><pre>E-mail�G<input name="Email"></pre>
<p></p>
</font>
<input type="submit" value="�e�X�q��" name=submit1>
</form>
</body>
</html>
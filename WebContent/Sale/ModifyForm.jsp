<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<jsp:useBean id="cart" scope="session" class="com.bitc.store.CartBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<%   

	if(cart.HaveBooks()==false){%>
		<<jsp:forward page="Message.html"></jsp:forward><% 
	}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Online shopping</title>
</head>
<body>
<br><center>
<h2><font color=mediumSeaGreen>�ثe���ʪ����~</font></h2>
<hr>
<form action="PutCart.jsp" name=ModFrm method=post>
<table border =1>
<tr bgcolor=lightblue align=middle>
	<td><font color=darkblue size=4><b>�D��</b></font></td>
	<td><font color=darkblue size=4><b>�s��</b></font></td>
	<td><font color=darkblue size=4><b>�ѦW</b></font></td>
	<td><font color=darkblue size=4><b>���</b></font></td>
	<td><font color=darkblue size=4><b>�q�ʼƶq</b></font></td>
	<td><font color=darkblue size=4><b>�p�p</b></font></td>
</tr>
<%
double total = 0.0,subTotal = 0.0,price = 0.0;
int OrdQty = 0;
String BID = null;

cart.InitCartRs(con.getConnection());
//�_�lCartBean���󤤪�������

//�H�U�h�O�qcart���󤤨��o��ơA�åH�o�Ǹ�ƫإߤw���ʮ��y���A�ѨϥΪ̭ק�q����
while(cart.next()){
	BID = cart.getBookID();  //���y�s��
	OrdQty = Integer.parseInt(cart.getQuantity(BID));
	price = cart.getPrice();
	subTotal = price*OrdQty;
	total += subTotal;  
%>
<tr bgcolor=LightYellow>
<td><input checked name = "ckbBID" type=checkbox value="<%=BID %>" checked></td>
<td><font color=Maroon><%= BID %></font></td>
<td><%= cart.getBookNm() %></td>
<td><font color=red><%= price %></font></td>
<td><input style="height:25px;width:80px" name=txb<%=BID %> type=textbox value="<%= OrdQty %>"></td>
<td><%= subTotal %></td>
</tr>
<% 
}
cart.CloseCartRs();
%>
<tr bgcolor=lightgrey>
<th ColSpan = 5 Align = right>�`�p�G</th>
<td><font color=red><b><%= total %></b></font></td>
</tr>
</table>
<!-- �Q���������ǻ�RePut�ѼơA�]�wPutCart.jsp���s�x�s�ʪ���� -->
<input type="hidden" name="RePut" value="yes">
<hr><br>
<input type="submit" value="�����ק�" name=submit1>
</form>
</center>
</body>
</html>
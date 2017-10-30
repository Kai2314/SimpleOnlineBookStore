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
<h2><font color=mediumSeaGreen>目前選購的產品</font></h2>
<hr>
<form action="PutCart.jsp" name=ModFrm method=post>
<table border =1>
<tr bgcolor=lightblue align=middle>
	<td><font color=darkblue size=4><b>挑選</b></font></td>
	<td><font color=darkblue size=4><b>編號</b></font></td>
	<td><font color=darkblue size=4><b>書名</b></font></td>
	<td><font color=darkblue size=4><b>單價</b></font></td>
	<td><font color=darkblue size=4><b>訂購數量</b></font></td>
	<td><font color=darkblue size=4><b>小計</b></font></td>
</tr>
<%
double total = 0.0,subTotal = 0.0,price = 0.0;
int OrdQty = 0;
String BID = null;

cart.InitCartRs(con.getConnection());
//起始CartBean物件中的紀錄集

//以下則是從cart物件中取得資料，並以這些資料建立已選購書籍表單，供使用者修改訂單資料
while(cart.next()){
	BID = cart.getBookID();  //書籍編號
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
<th ColSpan = 5 Align = right>總計：</th>
<td><font color=red><b><%= total %></b></font></td>
</tr>
</table>
<!-- 利用隱藏欄位傳遞RePut參數，設定PutCart.jsp重新儲存購物資料 -->
<input type="hidden" name="RePut" value="yes">
<hr><br>
<input type="submit" value="完成修改" name=submit1>
</form>
</center>
</body>
</html>
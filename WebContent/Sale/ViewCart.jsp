<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<jsp:useBean id="Cart" scope="session" class="com.bitc.store.CartBean"/>
<<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<% 
//若購物車中沒有書籍訂購資料時，會將瀏覽器導向至Message.htm網頁
if(Cart.HaveBooks() == false){%>
	<jsp:forward page=Message.htm/>
<%}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Online Shopping</title>
</head>
<body>
<br>
<center>
<h2><font color=MediumSeaGreen>目前選購的產品</font></h2>
<hr>
<table Border = 1>
<tr bgcolor=lightblue align=middle>
<td><font color=darkblue size=4><b>編號</b></font></td>
<td><font color=darkblue size=4><b>書名</b></font></td>
<td><font color=darkblue size=4><b>訂購數量</b></font></td>
<td><font color=darkblue size=4><b>單價</b></font></td>
<td><font color=darkblue size=4><b>小計</b></font></td>
</tr>
<%
double total = 0.0, subTotal = 0.0, price=0.0;
int OrdQty = 0;
String BID = null;
Cart.InitCartRs(con.getConnection()); //起始CartBean物件中的紀錄
//後面的while迴圈將從Cart物件中取得紀錄，並以這些資料建立出已選購書籍的清單，供使用者確認
while(Cart.next()){
	%>
<tr bgcolor=LightYellow>
<% 
BID = Cart.getBookID();  //取得書籍編號
OrdQty = Integer.parseInt(Cart.getQuantity(BID)); //取得儲存在CartBean物件中某書籍的訂購數量
price = Cart.getPrice(); //書籍價格
subTotal = price*OrdQty;//各項訂購項目的小計
total = total + subTotal;//總計金額
%>
<td><font color=Maroon><%= BID %></font></td>
<td><font color=Navy><%= Cart.getBookNm() %></font></td>
<td><%= OrdQty %></td>
<td><font color=Red><%= price %></font>
<td><%= subTotal %></td>
</tr>
<% 
}
Cart.CloseCartRs(); //關閉CartBean物件中的紀錄集
%>
<tr bgcolor = lightgrey>
<th ColSpan = 4 Align=right>總計：</th>
<td><font color=red><b><%= total %></b></font></td>
</tr>
</table>
<br><hr><br><font size=4 color=DarkRed>
[<A href=OrderForm.jsp>訂購</A>|<A href=ClearCart.jsp>清空購物車</A>|
 <A href=ModifyForm.jsp>修改購物項目</A>]
</font>
</center>
</body>
</html>
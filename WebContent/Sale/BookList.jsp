<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Online shopping</title>
</head>
<body>
<BR>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<% 
String CategoryID = request.getParameter("CategoryID");
String Category = request.getParameter("Category");

if(Category == null || CategoryID == null){
	%>
	<jsp:useBean id="cate" scope="page" class="com.bitc.store.CateBean"/>
	<% 
	cate.InitCateRs(con.getConnection());
	cate.next();
	
	CategoryID = cate.getCateID();
	Category = cate.getCategory();
	
	cate.CloseCateRs();  
}
%>
<center>

<hr>
<FORM name="OrdBook" action="PutCart.jsp" method=post>
<table border = 1>
<tr bgcolor=lightblue align=middle>
<td width = 10><font color=darkblue size=4><B>挑選</B></font></td>
<td width = 10><font color=darkblue size=4><B>數量</B></font></td>
<td><font color=darkblue size=4><B>編號</B></font></td>
<td><font color=darkblue size=4><B>書名</B></font></td>
<td><font color=darkblue size=4><B>作者</B></font></td>
<td><font color=darkblue size=4><B>單價</B></font></td>
<td><font color=darkblue size=4><B>簡介</B></font></td>
</tr>
<jsp:useBean id="bl" scope="session" class="com.bitc.store.BookList"/>
<jsp:useBean id="cart" scope="session" class="com.bitc.store.CartBean"/>
<%
bl.InitBookRs(con.getConnection(),"CategoryID="+CategoryID); //init BookList object record set
//迴圈會取出bl中的紀錄，並建立某分類書籍的清單
while(bl.next()){
%>
<tr bgcolor=LightYellow>
<% 
String BID = bl.getBookID();
//判斷此紀錄是否已被選取至購物車(利用bl物件的isSelected方法)，是將書籍清單中的挑選欄與數量設為無效
if(cart.isSelected(BID)){
%>
<td>
<input checked name=ckbBID type=checkbox value="<%= BID%>" disabled></td>
<td>
<input style="hight:25px; width:30px" name=txb<%= BID %> type="textbox" 
value="<%= cart.getQuantity(BID) %>" disabled></td><% }
else
{ %>
	<td>
	<input name=ckbBID type=checkbox value="<%= BID %>"/></td>
	<td>
	<input style="hight:25px;width:30px" type="textbox" name=txb<%= BID %>value="1">
	</td><% 
}%>
<td><font color=Maroon><%= BID %></font></td>
<td><font color=Navy><%= bl.getBookNm() %></font></td>
<td><%= bl.getAuthor() %></td>
<td><font color=Red><%= bl.getPrice() %></font></td>
<td><%= bl.getAbstract() %></td></tr>
<%
}
bl.CloseBookRs();
%>
</table><!-- 利用隱藏欄位傳遞CategoryID和Category -->
<input type="hidden" name="CategoryID" value=<%= CategoryID %>>
<input type="hidden" name="Category" value=<%= Category %>>
<br>
<input type="submit" value="放入購物車" name="submit1" />
</FORM>
<hr>
<font size = 4 color=DarkRed>
[<a href=OrderForm.jsp>訂購</a>|
<a href=ViewCart.jsp>檢視購物車</a>|
<a href=Clear.jsp>清空購物車</a>|
<a href=ModifyForm.jsp>修改購物項目</a>]
</font>
</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<jsp:useBean id="Cart" scope="session" class="com.bitc.store.CartBean"/>
<<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<% 
//�Y�ʪ������S�����y�q�ʸ�ƮɡA�|�N�s�����ɦV��Message.htm����
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
<h2><font color=MediumSeaGreen>�ثe���ʪ����~</font></h2>
<hr>
<table Border = 1>
<tr bgcolor=lightblue align=middle>
<td><font color=darkblue size=4><b>�s��</b></font></td>
<td><font color=darkblue size=4><b>�ѦW</b></font></td>
<td><font color=darkblue size=4><b>�q�ʼƶq</b></font></td>
<td><font color=darkblue size=4><b>���</b></font></td>
<td><font color=darkblue size=4><b>�p�p</b></font></td>
</tr>
<%
double total = 0.0, subTotal = 0.0, price=0.0;
int OrdQty = 0;
String BID = null;
Cart.InitCartRs(con.getConnection()); //�_�lCartBean���󤤪�����
//�᭱��while�j��N�qCart���󤤨��o�����A�åH�o�Ǹ�ƫإߥX�w���ʮ��y���M��A�ѨϥΪ̽T�{
while(Cart.next()){
	%>
<tr bgcolor=LightYellow>
<% 
BID = Cart.getBookID();  //���o���y�s��
OrdQty = Integer.parseInt(Cart.getQuantity(BID)); //���o�x�s�bCartBean���󤤬Y���y���q�ʼƶq
price = Cart.getPrice(); //���y����
subTotal = price*OrdQty;//�U���q�ʶ��ت��p�p
total = total + subTotal;//�`�p���B
%>
<td><font color=Maroon><%= BID %></font></td>
<td><font color=Navy><%= Cart.getBookNm() %></font></td>
<td><%= OrdQty %></td>
<td><font color=Red><%= price %></font>
<td><%= subTotal %></td>
</tr>
<% 
}
Cart.CloseCartRs(); //����CartBean���󤤪�������
%>
<tr bgcolor = lightgrey>
<th ColSpan = 4 Align=right>�`�p�G</th>
<td><font color=red><b><%= total %></b></font></td>
</tr>
</table>
<br><hr><br><font size=4 color=DarkRed>
[<A href=OrderForm.jsp>�q��</A>|<A href=ClearCart.jsp>�M���ʪ���</A>|
 <A href=ModifyForm.jsp>�ק��ʪ�����</A>]
</font>
</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�����v��</title>
<script language = "javascript">

function CheckData(Price){
	if(frmPrice.tbxUser.value == ""){
		window.alert("�ݶ�J�m�W !!");
		document.frmPrice.elements(0).focus();  //�N��в��ܩm�W��J��
		return;
	}
	if(frmPrice.tbxPrice.value == ""){
		window.alert("�п�J�X�������B!!");
		document.frmPrice.elements(0).focus();
		return;
	}
	if(isNaN(parseInt(frmPrice.tbxPrice.value))){  //isNaN�]�i�H����L��k
		window.alert("�п�J�Ʀr!!");
		document.frmPrice.elements(0).focus();
		return;
	}
	if(parseFloat(frmPrice.tbxPrice.value)<parseInt(Price)){
		window.alert("�X�����B���i�C��ثe������!!");
		document.frmPrice.elements(1).focus();
		return;
	}
	frmPrice.submit();
} 
</script>
</head>
<body>
<center>
<font size=5 color=blue>�����v��</font>
</center>
<hr>
<p>
<b><font size=5 color=midnightblue>XML�޳N���</font><br>
<font size=3 color=green>[XML/XSLT/XPath/XML Schema/SOAP/Web Service/�PASP�BJAVA�BAccess�BSQL Server����X]</font>
</b></p>
<table>
<tr><td align=top width=200><IMG src="W2145.jpg"/></td>
<td><b>
<p><font color=brown>�Ѹ��G</font>
<font color=blue>W2145</font></p>
<p><font color=brown>�@�̡G</font>
<font color=blue>�줸���</font></p>
<p><font color=brown>�X������G</font>
<font color=blue>2002/5/10</font></p>
<p><font color=brown>���ơG</font>
<font color=blue>1233</font></p>
</b></td>
</tr>
</table>

<%--�_�lBean���� --%>
<jsp:useBean id="saver" scope="page" class="com.bitc.store.BeanSaver"/>
<%
try{
%>
<%--�q�ɮ׸��JBean���� --%>
<jsp:useBean id="bid" beanName="com.bitc.BeanSer.BidData" scope="page" type="com.bitc.store.Bid"/>
<% 
}catch(Exception ex){
	%>
	<%--�Y�L�k���`���JBean������ɡA�U�����ԭz�N�_�lBean���󪺫إ� --%>
	<jsp:useBean id="initBid" class="com.bitc.store.Bid"/>
	
	<%--�]�wBean�����ݩ� --%>
	<jsp:setProperty name="initBid" property="name" value="�_�л�"/>
	<jsp:setProperty name="initBid" property="price" value="450"/>
	<% 
	String path = request.getRealPath("/");  //���o�W�@�h�ؿ�����ںϺи��|  
	//request.getSession().getServletContext().getRealPath();
	
	path = path+"WEB-INF\\classes\\com"+"bitc\\BeanSer\\BidData.ser";  //�إ��x�s�����ɮת����|�P�W��
	
	saver.save(initBid, path);  //�N����g�J�ɮ�
	
	pageContext.setAttribute("bid",saver.load(path));  //����]�w��pageContext���󤤱q�ɮ׸��JBean����
}%>
<h3>�ثe�̰�����<font size=5 color=red>
<jsp:getProperty name="bid" property="price"/> 
</font>
�X���̬�<font size=5 color=red>
<jsp:getProperty property="name" name="bid"/></font>
<form action="Bid.jsp" name="frmPrice" method=post>
�ڬO<input type="text" name=tbxUser size=10>�X��<input type="text" name="tbxPrice" size=10>��</h3>
<!-- �N�ثe���v�л���ǤJcheckdata()����ˬd�ϥΪ̪��X���O�_������ -->
<input type="button" value="�X�� !" name=submit1 onlick="CheckData(<jsp:getProperty name="bid" property="price"/>)">
</form>
</h3>
</b>
</table>
</body>
</html>
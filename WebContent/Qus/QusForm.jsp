<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�ݨ��լd</title>
</head>
<body>
<center>
<font size=5 color=blue>�ݨ��լd</font>
</center>
<hr>
<p>
<%-- �_�lBean���� --%>
<jsp:useBean id="qus" scope="session" class="com.bitc.store.QusBean"/>
<%
//�Y�S���ǻ�����ƫh��ܰݨ�
if(request.getParameter("submit1") == null){
	%>
	<font size=4>�Чi�D�ڭ̱z��<br></font><b>
	<font size=5 color=midnightblue>
	<jsp:getProperty name="qus" property="Title"/>    <%--���oBean����title�ݩʭ� --%>
	</font>
	<font size=4 color=green>-
	<jsp:getProperty name="qus" property="SubTitle"/>
	</font></b></p>
	<font size=4>�@�Ѫ��N��</font></p><br>
	<form action="QusForm.jsp" method=post>
	<%
	//�Ĥ@�hfor�j��Ω��X�ݨ��D��
	for(int i=0;i<3;i++){
		%>
		<font size=4 color=Gray><b><%=qus.getQus(i) %></b></font><br><br>
		<% 
		//�ĤG�hfor�j��Ω��X�ݨ��U�D�ت��ﶵ
		for(int j=0;j<5;j++){
			%>
			<input type="radio" name=radio<%=i+1 %> value=<%=j+1%>>
			<font size=4 color=Brown><%=qus.getOpt(j) %></font>
			<% 
		}
		%><br><br><br><% 
	}
	%>
	<br>
	<input type="submit" value="�񵪧���" name=submit1/>
	<a href=QusRes.jsp>�έp���G</a>
	</form>
	<%
}else{
	%>
	<%--�إ߳s����Ʈw��Bean���� --%>
	<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
	<% 
	qus.InsertAns(con.getConnection(), request.getParameter("radio1"), 
			request.getParameter("radio2"), request.getParameter("radio3"));
	%>
	<p><font size=5 color=red>�D�`�P�±z���N��</font></p>
	<a href=QusRes.jsp>�έp���G</a>
	<% 
}
%>
</body>
</html>
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
<%--�_�lBean���� --%>
<jsp:useBean id="qus" scope="session" class="com.bitc.store.QusBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<font size=5 color=midnightblue>
<jsp:getProperty property="title" name="qus"/>
</font>
<font size=4 color=green>
<jsp:getProperty property="subTitle" name="qus"/>
</font>
<font size=4>�ݨ��έp���G..</font>
<%
int TotalRec = qus.RecNum(con.getConnection(), "");  //���oQus��ƪ����`�������ơA���Ȭ۷���`�ݨ���
int Count=0,PRad=0;
//�Ĥ@�hfor�j��Ω��X�ݨ��D��
for(int i=0;i<3;i++){
	%>
	<br><br>
	<font size=4 color=gray><b><%=qus.getQus(i) %></b></font>
	<br><br>
	<%
	//�ĤG�hfor�j��Ω��X�ݨ��U���έp
	for(int j=0;j<5;j++){
		%>
	<table><tr width=290>
	<td width=120><font size=4 color=Maroon><b>
	<!-- �qaryOpt�}�C���o�ﶵ�� -->
	<%=qus.getOpt(j) %>
	</b></font></td>
	<%
	Count = qus.RecNum(con.getConnection(), "Qus"+(i+1)+"="+(j+1));  //���o����������i�D�ؿﶵ��j���Q�������������
	
	PRad = Count * 100/TotalRec;  //�p���i�D�ؿﶵ��j���Q������ʤ���
	%>
	<!-- �H�ʤ���ȧ@���x�s�檺�e�סA�Ӯ檺�C��N��aryColor�}�C�����o -->
	<td width=<%=PRad %> bgcolor=<%=qus.getColor(j) %>></td>
	<td><font size=4 color=Red><b>(<%=PRad %>%)</b></font>
	</td></tr>
	</table>
	<%
	}
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"  %>
<%  //���P�_�O�_����椤���O���s�ǻ��L�ӡA�Y�S���h�N�s�����ɦV��VoteForm.jsp��
if(request.getParameter("submit1")==null){
	%>
	<jsp:forward page="VoteForm.jsp"></jsp:forward>
	<% 
}

Cookie Voted = null,temp=null;

Cookie cookies[] = request.getCookies();
int cookielen = cookies.length;
for(int i=1;i < cookielen;i++){
	temp = cookies[i];
	if(temp.getName().equals("Voted")){
		Voted = temp;
	}
}
if(Voted == null){
	%>
	<jsp:useBean id="vote" scope="session" class="com.bitc.store.VoteBean"/>
	<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
	<% 
	vote.InsertChoice(con.getConnection(), request.getParameter("choice"));
	//���۱N�벼�����s�W�ܸ�Ʈw��
	Voted = new Cookie("Voted","yes");
	//Voted.setMaxAge(7*24*60*60);  //�]���@�P����
	response.addCookie(Voted);   //�NVoted����x�s��cookies���H�קK�ϥΪ̭˲�
	response.sendRedirect("VotedRes.jsp");
}
%>
<!-- ��Cookies���i���oVoted�ܼƮɡA��X�U����HTML�ԭz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>������y</title>
</head>
<body>
<center>
<h2><font color=blue>�n�Ѳ���</font></h2>
<br><br><br>
<font size=6 color=red>���୫�Ƨ벼�@!!����@</font>
</center>
</body>
</html>
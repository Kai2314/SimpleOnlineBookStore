<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%
String Price = request.getParameter("tbxPrice");  //���o�s���X�����B
//�Y�S���ǻ�����ƫh�N�s�����ɦV��BidFrm.jsp��
if(Price == null){
	response.sendRedirect("BidFrm.jsp");
}else{
	%>
	<%--�إ�BeanSaver���� --%>
	<jsp:useBean id="saver" scope="page" class="com.bitc.store.BeanSaver"/>
	<%--�q�ɮר��o�WBidData��Bean���� --%>
	<<jsp:useBean id="bid" beanName="com.bitc.BeanSer.BidData"></jsp:useBean>
	<%--�N���ǻ��L�Ӫ���Ƴ]�w��Bean���� --%>
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.net.URLEncoder"%>
<jsp:useBean id = "cart" scope = "session" class = "com.bitc.store.CartBean"/>

<% 
String RePut = request.getParameter("RePut");   //get the RePut object
//���ModifyForm.jsp�I�s��JSP�����ɡA�N�ǤJ���Ѽư��歫�s�x�s�ʪ���ƪ��ʧ@
if(RePut != null){
	cart.ClearCart();
}
String BookID[] = request.getParameterValues("ckbBID");
//�N��椤ckbBID���(�D����)������x�s��BookID�}�C��

//�Q��ckbBID��ǻ����ѼơA���o��椤��J���q�ʼƶq�A�ñN���x�s
for(int i=0;i<BookID.length;i++){
	String Qty = request.getParameter("txb"+BookID[i]); //�Q�Υ�ckbID��ǻ��L�Ӫ��Q�D����y�s���A�t�Xrequest������o�q�ʼƶq
	cart.addBook(BookID[i], Qty); //�s�W�q�ʮ��y
	}



//��ModifyForm.jsp�I�s��JSP�����ɡA�i���ʪ���ƪ��ק�ɱN�ǤJRePut�ѼơA�h������ƪ��ק��N�s�����ɦV��ViewCart.jsp�A�_�h�ɦV
//BookList.jsp�����A�öǤJ���˵������y����

if(RePut != null){
	response.sendRedirect("ViewCart.jsp");
}else{
	String url = "BookList.jsp?CategoryID="+request.getParameter("CategoryID")+"&Category="
				+URLEncoder.encode(request.getParameter("Category")); 
	//�إ߾ɦV�ܷs���������|�P�Ѽ�
	response.sendRedirect(url);
}
%>
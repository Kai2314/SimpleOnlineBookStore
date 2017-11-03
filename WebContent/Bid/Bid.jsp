<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%
String Price = request.getParameter("tbxPrice");  //取得新的出價金額
//若沒有傳遞表單資料則將瀏覽器導向至BidFrm.jsp檔
if(Price == null){
	response.sendRedirect("BidFrm.jsp");
}else{
	%>
	<%--建立BeanSaver物件 --%>
	<jsp:useBean id="saver" scope="page" class="com.bitc.store.BeanSaver"/>
	<%--從檔案取得名BidData的Bean物件 --%>
	<jsp:useBean id="bid" beanName="com.bitc.BeanSer.BidData" scope="page" type="com.bitc.store.Bid"/>
	<%--將表單傳遞過來的資料設定為Bean物件 --%>
	<jsp:setProperty name="bid" property="name" param="tbxUser"/>
	<jsp:setProperty name="bid" property="price" param="tbxPrice"/>
	<% 
	String path = request.getRealPath("/");  //現在不推薦使用，可改用新API  //取得上一層目錄的實體磁碟路徑
	path = path+"WEB-INF\\classes\\com"+"\\bitc\\BeanSer\\BidData.ser";  //建立儲存物件之檔案的路徑與名稱
	saver.save(bid,path);
	response.sendRedirect("BidFrm.jsp");
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
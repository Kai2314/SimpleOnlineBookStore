<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.net.URLEncoder"%>
<jsp:useBean id = "cart" scope = "session" class = "com.bitc.store.CartBean"/>

<% 
String RePut = request.getParameter("RePut");   //get the RePut object
//當由ModifyForm.jsp呼叫此JSP網頁時，將傳入此參數執行重新儲存購物資料的動作
if(RePut != null){
	cart.ClearCart();
}
String BookID[] = request.getParameterValues("ckbBID");
//將表單中ckbBID控制項(挑選欄)的資料儲存至BookID陣列中

//利用ckbBID欄傳遞的參數，取得表單中輸入的訂購數量，並將值儲存
for(int i=0;i<BookID.length;i++){
	String Qty = request.getParameter("txb"+BookID[i]); //利用由ckbID欄傳遞過來的被挑選書籍編號，配合request物件取得訂購數量
	cart.addBook(BookID[i], Qty); //新增訂購書籍
	}



//當ModifyForm.jsp呼叫此JSP網頁時，進行購物資料的修改時將傳入RePut參數，則完成資料的修改後將瀏覽器導向至ViewCart.jsp，否則導向
//BookList.jsp網頁，並傳入欲檢視的書籍分類

if(RePut != null){
	response.sendRedirect("ViewCart.jsp");
}else{
	String url = "BookList.jsp?CategoryID="+request.getParameter("CategoryID")+"&Category="
				+URLEncoder.encode(request.getParameter("Category")); 
	//建立導向至新網頁的路徑與參數
	response.sendRedirect(url);
}
%>
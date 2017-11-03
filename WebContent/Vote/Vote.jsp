<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"  %>
<%  //先判斷是否有表單中指令按鈕傳遞過來，若沒有則將瀏覽器導向至VoteForm.jsp檔
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
	//接著將投票紀錄新增至資料庫中
	Voted = new Cookie("Voted","yes");
	//Voted.setMaxAge(7*24*60*60);  //設為一周有效
	response.addCookie(Voted);   //將Voted資料儲存於cookies中以避免使用者倒票
	response.sendRedirect("VotedRes.jsp");
}
%>
<!-- 當Cookies中可取得Voted變數時，輸出下面的HTML敘述 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>票選書籍</title>
</head>
<body>
<center>
<h2><font color=blue>好書票選</font></h2>
<br><br><br>
<font size=6 color=red>不能重複投票哦!!不行哦</font>
</center>
</body>
</html>
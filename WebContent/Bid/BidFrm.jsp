<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>網路競標</title>
<script language = "javascript">

function CheckData(Price){
	if(frmPrice.tbxUser.value == ""){
		window.alert("需填入姓名 !!");
		document.frmPrice.elements(0).focus();  //將游標移至姓名輸入欄
		return;
	}
	if(frmPrice.tbxPrice.value == ""){
		window.alert("請輸入出價的金額!!");
		document.frmPrice.elements(0).focus();
		return;
	}
	if(isNaN(parseInt(frmPrice.tbxPrice.value))){  //isNaN也可以換其他方法
		window.alert("請輸入數字!!");
		document.frmPrice.elements(0).focus();
		return;
	}
	if(parseFloat(frmPrice.tbxPrice.value)<parseInt(Price)){
		window.alert("出價金額不可低於目前的價格!!");
		document.frmPrice.elements(1).focus();
		return;
	}
	frmPrice.submit();
} 
</script>
</head>
<body>
<center>
<font size=5 color=blue>網路競標</font>
</center>
<hr>
<p>
<b><font size=5 color=midnightblue>XML技術實務</font><br>
<font size=3 color=green>[XML/XSLT/XPath/XML Schema/SOAP/Web Service/與ASP、JAVA、Access、SQL Server之整合]</font>
</b></p>
<table>
<tr><td align=top width=200><IMG src="W2145.jpg"/></td>
<td><b>
<p><font color=brown>書號：</font>
<font color=blue>W2145</font></p>
<p><font color=brown>作者：</font>
<font color=blue>位元文化</font></p>
<p><font color=brown>出版日期：</font>
<font color=blue>2002/5/10</font></p>
<p><font color=brown>頁數：</font>
<font color=blue>1233</font></p>
</b></td>
</tr>
</table>

<%--起始Bean物件 --%>
<jsp:useBean id="saver" scope="page" class="com.bitc.store.BeanSaver"/>
<%
try{
%>
<%--從檔案載入Bean物件 --%>
<jsp:useBean id="bid" beanName="com.bitc.BeanSer.BidData" scope="page" type="com.bitc.store.Bid"/>
<% 
}catch(Exception ex){
	%>
	<%--若無法正常載入Bean的物件時，下面的敘述將起始Bean物件的建立 --%>
	<jsp:useBean id="initBid" class="com.bitc.store.Bid"/>
	
	<%--設定Bean物件的屬性 --%>
	<jsp:setProperty name="initBid" property="name" value="起標價"/>
	<jsp:setProperty name="initBid" property="price" value="450"/>
	<% 
	String path = request.getRealPath("/");  //取得上一層目錄的實際磁碟路徑  
	//request.getSession().getServletContext().getRealPath();
	
	path = path+"WEB-INF\\classes\\com"+"bitc\\BeanSer\\BidData.ser";  //建立儲存物件之檔案的路徑與名稱
	
	saver.save(initBid, path);  //將物件寫入檔案
	
	pageContext.setAttribute("bid",saver.load(path));  //物件設定至pageContext物件中從檔案載入Bean物件
}%>
<h3>目前最高價格<font size=5 color=red>
<jsp:getProperty name="bid" property="price"/> 
</font>
出價者為<font size=5 color=red>
<jsp:getProperty property="name" name="bid"/></font>
<form action="Bid.jsp" name="frmPrice" method=post>
我是<input type="text" name=tbxUser size=10>出價<input type="text" name="tbxPrice" size=10>元</h3>
<!-- 將目前的競標價格傳入checkdata()函數檢查使用者的出價是否高於原價 -->
<input type="button" value="出價 !" name=submit1 onlick="CheckData(<jsp:getProperty name="bid" property="price"/>)">
</form>
</h3>
</b>
</table>
</body>
</html>
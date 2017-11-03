<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>問卷調查</title>
</head>
<body>
<center>
<font size=5 color=blue>問卷調查</font> 
</center>
<hr>
<%--起始Bean物件 --%>
<jsp:useBean id="qus" scope="session" class="com.bitc.store.QusBean"/>
<jsp:useBean id="con" scope="session" class="com.bitc.store.DBCon"/>
<font size=5 color=midnightblue>
<jsp:getProperty property="title" name="qus"/>
</font>
<font size=4 color=green>
<jsp:getProperty property="subTitle" name="qus"/>
</font>
<font size=4>問卷統計結果..</font>
<%
int TotalRec = qus.RecNum(con.getConnection(), "");  //取得Qus資料表中的總紀錄筆數，此值相當於總問卷數
int Count=0,PRad=0;
//第一層for迴圈用於輸出問卷題目
for(int i=0;i<3;i++){
	%>
	<br><br>
	<font size=4 color=gray><b><%=qus.getQus(i) %></b></font>
	<br><br>
	<%
	//第二層for迴圈用於輸出問卷各項統計
	for(int j=0;j<5;j++){
		%>
	<table><tr width=290>
	<td width=120><font size=4 color=Maroon><b>
	<!-- 從aryOpt陣列取得選項值 -->
	<%=qus.getOpt(j) %>
	</b></font></td>
	<%
	Count = qus.RecNum(con.getConnection(), "Qus"+(i+1)+"="+(j+1));  //取得紀錄集中第i題目選項第j項被選取的紀錄筆數
	
	PRad = Count * 100/TotalRec;  //計算第i題目選項第j項被選取的百分比
	%>
	<!-- 以百分比值作為儲存格的寬度，該格的顏色將由aryColor陣列中取得 -->
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
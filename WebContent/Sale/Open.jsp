<%@ page contentType="text/html; charset=Big5" 
	import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<CENTER>
<FONT SIZE = 5 COLOR = blue></FONT>
</CENTER>
<HR>
<P></P>

<CENTER>
<%
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");

String dbURL = "jdbc:ucanaccess://C:/StoreDB.mdb";
Connection con = DriverManager.getConnection(dbURL);
Statement stmt = con.createStatement();
//�إ�Statement����

ResultSet rs;
//�إ�ResultSet(���G��)����

rs = stmt.executeQuery("SELECT * FROM Book");
//����SQL�ԭz
%>
<TABLE  bgcolor=DodgerBlue>
	<TR  bgcolor=SkyBlue>	
	<TD><B>���y�s��</B></TD><TD><B>��  �W</B></TD><TD><B>�@  ��</B></TD>	
	</TR>	
	<%
	//�Q��while�j��N��ƪ����O���C�X
	while (rs.next())
	{
		%>
		<TR bgcolor=LightGoldenrodYellow>
		<TD><B><%= rs.getString("BookNm") %></B></TD>
		<TD><B><%= rs.getString("BookID") %></B></TD>
		<TD><B><%= rs.getString("Author") %></B></TD>			
		</TR>
		<%
	}

	if(rs != null) rs.close(); //����ResultSet����
	if(stmt != null) stmt.close(); //����Statement����
	if(con != null) con.close(); //������Ʈw�s������
	%>	
</TABLE>
</CENTER>

</BODY>
</HTML>

<%@ page contentType="text/html; charset=Big5" 
	import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE>�z�LJNDI���o��Ʈw�s��</TITLE>
</HEAD>
<BODY>
<CENTER>
<FONT SIZE = 5 COLOR = blue>�z�LJNDI���o��Ʈw�s��</FONT>
</CENTER>
<HR>
<P></P>

<CENTER>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//���J�X�ʵ{�����O

Connection con = DriverManager.getConnection("jdbc:odbc:StoreDB");
//�إ߸�Ʈw�s�u

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

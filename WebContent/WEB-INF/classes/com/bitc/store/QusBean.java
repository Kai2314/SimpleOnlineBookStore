package com.bitc.store;
import java.sql.*;
public class QusBean {
	private String Title = "XML�޳N���";
	private String SubTitle = "[XML/XSTL/XPath/XML Schema/SOAP/Web Service/�PASP�BJava�BAccess�BSQL Server����X]";
	private int QusNum = 3;  //���D�ƥ�
	private String Qus[] = {"�z���N���Ѫ����e��?","�z���N���Ѫ������s���?","�z���N���Ѫ��ʭ��]�p��?"};
	private String Color[] = {"Yellow","DeepPink","DarkCyan","DeepSkyBlue","Orange","LightSlateGray"};  //�w�q���͹Ϫ��C��
	private int OptNum = 5; //�w�q�ﶵ�Ӽ�
	private String Opt[] = {"�ܺ��N","���N","�|�i","�����N","�ܤ����N"};
	
	public String getQus(int i) {
		return Qus[i];
	}
	public String getOpt(int i) {
		return Opt[i];
	}
	public String getColor(int i) {
		return Color[i];
	}
	public String getTitle() {
		return this.Title;
	}
	public String getSubTitle() {
		return this.SubTitle;
	}
	
	private Connection con = null;
	private Statement sta = null;
	
	public QusBean() {}
	
	//�N�ݨ������׷s�W��Ʈw�A�^�ǭȦ��ʧ@�Ҽv�T����������
	public int InsertAns(Connection con,String rad1,String rad2,String rad3) {
		int affect = 0;
		String strSQL = "INSERT INTO Qus(Qus1,Qus2,Qus3)"+"VALUES("+rad1+","+rad2+","+rad3+")";
		try {
			this.con=con;
			sta = this.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			affect = sta.executeUpdate(strSQL);
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return affect;
	}
	
	public int RecNum(Connection con,String filter) {
		String strSQL = "SELECT ID FROM Qus";
		int num = 0;
		//�P�_filter�r��O�_���ťզr��
		if(!filter.equals("")) {
			strSQL = strSQL +"WHERE"+filter;  //�إ߰��檺SQL�ԭz
		}
		try {
			Statement lsta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			ResultSet rs = lsta.executeQuery(strSQL);
			rs.last();          //���̫ܳ�@������
			num = rs.getRow();  //���o�������C��
			
			rs.close();
			lsta.close();
		}catch(SQLException sqlex) {
			System.out.println(sqlex.toString());
		}
		return num;
	}

}

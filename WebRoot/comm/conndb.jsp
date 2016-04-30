<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%!//examtest表
	int id;
	String subjectId;
	String title;
	String a;
	String b;
	String c;
	String d;
	String answer;
	String isChosen;
	String type;
	//loginuser表
	String userName;
	String password;
	String department;
	String job;
	String classes;
	String permission;
	//manager表
	String isManager;
	//exampaper表
	String paperName;
	String choiceNum;
	String choiceId;
	String multipleChoiceNum;
	String multipleChoiceId;
	String optionNum;
	String optionId;
	int totalPoint;
	int time;

	//subject表
	String subjectName;
	//连接数据库
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	String sql = null;%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/testonline?useUnicode=true&amp;characterEncoding=UTF-8&allowMultiQueries=true", "root",
				"123456");
		stmt = conn.createStatement();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

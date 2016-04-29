<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp"%>
<html>
<head>
<title>学生智能测评系统</title>
</head>

<body>
	<%
		int n = 0;
		String answer1;//用户的答案
		int paperid = Integer.parseInt(request.getParameter("paperid"));
		sql = "select id,answer from examtest where id in (select choiceId from exampaper where id = "+paperid+")";
		
			
		String time="";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		time = format.format(new Date());
		
		rs = stmt.executeQuery(sql);


		while (rs.next()) {
			id = rs.getInt("id");
			//从数据库中获取正确答案
			answer = rs.getString("answer");
			//获取用户所选的答案
			answer1 = request.getParameter(String.valueOf(id));
			//这里的id为一组单选按钮的名称，并且获得它的value值
			if (answer1 == null) {
				answer1 = "";
			}
			if (answer1.equals(answer)) {
				n++;
			}else{
				String sql2 = "insert into errortest(examtestid,paperid,errorselection,time) value(?,?,?,?) ";
				ps=conn.prepareStatement(sql2);
				ps.setInt(1, id);
				ps.setInt(2, paperid);
				ps.setString(3, answer1);
				ps.setString(4, time);
				ps.executeUpdate();
			}
		}
	%>
	<%
		out.print("您总共回答对了" + n + "道题");
		out.print("<br>");
		out.print("您的得分是" + 20 * n + "分,继续加油！");
	%>


</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生智能测评系统</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body style="text-align:center;">
	<form action="studentGrad.jsp" method="post">
		<div style="text-align:center;font-size:x-large;">我的错题汇总</div>
		<div>
			<table border="1" cellspacing="0" cellpadding="0"
				bordercolor="#005FBD" style="text-align:center;margin-top: 20px" width="100%">
				<tr>
					<td style="background-color: rgb(85, 170, 255);width=200;">试卷</td>
					<td style="background-color: rgb(85, 170, 255);width=200;">问题</td>
					<td style="background-color: rgb(85, 170, 255);width=320;">正答</td>
					<td style="background-color: rgb(85, 170, 255);width=220;">错答</td>
					<td style="background-color: rgb(85, 170, 255);width=220;">错答时间</td>
				</tr>
				<%
					int userID = Integer.parseInt(session.getAttribute("studentID").toString());
					String answer;
					String answerContext;
					String title;
					String err;
					String time;
					String sName;

					sql = "SELECT *,ep.paperName FROM errortest et LEFT JOIN examtest t ON et.examtestid = t.id LEFT JOIN `subject` s on s.id = t.subjectId left join exampaper ep on ep.id = et.examtestid  ";

					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						sName = rs.getString("paperName");
						answerContext = rs.getString("answerContext");
						title = rs.getString("title");
						err = rs.getString("errorselection");
						time = rs.getString("time");
				%>
				<tr>
					<td><%=sName%></td>
					<td><%=title%></td>
					<td><%=answerContext%></td>
					<td><%=err%></td>
					<td><%=time%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</form>
</body>
</html>

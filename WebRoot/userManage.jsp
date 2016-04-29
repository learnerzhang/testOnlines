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
	<form action="userDelMany.jsp" method="post">
		<div style="text-align:center;font-size:26;">用户管理</div>
		<div style="text-align:right;font-size:16;margin: 10px">
			<a href="insertUserIndex.jsp">插入用户</a>
		</div>
		<div>
			<table border="1" cellspacing="0" cellpadding="0"
				bordercolor="#005FBD" style="text-align:center;width: 100%">
				<tr>
					<td style="background-color: rgb(85, 170, 255);width:80;">选择</td>
					<td style="background-color: rgb(85, 170, 255);width:80;">用户id</td>
					<td style="background-color: rgb(85, 170, 255);width:100;">用户名</td>
					<td style="background-color: rgb(85, 170, 255);width:100;">密码</td>
					<td style="background-color: rgb(85, 170, 255);width:120;">是否是管理员（yes/no）</td>
					<td style="background-color: rgb(85, 170, 255);width:80;">操作</td>
				</tr>
				<%
					String userName;
					String password;
					String isManager;
					sql = "select * from manager";
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						id = rs.getInt("id");
						userName = rs.getString("userName");
						password = rs.getString("password");
						isManager = rs.getString("isManager");
				%>
				<tr>
					<td style="background-color: rgb(85, 170, 255);"><input
						type="checkbox" name="check" value=<%=id%>>
					</td>
					<td><%=id%></td>
					<td><%=userName%></td>
					<td><%=password%></td>
					<td><%=isManager%></td>
					<td><a href="userCorrect.jsp?userId=<%=id%>">修改</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<br>
		<div align=center>
			<input type="submit" name="OK" class="btn btn-success" value="单项或多项删除">
		</div>
	</form>
</body>
</html>

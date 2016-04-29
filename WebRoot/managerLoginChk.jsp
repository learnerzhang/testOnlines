<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

<body>
	<%
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String permission1 = request.getParameter(String.valueOf("permission"));//用户所选择的登录身份
		//String permission;//存放数据库中的身份
		sql = "select * from manager where userName= '" + username + "' ";
		rs = stmt.executeQuery(sql);
		try {

			while (rs.next()) {
				id = rs.getInt("id");
				if (password.equals(rs.getString(3))) //数据库中第二个字段：userName
				{
					permission = rs.getString("isManager");//从数据库中获取的登录身份
					if (permission1.equals(permission)) {
						if (permission1.equals("yes")) {
	%>
	<jsp:forward page="managerIndex.html"></jsp:forward>
	<%
		} else {
							session.setAttribute("managerID", id + "");
	%>
	<jsp:forward page="teacherIndex.html"></jsp:forward>
	<%
		}

					} else {
	%>
	<jsp:forward page="permissionError.html"></jsp:forward>
	<%
		}
				} else {
	%>
	<jsp:forward page="failure.jsp"></jsp:forward>
	<%
		}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>

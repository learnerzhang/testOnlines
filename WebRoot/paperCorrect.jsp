<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*"%>
<%@ include file="comm/conndb.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'paperCorrect.jsp' starting page</title>

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
		//修改后
		int in_id = Integer.parseInt(request.getParameter("id"));
		String in_paperName = request.getParameter("paperName");
		String in_choiceNum = request.getParameter("choiceNum");
		String in_choiceId = request.getParameter("choiceId");
		String in_optionNum = request.getParameter("optionNum");
		String in_optionId = request.getParameter("optionId");
		String in_totalPoint = request.getParameter("totalPoint");
		System.out.println(in_paperName+":in_paperName");
		sql = "update exampaper set paperName =?,choiceNum=?,choiceId=?,optionNum=?,optionId=?,totalPoint=? where id="
				+ in_id;
		ps = conn.prepareStatement(sql);
		//数字表示第几个问号,后面为重新赋的值.
		ps.setString(1, in_paperName);
		ps.setString(2, in_choiceNum);
		ps.setString(3, in_choiceId);
		ps.setString(4, in_optionNum);
		ps.setString(5, in_optionId);
		ps.setString(6, in_totalPoint);
		ps.executeUpdate();
	%>
	<jsp:forward page="paperManage.jsp"></jsp:forward>
</body>
</html>

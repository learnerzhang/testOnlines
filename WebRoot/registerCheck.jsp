<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*" %>
<%@ include file="comm/conndb.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registerCheck.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--<link rel="stylesheet" type="text/css" href="styles.css"> -->

  </head>
  
  <body style="text-align:center;">
     <%
     	sql="insert into loginuser(userName,password,department,classid,job) values(?,?,?,?,?)";
     	ps=conn.prepareStatement(sql);
     	userName=Convert.convert(request.getParameter("userName"));
     	password=Convert.convert(request.getParameter("password"));
     	department=Convert.convert(request.getParameter("department"));
     	classes=Convert.convert(request.getParameter("classes"));
     	job=Convert.convert(request.getParameter("job"));
     	ps.setString(1,userName);
     	ps.setString(2,password);
     	ps.setString(3,department);
     	ps.setString(4,classes);
     	ps.setString(5,job);
     	ps.executeUpdate();
      %>
      <h1>恭喜您注册成功！！</h1>
      <h1><a href="login.html">返回登陆</a></h1>
  </body>
</html>
<iframe  width=100 height=0></iframe>

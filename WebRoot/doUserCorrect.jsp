<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*" %>
<%@ include file="comm/conndb.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doUserCorrect.jsp' starting page</title>
    
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
    try{
    	String in_id=request.getParameter("id");
    	String in_userName=Convert.convert(request.getParameter("userName"));
    	String in_password=Convert.convert(request.getParameter("password"));
    	String in_isManager=request.getParameter("isManager");
    	sql="update manager set userName=?,password=?,isManager=? where id="+in_id;
    	ps=conn.prepareStatement(sql);
    	ps.setString(1,in_userName);
    	ps.setString(2,in_password);
    	ps.setString(3,in_isManager);
    	ps.executeUpdate();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
     %>
     <jsp:forward page="userManage.jsp"></jsp:forward>
  </body>
</html>

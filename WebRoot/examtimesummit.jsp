<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<%@ page import="sample.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>处理考试时间设定</title>
    
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
  			String paperid  = request.getParameter("id");
  			String time  = request.getParameter("time");
  			
  			sql="update exampaper set time=? where id="+paperid;
	    	ps=conn.prepareStatement(sql);
	    	ps.setInt(1,Integer.parseInt(time));
	    	ps.executeUpdate();
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
  		 %>
  		 <jsp:forward page="examtime.jsp"></jsp:forward>
  </body>
</html>

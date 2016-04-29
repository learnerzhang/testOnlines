<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userDelMany.jsp' starting page</title>
    
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
	    	String str[] = request.getParameterValues("check");
	    	for(int i=0;i<str.length;i++)
	    	{
		    	sql="delete from manager where id="+Integer.parseInt(str[i]);
		    	stmt.executeUpdate(sql);
		    }
    	}catch(Exception e){
    		e.printStackTrace();
    	}
     %>
     <jsp:forward page="userManage.jsp"></jsp:forward>
  </body>
</html>
<iframe  width=100 height=0></iframe>

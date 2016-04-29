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
    
    <title>管理个人信息</title>
    
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
  <form action="doManagerCorrect.jsp">
  	<table class="table table-striped">
    <%
    	String phone = "";
    	id=Integer.parseInt(session.getAttribute("managerID").toString());
   		sql="select * from manager where id='"+id+"'";
   		rs=stmt.executeQuery(sql);
   		while(rs.next()){
			userName=rs.getString("userName");
			password=rs.getString("password");
			isManager=rs.getString("isManager");
			phone =rs.getString("phone");
   		}
     %>
     <tr>
     	<td><label >用户id:</label></td>
     	<td><input type="text" readonly="readonly" name="id" value=<%=id %>></td>
     </tr>
     <tr>
     	<td><label >用户名:</label></td>
     	<td><input type="text" name="userName" value=<%=userName %>></td>
     </tr>
     <tr>
     	<td><label >密码:</label></td>
     	<td><input type="text" name="password" value=<%=password %>></td>
     </tr>
     <tr>
     	<td><label >phone:</label></td>
     	<td><input type="text"  name="phone" value=<%=phone %>></td>
     </tr>
     </table><br>
     <div align=center>
     	<input type="submit" class="btn btn-success" width="100px" name="OK" value="修改">
     </div>
   </form>
  </body>
</html>

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
	<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/check.js"></script>
  </head>
  
  <body style="text-align:center;">
    <form action="insertUser.jsp" method="post" onsubmit="return check()">
 	 <table border="1" cellspacing="0" cellpadding="0" bordercolor="#005FBD" style="text-align:left;    margin-left: 453px;margin-top: 15px;">
	    <tr>
	    	<td style="background-color: rgb(85, 170, 255);text-align:center;">用户名</td>
			<td><input type="text" name="userName" id="userName" value=""></td>
		</tr>
		
		<tr>
			<td style="background-color: rgb(85, 170, 255);text-align:center;">密码</td>
			<td><input type="text" name="password" id="password" value=""></td>
		</tr>
		
		<tr>
			<td style="background-color: rgb(85, 170, 255);text-align:center;">是否是管理员</td>
			<td><!-- <input type="text" name="isManager" id="isManager"   value=""> -->
				<select name="isManager" id="isManager" style="width: 199px;">
					<option value="yes">是</option>
					<option value="no">否</option>
				</select>
			</td>
		</tr>
     </table><br>
     <div>
     	<input type="submit" name="OK"  class="btn btn-success" value="插入用户">
     </div>
     </form>
  </body>
</html>

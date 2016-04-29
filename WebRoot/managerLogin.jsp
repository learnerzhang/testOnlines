<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <link href="CSS/login.css" rel="stylesheet" type="text/css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
 <script type="text/javascript" src="js/jquery.js"></script>
 <link rel="stylesheet" type="text/css" href="CSS/login.css">
  <body class="bg">
  <div id="container">
	  <div id="logo">
	  <form action="managerLoginChk.jsp" onsubmit="return check()">
	  <table style="margin-left: 107px">
	  	<tr>
		     	<td>用户名：</td>
		     	<td><input type="text" name="userName" id="userName" /></td>
		</tr>
		
		<tr>
		     	<td>密&nbsp;码：</td>
		     	<td><input type="password" name="password" id="password"/></td>
		</tr>
		<tr>
		     	<td>身&nbsp;份：</td>
		     	<td><input type="radio" checked="checked" name="permission" value="yes"><label>系统管理员</label>
		     		<input type="radio" name="permission" value="no"><label>普通教师</label>
		     	</td>
		</tr>
	</table>
	<br>
		     	<input type ="submit"  class="btn btn-success" value="登陆"/>
		     	<input type="reset" class="btn btn-default" value="重置"/>
	  </form>
	  </div>
  </div>
  </body>
  <script type="text/javascript">
  	function check(){
  		if($("#userName").val() == ""){
  			alert("请填写用户名!");
  			return false;
  		}
  		if($("#password").val() == ""){
  			alert("请填写密码!");
  			return false;
  		}
  		
  		return true;
  	}
  </script>
</html>

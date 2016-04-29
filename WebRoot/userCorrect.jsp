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
  <form action="doUserCorrect.jsp">
  	<table border="1" cellspacing="0" cellpadding="0" bordercolor="#005FBD" style="text-align:center;width: 50%;margin-left: 304px;margin-top: 10px;">
    <%
    	id=Integer.parseInt(request.getParameter("userId"));
   		sql="select * from manager where id='"+id+"'";
   		rs=stmt.executeQuery(sql);
   		while(rs.next()){
			userName=rs.getString("userName");
			password=rs.getString("password");
			isManager=rs.getString("isManager");
   		}
     %>
     <tr>
     	<td style="background-color: rgb(85, 170, 255);">用户id</td>
     	<td><input type="text" name="id" value=<%=id %>></td>
     </tr>
     <tr>
     	<td style="background-color: rgb(85, 170, 255);">用户名</td>
     	<td><input id="username" type="text" name="userName" value=<%=userName %>></td>
     </tr>
     <tr>
     	<td style="background-color: rgb(85, 170, 255);">密码</td>
     	<td><input id="password" type="text" name="password" value=<%=password %>></td>
     </tr>
     <tr>
     	<td style="background-color: rgb(85, 170, 255);">是否是管理员(yes/no)</td>
     	<td><input type="text" name="isManager" value=<%=isManager %>></td>
     </tr>
     </table><br>
     <div align=center>
     	<input type="submit" onclick="check()" class="btn btn-success"  name="OK" value="修改">
     </div>
   </form>
  </body>
  <script type="text/javascript">
	function check(){
		var name = document.getElementById("username").value;
		if(""==name){
			alert("用户名不能为空！");
			return false;
		}
		return true;
	}
</script>
</html>

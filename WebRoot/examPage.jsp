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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/examPage.css">
<script type="text/javascript" src="js/exit.js"></script>
  </head>
  
  <body>
    <div id="container">
		<div id="logo">	
			<ul>
			  <li><a href="randSubjectSelect.jsp" target="test"><font color="white"></font></a></li>
			  <li><a href="subjectSelect.jsp" target="test"><font color="white">我要考试</font></a></li>
			  <li><a href="personalGrad.jsp" target="test"><font color="white">个人成绩</font></a></li>
			  <li><a href="errorTest.jsp" target="test"><font color="white">错题汇总</font></a></li>
			  <li><a href="javascript:exit()" ><font color="white">退出系统</font></a></li>
		  </ul>
	  </div>
		
		<div id="left">
			<p>欢迎<%=session.getAttribute("userName") %><br/>登录学生智能测评系统</p>
			<ul>
				<li>用户名：<%=session.getAttribute("userName") %></li>
				<li>所在系：<%=session.getAttribute("department") %></li>
				<li>班&nbsp;级：<%=session.getAttribute("classes") %></li>
			</ul>
	  	</div>
	  	
		<div id="right">
		  <iframe name="test" id="rightFrame"> </iframe>
		</div>
	
	</div>
  </body>
</html>

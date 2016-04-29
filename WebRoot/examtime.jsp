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
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
	.font1{
		font:bold;
	}
</style>
  </head>
  
  <body>
  <div align="center">
  	 <label for="exampleInputEmail1">设定考试时间</label>
  </div>
  <table class="table font1 table-hover">
  	<tr><td>试卷</td><td>设定时间</td><td>操作</td></tr>
  </table>
  	<%
  	sql="select id,paperName,time from exampaper";	
  	rs=stmt.executeQuery(sql);
  	while(rs.next()){
  		id=rs.getInt("id");
  		String paperName=rs.getString("paperName");
  		String time = rs.getString("time");
    %>
  		<table class="table table-hover">
  		<form action="examtimesummit.jsp" method="post">
  			<tr>
  				<td><%=paperName %></td>
  				<td>
  					<select name="time" class="form-control">
					  <option value="30" 
					  <% if("30".equals(time)){
					  %>
					  	selected="selected"
					  <%
					  } %> >30m</option>
					  <option value="60" <% if("60".equals(time)){
					  %>
					  	selected="selected"
					  <%
					  } %> >60m</option>
					  <option value="90" <% if("90".equals(time)){
					  %>
					  	selected="selected"
					  <%
					  } %> >90m</option>
					  <option value="120" <% if("120".equals(time)){
					  %>
					  	selected="selected"
					  <%
					  } %> >120m</option>
					  <option value="180" <% if("180".equals(time)){
					  %>
					  	selected="selected"
					  <%
					  } %>>180m</option>
					</select>
  				</td>
  				<td>
  				<input type="hidden"  name="id" value="<%=id %>"/>
  					<input type="submit" class="btn btn-default"></button>
  				</td>
  			</tr>
  			</form>
  		</table>
    <%
    }
     %>
  </body>
</html>

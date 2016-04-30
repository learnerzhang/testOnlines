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

  </head>
  
  <body>
    <form action="fixedSelect.jsp" method="post">
    	<table style="width: 100%;margin-top: 20px">
   			<tr>
    			<td><label>请选择科目</label></td>
    			<td>
    			<select name="subjectSelect">
  <%
  	sql="select id,subjectName from subject";	
  	rs=stmt.executeQuery(sql);
  	while(rs.next()){
  		id=rs.getInt("id");
  		subjectName=rs.getString("subjectName");
  	
    %>
    	<option value=<%=id %>><%=subjectName %></option>			
    <%
    }
     %>
     </select>
    			</td>
    			<td><input type="submit" class="btn btn-success" name="ok" value="确定"></td>
    		</tr>
  		
    	</table>
  </body>
</html>

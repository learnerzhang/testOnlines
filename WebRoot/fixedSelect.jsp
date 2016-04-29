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
  <body>
    <form action="doFixedSelect.jsp" method="post">
    	<table style="width: 100%;margin-top: 20px">
   			<tr>
    			<td><label>请选择试题</label></td>
    			<td><select name="paperSelect">
  <%
  	int subjectId=Integer.parseInt(request.getParameter("subjectSelect"));
  	sql="select id,paperName,subjectId from exampaper where subjectId='"+subjectId+"'";	
  	rs=stmt.executeQuery(sql);
  	while(rs.next()){
  		id=rs.getInt("id");
  		paperName=rs.getString("paperName");
  	
    %>
    	<option value=<%=id %>><%=paperName %></option>			
    <%
    }
     %>
     </select>
    			</td>
    			<td><input type="submit" class="btn btn-success" name="ok" value="确定"></td>
    		</tr>
  		
    	</table>
    </form>
  </body>
</html>

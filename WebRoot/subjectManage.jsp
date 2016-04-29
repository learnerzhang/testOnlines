<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<%
//..表示回到上一级目录
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
  <form action="paperManageDelete.jsp">
  <div style="text-align:right;font-size:16;margin: 5px"><a href="createSubject.jsp">添加科目</a></div>
  <div>
  <table class="table table-bordered">
   <tr>
   	<td style="background-color: rgb(140, 198, 255); width=80">选择</td>
   	<td style="background-color: rgb(140, 198, 255); width=80">科目ID</td>
   	<td style="background-color: rgb(140, 198, 255);width=80"">科目名称</td>
   	<td style="background-color: rgb(140, 198, 255);width=80"">修改</td>
   </tr>
   <%
   	String sql="select * from subject";
   	rs=stmt.executeQuery(sql);
   	try{
	   	while(rs.next()){
	   		id=rs.getInt("id");
	   		subjectName=rs.getString("subjectName");
	   	%>
	   	
	   		<tr>
	   			<td style="background-color: rgb(140, 198, 255);"><input type="checkbox" name="check" value=<%=id %>></td>
	   			<td><%=id %></td>
	   			<td><%=subjectName %></td>
	   			<td><a href="subjectManageCorrect.jsp?subjectId=<%=id %>">修改</a></td>
	   		</tr> 
   	<%
   			}
   		}catch(Exception e){
   			e.printStackTrace();
   		}
    %>
    </table>
    </div>
    <br>
    <div align=center>
    	<input type="submit" class="btn btn-success" name="OK" value="单项或多项删除">
    </div>
    </form>
  </body>
</html>

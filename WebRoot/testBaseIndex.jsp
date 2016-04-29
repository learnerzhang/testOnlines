<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp"%>
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
  <form action="testDelMany.jsp" method="post">
  <div style="text-align:right;font-size:16;margin: 20px">
	  <a href="insertTitleIndex.jsp" style="margin-right: 20px;">插入单选题</a>
	  <a href="insertMultiChoice.jsp" style="margin-right: 20px;">插入多选题</a>
	  <a href="insertOption.jsp" style="margin-right: 20px;">插入判断题</a>
  </div>
  <div>
  	<table class="table table-bordered">
		<tr>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 4%;">选择</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 8%;">科目名称</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 20%;">题目</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 10%;">选项A</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 10%;">选项B</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 10%;">选项C</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 10%;">选项D</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 5%;">答案</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 6%;">标识</td>
			<td style="background-color: rgb(85, 170, 255);text-align:center;width: 6%;">修改</td>
		</tr> 
     <%
     try{
     	sql="select * from examtest";
     	rs=stmt.executeQuery(sql);
     	while(rs.next()){
     		id=rs.getInt("id");
			subjectId=rs.getString("subjectId");
			subjectName=rs.getString("subjectName");
			title=rs.getString("title");
			a=rs.getString("a");
			b=rs.getString("b");
			c=rs.getString("c");
			d=rs.getString("d");
			type = rs.getString("type");
		 	answer=rs.getString("answer");
			isChosen=rs.getString("isChosen");
		%>
		<tr>
			<td style="background-color: rgb(85, 170, 255);"><input type="checkbox" name="check" value=<%=id %>></td>
			<td style="text-align:center"><%=subjectName %></td>
			<td><%=title %></td>
			<td><%=a %></td>
			<td><%=b %></td>
			<td><%=c %></td>
			<td><%=d %></td>
			<td style="text-align:center"><%=answer %></td>
			<td style="text-align:center"><%=isChosen %></td>
			<td style="text-align:center"><a href="testBaseCorrect.jsp?titleId=<%=id %>&type=<%=type %>">修改</a></td>
		</tr>
		<%
     		}
     	}catch(Exception e){
     		e.printStackTrace();
     	}
      %>
      </table><br>
      </div>
     <div align="center">
		<input type="submit" class="btn btn-success" name="ok" value="单项或多项删除"> 
    </div>
    </form>
  </body>
</html>

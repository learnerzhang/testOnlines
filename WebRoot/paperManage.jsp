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
  <div style="text-align:right;font-size:16;margin: 5px"><a href="createPaper.jsp">插入试卷</a></div>
  <div>
  <table class="table table-bordered">
   <tr>
   	<td style="background-color: rgb(140, 198, 255); width=80">选择</td>
   	<td style="background-color: rgb(140, 198, 255); width=80">科目名称</td>
   	<td style="background-color: rgb(140, 198, 255);width=80"">试卷名称</td>
   	<td style="background-color: rgb(140, 198, 255);width=100"">单选题数目</td>
   	<td style="background-color: rgb(140, 198, 255);width=100"">多选题数目</td>
   	<td style="background-color: rgb(140, 198, 255);width=100"">判断题数目</td>
   	<td style="background-color: rgb(140, 198, 255);width=80"">总分数</td>
   	<td style="background-color: rgb(140, 198, 255);width=80"">修改</td>
   </tr>
   <%
   	String sql="select * from exampaper";
   	rs=stmt.executeQuery(sql);
   	try{
	   	while(rs.next()){
	   		id=rs.getInt("id");
	   		subjectName=rs.getString("subjectName");
	   		paperName=rs.getString("paperName");
	   		choiceNum=rs.getString("choiceNum");
	   		choiceId=rs.getString("choiceId");
	   		multipleChoiceNum=rs.getString("multipleChoiceNum");
	   		multipleChoiceId=rs.getString("multipleChoiceId");
	   		optionNum=rs.getString("optionNum");
	   		optionId=rs.getString("optionId");
	   		totalPoint=rs.getInt("totalPoint");
	   	%>
	   	
	   		<tr>
	   			<td style="background-color: rgb(140, 198, 255);"><input type="checkbox" name="check" value=<%=id %>></td>
	   			<td><%=subjectName %></td>
	   			<td><%=paperName %></td>
	   			<td><%=choiceNum %></td>
	   			<td><%=multipleChoiceNum %></td>
	   			<td><%=optionNum %></td>
	   			<td><%=totalPoint %></td>
	   			<td><a href="paperManageCorrect.jsp?paperId=<%=id %>">修改</a></td>
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

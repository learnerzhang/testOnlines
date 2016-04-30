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
  <form action="studentGrad.jsp" method="post">
  <div style="text-align:center;font-size:26;">我的个人成绩</div>
  <div>
  	<table class="table table-bordered">
  		<tr>
  			<!-- <td style="background-color: rgb(85, 170, 255);width:300;">用户名</td> -->
  			<td style="background-color: rgb(85, 170, 255);width:400;">班级</td>
  			<td style="background-color: rgb(85, 170, 255);width:400;">试卷名</td>
  			<td style="background-color: rgb(85, 170, 255);width:420;">分数</td>
  			<td style="background-color: rgb(85, 170, 255);width:420;">班级排名</td>
  			<td style="background-color: rgb(85, 170, 255);width:420;">成绩排名</td>
  		</tr>
  		<%
  			int userID  = Integer.parseInt(session.getAttribute("studentID").toString()); 
  			String userName="";
  			String classes="";
  			String paperName="";
  			String grad="";
  			String score ="";
  			String rank="";
  			String crank ="";
  			
  			//select * from t1 ,t3 where t1.userid = t3.userid
  					
  			sql="select * from loginuser,scores where loginuser.id = scores.userid and loginuser.id="+userID;
  			
  			rs=stmt.executeQuery(sql);
  			
  			while(rs.next()){
  				userName=rs.getString("userName");
  				classes=rs.getString("classes");
  				score = rs.getString("score");
  				paperName = rs.getString("paperName");
  				crank = rs.getString("crank");
  				rank = rs.getString("rank");
  				
  		%>
  			<tr>
  				<%-- <td><%=userName %></td> --%>
  				<td><%=classes %></td>
  				<td><%=paperName %></td>
  				<td><%=score %>分</td>
  				<td><%=crank %></td>
  				<td><%=rank %></td>
  			</tr>
  		<%	
  			}
  			
  			rs.close();
  		 %>
  	</table>
  	</div>
  </form>
  </body>
</html>

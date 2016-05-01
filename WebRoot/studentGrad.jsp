<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
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
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">

  </head>
  
  <body>
  <div style="text-align:center;font-size:26;margin-bottom: 10px">学生成绩</div><div>
  <form action="studentGrad.jsp" method="post" class="form-horizontal">
	  <div class="form-group">
		  <label for="exampleInputEmail1" class="col-sm-2 control-label">  按班级查询  :</label>
		  	 <div class="col-sm-3">
		  	 <input type="text" id="exampleInputEmail1" name="cls" class="form-control">
		  	 </div>
		  	 <div class="col-sm-4">
		  	 	<input type="submit" class="btn btn-success" name="OK" value="提交查询">
		  	 </div>
	  </div>
    </form>
  	<table class="table table-hover">
  		<tr>
  			<!-- <td style="background-color: rgb(85, 170, 255);">用户id</td> -->
  			<td style="background-color: rgb(85, 170, 255);width=100;">用户名</td>
  			<td style="background-color: rgb(85, 170, 255);width=100;">班级</td>
  			<td style="background-color: rgb(85, 170, 255);width=100;">试题名</td>
  			<td style="background-color: rgb(85, 170, 255);width=120;">分数</td>
  		</tr>
  		<%
  			String cls = request.getParameter("cls");
  			String userName;
  			String classes;
  			String paperName;
  			String score;
  			
  			if(null != cls){
  				//SELECT scores.id,userid,score,classid FROM scores,loginuser WHERE scores.userid = loginuser.id
  				sql = "SELECT scores.id,userid,userName,paperName,score,classes,classid FROM scores,loginuser WHERE scores.userid = loginuser.id and classes like '%"+cls+"%'";
  			}else{
  				sql="SELECT scores.id,userid,userName,paperName,score,classes,classid FROM scores,loginuser WHERE scores.userid = loginuser.id";
  			}
  			rs=stmt.executeQuery(sql);
  			while(rs.next()){
	  			//id=rs.getInt("id");
  				score=rs.getString("score");
  				paperName=rs.getString("paperName");
  				userName=rs.getString("userName");
  				classes=rs.getString("classes");
  		%>
  			<tr>
  				<%-- <td><%=id %></td> --%>
  				<td><%=userName %></td>
  				<td><%=classes %></td>
  				<td><%=paperName %></td>
  				<td><%=score %></td>
  			</tr>
  		<%	
  			}
  		 %>
  	</table>
  	</div>
  </body>
</html>

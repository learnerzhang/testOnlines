<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<html>
  <head>
    <title>学生智能测评系统</title>
	<script type="text/javascript" src="js/jquery.js"></script>
 <link rel="stylesheet" type="text/css" href="CSS/login.css">
  </head>
  
  <body class="bg">
  <div id="container">
  	<div id="logo">
    <form action="registerCheck.jsp"  onsubmit="return check()">
    <table>
    <tr><td></td>
    	<td>用户名：</td>
    	<td><input type="text" name="userName" id="userName"></td>
    </tr>
    
    <tr><td></td>
    	<td>密&nbsp;码：</td>
    	<td><input type="password" name="password" id="password"></td>
    </tr>
    
    <tr><td></td>
    	<td>所在院校：</td>
    	<td>
    	<select value="department">
    		<%
  	sql="select id,department from department";	
  	rs=stmt.executeQuery(sql);
  	while(rs.next()){
  		id=rs.getInt("id");
  		String department=rs.getString("department");
  	
    %>
    	<option value=<%=id %>><%=department %></option>			
    <%
    }
     %>
    	</select>
    	</td>
    </tr>
    
    <tr><td></td>
    	<td>班&nbsp;级：</td>
    	<td>
    	<select value="classes">
    	<%
  	sql="select id,className from class";	
  	rs=stmt.executeQuery(sql);
  	while(rs.next()){
  		id=rs.getInt("id");
  		String className=rs.getString("className");
  	
    %>
    	<option value=<%=id %>><%=className %></option>			
    <%
    }
     %>
    	</select>
    	</td>
    </tr>
    <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	<td>专&nbsp;业：</td>
    	<td><input type="text" name="job"></td>
    </tr>
    </table><br>
    <input type="submit" class="btn btn-success" value="提交">
    <input type="reset" class="btn btn-default" value="重置">
    </form>
   </div>
   </div>
  </body>
  <script type="text/javascript">
  	function check(){
  		if($("#userName").val() == ""){
  			alert("请填写用户名!");
  			return false;
  		}
  		if($("#password").val() == ""){
  			alert("请填写密码!");
  			return false;
  		}
  		return true;
  	}
  </script>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<html>
  <head>
    <title>学生智能测评系统</title>
  </head>
  
  <body>
  <div align="left">
  <form action="examScore.jsp" method="post" name="examTitle">
   <%
   	sql="select * from examtest";
    rs=stmt.executeQuery(sql);
    try{	
	    while(rs.next()){
	    	id=rs.getInt("id");
		    title=rs.getString("title");
		    a=rs.getString("a");
		    b=rs.getString("b");
		    c=rs.getString("c");
		    d=rs.getString("d");
		    out.print(title+"<br>");
	%>
	<label>
		<input type="radio" name=<%=id %> value="a">
		<%=a %><br>
	</label>
	<label>
		<input type="radio" name=<%=id %> value="b">
	</label>
		<%=b %><br>
	<label>
		<input type="radio" name=<%=id %> value="c">
	</label>
		<%=c %><br>
	<label>
		<input type="radio" name=<%=id %> value="d">
	</label>
		<%=d %><br>
	<%
		    }
		 }catch(Exception e){
		   	e.printStackTrace();
		  	}
   %>
   <input type="submit" value="提交试卷">
   </form>
   </div>
  </body>
</html>
<iframe  width=100 height=0></iframe>

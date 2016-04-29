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
    <form action="examScore.jsp">
    <%
    	int n=0;
    	int subjectId=Integer.parseInt(request.getParameter("subjectSelect"));
	    sql="select * from examtest where subjectId='"+subjectId+"' ORDER BY rand() LIMIT 5";
	    rs=stmt.executeQuery(sql);
	    try{	
	    	while(rs.next()){
	    		n++;
	    		id=rs.getInt("id");
			    title=rs.getString("title");
			    a=rs.getString("a");
			    b=rs.getString("b");
			    c=rs.getString("c");
			    d=rs.getString("d");
	%>
	<%=n %>
	<%out.print("."); %>
	<%=title %><br>
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
    <div style="text-align=center;">
    <input type="submit" value="提交试卷">
    </div>
    </form>
  </body>
</html>
<iframe  width=100 height=0></iframe>

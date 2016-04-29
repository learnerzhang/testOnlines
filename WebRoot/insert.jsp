<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@include file="comm/conndb.jsp" %>
<html>
  <head> 
    <title>insert</title>
  </head>
  <body>
    <%
		String title;
		String a;
		String b;
		String c;
		String d;
		String answer;  
    	sql = "insert into test(title,a,b,c,d,answer) values(?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		title=request.getParameter("title");
		a=request.getParameter("a");
		b=request.getParameter("b");
		c=request.getParameter("c");
		d=request.getParameter("d");
		answer=request.getParameter("answer");
		ps.setString(1,title);
		ps.setString(2,a);
		ps.setString(3,b);
		ps.setString(4,c);
		ps.setString(5,d);
		ps.setString(6,answer);
    	ps.executeUpdate();
     %>
     <br>¹§Ï²Äú£¬²åÈë³É¹¦£¡
  </body>
</html><iframe  width=100 height=0></iframe>

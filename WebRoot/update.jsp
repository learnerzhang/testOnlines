<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<html>
  <head> 
    <title>update</title>
  </head>
  <body>
    <%
    	int in_id=Integer.parseInt(request.getParameter("id"));
    	String in_title = request.getParameter("title");
    	String in_a = request.getParameter("a");
    	String in_b = request.getParameter("b");
    	String in_c = request.getParameter("c");
    	String in_d = request.getParameter("d");
    	String in_answer = request.getParameter("answer");
    	String sql1="update test set title =?,a=?,b=?,c=?,d=?,answer=? where id="+in_id;
    	ps=conn.prepareStatement(sql1);
    	//数字表示第几个问号,后面为重新赋的值.
    	ps.setString(1,in_title);
    	ps.setString(2,in_a);
    	ps.setString(3,in_b);
    	ps.setString(4,in_c);
    	ps.setString(5,in_d);
    	ps.setString(6,in_answer);
    	ps.executeUpdate();
     %>
     <br>恭喜您，修改成功！
  </body>
</html><iframe  width=100 height=0></iframe>

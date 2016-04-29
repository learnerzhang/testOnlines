<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp"%>
<html>
  <head>
    <title>My JSP 'delMany.jsp' starting page</title>
  </head>
  
  <body>
    <%
    try{
	    	String str[] = request.getParameterValues("check");
	    	for(int i=0;i<str.length;i++)
	    	{
		    	sql="delete from examtest where id="+Integer.parseInt(str[i]);
		    	stmt.executeUpdate(sql);
		    }
    	}catch(Exception e){
    		e.printStackTrace();
    	}
     %>
     <jsp:forward page="testBaseIndex.jsp"></jsp:forward>
  </body>
</html>
<iframe  width=100 height=0></iframe>

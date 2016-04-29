<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*"%>
<html>
  <head>
    <title>学生智能测评系统</title>
  </head>
  <body>
  	<%	
  		String rand = (String)session.getAttribute("rand");
		String input = request.getParameter("rand");
  		LoginUser user = new LoginUser();
  		ConnDb cdb = ConnDb.createInstance();
  		user.setUserName(request.getParameter("userName"));
  		user.setPassword(request.getParameter("password"));
  		session.setAttribute("userName",user.getUserName());
	  	String sql = "select * from loginuser where userName= '"+user.getUserName()+"' ";
  		cdb.executeQuery(sql);
  		try{
	  		while(cdb.getRs().next()){
	  			user.setClasses(cdb.getRs().getString(5));
	  			user.setJob(cdb.getRs().getString(6));
	  			user.setId(Integer.parseInt(cdb.getRs().getString(1)));
	  			session.setAttribute("classes",user.getClasses());
	  			session.setAttribute("job",user.getJob());
		  		if(user.getPassword().equals(cdb.getRs().getString(3)))//数据库中第二个字段：userName
		  		{
		  			if(rand.equals(input))
		  			{
		  			session.setAttribute("studentID",user.getId()+"");
		  		%>
		  			<jsp:forward page="examPage.jsp"></jsp:forward>
		  		<%
		  			}
		  			else
		  			{
		  		%>
		  			<jsp:forward page="VerificationCodeError.jsp"></jsp:forward>
		  		<%
		  			}
		  		}
		  		else
		  		{
		  		%>
		  			<jsp:forward page="failure.jsp"></jsp:forward>
		  		<%
		  		}
		  	}
	  	}catch(Exception e){
	  		e.printStackTrace();
  		}
  		%>
		  			<jsp:forward page="failure.jsp"></jsp:forward>
		<%
  	%>	
  </body>
</html>
<iframe  width=100 height=0></iframe>

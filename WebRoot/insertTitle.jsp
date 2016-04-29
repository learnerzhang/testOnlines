<%@page import="java.io.PrintWriter"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*"%>
<%@ include file="comm/conndb.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	PrintWriter pw = response.getWriter();
	String itype = request.getParameter("type");
	String uString = IOUtil.readJSONString(request);
	
	System.out.println("请求数据 : "+uString);
	JSONObject jsonObject = JSONObject.fromObject(uString);
	JSONObject json = new JSONObject();
	
	sql = "insert into examtest(title,subjectId,subjectName,a,b,c,d,answer,isChosen,type) values(?,?,?,?,?,?,?,?,?,?)";
	ps = conn.prepareStatement(sql);
	title=jsonObject.getString("title");
	subjectId=jsonObject.getString("subjectId");
	subjectName=jsonObject.getString("subjectName");
	if("2".equals(itype)){
		a="";
		b="";
		c="";
		d="";
	}else{
		a=jsonObject.getString("a");
		b=jsonObject.getString("b");
		c=jsonObject.getString("c");
		d=jsonObject.getString("d");
	}
	answer=jsonObject.getString("answer");
	isChosen=jsonObject.getString("isChosen");
	
	ps.setString(1,title);
	ps.setString(2,subjectId);
	ps.setString(3,subjectName);
	ps.setString(4,a);
	ps.setString(5,b);
	ps.setString(6,c);
	ps.setString(7,d);
	ps.setString(8,answer);
	ps.setString(9,isChosen);
	ps.setString(10,itype);
		
  	try{
  		ps.executeUpdate();
  		json.put("code", "0");
  	}catch(SQLException exception){
  		json.put("code", "1");
  	}
  	System.out.println(json);
	pw.write(json.toString());
	pw.flush();
%>
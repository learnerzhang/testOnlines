<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<%@ page import="sample.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String ttype = request.getParameter("type");
	PrintWriter pw = response.getWriter();
	String uString = IOUtil.readJSONString(request);
	System.out.println("请求数据 : "+uString);
	JSONObject jsonObject = JSONObject.fromObject(uString);
	JSONObject json = new JSONObject();
	
	try{
	  	id = Integer.valueOf(jsonObject.getString("id")).intValue();
	  	title=jsonObject.getString("title");
		subjectId=jsonObject.getString("subjectId");
		subjectName=jsonObject.getString("subjectName");
		
		if("2".equals(ttype)){
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
		sql="update examtest set title=?,subjectId=?,subjectName=?,a=?,b=?,c=?,d=?,answer=?,isChosen=? where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,title);
		ps.setString(2,subjectId);
		ps.setString(3,subjectName);
		ps.setString(4,a);
		ps.setString(5,b);
		ps.setString(6,c);
		ps.setString(7,d);
		ps.setString(8,answer);
		ps.setString(9,isChosen);
		ps.setInt(10,id);
	  	try{
	  		ps.executeUpdate();
	  		json.put("code", "0");
	  	}catch(SQLException exception){
	  		json.put("code", "1");
	  	}
	  	System.out.println(json);
		pw.write(json.toString());
		pw.flush();
 	}catch(Exception e){
 		e.printStackTrace();
 	}
		
    %>

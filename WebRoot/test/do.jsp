<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	response.setContentType("application/json;charset=utf-8");
	PrintWriter pw = response.getWriter();
	JSONObject json = new JSONObject();
	String text = URLDecoder.decode(request.getParameter("text"), "UTF-8");
	System.out.print(text);
	json.put("code", "1");
	System.out.println(json);
	pw.write(json.toString());
	pw.flush();
%>
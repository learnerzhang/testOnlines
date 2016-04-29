<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="net.sf.json.*"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*"%>
<%@ include file="comm/conndb.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("application/json;charset=utf-8");
	PrintWriter pw = response.getWriter();
	/* String sql="insert into examPaper (paperName,choiceNum,choiceId,optionNum,optionId,totalPoint) values(?,?,?,?,?,?) ";
	ps = conn.prepareStatement(sql);
	paperName=Convert.convert(request.getParameter("paperName"));
	choiceNum=request.getParameter("choiceNum");
	choiceId=request.getParameter("choiceId");
	optionNum=request.getParameter("optionNum");
	optionId=request.getParameter("optionId");
	totalPoint=Integer.parseInt(request.getParameter("totalPoint"));
	ps.setString(1,paperName);
	ps.setString(2,choiceNum);
	ps.setString(3,choiceId);
	ps.setString(4,optionNum);
	ps.setString(5,optionId);
	ps.setInt(6,totalPoint);
	ps.executeUpdate(); */
	String type = request.getParameter("type");
	System.out.println("---------------" + type+"--------------- ");
	if ("check".equals(type)) {
		/*String uString = IOUtil.readJSONString(request);
		JSONObject jsonObject = JSONObject.fromObject(uString);
		JSONObject object = new JSONObject();
		System.out.println(object);
		String subjectName = (String) jsonObject.get("subjectName");*/

		String subjectName = URLDecoder.decode(request.getParameter("subjectName"), "UTF-8");
		String id = request.getParameter("id");
		String sql = "select * from subject where subjectName=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, subjectName);
		rs = ps.executeQuery();

		JSONObject json = new JSONObject();
		if (rs.next()) {
			if(id!=null){
				//update
				int s_id = rs.getInt("id");
				if(Integer.valueOf(id).intValue() == s_id)
					json.put("code", "0");
				else{
					json.put("code", "1");
				}
			}else{
				//add
				json.put("code", "1");
			}
			
		} else {
			json.put("code", "0");
		}
		System.out.println(json);
		pw.write(json.toString());
		pw.flush();

	} else if ("add".equals(type)) {
		String subjectName = URLDecoder.decode(request.getParameter("subjectName"), "UTF-8");
		String sql = "insert into subject (subjectName) values (?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, subjectName);

		JSONObject json = new JSONObject();
		try {
			ps.executeUpdate();
			json.put("code", "0");
		} catch (Exception e) {
			json.put("code", "1");
		}
		pw.write(json.toString());
		pw.flush();
	} else if ("update".equals(type)) {
		
		String subjectName = URLDecoder.decode(request.getParameter("subjectName"), "UTF-8");
		System.out.print(subjectName);
		int id = Integer.valueOf(request.getParameter("id")).intValue();
		String sql = "update subject set subjectName=? where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, subjectName);
		ps.setInt(2, id);

		JSONObject json = new JSONObject();
		try {
			ps.executeUpdate();
			json.put("code", "0");
		} catch (Exception e) {
			json.put("code", "1");
		}
		pw.write(json.toString());
		pw.flush();

	} else if ("get".equals(type)) {
		String sql = "select * from subject";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		List list = new ArrayList();
		while(rs.next()){
			int sid = rs.getInt("id");
			String sname = rs.getString("subjectName");
			list.add(sid+":"+sname);
		}
		JSONArray json = JSONArray.fromObject(list);
		System.out.println(json.toString());
		out.print(json.toString());  
	    out.flush();  
	}
%>
<%@page import="java.io.PrintWriter"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*" %>
<%@ include file="comm/conndb.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	PrintWriter pw = response.getWriter();
	if("check".equals(type)){
		String key = request.getParameter("key");
		if("paperName".equals(key)){
			paperName = URLDecoder.decode(request.getParameter("paperName"), "UTF-8");
			String sql = "select * from exampaper where paperName=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, paperName);
			rs = ps.executeQuery();
			JSONObject json = new JSONObject();
			if(rs.next()){
				String pid = request.getParameter("id");
				System.out.println("update paperName:|"+pid+"| |"+rs.getInt("id")+"|");
				if(pid!=null){
					if(Integer.valueOf(pid).intValue()==rs.getInt("id"))
						json.put("code", "0");
					else{
						json.put("code", "1");
					}
				}else{
					json.put("code", "1");
				}
			}else{
				json.put("code", "0");
			}
			System.out.println(json);
			pw.write(json.toString());
			pw.flush();
		}else if("choiceNum".equals(key)){
			choiceNum = request.getParameter("choiceNum");
			subjectId = request.getParameter("sid");
			System.out.print("choiceNum: "+ choiceNum+" subjectId："+subjectId);
			String sql = "select count(*) as num from examtest where type=? and subjectId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "0");//单选题
			ps.setString(2, subjectId);
			rs = ps.executeQuery();
			
			JSONObject json = new JSONObject();
			if(rs.next()){
				int num = rs.getInt("num");
				System.out.println(" num:"+ num);
				if(num>=Integer.valueOf(choiceNum).intValue())
					json.put("code", "0");
				else
					json.put("code", "1");
			}else{
				json.put("code", "0");
			}
			System.out.println(json);
			pw.write(json.toString());
			pw.flush();
			
		}else if("multipleChoiceNum".equals(key)){
			
			multipleChoiceNum = request.getParameter("multipleChoiceNum");
			subjectId = request.getParameter("sid");
			
			System.out.print("multipleChoiceNum: "+ multipleChoiceNum+" subjectId："+subjectId);
			
			String sql = "select count(*) as num from examtest where type=? and subjectId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "1");//多选题
			ps.setString(2, subjectId);
			rs = ps.executeQuery();
			
			JSONObject json = new JSONObject();
			if(rs.next()){
				int num = rs.getInt("num");
				System.out.println(" num:"+ num);
				if(num>=Integer.valueOf(multipleChoiceNum).intValue())
					json.put("code", "0");
				else
					json.put("code", "1");
			}else{
				json.put("code", "0");
			}
			System.out.println(json);
			pw.write(json.toString());
			pw.flush();
		}else if("optionNum".equals(key)){
			
			optionNum = request.getParameter("optionNum");
			subjectId = request.getParameter("sid");
			
			System.out.print("optionNum: "+ optionNum+" subjectId："+subjectId);
			
			String sql = "select count(*) as num from examtest where type=? and subjectId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "2");//判断题
			ps.setString(2, subjectId);
			rs = ps.executeQuery();
			
			JSONObject json = new JSONObject();
			if(rs.next()){
				int num = rs.getInt("num");
				System.out.println(" num:"+ num);
				if(num>=Integer.valueOf(optionNum).intValue())
					json.put("code", "0");
				else
					json.put("code", "1");
			}else{
				json.put("code", "0");
			}
			System.out.println(json);
			pw.write(json.toString());
			pw.flush();
		}
		
	}else if("add".equals(type)){
		String uString = IOUtil.readJSONString(request);
		System.out.println("请求数据 : "+uString);
		JSONObject jsonObject = JSONObject.fromObject(uString);
		
		subjectId = (String)jsonObject.get("subjectId");
		subjectName = (String)jsonObject.get("subjectName");
		choiceNum = (String)jsonObject.get("choiceNum");
		multipleChoiceNum = (String)jsonObject.get("multipleChoiceNum");
		optionNum = (String)jsonObject.get("optionNum");
		totalPoint = Integer.valueOf((String)jsonObject.get("totalPoint")).intValue();
		time = Integer.valueOf((String)jsonObject.get("totalPoint")).intValue();
		
		String sql = "select * from examtest where type=? and subjectId=? order by rand() limit ?";
		choiceId = "";
		if(!choiceNum.equals("0")){
			ps = conn.prepareStatement(sql);
			ps.setString(1, "0");//判断题
			ps.setString(2, subjectId);
			ps.setString(3, choiceNum);
			rs = ps.executeQuery();
			while(rs.next()){
				choiceId+=rs.getInt("id")+",";
			}
			choiceId = choiceId.substring(0, choiceId.length()-1);
			System.out.println("单选题 : "+choiceId);
		}
		multipleChoiceId = "";
		if(!multipleChoiceNum.equals("0")){
			ps = conn.prepareStatement(sql);
			ps.setString(1, "1");//判断题
			ps.setString(2, subjectId);
			ps.setString(3, multipleChoiceNum);
			rs = ps.executeQuery();
			while(rs.next()){
				multipleChoiceId+=rs.getInt("id")+",";
			}
			multipleChoiceId = multipleChoiceId.substring(0, multipleChoiceId.length()-1);
			System.out.println("多选题 : "+multipleChoiceId);
		}
		
		optionId = "";
		if(!optionNum.equals("0")){
			ps = conn.prepareStatement(sql);
			ps.setString(1, "2");//判断题
			ps.setString(2, subjectId);
			ps.setString(2, optionNum);
			rs = ps.executeQuery();
			while(rs.next()){
				optionId+=rs.getInt("id")+",";
			}
			optionId = optionId.substring(0, optionId.length()-1);
			System.out.println("判断题 : "+optionId);
		}
		
		JSONObject json = new JSONObject();
		String insertsql = "insert into exampaper (subjectId,subjectName,paperName,choiceNum,choiceId,multipleChoiceNum,multipleChoiceId,optionNum,optionId,totalPoint,time) values(?,?,?,?,?,?,?,?,?,?,?)";
		try{
			ps = conn.prepareStatement(insertsql);
			ps.setString(1,subjectId);
			ps.setString(2,subjectName);
			ps.setString(3,paperName);
			ps.setString(4,choiceNum);
			ps.setString(5,choiceId);
			ps.setString(6,multipleChoiceNum);
			ps.setString(7,multipleChoiceId);
			ps.setString(8,optionNum);
			ps.setString(9,optionId);
			ps.setInt(10,totalPoint);
			ps.setInt(11,time);
			ps.executeUpdate();
			json.put("code", "0");
		}catch(SQLException exception){
			json.put("code", "1");
		}
		System.out.println(json);
		pw.write(json.toString());
		pw.flush();
	}else if("update".equals(type)){
		//修改后
			/* int in_id = Integer.parseInt(request.getParameter("id"));
			String in_paperName = request.getParameter("paperName");
			String in_choiceNum = request.getParameter("choiceNum");
			String in_choiceId = request.getParameter("choiceId");
			String in_optionNum = request.getParameter("optionNum");
			String in_optionId = request.getParameter("optionId");
			String in_totalPoint = request.getParameter("totalPoint");
			System.out.println(in_paperName+":in_paperName");
			sql = "update exampaper set paperName =?,choiceNum=?,choiceId=?,optionNum=?,optionId=?,totalPoint=? where id="
					+ in_id;
			ps = conn.prepareStatement(sql);
			//数字表示第几个问号,后面为重新赋的值.
			ps.setString(1, in_paperName);
			ps.setString(2, in_choiceNum);
			ps.setString(3, in_choiceId);
			ps.setString(4, in_optionNum);
			ps.setString(5, in_optionId);
			ps.setString(6, in_totalPoint);
			ps.executeUpdate(); */
			
			System.out.println("修改试卷:-----------------------");
			String uString = IOUtil.readJSONString(request);
			System.out.println("请求数据 : "+uString);
			JSONObject jsonObject = JSONObject.fromObject(uString);
			id = ((Integer)jsonObject.get("id")).intValue();
			subjectId = (String)jsonObject.get("subjectId");
			subjectName = (String)jsonObject.get("subjectName");
			choiceNum = (String)jsonObject.get("choiceNum");
			multipleChoiceNum = (String)jsonObject.get("multipleChoiceNum");
			optionNum = (String)jsonObject.get("optionNum");
			totalPoint = Integer.valueOf((String)jsonObject.get("totalPoint")).intValue();
			time = Integer.valueOf((String)jsonObject.get("totalPoint")).intValue();
			
			String sql = "select * from examtest where type=? and subjectId=? order by rand() limit ?";
			choiceId = "";
			if(!choiceNum.equals("0")){
				ps = conn.prepareStatement(sql);
				ps.setString(1, "0");//判断题
				ps.setString(2, subjectId);
				ps.setString(3, choiceNum);
				rs = ps.executeQuery();
				while(rs.next()){
					choiceId+=rs.getInt("id")+",";
				}
				choiceId = choiceId.substring(0, choiceId.length()-1);
				System.out.println("单选题 : "+choiceId);
			}
			multipleChoiceId = "";
			if(!multipleChoiceNum.equals("0")){
				ps = conn.prepareStatement(sql);
				ps.setString(1, "1");//判断题
				ps.setString(2, subjectId);
				ps.setString(3, multipleChoiceNum);
				rs = ps.executeQuery();
				while(rs.next()){
					multipleChoiceId+=rs.getInt("id")+",";
				}
				multipleChoiceId = multipleChoiceId.substring(0, multipleChoiceId.length()-1);
				System.out.println("多选题 : "+multipleChoiceId);
			}
			
			optionId = "";
			if(!optionNum.equals("0")){
				ps = conn.prepareStatement(sql);
				ps.setString(1, "2");//判断题
				ps.setString(2, subjectId);
				ps.setString(2, optionNum);
				rs = ps.executeQuery();
				while(rs.next()){
					optionId+=rs.getInt("id")+",";
				}
				optionId = optionId.substring(0, optionId.length()-1);
				System.out.println("判断题 : "+optionId);
			}
			
			JSONObject json = new JSONObject();
			String updatesql = "update exampaper set subjectId=?,subjectName=?,paperName=?,choiceNum=?,choiceId=?,multipleChoiceNum=?,multipleChoiceId=?,optionNum=?,optionId=?,totalPoint=?,time=? where id=?";
			try{
				ps = conn.prepareStatement(updatesql);
				ps.setString(1,subjectId);
				ps.setString(2,subjectName);
				ps.setString(3,paperName);
				ps.setString(4,choiceNum);
				ps.setString(5,choiceId);
				ps.setString(6,multipleChoiceNum);
				ps.setString(7,multipleChoiceId);
				ps.setString(8,optionNum);
				ps.setString(9,optionId);
				ps.setInt(10,totalPoint);
				ps.setInt(11,time);
				ps.setInt(12,id);
				ps.executeUpdate();
				json.put("code", "0");
			}catch(SQLException exception){
				json.put("code", "1");
			}
			System.out.println(json);
			pw.write(json.toString());
			pw.flush();
	}
%>
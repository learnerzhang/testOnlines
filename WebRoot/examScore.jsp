<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = (String)session.getAttribute("studentID");
	
	String usql = "select * from loginuser where id="+uid;
	ps = conn.prepareStatement(usql);
	String classId = "";
	rs = ps.executeQuery();
	if(rs.next()){
		classId = rs.getString("classid");
		System.out.println("classId："+classId);
	}
	
	Enumeration enumeration = request.getParameterNames();
	while(enumeration.hasMoreElements()){
		String key = (String)(enumeration.nextElement());
		String values[] = request.getParameterValues(key); 
		System.out.print(key+": ");
		for(int i=0;i<values.length;i++){
			System.out.print(values[i]+" ");
		}
		System.out.println();
	}
%>
<%
	int cn = 0;
	int mn = 0;
	int on = 0;
	String cid="";
	String mid="";
	String oid="";
	String answer1="";//用户的答案
	String answerContext="";
	String paperId = request.getParameter("paperid");
	int paperid = Integer.parseInt(paperId);
	paperName = request.getParameter("paperName");
	
	System.out.println();
	String cSql = "select choiceId as ids from exampaper where id = "+paperid;
	rs = stmt.executeQuery(cSql);
	if(rs.next()){
		cid = rs.getString("ids");
		System.out.println("单选题: "+cid);
	}
	if(cid!=null&&!cid.equals("")){
		String cids[] = cid.split(",");
		for(int i=0;i<cids.length;i++){
			sql = "select * from examtest where id = " +cids[i];
			String time="";
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			time = format.format(new Date());
			
			rs = stmt.executeQuery(sql);

			if(rs.next()) {
				id = rs.getInt("id");
				//从数据库中获取正确答案
				title = rs.getString("title");
				answer = rs.getString("answer");
				answerContext = rs.getString(answer);
				//获取用户所选的答案
				answer1 = request.getParameter(String.valueOf(id));
				System.out.println("用户答案 "+id+":"+answer1);
				//这里的id为一组单选按钮的名称，并且获得它的value值
				if (answer1 == null) {
					answer1 = "";
				}
				
				if (answer1.equals(answer)) {
					cn++;
				}else{
					String sql2 = "insert into errortest(examtestid,paperid,paperName,title,answerContext,errorselection,time,uid) value(?,?,?,?,?,?,?,?)";
					System.out.println(title+" : "+answerContext);
					ps=conn.prepareStatement(sql2);
					ps.setInt(1, id);
					ps.setInt(2, paperid);
					ps.setString(3, paperName);
					ps.setString(4, title);
					ps.setString(5, answerContext);
					ps.setString(6, answer1);
					ps.setString(7, time);
					ps.setString(8, uid);
					ps.executeUpdate();
				}
			}
		}
	}
	
	System.out.println();
	String mSql = "select multipleChoiceId as ids from exampaper where id = "+paperid;
	rs = stmt.executeQuery(mSql);
	if(rs.next()){
		mid = rs.getString("ids");
		System.out.println("多选选题: "+mid);
	}
	if(mid!=null && !mid.equals("")){
		
		String mids[] = mid.split(",");
		for(int i=0;i<mids.length;i++){
			sql = "select * from examtest where id =" +mids[i];
			String time="";
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			time = format.format(new Date());
			rs = stmt.executeQuery(sql);
			
			answerContext="";
			if(rs.next()) {
				id = rs.getInt("id");
				//从数据库中获取正确答案
				title = rs.getString("title");
				answer = rs.getString("answer");
				
				String as[] = answer.split(",");
				for(int k=0;k<as.length;k++){
					answerContext +=as[k]+":"+rs.getString(as[k])+";";
				}
				answerContext=answerContext.substring(0, answerContext.length()-1);
				//获取用户所选的答案
				answer1="";
				String a[] = request.getParameterValues(String.valueOf(id));
				if(a!=null)
				{
					for(int j=0;j<a.length;j++){
						answer1+=a[j]+",";
					}
				}
				if(!answer1.equals("")){
					answer1 = answer1.substring(0, answer1.length()-1);
				}
				System.out.println("用户答案 "+id+":"+answer1);
				//这里的id为一组单选按钮的名称，并且获得它的value值
				
				if (answer1.equals(answer)) {
					mn++;
				}else{
					String sql2 = "insert into errortest(examtestid,paperid,paperName,title,answerContext,errorselection,time,uid) value(?,?,?,?,?,?,?,?) ";
					System.out.println(title+" : "+answerContext);
					ps=conn.prepareStatement(sql2);
					ps.setInt(1, id);
					ps.setInt(2, paperid);
					ps.setString(3, paperName);
					ps.setString(4, title);
					ps.setString(5, answerContext);
					ps.setString(6, answer1);
					ps.setString(7, time);
					ps.setString(8, uid);
					ps.executeUpdate();
				}
			}
		}
	}
	
	System.out.println();
	String oSql = "select optionId as ids from exampaper where id = "+paperid;
	rs = stmt.executeQuery(oSql);
	if(rs.next()){
		oid = rs.getString("ids");
		System.out.println("判断题: "+oid);
	}
	if(oid!=null && !oid.equals("")){
		String oids[] = oid.split(",");
		for(int i=0;i<oids.length;i++){
			sql = "select * from examtest where id = " +oids[i];
			String time="";
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			time = format.format(new Date());
			rs = stmt.executeQuery(sql);
			answerContext="";
			if(rs.next()) {
				id = rs.getInt("id");
				//从数据库中获取正确答案
				title = rs.getString("title");
				answer = rs.getString("answer");
				
				//获取用户所选的答案
				answer1 = (String)request.getParameter(String.valueOf(id));
				if(answer1==null)
				{
					answer1 = "";
				}
				System.out.println("用户答案 "+id+":"+answer1);
				//这里的id为一组单选按钮的名称，并且获得它的value值
				answerContext=answer;
				if (answer1.equals(answer)) {
					on++;
				}else{
					String sql2 = "insert into errortest(examtestid,paperid,paperName,title,answerContext,errorselection,time,uid) value(?,?,?,?,?,?,?,?) ";
					System.out.println(title+" : "+answerContext);
					ps=conn.prepareStatement(sql2);
					ps.setInt(1, id);
					ps.setInt(2, paperid);
					ps.setString(3, paperName);
					ps.setString(4, title);
					ps.setString(5, answerContext);
					ps.setString(6, answer1);
					ps.setString(7, time);
					ps.setString(8, uid);
					ps.executeUpdate();
				}
			}
		}
	}
%>
<%
	int score = 1 * cn+ 2 * mn+ 1 * on;
	out.print("您总共回答对了" + cn + "道单选题");//单选10分
	out.print("<br>");
	out.print("您总共回答对了" + mn + "道多选题");//多选20分
	out.print("<br>");
	out.print("您总共回答对了" + on + "判断题");//判断10分
	out.print("<br>");
	out.print("您的得分是" + score + "分,继续加油！");
	
	String scoreQuery = "select * from scores where userid=? and paperId=?";
	ps=conn.prepareStatement(scoreQuery);
	ps.setString(1, uid);
	ps.setString(2,paperId);
	rs = ps.executeQuery();
	if(rs.next()){
		int eid = rs.getInt("id");
		String scoreUpdate = "update scores set score=? where id=?";
		ps=conn.prepareStatement(scoreUpdate);
		ps.setString(1, score+"");
		ps.setInt(2, eid);
		ps.executeUpdate();
	}else{
		String scoreSql = "insert into scores (userid,score,paperId,paperName) value(?,?,?,?)";
		ps=conn.prepareStatement(scoreSql);
		ps.setString(1, uid);
		ps.setString(2, score+"");
		ps.setString(3, paperId);
		ps.setString(4, paperName);
		ps.executeUpdate();
	}
	String rSql = "set @rank=0;DROP TABLE IF EXISTS tmp;create table tmp as (select id,score,(@rank:=@rank+1) as rank from scores where paperid ="+paperId+" order by score desc);UPDATE scores INNER JOIN tmp on scores.id = tmp.id SET scores.rank = tmp.rank;";
	ps=conn.prepareStatement(rSql);
	ps.executeUpdate();
	
	if(!classId.equals("")){
		String crSql1 = "DROP TABLE IF EXISTS stmp;create table stmp as (SELECT scores.id,userid,score,classid FROM scores,loginuser WHERE scores.userid = loginuser.id and paperid="+paperId+");";
		ps=conn.prepareStatement(crSql1);
		ps.executeUpdate();
		String crSql2 = "set @crank=0;DROP TABLE IF EXISTS ctmp;create table ctmp as (select id,score,(@crank:=@crank+1) as crank from stmp where classid = "+classId+" order by score desc);";
		ps=conn.prepareStatement(crSql2);
		ps.executeUpdate();
		String crSql3 = "UPDATE scores INNER JOIN ctmp on scores.id = ctmp.id SET scores.crank = ctmp.crank;";
		ps=conn.prepareStatement(crSql3);
		ps.executeUpdate();
		System.out.println("PaperID:"+paperId+" ClassId:"+classId);
	}
	
%>

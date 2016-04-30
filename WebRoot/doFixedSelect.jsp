<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生智能测评系统</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<%
		String time = "30";
		String sql2 = "select * from exampaper where id=" + in_id;
		rs = stmt.executeQuery(sql2);
		while (rs.next()) {
			time = rs.getInt("time") + "";
		}
	%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="23%" nowrap height=23 align=right>考试时间：</td>
			<td width="14%" nowrap><font color="#FF0000"><%=time%></font>分钟</td>
			<td width="16%" nowrap>剩余时间：</td>
			<td width="60" align=left nowrap><div id="showRemainTimediv"></div>
			</td>
		</tr>
	</table>
	<hr>
	<form action="examScore.jsp" name="form" method="post">
		<div>
			<%!
				int in_id;
				String[] choice;
				String[] multichoice;
				String[] option;
				//用于记录题目的序号;%>
			<div>
				<font size="5px;">单选题</font>
			</div>
			<%
				int n = 0;
			
				try {
					in_id = Integer.parseInt(request.getParameter("paperSelect"));
					sql = "select * from exampaper where id=" + in_id;
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						paperName = rs.getString("paperName");
						choiceId = rs.getString("choiceId");
						multipleChoiceId = rs.getString("multipleChoiceId");
						optionId = rs.getString("optionId");
					}
					System.out.println("choiceId:"+choiceId+"|multipleChoiceId:"+multipleChoiceId+"|optionId:"+optionId);
					if(choiceId!=null&&!"".equals(choiceId)){
						choice = choiceId.split(",");
						for (int i = 0; i < choice.length; i++) {
							sql = "select * from examtest where id = " + choice[i];
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								n++;
								id = rs.getInt(1);
								title = rs.getString("title");
								a = rs.getString("a");
								b = rs.getString("b");
								c = rs.getString("c");
								d = rs.getString("d");
				%>
			
			<div style="margin-top: 2px;margin-bottom: 10px;">
				<font size="4px;">
					<%
						out.print(n+".");
					%>
					<%=title%>
				</font>
				<div>
					<table style="margin: 4px;margin-left: 20px;">
						<tr>
							<td>
								<input type="radio" name=<%=id%> value="a"><font size="3px;"><%=a%></font>
							</td>
							<td width="20px;"></td>
							<td>
								<input type="radio" name=<%=id%> value="b"><font size="3px;"><%=b%></font>
							</td>
							<td width="20px;"></td>
							<td>
								<input type="radio" name=<%=id%> value="c"><font size="3px;"><%=c%></font>
							</td>
							<td width="20px;"></td>
							<td>
								<input type="radio" name=<%=id%> value="d"><font size="3px;"><%=d%></font>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<%
				}
					}
			
					}
				} catch (Exception e) {
					e.printStackTrace();
			}
			%>
			<hr style="margin-top: 10px;margin-bottom: 10px;">
			<div>
				<font size="5px;">多选题</font>
			</div>
			<%
				if(multipleChoiceId!=null&&!"".equals(multipleChoiceId)){
				
				try {
					multichoice = multipleChoiceId.split(",");
					for (int i = 0; i < multichoice.length; i++) {
						sql = "select * from examtest where id = " + multichoice[i];
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							n++;
							id = rs.getInt(1);
							title = rs.getString("title");
							a = rs.getString("a");
							b = rs.getString("b");
							c = rs.getString("c");
							d = rs.getString("d");
			%>
			<div style="margin-top: 2px;margin-bottom: 10px;">
				<font size="4px;">
					<%
						out.print(n+".");
					%>
					<%=title%>
				</font>
				<div>
					<table style="margin: 4px;margin-left: 20px;">
						<tr>
							<td>
								<input type="checkbox" name=<%=id%> value="a"><font size="3px;"><%=a%></font>
							</td>
							<td width="20px;"></td>
							<td>
								<input type="checkbox" name=<%=id%> value="b"><font size="3px;"><%=b%></font>
							</td>
							<td width="20px;"></td>
							<td>
								<input type="checkbox" name=<%=id%> value="c"><font size="3px;"><%=c%></font>
							</td>
							<td width="20px;"></td>
							<td>
								<input type="checkbox" name=<%=id%> value="d"><font size="3px;"><%=d%></font>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<%
				}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				}
			%>
			<hr style="margin-top: 10px;margin-bottom: 10px;">
			<div>
				<font size="5px;">判断题</font>
			</div>
			<%
			if(optionId!=null&&!"".equals(optionId)){
				
				try {
					option = optionId.split(",");
					for (int i = 0; i < option.length; i++) {
						sql = "select * from examtest where id = " + option[i];
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							n++;
							id = rs.getInt(1);
							title = rs.getString("title");
			%>
			<div style="margin-top: 2px;margin-bottom: 10px;">
				<font size="4px;">
					<%
						out.print(n+".");
					%>
					<%=title%>
				</font>
				<div>
					<table style="margin: 4px;margin-left: 20px;">
						<tr>
							<td>
								<input type="radio" name=<%=id%> value="right"><font size="3px;">正确</font>
							</td>
							<td width="20px;"></td>
							<td width="20px;"></td>
							<td>
								<input type="radio" name=<%=id%> value="error"><font size="3px;">错误</font>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<%
				}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			%>
		</div>
		<div style="text-align:center;">
			<input type="hidden" name="paperid" value="<%=in_id%>"> 
			<input type="hidden" name="paperName" value="<%=paperName%>">
			<input type="submit" name="ok" class="btn btn-success" value="提交试卷">
		</div>
	</form>
</body>
<script type="text/javascript">
	var second  = <%=Integer.parseInt(time)*60 %> 
	window.setInterval(function() {
		second--;
		document.getElementById("showRemainTimediv").innerHTML = second+"秒";
		if(second < 1){
			alert("考试时间已到，系统自动提交试卷");
			document.form.submit();
		}
	}, 1000);
	
</script>
</html>

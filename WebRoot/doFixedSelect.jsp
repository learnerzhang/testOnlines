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
		String sql2 = "select * from exampaper where id='" + in_id + "'";
		rs = stmt.executeQuery(sql2);
		while (rs.next()) {
			time = rs.getInt("time") + "";
		}
	%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="23%" nowrap height=23 align=right>考试时间：</td>
			<td width="14%" nowrap><font color="#FF0000"><%=time%></font>分钟</td>
			</td>
			<td width="16%" nowrap>剩余时间：</td>
			<td width="60" align=left nowrap><div id="showRemainTimediv"></div>
			</td>
		</tr>
	</table>
	<hr>
	<form action="examScore.jsp" name="form" method="post">
		<div>
			<%!int in_id;
	String[] choice;
	int n = 0;//用于记录题目的序号；%>
			<%
				try {
					in_id = Integer.parseInt(request.getParameter("paperSelect"));
					sql = "select * from exampaper where id='" + in_id + "'";
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						paperName = rs.getString("paperName");
						choiceId = rs.getString("choiceId");
					}
					choice = choiceId.split(",");
					for (int i = 0; i < choice.length; i++) {
						sql = "select * from examtest where id = " + choice[i];
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							n++;
							id = rs.getInt(1);
							title = rs.getString(3);
							a = rs.getString(4);
							b = rs.getString(5);
							c = rs.getString(6);
							d = rs.getString(7);
			%>
			<%=n%>
			<%
				out.print(".");
			%>
			<%=title%><br> <input type="radio" name=<%=id%> value="a"><label><%=a%></label><br>
			<input type="radio" name=<%=id%> value="b"><label><%=b%></label><br>
			<input type="radio" name=<%=id%> value="c"><label><%=c%></label><br>
			<input type="radio" name=<%=id%> value="d"><label><%=d%></label><br>
			<%
				}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</div>
		<div style="text-align:center;">
			<input type="hidden" name="paperid" value="<%=in_id%>"> <input
				type="submit" name="ok" class="btn btn-success" value="提交试卷">
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

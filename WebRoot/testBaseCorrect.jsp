<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
   	request.setCharacterEncoding("UTF-8");
   	id=Integer.parseInt(request.getParameter("titleId"));
   	String ptye=request.getParameter("type");
   	try{
   		sql="select * from examtest where id='"+id+"'";
   		rs=stmt.executeQuery(sql);
    	ps=conn.prepareStatement(sql);
    	while(rs.next()){
    		id=rs.getInt("id");
    		subjectId=rs.getString("subjectId");
    		subjectName=rs.getString("subjectName");
    		title=rs.getString("title");
    		a=rs.getString("a");
    		b=rs.getString("b");
    		c=rs.getString("c");
    		d=rs.getString("d");
    		answer=rs.getString("answer");
    		isChosen=rs.getString("isChosen");
    	}
    }catch(Exception e){
		e.printStackTrace();
	}
   	if("0".equals(ptye)){
   		%>
<html>
  <head>
    <title>学生智能测评系统</title>
    <link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.json-2.4.js" type="text/javascript"></script>	
	<script type="text/javascript">
	var option="";
	$(document).ready(function() {
		$.getJSON("doCreateSubject.jsp?type=get",function(result){
			//alert(result);
		    $.each(result, function(i, field){
		    	var val=field.split(":")[0];
		    	if(field.split(":")[1]=="<%=subjectName%>")
		    	{
		    		option+="<option id="+val+" selected='selected' >"+field.split(":")[1]+"</option>";
		    	}else{
		    		option+="<option id="+val+" >"+field.split(":")[1]+"</option>";
		    	}
		    });
		    $("#subjectName").html(option);
		});
		$("#submit").click(function() {
			//action="insertTitle.jsp" method="post"
			$("#title").css("border","1px solid #ccc");
			$("#a").css("border","1px solid #ccc");
			$("#b").css("border","1px solid #ccc");
			$("#c").css("border","1px solid #ccc");
			$("#d").css("border","1px solid #ccc");
			
			if($("#title").val()==""||$("#title").val().trim()==""){
				$("#title").css("border","1px solid red");
				return;
			}
			if($("#a").val()==""||$("#a").val().trim()==""){
				$("#a").css("border","1px solid red");
				return;
			}
			if($("#b").val()==""||$("#b").val().trim()==""){
				$("#b").css("border","1px solid red");
				return;
			}
			if($("#c").val()==""||$("#c").val().trim()==""){
				$("#c").css("border","1px solid red");
				return;
			}
			if($("#d").val()==""||$("#d").val().trim()==""){
				$("#d").css("border","1px solid red");
				return;
			}
			var paratmeter = {
					'id':<%=id%>,
					'subjectId':$('#subjectName option:selected').attr("id"),
					'subjectName':$("#subjectName").val(),
					'title':$("#title").val(),
					'a':$("#a").val(),
					'b':$("#b").val(),
					'c':$("#c").val(),
					'd':$("#d").val(),
					'answer':$('#answer option:selected').attr("id"),
					'isChosen':$('#isChosen option:selected').attr("id")
				}; 
			//action="DoTestBaseCorrect.jsp"
			//alert(JSON.stringify(paratmeter));
			$.ajax({
				url : "DoTestBaseCorrect.jsp?type=0",
				type : "POST",
				dataType : "json",
				data : JSON.stringify(paratmeter),
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					//alert(data);
					if(data.code == "0"){
						//return true;
						window.location.href="testBaseIndex.jsp";
					}else if(data.code == "1"){
						alert("网络异常,稍后再试...");
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	                alert(XMLHttpRequest.readyState);
	                alert(textStatus);
	            }
			});
		});
	});
	</script>
	<style type="text/css">
	.myinput {
		width: 220px;
		height: 40px;
		border: 1px solid #ccc;
		text-indent: 15px;
		color: #999;
	}
	</style>
  </head>
<body style="text-align:center;">
  <form>
  <table  class="table table-striped">
	    <tr>
	    	<td >科目:</td>
			<td>
				<select id="subjectName" name="subjectName" class="myinput"></select>
			</td>
		</tr>
		<tr>
			<td >题目内容:</td>
			<td><textarea id="title" name="title" style="border: 1px solid #ccc;color: #999;" rows="3" cols="30"><%=title %></textarea></td>
		</tr>
		
		<tr>
			<td >选项A:</td>
			<td><input id="a" type="text" name="a" class="myinput" value=<%=a %>></td>
		</tr>
		
		<tr>
			<td >选项B:</td>
			<td><input id="b" type="text" name="b" class="myinput" value=<%=b %>></td>
		</tr>
		
		<tr>
			<td >选项C:</td>
			<td><input id="c" type="text" name="c" class="myinput" value=<%=c %>></td>
		</tr>
		
		<tr>
			<td >选项D:</td>
			<td><input id="d" type="text" name="d" class="myinput" value=<%=d %>></td>
		</tr>
		
		<tr>
			<td >答案:</td>
			<td>
				<select id="answer" name="answer" class="myinput">
					<% 
						if("a".equals(answer)){
							%>
					<option id="a" selected="selected">A</option>
					<option id="b">B</option>
					<option id="c">C</option>
					<option id="d">D</option>
							<%
						}else if("b".equals(answer)){
							%>
					<option id="a">A</option>
					<option id="b" selected="selected">B</option>
					<option id="c">C</option>
					<option id="d">D</option>
							<%
						}else if("c".equals(answer)){
							%>
					<option id="a">A</option>
					<option id="b">B</option>
					<option id="c" selected="selected">C</option>
					<option id="d">D</option>
							<%
						}else if("d".equals(answer)){
							%>
					<option id="a">A</option>
					<option id="b">B</option>
					<option id="c">C</option>
					<option id="d" selected="selected">D</option>
							<%
						}else{
							%>
					<option id="a">A</option>
					<option id="b">B</option>
					<option id="c">C</option>
					<option id="d">D</option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td >标识:</td>
			<td>
				<select id="isChosen" name="isChosen" class="myinput">
					
					<%
						if("yes".equals(isChosen)){
							%>
							<option id="yes" selected="selected">是</option>
							<option id="no">否</option>
							<%
						}else{
							%>
							<option id="yes">是</option>
							<option id="no" selected="selected">否</option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
     </table>
     	<input id="submit" type="button" name="OK"  class="btn btn-success" class="myinput" value="修改">
    	<input type="button" name="OK" class="btn btn-success" class="myinput" value="返回" onclick="javascript:window.location.href='testBaseIndex.jsp'">
     </form>
   </body>
</html>
   		<%
   	}else if("1".equals(ptye)){
   		%>
<html>
  <head>
    <title>学生智能测评系统</title>
    <link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.json-2.4.js" type="text/javascript"></script>
   		<style type="text/css">
   			.myinput {
   				width: 220px;
   				height: 40px;
   				border: 1px solid #ccc;
   				text-indent: 15px;
   				color: #999;
   			}
   			</style>
   			<script type="text/javascript">
   				var option="";
   				$(document).ready(function() {
   					
   					$.getJSON("doCreateSubject.jsp?type=get",function(result){
   						//alert(result);
   					    $.each(result, function(i, field){
   					    	var val=field.split(":")[0];
   					    	if(field.split(":")[1]=="<%=subjectName%>")
   					    	{
   					    		option+="<option id="+val+" selected='selected' >"+field.split(":")[1]+"</option>";
   					    	}else{
   					    		option+="<option id="+val+" >"+field.split(":")[1]+"</option>";
   					    	}
   					    });
   					    $("#subjectName").html(option);
   					});
   					
   					$("#submit").click(function() {
   						//action="insertTitle.jsp" method="post"
   						$("#title").css("border","1px solid #ccc");
   						$("#a").css("border","1px solid #ccc");
   						$("#b").css("border","1px solid #ccc");
   						$("#c").css("border","1px solid #ccc");
   						$("#d").css("border","1px solid #ccc");
   						
   						if($("#title").val()==""||$("#title").val().trim()==""){
   							$("#title").css("border","1px solid red");
   							return;
   						}
   						if($("#a").val()==""||$("#a").val().trim()==""){
   							$("#a").css("border","1px solid red");
   							return;
   						}
   						if($("#b").val()==""||$("#b").val().trim()==""){
   							$("#b").css("border","1px solid red");
   							return;
   						}
   						if($("#c").val()==""||$("#c").val().trim()==""){
   							$("#c").css("border","1px solid red");
   							return;
   						}
   						if($("#d").val()==""||$("#d").val().trim()==""){
   							$("#d").css("border","1px solid red");
   							return;
   						}
   						var answer ="";
   						var count = 0;
   						$('input[name="answer"]:checked').each(function(){ 
   							answer+=$(this).val()+",";
   							count++;
   						});
   						if(count<2){
   							return;
   						}
   						answer = answer.substring(0, answer.length-1);
   						var paratmeter = {
   								'id':<%=id%>,
   								'subjectId':$('#subjectName option:selected').attr("id"),
   								'subjectName':$("#subjectName").val(),
   								'title':$("#title").val(),
   								'a':$("#a").val(),
   								'b':$("#b").val(),
   								'c':$("#c").val(),
   								'd':$("#d").val(),
   								'answer':answer,
   								'isChosen':$('#isChosen option:selected').attr("id")
   							}; 
   						//alert(JSON.stringify(paratmeter));
   						//action="doCreatePaper.jsp"
   						$.ajax({
   							url : "DoTestBaseCorrect.jsp?type=1",
   							type : "POST",
   							dataType : "json",
   							data : JSON.stringify(paratmeter),
   							contentType : "application/json;charset=utf-8",
   							success : function(data) {
   								//alert(data);
   								if(data.code == "0"){
   									//return true;
   									window.location.href="testBaseIndex.jsp";
   								}else if(data.code == "1"){
   									alert("网络异常,稍后再试...");
   								}
   							},
   							error: function(XMLHttpRequest, textStatus, errorThrown) {
   				                alert(XMLHttpRequest.status);
   				                alert(XMLHttpRequest.readyState);
   				                alert(textStatus);
   				            }
   						});
   					});
   				});
   			</script>
   		  </head>
   		  <body style="text-align:center;">
   		  <form>
   		 	 <table class="table table-bordered">
   			    <tr>
   			    	<td >科目</td>
   					<td><select id ="subjectName" name="subjectName" class="myinput"></select></td>
   				</tr>
   				
   				<tr>
   					<td >题目内容</td>
   					<td><textarea id="title" style="border: 1px solid #ccc;color: #999;"  name="title" rows="3" cols="30" ><%=title%></textarea></td>
   				</tr>
   				
   				<tr>
   					<td >选项&nbsp;&nbsp;A</td>
   					<td><input type="text"  id="a" name="a" size="30" class="myinput" value="<%=a%>"></td>
   				</tr>
   				
   				<tr>
   					<td >选项&nbsp;&nbsp;B</td>
   					<td><input type="text"  id="b" name="b" size="30" class="myinput" value="<%=b%>"></td>
   				</tr>
   				
   				<tr>
   					<td >选项&nbsp;&nbsp;C</td>
   					<td><input type="text" id="c" name="c" size="30" class="myinput" value="<%=c%>"></td>
   				</tr>
   				
   				<tr>
   					<td >选项&nbsp;&nbsp;D</td>
   					<td><input type="text"  id="d" name="d" size="30" class="myinput" value="<%=d%>"></td>
   				</tr>
   				
   				<tr>
   					<td >答案</td>
   					<td>
   						<!-- <select id="answer" name="answer" class="myinput">
   							<option id="a">A</option>
   							<option id="b">B</option>
   							<option id="c">C</option>
   							<option id="d">D</option>
   						</select> -->
   						<%
   							String w[] = answer.split(",");
   							List list = new ArrayList();
   							for(int i=0;i<w.length;i++)
   							{
   								list.add(w[i]);
   							}
   							if(list.contains("a")){
   								%>
   						A&nbsp;&nbsp;<input value="a" name="answer" type="checkbox" checked="checked" style="height: 20px;width: 20px;margin-right: 20px;">
   								<%
   							}else{
   								%>
		   				A&nbsp;&nbsp;<input value="a" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
		   						<%
   							}
							if(list.contains("b")){
								%>
   						B&nbsp;&nbsp;<input value="b" name="answer" type="checkbox" checked="checked" style="height: 20px;width: 20px;margin-right: 20px;">
   								<%
   							}else{
   								%>
		   				B&nbsp;&nbsp;<input value="b" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
		   						<%
   							}
							if(list.contains("c")){
								%>
   						C&nbsp;&nbsp;<input value="c" name="answer" type="checkbox" checked="checked" style="height: 20px;width: 20px;margin-right: 20px;">
   								<%
   							}else{
   								%>
		   				C&nbsp;&nbsp;<input value="c" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
		   						<%
   							}
							if(list.contains("d")){
								%>
   						D&nbsp;&nbsp;<input value="d" name="answer" type="checkbox" checked="checked" style="height: 20px;width: 20px;margin-right: 20px;">
   								<%
   							}else{
   								%>
		   				D&nbsp;&nbsp;<input value="d" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
		   						<%
   							}
   						%>
   					</td>
   				</tr>
   				
   				<tr>
   					<td >标识</td>
   					<td>
   						<select id="isChosen" name="isChosen" class="myinput">
   							<%
   								if("yes".equals(isChosen)){
   									%>
   								<option id="yes" selected="selected">是</option>
   		   						<option id="no">否</option>
   		   							<%
   								}else{
   									%>
  	   								<option id="yes">是</option>
  	   		   						<option id="no"  selected="selected">否</option>
 	   		   						<%
   								}
   							%>
   						</select>
   					</td>
   				</tr>
   		     </table><br>
   		     <div>
   		     	<input id="submit" type="button" name="OK" class="btn btn-success" style="margin-right: 40px;" class="myinput" value="插入试题">
   		     	<input type="button" name="OK" class="btn btn-success" class="myinput" value="返回" onclick="javascript:window.location.href='testBaseIndex.jsp'">
   		     </div>
   		     </form>
   		  </body>
   		</html>
   		<%
   	}else if("2".equals(ptye)){
   		%>
<html>
  <head>
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.json-2.4.js" type="text/javascript"></script>
	<script type="text/javascript">
		var option="";
		$(document).ready(function() {
			
			$.getJSON("doCreateSubject.jsp?type=get",function(result){
				//alert(result);
			    $.each(result, function(i, field){
			    	var val=field.split(":")[0];
			    	if(field.split(":")[1]=="<%=subjectName%>")
			    	{
			    		option+="<option id="+val+" selected='selected' >"+field.split(":")[1]+"</option>";
			    	}else{
			    		option+="<option id="+val+" >"+field.split(":")[1]+"</option>";
			    	}
			    });
			    $("#subjectName").html(option);
			});
			
			$("#submit").click(function() {
				//action="insertTitle.jsp" method="post"
				$("#title").css("border","1px solid #ccc");
				
				if($("#title").val()==""||$("#title").val().trim()==""){
					$("#title").css("border","1px solid red");
					return;
				}
				var paratmeter = {
						'id':<%=id%>,
						'subjectId':$('#subjectName option:selected').attr("id"),
						'subjectName':$("#subjectName").val(),
						'title':$("#title").val(),
						'answer':$('#answer option:selected').attr("id"),
						'isChosen':$('#isChosen option:selected').attr("id")
					}; 
				//alert(JSON.stringify(paratmeter));
				//action="doCreatePaper.jsp"
				$.ajax({
					url : "DoTestBaseCorrect.jsp?type=2",
					type : "POST",
					dataType : "json",
					data : JSON.stringify(paratmeter),
					contentType : "application/json;charset=utf-8",
					success : function(data) {
						//alert(data);
						if(data.code == "0"){
							//return true;
							window.location.href="testBaseIndex.jsp";
						}else if(data.code == "1"){
							alert("网络异常,稍后再试...");
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
		                alert(XMLHttpRequest.status);
		                alert(XMLHttpRequest.readyState);
		                alert(textStatus);
		            }
				});
			});
		});
	</script>
	<style type="text/css">
	.myinput {
		width: 220px;
		height: 40px;
		border: 1px solid #ccc;
		text-indent: 15px;
		color: #999;
	}
	</style>
  </head>
  
  <body style="text-align:center;">
  <form>
 	 <table class="table table-bordered">
	    <tr>
	    	<td >科目</td>
			<td><select id ="subjectName" name="subjectName" class="myinput"></select></td>
		</tr>
		
		<tr>
			<td >题目内容</td>
			<td><textarea id="title" name="title" style="border: 1px solid #ccc;color: #999;" rows="3" cols="30"><%=title %></textarea></td>
		</tr>
		<tr>
			<td >答案</td>
			<td>
				<select id="answer" name="answer" class="myinput">
					<%
						if("right".equals(answer)){
							%>
					<option id="right" selected="selected">对</option>
					<option id="error">错</option>
							<%
						}else{
							%>
					<option id="right">对</option>
					<option id="error" selected="selected">错</option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td >标识</td>
			<td>
				<select id="isChosen" name="isChosen" class="myinput">
					<%
						if("yes".equals(answer)){
							%>
					<option id="yes" selected="selected">是</option>
					<option id="no">否</option>
							<%
						}else{
							%>
					<option id="yes">是</option>
					<option id="no" selected="selected">否</option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
     </table><br>
     <div>
     	<input id="submit" type="button" name="OK" class="btn btn-success" style="margin-right: 40px;" class="myinput" value="插入试题">
     	<input type="button" name="OK" class="btn btn-success" class="myinput" value="返回" onclick="javascript:window.location.href='testBaseIndex.jsp'">
     </div>
     </form>
  </body>
</html>
   		<%
   	}
 
   	
%>

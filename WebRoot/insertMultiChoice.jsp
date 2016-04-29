<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'insertTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
			    	option+="<option id="+val+">"+field.split(":")[1]+"</option>";
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
					url : "insertTitle.jsp?type=1",
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
			<td><textarea id="title" name="title" rows="3" cols="30"></textarea></td>
		</tr>
		
		<tr>
			<td >选项&nbsp;&nbsp;A</td>
			<td><input type="text"  id="a" name="a" size="30" class="myinput" value=""></td>
		</tr>
		
		<tr>
			<td >选项&nbsp;&nbsp;B</td>
			<td><input type="text"  id="b" name="b" size="30" class="myinput" value=""></td>
		</tr>
		
		<tr>
			<td >选项&nbsp;&nbsp;C</td>
			<td><input type="text" id="c" name="c" size="30" class="myinput" value=""></td>
		</tr>
		
		<tr>
			<td >选项&nbsp;&nbsp;D</td>
			<td><input type="text"  id="d" name="d" size="30" class="myinput" value=""></td>
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
				A&nbsp;&nbsp;<input value="a" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
				B&nbsp;&nbsp;<input value="b" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
				C&nbsp;&nbsp;<input value="c" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
				D&nbsp;&nbsp;<input value="d" name="answer" type="checkbox" style="height: 20px;width: 20px;margin-right: 20px;">
			</td>
		</tr>
		
		<tr>
			<td >标识</td>
			<td>
				<select id="isChosen" name="isChosen" class="myinput">
					<option id="yes">是</option>
					<option id="no">否</option>
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

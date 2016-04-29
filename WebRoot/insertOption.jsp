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
				
				if($("#title").val()==""||$("#title").val().trim()==""){
					$("#title").css("border","1px solid red");
					return;
				}
				var paratmeter = {
						'subjectId':$('#subjectName option:selected').attr("id"),
						'subjectName':$("#subjectName").val(),
						'title':$("#title").val(),
						'answer':$('#answer option:selected').attr("id"),
						'isChosen':$('#isChosen option:selected').attr("id")
					}; 
				//alert(JSON.stringify(paratmeter));
				//action="doCreatePaper.jsp"
				$.ajax({
					url : "insertTitle.jsp?type=2",
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
			<td >答案</td>
			<td>
				<select id="answer" name="answer" class="myinput">
					<option id="right">对</option>
					<option id="error">错</option>
				</select>
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

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="sample.util.*"%>
<%@ include file="comm/conndb.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生智能测评系统</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/js/jquery.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.json-2.4.js"
	type="text/javascript"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">

var flag = false;
function checkSubjectName() {
	$("#subjectName").css("border","1px solid #ccc");
	var subjectName = $("#subjectName").val();
	/* $.getJSON('doCreateSubject.jsp?type=check&subjectName='+encodeURI(encodeURI(subjectName)),function(data){  
		//此处返回的data已经是json对象
		alert(data);
	});  */
	/* var paratmeter = {
		'subjectName':subjectName
	}; 
	alert(JSON.stringify(paratmeter));
	*/
	 $.ajax({
		url : 'doCreateSubject.jsp?type=check&subjectName='+encodeURI(encodeURI(subjectName)),
		contentType : "application/json;charset=utf-8",
		dataType:"text",
		success : function(data) {
			//alert(data);
			var jsonText = eval("("+data+")");;
			//alert(jsonText.code);
			if(jsonText.code == "0"){
				flag = true;
			}else if(jsonText.code == "1"){
				$("#subjectName").css("border","1px solid red");
				flag = false;
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }
	});
}
<!--doCreatePaper.jsp-->
	$(document).ready(function() {
		$("#submit").click(function() {
			
			var subjectName = $("#subjectName").val();
			$("#subjectName").css("border","1px solid #ccc");
			
			if (subjectName==""||subjectName.trim()=="") {
				$("#subjectName").css("border","1px solid red");
				return;
			}
			if(flag){
				$.ajax({
					url : 'doCreateSubject.jsp?type=add&subjectName='+encodeURI(encodeURI(subjectName)),
					type : "GET",
					contentType : "application/json;charset=utf-8",
					success : function(data) {
						//alert(data);
						if(data.code == "0"){
							//return true;
							window.location.href="subjectManage.jsp";
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
			}
		});
	});
</script>
<style type="text/css">
.myinput {
	width: 100%;
	height: 40px;
	border: 1px solid #ccc;
	text-indent: 15px;
	color: #999;
}
</style>
</head>
<body style="text-align: center;">
	<div style="float: left;">
		<table class="table table-bordered"
			style="width: 100%; margin-left: 0px;" align="center">
			<tr>
				<td align="right"><font style="font-size: 18px;">科目名称</font></td>
				<td width="340px;"><input type="text" id="subjectName"
					name="subjectName" class="myinput" onBlur="checkSubjectName()"></input></td>
				<td><div align="center">
						<input id="submit" type="button" style="margin-right: 40px;" class="btn btn-success" name="ok"
							value="添加科目">
						<input id="cancel" type="button" class="btn btn-success" name="cancel" value="返回" onclick="javascript:window.location.href='subjectManage.jsp'">
					</div></td>
			</tr>
		</table>
	</div>
</body>
</html>

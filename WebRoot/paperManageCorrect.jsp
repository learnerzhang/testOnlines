<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="comm/conndb.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    	try{ 
    		id=Integer.parseInt(request.getParameter("paperId")); 
    		sql="select * from examPaper where id='"+id+"'"; 
    		rs=stmt.executeQuery(sql); 
    		while(rs.next()){
    			id=rs.getInt("id");
		   		subjectName=rs.getString("subjectName");
		   		paperName=rs.getString("paperName");
		   		choiceNum=rs.getString("choiceNum"); 
		   		choiceId=rs.getString("choiceId"); 
		   		
		   		multipleChoiceNum=rs.getString("multipleChoiceNum"); 
		   		multipleChoiceId=rs.getString("multipleChoiceId"); 
		   		
		   		optionNum=rs.getString("optionNum"); 
		   		optionId=rs.getString("optionId"); 
		   		
		   		totalPoint=rs.getInt("totalPoint");
		   		time = rs.getInt("time");
    		} 
    	}catch(Exception e){
    		e.printStackTrace(); 
    	} 
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
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.json-2.4.js" type="text/javascript"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
		var option = "";
		var f_paperName = false;
		var f_choiceNum = false;
		var f_multipleChoiceNum = false;
		var f_optionNum = false;
		var f_totalPoint = false;
		var f_time = false;
		function checkpaperName() {
			//alert("checkpaperName");
			$("#paperName").css("border","1px solid #ccc");
			var paperName = $("#paperName").val();
			if(paperName==""||paperName.trim()==""){
				$("#paperName").css("border","1px solid red");
				f_paperName = false;
				return;
			}
			$.ajaxSettings.async = false;
			$.getJSON("doCreatePaper.jsp?type=check&id=<%=id%>&key=paperName&paperName="+encodeURI(encodeURI(paperName)),function(result){
				//alert(result.code);
				if (result.hasOwnProperty("code")) {
					if (result.code== "0") {
						f_paperName = true;
					} else if (result.code == "1") {
						$("#paperName").css("border","1px solid red");
						f_paperName = false;
					} 
				}
			});
		}
		
		function checkChoiceNum() {
			//alert("checkChoiceNum");
			$("#choiceNum").css("border","1px solid #ccc");
			var choiceNum = $("#choiceNum").val();
			//alert(choiceNum);
			if(choiceNum==""||choiceNum.trim()==""||isNaN(choiceNum)){
				$("#choiceNum").css("border","1px solid red");
				f_choiceNum = false;
				return;
			}
			//alert($('#subjectName option:selected').val());
			$.ajaxSettings.async = false;
			$.getJSON("doCreatePaper.jsp?type=check&key=choiceNum&sid="+$('#subjectName option:selected').attr("id")+"&choiceNum="+choiceNum,function(result){
				//alert(result.code);
				if (result.hasOwnProperty("code")) {
					if (result.code== "0") {
						f_choiceNum = true;
						$("#totalPoint").val(parseInt($("#choiceNum").val())+parseInt($("#multipleChoiceNum").val())*2+parseInt($("#optionNum").val()));
					} else if (result.code == "1") {
						$("#choiceNum").css("border","1px solid red");
						f_choiceNum = false;
					} 
				}
			});
		}
		function checkMultipleChoiceNum() {
			//alert("checkMutipleChoiceNum");
			
			$("#multipleChoiceNum").css("border","1px solid #ccc");
			var multipleChoiceNum = $("#multipleChoiceNum").val();
			//alert(multipleChoiceNum);
			if(multipleChoiceNum==""||multipleChoiceNum.trim()==""||isNaN(multipleChoiceNum)){
				$("#multipleChoiceNum").css("border","1px solid red");
				f_multipleChoiceNum = false;
				return;
			}
			//alert($('#subjectName option:selected').val());
			$.ajaxSettings.async = false;
			$.getJSON("doCreatePaper.jsp?type=check&key=multipleChoiceNum&sid="+$('#subjectName option:selected').attr("id")+"&multipleChoiceNum="+multipleChoiceNum,function(result){
				//alert(result.code);
				if (result.hasOwnProperty("code")) {
					if (result.code== "0") {
						f_multipleChoiceNum = true;
						$("#totalPoint").val(parseInt($("#choiceNum").val())+parseInt($("#multipleChoiceNum").val())*2+parseInt($("#optionNum").val()));
					} else if (result.code == "1") {
						$("#multipleChoiceNum").css("border","1px solid red");
						f_multipleChoiceNum = false;
					} 
				}
			});
		}
		function checkOptionNum() {
			//alert("checkOptionNum");
			$("#optionNum").css("border","1px solid #ccc");
			var optionNum = $("#optionNum").val();
			//alert(multipleChoiceNum);
			if(optionNum==""||optionNum.trim()==""||isNaN(optionNum)){
				$("#optionNum").css("border","1px solid red");
				f_optionNum = false;
				return;
			}
			//alert($('#subjectName option:selected').val());
			$.ajaxSettings.async = false;
			$.getJSON("doCreatePaper.jsp?type=check&key=optionNum&sid="+$('#subjectName option:selected').attr("id")+"&optionNum="+optionNum,function(result){
				//alert(result.code);
				if (result.hasOwnProperty("code")) {
					if (result.code== "0") {
						f_optionNum = true;
						$("#totalPoint").val(parseInt($("#choiceNum").val())+parseInt($("#multipleChoiceNum").val())*2+parseInt($("#optionNum").val()));
					} else if (result.code == "1") {
						$("#optionNum").css("border","1px solid red");
						f_optionNum = false;
					} 
				}
			});
		}
		function checkTotalPoint() {
			//alert("checkOptionNum");
			$("#totalPoint").css("border","1px solid #ccc");
			var totalPoint = $("#totalPoint").val();
			//alert(totalPoint);
			if(totalPoint==""||totalPoint.trim()==""||isNaN(totalPoint)||totalPoint<1||totalPoint>100){
				$("#totalPoint").css("border","1px solid red");
				f_totalPoint = false;
			}else{
				f_totalPoint = true;
			}
		}
		function checkTime() {
			//alert("checkTime");
			$("#time").css("border","1px solid #ccc");
			var time = $("#time").val();
			//alert(totalPoint);
			if(time==""||time.trim()==""||isNaN(time)||time<10||totalPoint>120){
				$("#time").css("border","1px solid red");
				f_time = false;
			}else{
				f_time = true;
			}
		}
		
		$(document).ready(function() {
			
			$.getJSON("doCreateSubject.jsp?type=get",function(result){
				//alert(result);
			    $.each(result, function(i, field){
			    	var val=field.split(":")[0];
			    	
			    	if("<%=subjectName%>"==field.split(":")[1]){
			    		option+="<option id="+val+" selected='selected' >"+field.split(":")[1]+"</option>";
			    	}else {
			    		option+="<option id="+val+">"+field.split(":")[1]+"</option>";
					}
			    });
			    $("#subjectName").html(option);
			});
			
			$("#submit").click(function() {
				
				if (!f_paperName) {
					checkpaperName();
					//alert("checkpaperName "+f_paperName);
				}
				if (!f_choiceNum) {
					checkChoiceNum();
					//alert("checkChoiceNum "+f_choiceNum);
				}
				
				if (!f_multipleChoiceNum) {
					checkMultipleChoiceNum();
					//alert("checkMultipleChoiceNum "+f_multipleChoiceNum);
				}
				
				if (!f_optionNum) {
					checkOptionNum();
					//alert("checkOptionNum "+f_optionNum);
				}
				
				if (!f_totalPoint) {
					checkTotalPoint();
					//alert("checkTotalPoint "+f_totalPoint);
				}
				if (!f_time) {
					checkTime();
					//alert("checkTime "+f_time);
				}
				//alert("before:"+f_paperName+"|"+f_choiceNum+"|"+f_multipleChoiceNum+"|"+f_optionNum+"|"+f_totalPoint+"|"+f_time);
				if (f_paperName&&f_choiceNum&&f_multipleChoiceNum&&f_optionNum&&f_totalPoint&&f_time) {
					//alert("Ok");
					var paratmeter = {
							'id':<%=id%>,
							'subjectId':$('#subjectName option:selected').attr("id"),
							'subjectName':$("#subjectName").val(),
							'paperName':$("#paperName").val(),
							'choiceNum':$("#choiceNum").val(),
							'multipleChoiceNum':$("#multipleChoiceNum").val(),
							'optionNum':$("#optionNum").val(),
							'totalPoint':$("#totalPoint").val(),
							'time':$("#time").val()
						}; 
					//alert(JSON.stringify(paratmeter));return;
					//action="doCreatePaper.jsp"
					$.ajax({
						url : "doCreatePaper.jsp?type=update",
						type : "POST",
						dataType : "json",
						async : false,
						data : JSON.stringify(paratmeter),
						contentType : "application/json;charset=utf-8",
						success : function(data) {
							//alert(data);
							if(data.code == "0"){
								//return true;
								window.location.href="paperManage.jsp";
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
			$("#subjectName").change(function(){
				f_paperName=false;
				f_choiceNum=false;
				f_multipleChoiceNum=false;
				f_optionNum=false;
				f_totalPoint=false;
				f_time = false;
				
				//alert("subjectName change");
			});
		});
	</script>
  </head>
  <body style="text-align:center;">
  <form>
  <div align="center"> 
    <table class="table table-bordered">
	   	<tr>
	   		<td >科目类别</td>
	   			<td><select id ="subjectName" name="subjectName" class="myinput"></select></td>
	   	</tr>
	   	<tr>
	   		<td >试卷名称</td>
	   		<td><input type="text" id="paperName" name="paperName" class="myinput" onblur="checkpaperName()" value="<%=paperName%>"></input></td>
	   	</tr>	
	   	<tr>
	   		<td >单择题数目</td>
	   			<td><input type="text" id="choiceNum" name="choiceNum" class="myinput" onblur="checkChoiceNum()" value="<%=choiceNum%>"></input></td>
	   	</tr>
	   	<tr>
	   		<td >多选题数目</td>
	   		<td><input type="text" id="multipleChoiceNum" name="multipleChoiceNum" class="myinput" onblur="checkMultipleChoiceNum()" value="<%=multipleChoiceNum%>"></input></td>
	   	</tr>
	   	<tr>
	   		<td >判断题数目</td>
	   		<td><input type="text" id="optionNum" name="optionNum" class="myinput" onblur="checkOptionNum()" value="<%=optionNum%>"></input></td>
	   	</tr>
	   	<tr>
	   		<td >总分数</td>
	   		<td><input type="text" id="totalPoint" name="totalPoint" class="myinput" readonly="readonly" value="<%=totalPoint%>"></input></td>
	   	</tr>
	   	<tr>
	   		<td >答题时间</td>
	   		<td><input type="text" id="time" name="time" class="myinput" onblur="checkTime()" value="<%=time%>"></input></td>
	   	</tr>
   </table>
   </div>
   <br>
   <div align="center"><input id="submit" type="button" class="btn btn-success" style="margin-right: 40px;" name="ok" value="修改"><input type="button" class="btn btn-success" name="ok" value="返回" onclick="javascript:window.location.href='paperManage.jsp'">
   </div></form>
  </body>
</html>

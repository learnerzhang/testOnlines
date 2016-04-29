<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.json-2.4.js"></script>
<script>
$(document).ready(function() {
		$("#submit").click(function() {
			var text = "张震";
			$.ajax({
				url : 'do.jsp?text='+encodeURI(encodeURI(text)),
				type : "POST",
				contentType : "application/json",
				success : function(data) {
					//$("#result").text(data);
					
					alert(data);
					alert(data.code);
					if(data.code == "0"){
						//return true;
					}else if(data.code == "1"){
						alert("hhhhh");
					}
				}
			});
		});
	});
</script>
</head>
<body>
<input type="button" id="submit" value="提交">
</body>
</html>
 	function check(){
  		if($("#userName").val() == ""){
  			alert("请填写用户名!");
  			return false;
  		}
  		if($("#password").val() == ""){
  			alert("请填写密码!");
  			return false;
  		}
  		
  		if($("#rand").val() == ""){
  			alert("请填写验证码!");
  			return false;
  		}
  		
  		if($("#isManager".val()=="")){
  			alert("请填写权限!");
  			return false;
  		}
  		
  		
  		return true;
  	}
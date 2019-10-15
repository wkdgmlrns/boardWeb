var status = true;

$(document).ready(function(){
	$("#checkId").click(function(){
	  if($("#id").val()){
		var query = {id:$("#id").val()};
	    $.ajax({
	    	type:"post",
	    	url:"confirm.jsp",
	    	data:query,
	    	success:function(data){
	    		if(data == 1){
	    			alert("사용할 수 없는 아이디");
	    	    	$("#id").val("");
	    	     }else if(data == -1)
	    	  	    alert("사용할 수 있는 아이디");
	 	    }
	    });
	  }else{
		  alert("사용할 아이디를 입력");
		  $("#id").focus();
	  }
	});
	$("#process").click(function(){
	   checkIt();   
	   if(status){
		   var query = {id:$("#id").val(), 
					  passwd:$("#passwd").val(),
				      name:$("#name").val(),
				      address:$("#address").val(),
				      tel:$("#tel").val()};
		  $.ajax({
		      type:"post",
		      url:"registerDo.jsp",
		      data:query,
		      success:function(data){
		    	  window.location.href="../jangHee/index.jsp";
		 	  }
		  });
	   }
	});
	$("#cancle").click(function(){
		window.location.href="../jangHee/index.jsp";
	});

 });
function checkIt() {
	status = true;
	
    if(!$("#id").val()) {
        alert("아이디를 입력하세요");
        $("#id").focus();
        status = false;
        return false;
    }
    
    if(!$("#passwd").val()) {
        alert("비밀번호를 입력하세요");
        $("#passwd").focus();
        status = false;
        return false;
    }
    if($("#passwd").val() != $("#repasswd").val()){
        alert("비밀번호를 동일하게 입력하세요");
        $("#repass").focus();
        status = false;
        return false;
    }
    
    if(!$("#name").val()) {
        alert("사용자 이름을 입력하세요");
        $("#name").focus();
        status = false;
        return false;
    }
    
    if(!$("#address").val()) {
        alert("주소를 입력하세요");
        $("#address").focus();
        status = false;
        return false;
    }
    
    if(!$("#tel").val()) {
        alert("전화번호를 입력하세요");
        $("#tel").focus();
        status = false;
        return false;
    }  
}
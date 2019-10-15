var status = true;
$(document).ready(function(){
	$("#modify").click(function(){
		var query = {passwd:$("#passwd").val()};
		$.ajax({
			type: "POST",
			url: "memberCheck.jsp",
			data: query,
			success: function(data){
				if(data==1)
					$("#main_auth").load("modifyForm.jsp?passwd="+$("#passwd").val())
				else{
					alert("비밀번호가 맞지 않습니다");
					$("#passwd").val("");
					$("#passwd").focus();
				}
			}
		});
	});
	$("#modifyProcess").click(function(){
		var query = {id:$("#id").val(),
				passwd:$("#passwd").val(),
				name:$("#name").val(),
				address:$("#address").val(),
				tel:$("#tel").val()};
		$.ajax({
			type:"POST",
			url : "modifyDo.jsp",
			data : query,	
			success : function(data){
				if(data==1){
					alert("회원정보가 수정되었습니다");
					window.location.href("main.jsp");
				}
			}
		});
	});
	$("#cancle").click(function(){
		window.location.href("main.jsp");
	});
	$("#delete").click(function(){
		var query = {passwd:$("#passwd").val()}
		$.ajax({
			type:"POST",
			url:"memberCheck.jsp",
			data:query,
			success : function(data){
				if(data==1){
					$.ajax({
						type="POST",
						url:"deleteDo.jsp",
						data:query,
						success:function(data){
							if(data==1){
								alert("탈퇴성공");
								$("#main_auth").load("loginForm.jsp");
								}
							}
						});
				}else{
					alert("비밀번호가 맞지 않습니다");
					$("#passwd").val("");
					$("#passwd").focus();
					}
			}
		});
	});
});
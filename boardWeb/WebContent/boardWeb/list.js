$(document).ready(function(){
	$("#new").click(function(){
		$("#main_board").load("writeForm.jsp");
	});  
});
function edit(editBtn){
	var rStr = editBtn.name;
	var arr = rStr.split(",");
	var query = "updateForm.jsp?num="+arr[0];
	query += "&pageNum="+arr[1];
	$("#main_board").load(query);
}
function del(delBtn){
	var rStr = delBtn.name;
	var arr = rStr.split(",");
	var query = "deleteForm.jsp?num="+arr[0];
	query += "&pageNum="+arr[1];
	$("#main_board").load(query);
}
function reply(replyBtn){
	var rStr = replyBtn.name;
	var arr = rStr.split(",");
	var query = "writeForm.jsp?num="+arr[0]+"&ref="+arr[1];
	query += "&re_step="+arr[2]+"&re_level="+arr[3]+"&pageNum="+arr[4];
	$("#main_board").load(query);
}
function p(jumpBtn){
	var rStr = jumpBtn.name;
	var query = "list.jsp?pageNum="+rStr;
	$("#main_board").load(query);
}
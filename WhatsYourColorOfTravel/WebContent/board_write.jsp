<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>What's your color</title>
<link href="board_write.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<br><br><br><br><br>
	<form>
	<div id=img>
		<input type="file" id="real-input" class="image_inputType_file" accept="img/*" required multiple>
		<button class="browse-btn">�������ε�</button>
	</div>
	<input type = "textbox" placeholder="����"><br><br>
	<textarea placeholder="����" cols = "100" rows = "10"></textarea><br><br>
	<input type = "submit" value = "Ȯ��">
	</form>
</center>
</body>
<script>
const browseBtn = document.querySelector('.browse-btn');
const realInput = document.querySelector('#real-input');

browseBtn.addEventListener('click',()=>{
	realInput.click();
});
</script>
</html>
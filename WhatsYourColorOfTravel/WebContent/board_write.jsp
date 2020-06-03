<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>What's your color</title>
<link href="board_write.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Open+Sans:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<center>
		<br> <br>
		<form action="board_writeDB.jsp" method="POST">
			<div class="contain">
				<input type="text" class="title" placeholder="제목"><br>
				<div class="box-file-input">
					<span class="filename">파일을 선택해주세요.</span><label><input type="file"
						name="img" class="file-input"
						accept="image/*"></label>
				</div>
				<textarea placeholder="내용" cols="100" rows="16"
					style="resize: none;" class="oneIntro"></textarea>
				<br>
				<br> <input type="submit" value="UPLOAD">
				 
			</div>
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
<script>

$(document).on("change", ".file-input", function(){
 
    $filename = $(this).val();

    if($filename == "")
        $filename = "占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쌍쇽옙占쏙옙.";

    $(".filename").text($filename);

})</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>What's your color</title>
<link href="board_write.css?after" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Open+Sans:wght@300&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

	<%
	
//세션 처리
String id=null;
id = (String)session.getAttribute("id");//세션 값 받음
	if(id==null||id.equals("")){
		%>
	<script>
		alert('로그인을 해주세요.');
		location.replace("member.jsp");
		</script>
	<%
	}
%>

	<center>
		<br>
		<form action="board_writeDB.jsp" method="POST">
			<div class="contain">
				<input type="text" class="title" placeholder="제목" name="title"><br>
				<input type="text" class=]"local" placeholder="다녀온 지역" name="local"><br>
				<div class="box-file-input">
					<span class="filename">파일을 선택해주세요.</span><label><input
						type="file" name="img" class="file-input" accept="image/*"></label>
				</div>
				<textarea placeholder="내용" cols="100" rows="16"
					style="resize: none;" class="oneIntro" name="oneIntro"></textarea>
				<br> <br> 
					<!-- 공개 비공개 체크 -->
					<b class="OkOrNot">게시판에 공개 안함</b>
        			<b style="display:none;" class="OkOrNot">게시판에 공개</b>
					
					<label class="switch">
               		<input type="checkbox" id="OkNotcheck" name ="OkNotcheck">
                	<span class="switchSlider round" ></span>
            		</label>
            		
            		<br><br>
					 <input
					type="submit" value="UPLOAD">

			</div>
		</form>
	</center>
	<script>
	
	//공개 비공개 체크
	$("#OkNotcheck").click(function () {
	    $(".OkOrNot").toggle();
	});


	
	$(document).on("change", ".file-input", function(){
	 
	    $filename = $(this).val();

	    if($filename == "")
	        $filename = "占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쌍쇽옙占쏙옙.";

	    $(".filename").text($filename);

	})

</script>
</body>

</html>
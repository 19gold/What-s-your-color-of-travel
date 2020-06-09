<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="board.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    function link(){
        location.href = "board_write.jsp";
    }
</script>


</head>
<body>
<div class="top">
  <h1>여기 제목 ?</h1>
</div>
<div class="searchheader" id="searchheader">
  <form>
  <input type = "text" name = "search" placeholder = "검색"class = "search">
  <button value = "검색" class = "searchclick">검색</button>
  <button value = "글쓰기" class = "writeclick" onclick = "link(); return false;">글쓰기</button>
  </form>
</div>
<div class="content">
	<table class = "contenttbl"><!-- 요거 결과창에 밑에 홈페이지 나오는것처럼 for문쓰면 어떨까 생각 -->
	<tr><Td class = "title">제목</Td><Td class = "name">이름</Td></tr><!-- 제목 -->
	<tr ><Td colspan = "2" class = "loc">지역</tr><!-- 이미지 -->
	<tr ><Td colspan = "2"><img src = ""/>이미지</Td></tr><!-- 이미지 -->
	<tr><Td colspan = "2">내용</Td></tr><!-- 내용 -->
	</table>  
</div>

<script>
window.onscroll = function() {myFunction()};

var header = document.getElementById("searchheader");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
</script>
</body>
</html>
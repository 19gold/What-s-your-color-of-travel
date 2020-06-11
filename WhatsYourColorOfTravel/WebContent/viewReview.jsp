<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="DB.databases"%>
<%@page import="java.util.*"%>
<%@page import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="viewReview.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
	<div class="titlecontainer">
		<h1 class="title">REVIEW</h1>
		<div class="titleexplain">
			It's a page that reminds you of the experiences you've traveled.<br>
			We have collected only the reviews you wrote among all the reviews.
		</div>
	</div>
	<div class="plus" style="">
		<a href="board_write.jsp"><input type="button" value="+"
			class="addbtn"></a>
		<div class="menubtn">
			<img src="img/review_menu1.png" class="menu menu4"><img
				src="img/review_menu2.png" class="menu menu2">
		</div>
	</div>
	<div class="cardcontainer">
		<%
			request.setCharacterEncoding("UTF-8");

			Connection con = null;
			Blob image = null;
			byte[] imgData = null;
			PreparedStatement pstmt = null;
			Statement stmt = null;
			ResultSet rs = null;

			String num = null;
			String title = null;
			String area = null;
			String oneIntro = null;
			String id = null;//세션으로 받는 id

			//session처리
			id = (String) session.getAttribute("id");//세션 값 받음
			if (id == null || id.equals("")) {
		%>
		<script>
			alert('로그인을 해주세요.');
			location.replace("member.jsp");
		</script>
		<%
			}

			try {
				databases databases = new databases();
				con = databases.getCon();//DB연동하기
				System.out.println("view Mapage : DB연동성공");

				stmt = con.createStatement();
				System.out.println("stmt줄 실행");

				String query = "SELECT title, area, image, oneIntro, num FROM reviews WHERE truefalse=1";
				System.out.println(query);

				rs = stmt.executeQuery(query);
				System.out.println("rs : " + rs);
				while (rs.next()) {
					title = rs.getString(1);
					area = rs.getString(2);
					image = rs.getBlob(3);
					imgData = image.getBytes(1, (int) image.length());
					String encoded = Base64.getEncoder().encodeToString(imgData);
					oneIntro = rs.getString(4);
					num = rs.getString(5);
					System.out.println(num);
					///////////////////////////////////////////////
		%>
		<div id="cardbox" class="card col-lg-5"id = "card">
			<div class="cardleft">
				<img src="img/review_person.png" id="personimg" class="personimg" /><br>
				<br> <input type="text" class="idinput" value="<%=id%>"
					disabled>
				<!-- 아이디 나오는 칸 -->
				<br> <input type="button" value="♥" class="heartbtn"
					onclick="this.style.color = '#d92c45';"> <br>
				<div class="went">
					went to <span class="wentt"><%=area%></span>
				</div>

			</div>
			<div class="cardright">
				<img src="data:image/png;base64, <%=encoded%>" id="img1" class="img" />
				<br>
				<div id="text"
					onclick="document.getElementById('id<%=num%>').style.display='block'"><%=title%></div>
			</div>
		</div>

		<div id="id<%=num%>" name="moodal" class="modal">
			<span
				onclick="document.getElementById('id<%=num%>').style.display='none'"
				class="close" title="Close Modal" style="font-size: 60px;">&times;</span>
			<table class="modaltable">
				<tr>
					<td>글쓸 때 제목 : <%=title%></td>
				</tr>
				<tr>
					<td>글쓸 때 지역<%=area%></td>
				</tr>
				<tr>
					<td><img src="data:image/png;base64, <%=encoded%>" /></td>
				</tr>
				<tr>
					<td>글쓸 때 후기:<%=oneIntro%></td>
				</tr>
			</table>
		</div>

		<%
			}
			} catch (Exception e) {
				out.println("이미지가 없습니다..TAT");
				out.println("화면 이미지 에러 = " + e.getMessage());
				return;
			}
		%>
	</div>
	<script>

	$('.menu2').click(function(){
		$('.card').removeClass('col-lg-5');
	    $('.card').addClass('col-lg-12');
	});//col-lg-offset-2 col-lg-8
$('.menu4').click(function(){
	$('.card').removeClass('col-lg-12');
    $('.card').addClass('col-lg-5');
	});
		
	
	</script>

</body>
</html>
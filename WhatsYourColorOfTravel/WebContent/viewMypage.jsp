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
<link href="viewMypage.css?var=1" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<h1>viewMapage.jsp</h1>
<%

	request.setCharacterEncoding("UTF-8");

	
	Connection con = null;
	Blob image = null;
	byte[] imgData = null;
	PreparedStatement pstmt= null;
	Statement stmt = null;
	ResultSet rs = null;
	String title=null;
	String area=null;
	String oneIntro=null;
	String id=null;//세션으로 받는 id
	
	//session처리
	id = (String)session.getAttribute("id");//세션 값 받음
		if(id==null||id.equals("")){
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
		
		String query = "SELECT title, area, image, oneIntro FROM reviews WHERE id ='"+id+"'";
		System.out.println(query);
		
		rs = stmt.executeQuery(query);
		System.out.println("rs : " + rs);
		while (rs.next()) {	
			title = rs.getString(1);
			area=rs.getString(2);
			image = rs.getBlob(3);
			imgData = image.getBytes(1, (int) image.length());
			String encoded = Base64.getEncoder().encodeToString(imgData);
			oneIntro = rs.getString(4);
			///////////////////////////////////////////////
	%>
	
	<table>
		<tr>
		<td>글쓸 때 제목 : <%=title %></td>
		</tr>
		<tr>
		<td>글쓸 때 지역<%=area %></td>
		</tr>
		<tr>
		<td><img src="data:image/png;base64, <%=encoded %>"/></td>
		</tr>
		<tr>
		<td>글쓸 때 후기:<%=oneIntro %></td>
		</tr>
	</table>
	<%
	
		}
		} catch (Exception e) {
			out.println("이미지가 없습니다..TAT");
			out.println("화면 이미지 에러 = " + e.getMessage());
			return;
		}
	%>
	
		<div id = "cardbox">
		<img id = "img1" src="img/기후현.JPG"/>	
		<br>
		<div id="text">어쩌구 저쩌구</div>
	</div>
	
	<div id = "cardbox2">
		<img id = "img1" src="img/기후현.JPG"/>	
		<div id="text">어쩌구 저쩌구</div>
	</div>
			
	<div id = "cardbox3">
		<img id = "img1" src="img/기후현.JPG"/>	
		<div id="text">어쩌구 저쩌구</div>
	</div>		

	<div id = "cardbox4">
		<img id = "img1" src="img/기후현.JPG"/>	
		<div id="text">어쩌구 저쩌구</div>
	</div>
</body>
</html>
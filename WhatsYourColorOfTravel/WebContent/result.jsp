<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="DB.databases"%>
<%@page import="DB.DBvar"%>
<%@page import="DB.DBlist"%>
<%@page import="java.util.*"%>
<%@page import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="result.css?var=1" rel="stylesheet" type="text/css">
<title>결과창</title>
</head>
<body style="overflow-x: hidden;">
<%
		request.setCharacterEncoding("UTF-8");
	//databases databases = new databases();
	//DBvar dv = new DBvar();
	//DBlist dl = new DBlist();
	%>
	<%-- Connection con = databases.getCon();--%>
	<%
		System.out.println("surveyAnswer.jsp에서 DB연동 확인");
	String[] country = { "홋카이도", "혼슈", "시코쿠", "규슈", "오키나와" };
	String[] mood = { "조용한_분위기", "시끄러운_분위기", "느긋한_분위기", "독특한_분위기", "이국적인_분위기" };
	String[] nature = { "산", "바다", "시골", "도시", "눈" };
	String[] activity = { "자연", "역사", "문화체험", "먹거리", "액티비티" };
	String[] character = { "활발한_성격", "느긋한_성격", "급한_성격", "온화한_성격", "게으른_성격" };
	String result = request.getParameter("result");
	System.out.println("result -.>" + result);
	String[] temp = result.split(",");
	if(temp[0].equals("0")){
		temp[2]="1";
		temp[3]="4";
		temp[4]="2";
		temp[5]="1";
	}
	
	//System.out.println("#####1");
	String selectedCountry = country[Integer.parseInt(temp[0])];//지역 섬
	//System.out.println("#####2");
	String selectedMood = mood[Integer.parseInt(temp[2])];//분위기
	////System.out.println("#####3");
	String selectedNature = nature[Integer.parseInt(temp[3])];//자연
	//System.out.println("#####4");
	String selectedActivity = activity[Integer.parseInt(temp[4])];//활동
	//System.out.println("#####5");
	String selectedCharacter = character[Integer.parseInt(temp[5])];//성격
	System.out.println("temp[5] : "+temp[5]);
	//System.out.println("#####6");
	
	System.out.println(selectedCountry);//혼슈
	System.out.println(selectedMood);//느긋한
	System.out.println(selectedNature);//시골
	System.out.println(selectedActivity);//문화체험
	System.out.println(selectedCharacter);//느긋한 - > DB에서 사용 안하고 프론트 쪽에서 색 표현시 사용
	System.out.println("jsp에서 값 받기 성공");%>

<div class = "colorimg">
	<% 
	//분위기별 결과 이미지 
		switch(temp[2]) {
	    case "0": %> <img class= "mood" src="test/0.jpg"><% 
	         break;
	    case "1": %> <img class= "mood" src="test/1.jpg"><% 
	         break;
	    case "2": %> <img class= "mood" src="test/2.jpg"><% 
		         break;
	    case "3": %> <img class= "mood" src="test/3.jpg"><% 
		         break;
	    case "4": %> <img class= "mood" src="test/4.jpg"><% 
		         break;
	    default:  %> <img class= "mood" src="test/0.jpg"><% 
	         break;
	}
	
		//자연별 결과 이미지 
		switch(temp[3]) {
	    case "0": %> <img class= "nature" src="test/0.jpg"><% 
	         break;
	    case "1": %> <img class= "nature" src="test/1.jpg"><% 
	         break;
	    case "2": %> <img class= "nature" src="test/2.jpg"><% 
		         break;
	    case "3": %> <img class= "nature" src="test/3.jpg"><% 
		         break;
	    case "4": %> <img class= "nature" src="test/4.jpg"><% 
		         break;
	    default:  %> <img class= "nature" src="test/0.jpg"><% 
	         break;
	}
		
		//성격별 결과 이미지 
		switch(temp[5]) {
	    case "0": %> <img class= "character" src="test/0.jpg"><% 
	         break;
	    case "1": %> <img class= "character" src="test/1.jpg"><% 
	         break;
	    case "2": %> <img class= "character" src="test/2.jpg"><% 
		         break;
	    case "3": %> <img class= "character" src="test/3.jpg"><% 
		         break;
	    case "4": %> <img class= "character" src="test/4.jpg"><% 
		         break;
	    default:  %> <img class= "character" src="test/0.jpg"><% 
	         break;
	}
		%>
		</div>
	<div id="explain" class="relative1">
		<button id="btn1">
		<img src="img\result_submit.png" class = "ic">
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View reviews of
				people who are<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;similar
				in travel color to me !
			</div>
		</button>
	</div>
	<br>
	<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="btn2" onclick="location.href='survey.jsp'">AGAIN
		SURVEY</button>
	<br>
	<br>
	<br>
	<br>
	<div class = "resulttable">
	<%
	Blob image = null;
	Connection con = null;
	byte[] imgData = null;
	Statement stmt = null;
	ResultSet rs = null;
	String country_db = null;//기후 등등
	String link_db=null;
	String tag1_db = null;//링크
	String tag2_db=null;//~분위기
	String tag3_db=null;//~자연
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gold?&useSSL=false", "root", "mirim2");
		System.out.println("DB연동성공");
		stmt = con.createStatement();
		System.out.println("stmt줄 실행");
		String query = "SELECT country,link, image, tag1, tag2, tag3 FROM info WHERE area='"
		+ selectedCountry + "' AND mood='"
		+ selectedMood + "' AND place='" + selectedNature + "' AND activity='" + selectedActivity + "'";
		System.out.println(query);
		rs = stmt.executeQuery(query);
		//out은 jsp가 원래 가지고 있는 내장객체
		System.out.println("rs : " + rs);
		while (rs.next()) {
			country_db = rs.getString(1);
			link_db = rs.getString(2);
			image = rs.getBlob(3);
			imgData = image.getBytes(1, (int) image.length());
			String encoded = Base64.getEncoder().encodeToString(imgData);
			tag1_db=rs.getString(4);
			tag2_db=rs.getString(5);
			tag3_db=rs.getString(6);
	%>
	<table class = "hptable">
		<tr class = "local" style = "text-align : left;">
			<td># <%=country_db%></td>
		</tr>
		<tr>
			<td><img id="photoImage"class = "photoImage"
				src="data:image/png;base64, <%=encoded%>"/>
			<td>
			
		</tr>
		<tr class= "tag">
		<td><%=tag1_db %>&nbsp;<%=tag2_db %>&nbsp;<%=tag3_db %></td>
		</tr>
		<tr class = "explain1">
			<td><button class="btn" onclick="location.href='<%=link_db%>' ">GO HOMEPAGE</button></td>
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
</div>
</body>
</html>
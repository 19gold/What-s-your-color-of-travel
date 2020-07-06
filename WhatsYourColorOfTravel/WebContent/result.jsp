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
<title>What's your color of travel</title>
</head>
<body style="overflow-x: hidden;">
	<img src="img/resultcha.gif" class="resultcha">
	<%
	request.setCharacterEncoding("UTF-8");
		
		System.out.println("surveyAnswer.jsp에서 DB연동 확인");
		String[] daynight = { "day", "night" };
		String[] mood = { "slient", "noisy", "relaxed", "unique", "exotic" };
		String[] nature = { "mountain", "beach", "country", "city", "snow" };
		String[] activity = { "nature", "history", "culture", "food", "activities" };
		String[] character = { "activitely", "relax", "hottemper", "gentle", "lazy" };
		String result = request.getParameter("result");
		System.out.println("result -.>" + result);
		String[] temp = result.split(",");
		//System.out.println("#####1");
		String selectedDaynight = daynight[Integer.parseInt(temp[0])];//밤낮
		//System.out.println("#####2");
		String selectedMood = mood[Integer.parseInt(temp[2])];//분위기
		////System.out.println("#####3");
		String selectedNature = nature[Integer.parseInt(temp[3])];//자연
		//System.out.println("#####4");
		String selectedActivity = activity[Integer.parseInt(temp[4])];//활동
		//System.out.println("#####5");
		String selectedCharacter = character[Integer.parseInt(temp[5])];//성격
		System.out.println("temp[5] : " + temp[5]);
		//System.out.println("#####6");

		System.out.print(selectedDaynight);//혼슈
		System.out.print(selectedMood);//느긋한
		System.out.print(selectedNature);//시골
		System.out.print(selectedActivity);//문화체험
		System.out.println(selectedCharacter);//느긋한 - > DB에서 사용 안하고 프론트 쪽에서 색 표현시 사용
		System.out.println("jsp에서 값 받기 성공");
		String num1;
		String num2;
		String num3;
		
	%>
	<%
		//분위기별 결과 이미지 
		switch (temp[2]) {//mood
		case "0":
			num1 = "조용한";
			break;
		case "1":
			num1 = "시끄러운";
			break;
		case "2":
			num1 = "느긋한";
			break;
		case "3":
			num1 = "독특한";
			break;
		case "4":
			num1 = "이국적인";
			break;
		default:
			num1 = "조용한";
			break;
		}

		//자연별 결과 이미지 
		switch (temp[3]) {//nature
		case "0":
			num2 = "산";
			break;
		case "1":
			num2 = "바다";
			break;
		case "2":
			num2 = "시골";
			break;
		case "3":
			num2 = "도시";
			break;
		case "4":
			num2 = "눈";
			break;
		default:
			num2 = "산";
			break;
		}

		//성격별 결과 이미지 
		switch (temp[5]) {//character
		case "0":
			num3 = "활발한";
			break;
		case "1":
			num3 = "느긋한2";
			break;
		case "2":
			num3 = "급한";
			break;
		case "3":
			num3 = "온화한";
			break;
		case "4":
			num3 = "게으른";
			break;
		default:
			num3 = "활발한";
			break;
		}
	%>
	<div class="colorimg">
		<table class="colorimgtbl">
			<tr>
				<td class="td"><img class="mood img" src="test/<%=num1%>.png"></td>
				<td class="td"><img class="nature img" src="test/<%=num2%>.png"></td>
			</tr>
			<tr>
				<td class="td"><img class="character img" src="test/<%=num3%>.png"></td>
				<td class="td tdl">
					<div id="explain" class="relative1">
						<button id="btn1" onclick="location.href='viewMypage.jsp'">
							<img src="img\result_submit.png" class="ic">
							<div class="exp">
								View reviews of people who are<br>similar in travel color
								to me !
							</div>

						</button>
						<button id="btn2" onclick="location.href='survey.jsp'">AGAIN
							SURVEY</button>
					</div>


				</td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<div class="resulttable">
		<%
			Blob image = null;
			Connection con = null;
			byte[] imgData = null;
			Statement stmt = null;
			ResultSet rs = null;
			String country_db = null;//기후 등등
			String link_db = null;
			String tag1_db = null;//링크
			String tag2_db = null;//~분위기
			String tag3_db = null;//~자연

			try {//
				databases databases = new databases();
				
				con = databases.getCon();
				stmt = con.createStatement();
				
				String query = "SELECT  country,link, image, tag1, tag2, tag3, daynight FROM info WHERE daynight LIKE '"
						+selectedDaynight+"%' and mood LIKE '"
						+selectedMood+"%' and place LIKE '"
						+selectedNature+"%' and activity LIKE '"
						+selectedActivity+"%';";
	
				//out.println(query+"<br>");//확인
				
				rs = stmt.executeQuery(query);

				while (rs.next()) {
					//out.println("true--------------<br>");
					country_db = rs.getString(1);
					link_db = rs.getString(2);
	                image = rs.getBlob(3);
	                imgData = image.getBytes(1, (int) image.length());
	                String encoded = Base64.getEncoder().encodeToString(imgData);
	                tag1_db = rs.getString(4);
	                tag2_db = rs.getString(5);
	                tag3_db = rs.getString(6);
					%>
					<table class="hptable">
						<tr class="local" style="text-align: left;">
							<td># <%=country_db%></td>
						</tr>
						<%--  <tr>
							<td><img id="photoImage" class="photoImage"
								src="data:image/png;base64, <%=encoded%>" />
							<td>
						</tr>
						<tr class="tag">
							<td><%=tag1_db%>&nbsp;<%=tag2_db%>&nbsp;<%=tag3_db%></td>
						</tr>https://dakku.emirim.kr/phpmyadmin/sql.php?db=travelcolor&table=info&token=98aecb2f2654d5d2a1ef4385290a08f3&pos=0
						<tr class="explain1">
							<td><button class="btn" onclick="location.href='<%=link_db%>' ">GO
									HOMEPAGE</button></td>
						</tr>--%>
					</table>
					<div class="chat">
			<script id="embeddedChatbot" data-botId="Bdv5w4" src="https://www.closer.ai/js/webchat.min.js"> </script>
					</div>
					<%
				}//while
			} catch (Exception e) {
				out.println("이미지가 없습니다..TAT\n");
				out.println(" 에러 = " + e.getMessage());
				System.out.println(e.getMessage());
				return;
			}
		%>
	</div>
</body>
</html>
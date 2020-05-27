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
<link href="img_css.css?var=1" rel="stylesheet" type="text/css">
<title>결과창</title>
</head>
<body style="overflow-x: hidden;">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<% 
	String[] temp = {"0","1","2","3","4","0"};
	
	//분위기별 결과 이미지 
		switch(temp[2]) {
	    case "0": %> <img class= "mood" src="../test/0.jpg"><% 
	         break;
	    case "1": %> <img class= "mood" src="../test/1.jpg"><% 
	         break;
	    case "2": %> <img class= "mood" src="../test/2.jpg"><% 
		         break;
	    case "3": %> <img class= "mood" src="../test/3.jpg"><% 
		         break;
	    case "4": %> <img class= "mood" src="../test/4.jpg"><% 
		         break;
	    default:  %> <img class= "mood" src="../test/0.jpg"><% 
	         break;
	}
	
		//자연별 결과 이미지 
		switch(temp[3]) {
	    case "0": %> <img class= "nature" src="../test/0.jpg"><% 
	         break;
	    case "1": %> <img class= "nature" src="../test/1.jpg"><% 
	         break;
	    case "2": %> <img class= "nature" src="../test/2.jpg"><% 
		         break;
	    case "3": %> <img class= "nature" src="../test/3.jpg"><% 
		         break;
	    case "4": %> <img class= "nature" src="../test/4.jpg"><% 
		         break;
	    default:  %> <img class= "nature" src="../test/0.jpg"><% 
	         break;
	}
		
		//성격별 결과 이미지 
		switch(temp[5]) {
	    case "0": %> <img class= "character" src="../test/0.jpg"><% 
	         break;
	    case "1": %> <img class= "character" src="../test/1.jpg"><% 
	         break;
	    case "2": %> <img class= "character" src="../test/2.jpg"><% 
		         break;
	    case "3": %> <img class= "character" src="../test/3.jpg"><% 
		         break;
	    case "4": %> <img class= "character" src="../test/4.jpg"><% 
		         break;
	    default:  %> <img class= "character" src="../test/0.jpg"><% 
	         break;
	}
		%>
	<div id="explain" class="relative1">
		<button id="btn1">
			<img src="img\result_submit.png">
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<button id="btn3"
		onclick="location.href='https://www.nic-nagoya.or.jp/korean/' ">GO
		HOMEPAGE</button>
	<button id="btn4"
		onclick="location.href='https://kr.visitwakayama.jp/' ">GO
		HOMEPAGE</button>
	<button id="btn5"
		onclick="location.href='https://korean.ibarakiguide.jp/' ">GO
		HOMEPAGE</button>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
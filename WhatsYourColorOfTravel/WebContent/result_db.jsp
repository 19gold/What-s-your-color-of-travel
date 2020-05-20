<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DB.databases"%>
<%@page import="DB.DBvar"%>
<%@page import="DB.DBlist"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>결과로 나온 이미지추출</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	databases databases = new databases();
	DBvar dv = new DBvar();
	DBlist dl = new DBlist();
	Connection con = databases.getCon();
	System.out.println("surveyAnswer.jsp에서 DB연동 확인");
	String[] country = { "훗카이도", "혼슈", "시코쿠", "큐수", "오키나와" };
	String[] mood = { "조용한 분위기", "활기찬 분위기", "느긋한 분위기", "독특한 분위기", "이국적인 분위기" };
	String[] nature = { "산", "바다", "시골", "도시", "눈" };
	String[] activity = { "자연", "역사", "문화체험", "먹거리", "액티비티" };
	String[] character = { "활발한 성격", "느긋한 성격", "급한 성격", "온화한 성격", "게으른 성격" };
	String result = request.getParameter("result");
	System.out.println("result -.>" + result);
	String[] temp = result.split(",");
	String[] answer = new String[5];
	//System.out.println("#####1");
	String selectedCountry = country[Integer.parseInt(temp[0])];
	//System.out.println("#####2");
	String selectedMood = mood[Integer.parseInt(temp[1])];
	////System.out.println("#####3");
	String selectedNature = nature[Integer.parseInt(temp[2])];
	//System.out.println("#####4");
	String selectedActivity = activity[Integer.parseInt(temp[3])];
	//System.out.println("#####5");
	String selectedCharacter = character[Integer.parseInt(temp[4])];
	//System.out.println("#####6");
	System.out.println(selectedCountry);
	System.out.println(selectedMood);
	System.out.println(selectedNature);
	System.out.println(selectedActivity);
	System.out.println(selectedCharacter);
	System.out.println("jsp에서 값 받기 성공");
	dv.setLocation(selectedCountry);
	dv.setMood(selectedMood);
	dv.setNature(selectedNature);
	dv.setActivity(selectedActivity);
	System.out.println("dv.set~~");
	
	ArrayList<String> answers = dl.Asurvey(dv);
	for(String ans : answers) {//
		System.out.println(ans);
	
	}
	
	
	
%>
</body>
</html>
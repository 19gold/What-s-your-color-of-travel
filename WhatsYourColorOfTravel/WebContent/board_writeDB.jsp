<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="DB.databases"%>
<%@page import="DB.DBvar"%>
<%@page import="DB.DBlist"%>
<%@page import="java.util.*"%>
<%@page import="java.awt.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	databases databases = new databases();
	DBvar dv = new DBvar();
	DBlist dl = new DBlist();
	Connection con = null;
	Statement stmt = null;
	String id=null;
	id = (String)session.getAttribute("id");//세션 값 받음
	String title = request.getParameter("title");
	String local = request.getParameter("local");
	String oneIntro = request.getParameter("oneIntro");
	String img = request.getParameter("img");
	String truefalse = request.getParameter("input_check");	
	boolean truefalseCheck = false;
	System.out.println("title : "+title);
	System.out.println("local : "+local);
	
	if(truefalse==null){
		truefalseCheck=true;
	}
	
	try {
		con = databases.getCon();//DB연동하기
		System.out.println("board_writeDb에서 db연동 확인");
		stmt = con.createStatement();
		File imgfile = new File(img);
		FileInputStream fin = new FileInputStream(imgfile);
		String sql = "INSERT INTO reviews (id, area, title,image,oneIntro,truefalse) VALUES(?,?,?,?,?,?);";
		PreparedStatement pre = con.prepareStatement(sql);
		System.out.println("sql : "+sql);
		
		pre.setString(1,id);//id저장
		pre.setString(2, local);//지역저장
		pre.setString(3, title);	
		pre.setBinaryStream(4, fin, (int) imgfile.length());//Stream형의 파일 업로드
		pre.setString(5, oneIntro);
		pre.setBoolean(6,truefalseCheck);
		pre.executeUpdate();
		System.out.println("Inserting Successfully!");
		
		pre.close();
		con.close();
	} catch (Exception e) {
		System.out.println("resone " + e.getMessage());
		System.out.println("됐겠니? ㅅㅂ?");
	}
%>
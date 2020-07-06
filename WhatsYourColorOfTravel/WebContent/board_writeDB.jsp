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
<title>Insert an Image into MySQL Database</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	databases databases = new databases();
	
	FileInputStream fis = null;
	String id=null;
	id = (String)session.getAttribute("id");//세션 값 받음
	String title = request.getParameter("title");
	String local = request.getParameter("local");
	String oneIntro = request.getParameter("oneIntro");
	String img = request.getParameter("img");
	String truefalse = request.getParameter("OkNotcheck");	

	boolean truefalseCheck = false;
	System.out.println("truefalse : "+truefalse);
	System.out.println("title : "+title);
	System.out.println("local : "+local);
	
	if(truefalse!=null){
		truefalseCheck=true;
		System.out.println("truefalseCheck : "+truefalseCheck);
	}
	try {
		conn = databases.getCon();
		out.println("1<br>");
		out.println("conn : "+conn+"<br>");
		
		File image_img = new File(img);
		fis = new FileInputStream(image_img);
		out.println("2<br>");
		String sql = "INSERT INTO reviews (id, area, title,image,oneIntro,truefalse) VALUES(?,?,?,?,?,?);";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, local);
		pstmt.setString(3, title);
		//(InputStream)
		pstmt.setBinaryStream(4,  fis, (int)image_img.length());
		pstmt.setString(5,oneIntro);
		pstmt.setBoolean(6,truefalseCheck);
		
		
		
		int count = pstmt.executeUpdate();
		if (count > 0) {
			out.println("갑자기 성공");
		} else {
			out.println("안ㄷ뫼ㅠㅠㅠ");
		}
	} catch (Exception ex) {
		out.println("resone: " + ex.getMessage());
	} finally {
		try {
			if (rs != null) {
		rs.close();
		rs = null;
			}
			if (pstmt != null) {
		pstmt.close();
		pstmt = null;
			}
			if (conn != null) {
		conn.close();
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	%>
</body>
</html>
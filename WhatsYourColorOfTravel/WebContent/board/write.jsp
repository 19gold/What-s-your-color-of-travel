<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" 
    import="board.BoardBean"
    import="board.BoardDBbean"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 및 수정</title>
</head>
<body>
<%
        request.setCharacterEncoding("UTF-8");
	    BoardDBbean bdb = new BoardDBbean();
	    Connection conn = bdb.getConn();
        BoardBean bd = new BoardBean();            
      
        String writer = request.getParameter("writer");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String email = request.getParameter("email"); 
        String pass = request.getParameter("pass");
        String ip = request.getParameter("ip");
        
		bd.setWriter(writer);
		bd.setPass(pass);
		bd.setEmail(email);
		bd.setSubject(subject);
		bd.setContent(content);
		bd.setIp(ip);
		
		int result = bdb.insertBoard(bd);
		
		String msg = "게시판 수정 및 등록 실패";
		String url = "list.jsp";
		if(result == 1){
	        msg = "게시판 수정 및 등록 성공";
	        url = "list.jsp";
		}
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>
</body>
</html>
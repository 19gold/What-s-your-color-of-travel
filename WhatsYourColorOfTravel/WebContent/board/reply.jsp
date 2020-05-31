<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    import="java.util.*"
    import="board.DBconnection"
    import="board.BoardBean"
    import="board.BoardDBbean"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 등록</title>
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
        int ref = Integer.parseInt(request.getParameter("ref"));
        int ref_step = Integer.parseInt(request.getParameter("ref_step"));
        int re_level = Integer.parseInt(request.getParameter("re_level"));
        String ip = request.getParameter("ip");
        
		bd.setWriter(writer);
		bd.setPass(pass);
		bd.setEmail(email);
		bd.setSubject(subject);
		bd.setContent(content);
		bd.setRef(ref);
		bd.setRef_step(ref_step);
		bd.setRe_level(re_level);
		bd.setIp(ip);
		
		int result = bdb.upReply(ref, ref_step);
		int result2 = 0;
		if(result == 1){
			 result2 = bdb.replyBoard(bd);
		}

		String msg = "답글 수정 및 등록 실패";
		String url = "replyForm.jsp";
		if(result == 1){
	        msg = "답글 수정 및 등록 성공";
	        url = "list.jsp";
		}

%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>
</body>
</html>
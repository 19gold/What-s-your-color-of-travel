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
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("utf-8");
	int num = ((BoardBean)session.getAttribute("bd")).getNum();
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	BoardBean bd = new BoardBean();
	bd.setNum(num);
	bd.setContent(content);
	bd.setEmail(email);
	bd.setPass(pass);
	BoardDBbean bdb = new BoardDBbean();
	Connection conn= bdb.getConn();
	int result = bdb.updateBoard(bd);
	
	String msg = "";
	String url = "list.jsp";
	if (result == 1){
		msg = "게시글 수정이 완료되었습니다.";
	}else {
		msg = "게시글 수정에 실패했습니다";
	}
	%>
<script>
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>
<body>
</body>
</html>
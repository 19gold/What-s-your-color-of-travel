<%@page import="board.BoardDBbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    import="java.util.*"
    import="board2311.DBconnection"
    import="board2311.BoardDBbean"
    import="board2311.BoardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
</head>
<% request.setCharacterEncoding("utf-8");
	BoardDBbean bdb = new BoardDBbean();
	Connection conn= bdb.getConn();
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	String url;
	
	int result = bdb.checkPass(num, pass);
	if (result == 1){
		bdb.deleteBoard(num);
		url = "list.jsp";
		%>
		<script>
			alert("삭제 완료");
			location.href = "<%= url %>";
		</script>
	<%} else {
		%>
		<script>
			alert("삭제 실패");
			history.go(-1)";
		</script>
	<%
	}
	%>
<body>

</body>
</html>
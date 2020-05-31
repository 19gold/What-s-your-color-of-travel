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
<title>게시판 리스트</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function read(num){
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
</script>
</head>
<% request.setCharacterEncoding("utf-8");
	BoardDBbean bdb = new BoardDBbean();
	Connection conn= null;
	conn = bdb.getConn();
	Vector<BoardBean> boardList = bdb.selectBoard();
	int total  = 0;
   	if(boardList != null){
	   total  = bdb.getBoardCount();   
   	}	%>
<body bgcolor="#FFFFCC">
	<div align="center">
	<br/>
	<h3>Nyel Board</h3>
	<br/>
	<table align="center" width="600">
		<tr>
			<td>Total : <font color="red"><%= bdb.getBoardCount() %></font> Articles</td>
		</tr>
	</table><table align="center" width="600" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
			<% int cnt = boardList.size();
				  if (cnt== 0) {
					out.println("등록된 게시물이 없습니다.");
				  } else {
			%>
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<td>번 호</td>
						<td>제 목</td>
						<td>작성자</td>
						<td>날 짜</td>
						<td>조회 수</td>
					</tr>
					<%
					for (int i = 0;i<cnt; i++) {							
						BoardBean bd = boardList.get(i);
						String regdate = bd.getRegdate();
						String date = regdate.substring(0, 4)+"."+regdate.substring(4,6)+"."+regdate.substring(6,8)+(". ")+regdate.substring(8,10)+(":")+regdate.substring(10,12)+(":")+regdate.substring(12,14);
						int re_level = bd.getRe_level();
					%>
					<tr>
						<td align="center">							
						    <%= i+1 %>
						</td>
						<td>
						<% if(re_level > 0){
							for(int j = 0; j < re_level; j++){
								out.println("&nbsp;&nbsp;");
							}
						}
						%>
						<a href="javascript:read('<%= bd.getNum() %>')"><%= bd.getSubject() %></a></td>
						<td align="center"><%= bd.getWriter() %></td>
						<td align="center"><%= date %></td>
						<td align="center"><%= bd.getReadcnt() %></td>
						</tr>
					<%}//for%>
				</table> <%
 			}//if
 		%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><br /><br /></td>
		</tr>		
		<tr>
				<td align="right">
					<a href="writeForm.jsp">[글쓰기]</a>					
				</td>
		</tr>
		</table>
	<hr width="600"/>	
	<form name="readFrm" method="post">
		<input type="hidden" name="num">
	</form>
</body>
</html>
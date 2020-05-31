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
<title>게시판</title>
</head>
<script type="text/javascript">
	function reply(num) {
		document.replyFrm.num.value=num;
		document.replyFrm.action = "replyForm.jsp";
		document.replyFrm.submit();
	}
	
	function del(num) {
		document.delFrm.num.value=num;
		document.delFrm.delyn.value="y";
		document.delFrm.action = "checkPass.jsp";
		document.delFrm.submit();
	}
	
	function update(num) {
		document.upFrm.num.value=num;
		document.upFrm.delyn.value="n";
		document.upFrm.action = "checkPass.jsp";
		document.upFrm.submit();
	}
</script>
<%
    request.setCharacterEncoding("UTF-8");  
    int num = Integer.parseInt(request.getParameter("num"));
    BoardDBbean bdb = new BoardDBbean();       
    Connection conn= bdb.getConn();
    BoardBean bd = bdb.readBoard(num);
    bdb.updateReadcnt(num);
    session.setAttribute("bd", bd);
%>
<body bgcolor="#FFFFCC">
<p/>
<table width="600" cellpadding="3" align="center">
	<tr>
		<td bgcolor="#FFCCCC" height="25" align="center">게시판 글 읽기</td>
	</tr>
</table>
<br/>
<form method="post" action="writeForm.jsp">
<table width="600" cellpadding="3" align="center">
	<tr><td colspan="2" align="center" height="10"><%= num %></td></tr>
	<tr>
		<td width="10%" align="center" bgcolor="#D0D0D0">제 목</td>
		<td width="90%" bgcolor="#FFFFFF">
		<%=bd.getSubject() %></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#D0D0D0">작성자</td>
		<td bgcolor="#FFFFFF">
		<%=bd.getWriter() %></td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="#FFFFFF" height="150"><%=bd.getContent() %></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#D0D0D0">이메일</td>
		<td bgcolor="#FFFFFF">
		<%=bd.getEmail() %></td>
	</tr>
	<tr>
		<td width="15%" align="center" bgcolor="#D0D0D0">비밀번호</td>
		<td bgcolor="#FFFFFF">
		<input type="password" name="pass" size="15" maxlength="15" readonly value="<%= bd.getPass() %>"></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
	<tr>
		<td colspan="2">
			 <input type="button" value="수정하기" onClick="javascript:location.href='javascript:update(<%=bd.getNum()%>)'">				        
			 <input type="button" name= "reply"  value="댓글달기" onClick="javascript:location.href='javascript:reply(<%=bd.getNum()%>)'">
			 <input type="button" name= "delete" value="삭제하기" onClick="javascript:location.href='javascript:del(<%=bd.getNum()%>)'">
			 <input type="button" value="리스트" onClick="javascript:location.href='list.jsp'">
		</td>
	</tr>
</table>
<input type="hidden" name="num" value="<%= bd.getNum() %>">
</form>
<form name="replyFrm" method="get">
	<input type="hidden" name="num">
</form>
<form name="upFrm" method="get">
	<input type="hidden" name="num">
	<input type="hidden" name="delyn">
</form>
<form name="delFrm" method="get">
	<input type="hidden" name="num">
	<input type="hidden" name="delyn">
</form>
</div>
</body>
</html>
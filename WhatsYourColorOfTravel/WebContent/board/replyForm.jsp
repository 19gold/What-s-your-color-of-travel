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
<title>게시판 등록 및 수정</title>
</head>
<%
    request.setCharacterEncoding("UTF-8"); 
	BoardBean bd = new BoardBean();
	bd = (BoardBean)session.getAttribute("bd");
%>
<body bgcolor="#FFFFCC">
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="#CCCCCC" height="25" align="center">답변 쓰기</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="reply.jsp">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td width="10%">작성자</td>
		<td width="90%">
		<input name="writer" size="10" maxlength="8"></td>
	</tr>
	<tr>
		<td>제 목</td>
		<td>
		<input name="subject" size="50" maxlength="30" value="답변 : <%= bd.getSubject() %>" ></td>
	</tr>
	<tr>
		<td>내 용</td>
		<td><textarea name="content" rows="12" cols="50">
		<%= bd.getContent() %>
		======== 답변 글을 쓰세요 ========
		</textarea></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" size="20" maxlength="50"></td>
	</tr>
	<tr>
		<td width="15%">비밀 번호</td>
		<td><input type="password" name="pass" size="15" maxlength="15"></td>
	</tr>
	<tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
	<tr>
		<td colspan="2">
			 <input type="submit" value="등록">
			 <input type="reset" value="다시쓰기">
			 <input type="button" value="리스트" onClick="javascript:location.href='list.jsp'">
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
<input type="hidden" name="ref" value="<%= bd.getRef() %>">
<input type="hidden" name="ref_step" value="<%= bd.getRef_step() %>">
<input type="hidden" name="re_level" value="<%= bd.getRe_level() %>">
</form>
</div>
</body>
</html>
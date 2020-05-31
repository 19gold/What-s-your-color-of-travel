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
<title>게시판 등록 및 수정</title>
</head>
<script>
	function check(){
		const writer = document.postFrm.writer.value;
		const subject = document.postFrm.subject.value;
		const content = document.postFrm.content.value;
		const email = document.postFrm.email.value;
		const password = document.postFrm.password.value;
		
		if(writer.equals("") || writer == null){
			
		}
	}
</script>
<%
    request.setCharacterEncoding("UTF-8");  
%>
<body bgcolor="#FFFFCC">
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="#FFCCCC" height="25" align="center">게시글 작성</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="write.jsp">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">작성자</td>
				<td width="90%">
				<input name="writer" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
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
					 <input type="submit" value="등록" onClick="javascript:check()">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onClick="javascript:location.href='list.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>
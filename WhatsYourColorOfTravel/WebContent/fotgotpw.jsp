<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>What's your color of travel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="forgotpw.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="findpw.jsp" method="post">
		<table>

			<tr>
				<td class="left">#NAME</td>
				<td><input type="text" id="fdname" name="name" required
					oncontextmenu="return false"></td>
			</tr>
			<tr>
				<td class="left">#ID</td>
				<td><input id="fdid" type="text" name="id" required
					oncontextmenu="return false"></td>
			</tr>

			<tr>
				<td colspan=" 2"><!-- <a href="findpw.jsp"> -->
						<button type="submit" class="enter" id="ent">FIND</button>
				<!--  </a>--></td>
			</tr>
		</table>
	</form>
</body>
</html>
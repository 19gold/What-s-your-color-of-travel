<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="DB.databases"%>
<%@page import="DB.DBvar"%>
<%@page import="DB.DBlist"%>

<%

String Num = request.getParameter("num");
int real_num = Integer.parseInt(Num);
System.out.println("num SchoolNum : "+real_num);


Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Statement stmt = null;


DBvar var = new DBvar();
DBlist list = new DBlist();
int result = 0;

var.setNum(real_num);

result=list.likeCount(var);

if(result!=1){
%>
	<script>
	alert('좋아요가 정상적으로 처리되지 않았습니다.');
	location.replace('viewReview.jsp');
	</script>
	
<%
}else{
%>
	<script>
	location.replace('viewReview.jsp');
	aler('좋아요 : '+<%=result%>);
	</script>
	<%
}
%>

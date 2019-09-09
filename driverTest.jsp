<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 드라이버 테스트 </h2>
<%
	Connection conn=null;
	
	try{
		String url="jdbc:mysql://localhost:3306/mirim";
		String user="test";
		String password="1234";
		
		Class.forName("com.mysql.jdbc.Driver"); //WEB-INF에 넣어준 드라이버 불러오기
		conn=DriverManager.getConnection(url, user, password);
		out.println("연결성공");
		//url= 어디, 포트번호, 데이터베이스
				
		
	}catch(Exception e){
		out.println("연결실패");
		e.printStackTrace();
	}
%>
</body>
</html>
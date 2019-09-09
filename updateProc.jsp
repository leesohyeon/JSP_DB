<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
String name=request.getParameter("name");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String url="jdbc:mysql://localhost:3306/mirim";
	String user="test";
	String pass="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,user,pass);
	String sql="select id,passwd from member where id=?";
	pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String rPasswd=rs.getString(passwd);
		if(passwd.equals(rPasswd)){
			sql="update member set name = ? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		}else{
			out.println("비밀번호를 다시 입력해주세요");
		}
		
	}else{
		out.println("아이디가 존재하지 않습니다.");
	}
}catch(Exception e){
	
}finally{
	if(rs!=null){ try{ rs.close();}catch(Exception e){e.printStackTrace(); }}
	if(pstmt!=null){ try{ pstmt.close();}catch(Exception e){e.printStackTrace(); }}
	if(conn!=null){ try{ conn.close();}catch(Exception e){e.printStackTrace(); }}
}
%>
<meta http-equiv='refresh' content='1;url=selectTest.jsp'>
</body>
</html>
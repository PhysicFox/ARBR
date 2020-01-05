<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String aduser=request.getParameter("auser");
String adpassword=request.getParameter("apassword");
String adidentity=request.getParameter("aidentity");
String junior=request.getParameter("junior");
Connection con;//                                     |这
Statement sql;//                                      |
ResultSet rs;// 

try{ Class.forName("com.mysql.jdbc.Driver");
}catch (Exception e){
	out.println(e);	
}
try{

	String a="jdbc:mysql://localhost/sportmanage?characterEncoding=utf-8";
	String b="root";
	String c="12345678";
	
	con=DriverManager.getConnection(a,b,c);		
	sql=con.createStatement();	
	
	rs=sql.executeQuery("select max(smid) from systemid ");
	rs.next();
	int sid=rs.getInt(1);
	sid=sid+1;	
	//sql.executeUpdate("INSERT INTO systemid VALUES("+sid+",'aa','bb','cc')");
	sql.executeUpdate("INSERT INTO systemid VALUES("+sid+",'"+aduser+"','"+adpassword+"','"+adidentity+"','"+junior+"')");
}catch (Exception e){
	out.println(e);	
}

response.sendRedirect("show_to_you.jsp");

%>
</body>
</html>

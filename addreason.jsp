<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加扣分记录</title>
</head>
<body>
<%
String identity=(String)session.getAttribute("identity");
request.setCharacterEncoding("UTF-8");
String adreason=request.getParameter("reason"); 

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
	rs=sql.executeQuery("select max(id) from reasons ");
	rs.next();
	int sid=rs.getInt(1);
	sid=sid+1;	
	//sql.executeUpdate("INSERT INTO systemid VALUES("+sid+",'aa','bb','cc')");
	sql.executeUpdate("INSERT INTO reasons VALUES("+sid+",'"+identity+"','"+adreason+"')");
}catch (Exception e){
	out.println(e);	
}
if(identity.equals("nansubu")||identity.equals("nvsubu")){
	response.sendRedirect("dormitory_manage.jsp");
}
else{
	response.sendRedirect("show_to_you2.jsp");
}


%>



</body>
</html>
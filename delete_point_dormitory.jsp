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

String table[] = new String[12];
table[0] = "dormitory"; // 第一个元素
table[1] = "dormitory1";
table[2] = "dormitory2";
table[3] = "dormitory3";
table[4] = "dormitory4";
table[5] = "dormitory5";
table[6] = "dormitory6";
table[7] = "dormitory7";
table[8] = "dormitory8";
table[9] = "dormitory9";
table[10] = "dormitory10";
table[11] = "dormitory11";

String sid=request.getParameter("id");
int iid=Integer.valueOf(sid).intValue();
String tablen=request.getParameter("tablen");
int tablenum=Integer.valueOf(tablen).intValue();

Connection con;
Statement sql;
ResultSet rs;
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
	
	sql.executeUpdate("UPDATE "+table[tablenum]+" SET 有效 = 0 WHERE id="+iid);
}catch (Exception e){
	out.println(e);	
}

response.sendRedirect("dormitory_manage.jsp?id="+sid);
%>
</body>
</html>
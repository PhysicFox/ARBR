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
table[0] = "total"; // 第一个元素
table[1] = "total1";
table[2] = "total2";
table[3] = "total3";
table[4] = "total4";
table[5] = "total5";
table[6] = "total6";
table[7] = "total7";
table[8] = "total8";
table[9] = "total9";
table[10] = "total10";
table[11] = "total11";

String sid=request.getParameter("id");
String tablen=request.getParameter("tablen");
int iid=Integer.valueOf(sid).intValue();
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

response.sendRedirect("show_to_you2.jsp?id="+sid);
%>
</body>
</html>
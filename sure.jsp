<%@ page language="java" contentType="text/html; charset=GB2312" 
    pageEncoding="gb2312"%>
  
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<% 

String sid=request.getParameter("id");
int iid=Integer.valueOf(sid).intValue();

out.print(iid);
out.print("<a href=index.jsp?id="+sid+">you are sure</a>");//??????

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
	
	sql.executeUpdate("DELETE FROM systemid WHERE smid="+iid);
}catch (Exception e){
	out.println(e);	
}

response.sendRedirect("show_to_you.jsp?id="+sid);
%>
</body>
</html>
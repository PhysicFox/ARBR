<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>密码长度不得超过8</h1>
<%

request.setCharacterEncoding("UTF-8");
String aduser=(String)session.getAttribute("user");//用户始终带有的信息
String addepartment=(String)session.getAttribute("identity");
String adclass=request.getParameter("class");
String addate=request.getParameter("date");
String point=request.getParameter("point");
String adreason=request.getParameter("reason");
String junior=(String)session.getAttribute("junior");

String a="jdbc:mysql://localhost/sportmanage?characterEncoding=utf-8";//输入格式为汉字
String b="root";
String c="12345678";

Connection con;//                                     |这
Statement sql;//                                      |
ResultSet rs,rss,sess_rs;//
%>
<form action="changepassword.jsp" method="post">
<table border=1>
   <tr>
       <th>Formal Password</th>
       <th>New Password</th>
       <th>Confirm Password</th>
       <th> </th>
   </tr>
   <tr>      
       <td><input type="password" name="old"></td>
       <td><input type="password" name="new"></td>
       <td><input type="password" name="newagain"></td>
       <td><input type="submit" value="确定"></td>
  </tr> 
     

</table>         
     
  </form>
<%
String old=(String)request.getParameter("old");
String new1=(String)request.getParameter("new");
String new2=(String)request.getParameter("newagain");


try{ Class.forName("com.mysql.jdbc.Driver");
}catch (Exception e){
	out.println(e);	
}
try{


//	String identity=(String)session.getAttribute("identity");	
	con=DriverManager.getConnection(a,b,c);		
	sql=con.createStatement();
	rss=sql.executeQuery("SELECT * FROM systemid where user='"+aduser+"'and password='"+old+"'");
	int confirm=0;
	String id="0";
	while(rss.next()){
		  confirm=1;//验证成功
		  id=rss.getString("smid");
	 }
// Fair Young
	if(new1.equals(new2)&&confirm==1){
		sql.executeUpdate("UPDATE systemid SET password = "+new1+" WHERE smid="+id);
		response.sendRedirect("change2.jsp");
	}
	else{
		response.sendRedirect("change1.jsp");
	}

	
	
	if(confirm==3){
		response.sendRedirect("changepassword.jsp");
	}
}
catch (Exception e){
	out.println(e);
}
		

%>
<%
	if (session.getAttribute("identity").equals("minister")||session.getAttribute("identity").equals("president")||session.getAttribute("identity").equals("shitman"))
		out.print("<h2><a href=show_to_you.jsp>回到上一级</h2>");
	else if (session.getAttribute("identity").equals("nansubu")||session.getAttribute("identity").equals("nvsubu"))
		out.print("<h2><a href=dormitory_manage.jsp>回到上一级</h2>");
	else if (session.getAttribute("identity").equals("mishuchu"))
		out.print("<h2><a href=class_manage.jsp>回到上一级</h2>");
	else if(session.getAttribute("identity").equals("banzhuren"))
		out.print("<h2><a href=formulierung.jsp>回到上一级</h2>");
	else
		out.print("<h2><a href=show_to_you2.jsp>回到上一级</h2>");
%>
<h2><a href=index.html>退出</a></h2>
<%--------------------------------------------------- --%>

  <%--------------------------------------------------- --%>

</body>
</html>
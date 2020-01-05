<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>修改成功</h1>
<h2><a href=sb.html>退出</a></h2>
<%
try
{
		if (session.getAttribute("identity").equals("minister")||session.getAttribute("identity").equals("president")||session.getAttribute("identity").equals("shitman"))
			out.print("<h2><a href=show_to_you.jsp>返回</h2>");
		else if (session.getAttribute("identity").equals("nansubu")||session.getAttribute("identity").equals("nvsubu"))
			out.print("<h2><a href=dormitory_manage.jsp>>返回</h2>");
		else if (session.getAttribute("identity").equals("mishuchu"))
			out.print("<h2><a href=class_manage.jsp>>返回</h2>");
		else if(session.getAttribute("identity").equals("banzhuren"))
			out.print("<h2><a href=formulierung.jsp>>返回</h2>");
		else
			out.print("<h2><a href=show_to_you2.jsp>>返回</h2>");
}
catch (Exception e)
{
	out.println(e);
}
%>
<!-- <h2><p><a  href=scott>回到主页面</a></p></h2> -->
</body>
</html>
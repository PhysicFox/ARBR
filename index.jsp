<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>

<title>叽歪量化系统</title>
</head>
<body>

<%
request.setCharacterEncoding("gb2312");//收到的为汉字

String user=request.getParameter("a1");
String password=request.getParameter("a2");
String junior="0";
session.setAttribute("user",user);//用户始终带有的信息
session.setAttribute("password",password);


Connection con;//                                     |这
Statement sql;//                                      |
ResultSet rs,rss;//                                       |
try{ Class.forName("com.mysql.jdbc.Driver");//        |些
}catch (Exception e){//                               |
	out.println(e);	//                                |
}//                                                   |都
try{//                                                |
//                                                    |
	String a="jdbc:mysql://localhost/sportmanage?serverTimezone=GMT%2B8";//  |是
	String b="root";//                                |
	String c="12345678";//                            |
	//                                                |链接
	con=DriverManager.getConnection(a,b,c);//         |
	//                                                |
	sql=con.createStatement();//                      |数据库

	if (user.equals("hub") && password.equals("sxmhub"))
		response.sendRedirect("moxingshi.html");
	else if(user.equals("zhangzhe")&& password.equals("9787532736553"))
		response.sendRedirect("html index/jump.html");
	
	rs=sql.executeQuery("select * from systemid where user='"+user+"' and password='"+password+"'");//执行数据库查询

	int confirm=0;//判断是否登录
	String identity="";
	while(rs.next()){
		  confirm=1;//验证成功
		  identity=rs.getString("id");
		  junior=rs.getString("junior");
	 }
	session.setAttribute("identity",identity);
	session.setAttribute("junior",junior);



	if(confirm==1){
		if(identity.equals("nansubu")||identity.equals("nvsubu")){
			response.sendRedirect("dormitory_manage.jsp");
		}
		if(identity.equals("mishuchu")){
			response.sendRedirect("class_manage.jsp");
		}
		if(identity.equals("minister")||identity.equals("president")||identity.equals("shitman")){

			response.sendRedirect("show_to_you.jsp");//转到用户界面
		}
		if(identity.equals("banzhuren")){

			response.sendRedirect("formulierung.jsp");//转到用户界面
		}
		else{
			response.sendRedirect("show_to_you2.jsp");
		}
	}

	else{
		out.print("<h1><a href=index.html>wrong username or password click to return</a></h1>");//返回登录界面
	}

	con.close();

}catch (Exception e){//抓捕错误
	out.println(e);
}
%>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>

<title>叽歪量化系统</title>
</head>
<body>

<%

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
	
	
/*	String userc,passwordc;
//	userc="";
//	int confirm=0;
	
//	out.println("a2");
	
//	while(rs.next()){
//	  userc=rs.getString("name(user)");
//	  passwordc=rs.getString("password");
//	  if(session.getAttribute("user").equals(userc)&&session.getAttribute("password").equals(passwordc)){
//		  confirm=1;
//		  break;
//	  }	  
//	}
//	if(confirm==1){ */
		%>
<h1>Welcome! <%= session.getAttribute("user") %><br></h1>
<h2><a href=sb.html>退出</a></h2>

<br>
<br>

    

<%	

    if(session.getAttribute("user").equals("liuxinxin")||session.getAttribute("user").equals("liuyiyao")||session.getAttribute("user").equals("larryliu")){//用户信息与现实情况进行比较
    	%>
    	<h1>你真帅</h1>
    	<h2><a href=changepassword.jsp>修改密码</a> </h2>
    	<h2><a href=Add_member.jsp>添加用户</a></h2>
    	<% 
    	
    	rs=sql.executeQuery("select * from systemid ");
    	out.print("<table border=1>");//表格
    	out.print("<tr>");//一行
    	out.print("<th width=100> name </th>");//<th>为表头
        out.print("<th width=100> identity </th>");
        out.print("<th width=100> delete </th>");
    	out.print("</tr>");//本行结束
    	while(rs.next()){//下一条存放数据库的类的信息
    	  out.print("<tr>");
          out.print("<td>"+rs.getString("user")+"</td>");//td为换列
    	  out.print("<td>"+rs.getString("id")+"</td>");
    	  int ida=rs.getInt("smid");
    	  out.print("<td>"+"<a href=sure.jsp?id="+ida+">删除</a>"+"</td>");
    	  out.print("</tr>");	  
    	 
    	}	
    	out.print("</table>");
    	%>
    	
<%
    	
    }
    else{
    	out.print("<h1>你太丑了</h1>");
    }
    
//	}
	
//	else{
//		out.print("<h1><a href=sb.html>wrong username or password click to return</a></h1>");
//	}

	con.close();
	
}catch (Exception e){
	out.println(e);	
}	
%>

</body>
</html>
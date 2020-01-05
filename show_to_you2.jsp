<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.text.*" %>

<html>
<head>

<title>叽歪量化系统</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
	String identity=(String)session.getAttribute("identity");
	String user=(String)session.getAttribute("user");
	String junior=(String)session.getAttribute("junior");
	
%>
<h1>Welcome! <%=identity%> <%=user%></h1>

<h2><a href=sb.html>退出</a>   <a href=add_point.jsp>扣分原因添加</a> </h2>
	<h2><a href=changepassword.jsp>修改密码</a> </h2>
<!--  ------------------- 添加模块form ------------------->
<%

long now=System.currentTimeMillis();
SimpleDateFormat aDate=new SimpleDateFormat("yyyy-MM-dd");
String ddate=aDate.format(now);

String a="jdbc:mysql://localhost/sportmanage?characterEncoding=utf-8";//输入格式为汉字
String b="root";
String c="12345678";

Connection con;//                                     |这
Statement sql;//                                      |
ResultSet rs,rss,sess_rs;// 

try{ Class.forName("com.mysql.jdbc.Driver");
}catch (Exception e){
	out.println(e);	
}
try{


//	String identity=(String)session.getAttribute("identity");	
	con=DriverManager.getConnection(a,b,c);		
	sql=con.createStatement();
	
	rss=sql.executeQuery("SELECT * FROM reasons where 部门='"+identity+"'");
	

%>

<form action="execute_add_point.jsp" method="post">
<table border=1>
   <tr>
       <th>班级</th>
       <th>扣分日期</th>
       <th>扣分</th>
       <th>扣分原因</th>
   </tr>
   <tr>      
       <td><input type="text" name="class"></td>
       <td><input type="text" name="date" value=<%=ddate%>></td>
       <td><input type="text" name="point"></td>
       <td>
	    <select name="reason">
		<%
		String actually;
				
		while(rss.next()){			
				out.println("<option value="+rss.getString("原因")+">"+rss.getString("原因")+"</option>");
				out.print("<br>");
			}
}catch (Exception e){
	out.println(e);	
}
		%>
	</select>
       </td>
        </tr>        

</table>         
<input type="submit" value="添加">     
  </form>

<!--  ------------------- 查询模块form ------------------->

<form action="show_to_you2.jsp" method="post">
日期：从 <input type="date" name="fromdate" value=<%=ddate%>> 到  <input type="date" name="todate" value=<%=ddate%>> <input type="submit" value="查询">   
 
</form>

<!--  ------------------- 显示记录集内容------------------->

<table border=1>
 <tr>
	<th width=100> 班级</th>
    <th width=100> 扣分部门 </th>
    <th width=100> 扣分日期 </th>
    <th width=100> 扣分人 </th>
    <th width=100> 扣分 </th>
    <th width=100> 扣分原因 </th>
  </tr>

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

String fromda=request.getParameter("fromdate");
String toda=request.getParameter("todate");
try{
	con=DriverManager.getConnection(a,b,c);	
	sql=con.createStatement();	
 
	
   if (fromda==null){
	   for(int i=0;i<12;i++){
			sess_rs=sql.executeQuery("select * from "+table[i]+" where junior='"+junior+"' and 扣分部门='"+identity+"' and 有效=1");
 			int tablenum=i;  
			  while(sess_rs.next()){//下一条存放数据库的类的信息		
					out.print("<tr>");        	
		        	out.print("<td>"+sess_rs.getString("班级")+"</td>");//td为换列
		  	    	out.print("<td>"+sess_rs.getString("扣分部门")+"</td>");
			     	out.print("<td>"+sess_rs.getString("扣分日期")+"</td>");
		  		    out.print("<td>"+sess_rs.getString("扣分人姓名")+"</td>");
		     		out.print("<td>"+sess_rs.getString("扣分")+"</td>");
		     		out.print("<td>"+sess_rs.getString("原因")+"</td>");
			  	    int ida=sess_rs.getInt("id");
		  		    out.print("<td>"+"<a href=execute_delete_point.jsp?id="+ida+"&tablen="+tablenum+">删除</a>"+"</td>");//跳转页面错误
		  	    	out.print("</tr>");	  
			    }
		 
//		  	out.print("</table>");
			
	   }
	   out.print("</table>");
//    	sess_rs=sql.executeQuery("select * from total where junior='"+junior+"' and 扣分部门='"+identity+"' and 有效=1"); 
    }else{
    	out.print(fromda);
        out.print("<br>");
    	out.print(toda);
 	   for(int i=0;i<12;i++){
 		   	sess_rs=sql.executeQuery("select * from "+table[i]+" where junior='"+junior+"' and 扣分部门='"+identity+"' and 有效=1 and 扣分日期>='"+fromda+"' and 扣分日期<='"+toda+"'");
 			int tablenum=i;  
 		   	while(sess_rs.next()){//下一条存放数据库的类的信息
 				  out.print("<tr>");        	
 		        	out.print("<td>"+sess_rs.getString("班级")+"</td>");//td为换列
 		  	    	out.print("<td>"+sess_rs.getString("扣分部门")+"</td>");
 			     	out.print("<td>"+sess_rs.getString("扣分日期")+"</td>");
 		  		    out.print("<td>"+sess_rs.getString("扣分人姓名")+"</td>");
 		     		out.print("<td>"+sess_rs.getString("扣分")+"</td>");
 		     		out.print("<td>"+sess_rs.getString("原因")+"</td>");
 			  	    int ida=sess_rs.getInt("id");
 		  		    out.print("<td>"+"<a href=execute_delete_point.jsp?id="+ida+"&tablen="+tablenum+">删除</a>"+"</td>");//跳转页面错误
 		  	    	out.print("</tr>");	  
 			    }
 		 
// 		  	out.print("</table>");
 			
 	   }
 	  out.print("</table>");
//    	sess_rs=sql.executeQuery("select * from total where junior='"+junior+"' and 扣分部门='"+identity+"' and 有效=1 and 扣分日期>='"+fromda+"' and 扣分日期<='"+toda+"'");
   }


//if(fromda.equals(""))
//  sess_rs=sql.executeQuery("select * from total where 扣分部门='"+identity+"' and 有效=1");
//else
//  sess_rs=sql.executeQuery("select * from total where 扣分部门='"+identity+"' and 有效=1 and 扣分日期>="+fromda+" and 扣分日期<="+toda);
  
//  for(int i=0;i<12;i++){
	  
//  }
/*  while(sess_rs.next()){//下一条存放数据库的类的信息		
			out.print("<tr>");        	
        	out.print("<td>"+sess_rs.getString("班级")+"</td>");//td为换列
  	    	out.print("<td>"+sess_rs.getString("扣分部门")+"</td>");
	     	out.print("<td>"+sess_rs.getString("扣分日期")+"</td>");
  		    out.print("<td>"+sess_rs.getString("扣分人姓名")+"</td>");
     		out.print("<td>"+sess_rs.getString("扣分")+"</td>");
     		out.print("<td>"+sess_rs.getString("原因")+"</td>");
	  	    int ida=sess_rs.getInt("id");
  		    out.print("<td>"+"<a href=execute_delete_point.jsp?id="+ida+">删除</a>"+"</td>");//跳转页面错误
  	    	out.print("</tr>");	  
	    }
 
  	out.print("</table>");*/
  	
}catch (Exception e){//抓捕错误
	out.println(e);	
}
%>

</body>
</html>
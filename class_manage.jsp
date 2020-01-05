
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
<%
    request.setCharacterEncoding("UTF-8");
	String identity=(String)session.getAttribute("identity");
	String user=(String)session.getAttribute("user");
	String junior=(String)session.getAttribute("junior");
	
	
	long now=System.currentTimeMillis();//日期
	SimpleDateFormat aDate=new SimpleDateFormat("yyyy-MM-dd");
	String ddate=aDate.format(now);
	
%>
<h1>Welcome! <%= session.getAttribute("user") %><br></h1>
<h2><a href=changepassword.jsp>修改密码</a> </h2>
<h2><a href=sb.html>退出</a></h2><br>
<!--  ------------------- 查询模块form ------------------->

<form action="class_manage.jsp" method="post">
日期：从 <input type="date" name="fromdate" value=<%=ddate%>> 到  <input type="date" name="todate" value=<%=ddate%>> <input type="submit" value="查询">   
 
</form>

<%

Connection con;
Statement sql;
ResultSet rs,current;

String fromda=request.getParameter("fromdate");
String toda=request.getParameter("todate");

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
//	rs=sql.executeQuery("select * from total where junior='"+junior+"' and 有效=1 and 扣分日期>='"+fromda+"' and 扣分日期<='"+toda+"'");
			
	String department[] = new String[9];
	department[0] = "xuexibu"; // 第一个元素
	department[1] = "zilvbu"; // 第二个元素
	department[2] = "weishengbu"; // 第三个元素
	department[3] = "tiyubu"; // 第一个元素
	department[4] = "gongwubu"; // 第二个元素
	department[5] = "shenghuobu"; // 第三个元素
	department[6] = "wenyibu"; // 第一个元素
	department[7] = "nansubu"; // 第二个元素
	department[8] = "nvsubu"; // 第三个元素

%>
	<table border=1>
	   <tr>
	       <th>班级</th>
	       <th>学习部</th>
	       <th>自律部</th>
	       <th>卫生部</th>
	       <th>体育部</th>
	       <th>公物部</th>
	       <th>生活部</th>
	       <th>文艺部</th>
	       <th>男宿部</th>
	       <th>女宿部</th>
	   </tr>
	   <tr>      
			<%

			  for(int j=1;j<=16;j++){
				out.print("<tr>");
				for(int i=0;i<10; i++){
				  float sum = 0;
				  if(i==0){
					  out.print("<td>"+j+"</td>");
					  continue;
				  }
				  for(int l=0;l<12;l++){
					  current=sql.executeQuery("select sum(扣分) from "+table[l]+" where 扣分部门='"+department[i-1]+"' and 班级="+j+" and 有效=1 and 扣分日期>='"+fromda+"' and 扣分日期<='"+toda+"' and junior = '"+junior+"'");
				      current.next();
					  float note=0;
					  note=current.getFloat(1);
					  sum=sum+note;
				  }
				  
//				  current=sql.executeQuery("select sum(扣分) from total where 扣分部门='"+department[i-1]+"' and 班级="+j+" and 有效=1 and 扣分日期>='"+fromda+"' and 扣分日期<='"+toda+"'"); 
	//		      current.next();
		//		  float note=current.getFloat(1);
				  
				  
				  
				  out.print("<td>"+-sum+"</td>");
				  				  
			    }
			    out.print("</tr>");  
			  }
				

			
	
			%>
	        </tr>        

	</table>
	



<br>

    

<%	

	con.close();
	
}catch (Exception e){
	out.println(e);	
}	
%>


</body>
</html>
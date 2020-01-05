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
request.setCharacterEncoding("UTF-8");
String aduser=(String)session.getAttribute("user");//用户始终带有的信息
String addepartment=(String)session.getAttribute("identity");
String adroom=request.getParameter("room");
String adbed=request.getParameter("bed");
String adclass=request.getParameter("class");  //
String addate=request.getParameter("date");
String point=request.getParameter("point");
String adreason=request.getParameter("reason");
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
float adpoint=Float.parseFloat(point);

int addroom=Integer.valueOf(adroom).intValue();
int addclass=Integer.valueOf(adclass).intValue();

Connection con;
Statement sql;
ResultSet rs;

try{ Class.forName("com.mysql.jdbc.Driver");
}catch (Exception e){
	out.println(e);	
}
try{

	String a="jdbc:mysql://localhost/sportmanage?characterEncoding=utf-8&serverTimezone=GMT%2B8";
	String b="root";
	String c="12345678";
	con=DriverManager.getConnection(a,b,c);		
	sql=con.createStatement();	
	
	
	
	int maxid=0,n;
	for(int i=0;;i++){
		rs=sql.executeQuery("select max(id) from "+table[i]+" ");
		rs.next();	
		maxid=rs.getInt(1);
		n=i;
		out.println(maxid);
		
		if(maxid!=999){
			break;
		}

	}
	maxid++;

	
//	sql.executeUpdate("INSERT INTO "+table[n]+" VALUES("+maxid+",'"+addroom+"',"+adbed+",'"+addate+"',"+adpoint+",'"+adreason+"','"+addepartment+"',1)");	
	sql.executeUpdate("INSERT INTO "+table[n]+" VALUES("+maxid+",'"+addroom+"','"+addclass+"',"+adbed+",'"+addate+"',"+adpoint+",'"+adreason+"','"+addepartment+"',1)");	

	
	
	
	
/*	rs=sql.executeQuery("select max(id) from dormitory ");
	rs.next();
	int sid=rs.getInt(1);
	sid=sid+1;	
	
	sql.executeUpdate("INSERT INTO dormitory VALUES("+sid+",'"+addclass+"',"+adbed+",'"+addate+"',"+adpoint+",'"+adreason+"','"+addepartment+"',1)");	
	//sql.executeUpdate("INSERT INTO total VALUES("+sid+",'"+adclass+"','"+addepartment+"',1,'"+addate+"','"+aduser+"','"+adpoint+"')");
*/
}catch (Exception e){
	out.println(e);	
}

response.sendRedirect("dormitory_manage.jsp");

%>

</body>
</html>
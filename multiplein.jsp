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
request.setCharacterEncoding("UTF-8");
String aduser=(String)session.getAttribute("user");//用户始终带有的信息
String addepartment=(String)session.getAttribute("identity");
String adclass=request.getParameter("class");
String addate=request.getParameter("date");
String adpoint=request.getParameter("point");
String adreason=request.getParameter("reason");
String junior=(String)session.getAttribute("junior");
//double point = Float.parseFloat(adpoint);

//int adpoint=Integer.valueOf(point).intValue();
//int addclass=Integer.valueOf(adclass).intValue();
//out.print(adpoint);

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
	
	
	String addpoint[]=adpoint.split(" ");
	String addclass[]=adclass.split(" ");
	int classl = addclass.length;//位数
	int pointl = addpoint.length;

			
    for(int j=0;j<classl;j++){
		String aclass=addclass[j];
		int classa=Integer.valueOf(aclass).intValue();
		
		
    	
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
		sql.executeUpdate("INSERT INTO "+table[n]+" VALUES("+maxid+","+classa+",'"+addepartment+"',1,'"+addate+"','"+aduser+"',"+adpoint+",'"+adreason+"','"+junior+"')");		
	
    }	
		
		
		
		
//	rs=sql.executeQuery("select max(id) from total ");
//	rs.next();
//	int sid=rs.getInt(1);
//	sid=sid+1;	
//	String sh="total";
//	sql.executeUpdate("INSERT INTO "+sh+" VALUES("+sid+","+addclass+",'"+addepartment+"',1,'"+addate+"','"+aduser+"',"+adpoint+",'"+adreason+"','"+junior+"')");	
//备份	sql.executeUpdate("INSERT INTO total VALUES("+sid+","+addclass+",'"+addepartment+"',1,'"+addate+"','"+aduser+"',"+adpoint+",'"+adreason+"','"+junior+"')");	







}catch (Exception e){
	out.println(e);	
}
//out.print(junior);

response.sendRedirect("show_to_you2.jsp");

%>

</body>
</html>
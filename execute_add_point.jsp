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
String point=request.getParameter("point");
String adreason=request.getParameter("reason");
String junior=(String)session.getAttribute("junior");
// double adpoint = Double.valueOf(point);

//int adpoint=Integer.valueOf(point).intValue();
// int addclass=Integer.valueOf(adclass).intValue();
//out.print(adpoint);

String adpoint[] = point.split(" ");      // 将point以空格为界限分割起来
String addclass[] = adclass.split(" ");  //同上
int classl = addclass.length;   //班级个数
int pointl = adpoint.length;   //扣分个数

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
// 以上为数据库
//	String sh="total";
	int maxid=0, n;
	for(int i=0; ; i++){
		rs=sql.executeQuery("select max(id) from "+table[i]+" ");
		rs.next();	
		maxid=rs.getInt(1);
		n=i;
//		out.println(maxid);
		
		if(maxid != 999){
			break;
		}

	}
	if (classl == 1)   // 普通
	{
		if (pointl == 1)
		{
			double point_v = Double.valueOf(point);
			int class_v=Integer.valueOf(adclass).intValue();
			maxid++;
			sql.executeUpdate("INSERT INTO "+table[n]+" VALUES("+maxid+","+class_v+",'"+addepartment+"',1,'"+addate+"','"+aduser+"',"+point_v+",'"+adreason+"','"+junior+"')");		
			response.sendRedirect("show_to_you2.jsp");
		}
		else{
			out.print("<h1><a href=show_to_you2.jsp>wrong input click to return</a></h1>");   // 返回扣分页面
		}
			
	}
	else   // 多条
	{

		if (pointl == 1)   // 多班对一分
		{
			int class_v[] = new int[classl];   //addclass实际值
			for (int i = 0; i < classl; i++)
				class_v[i] = Integer.valueOf(addclass[i]).intValue();
			
			double point_v = Double.valueOf(point);
			for (int i = 0; i < classl; i++)
			{
				maxid++;
				sql.executeUpdate("INSERT INTO "+table[n]+" VALUES("+maxid+","+class_v[i]+",'"+addepartment+"',1,'"+addate+"','"+aduser+"',"+point_v+",'"+adreason+"','"+junior+"')");
			}
			response.sendRedirect("show_to_you2.jsp");
		}
		else   // 多班对多分
		{
			if (classl == pointl)
			{
				int class_v[] = new int[classl];   //addclass实际值
				double point_v[] = new double[pointl];   //adpoint实际值
				for (int i = 0; i < classl; i++)
				{
					class_v[i] = Integer.valueOf(addclass[i]).intValue();	
					point_v[i] = Double.valueOf(adpoint[i]);
				}
				for (int i = 0; i < classl; i++)
				{
					maxid++;
					sql.executeUpdate("INSERT INTO "+table[n]+" VALUES("+maxid+","+class_v[i]+",'"+addepartment+"',1,'"+addate+"','"+aduser+"',"+point_v[i]+",'"+adreason+"','"+junior+"')");		
				}
				response.sendRedirect("show_to_you2.jsp");
			}
			else
				out.print("<h1><a href=show_to_you2.jsp>wrong input click to return</a></h1>");   // 返回扣分页面
		}
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

//response.sendRedirect("show_to_you2.jsp");

%>

</body>
</html>
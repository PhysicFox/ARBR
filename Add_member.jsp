<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>添加人员信息</title>
</head>
<body>

<form action="execute_Add_member.jsp" method="post">
<table border=1>
   <tr>
       <th>姓名</th>
       <th>密码</th>
       <th>职位</th>
   </tr>
   <tr>      
       <td><input type="text" name="auser"></td>
       <td><input type="text" name="apassword"></td>
       <td><input type="text" name="aidentity"></td>
       <td><input type="text" name="junior"></td>
       <td><input type="submit" value="execute"></td>
      
   </tr>
</table>
 </form>
</body>
</html>

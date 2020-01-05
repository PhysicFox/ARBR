<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.text.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加扣分记录</title>
</head>
<body>
 
 <form action="addreason.jsp" method="post"><!--添加扣分原因  -->
<h5>原因</h5><input type="text" name="reason"><br>
<input type="submit" value="  输入扣分原因     ">
</form>
<br>
 
</body>
</html>
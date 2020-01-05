<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String str = "0 1 23 3 4 5";
String[] arr = str.split(" "); 
for(int i=0;i<6;i++){
	out.println(arr[i]);
	%>
	<br>
	<%
}



%>
</body>
</html>
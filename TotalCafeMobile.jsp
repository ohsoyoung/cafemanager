<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TotalCafeMobile</title>
<script>

function GetID(getId)
{
	location.href="CafeDetailInfoMobile.jsp?id=" + getId;
}
</script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="MainStyleMobile.css">

<link rel=”shortcut icon” href=”./icon.png” />
</head>
<body>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "jdpcJava.CafeDb" %>
<%@page import = "jdpcJava.CafeStorage" %>
<%@page import = "java.util.Random" %>

<%
CafeDb Allcafe = new CafeDb();
request.setCharacterEncoding("UTF-8"); 
String keyWord = request.getParameter("keyWord");
System.out.println(keyWord);
ArrayList<CafeStorage> list2 = Allcafe.getAllCafeInfo();

Random random = new Random();
int ranNum = random.nextInt(5);
String image = ranNum + ".jpg";
%>

<div class="Total" align="center">
<h1><a href="CafeMobile.jsp">Cafe Manager</a></h1>
<br/><br/>

<div align="center">
<img src=<%=image %>  width="350" height="300" alt="오늘의 카페">
</div>
<br/><br/>
<table class="type04" width="350" height="50">
<tr>
<th> 카페 전체</th>
<th>&nbsp;</th>
</tr>
<%
for(CafeStorage s : list2){
	//System.out.println(s);
%>
<tr>
<td><%=s.getName() %></td>
<td>
<button class="btn_3" onclick="GetID('<%=s.getId()%>');">Click!</button></td>
</tr>
<% 
}
%>
</table>
</div>
<br/><br/>
<div class="footer">
    <p class="text-center">
	<br/><br/><br/><br/><br/>
    	<small>Copyrightⓒ 응답하라0989 All rights reserved.</small>
    </p>
</div>

</body>
</html>
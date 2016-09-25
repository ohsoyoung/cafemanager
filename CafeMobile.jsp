<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" /> 
<link rel="shortcut icon" href="/cafe/coffee-cup-icon-md.ico?v=1.1" />


<title>Cafe Manager Mobile</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="MainStyleMobile.css">

<style>
body
{
  background-image: url('mobilemain.jpg');
}
</style>
</head>

<body>

<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "jdpcJava.CafeDb" %>
<%@page import = "jdpcJava.CafeStorage" %>

<%
CafeDb cafe = new CafeDb();

request.setCharacterEncoding("UTF-8"); //EUC_KR일수도, 그리고 charset으로도 바꿔보기
String keyWord = request.getParameter("keyWord");
System.out.println(keyWord);
ArrayList<CafeStorage> list = cafe.getCafeInfo("name", keyWord);
%>
<br/>
<br/>
<div class="MainTitle">
<h1><a href="CafeMobile.jsp">Cafe Manager</a></h1>
<br/>
<a href="TotalCafeMobile.jsp"><button class="btn_2">카페전체 둘러보기</button></a>
<br/><br/>
<a href="SearchMobile.jsp"><button class="btn_2">Search</button></a>

<div class="footer">
    <p class="text-center">
	<br/><br/><br/><br/><br/>
    	<small>Copyrightⓒ 응답하라0989 All rights reserved.</small>
    </p>
</div>
</div>

</body>
</html>
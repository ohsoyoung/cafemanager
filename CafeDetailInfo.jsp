<%@ page language="java" contentType="text/html; characterset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; characterset=UTF-8">
<title>CafeDetailInfo</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="MainStyle.css">
</head>

<body>
<%@ page import="java.sql.*" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "jdpcJava.CafeDb" %>
<%@page import = "jdpcJava.CafeStorage" %>
<%@page import = "jdpcJava.CafeTableDb" %>
<%@page import = "jdpcJava.CafeTableStorage" %>
<%
CafeDb cafe = new CafeDb();
CafeStorage c = cafe.getCafeDetailInfo("ID", request.getParameter("id"));

CafeTableDb ct = new CafeTableDb();
%>
<div class="container">
<h1><a href="Cafe.jsp">Cafe Manager</a></h1>
<br/>

<div class="form-style-1">
<ul>
<h1>
	<%=c.getName()%>
</h1>
</ul>
</div>
<br/>
<img src="another.JPG" width="300" height="230" alt="카페사진">
<br/><br/><br/>
<table class="type05" align="center">
    <tr>
        <th scope="row">카페 주소</th>
        <td><%=c.getAddress()%></td>
    </tr>
    <tr>
        <th scope="row">카페 전화번호</th>
        <td><%=c.getTell()%></td>
    </tr>
    <tr>
        <th scope="row">카페 정보</th>
        <td><%=c.getIntro()%></td>
    </tr>
    <tr>
        <th scope="row">좌석 현황</th>
        <td><b><%=c.getTableNum()%></b>개의 테이블 중 <b><%=ct.getTableSitu(c)%></b>개의 테이블을 사용중입니다.
</td>
    </tr>
</table><div class="footer">
    <p class="text-center">
	<br/><br/><br/><br/><br/>
    	<small>Copyrightⓒ 응답하라0989 All rights reserved.</small>
    </p>
</div>
</div>
</body>
</html>
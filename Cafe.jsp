<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cafe Manager3</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
/*
var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
    for (var word in mobileKeyWords){
        if (navigator.userAgent.match(mobileKeyWords[word]) != null){
            location.href = "CafeMobile.jsp";
            break;
            }
    }
모바일로 일반url 접속시 모바일url로 이동하도록 해줌 -> 테스트 끝난 후 적용시키기
*/
</script>
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="MainStyle.css">

<style>
body
{
  background-image: url('main.jpg');
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

<div class="MainTitle">
<h1><a href="Cafe.jsp">Cafe Manager</a></h1>
<br/><br/>
<a href="TotalCafe.jsp"><button class="btn_2">카페전체 둘러보기</button></a>
<br/><br/>
<a href="CafeInfoRegister.jsp"><button class="btn_2">카페 정보입력</button></a>
<br/><br/>
<a href="Search.jsp"><button class="btn_2">Search</button></a>

<div class="footer">
    <p class="text-center">
	<br/><br/><br/><br/><br/>
    	<small>Copyrightⓒ 응답하라0989 All rights reserved.</small>
    </p>
</div>
</div>

</body>
</html>
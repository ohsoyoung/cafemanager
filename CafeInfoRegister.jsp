<%@ page language="java" contentType="text/html; characterset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; characterset=UTF-8">
<title>CafeInfo</title>
<script>
function CheckCafeInfo()
{
var s_name = document.getElementById("CafeName").value;
var s_id = document.getElementById("CafeId").value;
var s_pw = document.getElementById("CafePw").value;
var s_address = document.getElementById("CafeAddress").value;
var s_tell = document.getElementById("CafeTell").value;
var s_tablenum = document.getElementById("CafeTableNum").value;
var s_intro = document.getElementById("CafeIntro").value;

if(s_name.length == 0 || s_id.length == 0 || s_pw.length == 0 || s_address.length == 0 | s_tell.length == 0 || s_tablenum.length == 0 || s_intro.length == 0)
{
alert("정보를  모두 입력하세요.");
}
}
</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="MainStyle.css">
<link rel="stylesheet" type="text/css" href="InfoStyle.css">
</head>

<body>

<%@ page contentType= "text/html; characterset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.http.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "jdpcJava.CafeDb" %>
<%@ page import = "jdpcJava.CafeStorage" %>
<%@page import = "jdpcJava.CafeTableDb" %>
<%@page import = "jdpcJava.CafeTableStorage" %>

<%

request.setCharacterEncoding("UTF-8"); //EUC_KR일수도, 그리고 charset으로도 바꿔보기
try{
String name = request.getParameter("CafeName");
String id = request.getParameter("CafeId");
String pw = request.getParameter("CafePw");
String address = request.getParameter("CafeAddress");
String tell = request.getParameter("CafeTell");
String tn = (String)request.getParameter("CafeTableNum");
int tableNum = Integer.parseInt(tn == null ? "0" : tn);
String intro = request.getParameter("CafeIntro");
String submit = request.getParameter("submit");

if(name != null && id != null && pw != null && address != null && tell != null && tn != null && intro != null)
{
	CafeStorage cs = new CafeStorage(id, name, pw, tell, intro, address, tableNum);
	CafeDb cafe = new CafeDb();
	int result = cafe.cafeInfoInsert(cs);
	CafeTableStorage cts = null;
	CafeTableDb cafeTable = null;
	if(result == 0){
		System.out.println("카페 등록정보 저장 실패");
	}
	else{
		System.out.println(id);
		System.out.println(name);
		System.out.println(pw);
		System.out.println(tell);
		System.out.println(intro); 
		System.out.println(address);
		System.out.println(tableNum);
	
	
		cts = new CafeTableStorage(id, 0);
		cafeTable = new CafeTableDb();
		int result2 = cafeTable.cafeTableInfoInsert(cts, tableNum);
		
		if(result2 == 0){
			System.out.println("카페 테이블정보 저장 실패");
		}

	}
}
} catch (Exception e){
System.out.println(e +"CafeInfo null error");
}

%>

<h1><a href="Cafe.jsp">Cafe Manager</a></h1><br/>
<div class="form-style-8" align="center">
<h2>Login to your account</h2>
<form name="CafeInfoRegister" method="post" action="CafeInfoRegister.jsp">
<table>
<tr>
<td>Cafe Name</td>
<td><input type="text" name="CafeName" id="CafeName" value=""></td>
</tr>
<tr>
<td>Cafe Id<br><small >※only english</small></td>
<td><input type="text" name="CafeId"  id="CafeId" value="" style="ime-mode: disabled"></td>
</tr>
<tr>
<td>Cafe Password</td>
<td><input type="password" name="CafePw" id="CafePw" value=""></td>
</tr>
<tr>
<td>Cafe Address</td>
<td><input type="text" name="CafeAddress" id="CafeAddress" value=""></td>
</tr>
<tr>
<td>Cafe Tel</td>
<td><input type="tel" name="CafeTell" id="CafeTell"value=""></td>
</tr>
<tr>
<td>Cafe Table Number</td>
<td><input type="text" name="CafeTableNum" id="CafeTableNum"value=""></td>
</tr>
<tr>
<td>Cafe Introduction</td>
<td><textarea name="CafeIntro" id="CafeIntro"  rows="5" cols="50"></textarea></td>
</tr>
<tr><input type="submit" value="Submit" onclick="CheckCafeInfo()"></tr>
</form>
<tr>
<td>Cafe Image</td>
<td><input type="file" name="CafeImage" id="CafeImage" value="찾아보기.."></td>
<td>
<form action="uploadOk.jsp" name="CafeImage" id="CafeImage" method="post" enctype="multipart/form-data" >
<input type="submit" value="upload">
</form></td>
</tr>
</table>
</div>

<div class="footer">
    <p class="text-center">
	<br/><br/><br/><br/><br/>
    	<small>Copyrightⓒ 응답하라0989 All rights reserved.</small>
    </p>
</div>
<br/><br/><br/><br/><br/><br/>
</body>
</html>